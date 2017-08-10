-- [1.12 → 1.10] 

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

UPDATE `areatrigger_teleport` SET `required_level` = 61 WHERE `target_map` = 533;    -- Naxxramas 1.12
-- UPDATE `areatrigger_teleport` SET `required_level` = 45 WHERE `target_map` = 429;    -- Dire Maul 1.3 (should be enabled by default, if not, fix it)
-- UPDATE `areatrigger_teleport` SET `required_level` = 60 WHERE `target_map` = 469;    -- Blackwing Lair 1.6 (should be enabled by default, if not, fix it)
-- UPDATE `areatrigger_teleport` SET `required_level` = 60 WHERE `target_map` = 309;    -- Zul'Gurub 1.7 (should be enabled by default, if not, fix it)
-- UPDATE `areatrigger_teleport` SET `required_level` = 60 WHERE `target_map` = 531;    -- AQ 40 1.9 (should be enabled by default, if not, fix it)
-- UPDATE `areatrigger_teleport` SET `required_level` = 60 WHERE `target_map` = 509;    -- AQ 20 1.9 (should be enabled by default, if not, fix it)
-- UPDATE `battleground_template` SET `MinLvl` = 51, `MaxLvl` = 60 WHERE `id` = 1       -- AV 1.5 (should be enabled by default, if not, fix it)

-- * EVENTS 

UPDATE `game_event` SET `disabled` = 1 WHERE `entry` IN (155, 168); -- Argent Dawn @ 1.11 & Patch 1.11 * 1.12 (not quite sure what 168 does :D)
-- Should be enabled by default in 1.12, if not, fix it:
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
166,				-- Patch 1.9
158,				-- 1.10 Patch : Recipes (unchecked)
160,				-- 1.10 Patch : t0.5 Quest Chain (unchecked)
167					-- Patch 1.10
);


-- * FORBIDDEN ITEMS

-- ZG 1.11 Drop
REPLACE INTO forbidden_items SELECT entry FROM item_template WHERE entry IN  (22637, 22722, 22721, 22720, 22718, 22711, 22712, 22715, 22714, 22716, 22713);
-- 1.11 Relics From Drop
REPLACE INTO forbidden_items SELECT entry FROM item_template WHERE entry IN   (23198, 22397, 22398, 22399, 23197, 23201, 23203, 22401, 22396, 22345, 23200, 23199);

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

-- NPC Vargus <Blacksmith> new quests (1.9): Champion's Battlegear, Stalwart's Battlegear, Veteran's Battlegear, Volunteer's Battlegear
DELETE FROM creature_questrelation WHERE id = 15176;
INSERT INTO 
	`creature_questrelation` 
	(`id`, `quest`) 
VALUES 
	(15176, 8548),
	(15176, 8572),
	(15176, 8573),
	(15176, 8574);


