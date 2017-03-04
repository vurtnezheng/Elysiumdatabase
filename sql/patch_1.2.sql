-- Patch 1.2 World DB Itemization Changes. 
-- To be applied on QA first for testing.

-- NPCs to Hide: Later Patch Quest Givers: 

DELETE FROM `creature` WHERE `id` IN (15189, 15190, 15181, 15183, 15270, 15194, 15070, 14921);

-- You Shall Not Pass

update areatrigger_teleport set required_level=61 where target_map in (533, 531, 509, 429, 309, 469);

-- Run query to remove unsing triggers from DB

DELETE FROM areatrigger_involvedrelation WHERE quest NOT IN (SELECT entry FROM quest_template);
DELETE FROM creature_involvedrelation WHERE quest NOT IN (SELECT entry FROM quest_template);
DELETE FROM creature_questrelation WHERE quest NOT IN (SELECT entry FROM quest_template);
DELETE FROM gameobject_involvedrelation WHERE quest NOT IN (SELECT entry FROM quest_template);
DELETE FROM gameobject_questrelation WHERE quest NOT IN (SELECT entry FROM quest_template);

-- Zanza's Potent Potables
REPLACE INTO `spell_mod` (`Id`, `AttributesEx3`, `Comment`) VALUES 
(24382, 1048576, 'Spirit of Zanza - persist through death (before 1.12)'),
(24417, 1048576, 'Sheen of Zanza - persist through death (before 1.12)'),
(24383, 1048576, 'Swiftness of Zanza - persist through death (before 1.12)');

-- no spawn of Azuregos, Kazzak 1.3
UPDATE `creature` SET `spawnFlags` = 2 WHERE id IN (6109, 12397);

-- disable unavailable game events
UPDATE `game_event` SET `disabled` = 1 WHERE `entry` IN
(
4, 5, 100, 101, 	-- DarkMoon Faire 1.6
13,					-- Elemental Invasion 1.5
16, 38, 39,			-- Gurubashi Arena 1.5
14, 15, 40,			-- Stranglethorn Fishing Extravaganza 1.7
156, 159,			-- Dire Maul extra content(unchecked) 1.3
35, 36, 37,
42, 43, 44,			-- The Maul 1.3
66,					-- Dragons of Nightmare 1.8
18,					-- Call to arms: Alterac Valley 1.5
154,		-- Silithus @ 1.9 (unchecked)
155,		-- Argent dawn @ 1.11 (unchecked)
158,		-- 1.10 Patch : Recipes (unchecked)
160,		-- 1.10 Patch : t0.5 Quest Chain (unchecked)
161,		-- Patch 1.3
162,		-- Patch 1.4 | 1.5
163,		-- Patch 1.6
164,		-- Patch 1.7
165,		-- Patch 1.8
166,		-- Patch 1.9
167,		-- Patch 1.10
168 		-- Patch 1.11 ? 1.12
);

-- disable Alterac Valley 1.5
UPDATE `battleground_template` SET `MinLvl` = 61, `MaxLvl` = 61 WHERE `id` = 1;

-- disable unavailable instances
UPDATE `areatrigger_teleport` SET `required_level` = 61 WHERE `target_map` IN 
(
533,    -- Naxxramas 1.12
531,    -- AQ40 (Temple of AQ) 1.9
509,    -- AQ20 (Ruins of AQ) 1.9
429,    -- Dire Maul 1.3
309,    -- Zul'Gurub 1.7
469     -- Blackwing Lair 1.6
);
