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

-- * VENDORS
-- [Plans: Dark Iron Boots] / Thorium Brotherhood NPC#12944 (1.9)
DELETE FROM `npc_vendor` WHERE entry = 12944 AND item = 20040;
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES ('12944', '20040', '0', '0');

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