package cn.crap.service;

import java.util.List;
import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.crap.inter.dao.ICacheDao;
import cn.crap.inter.dao.IDataCenterDao;
import cn.crap.inter.dao.ISettingDao;
import cn.crap.inter.service.ICacheService;
import cn.crap.model.DataCenter;
import cn.crap.model.Setting;
import cn.crap.utils.GetBeanBySetting;
import cn.crap.utils.MyString;
import cn.crap.utils.Tools;

@Service
@Repository(value = "cacheService")
public class CacheService implements ICacheService {
	@Resource(name = "memoryCacheDao")
	private ICacheDao cacheDao;
	@Resource(name="settingDao")
	private ISettingDao settingDao;
	@Resource(name="dataCenterDao")
	private IDataCenterDao dataCenterDao;
	private static String cacheModuleKeyPre = "cache:model:";
	public static String cacheSettingKeyPre = "cache:setting";
	public static String cacheSettingList = "cache:settingList";
	private static int cacheTime = 10 * 60; // 10分钟缓存

	@Override
	public Object getObj(String key){
		return cacheDao.getObj(key);
	}
	
	@Override
	public Object setObj(String key, Object value, int expireTime){
		return cacheDao.setObj(key, value, expireTime);
	}
	
	@Override
	public boolean delObj(String key){
		return cacheDao.delObj(key);
	}
	
	@Override
	public boolean delObj(String key,String field){
		return cacheDao.delObj(key,field);
	}
	
	@Override
	@Transactional
	public Setting getSetting(String key){
		Object obj = cacheDao.getObj(cacheSettingKeyPre , key);
		
		if(obj == null){
			synchronized(key){
				obj = cacheDao.getObj(cacheSettingKeyPre , key);
				if( obj == null){
					List<Setting> settings = settingDao.findByMap(Tools.getMap("key",key), null, null);
					if(settings.size() > 0){
						cacheDao.setObj(cacheSettingKeyPre, key, settings.get(0), cacheTime);
						return settings.get(0);
					}
				}else{
					return (Setting) obj;
				}
			}
		}else{
			return (Setting) obj;
		}
		return new Setting();
	}
	
	@Override
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Setting> getSetting(){
		Object obj = cacheDao.getObj(cacheSettingList);
		
		if(obj == null){
			synchronized(cacheSettingList){
				obj = cacheDao.getObj(cacheSettingList);
				if(obj == null){
					List<Setting> settings = settingDao.findByMap(null, null, null);
					cacheDao.setObj(cacheSettingList, settings, cacheTime);
					return settings;
				}else{
					return (List<Setting>) obj;
				}
			}
			
		}else{
			return (List<Setting>) obj;
		}
	}
	
	@Override
	@Transactional
	public DataCenter getModule(String moduleId){
		if(moduleId != null && moduleId.equals("0")){
			return new DataCenter("0", "顶级项目");
		}
		if(MyString.isEmpty(moduleId)){
			return new DataCenter();
		}
		
		Object obj = cacheDao.getObj(cacheModuleKeyPre + moduleId);
		if(obj == null){
			synchronized(moduleId){
				obj = cacheDao.getObj(cacheModuleKeyPre + moduleId);
				if(obj == null){
					DataCenter module = dataCenterDao.get(moduleId);
					if(module == null)
						module = new DataCenter();
					cacheDao.setObj(cacheModuleKeyPre + moduleId, module, cacheTime);
					return module;
				}else{
					return (DataCenter) obj;
				}
				
			}
		}
		return (DataCenter) obj;
	}
	
	@Override
	public String getModuleName(String moduleId){
		String name = getModule(cacheModuleKeyPre + moduleId).getName();
		if(MyString.isEmpty(name))
			name = "无";
		return name;
	}

	@Override
	public boolean setStr(String key, String value, int expireTime) {
		return cacheDao.setStr(key, value, expireTime);
	}

	@Override
	public String getStr(String key) {
		return cacheDao.getStr(key);
	}

	@Override
	public void delStr(String key) {
		cacheDao.delStr(key);
	}
}
