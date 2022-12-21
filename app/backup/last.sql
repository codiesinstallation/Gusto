


ALTER TABLE `codies`.`users`
ADD
    COLUMN `delete_bill` TINYINT(1) NULL DEFAULT 0 AFTER `pin_code`;

ALTER TABLE `codies`.`users`
ADD
    COLUMN `delete_reserved_type` TINYINT(1) NULL DEFAULT 0 AFTER `pin_code`;

ALTER TABLE `codies`.`users`
ADD
    COLUMN `resend` TINYINT(1) NULL DEFAULT 0 AFTER `pin_code`;

ALTER TABLE `codies`.`users`
ADD
    COLUMN `change_type_in_kitchen` TINYINT(1) NULL DEFAULT 0 AFTER `pin_code`;
