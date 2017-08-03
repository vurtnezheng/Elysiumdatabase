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


-- Idol of Ferocity, Idol of Rejuvenation, Idol of Health, Libram of Truth, Libram of Hope, Totem of Life, Totem of Rebirth, Totem of Rage
DELETE FROM creature_loot_template WHERE item IN (22397,22398,22399,22400,22401,22396,22345,22395);
DELETE FROM reference_loot_template WHERE item IN (22397,22398,22399,22400,22401,22396,22345,22395);
INSERT INTO 
	`creature_loot_template` 
	(`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) 
VALUES 
	(9025, 22397, 0, 1, 1, 1, 0),
	(15299, 22399, 0, 1, 1, 1, 0),
	(16080, 22398, 0, 1, 1, 1, 0),
	(16097, 22345, 0, 1, 1, 1, 0),
	(16097, 22401, 0, 1, 1, 1, 0),
	(322418, 22395, 0, 1, 1, 1, 0),
	(34048, 22396, 0, 1, 1, 1, 0),
	(322418, 22400, 0, 1, 1, 1, 0);
-- Titanic Leggings
DELETE FROM reference_loot_template WHERE item = 22388;
DELETE FROM creature_loot_template WHERE item = 22388;
INSERT INTO 
	`creature_loot_template` 
	(`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) 
VALUES 
	(8528, 22388, 0.02, 0, 1, 1, 0),
	(8532, 22388, 0.02, 0, 1, 1, 0),
	(8920, 22388, 0.02, 0, 1, 1, 0),
	(10317, 22388, 0.02, 0, 1, 1, 0),
	(10382, 22388, 0.02, 0, 1, 1, 0),
	(10400, 22388, 0.02, 0, 1, 1, 0),
	(10406, 22388, 0.02, 0, 1, 1, 0),
	(10420, 22388, 0.02, 0, 1, 1, 0),
	(10471, 22388, 0.02, 0, 1, 1, 0),
	(10476, 22388, 0.02, 0, 1, 1, 0),
	(10477, 22388, 0.02, 0, 1, 1, 0),
	(10489, 22388, 0.02, 0, 1, 1, 0),
	(10495, 22388, 0.02, 0, 1, 1, 0),
	(10499, 22388, 0.02, 0, 1, 1, 0),
	(10678, 22388, 0.02, 0, 1, 1, 0),
	(10717, 22388, 0.02, 0, 1, 1, 0),
	(10916, 22388, 0.02, 0, 1, 1, 0),
	(11728, 22388, 0.02, 0, 1, 1, 0),
	(15325, 22388, 0.02, 0, 1, 1, 0),
	(16453, 22388, 0.06, 0, 1, 1, 0);
INSERT INTO 
	`reference_loot_template` 
	(`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`)
VALUES 
	(34002, 22388, 0, 1, 1, 1, 0);


-- * VENDORS

-- * CREATURES

REPLACE INTO forbidden_creatures SELECT entry FROM creature_template WHERE entry IN ('CREATURE_IDS_YOU_WANT_TO_REMOVE');

-- * QUESTS

REPLACE INTO forbidden_quests SELECT entry FROM quest_template WHERE entry IN (8743);	
-- Item 21176 must be removed from players who have gotten them after event.

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
