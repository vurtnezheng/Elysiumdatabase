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
-- REMOVE DROP TABLE FROM THESE NPCS: 16051, 16050, 16055
DELETE FROM creature_loot_template WHERE item IN (16051, 16050, 16055);
DELETE FROM reference_loot_template WHERE item IN (16051, 16050, 16055);
-- NPC BODLEY has a ton of random gossip options, one of which gives you the left piece of lord valthalak's amulet. All gossip options need to be removed.
UPDATE creature_template SET gossip_menu_id = 0 WHERE entry = 16033; 

-- TODO: 
/*
FLAVOR MISSING:
After accepting quest 9015, 5 Spectral Stalker should spawn and attack. NPC #16093 - "After accepting this quest, 5 Spectral Stalkers will spawn and attack you. They are non-elites and easily dispatched, especially at 70."

ISSUES WITH QUEST 9015 - THE CHALLENGE
- Justice Grimstone continues the normal BRD ring of law script after the banner has been thrown down. The banner should interrupt the regular ring of law script.
- Adds had blue drops on their loot table, needs to be removed.
- There is an unknown that attacks the player for 1 damage, can't be targetted or killed. Might be a trigger NPC?
- Items should be held in a chest that spawns next to the provacation banner in a object called "Arena Spoils" which doesn't currently exist in the DB. The items in that chest are #22305, 22317, 22318, 22330
- Adds should be randomized
- All explained here: https://web.archive.org/web/20060523124717/http://wow.allakhazam.com:80/db/quest.html?wquest=9015
- You can complete the quest but its very buggy.

5 QUEST BOSSES ALIVE
Isalien is shown without using Brazier
Kormok is shown without using brazier
Valthalak is shown without using brazier 
*/

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