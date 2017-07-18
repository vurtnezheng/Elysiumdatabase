-- Confirmed changes gonna be merged with an itemization patcher. 

DROP TABLE IF EXISTS `forbidden_items`;
DROP TABLE IF EXISTS `forbidden_quests`;
DROP TABLE IF EXISTS `forbidden_creatures`;
CREATE TABLE IF NOT EXISTS `forbidden_quests` (entry mediumint PRIMARY KEY);
CREATE TABLE IF NOT EXISTS forbidden_items (entry mediumint);
CREATE TABLE IF NOT EXISTS forbidden_creatures (entry mediumint);

-- * INDEX
-- - 1. ENCOUNTER				 
-- - 2. EVENTS 					          
-- - 3. FORBIDDEN ITEMS 		  
-- - 4. ITEMS AND LOOT		 	      
-- - 5. VENDORS 				
-- - 6. CREATURES				
-- - 7. QUESTS					
-- - 8. PROFESSIONS				
-- - 9. SPELLS			 		
-- - 10. GAMEOBJECTS	
-- - 11. CLEANUP TOOLS		

-- * ENCOUNTER

-- * EVENTS 

-- * FORBIDDEN ITEMS

REPLACE INTO forbidden_items SELECT entry FROM item_template WHERE entry IN ('ITEM_IDS_YOU_WANT_TO_REMOVE');

-- * ITEMS AND LOOT

-- Idol of Ferocity, Idol of Rejuvenation, Idol of Health, Libram of Truth, Libram of Hope, Totem of Life, Totem of Rebirth
DELETE FROM creature_loot_template WHERE item IN (22397,22398,22399,20400,22401,22396,22345);
DELETE FROM reference_loot_template WHERE item IN (22397,22398,22399,20400,22401,22396,22345);
INSERT INTO 
	`creature_loot_template` 
	(`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) 
VALUES 
	(9025, 22397, 0, 1, 1, 1, 0),
	(15299, 22399, 0, 1, 1, 1, 0),
	(16080, 22398, 0, 1, 1, 1, 0),
	(16097, 22345, 0, 1, 1, 1, 0),
	(16097, 22401, 0, 1, 1, 1, 0),
	(34048, 22396, 0, 1, 1, 1, 0),
	(322418, 22400, 0, 1, 1, 1, 0);
-- Titanic Leggings
DELETE FROM reference_loot_template WHERE item = 22388;
INSERT INTO `reference_loot_template` 
	(`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) 
VALUES 
	(34009, 22388, 0, 1, 1, 1, 78),
	(315710, 22388, 0, 2, 1, 1, 78),
	(315712, 22388, 0, 4, 1, 1, 78),
	(315714, 22388, 0, 6, 1, 1, 78),
	(322541, 22388, 0, 6, 1, 1, 78),
	(322543, 22388, 0, 8, 1, 1, 78),
	(324923, 22388, 0, 2, 1, 1, 78),
	(324925, 22388, 0, 4, 1, 1, 78),
	(324927, 22388, 0, 6, 1, 1, 78),
	(325071, 22388, 0, 2, 1, 1, 78),
	(325073, 22388, 0, 4, 1, 1, 78),
	(328658, 22388, 0, 2, 1, 1, 78),
	(328660, 22388, 0, 4, 1, 1, 78),
	(328670, 22388, 0, 2, 1, 1, 78),
	(328672, 22388, 0, 4, 1, 1, 78),
	(328682, 22388, 0, 2, 1, 1, 78),
	(328684, 22388, 0, 4, 1, 1, 78),
	(328694, 22388, 0, 2, 1, 1, 78),
	(328696, 22388, 0, 4, 1, 1, 78);

-- * VENDORS

-- * CREATURES

REPLACE INTO forbidden_creatures SELECT entry FROM creature_template WHERE entry IN ('CREATURE_IDS_YOU_WANT_TO_REMOVE');

-- * QUESTS

REPLACE INTO forbidden_quests SELECT entry FROM quest_template WHERE entry IN ('QUEST_IDS_YOU_WANT_TO_REMOVE');	

-- * PROFESSIONS 

-- * CLEANUP TOOLS

DELETE FROM creature_loot_template WHERE item IN (SELECT * FROM `forbidden_items`);
DELETE FROM reference_loot_template WHERE item IN (SELECT * FROM `forbidden_items`);
DELETE FROM disenchant_loot_template WHERE item IN (SELECT * FROM `forbidden_items`);
DELETE FROM fishing_loot_template WHERE item IN (SELECT * FROM `forbidden_items`);
DELETE FROM gameobject_loot_template WHERE item IN (SELECT * FROM `forbidden_items`);
DELETE FROM item_loot_template WHERE item IN (SELECT * FROM `forbidden_items`);
DELETE FROM mail_loot_template WHERE item IN (SELECT * FROM `forbidden_items`);
DELETE FROM pickpocketing_loot_template WHERE item IN (SELECT * FROM `forbidden_items`);
DELETE FROM skinning_loot_template WHERE item IN (SELECT * FROM `forbidden_items`);
DELETE FROM npc_vendor WHERE item IN (SELECT * FROM `forbidden_items`);

REPLACE INTO `forbidden_quests` (SELECT `entry` FROM `quest_template` 
    WHERE 
        `ReqItemId1` IN (SELECT * FROM `forbidden_items`) OR
        `ReqItemId2` IN (SELECT * FROM `forbidden_items`) OR
        `ReqItemId3` IN (SELECT * FROM `forbidden_items`) OR
        `ReqItemId4` IN (SELECT * FROM `forbidden_items`) OR
        `RewChoiceItemId1` IN (SELECT * FROM `forbidden_items`) OR
        `RewChoiceItemId2` IN (SELECT * FROM `forbidden_items`) OR 
        `RewChoiceItemId3` IN (SELECT * FROM `forbidden_items`) OR
        `RewChoiceItemId4` IN (SELECT * FROM `forbidden_items`) OR
        `RewChoiceItemId5` IN (SELECT * FROM `forbidden_items`) OR
        `RewChoiceItemId6` IN (SELECT * FROM `forbidden_items`) OR
        `RewItemId1` IN (SELECT * FROM `forbidden_items`) OR
        `RewItemId2` IN (SELECT * FROM `forbidden_items`) OR
        `RewItemId3` IN (SELECT * FROM `forbidden_items`) OR
        `RewItemId4` IN (SELECT * FROM `forbidden_items`));
UPDATE `quest_template` SET `Method` = (`Method` | 1) WHERE `entry` IN (SELECT * FROM `forbidden_quests`);

DELETE FROM areatrigger_involvedrelation WHERE quest IN (SELECT * from forbidden_quests);
DELETE FROM creature_involvedrelation WHERE quest IN (SELECT * from forbidden_quests);
DELETE FROM creature_questrelation WHERE quest IN (SELECT * from forbidden_quests);
DELETE FROM gameobject_involvedrelation WHERE quest IN (SELECT * from forbidden_quests);
DELETE FROM gameobject_questrelation WHERE quest IN (SELECT * from forbidden_quests);

UPDATE `creature` SET `spawnFlags` = (`spawnFlags` | 2) WHERE id IN (SELECT * FROM forbidden_creatures);