-- http://wowwiki.wikia.com/wiki/Patch_1.11.0
-- Class specific enchantments given by Zanza the Restless no longer require Arcanum (Librams) from Dire Maul.
-- The requirements have been changed to items found within Zul'Gurub. Speak with Zanza the Restless for more information.
UPDATE quest_template    SET ReqItemId3 = 18331, ReqItemCount3 = 1,    ReqItemId4 = 19716, ReqItemCount4 = 1    WHERE entry = 8192;
UPDATE quest_template    SET ReqItemId3 = 18329, ReqItemCount3 = 1,    ReqItemId4 = 19723, ReqItemCount4 = 1    WHERE entry = 8186;
UPDATE quest_template    SET ReqItemId3 = 18329, ReqItemCount3 = 1,    ReqItemId4 = 19718, ReqItemCount4 = 1    WHERE entry = 8187;
UPDATE quest_template    SET ReqItemId3 = 18331, ReqItemCount3 = 1,    ReqItemId4 = 19724, ReqItemCount4 = 1    WHERE entry = 8184;
UPDATE quest_template    SET ReqItemId3 = 18330, ReqItemCount3 = 1,    ReqItemId4 = 19719, ReqItemCount4 = 1    WHERE entry = 8189;
UPDATE quest_template    SET ReqItemId3 = 18330, ReqItemCount3 = 1,    ReqItemId4 = 19722, ReqItemCount4 = 1    WHERE entry = 8191;
UPDATE quest_template    SET ReqItemId3 = 18331, ReqItemCount3 = 1,    ReqItemId4 = 19721, ReqItemCount4 = 1    WHERE entry = 8185;
UPDATE quest_template    SET ReqItemId3 = 18330, ReqItemCount3 = 1,    ReqItemId4 = 19720, ReqItemCount4 = 1    WHERE entry = 8188;
UPDATE quest_template    SET ReqItemId3 = 18330, ReqItemCount3 = 1,    ReqItemId4 = 19717, ReqItemCount4 = 1    WHERE entry = 8190;
UPDATE quest_template    SET ReqItemId1 = 0,     ReqItemCount1 = 0     WHERE entry IN (8184, 8185, 8186, 8187, 8188, 8189, 8190, 8191, 8192);
-- Item 21176 must be removed from players who have gotten them after event.
REPLACE INTO forbidden_quests SELECT entry FROM quest_template WHERE entry IN (8743);	
-- Superior Armaments (patch 1.11)
-- Epic Armaments (patch 1.11):
-- EPL towers (patch 1.12)
-- Savage Guard Quests (patch 1.11)
REPLACE INTO forbidden_quests SELECT entry FROM quest_template WHERE entry IN (9227,9221,9223,9226,9228,9222,9224,9225,9664,9208,9209,9210);

-- * SPELLS

-- Zanza's Potent Potables
REPLACE INTO `spell_mod` (`Id`, `AttributesEx3`, `Comment`) VALUES 
(24382, 1048576, 'Spirit of Zanza - persist through death (before 1.12)'),
(24417, 1048576, 'Sheen of Zanza - persist through death (before 1.12)'),
(24383, 1048576, 'Swiftness of Zanza - persist through death (before 1.12)');
DELETE FROM `spell_disabled` WHERE `entry` = 24417; -- This table should be empty in 1.12 Base DB, anyway

-- * PROFESSIONS 
-- WARNING >>
-- Another one freestyle hackfix sql

-- REMOVE ITEMS:
-- 23320 - Tablet of Flame Shock VI
-- 24101 - Book of Ferocious Bite V
-- 24102 - Manual of Eviscerate IX
REPLACE INTO forbidden_items SELECT entry FROM item_template WHERE entry IN (23320, 24101,24102);
-- REMOVE QUESTS:
-- Superior Armaments (patch 1.11)
-- Epic Armaments (patch 1.11)
-- EPL towers, 1.12
-- Savage Guard Quests (1.11):
REPLACE INTO forbidden_quests SELECT entry FROM quest_template WHERE entry IN (9227, 9221, 9223, 9226, 9228, 9222, 9224, 9225, 9664, 9208, 9209, 9210);
-- ADD NPCs: 
-- 16013 (Deliana, 0.5 quest starter NPC, Alliance)
-- 16012 (Mokvar, 0.5 quest starter NPC, Horde)
DELETE FROM creature where id IN (16013, 16012);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (2530189 , 16012, 1, 0, 0, 1915.67, -4170.77, 41.0061, 0.750492, 300, 0, 0, 4000, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (2530187, 16013, 0, 0, 0, -4846.98, -1057.77, 502.19, 1.29154, 25000, 0, 0, 4400, 5751, 0, 0, 0);
-- REDUCE SPAWNTIME:
-- Object 181098 (Volcanic Ash, currently 3 minutes, reduce to 30 seconds)
UPDATE gameobject SET spawntimesecs = 30 WHERE id = 181098;
DELETE FROM reference_loot_template WHERE item IN (16051, 16050, 16055);
-- NPC BODLEY has a ton of random gossip options, one of which gives you the left piece of lord valthalak's amulet. All gossip options need to be removed.
UPDATE creature_template SET gossip_menu_id = 0 WHERE entry = 16033; 
-- OPEN GATES OF AQ
UPDATE `gameobject` SET `state` = 0 WHERE id = 176146;
-- If not working: DELETE FROM gameobject WHERE id = 176146;
-- Quest #8800 is linked to Vargus, npc #15176
DELETE FROM creature_involvedrelation WHERE quest = 8800 AND id = 15176;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (15176, 8800);

-- Add Mor Grayhoof spawn triggers
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1604401, 1604402) AND `creature_id` = 16044;
INSERT INTO `creature_ai_scripts` 
    VALUES  ('1604401', '16044', '8', '0', '100', '2', '27184', '-1', '0', '0', '12', '16080', '1', '60000', '41', '0', '0', '0', '0', '0', '0', '0', 'Mor Grayhoof Trigger - Spawn Mor Grayhoof and Despawn Trigger on Summon Mor Grayhoof DND Spellhit'),
            ('1604402', '16044', '8', '0', '100', '2', '27203', '-1', '0', '0', '12', '16080', '1', '60000', '41', '0', '0', '0', '0', '0', '0', '0', 'Mor Grayhoof Trigger - Spawn Mor Grayhoof and Despawn Trigger on Summon Various DND Spellhit');
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = 16044;

