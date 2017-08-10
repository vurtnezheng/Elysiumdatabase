-- 1.4 → 1.5 | Battlegrounds

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

-- * NEW ENCOUNTER	

UPDATE `battleground_template` SET `MinLvl` = 51, `MaxLvl` = 60 WHERE `id` = 1; -- Alterac Valley (Patch 1.5)
UPDATE `battleground_template` SET `MinLvl` = 10, `MaxLvl` = 60 WHERE `id` = 1; -- Warsong Gulch (Patch 1.5)

-- * NEW EVENTS 	

REPLACE INTO new_events SELECT entry FROM game_event WHERE entry IN (
);

-- * NEW ITEMS 	

REPLACE INTO new_items SELECT entry FROM item_template WHERE entry IN (
17690,   -- Frostwolf Insignia Rank 1 | AV Rewards
17691,   -- Stormpike Insignia Rank 1 | AV Rewards
17900,   -- Stormpike Insignia Rank 2 | AV Rewards
17901,   -- Stormpike Insignia Rank 3 | AV Rewards
17902,   -- Stormpike Insignia Rank 4 | AV Rewards
17903,   -- Stormpike Insignia Rank 5 | AV Rewards
17904,   -- Stormpike Insignia Rank 6 | AV Rewards
17905,   -- Frostwolf Insignia Rank 2 | AV Rewards
17906,   -- Frostwolf Insignia Rank 3 | AV Rewards
17907,   -- Frostwolf Insignia Rank 4 | AV Rewards
17908,   -- Frostwolf Insignia Rank 5 | AV Rewards
17909,   -- Frostwolf Insignia Rank 6 | AV Rewards
19083,   -- Frostwolf Legionnaire's Cloak | AV Rep Rewards
19084,   -- Stormpike Soldier's Cloak | AV Rep Rewards
19085,   -- Frostwolf Advisor's Cloak | AV Rep Rewards
19086,   -- Stormpike Sage's Cloak | AV Rep Rewards
19087,   -- Frostwolf Plate Belt | AV Rep Rewards
19088,   -- Frostwolf Mail Belt | AV Rep Rewards
19089,   -- Frostwolf Leather Belt | AV Rep Rewards
19090,   -- Frostwolf Cloth Belt | AV Rep Rewards
19091,   -- Stormpike Plate Girdle | AV Rep Rewards
19092,   -- Stormpike Mail Girdle | AV Rep Rewards
19093,   -- Stormpike Leather Girdle | AV Rep Rewards
19094,   -- Stormpike Cloth Girdle | AV Rep Rewards
19095,   -- Frostwolf Legionnaire's Pendant | AV Rep Rewards
19096,   -- Frostwolf Advisor's Pendant | AV Rep Rewards
19097,   -- Stormpike Soldier's Pendant | AV Rep Rewards
19098,   -- Stormpike Sage's Pendant | AV Rep Rewards
19100,   -- Electrified Dagger | AV Rep Rewards
19102,   -- Crackling Staff | AV Rep Rewards,  
19102,   -- Crackling Staff | AV Rep Rewards,   
19308,   -- Tome of Arcane Domination | AV Rep Rewards
19309,   -- Tome of Shadow Force | AV Rep Rewards
19310,   -- Tome of the Ice Lord | AV Rep Rewards
19311,   -- Tome of Fiery Arcana | AV Rep Rewards
19312,   -- Lei of the Lifegiver | AV Rep Rewards
19315,   -- Therazane's Touch | AV Rep Rewards
19321,   -- The Immovable Object | AV Rep Rewards
19323,   -- The Unstoppable Force | AV Rep Rewards
19324,   -- The Lobotomizer | AV Rep Rewards
19325,   -- Don Julio's Band | AV Rep Rewards,  
19031,   -- Frostwolf Battle Tabard | AV Rep Rewards
19032,   -- Stormpike Battle Tabard | AV Rep Rewards
19029,   -- Horn of the Frostwolf Howler | AV Rep Rewards
18945,   -- Dark Iron Residue | Thorium Brotherhood quests added with 1.5 (see retail patch notes)
);
 
-- * NEW CREATURES

REPLACE INTO new_creatures SELECT entry FROM creature_template WHERE entry IN (
);
	
-- * NEW QUESTS	

REPLACE INTO new_quests SELECT entry FROM quest_template WHERE entry IN (
1318,   -- Unfinished Gordok Business
7562,   -- Mor'zul Bloodbringer
7638,   -- Lord Grayson Shadowbreaker
);

-- * NEW SPELLS	

DELETE FROM spell_disabled WHERE entry IN (
);
			
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
