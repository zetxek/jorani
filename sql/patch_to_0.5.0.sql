-- ---------------------------------------------------
-- Jorani Schema upgrade to 0.5.0
-- 
-- @license      http://opensource.org/licenses/AGPL-3.0 AGPL-3.0
-- @copyright  Copyright (c) 2014-2016 Benjamin BALET

-- New features:
--      * Bug fix on table dayoffs

ALTER TABLE `dayoffs` MODIFY `title` varchar(128) CHARACTER SET utf8;
ALTER TABLE `types` ADD `color` varchar(7)  DEFAULT '' COMMENT 'non-required attribute to display a different color for the accepted leaves in the calendar';