-- Disable T0.5 100% test spawns
UPDATE `creature` SET `spawnFlags` = 2 WHERE `id` in (16042, 16080, 16118, 16101, 16102, 16097);

-- ---------- BRD ARENA T0.5 EVENT ----------
-- ADD GO "Arena Spoils" & ITS LOOT
DELETE FROM `gameobject_template` WHERE entry = 181074;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `ScriptName`) VALUES (181074, 3, 10, 'Arena Spoils', 0, 0, 1, 57, 181074, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
DELETE FROM `gameobject_loot_template` WHERE entry = 181074;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (181074, 22305, 38, 1, 1, 1, 0);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (181074, 22317, 17, 1, 1, 1, 0);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (181074, 22318, 26, 1, 1, 1, 0);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (181074, 22330, 19, 1, 1, 1, 0);

-- Add "Arena Spoils" to the map
DELETE FROM `gameobject` WHERE `guid` = 399068 AND `id` = 181074;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `spawntimesecs`, `animprogress`, `state`, `spawnFlags`)
    VALUES  (399068, 181074, 230, 602.083374, -187.792740, -54.081768, 4.925726, 0, 0, 0, -600, 100, 1, 0);

-- Remove loot tables from Theldren's lackys, but not Theldren himself (must drop quest item)
DELETE FROM `creature_loot_template` WHERE `entry` IN (16049, 16050, 16051, 16052, 16053, 16054, 16055, 16058);

-- Fix faction and flags of Theldren trigger in BRD arena
UPDATE `creature_template` 
    SET     `faction_A` = 35, `faction_H` = 35, `unit_class` = 0,
            `unit_flags` = 33554432 WHERE `entry` = 16079;

-- Fix faction of NPCs in Theldren challenge. All NPCs should be hostile to players
-- but the same faction so that the healers can heal
UPDATE `creature_template` 
    SET     `faction_A` = 48, `faction_H` = 48
    WHERE   `entry` IN (16049, 16050, 16051, 16052, 16053, 16054, 16055, 16058, 16059, 16095);

