ALTER TABLE `setting`
ADD COLUMN `canDelete` TINYINT(4) NOT NULL DEFAULT 0 COMMENT '1：可删除，0：不可删除' AFTER `type`;

ALTER TABLE `error`
DROP COLUMN `moduleName`;
