-- Another one freestyle hackfix sql file
CREATE TEMPORARY TABLE forbidden_items (entry mediumint);
CREATE TEMPORARY TABLE forbidden_quests (entry mediumint);

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

-- FINAL QUEST CLEANUP
UPDATE `quest_template` SET `Method` = (Method | 1) WHERE entry IN (SELECT * FROM forbidden_quests);
DELETE FROM areatrigger_involvedrelation WHERE quest IN (SELECT * from forbidden_quests);
DELETE FROM creature_involvedrelation WHERE quest IN (SELECT * from forbidden_quests);
DELETE FROM creature_questrelation WHERE quest IN (SELECT * from forbidden_quests);
DELETE FROM gameobject_involvedrelation WHERE quest IN (SELECT * from forbidden_quests);
DELETE FROM gameobject_questrelation WHERE quest IN (SELECT * from forbidden_quests);
-- FINAL LOOT CLEANUP
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