-- Fix spells on Theldren and his companions
-- Lefty's Five Fat Finger Exploding Heart Technique
-- TODO: Implement dummy effect that does massive damage if the unit moves too far
UPDATE `creature_template` SET `spell1` = 27673 WHERE `entry` = 16049;
-- Korv's Frost Shock, Earthbind Totem and Fire Nova Totam
UPDATE `creature_template` SET `spell1` = 21401, `spell2` = 15786, `spell3` = 11314 WHERE `entry` = 16053;
-- Theldren's Mortal Strike, Intercept and Intimidating Shout
UPDATE `creature_template` SET `spell1` = 17547, `spell2` = 20252, `spell3` = 19134 WHERE `entry` = 16059;
-- Malgen's Aimed Shot, Frost Trap and Pet, Gnashjaw
UPDATE `creature_template` SET `spell2` = 20902, `spell4` = 13809, `PetSpellDataId` = 19561 WHERE `entry` = 16052;
-- NPC Bodley EquipID
UPDATE creature_template SET equipment_id = 16033 WHERE entry = 16033;
DELETE FROM `creature_equip_template` WHERE entry = 16033;
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (16033, 13069, 0, 0);
UPDATE creature_template_addon SET b2_0_sheath = 1 WHERE entry = 16033;
UPDATE creature_template_addon SET auras = 27614 WHERE entry = 16033;
DELETE FROM creature_addon WHERE guid = 94490;
INSERT INTO creature_addon (guid, mount, bytes1, b2_0_sheath, b2_1_flags, emote, moveflags, auras) VALUES (94490, 0, 0, 1, 16, 0, 0, '27614 22650');
UPDATE creature_addon SET auras = 27614 WHERE guid = 94490;
-- Wrong quest ordering
UPDATE quest_template SET NextQuestId = 0 WHERE entry IN (8962, 8963, 8964, 8965);
-- Add Enchant_2H_Weapon_-_Agility to NPC Meliosh
DELETE FROM npc_vendor WHERE item = 22392;
INSERT INTO npc_vendor (entry, item, maxcount, incrtime) VALUES (11557, 22392, 0, 0);
-- Delete the rest of 1.3 mounts (wtf!?)
DELETE FROM npc_vendor WHERE item IN (12353,12354,13326,13327,12302,12303,13328,13329,12351,12330,15292,15293,8586,13317);
-- Add Ironvine set to NPC Vargus #15176 (it's 1.11)
--DELETE FROM npc_vendor WHERE item IN (22768, 22766, 22767);
--INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (15176, 22766, 0, 0);
--INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (15176, 22767, 0, 0);
--INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (15176, 22768, 0, 0);

-- Missing Loot
-- Libram of Truth (22400) should drop from Magmus: https://web.archive.org/web/20060524033848/http://wow.allakhazam.com:80/db/item.html?witem=22400
-- Libram of Hope (22401) should drop from Isalien: https://web.archive.org/web/20060524033911/http://wow.allakhazam.com:80/db/item.html?witem=22401
-- http://db.vanillagaming.org/?item=22268 / Should be dropping in 1.10
DELETE FROM reference_loot_template WHERE item IN (22268, 22401, 22400);
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (35025, 22268, 8, 1, 1, 1, 0);
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (322418, 22400, 0, 1, 1, 1, 0);
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (322689, 22268, 0, 1, 1, 1, 0);
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (322690, 22268, 0, 2, 1, 1, 0);
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (329512, 22401, 0, 1, 1, 1, 0);
-- Add [Pattern: Cenarion Herb Bag] to NPC Mishta ID:15179
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (15179, 22310, 0, 0);

-- New stables (post 1.4). Fashion look for your new friends.

