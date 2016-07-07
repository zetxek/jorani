-- ---------------------------------------------------
-- Jorani Schema upgrade to 0.5.0
--
-- @license      http://opensource.org/licenses/AGPL-3.0 AGPL-3.0
-- @copyright  Copyright (c) 2014-2016 Benjamin BALET

-- New features:
--      * Bug fix on table dayoffs
--      * Added new column "color" in the types table. Optional, will hold the color in the calendar for the approved requests of that type

DELIMITER $$
CREATE PROCEDURE sp_add_new_col_color()
    SQL SECURITY INVOKER
BEGIN
        IF NOT EXISTS (
                SELECT NULL
                FROM information_schema.columns
                WHERE table_schema = DATABASE() AND table_name ='types' AND column_name = 'color'
        ) THEN
                ALTER TABLE `types` ADD `color` varchar(7)  DEFAULT '' COMMENT 'non-required attribute to display a different color for the accepted leaves in the calendar';
        END IF;
END$$
DELIMITER ;

CALL sp_add_new_col_color();
DROP PROCEDURE sp_add_new_col_color;

ALTER TABLE `dayoffs` MODIFY `title` varchar(128) CHARACTER SET utf8;
