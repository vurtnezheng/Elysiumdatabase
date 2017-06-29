
-- This is supposed to be an initial downgrading patch from 1.12 to 1.2 DB for use with future upgrading transition patches.
-- Apply it on the clean 1.12 DB only, with all latest migrations from /server/sql/migrations

-- * INDEX
-- - 1. Encounter				// Non-available raids, dungeons and battlegrounds  
-- - 2. Events 					// Inactive in-game events               
-- - 3. Forbidden items 		// Items which shouldn't be availabe in game  
-- - 4. Items and loot		 	// Gear and weapons stats, loot tables and drop rates       
-- - 5. Vendors 				// Item list changes for vendos             
-- - 6. Creatures				// NPCs and mobs aren't available in game in patch 1.2 
-- - 7. Forbidden quests 		// Not-available quests
-- - 8. Quests					// Quest changes for patch 1.2
-- - 9. Professions				// Enchantment recipes changes 
-- - 10. Spells			 		// Disabled spells for items and potions

-- * Encounter

--   533    -- Naxxramas 1.12
--   531    -- AQ40 (Temple of AQ) 1.9
--   509    -- AQ20 (Ruins of AQ) 1.9
--   429    -- Dire Maul 1.3
--   309    -- Zul'Gurub 1.7
--   469    -- Blackwing Lair 1.6

UPDATE `areatrigger_teleport` SET `required_level` = 61 WHERE `target_map` IN (533, 531, 509, 429, 309, 469);
UPDATE `battleground_template` SET `MinLvl` = 61, `MaxLvl` = 61 WHERE `id` = 1; -- Alterac Valley (Patch 1.5)

-- * Events (need full list)

--   4, 5, 100, 101 	-- DarkMoon Faire 1.6
--   13					-- Elemental Invasion 1.5
--   16, 38, 39			-- Gurubashi Arena 1.5
--   14, 15, 40			-- Stranglethorn Fishing Extravaganza 1.7
--   156, 159			-- Dire Maul extra content(unchecked) 1.3
--   35, 36, 37			-- ??
--   42, 43, 44			-- The Maul 1.3
--   66					-- Dragons of Nightmare 1.8
--   18					-- Call to arms: Alterac Valley 1.5
--   154				-- Silithus @ 1.9
--   155				-- Argent dawn @ 1.11
--   158				-- 1.10 Patch : Recipes
--   160				-- 1.10 Patch : T0.5 Quest Chain 
--   161				-- Patch 1.3 
--   162				-- Patch 1.4 | 1.5
--   163				-- Patch 1.6
--   164				-- Patch 1.7
--   165				-- Patch 1.8
--   166				-- Patch 1.9
--   167				-- Patch 1.10
--   168 				-- Patch 1.11 ? 1.12

UPDATE `game_event` SET `disabled` = 1 WHERE `entry` IN (4, 5, 100, 101, 13, 16, 38, 39, 14, 15, 40, 156, 159, 35, 36, 37,42, 43, 44, 66, 18, 54, 155, 158, 160, 161, 162, 163, 164, 165, 166, 167, 168);

-- * Forbidden items

CREATE TEMPORARY TABLE forbidden_items (entry mediumint);

-- * Items and loot	  

-- Loot final cleanup


DELETE FROM creature_loot_template WHERE item IN (SELECT * FROM forbidden_items);
DELETE FROM reference_loot_template WHERE item IN (SELECT * FROM forbidden_items);
DELETE FROM disenchant_loot_template WHERE item IN (SELECT * FROM forbidden_items);
DELETE FROM fishing_loot_template WHERE item IN (SELECT * FROM forbidden_items);
DELETE FROM gameobject_loot_template WHERE item IN (SELECT * FROM forbidden_items);
DELETE FROM item_loot_template WHERE item IN (SELECT * FROM forbidden_items);
DELETE FROM mail_loot_template WHERE item IN (SELECT * FROM forbidden_items);
DELETE FROM pickpocketing_loot_template WHERE item IN (SELECT * FROM forbidden_items);
DELETE FROM skinning_loot_template WHERE item IN (SELECT * FROM forbidden_items);
DELETE FROM npc_vendor WHERE item IN (SELECT * FROM forbidden_items);
    
-- * Vendors 	

		
-- * Creatures	

CREATE TEMPORARY TABLE forbidden_creatures (entry mediumint);

-- Disable [Azuregos and Kazzak, Pacth 1.3]
REPLACE INTO forbidden_creatures SELECT entry FROM creature_template WHERE entry IN (6109, 12397);
-- Quest NPCs (proper description is needed)
REPLACE INTO forbidden_creatures SELECT entry FROM creature_template WHERE entry IN (15189, 15190, 15181, 15183, 15270, 15194, 15070, 14921);

-- Creatures final cleanup
UPDATE `creature` SET `spawnFlags` = (`spawnFlags` | 2) WHERE id IN (SELECT * FROM forbidden_creatures);

			
-- * Forbidden quests 	


-- * Quests			

		
-- * Professions	

			
-- * Spells			 	



