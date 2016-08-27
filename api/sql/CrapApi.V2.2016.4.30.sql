/*接口添加版本号*/
ALTER TABLE `interface` 
ADD COLUMN `version` VARCHAR(20) NOT NULL DEFAULT '1.0' COMMENT '版本号' AFTER `createTime`;

ALTER TABLE `setting` 
ADD COLUMN `sequence` INT NOT NULL DEFAULT 0 COMMENT '排序，越大越靠前' AFTER `canDelete`;

ALTER TABLE `comment` 
ADD COLUMN `sequence` INT NOT NULL DEFAULT 0 COMMENT '排序，越大越靠前';

ALTER TABLE `error` 
ADD COLUMN `sequence` INT NOT NULL DEFAULT 0 COMMENT '排序，越大越靠前';

ALTER TABLE `interface` 
ADD COLUMN `sequence` INT NOT NULL DEFAULT 0 COMMENT '排序，越大越靠前';

ALTER TABLE `menu` 
ADD COLUMN `sequence` INT NOT NULL DEFAULT 0 COMMENT '排序，越大越靠前';

ALTER TABLE `module` 
ADD COLUMN `sequence` INT NOT NULL DEFAULT 0 COMMENT '排序，越大越靠前';

ALTER TABLE `role` 
ADD COLUMN `sequence` INT NOT NULL DEFAULT 0 COMMENT '排序，越大越靠前';

ALTER TABLE `user` 
ADD COLUMN `sequence` INT NOT NULL DEFAULT 0 COMMENT '排序，越大越靠前';

ALTER TABLE `webpage` 
ADD COLUMN `sequence` INT NOT NULL DEFAULT 0 COMMENT '排序，越大越靠前';