-- Patch 1.7 World DB Itemization Changes. 
-- To be applied on QA first for testing.

-- Zanza's Potent Potables
REPLACE INTO `spell_mod` (`Id`, `AttributesEx3`, `Comment`) VALUES 
(24382, 1048576, 'Spirit of Zanza - persist through death (before 1.12)'),
(24417, 1048576, 'Sheen of Zanza - persist through death (before 1.12)'),
(24383, 1048576, 'Swiftness of Zanza - persist through death (before 1.12)');
DELETE FROM `spell_disabled` WHERE `entry` = 24417;

-- Spawn of Azuregos, Kazzak 1.3
UPDATE `creature` SET `spawnFlags` = 0 WHERE id IN (6109, 12397);

-- Disable unavailable game events
UPDATE `game_event` SET `disabled` = 1 WHERE `entry` IN
(
66,			-- Dragons of Nightmare 1.8
154,		-- Silithus @ 1.9 (unchecked)
155,		-- Argent dawn @ 1.11 (unchecked)
158,		-- 1.10 Patch : Recipes (unchecked)
160,		-- 1.10 Patch : t0.5 Quest Chain (unchecked)
165,		-- Patch 1.8
166,		-- Patch 1.9
167,		-- Patch 1.10
168 		-- Patch 1.11 ? 1.12
);

-- enable available game events
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
161,				-- Patch 1.3
162,				-- Patch 1.4 | 1.5
163,				-- Patch 1.6
164					-- Patch 1.7
);

-- Enable Alterac Valley 1.5
UPDATE `battleground_template` SET `MinLvl` = 51, `MaxLvl` = 60 WHERE `id` = 1;

-- "Thunderfury" Stats Have Been Corrected (main hand untill 1.12)
UPDATE item_template SET InventoryType = 21 WHERE entry = 19019;

-- Disable unavailable instances
UPDATE `areatrigger_teleport` SET `required_level` = 61 WHERE `target_map` IN 
(
533,    -- Naxxramas 1.12
531,    -- AQ40 (Temple of AQ) 1.9
509	    -- AQ20 (Ruins of AQ) 1.9
);

-- Enable available instances
UPDATE `areatrigger_teleport` SET `required_level` = 45 WHERE `target_map` = 429;    -- Dire Maul 1.3
UPDATE `areatrigger_teleport` SET `required_level` = 60 WHERE `target_map` = 469;    -- Blackwing Lair 1.6
UPDATE `areatrigger_teleport` SET `required_level` = 60 WHERE `target_map` = 309;    -- Zul'Gurub 1.7

-- Transition Patch For Pre-1.4 Mounts
	-- Undead
insert into npc_vendor value (4731,11559,0,0);
	-- Tauren
insert into npc_vendor value (3685,11547,0,0);
insert into npc_vendor value (3685,11548,0,0);
	-- Orc
insert into npc_vendor value (3362,11549,0,0);
insert into npc_vendor value (3362,11550,0,0);
	-- Troll
insert into npc_vendor value (7952,11545,0,0);
insert into npc_vendor value (7952,11546,0,0);
	-- Human
insert into npc_vendor value (384,11551,0,0);
insert into npc_vendor value (4885,11551,0,0);
insert into npc_vendor value (2357,11551,0,0);
insert into npc_vendor value (1460,11551,0,0);
insert into npc_vendor value (384,11552,0,0);
insert into npc_vendor value (4885,11552,0,0);
insert into npc_vendor value (2357,11552,0,0);
insert into npc_vendor value (1460,11552,0,0);
	-- Dwarf
insert into npc_vendor value (1261,11553,0,0);
insert into npc_vendor value (1261,11554,0,0);
	-- Elf
insert into npc_vendor value (4730,11555,0,0);
insert into npc_vendor value (4730,11556,0,0);
	-- Gnome
