-- Patch 1.9 World DB Itemization Changes. 
-- To be applied on QA first for testing.

-- Zanza's Potent Potables
REPLACE INTO `spell_mod` (`Id`, `AttributesEx3`, `Comment`) VALUES 
(24382, 1048576, 'Spirit of Zanza - persist through death (before 1.12)'),
(24417, 1048576, 'Sheen of Zanza - persist through death (before 1.12)'),
(24383, 1048576, 'Swiftness of Zanza - persist through death (before 1.12)');
DELETE FROM `spell_disabled` WHERE `entry` = 24417;

-- Enabling Disabled Spells
DELETE FROM spell_disabled WHERE entry IN (25117, 25118, 25119, 25120, 25123, 25122, 25121, 25660, 25704, 25722, 25804, 25691, 26276);

-- Temporarily!!! Disabling AQ Opening Quest Chain
UPDATE quest_template SET MinLevel = 61 WHERE entry IN (8286, 8288, 8301, 8302, 8303, 8305, 8519);

-- Spawn of Azuregos, Kazzak 1.3
UPDATE `creature` SET `spawnFlags` = 0 WHERE id IN (6109, 12397);

-- Disable unavailable game events
UPDATE `game_event` SET `disabled` = 1 WHERE `entry` IN
(
155,		-- Argent dawn @ 1.11 (unchecked)
158,		-- 1.10 Patch : Recipes (unchecked)
160,		-- 1.10 Patch : t0.5 Quest Chain (unchecked)
167,		-- Patch 1.10
168 		-- Patch 1.11 ? 1.12
);

-- Enable available game events
UPDATE `game_event` SET `disabled` = 0 WHERE `entry` IN
(
14, 15, 40,			-- Stranglethorn Fishing Extravaganza 1.7
4, 5, 100, 101, 	-- DarkMoon Faire 1.6
13,					-- Elemental Invasion 1.5
16, 38, 39,			-- Gurubashi Arena 1.5
18,					-- Call to arms: Alterac Valley 1.5
156, 159,			-- Dire Maul extra content(unchecked) 1.3
35, 36, 37,
42, 43, 44,			-- The Maul 1.3
66,					-- Dragons of Nightmare 1.8
161,				-- Patch 1.3
162,				-- Patch 1.4 | 1.5
163,				-- Patch 1.6
164,				-- Patch 1.7
165,				-- Patch 1.8
154,				-- Silithus @ 1.9 (unchecked)
166					-- Patch 1.9
);

-- Updating Stats For Item "Ban'thok Sash"
UPDATE `item_template` SET `stat_type1` = 7, `stat_value1` = 10, `stat_type2` = 5, `stat_value2` = 12, `stat_type3` = 0, `stat_value3` = 0, `stat_type4` = 0, `stat_value4` = 0, `stat_type5` = 0, `stat_value5` = 0, `stat_type6` = 0, `stat_value6` = 0, `stat_type7` = 0, `stat_value7` = 0, `stat_type8` = 0, `stat_value8` = 0, `stat_type9` = 0, `stat_value9` = 0, `stat_type10` = 0, `stat_value10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 39, `holy_res` = 0, `fire_res` = 0, `nature_res` = 0, `frost_res` = 0, `shadow_res` = 0, `arcane_res` = 0, `spellid_1` = 0, `spelltrigger_1` = 0, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 0, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 11662;

-- Removing "Plans: Titanic Leggings" Item
DELETE FROM item_template WHERE entry = 22388;

-- Enable Alterac Valley 1.5
UPDATE `battleground_template` SET `MinLvl` = 51, `MaxLvl` = 60 WHERE `id` = 1;

-- Disable unavailable instances
-- ATTENTION! Requires update once events are implemented!
UPDATE `areatrigger_teleport` SET `required_level` = 61 WHERE `target_map` IN 
(
533,    -- Naxxramas 1.12
531,    -- AQ40 (Temple of AQ) 1.9
509	    -- AQ20 (Ruins of AQ) 1.9
);

-- Enable available instances
-- ATTENTION! Requires update once events are implemented!
UPDATE `areatrigger_teleport` SET `required_level` = 45 WHERE `target_map` = 429;    -- Dire Maul 1.3
UPDATE `areatrigger_teleport` SET `required_level` = 60 WHERE `target_map` = 469;    -- Blackwing Lair 1.6
UPDATE `areatrigger_teleport` SET `required_level` = 60 WHERE `target_map` = 309;    -- Zul'Gurub 1.7
