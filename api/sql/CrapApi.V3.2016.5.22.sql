ALTER TABLE `webpage`
ADD COLUMN `password` VARCHAR(45) NOT NULL DEFAULT '' AFTER `sequence`;