insert into npc_vendor value (7955,11557,0,0);
insert into npc_vendor value (7955,11558,0,0);
--  -----------------------------------------------------------
--  Insert mounts quests (transforms pre 1.4 mount to post 1.4)
--  -----------------------------------------------------------
insert into creature_questrelation value    (3685,7663);
insert into creature_involvedrelation value (3685,7663);
insert into creature_questrelation value    (3685,7662);
insert into creature_involvedrelation value (3685,7662);
insert into creature_questrelation value    (3362,7660);
insert into creature_involvedrelation value (3362,7660);
insert into creature_questrelation value    (3362,7661);
insert into creature_involvedrelation value (3362,7661);
insert into creature_questrelation value    (7952,7664);
insert into creature_involvedrelation value (7952,7664);
insert into creature_questrelation value    (7952,7665);
insert into creature_involvedrelation value (7952,7665);
insert into creature_questrelation value    ( 384,7677);
insert into creature_involvedrelation value ( 384,7677);
insert into creature_questrelation value    ( 384,7678);
insert into creature_involvedrelation value ( 384,7678);
insert into creature_questrelation value    (4885,7677);
insert into creature_involvedrelation value (4885,7677);
insert into creature_questrelation value    (4885,7678);
insert into creature_involvedrelation value (4885,7678);
insert into creature_questrelation value    (2357,7677);
insert into creature_involvedrelation value (2357,7677);
insert into creature_questrelation value    (2357,7678);
insert into creature_involvedrelation value (2357,7678);
insert into creature_questrelation value    (1460,7677);
insert into creature_involvedrelation value (1460,7677);
insert into creature_questrelation value    (1460,7678);
insert into creature_involvedrelation value (1460,7678);
insert into creature_questrelation value    (1261,7673);
insert into creature_involvedrelation value (1261,7673);
insert into creature_questrelation value    (1261,7674);
insert into creature_involvedrelation value (1261,7674);
insert into creature_questrelation value    (4730,7671);
insert into creature_involvedrelation value (4730,7671);
insert into creature_questrelation value    (4730,7672);
insert into creature_involvedrelation value (4730,7672);
insert into creature_questrelation value    (7955,7675);
insert into creature_involvedrelation value (7955,7675);
insert into creature_questrelation value    (7955,7676);
insert into creature_involvedrelation value (7955,7676);

-- Golemagg Loot Drop Rates & Faction Drop
update reference_loot_template set ChanceOrQuestChance = 20 where entry = 326158 and item in (18842, 17103, 17072);
update reference_loot_template set condition_id = 3 where entry = 326158 and item = 18824;
update reference_loot_template set condition_id = 2 where entry = 326158 and item = 18829;

-- Remove Class Quests for the Warrior, Shaman, Paladin, and Warlock
DELETE FROM quest_template WHERE entry IN (
-- Warrior:
8417, -- http://wowwiki.wikia.com/Quest:A_Troubled_Spirit 
8423, -- http://wowwiki.wikia.com/Quest:Warrior_Kinship 
8424, -- http://wowwiki.wikia.com/Quest:War_on_the_Shadowsworn 
8425, -- http://wowwiki.wikia.com/Quest:Voodoo_Feathers 
-- Warlock:
8419, -- http://wowwiki.wikia.com/Quest:An_Imp%27s_Request 
8421, -- http://wowwiki.wikia.com/Quest:The_Wrong_Stuff 
8422, -- http://wowwiki.wikia.com/Quest:Trolls_of_a_Feather 
-- Shaman:
8410, -- http://wowwiki.wikia.com/Quest:Elemental_Mastery 
8412, -- http://wowwiki.wikia.com/Quest:Spirit_Totem 
8413, -- http://wowwiki.wikia.com/Quest:Da_Voodoo 
-- Paladin:
8415, -- http://wowwiki.wikia.com/Quest:Chillwind_Camp 
8414, -- http://wowwiki.wikia.com/Quest:Dispelling_Evil 
8416, -- http://wowwiki.wikia.com/Quest:Inert_Scourgestones 
8418  -- http://wowwiki.wikia.com/Quest:Forging_the_Mightstone
);
-- [Glyph Chasing]
DELETE from quest_template WHERE entry=8309;

-- Fix Alterac Valley Kazzak quest: non existant reward removed.
UPDATE quest_template SET RewChoiceItemId4 = 0 WHERE entry IN (7202, 7181);

-- Twilight Cultist Ring of Lordship
DELETE FROM item_template WHERE entry=20451;

-- Delete 1.8 Specific Recipes
DELETE FROM item_template WHERE entry IN (20382, 20509, 20511, 20508, 20507, 20510, 20506);

-- Sunken Temple Level 50 Quests 
DELETE FROM quest_template WHERE entry IN (8418, 8413, 8422, 8425);

-- Disable not in the game recipe + resulting food spell.
INSERT INTO spell_disabled SET entry=24800;
INSERT INTO spell_disabled SET entry=24801;
-- Disable loot:
update creature_loot_template set ChanceOrQuestChance=0 where item=20424;
