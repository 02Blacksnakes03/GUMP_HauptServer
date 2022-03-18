USE `essentialmode`;

ALTER TABLE `users`
	ADD COLUMN `geburtsort` VARCHAR(5) NULL DEFAULT ''
;

CREATE TABLE `characters` (
	ADD COLUMN `geburtsort` VARCHAR(128) NOT NULL,

	PRIMARY KEY (`id`)
);