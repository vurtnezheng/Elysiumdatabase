-- 1.7 → 1.8 | Dragons of Nightmare

DROP TABLE IF EXISTS `new_items`;
DROP TABLE IF EXISTS `new_events`;
DROP TABLE IF EXISTS `new_quests`;
DROP TABLE IF EXISTS `new_creatures`;

CREATE TABLE IF NOT EXISTS `new_quests` (entry mediumint PRIMARY KEY);
CREATE TABLE IF NOT EXISTS `new_items` (entry mediumint PRIMARY KEY);
CREATE TABLE IF NOT EXISTS `new_events` (entry mediumint PRIMARY KEY);
CREATE TABLE IF NOT EXISTS `new_creatures` (entry mediumint PRIMARY KEY);

-- * INDEX
-- - 1.  NEW ENCOUNTER				 
-- - 2.  NEW EVENTS 					          
-- - 3.  NEW ITEMS 	
-- - 4.  NEW CREATURES			
-- - 5.  NEW QUESTS	
-- - 6.  NEW SPELLS				
-- - 7.  NEW GAMEOBJECTS
-- - 8.  RESTORATION TOOLS	  
-- - 9.  ITEM STAT CHANGES
-- - 10. ADDITIONAL FIXES    

-- * NEW EVENTS 	

REPLACE INTO new_events SELECT entry FROM game_event WHERE entry IN (
66,    -- Dragons of Nightmare Spawn
165    -- Patch 1.8
);

-- * NEW ITEMS 	

REPLACE INTO new_items SELECT entry FROM item_template WHERE entry IN (
20406,    -- Twilight Cultist Mantle | Silithus windstone revamp
20407,    -- Twilight Cultist Robe | Silithus windstone revamp
20408,    -- Twilight Cultist Cowl | Silithus windstone revamp
20476,    -- Sandstalker Bracers | Silithus quest revamp
20477,    -- Sandstalker Gauntlets | Silithus quest revamp
20478,    -- Sandstalker Breastplate | Silithus quest revamp
20479,    -- Spitfire Breastplate | Silithus quest revamp
20480,    -- Spitfire Gauntlets | Silithus quest revamp
20481,    -- Spitfire Bracers | Silithus quest revamp
20506,    -- Pattern: Spitfire Bracers | Silithus quest revamp
20507,    -- Pattern: Spitfire Gauntlets | Silithus quest revamp
20508,    -- Pattern: Spitfire Breastplate | Silithus quest revamp
20509,    -- Pattern: Sandstalker Bracers | Silithus quest revamp
20510,    -- Pattern: Sandstalker Gauntlets | Silithus quest revamp
20511,    -- Pattern: Sandstalker Breastplate | Silithus quest revamp
20521,    -- Fury Visor | LVL 50 class quest (warrior), see 1.8 retail patch notes
20682,    -- Elemental Focus Band | Silithus windstones
20685,    -- Wavefront Necklace | Silithus windstones
20688,    -- Earthen Guard | Silithus windstones
);
 
-- * NEW CREATURES

REPLACE INTO new_creatures SELECT entry FROM creature_template WHERE entry IN (
);
	
-- * NEW QUESTS	

REPLACE INTO new_quests SELECT entry FROM quest_template WHERE entry IN (
8309,   -- Glyph Chasing
);

-- * NEW SPELLS	

DELETE FROM spell_disabled WHERE entry IN (1000);
			
-- * NEW GAMEOBJECTS	

-- * RESTORATION TOOLS

REPLACE INTO creature_loot_template SELECT * FROM creature_loot_template_full WHERE item IN (SELECT entry FROM `new_items`);
REPLACE INTO reference_loot_template SELECT * FROM reference_loot_template_full WHERE item IN (SELECT entry FROM `new_items`);

REPLACE INTO creature_loot_template SELECT c.* FROM creature_loot_template_full c INNER JOIN reference_loot_template_full r ON c.item = r.entry WHERE r.item IN (SELECT entry FROM `new_items`);
REPLACE INTO disenchant_loot_template SELECT * FROM disenchant_loot_template_full WHERE item IN (SELECT entry FROM `new_items`); 
REPLACE INTO fishing_loot_template SELECT * FROM fishing_loot_template_full WHERE item IN (SELECT entry FROM `new_items`); 
REPLACE INTO gameobject_loot_template SELECT * FROM gameobject_loot_template_full WHERE item IN (SELECT entry FROM `new_items`); 
REPLACE INTO item_loot_template SELECT * FROM item_loot_template_full WHERE item IN (SELECT entry FROM `new_items`); 
REPLACE INTO mail_loot_template SELECT * FROM mail_loot_template_full WHERE item IN (SELECT entry FROM `new_items`); 
REPLACE INTO pickpocketing_loot_template SELECT * FROM pickpocketing_loot_template_full WHERE item IN (SELECT entry FROM `new_items`); 
REPLACE INTO skinning_loot_template SELECT * FROM skinning_loot_template_full WHERE item IN (SELECT entry FROM `new_items`); 
REPLACE INTO npc_vendor SELECT * FROM npc_vendor_full WHERE item IN (SELECT entry FROM `new_items`); 

UPDATE `quest_template` SET `Method` = (`Method` | 2) WHERE `entry` IN (SELECT * FROM `new_quests`);

UPDATE `creature` SET `spawnFlags` = (`spawnFlags` | 0) WHERE id IN (SELECT entry FROM new_creatures);

UPDATE `game_event` SET `disabled` = (`disabled` | 0) WHERE entry IN (SELECT entry FROM new_events);

-- * ITEM STATS | Items changed: 

-- * ADDITIONAL FIXES	
