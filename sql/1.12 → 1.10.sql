
-- Temporary downgrading patch [1.12 → 1.10] 

-- Areatriggers, battlegrounds, etc.:

UPDATE `areatrigger_teleport` SET `required_level` = 61 WHERE `target_map` = 533;    -- Naxxramas 1.12
-- UPDATE `areatrigger_teleport` SET `required_level` = 45 WHERE `target_map` = 429;    -- Dire Maul 1.3 (should be enabled by default, if not, fix it)
-- UPDATE `areatrigger_teleport` SET `required_level` = 60 WHERE `target_map` = 469;    -- Blackwing Lair 1.6 (should be enabled by default, if not, fix it)
-- UPDATE `areatrigger_teleport` SET `required_level` = 60 WHERE `target_map` = 309;    -- Zul'Gurub 1.7 (should be enabled by default, if not, fix it)
-- UPDATE `areatrigger_teleport` SET `required_level` = 60 WHERE `target_map` = 531;    -- AQ 40 1.9 (should be enabled by default, if not, fix it)
-- UPDATE `areatrigger_teleport` SET `required_level` = 60 WHERE `target_map` = 509;    -- AQ 20 1.9 (should be enabled by default, if not, fix it)
-- UPDATE `battleground_template` SET `MinLvl` = 51, `MaxLvl` = 60 WHERE `id` = 1       -- AV 1.5 (should be enabled by default, if not, fix it)

-- Disable unavailable game events:

UPDATE `game_event` SET `disabled` = 1 WHERE `entry` IN (155, 168); -- Argent Dawn @ 1.11 & Patch 1.11 * 1.12 (not quite sure what 168 does :D)

-- Should be enabled by default in 1.12, if not, fix it:

/* UPDATE `game_event` SET `disabled` = 0 WHERE `entry` IN
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
166,				-- Patch 1.9
158,				-- 1.10 Patch : Recipes (unchecked)
160,				-- 1.10 Patch : t0.5 Quest Chain (unchecked)
167					-- Patch 1.10
);*/

-- Update stats for currently existing items:

	-- "Thunderfury" Stats Have Been Corrected (main hand untill 1.12)
UPDATE item_template SET InventoryType = 21 WHERE entry = 19019;

-- Loot Changes for 1.10
CREATE TEMPORARY TABLE forbidden_items (entry mediumint);
	-- Removing ZG 1.11 Drop
DELETE FROM `creature_loot_template` WHERE `item`  IN (22637, 22722, 22721, 22720, 22718, 22711, 22712, 22715, 22714, 22716, 22713);
DELETE FROM `reference_loot_template` WHERE `item` IN (22637, 22722, 22721, 22720, 22718, 22711, 22712, 22715, 22714, 22716, 22713);
	-- Removing 1.11 Relics From Drop
DELETE FROM `creature_loot_template` WHERE `item`  IN (23198, 22397, 22398, 22399, 23197, 23201, 23203, 22401, 22400, 22395, 22396, 22345, 23200, 23199);
DELETE FROM `reference_loot_template` WHERE `item` IN (23198, 22397, 22398, 22399, 23197, 23201, 23203, 22401, 22400, 22395, 22396, 22345, 23200, 23199);
	-- Golemagg Loot Drop Rates & Faction Drop
update reference_loot_template set ChanceOrQuestChance = 20 where entry = 326158 and item in (18842, 17103, 17072);
update reference_loot_template set condition_id = 3 where entry = 326158 and item = 18824;
update reference_loot_template set condition_id = 2 where entry = 326158 and item = 18829;
	-- LBRS Gems Pre-1.11
update creature_loot_template set ChanceOrQuestChance=1 where item=12219;
update creature_loot_template set ChanceOrQuestChance=20 where item=12335;
update creature_loot_template set ChanceOrQuestChance=15 where item=12336;
update creature_loot_template set ChanceOrQuestChance=25 where item=12337;
	-- Argent Dawn item
delete from conditions where condition_entry=70;
insert into conditions value (70,12,155,0);
update creature_loot_template set condition_id=70 where item in (22527,22529,22528,22525,22526);

-- *_loot_template final cleanup

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