DELETE FROM creature WHERE id IN (14561,14560,14559,14546,14548,14547,14556,14555,14602,14551,14552,14553,14542,14549,14550,14540,14539,14541,14545,14543,14544);
INSERT IGNORE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (6617, 14539, 1, 14575, 0, 2153.65, -4657.14, 49.9992, 1.51844, 300, 0, 0, 64, 53, 0, 0, 0);
INSERT IGNORE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (6614, 14540, 1, 14573, 0, 2161.67, -4648.08, 50.3632, 4.18879, 300, 0, 0, 64, 53, 0, 0, 0);
INSERT IGNORE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (6618, 14541, 1, 14574, 0, 2155.59, -4649.18, 50.0618, 5.3058, 300, 0, 0, 64, 53, 0, 0, 0);
INSERT IGNORE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (26644, 14542, 1, 14349, 0, -2285.41, -389.98, -9.20741, 5.95157, 250, 0, 0, 64, 53, 0, 0, 0);
INSERT IGNORE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (6405, 14543, 1, 14344, 0, -846.074, -4884.12, 21.2854, 2.54818, 120, 0, 0, 64, 53, 0, 0, 0);
INSERT IGNORE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (6409, 14544, 1, 14342, 0, -855.627, -4884.4, 22.1798, 1.32645, 120, 0, 0, 64, 53, 0, 0, 0);
INSERT IGNORE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (6404, 14545, 1, 14339, 0, -849.765, -4885.79, 21.8995, 1.15192, 120, 0, 0, 64, 53, 0, 0, 0);
INSERT IGNORE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (4156, 14546, 0, 14347, 0, -5529.51, -1376.1, 398.789, 3.57943, 180, 0, 0, 64, 53, 0, 0, 0);
INSERT IGNORE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (4149, 14547, 0, 14346, 0, -5536.3, -1335.36, 398.769, 1.80959, 180, 0, 0, 64, 53, 0, 0, 0);
INSERT IGNORE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (4155, 14548, 0, 14576, 0, -5532.46, -1358.99, 398.694, 3.04284, 180, 0, 0, 64, 53, 0, 0, 0);
INSERT IGNORE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (26654, 14549, 1, 14578, 0, -2283.82, -394.645, -9.14653, 0.907571, 250, 0, 0, 64, 53, 0, 0, 0);
INSERT IGNORE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (26657, 14550, 1, 14579, 0, -2279.3, -388.407, -9.33995, 5.68977, 250, 0, 0, 64, 53, 0, 0, 0);
INSERT IGNORE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (176, 14551, 0, 14377, 0, -5447.83, -617.37, 394.511, 3.19395, 180, 0, 0, 64, 53, 0, 0, 0);
INSERT IGNORE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (174, 14552, 0, 14376, 0, -5452.32, -613.089, 394.51, 4.29351, 180, 0, 0, 64, 53, 0, 0, 0);
INSERT IGNORE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (173, 14553, 0, 14374, 0, -5449.28, -614.756, 394.539, 3.68265, 180, 0, 0, 64, 53, 0, 0, 0);
INSERT IGNORE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (48577, 14555, 1, 14332, 0, 10126.5, 2527.85, 1323.9, 3.1765, 300, 0, 0, 64, 53, 0, 0, 0);
INSERT IGNORE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (49183, 14556, 1, 14331, 0, 10130.5, 2532.53, 1323.62, 4.10152, 300, 0, 0, 64, 53, 0, 0, 0);
INSERT IGNORE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (14808, 14559, 0, 14582, 0, -777.081, -608.085, 15.2348, 2.32129, 300, 0, 0, 64, 53, 0, 0, 0);
INSERT IGNORE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (24014, 14559, 1, 14582, 0, -3841.59, -4395.53, 10.5345, 2.32129, 360, 0, 0, 64, 53, 0, 0, 0);
INSERT IGNORE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (81391, 14559, 0, 14582, 0, -9456.64, -1386.59, 47.1554, 1.39626, 180, 0, 0, 64, 53, 0, 0, 0);
INSERT IGNORE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (8465, 14560, 1, 14338, 0, -3848.56, -4402.28, 10.3649, 2.37365, 360, 0, 0, 64, 53, 0, 0, 0);
INSERT IGNORE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (14807, 14560, 0, 14338, 0, -774.887, -606.126, 15.2348, 2.30383, 300, 0, 0, 64, 53, 0, 0, 0);
INSERT IGNORE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (81388, 14560, 0, 14338, 0, -9438.08, -1411.84, 47.0352, 1.65806, 180, 0, 0, 64, 53, 0, 0, 0);
INSERT IGNORE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (14806, 14561, 0, 14583, 0, -781.823, -611.991, 15.2348, 2.25148, 300, 0, 0, 64, 53, 0, 0, 0);
INSERT IGNORE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (24048, 14561, 1, 14583, 0, -3848.26, -4393.54, 10.2239, 5.44543, 360, 0, 0, 64, 53, 0, 0, 0);
INSERT IGNORE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (81385, 14561, 0, 14583, 0, -9444.04, -1412.16, 46.9049, 1.72788, 180, 0, 0, 64, 53, 0, 0, 0);
INSERT IGNORE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (46180, 14602, 1, 14632, 0, 10132.9, 2527.95, 1325.16, 4.01426, 300, 0, 0, 64, 0, 0, 0, 0);

-- Remove old stables
DELETE FROM `creature` where guid IN (81385, 81388, 4155, 4156, 176, 174, 49183, 48577, 6614, 6617, 6405, 6404, 26644, 26654);

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
