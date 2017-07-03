
-- Temporary downgrading (!!!) patch [1.7 → 1.5] to fix the current ELysium PvP state

-- Areatriggers, battlegrounds, etc.:

UPDATE `areatrigger_teleport` SET `required_level` = 61 WHERE `target_map` = 533;    -- Naxxramas 1.12
UPDATE `areatrigger_teleport` SET `required_level` = 45 WHERE `target_map` = 429;    -- Dire Maul 1.3 
UPDATE `areatrigger_teleport` SET `required_level` = 61 WHERE `target_map` = 469;    -- Blackwing Lair 1.6 
UPDATE `areatrigger_teleport` SET `required_level` = 61 WHERE `target_map` = 309;    -- Zul'Gurub 1.7 
UPDATE `areatrigger_teleport` SET `required_level` = 61 WHERE `target_map` = 531;    -- AQ 40 1.9 
UPDATE `areatrigger_teleport` SET `required_level` = 61 WHERE `target_map` = 509;    -- AQ 20 1.9 
UPDATE `battleground_template` SET `MinLvl` = 51, `MaxLvl` = 60 WHERE `id` = 1;      -- AV 1.5 

-- Disable unavailable game events:

UPDATE `game_event` SET `disabled` = 1 WHERE `entry` IN (155, 168); -- Argent Dawn @ 1.11 & Patch 1.11 * 1.12 (not quite sure what 168 does :D)
UPDATE `game_event` SET `disabled` = 1 WHERE `entry` IN
(
66,					-- Dragons of Nightmare 1.8
163,				-- Patch 1.6
164,				-- Patch 1.7
165,				-- Patch 1.8
154,				-- Silithus @ 1.9 (unchecked)
166,				-- Patch 1.9
158,				-- 1.10 Patch : Recipes (unchecked)
160,				-- 1.10 Patch : t0.5 Quest Chain (unchecked)
167					-- Patch 1.10
);


-- Add new creatures
	-- Cloth Quartermasters
DELETE FROM creature WHERE id IN (14727, 14726, 14728, 14729, 14725, 14723, 14722, 14724);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (79821, 14722, 0, 14753, 0, -8942.03, 785.805, 97.4045, 0.20944, 325, 0, 0, 2016, 0, 0, 0, 0);
-- INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (2530206, 14722, 0, 0, 0, -8942.03, 785.805, 97.3216, 0.135438, 25, 5, 0, 2016, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (1819, 14723, 0, 14754, 0, -4735.8, -1055.28, 502.296, 3.80482, 310, 0, 0, 2016, 0, 0, 0, 0);
-- INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (2530204, 14723, 0, 0, 0, -4735.8, -1055.28, 502.212, 2.74762, 25, 5, 0, 2016, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (37, 14724, 0, 14752, 0, -4823.65, -1299.36, 501.951, 0.959931, 25000, 0, 0, 2016, 0, 0, 0, 0);
-- INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (2530203, 14724, 0, 0, 1298, -4823.65, -1299.36, 501.868, 0.539079, 25, 5, 0, 2016, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (46559, 14725, 1, 14755, 0, 10076, 2260.77, 1333.08, 0.436332, 300, 0, 0, 2016, 0, 0, 0, 0);
-- INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (2530205, 14725, 1, 0, 0, 10076, 2260.77, 1333, 0.471179, 25, 5, 0, 2016, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (3421, 14726, 1, 14757, 0, 1794.68, -4572.71, 22.8627, 0.925025, 300, 0, 0, 2016, 0, 0, 0, 0);
-- INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (2530207, 14726, 1, 0, 0, 1794.68, -4572.71, 22.7796, 1.18905, 25, 5, 0, 2016, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (3422, 14727, 1, 14759, 0, 1451.64, -4209.35, 43.6451, 5.53269, 300, 0, 0, 2016, 0, 0, 0, 0);
-- INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (2530208, 14727, 1, 0, 0, 1451.64, -4209.35, 43.5619, 5.36109, 25, 5, 0, 2016, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (24867, 14728, 1, 14758, 0, -1147.28, 67.3353, 145.949, 3.24631, 250, 0, 0, 2016, 0, 0, 0, 0);
-- INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (2530209, 14728, 1, 0, 0, -1147.28, 67.3353, 145.866, 2.67491, 25, 5, 0, 2016, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (31903, 14729, 0, 14756, 0, 1690.83, 185.738, -62.0883, 5.58505, 300, 0, 0, 2016, 0, 0, 0, 0);
-- INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (2530210, 14729, 0, 0, 597, 1690.83, 185.738, -62.1713, 6.08779, 25, 5, 0, 2016, 0, 0, 0, 0);


-- Enable available quests 

-- Cloth Quartermasters Quests
DELETE FROM creature_questrelation WHERE id IN (14727, 14726, 14728, 14729, 14725, 14723, 14722, 14724);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14722, 7791);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14722, 7793);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14722, 7794);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14722, 7795);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14722, 7796);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14723, 7804);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14723, 7805);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14723, 7806);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14723, 7807);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14723, 7808);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14724, 7802);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14724, 7803);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14724, 7809);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14724, 7811);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14724, 7812);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14725, 7797);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14725, 7798);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14725, 7799);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14725, 7800);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14725, 7801);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14726, 7826);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14726, 7827);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14726, 7831);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14726, 7836);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14726, 7837);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14727, 7824);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14727, 7832);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14727, 7833);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14727, 7834);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14727, 7835);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14728, 7820);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14728, 7821);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14728, 7822);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14728, 7823);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14728, 7825);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14729, 7813);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14729, 7814);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14729, 7817);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14729, 7818);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (14729, 7819);

-- Kill me

CREATE TABLE IF NOT EXISTS forbidden_items (entry mediumint);
-- Patch 1.4—1.5 World DB Itemization Changes.
-- To be applied on QA first for testing.

-- Disable Spells of Patch 1.9 Consumables

-- Item Removal of all items 19326 and higher except for the items in this list: https://docs.google.com/spreadsheets/d/1ZZaQ8sE0ztrcC4UeZkSOUEiP5TyMDRIWGcn3t_lCW7Y/edit#gid=0.
-- !!! BONUSHIT! Should remove from loot, not from the template.

REPLACE INTO forbidden_items SELECT entry FROM item_template WHERE entry >= 19326 AND entry NOT IN (20744, 20745, 20746, 20747, 20748, 20749, 20750, 20752, 20753, 20754, 20755, 20756, 20757, 20758, 20769, 21023, 21071, 21072, 21099, 21114, 21151, 21153, 21177, 21174, 21211, 21213, 21217, 21219, 21235, 21308, 21314, 21315, 21340, 21342, 21358, 21371, 21524, 21525, 21545, 21546, 21547, 21557, 21558, 21559, 21571, 21574, 21576, 21721, 21745, 21747, 21815, 21829, 21833, 22243, 22244, 22246, 22248, 22249, 22250, 22307, 22308, 22309, 22393, 22739, 22895, 22897, 23002, 23007, 23015, 23022, 23160, 23161, 23192, 23246, 23247, 22843, 22852, 22855, 22856, 22857, 22858, 22859, 22860, 22862, 22863, 22864, 22865, 22867, 22868, 22869, 22870, 22872, 22873, 22874, 22875, 22876, 22877, 22878, 22879, 22880, 22881, 22882, 22883, 22884, 22885, 22886, 22887, 23243, 23244, 23251, 23252, 23253, 23254, 23255, 23256, 23257, 23258, 23259, 23260, 23261, 23262, 23263, 23264, 23272, 23273, 23274, 23275, 23276, 23277, 23278, 23279, 23280, 23281, 23282, 23283, 23284, 23285, 23286, 23287, 23288, 23289, 23290, 23291, 23292, 23293, 23294, 23295, 23296, 23297, 23298, 23299, 23300, 23301, 23302, 23303, 23304, 23305, 23306, 23307, 23308, 23309, 23310, 23311, 23312, 23313, 23314, 23315, 23316, 23317, 23318, 23319);

-- Remove items on this list from DB: https://docs.google.com/spreadsheets/d/1YZww0pjVdVCZOaQs4dtx86Hd1CHCRnRhUvEn5iEEYbY/edit#gid=0
-- WEEEEEE!

REPLACE INTO forbidden_items SELECT entry FROM item_template WHERE entry IN (19202, 19203, 19204, 19205, 19206, 19207, 19208, 19209, 19210, 19211, 19212, 19215, 19216, 19217, 19218, 19219, 19220, 19221, 19326, 19327, 19328, 19329, 19330, 19331, 19332, 19333, 19442, 19444, 19445, 19446, 19447, 19448, 19449, 20040, 20382, 20506, 20507, 20508, 20509, 20510, 20511, 20761, 22392);

-- "Thunderfury" Stats Have Been Corrected (main hand untill 1.12)
UPDATE item_template SET InventoryType = 21 WHERE entry = 19019;

-- Update `The Immovable Object` Item Stats

UPDATE `item_template` SET `stat_type1` = 7, `stat_value1` = 15, `stat_type2` = 0, `stat_value2` = 0, `stat_type3` = 0, `stat_value3` = 0, `stat_type4` = 0, `stat_value4` = 0, `stat_type5` = 0, `stat_value5` = 0, `stat_type6` = 0, `stat_value6` = 0, `stat_type7` = 0, `stat_value7` = 0, `stat_type8` = 0, `stat_value8` = 0, `stat_type9` = 0, `stat_value9` = 0, `stat_type10` = 0, `stat_value10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 2468, `holy_res` = 0, `fire_res` = 0, `nature_res` = 0, `frost_res` = 0, `shadow_res` = 0, `arcane_res` = 0, `spellid_1` = 23516, `spelltrigger_1` = 1, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 0, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 19321;

-- Add MC / Strat / Scholo Items

DELETE FROM `item_template` WHERE `entry` IN (19145, 19146, 19136, 19144, 19143, 19142, 19019, 18713, 18715, 18806, 18812, 18809, 19137, 18716, 18735, 18726, 18723, 18692);

INSERT INTO item_template VALUES
('18692', '4', '4', 'Death Knight Sabatons', '31133', '3', '0', '1', '71877', '14375', '8', '-1', '-1', '59', '54', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '4', '11', '7', '11', '5', '11', '6', '9', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '424', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '65', '0', '0', '0', '', '48', '0', '0', '0', '0', '0', '1'),
('18713', '2', '2', 'Rhok\'delar, Longbow of the Ancient Keepers', '31338', '4', '32768', '1', '0', '0', '15', '4', '-1', '75', '60', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '89', '166', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2900', '2', '100', '7597', '1', '0', '0', '-1', '0', '-1', '21432', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '-1', '1', '', '0', '0', '0', '0', '0', '2', '0', '0', '0', '0', '90', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '1'),
('18715', '2', '10', 'Lok\'delar, Stave of the Ancient Keepers', '31163', '4', '32768', '1', '0', '0', '17', '4', '-1', '75', '60', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '7', '26', '5', '15', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '187', '282', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '10', '0', '0', '0', '3200', '0', '0', '7598', '1', '0', '0', '-1', '0', '-1', '14097', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0', '120', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '1'),
('18716', '4', '2', 'Ash Covered Boots', '31166', '3', '0', '1', '93277', '18655', '8', '-1', '-1', '61', '56', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '3', '13', '7', '13', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '118', '0', '0', '0', '0', '0', '0', '0', '0', '0', '13669', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '8', '0', '0', '0', '0', '50', '0', '0', '0', '', '49', '0', '0', '0', '0', '0', '1'),
('18723', '4', '0', 'Animated Chain Necklace', '6539', '3', '0', '1', '167814', '41953', '2', '-1', '-1', '62', '57', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '7', '7', '6', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '9318', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '49', '0', '0', '0', '0', '0', '1'),
('18726', '4', '2', 'Magistrate\'s Cuffs', '31175', '3', '0', '1', '56480', '11296', '9', '-1', '-1', '59', '54', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '7', '15', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '73', '0', '0', '0', '0', '0', '0', '0', '0', '0', '21362', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '8', '0', '0', '0', '0', '35', '0', '0', '0', '', '48', '0', '0', '0', '0', '0', '1'),
('18735', '4', '1', 'Maleki\'s Footwraps', '31188', '3', '0', '1', '86266', '17253', '8', '-1', '-1', '62', '57', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '7', '9', '5', '9', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '60', '0', '0', '0', '0', '0', '0', '0', '0', '0', '18009', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '40', '0', '0', '0', '', '49', '0', '0', '0', '0', '0', '1'),
('18806', '4', '4', 'Core Forged Greaves', '31271', '4', '0', '1', '168806', '33761', '8', '-1', '-1', '70', '60', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '7', '28', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '634', '0', '12', '0', '0', '8', '0', '0', '0', '0', '7517', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '75', '0', '0', '0', '', '65', '0', '0', '0', '0', '0', '1'),
('18809', '4', '1', 'Sash of Whispered Secrets', '31278', '4', '0', '1', '108057', '21611', '6', '-1', '-1', '71', '60', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '7', '20', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '61', '0', '0', '0', '0', '0', '0', '0', '0', '0', '18013', '1', '0', '0', '-1', '0', '-1', '21599', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '35', '0', '0', '0', '', '65', '0', '0', '0', '0', '0', '1'),
('18812', '4', '3', 'Wristguards of True Flight', '31280', '4', '0', '1', '162290', '32458', '9', '-1', '-1', '71', '60', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '3', '19', '7', '11', '5', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '198', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15464', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '5', '0', '0', '0', '0', '50', '0', '0', '0', '', '65', '0', '0', '0', '0', '0', '1'),
('19019', '2', '7', 'Thunderfury, Blessed Blade of the Windseeker', '30606', '5', '0', '1', '615704', '123140', '13', '-1', '-1', '80', '60', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '3', '5', '7', '8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '44', '115', '0', '16', '30', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '8', '9', '0', '0', '0', '1900', '0', '0', '21992', '2', '0', '5.52', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '125', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '1'),
('19136', '4', '1', 'Mana Igniting Cord', '31653', '4', '0', '1', '111403', '22280', '6', '-1', '-1', '71', '60', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '5', '16', '7', '12', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '61', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15715', '1', '0', '0', '-1', '0', '-1', '18384', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '35', '0', '0', '0', '', '65', '0', '0', '0', '0', '0', '1'),
('19137', '4', '4', 'Onslaught Girdle', '31654', '4', '0', '1', '157346', '31469', '6', '-1', '-1', '78', '60', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '4', '31', '7', '11', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '494', '0', '0', '0', '0', '0', '0', '0', '0', '0', '7597', '1', '0', '0', '-1', '0', '-1', '15464', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '55', '0', '0', '0', '', '65', '0', '0', '0', '0', '0', '1'),
('19142', '4', '0', 'Fire Runed Grimoire', '23321', '4', '0', '1', '75615', '18903', '23', '-1', '-1', '70', '60', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '5', '21', '7', '12', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '9416', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '8', '0', '0', '0', '0', '0', '0', '0', '0', '', '65', '0', '0', '0', '0', '0', '1'),
('19143', '4', '4', 'Flameguard Gauntlets', '31660', '4', '0', '1', '106417', '21283', '10', '-1', '-1', '69', '60', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '7', '13', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '488', '0', '0', '0', '0', '0', '0', '0', '0', '0', '7597', '1', '0', '0', '-1', '0', '-1', '15813', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '55', '0', '0', '0', '', '65', '0', '0', '0', '0', '0', '1'),
('19144', '4', '3', 'Sabatons of the Flamewalker', '31662', '4', '0', '1', '229869', '45973', '8', '-1', '-1', '68', '60', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '7', '27', '5', '11', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '298', '0', '0', '0', '0', '0', '0', '0', '0', '0', '9336', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '5', '0', '0', '0', '0', '70', '0', '0', '0', '', '65', '0', '0', '0', '0', '0', '1'),
('19145', '4', '1', 'Robe of Volatile Power', '31663', '4', '0', '1', '185169', '37033', '20', '-1', '-1', '66', '60', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '5', '15', '7', '10', '6', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '102', '0', '0', '0', '0', '0', '0', '0', '0', '0', '18382', '1', '0', '0', '-1', '0', '-1', '14047', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '100', '0', '0', '0', '', '65', '0', '0', '0', '0', '0', '1'),
('19146', '4', '2', 'Wristguards of Stability', '6763', '4', '0', '1', '100919', '20183', '9', '-1', '-1', '65', '60', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '4', '24', '7', '8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '86', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '8', '0', '0', '0', '0', '40', '0', '0', '0', '', '65', '0', '0', '0', '0', '0', '1');

REPLACE INTO forbidden_items SELECT entry FROM item_template WHERE entry=22637;
-- "Bonereaver's Edge" Stats Has Been Corrected
UPDATE `item_template` SET `stat_type1` = 0, `stat_value1` = 0, `stat_type2` = 0, `stat_value2` = 0, `stat_type3` = 0, `stat_value3` = 0, `stat_type4` = 0, `stat_value4` = 0, `stat_type5` = 0, `stat_value5` = 0, `stat_type6` = 0, `stat_value6` = 0, `stat_type7` = 0, `stat_value7` = 0, `stat_type8` = 0, `stat_value8` = 0, `stat_type9` = 0, `stat_value9` = 0, `stat_type10` = 0, `stat_value10` = 0, `dmg_min1` = 206, `dmg_max1` = 310, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 0, `holy_res` = 0, `fire_res` = 0, `nature_res` = 0, `frost_res` = 0, `shadow_res` = 0, `arcane_res` = 0, `spellid_1` = 21153, `spelltrigger_1` = 2, `spellcharges_1` = 0, `spellppmRate_1` = 3, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 7597, `spelltrigger_2` = 1, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 17076;

-- Finished initial loading
-- SPELLS CHANGED: Ardent Custodian (ilevel 43 entry 868). 5 versions
-- Source: http://www.thottbot.com/?n=94198
-- Source: http://www.thottbot.com/?n=93792
-- Source: http://www.thottbot.com/?n=91113 / http://wow.allakhazam.com/item.html?witem=868
-- Source: http://wow.allakhazam.com/dyn/items/wminlev4.html
-- Source: http://www.thottbot.com/?i=Ardent%20Custodian
-- * Modified spell 1
-- 1.12 spell 7518 (Increased Defense +5.)
-- 1.04 spell 13386 (Increased Defense +7.)
UPDATE item_template SET `spellid_1`=13386 WHERE entry=868;
-- SPELLS CHANGED: Warden Staff (ilevel 48 entry 943). 4 versions
-- Source: http://www.thottbot.com/?n=615153
-- Source: http://www.thottbot.com/?n=94207 / http://wow.allakhazam.com/dyn/items/wratio10.html
-- Source: http://wow.allakhazam.com/dyn/items/wminlev10.html
-- Source: http://www.thottbot.com/?n=74711
-- * Modified spell 1
-- 1.12 spell 13390 (Increased Defense +10.)
-- 1.04 spell 21411 (Increased Defense +15.)
UPDATE item_template SET `spellid_1`=21411 WHERE entry=943;
-- SPELLS CHANGED: Lesser Firestone (ilevel 28 entry 1254). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype23.html
-- Source: http://wow.allakhazam.com/item.html?witem=1254
-- * Modified spell 2
-- 1.12 spell 23480 (Increases damage done by Fire spells and effects by up to 10.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=1254;
-- SPELLS REMOVED: Double Link Tunic (ilevel 30 entry 1717). 4 versions
-- Source: http://www.thottbot.com/?n=7530
-- Source: http://www.thottbot.com/?n=8946 / http://wow.allakhazam.com/profile.html?26338
-- Source: http://www.thottbot.com/?n=8946
-- Source: http://www.thottbot.com/?n=11363
-- * Modified spell 1
-- 1.12 spell 0
-- 1.04 spell 21410 (Increased Defense +14.)
-- * Modified spell 2
-- 1.12 spell 18369 (Increased Defense +9.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_2`=0, `spelltrigger_2`=0, `spellid_1`=21410, `spelltrigger_1`=1 WHERE entry=1717;
-- SPELLS CHANGED: Staff of the Blessed Seer (ilevel 23 entry 2271). 3 versions
-- Source: http://www.thottbot.com/?n=9022 / http://wow.allakhazam.com/db/price.html?witem=2271
-- Source: http://www.thottbot.com/?n=9019 / http://wow.allakhazam.com/profile.html?47143
-- Source: http://www.thottbot.com/?n=9022
-- * Modified spell 1
-- 1.12 spell 9314 (Increases healing done by spells and effects by up to 24.)
-- 1.04 spell 23796 (Increases healing done by spells and effects by up to 24.)
UPDATE item_template SET `spellid_1`=23796 WHERE entry=2271;
-- STATS CHANGED: Augural Shroud (ilevel 39 entry 2620). 1/2 versions
UPDATE item_template SET `stat_value1`=0, `stat_type3`=3, `stat_value3`=11 WHERE entry=2620;
-- SPELLS REMOVED: Augural Shroud (ilevel 39 entry 2620). 2 versions
-- Source: http://www.thottbot.com/?n=27061 / http://wow.allakhazam.com/item.html?witem=2620
-- Source: http://www.thottbot.com/?n=27061
-- * Modified spell 1
-- 1.12 spell 9416 (Increases damage and healing done by magical spells and effects by up to 11.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=2620;
-- NOT FOUND: Monster - Item, Lantern - Round (ilevel 1 entry 2715)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 2715);
-- SPELLS REMOVED: Hurricane (ilevel 53 entry 2824). 3 versions
-- Source: http://wow.allakhazam.com/item.html?witem=2824
-- Source: http://www.thottbot.com/?n=91161
-- Source: http://wow.allakhazam.com/dyn/items/wminlev2.html
-- * Modified spell 1
-- 1.12 spell 29501 (Chance to strike your target with a Frost Arrow for 31 to 46 Frost damage.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=2824;
-- STATS CHANGED: Seal of Wrynn (ilevel 31 entry 2933). 1/2 versions
UPDATE item_template SET `stat_value1`=2, `stat_value2`=6, `stat_value3`=0, `stat_value4`=0, `stat_value5`=0 WHERE entry=2933;
-- QUALITY CHANGED: Seal of Wrynn (ilevel 31 entry 2933)
UPDATE item_template SET Quality=2 WHERE entry=2933;
-- STATS CHANGED: Night Watch Pantaloons (ilevel 33 entry 2954). 1/2 versions
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `stat_type3`=6, `stat_value3`=8 WHERE entry=2954;
-- QUALITY CHANGED: Brocade Bracers (ilevel 22 entry 3379)
UPDATE item_template SET Quality=2 WHERE entry=3379;
-- SPELLS CHANGED: Phoenix Pants (ilevel 25 entry 4317). 5 versions
-- Source: http://www.thottbot.com/?i=Iridescent%20Pearl
-- Source: http://www.thottbot.com/?i=10347
-- Source: http://www.thottbot.com/?i=9330 / http://wow.allakhazam.com/db/item.html?witem=4317
-- Source: http://www.thottbot.com/?i=301 / http://wow.allakhazam.com/item.html?witem=4317
-- Source: http://www.thottbot.com/?i=Phoenix%20Pants
-- * Modified spell 1
-- 1.12 spell 7689 (Increases damage done by Fire spells and effects by up to 10.)
-- 1.04 spell 23480 (Increases damage done by Fire spells and effects by up to 10.)
UPDATE item_template SET `spellid_1`=23480 WHERE entry=4317;
-- STATS CHANGED: Swampland Trousers (ilevel 31 entry 4505). 1/2 versions
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `stat_type3`=6, `stat_value3`=7 WHERE entry=4505;
-- SPELLS CHANGED: Spellstone (ilevel 36 entry 5522). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype23.html
-- Source: http://wow.allakhazam.com/dyn/items/iminlev23.html
-- Source: http://wow.allakhazam.com/item.html?witem=5522
-- * Modified spell 2
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=5522;
-- STATS CHANGED: Murloc Scale Belt (ilevel 18 entry 5780). 1/2 versions
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `armor`=40 WHERE entry=5780;
-- QUALITY CHANGED: Murloc Scale Belt (ilevel 18 entry 5780)
UPDATE item_template SET Quality=1 WHERE entry=5780;
-- STATS CHANGED: Wandering Boots (ilevel 24 entry 6095). 1/2 versions
UPDATE item_template SET `stat_value1`=0, `stat_type3`=3, `stat_value3`=4 WHERE entry=6095;
-- SPELLS CHANGED: Crimson Silk Gloves (ilevel 42 entry 7064). 4 versions
-- Source: http://www.thottbot.com/?i=Thick%20Leather
-- Source: http://wow.allakhazam.com/db/price.html?witem=7064
-- Source: http://www.thottbot.com/?i=Silken%20Thread / http://wow.allakhazam.com/item.html?witem=7064
-- Source: http://www.thottbot.com/?i=Thick%20Leather
-- * Modified spell 1
-- 1.12 spell 9401 (Increases damage done by Fire spells and effects by up to 14.)
-- 1.04 spell 23480 (Increases damage done by Fire spells and effects by up to 10.)
UPDATE item_template SET `spellid_1`=23480 WHERE entry=7064;
-- STATS CHANGED: Manaweave Robe (ilevel 20 entry 7509). 1/2 versions
UPDATE item_template SET `stat_value1`=2, `stat_type2`=6, `stat_value2`=2, `armor`=28 WHERE entry=7509;
-- STATS CHANGED: Lesser Spellfire Robes (ilevel 20 entry 7510). 1/1 versions
UPDATE item_template SET `stat_value1`=2, `stat_type2`=6, `stat_value2`=2, `armor`=28 WHERE entry=7510;
-- STATS CHANGED: Astral Knot Robe (ilevel 31 entry 7511). 1/1 versions
UPDATE item_template SET `stat_value1`=0, `stat_value2`=2, `stat_value3`=8, `armor`=40 WHERE entry=7511;
-- STATS CHANGED: Nether-lace Robe (ilevel 31 entry 7512). 1/1 versions
UPDATE item_template SET `stat_value1`=0, `stat_value2`=2, `stat_value3`=8, `armor`=40 WHERE entry=7512;
-- STATS REMOVED for item Ragefire Wand (http://wow.allakhazam.com/item.html?witem=7513) 
UPDATE item_template SET stat_value1=0, stat_type1=0 WHERE entry=7513;
-- DAMAGE CHANGED: Ragefire Wand (ilevel 40 entry 7513). 1/6 versions
-- Source: http://wow.allakhazam.com/item.html?witem=7513
-- Source: http://wow.allakhazam.com/dyn/items/wratio19.html
-- Source: http://wow.allakhazam.com/dyn/items/wminlev19.html
-- Source: http://www.thottbot.com/?i=Ragefire%20Wand
-- Source: http://wow.allakhazam.com/db/quest.html?wquest=1952
-- Source: http://www.thottbot.com/?i=5406
UPDATE item_template SET `dmg_min1`=32, `dmg_max1`=60 WHERE entry=7513;
-- SPELLS CHANGED: Ragefire Wand (ilevel 40 entry 7513). 6 versions
-- Source: http://wow.allakhazam.com/item.html?witem=7513
-- Source: http://wow.allakhazam.com/dyn/items/wratio19.html
-- Source: http://wow.allakhazam.com/dyn/items/wminlev19.html
-- Source: http://www.thottbot.com/?i=Ragefire%20Wand
-- Source: http://wow.allakhazam.com/db/quest.html?wquest=1952
-- Source: http://www.thottbot.com/?i=5406
-- * Modified spell 1
-- 1.12 spell 7688 (Increases damage done by Fire spells and effects by up to 9.)
-- 1.04 spell 7687 (Increases damage done by Fire spells and effects by up to 7.)
UPDATE item_template SET `spellid_1`=7687 WHERE entry=7513;
-- QUALITY CHANGED: Ragefire Wand (ilevel 40 entry 7513)
UPDATE item_template SET Quality=2 WHERE entry=7513;
-- STATS REMOVED for item Icefury Wand (http://wow.allakhazam.com/dyn/items/wratio19.html) 
UPDATE item_template SET stat_value1=0, stat_type1=0 WHERE entry=7514;
-- DAMAGE CHANGED: Icefury Wand (ilevel 40 entry 7514). 1/5 versions
-- Source: http://wow.allakhazam.com/dyn/items/wratio19.html
-- Source: http://wow.allakhazam.com/item.html?witem=7514
-- Source: http://wow.allakhazam.com/dyn/items/wminlev19.html
-- Source: http://www.thottbot.com/?i=Ragefire%20Wand
-- Source: http://www.thottbot.com/?i=5406
UPDATE item_template SET `dmg_min1`=36, `dmg_max1`=68 WHERE entry=7514;
-- SPELLS CHANGED: Icefury Wand (ilevel 40 entry 7514). 5 versions
-- Source: http://wow.allakhazam.com/dyn/items/wratio19.html
-- Source: http://wow.allakhazam.com/item.html?witem=7514
-- Source: http://wow.allakhazam.com/dyn/items/wminlev19.html
-- Source: http://www.thottbot.com/?i=Ragefire%20Wand
-- Source: http://www.thottbot.com/?i=5406
-- * Modified spell 1
-- 1.12 spell 7702 (Increases damage done by Frost spells and effects by up to 9.)
-- 1.04 spell 7699 (Increases damage done by Frost spells and effects by up to 4.)
UPDATE item_template SET `spellid_1`=7699 WHERE entry=7514;
-- QUALITY CHANGED: Icefury Wand (ilevel 40 entry 7514)
UPDATE item_template SET Quality=2 WHERE entry=7514;
-- STATS CHANGED: Celestial Orb (ilevel 40 entry 7515). 1/3 versions
UPDATE item_template SET `stat_value1`=2 WHERE entry=7515;
-- SPELLS CHANGED: Celestial Orb (ilevel 40 entry 7515). 3 versions
-- Source: http://www.thottbot.com/?i=Testament%20of%20Hope
-- Source: http://wow.allakhazam.com/item.html?witem=7515
-- Source: http://wow.allakhazam.com/item.html?witem=7515
-- * Modified spell 1
-- 1.12 spell 9342 (Increases damage and healing done by magical spells and effects by up to 13.)
-- 1.04 spell 13595 (Increases damage done by Arcane spells and effects by up to 9.)
-- * Modified spell 2
-- 1.12 spell 9253 (Restores 400 to 1201 mana.)
-- 1.04 spell 7688 (Increases damage done by Fire spells and effects by up to 9.)
-- * Modified spell 3
-- 1.12 spell 0
-- 1.04 spell 7702 (Increases damage done by Frost spells and effects by up to 9.)
-- * Modified spell 4
-- 1.12 spell 0
-- 1.04 spell 9253 (Restores 400 to 1201 mana.)
UPDATE item_template SET `spellid_1`=13595, `spellid_2`=7688, `spelltrigger_2`=1, `spellid_3`=7702, `spelltrigger_3`=1, `spellid_4`=9253 WHERE entry=7515;
-- SPELLS REMOVED: Hypnotic Blade (ilevel 39 entry 7714). 3 versions
-- Source: http://www.thottbot.com/?n=605851 / http://wow.allakhazam.com/item.html?witem=7714
-- Source: http://www.thottbot.com/?n=614250
-- Source: http://wow.allakhazam.com/dyn/items/wminlev15.html
-- * Modified spell 1
-- 1.12 spell 9415 (Increases damage and healing done by magical spells and effects by up to 9.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=7714;
-- SPELLS CHANGED: Archaic Defender (ilevel 36 entry 9385). 4 versions
-- Source: http://www.thottbot.com/?n=9741 / http://wow.allakhazam.com/item.html?witem=9385
-- Source: http://wow.allakhazam.com/db/item.html?entryid=147451
-- Source: http://www.thottbot.com/?i=4146
-- Source: http://www.thottbot.com/?n=9915
-- * Modified spell 1
-- 1.12 spell 13390 (Increased Defense +10.)
-- 1.04 spell 21411 (Increased Defense +15.)
UPDATE item_template SET `spellid_1`=21411 WHERE entry=9385;
-- STATS CHANGED: Worn Running Boots (ilevel 40 entry 9398). 1/2 versions
UPDATE item_template SET `armor`=72 WHERE entry=9398;
-- QUALITY CHANGED: Worn Running Boots (ilevel 40 entry 9398)
UPDATE item_template SET Quality=1 WHERE entry=9398;
-- SPELLS CHANGED: Girdle of Golem Strength (ilevel 33 entry 9405). 3 versions
-- Source: http://www.thottbot.com/?n=Fardel%20Dabyrie / http://wow.allakhazam.com/db/price.html?witem=9405
-- Source: http://www.thottbot.com/?n=9762
-- Source: http://www.thottbot.com/?n=8871
-- * Modified spell 1
-- 1.12 spell 7516 (Increased Defense +3.)
-- 1.04 spell 13383 (Increased Defense +5.)
UPDATE item_template SET `spellid_1`=13383 WHERE entry=9405;
-- STATS CHANGED: Spidertank Oilrag (ilevel 33 entry 9448). 1/2 versions
UPDATE item_template SET `stat_type1`=3, `stat_value1`=7 WHERE entry=9448;
-- SPELLS REMOVED: Spidertank Oilrag (ilevel 33 entry 9448). 2 versions
-- Source: http://www.thottbot.com/?n=48364 / http://wow.allakhazam.com/item.html?witem=9448
-- Source: http://www.thottbot.com/?n=48364
-- * Modified spell 1
-- 1.12 spell 21361 (Restores 3 mana per 5 sec.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=9448;
-- STATS CHANGED: Acidic Walkers (ilevel 32 entry 9454). 1/2 versions
UPDATE item_template SET `stat_value2`=7, `stat_type3`=3, `stat_value3`=4 WHERE entry=9454;
-- SPELLS REMOVED: Acidic Walkers (ilevel 32 entry 9454). 2 versions
-- Source: http://www.thottbot.com/?n=617611 / http://wow.allakhazam.com/profile.html?47143
-- Source: http://www.thottbot.com/?n=395036
-- * Modified spell 1
-- 1.12 spell 9395 (Increases damage and healing done by magical spells and effects by up to 5.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=9454;
-- SPELLS REMOVED: Digmaster 5000 (ilevel 45 entry 9465). 6 versions
-- Source: http://www.thottbot.com/?n=26640 / http://wow.allakhazam.com/item.html?witem=9465
-- Source: http://www.thottbot.com/?n=36236
-- Source: http://wow.allakhazam.com/dyn/items/wname0.html
-- Source: http://wow.allakhazam.com/item.html?witem=9465
-- Source: http://www.thottbot.com/?i=17885
-- Source: http://www.thottbot.com/?n=258594
-- * Modified spell 1
-- 1.12 spell 0
-- 1.04 spell 11791 (Punctures target's armor lowering it by 100.)
-- * Modified spell 2
-- 1.12 spell 11791 (Punctures target's armor lowering it by 100.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_2`=0, `spelltrigger_2`=0, `spellid_1`=11791, `spelltrigger_1`=2 WHERE entry=9465;
-- SPELLS CHANGED: Witch Doctor's Cane (ilevel 47 entry 9482). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/wminlev10.html
-- Source: http://wow.allakhazam.com/dyn/items/wratio10.html
-- Source: http://wow.allakhazam.com/item.html?witem=9482
-- * Modified spell 1
-- 1.12 spell 17993 (Increases damage done by Nature spells and effects by up to 33.)
-- 1.04 spell 17990 (Increases damage done by Nature spells and effects by up to 27.)
UPDATE item_template SET `spellid_1`=17990 WHERE entry=9482;
-- SPELLS CHANGED: Spellshock Leggings (ilevel 50 entry 9484). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype7.html
-- Source: http://wow.allakhazam.com/item.html?witem=9484
-- Source: http://wow.allakhazam.com/dyn/items/iminlev7.html
-- * Modified spell 1
-- 1.12 spell 14047 (Increases damage and healing done by magical spells and effects by up to 23.)
-- 1.04 spell 9344 (Increases damage and healing done by magical spells and effects by up to 15.)
UPDATE item_template SET `spellid_1`=9344 WHERE entry=9484;
-- STATS CHANGED: Nether-lace Tunic (ilevel 31 entry 9515). 1/1 versions
UPDATE item_template SET `stat_value1`=2, `stat_value2`=0, `stat_type3`=6, `stat_value3`=8, `armor`=40 WHERE entry=9515;
-- STATS CHANGED: Astral Knot Blouse (ilevel 31 entry 9516). 1/1 versions
UPDATE item_template SET `stat_value1`=2, `stat_value2`=0, `stat_type3`=6, `stat_value3`=8, `armor`=40 WHERE entry=9516;
-- STATS CHANGED: Celestial Stave (ilevel 40 entry 9517). 1/5 versions
UPDATE item_template SET `stat_value1`=2 WHERE entry=9517;
-- DAMAGE CHANGED: Celestial Stave (ilevel 40 entry 9517). 3/5 versions
-- Source: http://wow.allakhazam.com/item.html?witem=9517
-- Source: http://wow.allakhazam.com/db/item.html?entryid=21336
-- Source: http://wow.allakhazam.com/db/item.html?entryid=15447
-- Source: http://wow.allakhazam.com/item.html?witem=9517
-- Source: http://www.thottbot.com/?i=Celestial%20Stave
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `dmg_min1`=69, `dmg_max1`=104 WHERE entry=9517;
-- SPELLS CHANGED: Celestial Stave (ilevel 40 entry 9517). 5 versions
-- Source: http://wow.allakhazam.com/item.html?witem=9517
-- Source: http://wow.allakhazam.com/db/item.html?entryid=21336
-- Source: http://wow.allakhazam.com/db/item.html?entryid=15447
-- Source: http://wow.allakhazam.com/item.html?witem=9517
-- Source: http://www.thottbot.com/?i=Celestial%20Stave
-- * Modified spell 1
-- 1.12 spell 15714 (Increases damage and healing done by magical spells and effects by up to 22.)
-- 1.04 spell 13597 (Increases damage done by Arcane spells and effects by up to 11.)
-- * Modified spell 2
-- 1.12 spell 0
-- 1.04 spell 9399 (Increases damage done by Fire spells and effects by up to 11.)
-- * Modified spell 3
-- 1.12 spell 0
-- 1.04 spell 9402 (Increases damage done by Frost spells and effects by up to 11.)
UPDATE item_template SET `spellid_1`=13597, `spellid_2`=9399, `spelltrigger_2`=1, `spellid_3`=9402, `spelltrigger_3`=1 WHERE entry=9517;
-- QUALITY CHANGED: Celestial Stave (ilevel 40 entry 9517)
UPDATE item_template SET Quality=2 WHERE entry=9517;
-- STATS CHANGED: Talvash's Gold Ring (ilevel 35 entry 9538). 1/2 versions
UPDATE item_template SET `stat_value1`=5, `stat_value2`=5 WHERE entry=9538;
-- QUALITY CHANGED: Talvash's Gold Ring (ilevel 35 entry 9538)
UPDATE item_template SET Quality=2 WHERE entry=9538;
-- STATS CHANGED: Nogg's Gold Ring (ilevel 35 entry 9588). 1/2 versions
UPDATE item_template SET `stat_value1`=5, `stat_value2`=5 WHERE entry=9588;
-- QUALITY CHANGED: Nogg's Gold Ring (ilevel 35 entry 9588)
UPDATE item_template SET Quality=2 WHERE entry=9588;
-- SPELLS REMOVED: Dual Reinforced Leggings (ilevel 37 entry 9625). 3 versions
-- Source: http://www.thottbot.com/?n=605149
-- Source: http://www.thottbot.com/?i=2330 / http://wow.allakhazam.com/item.html?witem=9625
-- Source: http://www.thottbot.com/?i=Triprunner%20Dungarees
-- * Modified spell 1
-- 1.12 spell 0
-- 1.04 spell 13386 (Increased Defense +7.)
-- * Modified spell 2
-- 1.12 spell 7518 (Increased Defense +5.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_2`=0, `spelltrigger_2`=0, `spellid_1`=13386, `spelltrigger_1`=1 WHERE entry=9625;
-- DAMAGE CHANGED: Reforged Blade of Heroes (ilevel 38 entry 9718). 1/2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=9718
-- Source: http://wow.allakhazam.com/dyn/items/wminlev7.html
-- STATS CHANGED: Dreamweave Circlet (ilevel 50 entry 10041). 1/4 versions
UPDATE item_template SET `stat_value2`=6, `armor`=53 WHERE entry=10041;
-- SPELLS CHANGED: Dreamweave Circlet (ilevel 50 entry 10041). 4 versions
-- 15 spell damage/healing @ https://web.archive.org/web/20050831033125/http://www.thottbot.com:80/?i=4373
-- * Modified spell 1
-- 1.12 spell 14248 (Increases damage and healing done by magical spells and effects by up to 21.)
-- 1.05 spell 9344 (Increases damage and healing done by magical spells and effects by up to 15.)
UPDATE item_template SET `spellid_1`=9344 WHERE entry=10041;
-- QUALITY CHANGED: Dreamweave Circlet (ilevel 50 entry 10041)
UPDATE item_template SET Quality=2 WHERE entry=10041;
-- SPELLS CHANGED: Cindercloth Boots (ilevel 49 entry 10044). 4 versions
-- Source: http://www.thottbot.com/?i=Thick%20Leather
-- Source: http://www.thottbot.com/?i=4376 / http://wow.allakhazam.com/item.html?witem=10044
-- Source: http://www.thottbot.com/?i=Heavy%20Silken%20Thread / http://wow.allakhazam.com/item.html?witem=10044
-- Source: http://www.thottbot.com/?i=Thick%20Leather
-- * Modified spell 1
-- 1.12 spell 9298 (Increases damage done by Fire spells and effects by up to 21.)
-- 1.04 spell 23483 (Increases damage done by Fire spells and effects by up to 21.)
UPDATE item_template SET `spellid_1`=23483 WHERE entry=10044;
-- STATS CHANGED: Death's Head Vestment (ilevel 40 entry 10581). 1/1 versions
UPDATE item_template SET `stat_value1`=0, `stat_type4`=4, `stat_value4`=8 WHERE entry=10581;
-- SPELLS CHANGED: Shard of Afrasa (ilevel 57 entry 10659). 2 versions
-- Source: http://wow.allakhazam.com/profile.html?58232
-- Source: http://wow.allakhazam.com/item.html?witem=10659
-- * Modified spell 1
-- 1.12 spell 21363 (Restores 5 mana per 5 sec.)
-- 1.04 spell 12732 (Increases your normal health and mana regeneration by 5.)
-- * Modified spell 2
-- 1.12 spell 21596 (Restores 5 health per 5 sec.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=12732, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=10659;
-- STATS REMOVED for item Nether Force Wand (http://wow.allakhazam.com/dyn/items/wminlev19.html) 
UPDATE item_template SET stat_value1=0, stat_type1=0 WHERE entry=11263;
-- DAMAGE CHANGED: Nether Force Wand (ilevel 40 entry 11263). 1/6 versions
-- Source: http://wow.allakhazam.com/dyn/items/wminlev19.html
-- Source: http://wow.allakhazam.com/item.html?witem=11263
-- Source: http://wow.allakhazam.com/dyn/items/wratio19.html
-- Source: http://www.thottbot.com/?i=Ragefire%20Wand
-- Source: http://wow.allakhazam.com/item.html?witem=11263
-- Source: http://www.thottbot.com/?i=5406
UPDATE item_template SET `dmg_min1`=34, `dmg_max1`=64 WHERE entry=11263;
-- SPELLS CHANGED: Nether Force Wand (ilevel 40 entry 11263). 6 versions
-- Source: http://wow.allakhazam.com/dyn/items/wminlev19.html
-- Source: http://wow.allakhazam.com/item.html?witem=11263
-- Source: http://wow.allakhazam.com/dyn/items/wratio19.html
-- Source: http://www.thottbot.com/?i=Ragefire%20Wand
-- Source: http://wow.allakhazam.com/item.html?witem=11263
-- Source: http://www.thottbot.com/?i=5406
-- * Modified spell 1
-- 1.12 spell 13595 (Increases damage done by Arcane spells and effects by up to 9.)
-- 1.04 spell 13594 (Increases damage done by Arcane spells and effects by up to 7.)
UPDATE item_template SET `spellid_1`=13594 WHERE entry=11263;
-- QUALITY CHANGED: Nether Force Wand (ilevel 40 entry 11263)
UPDATE item_template SET Quality=2 WHERE entry=11263;
-- DAMAGE CHANGED: Lesser Magic Wand (ilevel 15 entry 11287). 1/4 versions
-- Source: http://www.thottbot.com/?i=Simple%20Wood
-- Source: http://wow.allakhazam.com/item.html?witem=11287
-- Source: http://wow.allakhazam.com/dyn/items/wminlev19.html
-- Source: http://www.thottbot.com/?n=7620
UPDATE item_template SET `dmg_min1`=6, `dmg_max1`=11 WHERE entry=11287;
-- QUALITY CHANGED: Lesser Magic Wand (ilevel 15 entry 11287)
UPDATE item_template SET Quality=1 WHERE entry=11287;
-- DAMAGE CHANGED: Greater Magic Wand (ilevel 23 entry 11288). 1/4 versions
-- Source: http://www.thottbot.com/?i=Simple%20Wood
-- Source: http://wow.allakhazam.com/profile.html?11990
-- Source: http://wow.allakhazam.com/dyn/items/wminlev19.html
-- Source: http://www.thottbot.com/?n=579264
UPDATE item_template SET `dmg_min1`=15, `dmg_max1`=28 WHERE entry=11288;
-- QUALITY CHANGED: Greater Magic Wand (ilevel 23 entry 11288)
UPDATE item_template SET Quality=1 WHERE entry=11288;
-- DAMAGE CHANGED: Lesser Mystic Wand (ilevel 31 entry 11289). 1/4 versions
-- Source: http://wow.allakhazam.com/item.html?witem=11289
-- Source: http://wow.allakhazam.com/dyn/items/wminlev19.html
-- Source: http://www.thottbot.com/?i=9416
-- Source: http://www.thottbot.com/?n=7620
UPDATE item_template SET `dmg_min1`=21, `dmg_max1`=39 WHERE entry=11289;
-- QUALITY CHANGED: Lesser Mystic Wand (ilevel 31 entry 11289)
UPDATE item_template SET Quality=1 WHERE entry=11289;
-- DAMAGE CHANGED: Greater Mystic Wand (ilevel 35 entry 11290). 1/3 versions
-- Source: http://wow.allakhazam.com/item.html?witem=11290
-- Source: http://www.thottbot.com/?n=7620
-- Source: http://www.thottbot.com/?i=Vision%20Dust
UPDATE item_template SET `dmg_min1`=38, `dmg_max1`=71 WHERE entry=11290;
-- QUALITY CHANGED: Greater Mystic Wand (ilevel 35 entry 11290)
UPDATE item_template SET Quality=1 WHERE entry=11290;
-- SPELLS CHANGED: Flameseer Mantle (ilevel 47 entry 11310). 4 versions
-- Source: http://www.thottbot.com/?n=885271
-- Source: http://www.thottbot.com/?i=Flameseer%20Mantle / http://wow.allakhazam.com/dyn/items/iname3.html
-- Source: http://www.thottbot.com/?n=482012 / http://wow.allakhazam.com/item.html?witem=11310
-- Source: http://www.thottbot.com/?i=Flameseer%20Mantle
-- * Modified spell 1
-- 1.12 spell 9401 (Increases damage done by Fire spells and effects by up to 14.)
-- 1.04 spell 23481 (Increases damage done by Fire spells and effects by up to 14.)
UPDATE item_template SET `spellid_1`=23481 WHERE entry=11310;
-- STATS CHANGED: Spritecaster Cape (ilevel 52 entry 11623). 1/2 versions
UPDATE item_template SET `stat_value1`=2, `stat_value3`=10, `armor`=34 WHERE entry=11623;
-- SPELLS REMOVED: Spritecaster Cape (ilevel 52 entry 11623). 2 versions
-- Source: http://www.thottbot.com/?n=7906
-- Source: http://www.thottbot.com/?n=7906 / http://wow.allakhazam.com/dyn/items/iname16.html
-- * Modified spell 1
-- 1.12 spell 9343 (Increases damage and healing done by magical spells and effects by up to 14.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=11623;
-- QUALITY CHANGED: Spritecaster Cape (ilevel 52 entry 11623)
UPDATE item_template SET Quality=2 WHERE entry=11623;
-- STATS CHANGED: Kentic Amice (ilevel 52 entry 11624). 1/2 versions
UPDATE item_template SET `stat_value2`=7, `stat_value3`=0, `armor`=51 WHERE entry=11624;
-- SPELLS REMOVED: Kentic Amice (ilevel 52 entry 11624). 2 versions
-- Source: http://www.thottbot.com/?n=7906 / http://wow.allakhazam.com/profile.html?58232
-- Source: http://www.thottbot.com/?n=7906
-- * Modified spell 1
-- 1.12 spell 9343 (Increases damage and healing done by magical spells and effects by up to 14.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=11624;
-- QUALITY CHANGED: Kentic Amice (ilevel 52 entry 11624)
UPDATE item_template SET Quality=2 WHERE entry=11624;
-- STATS CHANGED: Blackveil Cape (ilevel 53 entry 11626). 1/2 versions
UPDATE item_template SET `stat_value1`=5, `stat_value2`=10, `armor`=34 WHERE entry=11626;
-- QUALITY CHANGED: Blackveil Cape (ilevel 53 entry 11626)
UPDATE item_template SET Quality=2 WHERE entry=11626;
-- STATS CHANGED: Fleetfoot Greaves (ilevel 53 entry 11627). 1/1 versions
UPDATE item_template SET `stat_value1`=15, `stat_value2`=0, `stat_value3`=0, `stat_type4`=6, `stat_value4`=5, `armor`=198 WHERE entry=11627;
-- QUALITY CHANGED: Fleetfoot Greaves (ilevel 53 entry 11627)
UPDATE item_template SET Quality=2 WHERE entry=11627;
-- STATS REMOVED for item Houndmaster's Rifle (http://www.thottbot.com/?n=7926 / http://wow.allakhazam.com/item.html?witem=11629) 
UPDATE item_template SET stat_value1=0, stat_type1=0 WHERE entry=11629;
-- STATS CHANGED: Stoneshell Guard (ilevel 52 entry 11631). 1/3 versions
UPDATE item_template SET `stat_value1`=5, `stat_value2`=0, `armor`=1706 WHERE entry=11631;
-- QUALITY CHANGED: Stoneshell Guard (ilevel 52 entry 11631)
UPDATE item_template SET Quality=2 WHERE entry=11631;
-- STATS CHANGED: Earthslag Shoulders (ilevel 52 entry 11632). 1/2 versions
UPDATE item_template SET `stat_value1`=11, `stat_value2`=0, `stat_value3`=0, `stat_type4`=6, `stat_value4`=11, `armor`=373 WHERE entry=11632;
-- SPELLS REMOVED: Earthslag Shoulders (ilevel 52 entry 11632). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype3.html
-- Source: http://www.thottbot.com/?n=60587 / http://wow.allakhazam.com/item.html?witem=11632
-- * Modified spell 1
-- 1.12 spell 9415 (Increases damage and healing done by magical spells and effects by up to 9.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=11632;
-- QUALITY CHANGED: Earthslag Shoulders (ilevel 52 entry 11632)
UPDATE item_template SET Quality=2 WHERE entry=11632;
-- STATS CHANGED: Spiderfang Carapace (ilevel 54 entry 11633). 1/1 versions
UPDATE item_template SET `stat_value1`=16, `stat_value3`=0, `stat_type4`=3, `stat_value4`=3, `armor`=515 WHERE entry=11633;
-- SPELLS REMOVED: Spiderfang Carapace (ilevel 54 entry 11633). 1 versions
-- Source: http://www.thottbot.com/?n=18911 / http://wow.allakhazam.com/dyn/items/itype5.html
-- * Modified spell 1
-- 1.12 spell 9342 (Increases damage and healing done by magical spells and effects by up to 13.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=11633;
-- QUALITY CHANGED: Spiderfang Carapace (ilevel 54 entry 11633)
UPDATE item_template SET Quality=2 WHERE entry=11633;
-- STATS CHANGED: Silkweb Gloves (ilevel 54 entry 11634). 1/1 versions
UPDATE item_template SET `stat_value1`=12, `stat_value2`=11, `armor`=44 WHERE entry=11634;
-- SPELLS REMOVED: Silkweb Gloves (ilevel 54 entry 11634). 1 versions
-- Source: http://www.thottbot.com/?n=18911 / http://wow.allakhazam.com/item.html?witem=11634
-- * Modified spell 1
-- 1.12 spell 21625 (Restores 3 mana per 5 sec.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=11634;
-- QUALITY CHANGED: Silkweb Gloves (ilevel 54 entry 11634)
UPDATE item_template SET Quality=2 WHERE entry=11634;
-- STATS CHANGED: Ban'thok Sash (ilevel 54 entry 11662). 1/1 versions
UPDATE item_template SET `stat_value2`=12, `armor`=39 WHERE entry=11662;
-- SPELLS REMOVED: Ban'thok Sash (ilevel 54 entry 11662). 1 versions
-- Source: http://www.thottbot.com/?n=12584
-- * Modified spell 1
-- 1.12 spell 23727 (Improves your chance to hit with spells by 1%.)
-- 1.04 spell 0
-- * Modified spell 2
-- 1.12 spell 9417 (Increases damage and healing done by magical spells and effects by up to 12.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=11662;
-- QUALITY CHANGED: Ban'thok Sash (ilevel 54 entry 11662)
UPDATE item_template SET Quality=2 WHERE entry=11662;
-- STATS CHANGED: Ogreseer Fists (ilevel 54 entry 11665). 1/1 versions
UPDATE item_template SET `stat_value1`=0, `stat_value3`=10, `stat_type4`=4, `stat_value4`=4, `armor`=88 WHERE entry=11665;
-- SPELLS REMOVED: Ogreseer Fists (ilevel 54 entry 11665). 1 versions
-- Source: http://www.thottbot.com/?n=12584 / http://wow.allakhazam.com/item.html?witem=11665
-- * Modified spell 1
-- 1.12 spell 9342 (Increases damage and healing done by magical spells and effects by up to 13.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=11665;
-- QUALITY CHANGED: Ogreseer Fists (ilevel 54 entry 11665)
UPDATE item_template SET Quality=2 WHERE entry=11665;
-- STATS CHANGED: Naglering (ilevel 59 entry 11669). 2/3 versions
-- CONFLICT:
-- 2005-04-19 16:30:00 to 2006-03-07 11:49:49 (days delta 329) on for example: http://www.thottbot.com/?n=389685 / http://wow.allakhazam.com/item.html?witem=11669
-- 2005-02-23 01:05:58 to 2005-09-05 22:28:57 (days delta 199) on for example: http://wow.allakhazam.com/dyn/items/iname11.html
-- 2005-05-11 07:37:06 to 2005-05-11 07:37:06 (days delta 0) on for example: http://www.thottbot.com/?i=Naglering
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=0, `armor`=0, `arcane_res`=10 WHERE entry=11669;
-- SPELLS CHANGED: Naglering (ilevel 59 entry 11669). 3 versions
-- Source: http://www.thottbot.com/?n=389685 / http://wow.allakhazam.com/item.html?witem=11669
-- Source: http://wow.allakhazam.com/dyn/items/iname11.html
-- Source: http://www.thottbot.com/?i=Naglering
-- * Modified spell 2
-- 1.12 spell 13383 (Increased Defense +5.)
-- 1.04 spell 15464 (Improves your chance to hit by 1%.)
UPDATE item_template SET `spellid_2`=15464 WHERE entry=11669;
-- STATS CHANGED: Shadefiend Boots (ilevel 55 entry 11675). 1/2 versions
UPDATE item_template SET `stat_value1`=4, `stat_value2`=6, `stat_value3`=9, `armor`=99 WHERE entry=11675;
-- QUALITY CHANGED: Shadefiend Boots (ilevel 55 entry 11675)
UPDATE item_template SET Quality=2 WHERE entry=11675;
-- STATS CHANGED: Graverot Cape (ilevel 55 entry 11677). 2/2 versions
-- CONFLICT:
-- 2005-02-07 03:14:47 to 2006-02-09 03:29:44 (days delta 374) on for example: http://www.thottbot.com/?n=51348 / http://wow.allakhazam.com/dyn/items/iname16.html
-- 2005-05-20 04:39:48 to 2005-08-27 00:10:04 (days delta 100) on for example: http://wow.allakhazam.com/db/item.html?entryid=32204
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=11, `armor`=60 WHERE entry=11677;
-- QUALITY CHANGED: Graverot Cape (ilevel 55 entry 11677)
UPDATE item_template SET Quality=2 WHERE entry=11677;
-- STATS CHANGED: Rubicund Armguards (ilevel 55 entry 11679). 1/2 versions
UPDATE item_template SET `stat_value1`=11, `stat_value2`=6, `armor`=130 WHERE entry=11679;
-- QUALITY CHANGED: Rubicund Armguards (ilevel 55 entry 11679)
UPDATE item_template SET Quality=2 WHERE entry=11679;
-- STATS CHANGED: Splinthide Shoulders (ilevel 55 entry 11685). 1/2 versions
UPDATE item_template SET `stat_value1`=12, `stat_value2`=0, `stat_value3`=0, `stat_type4`=6, `stat_value4`=12, `armor`=108 WHERE entry=11685;
-- SPELLS REMOVED: Splinthide Shoulders (ilevel 55 entry 11685). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype3.html
-- Source: http://www.thottbot.com/?n=617390 / http://wow.allakhazam.com/item.html?witem=11685
-- * Modified spell 1
-- 1.12 spell 9415 (Increases damage and healing done by magical spells and effects by up to 9.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=11685;
-- QUALITY CHANGED: Splinthide Shoulders (ilevel 55 entry 11685)
UPDATE item_template SET Quality=2 WHERE entry=11685;
-- STATS CHANGED: Grizzle's Skinner (ilevel 55 entry 11702). 1/3 versions
UPDATE item_template SET `stat_value1`=5, `stat_value3`=5 WHERE entry=11702;
-- DAMAGE CHANGED: Grizzle's Skinner (ilevel 55 entry 11702). 1/3 versions
-- Source: http://www.thottbot.com/?n=7910 / http://wow.allakhazam.com/item.html?witem=11702
-- Source: http://wow.allakhazam.com/dyn/items/wname0.html
-- Source: http://www.thottbot.com/?i=Grizzle%27s%20Skinner
UPDATE item_template SET `dmg_min1`=55, `dmg_max1`=103 WHERE entry=11702;
-- QUALITY CHANGED: Grizzle's Skinner (ilevel 55 entry 11702)
UPDATE item_template SET Quality=2 WHERE entry=11702;
-- STATS CHANGED: Stonewall Girdle (ilevel 55 entry 11703). 1/1 versions
UPDATE item_template SET `stat_value1`=5, `armor`=455 WHERE entry=11703;
-- QUALITY CHANGED: Stonewall Girdle (ilevel 55 entry 11703)
UPDATE item_template SET Quality=2 WHERE entry=11703;
-- STATS CHANGED: Savage Gladiator Chain (ilevel 57 entry 11726). 1/2 versions
UPDATE item_template SET `stat_value2`=0, `stat_value3`=0 WHERE entry=11726;
-- SPELLS CHANGED: Savage Gladiator Chain (ilevel 57 entry 11726). 2 versions
-- Source: http://www.thottbot.com/?i=Savage%20Gladiator%20Grips / http://wow.allakhazam.com/dyn/items/itype5.html
-- Source: http://www.thottbot.com/?i=17909
-- * Modified spell 1
-- 1.12 spell 0
-- 1.04 spell 21416 (Increased Defense +20.)
UPDATE item_template SET `spellid_1`=21416, `spelltrigger_1`=1 WHERE entry=11726;
-- STATS CHANGED: Savage Gladiator Leggings (ilevel 57 entry 11728). 3/4 versions
-- CONFLICT:
-- 2005-02-28 02:35:00 to 2006-03-14 03:17:14 (days delta 389) on for example: http://www.thottbot.com/?n=82516
-- 2005-02-06 22:11:18 to 2006-02-16 11:30:31 (days delta 382) on for example: http://www.thottbot.com/?i=Savage%20Gladiator%20Grips / http://wow.allakhazam.com/item.html?witem=11728
-- 2005-05-27 16:23:47 to 2005-05-27 16:23:47 (days delta 0) on for example: http://wow.allakhazam.com/db/item.html?entryid=34163
-- 2005-05-27 16:21:13 to 2005-05-27 16:21:13 (days delta 0) on for example: http://wow.allakhazam.com/db/item.html?entryid=27536
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=0, `stat_value2`=25, `stat_value3`=25, `stat_type4`=1, `stat_value4`=25, `armor`=345 WHERE entry=11728;
-- STATS CHANGED: Savage Gladiator Helm (ilevel 57 entry 11729). 1/2 versions
UPDATE item_template SET `stat_value2`=0, `stat_type3`=6, `stat_value3`=12 WHERE entry=11729;
-- STATS CHANGED: Savage Gladiator Grips (ilevel 57 entry 11730). 1/2 versions
UPDATE item_template SET `stat_value2`=0, `stat_value4`=0, `stat_type5`=6, `stat_value5`=14 WHERE entry=11730;
-- STATS CHANGED: Savage Gladiator Greaves (ilevel 57 entry 11731). 1/2 versions
UPDATE item_template SET `stat_value1`=13, `stat_value2`=13 WHERE entry=11731;
-- STATS CHANGED: Fists of Phalanx (ilevel 56 entry 11745). 1/1 versions
UPDATE item_template SET `stat_value1`=17, `stat_value2`=2, `armor`=334 WHERE entry=11745;
-- QUALITY CHANGED: Fists of Phalanx (ilevel 56 entry 11745)
UPDATE item_template SET Quality=2 WHERE entry=11745;
-- SPELLS CHANGED: Golem Skull Helm (ilevel 56 entry 11746). 2 versions
-- Source: http://www.thottbot.com/?n=303930 / http://wow.allakhazam.com/profile.html?55827
-- Source: http://www.thottbot.com/?i=Golem%20Skull%20Helm
-- * Modified spell 1
-- 1.12 spell 13386 (Increased Defense +7.)
-- 1.04 spell 21407 (Increased Defense +11.)
UPDATE item_template SET `spellid_1`=21407 WHERE entry=11746;
-- STATS CHANGED: Flamestrider Robes (ilevel 53 entry 11747). 1/2 versions
UPDATE item_template SET `stat_value1`=25 WHERE entry=11747;
-- SPELLS REMOVED: Flamestrider Robes (ilevel 53 entry 11747). 2 versions
-- Source: http://www.thottbot.com/?n=22773 / http://wow.allakhazam.com/dyn/items/iname20.html
-- Source: http://www.thottbot.com/?i=Flamestrider%20Robes
-- * Modified spell 1
-- 1.12 spell 14799 (Increases damage and healing done by magical spells and effects by up to 20.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=11747;
-- STATS CHANGED: Searingscale Leggings (ilevel 53 entry 11749). 1/2 versions
UPDATE item_template SET `stat_value1`=25, `stat_value2`=10, `stat_value3`=0, `stat_value4`=0 WHERE entry=11749;
-- STATS CHANGED: Kindling Stave (ilevel 53 entry 11750). 3/5 versions
-- CONFLICT:
-- 2005-01-17 03:15:32 to 2006-02-21 17:18:50 (days delta 407) on for example: http://www.thottbot.com/?n=22773 / http://wow.allakhazam.com/item.html?witem=11750
-- 2005-01-16 04:34:53 to 2005-08-30 01:20:41 (days delta 231) on for example: http://wow.allakhazam.com/dyn/items/wminlev10.html
-- 2005-05-23 15:19:17 to 2005-05-23 15:19:17 (days delta 0) on for example: http://wow.allakhazam.com/db/item.html?entryid=26536
-- 2005-05-17 18:53:50 to 2005-05-19 13:39:52 (days delta 2) on for example: http://www.thottbot.com/?i=Kindling%20Stave
-- 2005-02-22 15:17:37 to 2005-02-22 15:17:37 (days delta 0) on for example: http://www.thottbot.com/?i=Kindling%20Stave
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=25, `stat_value3`=0 WHERE entry=11750;
-- SPELLS REMOVED: Kindling Stave (ilevel 53 entry 11750). 5 versions
-- Source: http://www.thottbot.com/?n=22773 / http://wow.allakhazam.com/item.html?witem=11750
-- Source: http://wow.allakhazam.com/dyn/items/wminlev10.html
-- Source: http://wow.allakhazam.com/db/item.html?entryid=26536
-- Source: http://www.thottbot.com/?i=Kindling%20Stave
-- Source: http://www.thottbot.com/?i=Kindling%20Stave
-- * Modified spell 1
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=11750;
-- STATS CHANGED: Boreal Mantle (ilevel 57 entry 11782). 2/2 versions
-- CONFLICT:
-- 2005-01-16 02:43:04 to 2006-03-28 18:05:00 (days delta 446) on for example: http://www.thottbot.com/?n=618164 / http://wow.allakhazam.com/dyn/items/iname3.html
-- 2005-01-17 05:07:55 to 2005-01-17 05:07:55 (days delta 0) on for example: http://wow.allakhazam.com/db/item.html?witem=11782
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `frost_res`=10 WHERE entry=11782;
-- STATS CHANGED: Arbiter's Blade (ilevel 53 entry 11784). 1/3 versions
UPDATE item_template SET `stat_value1`=6, `stat_value2`=0, `stat_type3`=6, `stat_value3`=10 WHERE entry=11784;
-- SPELLS REMOVED: Arbiter's Blade (ilevel 53 entry 11784). 3 versions
-- Source: http://www.thottbot.com/?n=618164 / http://wow.allakhazam.com/item.html?witem=11784
-- Source: http://wow.allakhazam.com/dyn/items/wminlev7.html
-- Source: http://www.thottbot.com/?i=Arbiter%27s%20Blade
-- * Modified spell 1
-- 1.12 spell 9398 (Increases damage and healing done by magical spells and effects by up to 8.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=11784;
-- STATS CHANGED: Rock Golem Bulwark (ilevel 58 entry 11785). 2/3 versions
-- CONFLICT:
-- 2005-02-17 23:56:17 to 2006-12-31 20:28:41 (days delta 696) on for example: http://www.thottbot.com/?n=7918 / http://wow.allakhazam.com/profile.html?103342
-- 2005-01-16 02:35:23 to 2005-09-16 12:10:00 (days delta 248) on for example: http://wow.allakhazam.com/dyn/items/iname14.html
-- 2005-04-30 20:12:37 to 2005-05-19 04:02:36 (days delta 20) on for example: http://www.thottbot.com/?i=Rock%20Golem%20Bulwark
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `nature_res`=0, `arcane_res`=15 WHERE entry=11785;
-- STATS CHANGED: Lavacrest Leggings (ilevel 58 entry 11802). 1/2 versions
UPDATE item_template SET `stat_value1`=20, `armor`=483 WHERE entry=11802;
-- QUALITY CHANGED: Lavacrest Leggings (ilevel 58 entry 11802)
UPDATE item_template SET Quality=2 WHERE entry=11802;
-- STATS REMOVED for item Force of Magma (http://www.thottbot.com/?n=304443 / http://wow.allakhazam.com/item.html?witem=11803) 
UPDATE item_template SET stat_value1=0, stat_type1=0 WHERE entry=11803;
-- DAMAGE CHANGED: Force of Magma (ilevel 56 entry 11803). 1/5 versions
-- Source: http://www.thottbot.com/?n=304443 / http://wow.allakhazam.com/item.html?witem=11803
-- Source: http://wow.allakhazam.com/dyn/items/itype17.html
-- Source: http://wow.allakhazam.com/dyn/items/wminlev5.html
-- Source: http://wow.allakhazam.com/dyn/items/wname5.html
-- Source: http://www.thottbot.com/?i=7143
UPDATE item_template SET `dmg_min1`=111, `dmg_max1`=167 WHERE entry=11803;
-- QUALITY CHANGED: Force of Magma (ilevel 56 entry 11803)
UPDATE item_template SET Quality=2 WHERE entry=11803;
-- STATS CHANGED: Sash of the Burning Heart (ilevel 58 entry 11807). 1/1 versions
UPDATE item_template SET `stat_value1`=15, `stat_value3`=0 WHERE entry=11807;
-- SPELLS CHANGED: Sash of the Burning Heart (ilevel 58 entry 11807). 1 versions
-- Source: http://www.thottbot.com/?n=304443 / http://wow.allakhazam.com/db/item.html?witem=11807
-- * Modified spell 1
-- 1.12 spell 9401 (Increases damage done by Fire spells and effects by up to 14.)
-- 1.04 spell 23480 (Increases damage done by Fire spells and effects by up to 10.)
UPDATE item_template SET `spellid_1`=23480 WHERE entry=11807;
-- STATS CHANGED: Circle of Flame (ilevel 59 entry 11808). 1/2 versions
UPDATE item_template SET `stat_value1`=0, `stat_type2`=6, `stat_value2`=15 WHERE entry=11808;
-- SPELLS CHANGED: Force of Will (ilevel 60 entry 11810). 1 versions
-- Source: http://www.thottbot.com/?n=373747 / http://wow.allakhazam.com/item.html?witem=11810
-- * Modified spell 2
-- 1.12 spell 13385 (Increased Defense +7.)
-- 1.04 spell 13390 (Increased Defense +10.)
UPDATE item_template SET `spellid_2`=13390 WHERE entry=11810;
-- STATS CHANGED: Cape of the Fire Salamander (ilevel 58 entry 11812). 3/4 versions
-- CONFLICT:
-- 2005-02-07 00:23:15 to 2006-02-14 04:13:35 (days delta 379) on for example: http://www.thottbot.com/?n=197360 / http://wow.allakhazam.com/item.html?witem=11812
-- 2005-04-27 23:15:31 to 2005-08-25 18:43:10 (days delta 122) on for example: http://wow.allakhazam.com/db/item.html?entryid=32174
-- 2005-05-09 19:48:12 to 2005-05-11 08:45:56 (days delta 2) on for example: http://www.thottbot.com/?i=Cape%20of%20the%20Fire%20Salamander
-- 2005-04-27 23:10:32 to 2005-04-27 23:10:32 (days delta 0) on for example: http://wow.allakhazam.com/db/item.html?entryid=25897
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=10, `stat_value2`=5, `armor`=181, `fire_res`=20 WHERE entry=11812;
-- STATS CHANGED: Molten Fists (ilevel 58 entry 11814). 1/2 versions
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `stat_value3`=0 WHERE entry=11814;
-- STATS CHANGED: Angerforge's Battle Axe (ilevel 56 entry 11816). 1/3 versions
UPDATE item_template SET `stat_value1`=22, `stat_value2`=7 WHERE entry=11816;
-- DAMAGE CHANGED: Angerforge's Battle Axe (ilevel 56 entry 11816). 1/3 versions
-- Source: http://www.thottbot.com/?n=616413 / http://wow.allakhazam.com/item.html?witem=11816
-- Source: http://wow.allakhazam.com/dyn/items/wname1.html
-- Source: http://www.thottbot.com/?i=12387
UPDATE item_template SET `dmg_min1`=90, `dmg_max1`=136 WHERE entry=11816;
-- QUALITY CHANGED: Angerforge's Battle Axe (ilevel 56 entry 11816)
UPDATE item_template SET Quality=2 WHERE entry=11816;
-- STATS CHANGED: Royal Decorated Armor (ilevel 58 entry 11820). 1/1 versions
UPDATE item_template SET `stat_value1`=7, `stat_value2`=22, `stat_value3`=0, `armor`=313 WHERE entry=11820;
-- QUALITY CHANGED: Royal Decorated Armor (ilevel 58 entry 11820)
UPDATE item_template SET Quality=2 WHERE entry=11820;
-- STATS CHANGED: Omnicast Boots (ilevel 59 entry 11822). 1/1 versions
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `armor`=52 WHERE entry=11822;
-- SPELLS CHANGED: Omnicast Boots (ilevel 59 entry 11822). 1 versions
-- Source: http://www.thottbot.com/?n=389685 / http://wow.allakhazam.com/item.html?witem=11822
-- * Modified spell 1
-- 1.12 spell 15714 (Increases damage and healing done by magical spells and effects by up to 22.)
-- 1.04 spell 9343 (Increases damage and healing done by magical spells and effects by up to 14.)
UPDATE item_template SET `spellid_1`=9343 WHERE entry=11822;
-- QUALITY CHANGED: Omnicast Boots (ilevel 59 entry 11822)
UPDATE item_template SET Quality=2 WHERE entry=11822;
-- STATS CHANGED: Luminary Kilt (ilevel 59 entry 11823). 1/1 versions
UPDATE item_template SET `stat_value1`=17, `stat_value2`=17, `stat_value3`=0, `armor`=133 WHERE entry=11823;
-- SPELLS REMOVED: Luminary Kilt (ilevel 59 entry 11823). 1 versions
-- Source: http://www.thottbot.com/?n=389685 / http://wow.allakhazam.com/item.html?witem=11823
-- * Modified spell 1
-- 1.12 spell 15714 (Increases damage and healing done by magical spells and effects by up to 22.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=11823;
-- QUALITY CHANGED: Luminary Kilt (ilevel 59 entry 11823)
UPDATE item_template SET Quality=2 WHERE entry=11823;
-- STATS CHANGED: Cyclopean Band (ilevel 54 entry 11824). 1/2 versions
UPDATE item_template SET `stat_value1`=15, `stat_value3`=4, `stat_value4`=0 WHERE entry=11824;
-- SPELLS REMOVED: Cyclopean Band (ilevel 54 entry 11824). 2 versions
-- Source: http://www.thottbot.com/?n=12584 / http://wow.allakhazam.com/profile.html?47143
-- Source: http://www.thottbot.com/?i=Cyclopean%20Band
-- * Modified spell 1
-- 1.12 spell 9415 (Increases damage and healing done by magical spells and effects by up to 9.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=11824;
-- STATS CHANGED: Senior Designer's Pantaloons (ilevel 55 entry 11841). 1/2 versions
UPDATE item_template SET `stat_value1`=20, `stat_value2`=9, `stat_value3`=0, `armor`=62 WHERE entry=11841;
-- SPELLS REMOVED: Senior Designer's Pantaloons (ilevel 55 entry 11841). 2 versions
-- Source: http://www.thottbot.com/?n=7896
-- Source: http://www.thottbot.com/?n=7896 / http://wow.allakhazam.com/item.html?witem=11841
-- * Modified spell 1
-- 1.12 spell 18031 (Increases healing done by spells and effects by up to 40.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=11841;
-- QUALITY CHANGED: Senior Designer's Pantaloons (ilevel 55 entry 11841)
UPDATE item_template SET Quality=2 WHERE entry=11841;
-- STATS CHANGED: Lead Surveyor's Mantle (ilevel 55 entry 11842). 1/2 versions
UPDATE item_template SET `armor`=223 WHERE entry=11842;
-- SPELLS REMOVED: Lead Surveyor's Mantle (ilevel 55 entry 11842). 2 versions
-- Source: http://www.thottbot.com/?n=7896 / http://wow.allakhazam.com/dyn/items/itype3.html
-- Source: http://www.thottbot.com/?n=7896
-- * Modified spell 1
-- 1.12 spell 9344 (Increases damage and healing done by magical spells and effects by up to 15.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=11842;
-- QUALITY CHANGED: Lead Surveyor's Mantle (ilevel 55 entry 11842)
UPDATE item_template SET Quality=2 WHERE entry=11842;
-- STATS REMOVED for item Blood-etched Blade (http://www.thottbot.com/?n=7901 / http://wow.allakhazam.com/item.html?witem=11922) 
UPDATE item_template SET stat_value1=0, stat_type1=0 WHERE entry=11922;
-- DAMAGE CHANGED: Blood-etched Blade (ilevel 57 entry 11922). 1/2 versions
-- Source: http://www.thottbot.com/?n=7901 / http://wow.allakhazam.com/item.html?witem=11922
-- Source: http://wow.allakhazam.com/dyn/items/wminlev15.html
UPDATE item_template SET `dmg_min1`=21, `dmg_max1`=40 WHERE entry=11922;
-- SPELLS CHANGED: Blood-etched Blade (ilevel 57 entry 11922). 2 versions
-- Source: http://www.thottbot.com/?n=7901 / http://wow.allakhazam.com/item.html?witem=11922
-- Source: http://wow.allakhazam.com/dyn/items/wminlev15.html
-- * Modified spell 1
-- 1.12 spell 9396 (Increases damage and healing done by magical spells and effects by up to 6.)
-- 1.04 spell 15695 (Wounds the target for 120 damage and converts that damage into mana to you.)
UPDATE item_template SET `spellid_1`=15695, `spelltrigger_1`=2 WHERE entry=11922;
-- STATS CHANGED: Robes of the Royal Crown (ilevel 60 entry 11924). 1/2 versions
UPDATE item_template SET `stat_value1`=29, `stat_value2`=9, `stat_value3`=5, `stat_type4`=3, `stat_value4`=3 WHERE entry=11924;
-- SPELLS REMOVED: Robes of the Royal Crown (ilevel 60 entry 11924). 2 versions
-- Source: http://www.thottbot.com/?n=624922
-- Source: http://www.thottbot.com/?n=373747 / http://wow.allakhazam.com/profile.html?55827
-- * Modified spell 1
-- 1.12 spell 9346 (Increases damage and healing done by magical spells and effects by up to 18.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=11924;
-- SPELLS REMOVED: Legplates of the Eternal Guardian (ilevel 57 entry 11927). 2 versions
-- Source: http://www.thottbot.com/?n=7901 / http://wow.allakhazam.com/profile.html?26338
-- Source: http://www.thottbot.com/?i=8477
-- * Modified spell 1
-- 1.12 spell 0
-- 1.04 spell 21418 (Increased Defense +22.)
-- * Modified spell 2
-- 1.12 spell 18196 (Increased Defense +15.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_2`=0, `spelltrigger_2`=0, `spellid_1`=21418, `spelltrigger_1`=1 WHERE entry=11927;
-- STATS CHANGED: Thaurissan's Royal Scepter (ilevel 60 entry 11928). 1/2 versions
UPDATE item_template SET `stat_value1`=15 WHERE entry=11928;
-- SPELLS REMOVED: Thaurissan's Royal Scepter (ilevel 60 entry 11928). 2 versions
-- Source: http://www.thottbot.com/?n=373747 / http://wow.allakhazam.com/item.html?witem=11928
-- Source: http://www.thottbot.com/?i=Thaurissan%27s%20Royal%20Scepter
-- * Modified spell 1
-- 1.12 spell 9408 (Increases healing done by spells and effects by up to 22.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=11928;
-- STATS CHANGED: Guiding Stave of Wisdom (ilevel 59 entry 11932). 1/3 versions
UPDATE item_template SET `stat_value1`=29, `stat_value2`=10 WHERE entry=11932;
-- SPELLS REMOVED: Guiding Stave of Wisdom (ilevel 59 entry 11932). 3 versions
-- Source: http://www.thottbot.com/?n=373747 / http://wow.allakhazam.com/item.html?witem=11932
-- Source: http://wow.allakhazam.com/dyn/items/wminlev10.html
-- Source: http://www.thottbot.com/?n=259546
-- * Modified spell 1
-- 1.12 spell 15696 (Increases healing done by spells and effects by up to 53.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=11932;
-- STATS CHANGED: Star of Mystaria (ilevel 63 entry 12103). 1/3 versions
UPDATE item_template SET `stat_value1`=9, `stat_type4`=3, `stat_value4`=7 WHERE entry=12103;
-- SPELLS REMOVED: Star of Mystaria (ilevel 63 entry 12103). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname2.html
-- Source: http://www.thottbot.com/?n=613238 / http://wow.allakhazam.com/profile.html?4474
-- Source: http://www.thottbot.com/?i=Star%20of%20Mystaria
-- * Modified spell 1
-- 1.12 spell 23727 (Improves your chance to hit with spells by 1%.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=12103;
-- SPELLS CHANGED: Sunborne Cape (ilevel 56 entry 12113). 5 versions
-- Source: http://www.thottbot.com/?i=5158 / http://wow.allakhazam.com/item.html?witem=12113
-- Source: http://www.thottbot.com/?n=127480
-- Source: http://www.thottbot.com/?i=5158 / http://wow.allakhazam.com/item.html?witem=12113
-- Source: http://www.thottbot.com/?i=5158
-- Source: http://www.thottbot.com/?i=5158
-- * Modified spell 1
-- 1.12 spell 9295 (Increases damage done by Fire spells and effects by up to 17.)
-- 1.04 spell 23482 (Increases damage done by Fire spells and effects by up to 17.)
UPDATE item_template SET `spellid_1`=23482 WHERE entry=12113;
-- SPELLS CHANGED: Searing Golden Blade (ilevel 39 entry 12260). 6 versions
-- Source: http://www.thottbot.com/?i=Steel%20Bar
-- Source: http://www.thottbot.com/?i=Heavy%20Leather / http://wow.allakhazam.com/dyn/items/wratio15.html
-- Source: http://wow.allakhazam.com/dyn/items/wminlev15.html
-- Source: http://www.thottbot.com/?i=Gold%20Bar / http://wow.allakhazam.com/db/price.html?witem=12260
-- Source: http://www.thottbot.com/?i=Searing%20Golden%20Blade
-- Source: http://www.thottbot.com/?i=Searing%20Golden%20Blade
-- * Modified spell 1
-- 1.12 spell 7689 (Increases damage done by Fire spells and effects by up to 10.)
-- 1.04 spell 23480 (Increases damage done by Fire spells and effects by up to 10.)
UPDATE item_template SET `spellid_1`=23480 WHERE entry=12260;
-- DAMAGE CHANGED: The Judge's Gavel (ilevel 52 entry 12400). 1/3 versions
-- Source: http://www.thottbot.com/?n=7952
-- Source: http://www.thottbot.com/?n=82756
-- Source: http://wow.allakhazam.com/item.html?witem=12528
UPDATE item_template SET `delay`=2900, `dmg_min1`=104, `dmg_max1`=157 WHERE entry=12400;
-- SPELLS CHANGED: The Judge's Gavel (ilevel 52 entry 12400). 3 versions
-- Source: http://www.thottbot.com/?n=7952
-- Source: http://www.thottbot.com/?n=82756
-- Source: http://wow.allakhazam.com/item.html?witem=12528
-- * Modified spell 1
-- 1.12 spell 56 (Stuns target for 3 sec.)
-- 1.04 spell 16451 (Imprisons enemy target, preventing all action but making it invulnerable for up to 10 sec.)
UPDATE item_template SET `spellid_1`=16451 WHERE entry=12400;
-- NOT FOUND: Desertwalker Cane (ilevel 47 entry 12471)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 12471);
-- SPELLS REMOVED: The Judge's Gavel (ilevel 52 entry 12528). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype17.html
-- Source: http://wow.allakhazam.com/dyn/items/wratio5.html
-- Source: http://wow.allakhazam.com/dyn/items/wminlev5.html
-- * Modified spell 1
-- 1.12 spell 56 (Stuns target for 3 sec.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=12528;
-- STATS CHANGED: Spire of the Stoneshaper (ilevel 56 entry 12532). 1/3 versions
UPDATE item_template SET `stat_value1`=0, `stat_type3`=6, `stat_value3`=20 WHERE entry=12532;
-- STATS CHANGED: Funeral Pyre Vestment (ilevel 51 entry 12542). 1/3 versions
UPDATE item_template SET `stat_value1`=0, `stat_value2`=25, `stat_value3`=0, `shadow_res`=10 WHERE entry=12542;
-- STATS CHANGED: Mar Alom's Grip (ilevel 56 entry 12547). 1/3 versions
UPDATE item_template SET `stat_value1`=15, `stat_value2`=0, `stat_value3`=0 WHERE entry=12547;
-- SPELLS CHANGED: Runed Golem Shackles (ilevel 53 entry 12550). 2 versions
-- Source: http://www.thottbot.com/?n=7979
-- Source: http://www.thottbot.com/?n=7952 / http://wow.allakhazam.com/dyn/items/itype9.html
-- * Modified spell 1
-- 1.12 spell 7517 (Increased Defense +4.)
-- 1.04 spell 13384 (Increased Defense +6.)
UPDATE item_template SET `spellid_1`=13384 WHERE entry=12550;
-- STATS CHANGED: Ebonsteel Spaulders (ilevel 59 entry 12557). 1/1 versions
UPDATE item_template SET `stat_value1`=17, `stat_value2`=10, `stat_value3`=0, `stat_type4`=6, `stat_value4`=9, `armor`=463 WHERE entry=12557;
-- STATS CHANGED: Grand Marshal's Longsword (ilevel 78 entry 12584). 1/3 versions
UPDATE item_template SET `stat_value1`=6 WHERE entry=12584;
-- DAMAGE CHANGED: Grand Marshal's Longsword (ilevel 78 entry 12584). 1/3 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname13.html
-- Source: http://wow.allakhazam.com/dyn/items/wminlev7.html
-- Source: http://wow.allakhazam.com/item.html?witem=12584
UPDATE item_template SET `dmg_min1`=115, `dmg_max1`=173 WHERE entry=12584;
-- SPELLS CHANGED: Grand Marshal's Longsword (ilevel 78 entry 12584). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname13.html
-- Source: http://wow.allakhazam.com/dyn/items/wminlev7.html
-- Source: http://wow.allakhazam.com/item.html?witem=12584
-- * Modified spell 2
-- 1.12 spell 9335 (+28 Attack Power.)
-- 1.04 spell 9141 (+12 Attack Power.)
UPDATE item_template SET `spellid_2`=9141 WHERE entry=12584;
-- STATS CHANGED: Dustfeather Sash (ilevel 61 entry 12589). 1/2 versions
UPDATE item_template SET `stat_value1`=21 WHERE entry=12589;
-- SPELLS REMOVED: Dustfeather Sash (ilevel 61 entry 12589). 2 versions
-- Source: http://www.thottbot.com/?n=88420 / http://wow.allakhazam.com/db/item.html?witem=12589
-- Source: http://www.thottbot.com/?i=16556
-- * Modified spell 1
-- 1.12 spell 9415 (Increases damage and healing done by magical spells and effects by up to 9.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=12589;
-- DAMAGE CHANGED: Blackblade of Shahram (ilevel 63 entry 12592). 1/2 versions
-- Source: http://www.thottbot.com/?n=617127 / http://wow.allakhazam.com/item.html?witem=12592
-- Source: http://wow.allakhazam.com/dyn/items/wminlev8.html
UPDATE item_template SET `delay`=2300, `dmg_min1`=109, `dmg_max1`=164 WHERE entry=12592;
-- SPELLS CHANGED: Draconian Deflector (ilevel 63 entry 12602). 2 versions
-- Source: http://www.thottbot.com/?n=617127 / http://wow.allakhazam.com/profile.html?55827
-- Source: http://www.thottbot.com/?i=Draconian%20Deflector
-- * Modified spell 1
-- 1.12 spell 13390 (Increased Defense +10.)
-- 1.04 spell 21411 (Increased Defense +15.)
UPDATE item_template SET `spellid_1`=21411 WHERE entry=12602;
-- STATS CHANGED: Crystallized Girdle (ilevel 61 entry 12606). 2/3 versions
-- CONFLICT:
-- 2005-02-20 20:06:29 to 2005-09-07 00:35:48 (days delta 204) on for example: http://www.thottbot.com/?n=88420 / http://wow.allakhazam.com/profile.html?85661
-- 2005-05-13 21:55:47 to 2005-05-13 21:55:47 (days delta 0) on for example: http://wow.allakhazam.com/db/item.html?entryid=34706
-- 2005-05-02 16:42:28 to 2005-05-11 08:34:22 (days delta 9) on for example: http://www.thottbot.com/?i=Crystallized%20Girdle
UPDATE item_template SET `stat_value2`=22 WHERE entry=12606;
-- SPELLS REMOVED: Crystallized Girdle (ilevel 61 entry 12606). 3 versions
-- Source: http://www.thottbot.com/?n=88420 / http://wow.allakhazam.com/profile.html?85661
-- Source: http://wow.allakhazam.com/db/item.html?entryid=34706
-- Source: http://www.thottbot.com/?i=Crystallized%20Girdle
-- * Modified spell 1
-- 1.12 spell 9415 (Increases damage and healing done by magical spells and effects by up to 9.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=12606;
-- STATS CHANGED: Butcher's Apron (ilevel 58 entry 12608). 1/1 versions
UPDATE item_template SET `stat_value1`=4, `stat_value2`=12, `armor`=38 WHERE entry=12608;
-- QUALITY CHANGED: Butcher's Apron (ilevel 58 entry 12608)
UPDATE item_template SET Quality=2 WHERE entry=12608;
-- STATS CHANGED: Polychromatic Visionwrap (ilevel 61 entry 12609). 2/2 versions
-- CONFLICT:
-- 2005-02-24 01:16:42 to 2005-09-01 10:32:34 (days delta 194) on for example: http://wow.allakhazam.com/dyn/items/itype5.html
-- 2005-02-17 08:42:26 to 2005-05-18 00:13:30 (days delta 94) on for example: http://www.thottbot.com/?n=88420 / http://wow.allakhazam.com/item.html?witem=12609
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `armor`=0 WHERE entry=12609;
-- SPELLS CHANGED: Enchanted Thorium Breastplate (ilevel 63 entry 12618). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype5.html
-- Source: http://www.thottbot.com/?i=8859
-- * Modified spell 1
-- 1.12 spell 13388 (Increased Defense +9.)
-- 1.04 spell 18369 (Increased Defense +9.)
UPDATE item_template SET `spellid_1`=18369 WHERE entry=12618;
-- SPELLS CHANGED: Enchanted Thorium Helm (ilevel 62 entry 12620). 2 versions
-- Source: http://www.thottbot.com/?i=8859
-- Source: http://wow.allakhazam.com/dyn/items/iminlev1.html
-- * Modified spell 1
-- 1.12 spell 13388 (Increased Defense +9.)
-- 1.04 spell 21409 (Increased Defense +13.)
UPDATE item_template SET `spellid_1`=21409 WHERE entry=12620;
-- SPELLS REMOVED: Whitesoul Helm (ilevel 60 entry 12633). 6 versions
-- Source: http://www.thottbot.com/?i=Thorium%20Bar
-- Source: http://www.thottbot.com/?i=Whitesoul%20Helm
-- Source: http://www.thottbot.com/?i=Whitesoul%20Helm / http://wow.allakhazam.com/item.html?witem=12633
-- Source: http://www.thottbot.com/?i=Gold%20Bar / http://wow.allakhazam.com/item.html?witem=12633
-- Source: http://www.thottbot.com/?i=24516
-- Source: http://www.thottbot.com/?i=10302
-- * Modified spell 1
-- 1.12 spell 0
-- 1.04 spell 18029 (Increases healing done by spells and effects by up to 35.)
-- * Modified spell 2
-- 1.12 spell 18029 (Increases healing done by spells and effects by up to 35.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_2`=0, `spelltrigger_2`=0, `spellid_1`=18029, `spelltrigger_1`=1 WHERE entry=12633;
-- STATS CHANGED: Backusarian Gauntlets (ilevel 60 entry 12637). 1/3 versions
UPDATE item_template SET `stat_value2`=0, `stat_type4`=6, `stat_value4`=14 WHERE entry=12637;
-- SPELLS REMOVED: Backusarian Gauntlets (ilevel 60 entry 12637). 3 versions
-- Source: http://www.thottbot.com/?n=109215 / http://wow.allakhazam.com/dyn/items/iname10.html
-- Source: http://www.thottbot.com/?n=615450
-- Source: http://www.thottbot.com/?i=19465
-- * Modified spell 1
-- 1.12 spell 21618 (Restores 4 mana per 5 sec.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=12637;
-- SPELLS CHANGED: Invulnerable Mail (ilevel 63 entry 12641). 3 versions
-- Source: http://www.thottbot.com/?i=8859
-- Source: http://www.thottbot.com/?i=8859 / http://wow.allakhazam.com/item.html?witem=12641
-- Source: http://www.thottbot.com/?i=26827
-- * Modified spell 2
-- 1.12 spell 0
-- 1.04 spell 21416 (Increased Defense +20.)
-- * Modified spell 3
-- 1.12 spell 14249 (Increased Defense +13.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_3`=0, `spelltrigger_3`=0, `spellid_2`=21416, `spelltrigger_2`=1 WHERE entry=12641;
-- STATS REMOVED for item Blackcrow (http://wow.allakhazam.com/item.html?witem=12651) 
UPDATE item_template SET stat_value1=0, stat_type1=0 WHERE entry=12651;
-- STATS CHANGED: Mixologist's Tunic (ilevel 55 entry 12793). 1/3 versions
UPDATE item_template SET `stat_value1`=15, `stat_value2`=14, `stat_value3`=5, `armor`=144 WHERE entry=12793;
-- QUALITY CHANGED: Mixologist's Tunic (ilevel 55 entry 12793)
UPDATE item_template SET Quality=2 WHERE entry=12793;
-- STATS CHANGED: Wildfire Cape (ilevel 61 entry 12905). 1/1 versions
UPDATE item_template SET `armor`=39, `fire_res`=15 WHERE entry=12905;
-- QUALITY CHANGED: Wildfire Cape (ilevel 61 entry 12905)
UPDATE item_template SET Quality=2 WHERE entry=12905;
-- SPELLS CHANGED: Dal'Rend's Tribal Guardian (ilevel 63 entry 12939). 4 versions
-- Source: http://www.thottbot.com/?n=479925 / http://wow.allakhazam.com/item.html?witem=12939
-- Source: http://wow.allakhazam.com/dyn/items/wminlev7.html
-- Source: http://www.thottbot.com/?i=Dal%27Rend%27s%20Tribal%20Guardian
-- Source: http://www.thottbot.com/?i=18260
-- * Modified spell 1
-- 1.12 spell 13385 (Increased Defense +7.)
-- 1.04 spell 13390 (Increased Defense +10.)
UPDATE item_template SET `spellid_1`=13390 WHERE entry=12939;
-- NOT FOUND: Alex's Ring of Audacity (ilevel 60 entry 12947)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 12947);
-- STATS CHANGED: Spiritshroud Leggings (ilevel 63 entry 12965). 1/2 versions
UPDATE item_template SET `stat_value1`=21, `stat_value2`=21, `stat_value3`=10, `stat_type4`=3, `stat_value4`=5 WHERE entry=12965;
-- SPELLS REMOVED: Spiritshroud Leggings (ilevel 63 entry 12965). 2 versions
-- Source: http://www.thottbot.com/?i=Spiritshroud%20Leggings
-- Source: http://www.thottbot.com/?n=614727 / http://wow.allakhazam.com/profile.html?58232
-- * Modified spell 1
-- 1.12 spell 14254 (Increases damage and healing done by magical spells and effects by up to 19.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=12965;
-- STATS CHANGED: Blackmist Armguards (ilevel 63 entry 12966). 1/2 versions
UPDATE item_template SET `stat_value2`=0, `stat_type3`=6, `stat_value3`=5 WHERE entry=12966;
-- DAMAGE CHANGED: Seeping Willow (ilevel 63 entry 12969). 1/3 versions
-- Source: http://www.thottbot.com/?n=614727
-- Source: http://wow.allakhazam.com/item.html?witem=12969
-- Source: http://wow.allakhazam.com/dyn/items/wminlev5.html
UPDATE item_template SET `delay`=3300, `dmg_min1`=142, `dmg_max1`=214 WHERE entry=12969;
-- SPELLS CHANGED: Ring of Defense (ilevel 22 entry 12985). 1 versions
-- Source: http://www.thottbot.com/?n=9552 / http://wow.allakhazam.com/item.html?witem=12985
-- * Modified spell 1
-- 1.12 spell 7517 (Increased Defense +4.)
-- 1.04 spell 13384 (Increased Defense +6.)
UPDATE item_template SET `spellid_1`=13384 WHERE entry=12985;
-- SPELLS CHANGED: Mageflame Cloak (ilevel 58 entry 13007). 4 versions
-- Source: http://www.thottbot.com/?n=93219 / http://wow.allakhazam.com/item.html?witem=13007
-- Source: http://www.thottbot.com/?n=98802 / http://wow.allakhazam.com/item.html?witem=13007
-- Source: http://www.thottbot.com/?i=16749
-- Source: http://www.thottbot.com/?i=16749
-- * Modified spell 1
-- 1.12 spell 9298 (Increases damage done by Fire spells and effects by up to 21.)
-- 1.04 spell 23483 (Increases damage done by Fire spells and effects by up to 21.)
UPDATE item_template SET `spellid_1`=23483 WHERE entry=13007;
-- SPELLS CHANGED: Guardian Blade (ilevel 26 entry 13041). 5 versions
-- Source: http://wow.allakhazam.com/dyn/items/wratio8.html
-- Source: http://www.thottbot.com/?n=9654
-- Source: http://wow.allakhazam.com/dyn/items/wminlev8.html
-- Source: http://www.thottbot.com/?n=Galak%20Mauler / http://wow.allakhazam.com/db/price.html?witem=13041
-- Source: http://www.thottbot.com/?n=8970
-- * Modified spell 1
-- 1.12 spell 13388 (Increased Defense +9.)
-- 1.04 spell 21409 (Increased Defense +13.)
UPDATE item_template SET `spellid_1`=21409 WHERE entry=13041;
-- SPELLS CHANGED: Deanship Claymore (ilevel 29 entry 13049). 3 versions
-- Source: http://www.thottbot.com/?n=9178 / http://wow.allakhazam.com/item.html?witem=13049
-- Source: http://wow.allakhazam.com/dyn/items/wminlev8.html
-- Source: http://www.thottbot.com/?n=95356
-- * Modified spell 1
-- 1.12 spell 13390 (Increased Defense +10.)
-- 1.04 spell 21411 (Increased Defense +15.)
UPDATE item_template SET `spellid_1`=21411 WHERE entry=13049;
-- SPELLS CHANGED: Stonegrip Gauntlets (ilevel 60 entry 13072). 2 versions
-- Source: http://www.thottbot.com/?n=9820 / http://wow.allakhazam.com/profile.html?55827
-- Source: http://www.thottbot.com/?n=9820
-- * Modified spell 1
-- 1.12 spell 13390 (Increased Defense +10.)
-- 1.04 spell 21411 (Increased Defense +15.)
UPDATE item_template SET `spellid_1`=21411 WHERE entry=13072;
-- SPELLS CHANGED: Golem Shard Leggings (ilevel 46 entry 13074). 2 versions
-- Source: http://www.thottbot.com/?n=96108 / http://wow.allakhazam.com/item.html?witem=13074
-- Source: http://www.thottbot.com/?n=94194
-- * Modified spell 1
-- 1.12 spell 13384 (Increased Defense +6.)
-- 1.04 spell 18369 (Increased Defense +9.)
UPDATE item_template SET `spellid_1`=18369 WHERE entry=13074;
-- SPELLS CHANGED: Medallion of Grand Marshal Morris (ilevel 57 entry 13091). 2 versions
-- Source: http://www.thottbot.com/?n=93219 / http://wow.allakhazam.com/profile.html?55827
-- Source: http://www.thottbot.com/?i=10553
-- * Modified spell 1
-- 1.12 spell 13390 (Increased Defense +10.)
-- 1.04 spell 21411 (Increased Defense +15.)
UPDATE item_template SET `spellid_1`=21411 WHERE entry=13091;
-- STATS CHANGED: Wolfrunner Shoes (ilevel 59 entry 13101). 1/2 versions
UPDATE item_template SET `stat_value3`=0, `stat_type4`=4, `stat_value4`=11 WHERE entry=13101;
-- SPELLS REMOVED: Wolfrunner Shoes (ilevel 59 entry 13101). 2 versions
-- Source: http://www.thottbot.com/?n=9820 / http://wow.allakhazam.com/item.html?witem=13101
-- Source: http://www.thottbot.com/?n=91286
-- * Modified spell 1
-- 1.12 spell 9342 (Increases damage and healing done by magical spells and effects by up to 13.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13101;
-- STATS CHANGED: Tooth of Gnarr (ilevel 63 entry 13141). 1/1 versions
UPDATE item_template SET `stat_value1`=15, `stat_value2`=0, `stat_type3`=6, `stat_value3`=10 WHERE entry=13141;
-- SPELLS REMOVED: Tooth of Gnarr (ilevel 63 entry 13141). 1 versions
-- Source: http://www.thottbot.com/?n=617127 / http://wow.allakhazam.com/profile.html?58232
-- * Modified spell 1
-- 1.12 spell 21361 (Restores 3 mana per 5 sec.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13141;
-- STATS CHANGED: Brigam Girdle (ilevel 63 entry 13142). 1/1 versions
UPDATE item_template SET `stat_type3`=6, `stat_value3`=10 WHERE entry=13142;
-- SPELLS REMOVED: Brigam Girdle (ilevel 63 entry 13142). 1 versions
-- Source: http://www.thottbot.com/?n=617127 / http://wow.allakhazam.com/db/item.html?witem=13142
-- * Modified spell 1
-- 1.12 spell 15464 (Improves your chance to hit by 1%.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13142;
-- STATS CHANGED: Trindlehaven Staff (ilevel 61 entry 13161). 1/2 versions
UPDATE item_template SET `stat_value1`=30 WHERE entry=13161;
-- SPELLS REMOVED: Trindlehaven Staff (ilevel 61 entry 13161). 2 versions
-- Source: http://www.thottbot.com/?n=613513 / http://wow.allakhazam.com/profile.html?38061
-- Source: http://wow.allakhazam.com/dyn/items/wminlev10.html
-- * Modified spell 1
-- 1.12 spell 9343 (Increases damage and healing done by magical spells and effects by up to 14.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13161;
-- DAMAGE CHANGED: Relentless Scythe (ilevel 62 entry 13163). 1/2 versions
-- Source: http://www.thottbot.com/?n=613513 / http://wow.allakhazam.com/item.html?witem=13163
-- Source: http://wow.allakhazam.com/dyn/items/wminlev8.html
UPDATE item_template SET `delay`=2300, `dmg_min1`=97, `dmg_max1`=147 WHERE entry=13163;
-- STATS CHANGED: Plate of the Shaman King (ilevel 60 entry 13168). 1/1 versions
UPDATE item_template SET `stat_value1`=12, `stat_value2`=0, `stat_value3`=0, `stat_type4`=6, `stat_value4`=29 WHERE entry=13168;
-- SPELLS REMOVED: Plate of the Shaman King (ilevel 60 entry 13168). 1 versions
-- Source: http://www.thottbot.com/?n=482668 / http://wow.allakhazam.com/item.html?witem=13168
-- * Modified spell 1
-- 1.12 spell 9346 (Increases damage and healing done by magical spells and effects by up to 18.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13168;
-- STATS CHANGED: Tressermane Leggings (ilevel 60 entry 13169). 1/2 versions
UPDATE item_template SET `stat_value1`=23 WHERE entry=13169;
-- SPELLS REMOVED: Tressermane Leggings (ilevel 60 entry 13169). 2 versions
-- Source: http://www.thottbot.com/?n=482668 / http://wow.allakhazam.com/profile.html?2134
-- Source: http://www.thottbot.com/?i=Tressermane%20Leggings
-- * Modified spell 1
-- 1.12 spell 14254 (Increases damage and healing done by magical spells and effects by up to 19.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13169;
-- STATS CHANGED: Talisman of Evasion (ilevel 60 entry 13177). 1/1 versions
UPDATE item_template SET `stat_value1`=7 WHERE entry=13177;
-- QUALITY CHANGED: Talisman of Evasion (ilevel 60 entry 13177)
UPDATE item_template SET Quality=2 WHERE entry=13177;
-- SPELLS REMOVED: Rosewine Circle (ilevel 60 entry 13178). 2 versions
-- Source: http://www.thottbot.com/?n=482570 / http://wow.allakhazam.com/item.html?witem=13178
-- Source: http://www.thottbot.com/?i=Rosewine%20Circle
-- * Modified spell 1
-- 1.12 spell 21363 (Restores 5 mana per 5 sec.)
-- 1.04 spell 0
-- * Modified spell 2
-- 1.12 spell 9316 (Increases healing done by spells and effects by up to 29.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=13178;
-- STATS CHANGED: Brazecore Armguards (ilevel 60 entry 13179). 1/2 versions
UPDATE item_template SET `stat_value1`=7, `stat_type3`=6, `stat_value3`=11 WHERE entry=13179;
-- SPELLS REMOVED: Brazecore Armguards (ilevel 60 entry 13179). 2 versions
-- Source: http://www.thottbot.com/?n=482570 / http://wow.allakhazam.com/item.html?witem=13179
-- Source: http://www.thottbot.com/?i=Brazecore%20Armguards
-- * Modified spell 1
-- 1.12 spell 21361 (Restores 3 mana per 5 sec.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13179;
-- STATS CHANGED: Phase Blade (ilevel 57 entry 13182). 1/2 versions
UPDATE item_template SET `stat_value1`=8, `stat_value2`=5 WHERE entry=13182;
-- DAMAGE CHANGED: Phase Blade (ilevel 57 entry 13182). 1/2 versions
-- Source: http://www.thottbot.com/?n=22470 / http://wow.allakhazam.com/item.html?witem=13182
-- Source: http://wow.allakhazam.com/dyn/items/wminlev7.html
UPDATE item_template SET `dmg_min1`=47, `dmg_max1`=88 WHERE entry=13182;
-- QUALITY CHANGED: Phase Blade (ilevel 57 entry 13182)
UPDATE item_template SET Quality=2 WHERE entry=13182;
-- STATS CHANGED: Fallbrush Handgrips (ilevel 61 entry 13184). 1/1 versions
UPDATE item_template SET `stat_value1`=22, `stat_value2`=5, `stat_value3`=8 WHERE entry=13184;
-- SPELLS REMOVED: Fallbrush Handgrips (ilevel 61 entry 13184). 1 versions
-- Source: http://www.thottbot.com/?n=613655 / http://wow.allakhazam.com/item.html?witem=13184
-- * Modified spell 1
-- 1.12 spell 9407 (Increases healing done by spells and effects by up to 20.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13184;
-- STATS CHANGED: Sunderseer Mantle (ilevel 61 entry 13185). 1/2 versions
UPDATE item_template SET `stat_type4`=3, `stat_value4`=7 WHERE entry=13185;
-- SPELLS REMOVED: Sunderseer Mantle (ilevel 61 entry 13185). 2 versions
-- Source: http://www.thottbot.com/?n=613655 / http://wow.allakhazam.com/profile.html?58232
-- Source: http://www.thottbot.com/?i=Sunderseer%20Mantle
-- * Modified spell 1
-- 1.12 spell 9398 (Increases damage and healing done by magical spells and effects by up to 8.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13185;
-- STATS CHANGED: Armswake Cloak (ilevel 60 entry 13203). 1/2 versions
UPDATE item_template SET `armor`=39 WHERE entry=13203;
-- SPELLS REMOVED: Armswake Cloak (ilevel 60 entry 13203). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=13203
-- Source: http://www.thottbot.com/?i=Armswake%20Cloak
-- * Modified spell 1
-- 1.12 spell 9329 (+16 Attack Power.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13203;
-- QUALITY CHANGED: Armswake Cloak (ilevel 60 entry 13203)
UPDATE item_template SET Quality=2 WHERE entry=13203;
-- STATS REMOVED for item Bashguuder (http://wow.allakhazam.com/item.html?witem=13204) 
UPDATE item_template SET stat_value1=0, stat_type1=0 WHERE entry=13204;
-- DAMAGE CHANGED: Bashguuder (ilevel 60 entry 13204). 1/2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=13204
-- Source: http://wow.allakhazam.com/dyn/items/wminlev4.html
UPDATE item_template SET `delay`=2700, `dmg_min1`=65, `dmg_max1`=122 WHERE entry=13204;
-- QUALITY CHANGED: Bashguuder (ilevel 60 entry 13204)
UPDATE item_template SET Quality=2 WHERE entry=13204;
-- STATS CHANGED: Wolfshear Leggings (ilevel 61 entry 13206). 1/1 versions
UPDATE item_template SET `stat_value1`=30 WHERE entry=13206;
-- SPELLS REMOVED: Wolfshear Leggings (ilevel 61 entry 13206). 1 versions
-- Source: http://wow.allakhazam.com/item.html?witem=13206
-- * Modified spell 1
-- 1.12 spell 9315 (Increases healing done by spells and effects by up to 26.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13206;
-- STATS CHANGED: Bleak Howler Armguards (ilevel 61 entry 13208). 1/2 versions
UPDATE item_template SET `stat_type3`=4, `stat_value3`=7 WHERE entry=13208;
-- SPELLS REMOVED: Bleak Howler Armguards (ilevel 61 entry 13208). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=13208
-- Source: http://www.thottbot.com/?i=Bleak%20Howler%20Armguards
-- * Modified spell 1
-- 1.12 spell 7681 (Increases healing done by spells and effects by up to 15.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13208;
-- STATS CHANGED: Slashclaw Bracers (ilevel 60 entry 13211). 1/1 versions
UPDATE item_template SET `stat_value1`=7, `stat_value2`=0, `stat_value3`=0, `stat_type4`=4, `stat_value4`=6, `armor`=141 WHERE entry=13211;
-- QUALITY CHANGED: Slashclaw Bracers (ilevel 60 entry 13211)
UPDATE item_template SET Quality=2 WHERE entry=13211;
-- STATS REMOVED for item Halycon's Spiked Collar (http://www.thottbot.com/?n=614668 / http://wow.allakhazam.com/item.html?witem=13212) 
UPDATE item_template SET stat_value1=0, stat_type1=0 WHERE entry=13212;
-- SPELLS CHANGED: Halycon's Spiked Collar (ilevel 60 entry 13212). 1 versions
-- Source: http://www.thottbot.com/?n=614668 / http://wow.allakhazam.com/item.html?witem=13212
-- * Modified spell 1
-- 1.12 spell 17482 (+48 Attack Power when fighting Beasts.)
-- 1.04 spell 18067 (+45 Attack Power when fighting Beasts.)
UPDATE item_template SET `spellid_1`=18067 WHERE entry=13212;
-- QUALITY CHANGED: Halycon's Spiked Collar (ilevel 60 entry 13212)
UPDATE item_template SET Quality=2 WHERE entry=13212;
-- STATS CHANGED: Gilded Gauntlets (ilevel 60 entry 13244). 1/1 versions
UPDATE item_template SET `stat_value1`=13, `stat_value2`=13, `armor`=201 WHERE entry=13244;
-- SPELLS REMOVED: Gilded Gauntlets (ilevel 60 entry 13244). 1 versions
-- Source: http://www.thottbot.com/?n=613656 / http://wow.allakhazam.com/item.html?witem=13244
-- * Modified spell 1
-- 1.12 spell 21362 (Restores 4 mana per 5 sec.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13244;
-- QUALITY CHANGED: Gilded Gauntlets (ilevel 60 entry 13244)
UPDATE item_template SET Quality=2 WHERE entry=13244;
-- SPELLS CHANGED: Kresh's Back (ilevel 20 entry 13245). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=13245
-- Source: http://www.thottbot.com/?i=Kresh%27s%20Back
-- * Modified spell 1
-- 1.12 spell 7517 (Increased Defense +4.)
-- 1.04 spell 13384 (Increased Defense +6.)
UPDATE item_template SET `spellid_1`=13384 WHERE entry=13245;
-- STATS CHANGED: Burstshot Harquebus (ilevel 56 entry 13248). 1/4 versions
UPDATE item_template SET `stat_value1`=0, `stat_type2`=6, `stat_value2`=8 WHERE entry=13248;
-- STATS CHANGED: Trueaim Gauntlets (ilevel 59 entry 13255). 1/1 versions
UPDATE item_template SET `armor`=198 WHERE entry=13255;
-- SPELLS CHANGED: Trueaim Gauntlets (ilevel 59 entry 13255). 1 versions
-- Source: http://www.thottbot.com/?n=614662 / http://wow.allakhazam.com/item.html?witem=13255
-- * Modified spell 2
-- 1.12 spell 15464 (Improves your chance to hit by 1%.)
-- 1.04 spell 0
-- * Modified spell 3
-- 1.12 spell 27743 (Increased Guns +8.)
-- 1.04 spell 0
-- * Modified spell 4
-- 1.12 spell 27744 (Increased Crossbows +8.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_2`=0, `spelltrigger_2`=0, `spellid_3`=0, `spelltrigger_3`=0, `spellid_4`=0, `spelltrigger_4`=0 WHERE entry=13255;
-- QUALITY CHANGED: Trueaim Gauntlets (ilevel 59 entry 13255)
UPDATE item_template SET Quality=2 WHERE entry=13255;
-- STATS CHANGED: Demonic Runed Spaulders (ilevel 59 entry 13257). 1/1 versions
UPDATE item_template SET `stat_value2`=0, `stat_type4`=6, `stat_value4`=12 WHERE entry=13257;
-- NOT FOUND: Ashbringer (ilevel 76 entry 13262)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 13262);
-- STATS CHANGED: Ogreseer Tower Boots (ilevel 59 entry 13282). 1/2 versions
UPDATE item_template SET `stat_value1`=7, `stat_value2`=20, `stat_value3`=0, `stat_type4`=4, `stat_value4`=5 WHERE entry=13282;
-- STATS CHANGED: Magus Ring (ilevel 59 entry 13283). 1/2 versions
UPDATE item_template SET `stat_value1`=9, `stat_value2`=4, `stat_value3`=6 WHERE entry=13283;
-- QUALITY CHANGED: Magus Ring (ilevel 59 entry 13283)
UPDATE item_template SET Quality=2 WHERE entry=13283;
-- STATS CHANGED: Swiftdart Battleboots (ilevel 58 entry 13284). 1/1 versions
UPDATE item_template SET `stat_value1`=5, `stat_value3`=0, `armor`=218 WHERE entry=13284;
-- QUALITY CHANGED: Swiftdart Battleboots (ilevel 58 entry 13284)
UPDATE item_template SET Quality=2 WHERE entry=13284;
-- STATS CHANGED: Dracorian Gauntlets (ilevel 63 entry 13344). 1/3 versions
UPDATE item_template SET `stat_value1`=18 WHERE entry=13344;
-- SPELLS REMOVED: Dracorian Gauntlets (ilevel 63 entry 13344). 3 versions
-- Source: http://www.thottbot.com/?n=613795 / http://wow.allakhazam.com/item.html?witem=13344
-- Source: http://www.thottbot.com/?n=197406
-- Source: http://www.thottbot.com/?i=16550
-- * Modified spell 1
-- 1.12 spell 9345 (Increases damage and healing done by magical spells and effects by up to 16.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13344;
-- DAMAGE CHANGED: Demonshear (ilevel 63 entry 13348). 1/3 versions
-- Source: http://wow.allakhazam.com/item.html?witem=13348
-- Source: http://www.thottbot.com/?n=613238
-- Source: http://wow.allakhazam.com/dyn/items/wminlev8.html
UPDATE item_template SET `delay`=2300, `dmg_min1`=99, `dmg_max1`=149 WHERE entry=13348;
-- STATS CHANGED: Scepter of the Unholy (ilevel 63 entry 13349). 1/5 versions
UPDATE item_template SET `shadow_res`=7 WHERE entry=13349;
-- SPELLS CHANGED: Scepter of the Unholy (ilevel 63 entry 13349). 5 versions
-- Source: http://www.thottbot.com/?n=613795 / http://wow.allakhazam.com/item.html?witem=13349
-- Source: http://www.thottbot.com/?n=197406 / http://wow.allakhazam.com/dyn/items/wname4.html
-- Source: http://wow.allakhazam.com/dyn/items/wminlev4.html
-- Source: http://www.thottbot.com/?i=Scepter%20of%20the%20Unholy
-- Source: http://www.thottbot.com/?n=197406
-- * Modified spell 1
-- 1.12 spell 9326 (Increases damage done by Shadow spells and effects by up to 19.)
-- 1.04 spell 14794 (Increases damage done by Shadow spells and effects by up to 24.)
UPDATE item_template SET `spellid_1`=14794 WHERE entry=13349;
-- STATS REMOVED for item Slavedriver's Cane (http://www.thottbot.com/?n=614950) 
UPDATE item_template SET stat_value1=0, stat_type1=0, stat_value2=0, stat_type2=0 WHERE entry=13372;
-- DAMAGE CHANGED: Slavedriver's Cane (ilevel 60 entry 13372). 1/4 versions
-- Source: http://www.thottbot.com/?n=614950
-- Source: http://wow.allakhazam.com/dyn/items/wminlev10.html
-- Source: http://wow.allakhazam.com/item.html?witem=13372
-- Source: http://www.thottbot.com/?i=Slavedriver%27s%20Cane
UPDATE item_template SET `delay`=3400, `dmg_min1`=139, `dmg_max1`=210 WHERE entry=13372;
-- STATS CHANGED: Willey's Portable Howitzer (ilevel 61 entry 13380). 1/3 versions
UPDATE item_template SET `stat_type2`=6, `stat_value2`=4 WHERE entry=13380;
-- DAMAGE CHANGED: Willey's Portable Howitzer (ilevel 61 entry 13380). 1/3 versions
-- Source: http://www.thottbot.com/?n=613255 / http://wow.allakhazam.com/profile.html?26338
-- Source: http://www.thottbot.com/?n=613255
-- Source: http://wow.allakhazam.com/dyn/items/wminlev3.html
UPDATE item_template SET `delay`=2400, `dmg_min1`=52, `dmg_max1`=98 WHERE entry=13380;
-- SPELLS REMOVED: Willey's Portable Howitzer (ilevel 61 entry 13380). 3 versions
-- Source: http://www.thottbot.com/?n=613255 / http://wow.allakhazam.com/profile.html?26338
-- Source: http://www.thottbot.com/?n=613255
-- Source: http://wow.allakhazam.com/dyn/items/wminlev3.html
-- * Modified spell 1
-- 1.12 spell 9139 (+8 Attack Power.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13380;
-- STATS CHANGED: Woollies of the Prancing Minstrel (ilevel 58 entry 13383). 1/2 versions
UPDATE item_template SET `stat_value1`=10, `stat_value2`=0, `stat_type3`=6, `stat_value3`=12 WHERE entry=13383;
-- SPELLS CHANGED: Woollies of the Prancing Minstrel (ilevel 58 entry 13383). 2 versions
-- Source: http://www.thottbot.com/?n=76153 / http://wow.allakhazam.com/item.html?witem=13383
-- Source: http://www.thottbot.com/?i=18609
-- * Modified spell 1
-- 1.12 spell 21632 (Restores 10 mana per 5 sec.)
-- 1.04 spell 13670 (Increases your chance to dodge an attack by 2%.)
UPDATE item_template SET `spellid_1`=13670 WHERE entry=13383;
-- STATS CHANGED: Rainbow Girdle (ilevel 58 entry 13384). 1/1 versions
UPDATE item_template SET `stat_value1`=0, `stat_value2`=12, `stat_value3`=12, `stat_value4`=12, `stat_value5`=12 WHERE entry=13384;
-- STATS CHANGED: The Postmaster's Tunic (ilevel 61 entry 13388). 1/2 versions
UPDATE item_template SET `stat_value2`=0, `stat_value3`=30, `stat_type4`=3, `stat_value4`=5 WHERE entry=13388;
-- SPELLS REMOVED: The Postmaster's Tunic (ilevel 61 entry 13388). 2 versions
-- Source: http://www.thottbot.com/?set=81
-- Source: http://www.thottbot.com/?i=The%20Postmaster%27s%20Tunic / http://wow.allakhazam.com/item.html?witem=13388
-- * Modified spell 1
-- 1.12 spell 9344 (Increases damage and healing done by magical spells and effects by up to 15.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13388;
-- STATS CHANGED: The Postmaster's Trousers (ilevel 61 entry 13389). 1/3 versions
UPDATE item_template SET `stat_value1`=0, `stat_type4`=3, `stat_value4`=12 WHERE entry=13389;
-- STATS CHANGED: The Postmaster's Band (ilevel 61 entry 13390). 1/2 versions
UPDATE item_template SET `stat_value1`=30, `stat_value3`=0, `shadow_res`=10 WHERE entry=13390;
-- SPELLS REMOVED: The Postmaster's Band (ilevel 61 entry 13390). 2 versions
-- Source: http://www.thottbot.com/?set=81
-- Source: http://www.thottbot.com/?i=The%20Postmaster%27s%20Tunic / http://wow.allakhazam.com/item.html?witem=13390
-- * Modified spell 1
-- 1.12 spell 9343 (Increases damage and healing done by magical spells and effects by up to 14.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13390;
-- STATS CHANGED: The Postmaster's Treads (ilevel 61 entry 13391). 2/3 versions
-- CONFLICT:
-- 2005-03-31 16:24:25 to 2006-12-25 00:01:30 (days delta 645) on for example: http://www.thottbot.com/?i=The%20Postmaster%27s%20Tunic / http://wow.allakhazam.com/item.html?witem=13391
-- 2005-03-10 08:25:19 to 2005-03-10 08:25:19 (days delta 0) on for example: http://www.thottbot.com/?i=The%20Postmaster%27s%20Seal
-- 2005-02-15 11:03:31 to 2005-02-24 21:12:13 (days delta 9) on for example: http://wow.allakhazam.com/item.html?witem=13391
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `stat_value3`=6, `stat_type4`=4, `stat_value4`=6 WHERE entry=13391;
-- SPELLS REMOVED: The Postmaster's Treads (ilevel 61 entry 13391). 3 versions
-- Source: http://www.thottbot.com/?i=The%20Postmaster%27s%20Tunic / http://wow.allakhazam.com/item.html?witem=13391
-- Source: http://www.thottbot.com/?i=The%20Postmaster%27s%20Seal
-- Source: http://wow.allakhazam.com/item.html?witem=13391
-- * Modified spell 1
-- 1.12 spell 9397 (Increases damage and healing done by magical spells and effects by up to 7.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13391;
-- STATS CHANGED: The Postmaster's Seal (ilevel 61 entry 13392). 2/3 versions
-- CONFLICT:
-- 2005-01-15 02:37:37 to 2006-02-14 04:14:27 (days delta 402) on for example: http://www.thottbot.com/?i=The%20Postmaster%27s%20Seal / http://wow.allakhazam.com/item.html?witem=13392
-- 2005-05-11 08:39:55 to 2005-05-11 08:43:09 (days delta 0) on for example: http://www.thottbot.com/?i=The%20Postmaster%27s%20Tunic
-- 2005-03-10 08:25:19 to 2005-03-10 08:25:19 (days delta 0) on for example: http://www.thottbot.com/?i=The%20Postmaster%27s%20Seal
UPDATE item_template SET `stat_value2`=0, `stat_value3`=6, `stat_type4`=3, `stat_value4`=3 WHERE entry=13392;
-- STATS CHANGED: Skul's Cold Embrace (ilevel 59 entry 13394). 1/1 versions
UPDATE item_template SET `stat_type3`=6, `stat_value3`=9 WHERE entry=13394;
-- SPELLS REMOVED: Skul's Cold Embrace (ilevel 59 entry 13394). 1 versions
-- Source: http://www.thottbot.com/?n=627647 / http://wow.allakhazam.com/item.html?witem=13394
-- * Modified spell 1
-- 1.12 spell 13384 (Increased Defense +6.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13394;
-- STATS CHANGED: Boots of the Shrieker (ilevel 62 entry 13398). 1/1 versions
UPDATE item_template SET `stat_type4`=4, `stat_value4`=10 WHERE entry=13398;
-- SPELLS REMOVED: Boots of the Shrieker (ilevel 62 entry 13398). 1 versions
-- Source: http://www.thottbot.com/?n=614549 / http://wow.allakhazam.com/profile.html?4474
-- * Modified spell 1
-- 1.12 spell 9417 (Increases damage and healing done by magical spells and effects by up to 12.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13398;
-- STATS CHANGED: Vambraces of the Sadist (ilevel 59 entry 13400). 1/1 versions
UPDATE item_template SET `stat_value2`=0, `stat_type3`=6, `stat_value3`=6 WHERE entry=13400;
-- STATS CHANGED: Timmy's Galoshes (ilevel 59 entry 13402). 1/2 versions
UPDATE item_template SET `stat_value2`=11, `stat_value3`=0, `stat_type4`=6, `stat_value4`=11 WHERE entry=13402;
-- STATS CHANGED: Grimgore Noose (ilevel 59 entry 13403). 1/1 versions
UPDATE item_template SET `stat_value2`=8, `stat_type4`=4, `stat_value4`=3 WHERE entry=13403;
-- STATS CHANGED: Wailing Nightbane Pauldrons (ilevel 57 entry 13405). 1/2 versions
UPDATE item_template SET `stat_type3`=6, `stat_value3`=5 WHERE entry=13405;
-- SPELLS REMOVED: Wailing Nightbane Pauldrons (ilevel 57 entry 13405). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=13405
-- Source: http://www.thottbot.com/?n=23036
-- * Modified spell 1
-- 1.12 spell 7516 (Increased Defense +3.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13405;
-- STATS CHANGED: Handcrafted Mastersmith Leggings (ilevel 60 entry 13498). 1/1 versions
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `armor`=785 WHERE entry=13498;
-- QUALITY CHANGED: Handcrafted Mastersmith Leggings (ilevel 60 entry 13498)
UPDATE item_template SET Quality=2 WHERE entry=13498;
-- DAMAGE CHANGED: Runeblade of Baron Rivendare (ilevel 63 entry 13505). 1/4 versions
-- Source: http://www.thottbot.com/?n=197406 / http://wow.allakhazam.com/item.html?witem=13505
-- Source: http://wow.allakhazam.com/dyn/items/wminlev8.html
-- Source: http://www.thottbot.com/?i=25821
-- Source: http://www.thottbot.com/?n=197406
UPDATE item_template SET `delay`=2800, `dmg_min1`=133, `dmg_max1`=200 WHERE entry=13505;
-- SPELLS CHANGED: Greater Spellstone (ilevel 48 entry 13602). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype23.html
-- Source: http://wow.allakhazam.com/item.html?witem=13602
-- * Modified spell 2
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=13602;
-- SPELLS CHANGED: Major Spellstone (ilevel 60 entry 13603). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype23.html
-- Source: http://wow.allakhazam.com/item.html?witem=13603
-- * Modified spell 2
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=13603;
-- SPELLS CHANGED: Firestone (ilevel 36 entry 13699). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype23.html
-- Source: http://wow.allakhazam.com/item.html?witem=13699
-- * Modified spell 2
-- 1.12 spell 23481 (Increases damage done by Fire spells and effects by up to 14.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=13699;
-- SPELLS REMOVED: Greater Firestone (ilevel 46 entry 13700). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype23.html
-- * Modified spell 1
-- 1.12 spell 17947 (Enchants the main hand weapon with fire, granting each attack a chance to deal 60 to 91 additional fire damage.)
-- 1.04 spell 0
-- * Modified spell 2
-- 1.12 spell 23482 (Increases damage done by Fire spells and effects by up to 17.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=13700;
-- STATS CHANGED: Tombstone Breastplate (ilevel 62 entry 13944). 1/2 versions
UPDATE item_template SET `stat_value1`=4, `stat_type3`=6, `stat_value3`=6 WHERE entry=13944;
-- SPELLS REMOVED: Stoneform Shoulders (ilevel 61 entry 13955). 2 versions
-- Source: http://www.thottbot.com/?n=75222 / http://wow.allakhazam.com/item.html?witem=13955
-- Source: http://www.thottbot.com/?i=Stoneform%20Shoulders
-- * Modified spell 1
-- 1.12 spell 0
-- 1.04 spell 13390 (Increased Defense +10.)
-- * Modified spell 2
-- 1.12 spell 13385 (Increased Defense +7.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_2`=0, `spelltrigger_2`=0, `spellid_1`=13390, `spelltrigger_1`=1 WHERE entry=13955;
-- STATS CHANGED: Clutch of Andros (ilevel 61 entry 13956). 1/1 versions
UPDATE item_template SET `stat_value1`=22, `stat_value2`=3, `stat_type3`=6, `stat_value3`=8 WHERE entry=13956;
-- SPELLS REMOVED: Clutch of Andros (ilevel 61 entry 13956). 1 versions
-- Source: http://www.thottbot.com/?n=75222 / http://wow.allakhazam.com/db/item.html?witem=13956
-- * Modified spell 1
-- 1.12 spell 23727 (Improves your chance to hit with spells by 1%.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13956;
-- STATS CHANGED: Voone's Vice Grips (ilevel 60 entry 13963). 1/5 versions
UPDATE item_template SET `stat_value1`=0, `stat_value2`=6, `stat_type3`=6, `stat_value3`=6 WHERE entry=13963;
-- SPELLS CHANGED: Witchblade (ilevel 62 entry 13964). 5 versions
-- Source: http://www.thottbot.com/?n=614549 / http://wow.allakhazam.com/item.html?witem=13964
-- Source: http://wow.allakhazam.com/dyn/items/wratio15.html
-- Source: http://wow.allakhazam.com/dyn/items/wminlev15.html
-- Source: http://www.thottbot.com/?i=19083
-- Source: http://www.thottbot.com/?n=211493 / http://wow.allakhazam.com/item.html?witem=13964
-- * Modified spell 1
-- 1.12 spell 9343 (Increases damage and healing done by magical spells and effects by up to 14.)
-- 1.04 spell 13599 (Increases damage done by Arcane spells and effects by up to 14.)
-- * Modified spell 2
-- 1.12 spell 0
-- 1.04 spell 9414 (Increases damage done by Shadow spells and effects by up to 14.)
UPDATE item_template SET `spellid_1`=13599, `spellid_2`=9414, `spelltrigger_2`=1 WHERE entry=13964;
-- SPELLS REMOVED: Mark of Tyranny (ilevel 63 entry 13966). 3 versions
-- Source: http://www.thottbot.com/?i=Mark%20of%20Tyranny / http://wow.allakhazam.com/profile.html?42
-- Source: http://www.thottbot.com/?i=Mark%20of%20Tyranny
-- Source: http://wow.allakhazam.com/dyn/items/itype12.html
-- * Modified spell 1
-- 1.12 spell 0
-- 1.04 spell 13669 (Increases your chance to dodge an attack by 1%.)
-- * Modified spell 2
-- 1.12 spell 13669 (Increases your chance to dodge an attack by 1%.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_2`=0, `spelltrigger_2`=0, `spellid_1`=13669, `spelltrigger_1`=1 WHERE entry=13966;
-- STATS CHANGED: Windreaver Greaves (ilevel 61 entry 13967). 1/1 versions
UPDATE item_template SET `stat_type2`=6, `stat_value2`=7 WHERE entry=13967;
-- SPELLS REMOVED: Windreaver Greaves (ilevel 61 entry 13967). 1 versions
-- Source: http://www.thottbot.com/?n=75222 / http://wow.allakhazam.com/item.html?witem=13967
-- * Modified spell 1
-- 1.12 spell 15464 (Improves your chance to hit by 1%.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13967;
-- SPELLS REMOVED: Barov Peasant Caller (ilevel 62 entry 14023). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname12.html
-- * Modified spell 1
-- 1.12 spell 18308 (Calls forth 3 servants of the House Barov that will fight, cook, and clean for you.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0 WHERE entry=14023;
-- SPELLS CHANGED: Cindercloth Gloves (ilevel 54 entry 14043). 3 versions
-- Source: http://www.thottbot.com/?i=4376 / http://wow.allakhazam.com/item.html?witem=14043
-- Source: http://www.thottbot.com/?i=4282 / http://wow.allakhazam.com/item.html?witem=14043
-- Source: http://www.thottbot.com/?i=Rune%20Thread
-- * Modified spell 1
-- 1.12 spell 9295 (Increases damage done by Fire spells and effects by up to 17.)
-- 1.04 spell 23482 (Increases damage done by Fire spells and effects by up to 17.)
UPDATE item_template SET `spellid_1`=23482 WHERE entry=14043;
-- SPELLS CHANGED: Robe of the Void (ilevel 62 entry 14153). 5 versions
-- Source: http://wow.allakhazam.com/item.html?witem=14153
-- Source: http://www.thottbot.com/?i=5907 / http://wow.allakhazam.com/item.html?witem=14153
-- Source: http://www.thottbot.com/?i=Felcloth / http://wow.allakhazam.com/item.html?witem=14153
-- Source: http://www.thottbot.com/?i=26067
-- Source: http://www.thottbot.com/?i=Rune%20Thread
-- * Modified spell 1
-- 1.12 spell 28264 (Increases damage and healing done by magical spells and effects by up to 46.)
-- 1.04 spell 18024 (Increases damage done by Shadow spells and effects by up to 49.)
UPDATE item_template SET `spellid_1`=18024 WHERE entry=14153;
-- STATS CHANGED: Freezing Lich Robes (ilevel 62 entry 14340). 1/3 versions
UPDATE item_template SET `stat_value1`=0, `frost_res`=15 WHERE entry=14340;
-- STATS CHANGED: Death's Clutch (ilevel 62 entry 14503). 1/2 versions
UPDATE item_template SET `stat_value1`=12, `stat_value2`=11, `stat_value3`=11, `stat_value4`=12, `stat_value5`=0 WHERE entry=14503;
-- STATS CHANGED: Maelstrom Leggings (ilevel 62 entry 14522). 1/2 versions
UPDATE item_template SET `stat_value1`=20, `stat_value2`=0, `stat_type4`=4, `stat_value4`=10 WHERE entry=14522;
-- SPELLS REMOVED: Maelstrom Leggings (ilevel 62 entry 14522). 2 versions
-- Source: http://www.thottbot.com/?n=614545 / http://wow.allakhazam.com/item.html?witem=14522
-- Source: http://www.thottbot.com/?i=Maelstrom%20Leggings
-- * Modified spell 1
-- 1.12 spell 7680 (Increases healing done by spells and effects by up to 13.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=14522;
-- STATS CHANGED: Boneclenched Gauntlets (ilevel 62 entry 14525). 1/2 versions
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `armor`=624, `frost_res`=10 WHERE entry=14525;
-- SPELLS REMOVED: Boneclenched Gauntlets (ilevel 62 entry 14525). 2 versions
-- Source: http://www.thottbot.com/?n=614545 / http://wow.allakhazam.com/item.html?witem=14525
-- Source: http://www.thottbot.com/?i=19030
-- * Modified spell 1
-- 1.12 spell 13385 (Increased Defense +7.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=14525;
-- STATS CHANGED: Darkshade Gloves (ilevel 62 entry 14543). 2/2 versions
-- CONFLICT:
-- 2005-04-19 15:57:26 to 2005-04-19 15:57:26 (days delta 0) on for example: http://www.thottbot.com/?n=30382
-- 2005-02-15 11:01:48 to 2005-02-24 05:57:04 (days delta 9) on for example: http://wow.allakhazam.com/dyn/items/iname10.html
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `stat_value3`=0, `armor`=50, `holy_res`=15, `arcane_res`=0 WHERE entry=14543;
-- QUALITY CHANGED: Darkshade Gloves (ilevel 62 entry 14543)
UPDATE item_template SET Quality=2 WHERE entry=14543;
-- STATS CHANGED: Royal Cap Spaulders (ilevel 62 entry 14548). 1/2 versions
UPDATE item_template SET `stat_value1`=14, `stat_value3`=0, `stat_type4`=3, `stat_value4`=5, `armor`=249 WHERE entry=14548;
-- SPELLS REMOVED: Royal Cap Spaulders (ilevel 62 entry 14548). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname3.html
-- Source: http://wow.allakhazam.com/item.html?witem=14548
-- * Modified spell 1
-- 1.12 spell 9315 (Increases healing done by spells and effects by up to 26.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=14548;
-- QUALITY CHANGED: Royal Cap Spaulders (ilevel 62 entry 14548)
UPDATE item_template SET Quality=2 WHERE entry=14548;
-- SPELLS CHANGED: Stockade Pauldrons (ilevel 55 entry 14552). 2 versions
-- Source: http://www.thottbot.com/?n=7950
-- Source: http://www.thottbot.com/?n=7968 / http://wow.allakhazam.com/profile.html?103342
-- * Modified spell 1
-- 1.12 spell 13390 (Increased Defense +10.)
-- 1.04 spell 21411 (Increased Defense +15.)
UPDATE item_template SET `spellid_1`=21411 WHERE entry=14552;
-- STATS CHANGED: Bloodmail Legguards (ilevel 61 entry 14612). 1/2 versions
UPDATE item_template SET `stat_value1`=0, `stat_value2`=6, `stat_value3`=3, `stat_value4`=0, `stat_type5`=6, `stat_value5`=25, `armor`=286 WHERE entry=14612;
-- QUALITY CHANGED: Bloodmail Legguards (ilevel 61 entry 14612)
UPDATE item_template SET Quality=2 WHERE entry=14612;
-- STATS CHANGED: Bloodmail Belt (ilevel 61 entry 14614). 1/2 versions
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `stat_value3`=11, `stat_value4`=17, `armor`=184 WHERE entry=14614;
-- QUALITY CHANGED: Bloodmail Belt (ilevel 61 entry 14614)
UPDATE item_template SET Quality=2 WHERE entry=14614;
-- STATS CHANGED: Bloodmail Gauntlets (ilevel 61 entry 14615). 1/2 versions
UPDATE item_template SET `stat_value1`=0, `stat_value2`=7, `stat_value3`=0, `stat_type4`=6, `stat_value4`=17, `armor`=204 WHERE entry=14615;
-- SPELLS REMOVED: Bloodmail Gauntlets (ilevel 61 entry 14615). 2 versions
-- Source: http://www.thottbot.com/?n=75214 / http://wow.allakhazam.com/item.html?witem=14615
-- Source: http://www.thottbot.com/?n=614551
-- * Modified spell 1
-- 1.12 spell 7597 (Improves your chance to get a critical strike by 1%.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=14615;
-- QUALITY CHANGED: Bloodmail Gauntlets (ilevel 61 entry 14615)
UPDATE item_template SET Quality=2 WHERE entry=14615;
-- STATS CHANGED: Bloodmail Boots (ilevel 61 entry 14616). 1/2 versions
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `stat_value3`=0, `stat_value4`=0, `stat_type5`=6, `stat_value5`=20, `armor`=225 WHERE entry=14616;
-- SPELLS REMOVED: Bloodmail Boots (ilevel 61 entry 14616). 2 versions
-- Source: http://www.thottbot.com/?n=614551
-- Source: http://www.thottbot.com/?n=75214 / http://wow.allakhazam.com/dyn/items/itype8.html
-- * Modified spell 1
-- 1.12 spell 15464 (Improves your chance to hit by 1%.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=14616;
-- QUALITY CHANGED: Bloodmail Boots (ilevel 61 entry 14616)
UPDATE item_template SET Quality=2 WHERE entry=14616;
-- STATS CHANGED: Deathbone Girdle (ilevel 61 entry 14620). 1/1 versions
UPDATE item_template SET `stat_value1`=8, `stat_type2`=4, `stat_value2`=15, `armor`=326 WHERE entry=14620;
-- SPELLS REMOVED: Deathbone Girdle (ilevel 61 entry 14620). 1 versions
-- Source: http://www.thottbot.com/?n=75214 / http://wow.allakhazam.com/db/itemset.html?setid=124
-- * Modified spell 1
-- 1.12 spell 18369 (Increased Defense +9.)
-- 1.04 spell 0
-- * Modified spell 2
-- 1.12 spell 21362 (Restores 4 mana per 5 sec.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=14620;
-- QUALITY CHANGED: Deathbone Girdle (ilevel 61 entry 14620)
UPDATE item_template SET Quality=2 WHERE entry=14620;
-- STATS CHANGED: Deathbone Sabatons (ilevel 61 entry 14621). 1/1 versions
UPDATE item_template SET `stat_value1`=12, `stat_type2`=6, `stat_value2`=10, `armor`=398 WHERE entry=14621;
-- SPELLS REMOVED: Deathbone Sabatons (ilevel 61 entry 14621). 1 versions
-- Source: http://www.thottbot.com/?n=75214 / http://wow.allakhazam.com/item.html?witem=14621
-- * Modified spell 1
-- 1.12 spell 21626 (Restores 6 mana per 5 sec.)
-- 1.04 spell 0
-- * Modified spell 2
-- 1.12 spell 13390 (Increased Defense +10.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=14621;
-- QUALITY CHANGED: Deathbone Sabatons (ilevel 61 entry 14621)
UPDATE item_template SET Quality=2 WHERE entry=14621;
-- STATS CHANGED: Deathbone Gauntlets (ilevel 61 entry 14622). 1/1 versions
UPDATE item_template SET `stat_value1`=8, `stat_type2`=6, `stat_value2`=5, `armor`=362 WHERE entry=14622;
-- SPELLS REMOVED: Deathbone Gauntlets (ilevel 61 entry 14622). 1 versions
-- Source: http://www.thottbot.com/?n=75214 / http://wow.allakhazam.com/item.html?witem=14622
-- * Modified spell 1
-- 1.12 spell 13390 (Increased Defense +10.)
-- 1.04 spell 0
-- * Modified spell 2
-- 1.12 spell 21362 (Restores 4 mana per 5 sec.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=14622;
-- QUALITY CHANGED: Deathbone Gauntlets (ilevel 61 entry 14622)
UPDATE item_template SET Quality=2 WHERE entry=14622;
-- STATS CHANGED: Deathbone Legguards (ilevel 61 entry 14623). 1/1 versions
UPDATE item_template SET `stat_value1`=0, `stat_type2`=6, `stat_value2`=14, `armor`=507 WHERE entry=14623;
-- SPELLS REMOVED: Deathbone Legguards (ilevel 61 entry 14623). 1 versions
-- Source: http://www.thottbot.com/?n=75214 / http://wow.allakhazam.com/item.html?witem=14623
-- * Modified spell 1
-- 1.12 spell 21363 (Restores 5 mana per 5 sec.)
-- 1.04 spell 0
-- * Modified spell 2
-- 1.12 spell 14249 (Increased Defense +13.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=14623;
-- QUALITY CHANGED: Deathbone Legguards (ilevel 61 entry 14623)
UPDATE item_template SET Quality=2 WHERE entry=14623;
-- STATS CHANGED: Deathbone Chestplate (ilevel 61 entry 14624). 1/1 versions
UPDATE item_template SET `stat_type2`=6, `stat_value2`=12 WHERE entry=14624;
-- SPELLS CHANGED: Deathbone Chestplate (ilevel 61 entry 14624). 1 versions
-- Source: http://www.thottbot.com/?n=75214 / http://wow.allakhazam.com/item.html?witem=14624
-- * Modified spell 1
-- 1.12 spell 13389 (Increased Defense +17.)
-- 1.04 spell 21423 (Increased Defense +25.)
-- * Modified spell 2
-- 1.12 spell 21363 (Restores 5 mana per 5 sec.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=21423, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=14624;
-- STATS CHANGED: Necropile Robe (ilevel 61 entry 14626). 1/2 versions
UPDATE item_template SET `stat_value1`=25 WHERE entry=14626;
-- SPELLS REMOVED: Necropile Robe (ilevel 61 entry 14626). 2 versions
-- Source: http://www.thottbot.com/?n=75214 / http://wow.allakhazam.com/item.html?witem=14626
-- Source: http://www.thottbot.com/?i=21781
-- * Modified spell 1
-- 1.12 spell 9398 (Increases damage and healing done by magical spells and effects by up to 8.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=14626;
-- STATS CHANGED: Necropile Cuffs (ilevel 61 entry 14629). 1/1 versions
UPDATE item_template SET `stat_value1`=5, `stat_value2`=13, `stat_value3`=0, `armor`=34 WHERE entry=14629;
-- QUALITY CHANGED: Necropile Cuffs (ilevel 61 entry 14629)
UPDATE item_template SET Quality=2 WHERE entry=14629;
-- STATS CHANGED: Necropile Boots (ilevel 61 entry 14631). 1/1 versions
UPDATE item_template SET `stat_value1`=16, `stat_value2`=8, `stat_value3`=0, `armor`=54 WHERE entry=14631;
-- SPELLS REMOVED: Necropile Boots (ilevel 61 entry 14631). 1 versions
-- Source: http://www.thottbot.com/?n=75214 / http://wow.allakhazam.com/item.html?witem=14631
-- * Modified spell 1
-- 1.12 spell 9416 (Increases damage and healing done by magical spells and effects by up to 11.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=14631;
-- QUALITY CHANGED: Necropile Boots (ilevel 61 entry 14631)
UPDATE item_template SET Quality=2 WHERE entry=14631;
-- STATS CHANGED: Necropile Leggings (ilevel 61 entry 14632). 1/1 versions
UPDATE item_template SET `stat_value2`=5, `stat_value3`=15, `armor`=69 WHERE entry=14632;
-- QUALITY CHANGED: Necropile Leggings (ilevel 61 entry 14632)
UPDATE item_template SET Quality=2 WHERE entry=14632;
-- STATS CHANGED: Necropile Mantle (ilevel 61 entry 14633). 1/1 versions
UPDATE item_template SET `stat_value1`=14, `stat_value2`=10, `stat_value3`=0, `stat_type4`=3, `stat_value4`=6, `armor`=59 WHERE entry=14633;
-- QUALITY CHANGED: Necropile Mantle (ilevel 61 entry 14633)
UPDATE item_template SET Quality=2 WHERE entry=14633;
-- STATS CHANGED: Cadaverous Belt (ilevel 61 entry 14636). 1/2 versions
UPDATE item_template SET `stat_value1`=10, `stat_type2`=4, `stat_value2`=15, `armor`=88 WHERE entry=14636;
-- SPELLS REMOVED: Cadaverous Belt (ilevel 61 entry 14636). 2 versions
-- Source: http://www.thottbot.com/?n=75214 / http://wow.allakhazam.com/db/itemset.html?setid=121
-- Source: http://www.thottbot.com/?i=Cadaverous%20Belt
-- * Modified spell 1
-- 1.12 spell 14049 (+40 Attack Power.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=14636;
-- QUALITY CHANGED: Cadaverous Belt (ilevel 61 entry 14636)
UPDATE item_template SET Quality=2 WHERE entry=14636;
-- STATS CHANGED: Cadaverous Leggings (ilevel 61 entry 14638). 1/1 versions
UPDATE item_template SET `stat_type2`=4, `stat_value2`=10, `armor`=136 WHERE entry=14638;
-- SPELLS REMOVED: Cadaverous Leggings (ilevel 61 entry 14638). 1 versions
-- Source: http://www.thottbot.com/?n=75214 / http://wow.allakhazam.com/item.html?witem=14638
-- * Modified spell 1
-- 1.12 spell 15812 (+52 Attack Power.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=14638;
-- QUALITY CHANGED: Cadaverous Leggings (ilevel 61 entry 14638)
UPDATE item_template SET Quality=2 WHERE entry=14638;
-- STATS CHANGED: Cadaverous Gloves (ilevel 61 entry 14640). 1/2 versions
UPDATE item_template SET `stat_value1`=0, `stat_type2`=6, `stat_value2`=10, `armor`=97 WHERE entry=14640;
-- SPELLS REMOVED: Cadaverous Gloves (ilevel 61 entry 14640). 2 versions
-- Source: http://www.thottbot.com/?n=75214 / http://wow.allakhazam.com/profile.html?2089
-- Source: http://www.thottbot.com/?i=Cadaverous%20Gloves
-- * Modified spell 1
-- 1.12 spell 15810 (+44 Attack Power.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=14640;
-- QUALITY CHANGED: Cadaverous Gloves (ilevel 61 entry 14640)
UPDATE item_template SET Quality=2 WHERE entry=14640;
-- STATS CHANGED: Cadaverous Walkers (ilevel 61 entry 14641). 1/2 versions
UPDATE item_template SET `stat_value1`=8, `stat_type2`=3, `stat_value2`=16, `armor`=107 WHERE entry=14641;
-- SPELLS REMOVED: Cadaverous Walkers (ilevel 61 entry 14641). 2 versions
-- Source: http://www.thottbot.com/?n=75214 / http://wow.allakhazam.com/dyn/items/iname8.html
-- Source: http://www.thottbot.com/?i=Cadaverous%20Walkers
-- * Modified spell 1
-- 1.12 spell 14027 (+24 Attack Power.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=14641;
-- QUALITY CHANGED: Cadaverous Walkers (ilevel 61 entry 14641)
UPDATE item_template SET Quality=2 WHERE entry=14641;
-- STATS CHANGED: Green Dragonscale Breastplate (ilevel 52 entry 15045). 1/3 versions
UPDATE item_template SET `stat_value1`=25, `stat_value2`=0 WHERE entry=15045;
-- STATS CHANGED: Green Dragonscale Leggings (ilevel 54 entry 15046). 1/2 versions
UPDATE item_template SET `stat_value1`=26, `stat_value2`=0 WHERE entry=15046;
-- STATS CHANGED: Stormshroud Shoulders (ilevel 59 entry 15058). 1/3 versions
UPDATE item_template SET `stat_value1`=10, `armor`=114 WHERE entry=15058;
-- QUALITY CHANGED: Stormshroud Shoulders (ilevel 59 entry 15058)
UPDATE item_template SET Quality=2 WHERE entry=15058;
-- SPELLS CHANGED: Orb of Noh'Orahil (ilevel 40 entry 15107). 4 versions
-- Source: http://wow.allakhazam.com/item.html?witem=15107
-- Source: http://www.thottbot.com/?i=Testament%20of%20Hope
-- Source: http://wow.allakhazam.com/item.html?witem=15107
-- Source: http://www.thottbot.com/?i=3571
-- * Modified spell 1
-- 1.12 spell 9401 (Increases damage done by Fire spells and effects by up to 14.)
-- 1.04 spell 23481 (Increases damage done by Fire spells and effects by up to 14.)
UPDATE item_template SET `spellid_1`=23481 WHERE entry=15107;
-- SPELLS CHANGED: Ornate Adamantium Breastplate (ilevel 63 entry 15413). 2 versions
-- Source: http://wow.allakhazam.com/profile.html?103342
-- Source: http://www.thottbot.com/?i=Ornate%20Adamantium%20Breastplate
-- * Modified spell 1
-- 1.12 spell 13390 (Increased Defense +10.)
-- 1.04 spell 21411 (Increased Defense +15.)
UPDATE item_template SET `spellid_1`=21411 WHERE entry=15413;
-- DAMAGE CHANGED: Fine Light Crossbow (ilevel 21 entry 15808). 1/3 versions
-- Source: http://www.thottbot.com/?n=582939
-- Source: http://www.thottbot.com/?n=624917 / http://wow.allakhazam.com/item.html?witem=15808
-- Source: http://www.thottbot.com/?n=2570
UPDATE item_template SET `dmg_min1`=20, `dmg_max1`=20 WHERE entry=15808;
-- NOT FOUND: Test Arcane Res Legs Mail (ilevel 35 entry 16165)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 16165);
-- STATS CHANGED: High Warlord's Blade (ilevel 78 entry 16345). 1/4 versions
UPDATE item_template SET `stat_value1`=6 WHERE entry=16345;
-- DAMAGE CHANGED: High Warlord's Blade (ilevel 78 entry 16345). 1/4 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname13.html
-- Source: http://wow.allakhazam.com/dyn/items/wminlev7.html
-- Source: http://wow.allakhazam.com/item.html?witem=16345
-- Source: http://wow.allakhazam.com/dyn/items/wratio7.html
UPDATE item_template SET `dmg_min1`=115, `dmg_max1`=173 WHERE entry=16345;
-- SPELLS CHANGED: High Warlord's Blade (ilevel 78 entry 16345). 4 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname13.html
-- Source: http://wow.allakhazam.com/dyn/items/wminlev7.html
-- Source: http://wow.allakhazam.com/item.html?witem=16345
-- Source: http://wow.allakhazam.com/dyn/items/wratio7.html
-- * Modified spell 2
-- 1.12 spell 9335 (+28 Attack Power.)
-- 1.04 spell 9141 (+12 Attack Power.)
UPDATE item_template SET `spellid_2`=9141 WHERE entry=16345;
-- STATS CHANGED: Magister's Gloves (ilevel 59 entry 16684). 1/2 versions
UPDATE item_template SET `stat_value3`=6, `stat_type4`=3, `stat_value4`=6 WHERE entry=16684;
-- STATS CHANGED: Magister's Leggings (ilevel 61 entry 16687). 1/3 versions
UPDATE item_template SET `stat_value3`=8, `stat_type4`=3, `stat_value4`=8 WHERE entry=16687;
-- STATS CHANGED: Devout Gloves (ilevel 59 entry 16692). 1/2 versions
UPDATE item_template SET `stat_value3`=7, `stat_type4`=3, `stat_value4`=4 WHERE entry=16692;
-- STATS CHANGED: Devout Skirt (ilevel 61 entry 16694). 1/3 versions
UPDATE item_template SET `stat_value3`=8, `stat_type4`=3, `stat_value4`=8 WHERE entry=16694;
-- STATS CHANGED: Dreadmist Leggings (ilevel 61 entry 16699). 1/3 versions
UPDATE item_template SET `stat_value3`=12, `stat_type4`=3, `stat_value4`=5 WHERE entry=16699;
-- STATS CHANGED: Dreadmist Wraps (ilevel 59 entry 16705). 1/2 versions
UPDATE item_template SET `stat_value3`=9, `stat_type4`=3, `stat_value4`=8 WHERE entry=16705;
-- STATS CHANGED: Arcanist Crown (ilevel 66 entry 16795). 1/3 versions
UPDATE item_template SET `stat_value1`=10, `stat_value2`=35, `stat_value3`=13, `fire_res`=4, `nature_res`=4, `frost_res`=4 WHERE entry=16795;
-- SPELLS CHANGED: Arcanist Crown (ilevel 66 entry 16795). 3 versions
-- Source: http://www.thottbot.com/?n=509427 / http://wow.allakhazam.com/dyn/items/iname1.html
-- Source: http://www.thottbot.com/?i=37308
-- Source: http://wow.allakhazam.com/item.html?witem=16795
-- * Modified spell 1
-- 1.12 spell 14799 (Increases damage and healing done by magical spells and effects by up to 20.)
-- 1.04 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- * Modified spell 2
-- 1.12 spell 23727 (Improves your chance to hit with spells by 1%.)
-- 1.04 spell 7687 (Increases damage done by Fire spells and effects by up to 7.)
UPDATE item_template SET `spellid_1`=18384, `spellid_2`=7687 WHERE entry=16795;
-- STATS CHANGED: Arcanist Leggings (ilevel 66 entry 16796). 2/3 versions
-- CONFLICT:
-- 2005-07-01 02:17:13 to 2006-01-09 06:46:46 (days delta 194) on for example: http://wow.allakhazam.com/dyn/items/iname7.html
-- 2005-02-07 00:53:57 to 2005-06-08 01:11:28 (days delta 125) on for example: http://wow.allakhazam.com/item.html?witem=16796
-- 2005-05-04 02:21:52 to 2005-05-27 05:37:12 (days delta 23) on for example: http://www.thottbot.com/?n=508478 / http://wow.allakhazam.com/item.html?witem=16796
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=20, `stat_value2`=24, `stat_value3`=12, `stat_type4`=3, `stat_value4`=5, `fire_res`=5, `nature_res`=7, `frost_res`=5, `shadow_res`=13 WHERE entry=16796;
-- SPELLS CHANGED: Arcanist Leggings (ilevel 66 entry 16796). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- Source: http://wow.allakhazam.com/item.html?witem=16796
-- Source: http://www.thottbot.com/?n=508478 / http://wow.allakhazam.com/item.html?witem=16796
-- * Modified spell 2
-- 1.12 spell 14799 (Increases damage and healing done by magical spells and effects by up to 20.)
-- 1.04 spell 23481 (Increases damage done by Fire spells and effects by up to 14.)
UPDATE item_template SET `spellid_2`=23481 WHERE entry=16796;
-- STATS CHANGED: Arcanist Mantle (ilevel 66 entry 16797). 4/5 versions
-- CONFLICT:
-- 2005-06-23 00:26:29 to 2006-01-09 08:52:54 (days delta 203) on for example: http://wow.allakhazam.com/dyn/items/iname3.html
-- 2005-04-30 01:40:37 to 2005-08-25 21:13:46 (days delta 119) on for example: http://wow.allakhazam.com/db/item.html?entryid=216617
-- 2005-04-24 19:41:22 to 2005-08-21 11:14:32 (days delta 121) on for example: http://www.thottbot.com/?n=509429 / http://wow.allakhazam.com/db/itemset.html?setid=201
-- 2005-02-07 00:53:57 to 2005-04-19 10:48:47 (days delta 74) on for example: http://wow.allakhazam.com/db/itemset.html?setid=201
-- 2005-02-25 05:05:45 to 2005-03-15 03:54:16 (days delta 21) on for example: http://wow.allakhazam.com/dyn/items/iname3.html
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=24, `stat_value2`=9, `stat_value3`=0, `holy_res`=5, `fire_res`=5, `shadow_res`=0 WHERE entry=16797;
-- SPELLS CHANGED: Arcanist Mantle (ilevel 66 entry 16797). 5 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname3.html
-- Source: http://wow.allakhazam.com/db/item.html?entryid=216617
-- Source: http://www.thottbot.com/?n=509429 / http://wow.allakhazam.com/db/itemset.html?setid=201
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=201
-- Source: http://wow.allakhazam.com/dyn/items/iname3.html
-- * Modified spell 2
-- 1.12 spell 9343 (Increases damage and healing done by magical spells and effects by up to 14.)
-- 1.04 spell 9402 (Increases damage done by Frost spells and effects by up to 11.)
UPDATE item_template SET `spellid_2`=9402 WHERE entry=16797;
-- STATS CHANGED: Arcanist Robes (ilevel 66 entry 16798). 1/4 versions
UPDATE item_template SET `stat_value1`=33, `stat_value2`=16, `stat_value3`=7, `stat_type4`=3, `stat_value4`=7, `fire_res`=0 WHERE entry=16798;
-- SPELLS CHANGED: Arcanist Robes (ilevel 66 entry 16798). 4 versions
-- Source: http://www.thottbot.com/?n=508478 / http://wow.allakhazam.com/dyn/items/iminlev20.html
-- Source: http://www.thottbot.com/?i=27157
-- Source: http://wow.allakhazam.com/item.html?witem=16798
-- Source: http://thottbot.com/?l=latest
-- * Modified spell 1
-- 1.12 spell 14047 (Increases damage and healing done by magical spells and effects by up to 23.)
-- 1.04 spell 13599 (Increases damage done by Arcane spells and effects by up to 14.)
-- * Modified spell 2
-- 1.12 spell 0
-- 1.04 spell 23481 (Increases damage done by Fire spells and effects by up to 14.)
-- * Modified spell 3
-- 1.12 spell 0
-- 1.04 spell 9404 (Increases damage done by Frost spells and effects by up to 14.)
UPDATE item_template SET `spellid_1`=13599, `spellid_2`=23481, `spelltrigger_2`=1, `spellid_3`=9404, `spelltrigger_3`=1 WHERE entry=16798;
-- STATS CHANGED: Arcanist Bindings (ilevel 66 entry 16799). 3/3 versions
-- CONFLICT:
-- 2005-02-07 00:53:57 to 2005-11-12 05:45:46 (days delta 284) on for example: http://www.thottbot.com/?n=178393 / http://wow.allakhazam.com/item.html?witem=16799
-- 2005-04-27 23:47:35 to 2005-04-27 23:47:35 (days delta 0) on for example: http://wow.allakhazam.com/db/item.html?entryid=171605
-- 2005-02-23 11:53:13 to 2005-02-23 11:53:13 (days delta 0) on for example: http://wow.allakhazam.com/dyn/items/itype9.html
UPDATE item_template SET `stat_value1`=20, `stat_value2`=0, `stat_value3`=8, `holy_res`=4, `fire_res`=7, `frost_res`=4 WHERE entry=16799;
-- SPELLS REMOVED: Arcanist Bindings (ilevel 66 entry 16799). 3 versions
-- Source: http://www.thottbot.com/?n=178393 / http://wow.allakhazam.com/item.html?witem=16799
-- Source: http://wow.allakhazam.com/db/item.html?entryid=171605
-- Source: http://wow.allakhazam.com/dyn/items/itype9.html
-- * Modified spell 1
-- 1.12 spell 9417 (Increases damage and healing done by magical spells and effects by up to 12.)
-- 1.04 spell 0
-- * Modified spell 2
-- 1.12 spell 21625 (Restores 3 mana per 5 sec.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16799;
-- STATS CHANGED: Arcanist Boots (ilevel 66 entry 16800). 1/3 versions
UPDATE item_template SET `stat_value1`=10, `stat_value2`=15, `stat_value3`=17, `stat_type4`=3, `stat_value4`=3, `nature_res`=6, `shadow_res`=3 WHERE entry=16800;
-- SPELLS CHANGED: Arcanist Boots (ilevel 66 entry 16800). 3 versions
-- Source: http://www.thottbot.com/?n=613931 / http://wow.allakhazam.com/db/itemset.html?setid=201
-- Source: http://www.thottbot.com/?i=36042
-- Source: http://wow.allakhazam.com/dyn/items/iname8.html
-- * Modified spell 1
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 23481 (Increases damage done by Fire spells and effects by up to 14.)
-- * Modified spell 2
-- 1.12 spell 9416 (Increases damage and healing done by magical spells and effects by up to 11.)
-- 1.04 spell 9404 (Increases damage done by Frost spells and effects by up to 14.)
UPDATE item_template SET `spellid_1`=23481, `spellid_2`=9404 WHERE entry=16800;
-- STATS CHANGED: Arcanist Gloves (ilevel 66 entry 16801). 3/5 versions
-- CONFLICT:
-- 2005-04-24 19:41:22 to 2005-12-04 10:45:55 (days delta 228) on for example: http://www.thottbot.com/?n=Gehennas / http://wow.allakhazam.com/item.html?witem=16801
-- 2005-04-27 23:47:30 to 2005-11-13 05:51:46 (days delta 203) on for example: http://wow.allakhazam.com/db/item.html?entryid=223741
-- 2005-05-17 19:26:24 to 2005-05-17 19:26:24 (days delta 0) on for example: http://www.thottbot.com/?i=27514
-- 2005-02-07 00:53:57 to 2005-04-13 23:39:26 (days delta 68) on for example: http://wow.allakhazam.com/item.html?witem=16801
-- 2005-02-24 05:09:52 to 2005-02-24 05:57:04 (days delta 0) on for example: http://wow.allakhazam.com/dyn/items/iname10.html
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=17, `stat_value2`=18, `stat_value3`=8, `stat_type4`=3, `stat_value4`=8, `holy_res`=7, `fire_res`=0, `frost_res`=3 WHERE entry=16801;
-- SPELLS CHANGED: Arcanist Gloves (ilevel 66 entry 16801). 5 versions
-- Source: http://www.thottbot.com/?n=Gehennas / http://wow.allakhazam.com/item.html?witem=16801
-- Source: http://wow.allakhazam.com/db/item.html?entryid=223741
-- Source: http://www.thottbot.com/?i=27514
-- Source: http://wow.allakhazam.com/item.html?witem=16801
-- Source: http://wow.allakhazam.com/dyn/items/iname10.html
-- * Modified spell 1
-- 1.12 spell 21618 (Restores 4 mana per 5 sec.)
-- 1.04 spell 23481 (Increases damage done by Fire spells and effects by up to 14.)
-- * Modified spell 2
-- 1.12 spell 9343 (Increases damage and healing done by magical spells and effects by up to 14.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=23481, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16801;
-- STATS CHANGED: Arcanist Belt (ilevel 66 entry 16802). 1/3 versions
UPDATE item_template SET `stat_value1`=26, `stat_value2`=11, `stat_value3`=0, `fire_res`=0 WHERE entry=16802;
-- SPELLS CHANGED: Arcanist Belt (ilevel 66 entry 16802). 3 versions
-- Source: http://www.thottbot.com/?n=616013 / http://wow.allakhazam.com/db/itemset.html?setid=201
-- Source: http://www.thottbot.com/?i=27040
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=201
-- * Modified spell 1
-- 1.12 spell 9343 (Increases damage and healing done by magical spells and effects by up to 14.)
-- 1.04 spell 18379 (Restores 6 mana per 5 sec.)
UPDATE item_template SET `spellid_1`=18379 WHERE entry=16802;
-- STATS CHANGED: Felheart Slippers (ilevel 66 entry 16803). 2/4 versions
-- CONFLICT:
-- 2005-06-23 07:48:54 to 2006-01-11 23:08:24 (days delta 205) on for example: http://www.thottbot.com/?set=203
-- 2005-05-02 10:21:40 to 2005-05-19 12:56:04 (days delta 17) on for example: http://www.thottbot.com/?n=617303
-- 2005-02-07 00:59:39 to 2005-04-06 14:47:39 (days delta 61) on for example: http://wow.allakhazam.com/item.html?witem=16803
-- 2005-02-04 23:41:00 to 2005-02-04 23:41:00 (days delta 0) on for example: http://thottbot.com/?l=latest
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value2`=18, `stat_type3`=6, `stat_value3`=14, `nature_res`=8, `frost_res`=6, `shadow_res`=10 WHERE entry=16803;
-- SPELLS CHANGED: Felheart Slippers (ilevel 66 entry 16803). 4 versions
-- Source: http://www.thottbot.com/?set=203
-- Source: http://www.thottbot.com/?n=617303
-- Source: http://wow.allakhazam.com/item.html?witem=16803
-- Source: http://thottbot.com/?l=latest
-- * Modified spell 1
-- 1.12 spell 9346 (Increases damage and healing done by magical spells and effects by up to 18.)
-- 1.04 spell 9412 (Increases damage done by Shadow spells and effects by up to 11.)
UPDATE item_template SET `spellid_1`=9412 WHERE entry=16803;
-- SPELLS CHANGED: Felheart Bracers (ilevel 66 entry 16804). 4 versions
-- Source: http://www.thottbot.com/?set=203
-- Source: http://www.thottbot.com/?n=615323 / http://wow.allakhazam.com/dyn/items/iname9.html
-- Source: http://www.thottbot.com/?n=616015
-- Source: http://www.thottbot.com/?n=174320
-- * Modified spell 1
-- 1.12 spell 9342 (Increases damage and healing done by magical spells and effects by up to 13.)
-- 1.04 spell 21587 (Restores 1 health per 5 sec.)
-- * Modified spell 2
-- 1.12 spell 0
-- 1.04 spell 7708 (Increases damage done by Shadow spells and effects by up to 7.)
UPDATE item_template SET `spellid_1`=21587, `spellid_2`=7708, `spelltrigger_2`=1 WHERE entry=16804;
-- STATS CHANGED: Felheart Belt (ilevel 66 entry 16806). 2/3 versions
-- CONFLICT:
-- 2005-06-23 07:48:54 to 2006-01-11 23:08:24 (days delta 205) on for example: http://www.thottbot.com/?set=203
-- 2005-04-28 02:31:45 to 2005-05-19 12:56:04 (days delta 22) on for example: http://www.thottbot.com/?n=174323
-- 2005-02-07 00:59:39 to 2005-04-03 22:05:33 (days delta 58) on for example: http://wow.allakhazam.com/db/price.html?witem=16806
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=18, `stat_value2`=10, `stat_value3`=11, `fire_res`=15, `frost_res`=6 WHERE entry=16806;
-- SPELLS CHANGED: Felheart Belt (ilevel 66 entry 16806). 3 versions
-- Source: http://www.thottbot.com/?set=203
-- Source: http://www.thottbot.com/?n=174323
-- Source: http://wow.allakhazam.com/db/price.html?witem=16806
-- * Modified spell 1
-- 1.12 spell 14799 (Increases damage and healing done by magical spells and effects by up to 20.)
-- 1.04 spell 21347 (Restores 4 health per 5 sec.)
-- * Modified spell 2
-- 1.12 spell 0
-- 1.04 spell 9412 (Increases damage done by Shadow spells and effects by up to 11.)
UPDATE item_template SET `spellid_1`=21347, `spellid_2`=9412, `spelltrigger_2`=1 WHERE entry=16806;
-- STATS CHANGED: Felheart Horns (ilevel 66 entry 16808). 1/1 versions
UPDATE item_template SET `stat_value1`=23, `stat_value2`=16, `stat_value3`=20, `stat_type4`=3, `stat_value4`=5, `holy_res`=3, `fire_res`=0, `shadow_res`=10 WHERE entry=16808;
-- SPELLS REMOVED: Felheart Horns (ilevel 66 entry 16808). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname1.html
-- * Modified spell 1
-- 1.12 spell 14799 (Increases damage and healing done by magical spells and effects by up to 20.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16808;
-- STATS CHANGED: Felheart Robes (ilevel 66 entry 16809). 2/5 versions
-- CONFLICT:
-- 2005-06-09 00:58:36 to 2006-06-29 15:41:57 (days delta 392) on for example: http://wow.allakhazam.com/item.html?witem=16809
-- 2005-01-17 01:05:10 to 2006-06-29 15:31:47 (days delta 539) on for example: http://wow.allakhazam.com/dyn/items/iname20.html
-- 2005-06-21 08:13:12 to 2006-01-11 23:08:24 (days delta 207) on for example: http://www.thottbot.com/?set=203
-- 2005-05-06 06:52:27 to 2005-05-19 12:56:04 (days delta 13) on for example: http://www.thottbot.com/?n=519349
-- 2005-02-07 00:59:39 to 2005-04-03 23:32:42 (days delta 58) on for example: http://wow.allakhazam.com/item.html?witem=16809
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=23, `stat_value2`=24, `stat_type3`=6, `stat_value3`=19, `fire_res`=5, `nature_res`=3 WHERE entry=16809;
-- SPELLS CHANGED: Felheart Robes (ilevel 66 entry 16809). 5 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16809
-- Source: http://wow.allakhazam.com/dyn/items/iname20.html
-- Source: http://www.thottbot.com/?set=203
-- Source: http://www.thottbot.com/?n=519349
-- Source: http://wow.allakhazam.com/item.html?witem=16809
-- * Modified spell 1
-- 1.12 spell 9342 (Increases damage and healing done by magical spells and effects by up to 13.)
-- 1.04 spell 9417 (Increases damage and healing done by magical spells and effects by up to 12.)
-- * Modified spell 2
-- 1.12 spell 23727 (Improves your chance to hit with spells by 1%.)
-- 1.04 spell 7708 (Increases damage done by Shadow spells and effects by up to 7.)
-- * Modified spell 3
-- 1.12 spell 0
-- 1.04 spell 21592 (Restores 3 health per 5 sec.)
UPDATE item_template SET `spellid_1`=9417, `spellid_2`=7708, `spellid_3`=21592, `spelltrigger_3`=1 WHERE entry=16809;
-- STATS CHANGED: Felheart Pants (ilevel 66 entry 16810). 3/5 versions
-- CONFLICT:
-- 2005-07-01 02:17:13 to 2006-02-07 01:18:50 (days delta 223) on for example: http://wow.allakhazam.com/item.html?witem=16810
-- 2005-06-23 07:48:54 to 2006-01-11 23:08:24 (days delta 205) on for example: http://www.thottbot.com/?set=203
-- 2005-02-23 11:53:09 to 2005-05-20 01:10:26 (days delta 90) on for example: http://wow.allakhazam.com/dyn/items/itype7.html
-- 2005-05-06 06:52:27 to 2005-05-19 12:56:04 (days delta 13) on for example: http://www.thottbot.com/?n=508478
-- 2005-02-07 00:59:39 to 2005-02-07 00:59:39 (days delta 0) on for example: http://wow.allakhazam.com/db/itemset.html?setid=203
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=11, `stat_value2`=22, `stat_value3`=17, `stat_type4`=3, `stat_value4`=8, `fire_res`=8, `nature_res`=8, `frost_res`=8, `shadow_res`=8, `arcane_res`=8 WHERE entry=16810;
-- SPELLS CHANGED: Felheart Pants (ilevel 66 entry 16810). 5 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16810
-- Source: http://www.thottbot.com/?set=203
-- Source: http://wow.allakhazam.com/dyn/items/itype7.html
-- Source: http://www.thottbot.com/?n=508478
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=203
-- * Modified spell 1
-- 1.12 spell 14798 (Increases damage and healing done by magical spells and effects by up to 30.)
-- 1.04 spell 21596 (Restores 5 health per 5 sec.)
-- * Modified spell 2
-- 1.12 spell 0
-- 1.04 spell 9417 (Increases damage and healing done by magical spells and effects by up to 12.)
UPDATE item_template SET `spellid_1`=21596, `spellid_2`=9417, `spelltrigger_2`=1 WHERE entry=16810;
-- STATS CHANGED: Boots of Prophecy (ilevel 66 entry 16811). 2/2 versions
-- CONFLICT:
-- 2005-02-07 01:47:36 to 2005-05-18 09:23:11 (days delta 104) on for example: http://www.thottbot.com/?n=615341 / http://wow.allakhazam.com/db/itemset.html?setid=202
-- 2005-02-15 11:03:31 to 2005-04-06 14:05:36 (days delta 53) on for example: http://wow.allakhazam.com/dyn/items/iname8.html
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=11, `stat_value2`=20, `stat_value3`=9, `stat_type4`=3, `stat_value4`=8, `holy_res`=10, `fire_res`=10, `shadow_res`=0 WHERE entry=16811;
-- SPELLS REMOVED: Boots of Prophecy (ilevel 66 entry 16811). 2 versions
-- Source: http://www.thottbot.com/?n=615341 / http://wow.allakhazam.com/db/itemset.html?setid=202
-- Source: http://wow.allakhazam.com/dyn/items/iname8.html
-- * Modified spell 1
-- 1.12 spell 9406 (Increases healing done by spells and effects by up to 18.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16811;
-- STATS CHANGED: Gloves of Prophecy (ilevel 66 entry 16812). 1/2 versions
UPDATE item_template SET `stat_value1`=10, `stat_value2`=22, `stat_value3`=6, `fire_res`=0, `frost_res`=5, `shadow_res`=5 WHERE entry=16812;
-- SPELLS CHANGED: Gloves of Prophecy (ilevel 66 entry 16812). 2 versions
-- Source: http://www.thottbot.com/?n=617303
-- Source: http://wow.allakhazam.com/item.html?witem=16812
-- * Modified spell 1
-- 1.12 spell 21626 (Restores 6 mana per 5 sec.)
-- 1.04 spell 9328 (Increases damage done by Shadow spells and effects by up to 21.)
-- * Modified spell 2
-- 1.12 spell 9406 (Increases healing done by spells and effects by up to 18.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=9328, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16812;
-- STATS CHANGED: Circlet of Prophecy (ilevel 66 entry 16813). 2/3 versions
-- CONFLICT:
-- 2005-04-20 22:13:42 to 2005-05-09 12:11:36 (days delta 20) on for example: http://www.thottbot.com/?i=27456 / http://wow.allakhazam.com/item.html?witem=16813
-- 2005-02-07 02:03:23 to 2005-04-04 18:29:55 (days delta 59) on for example: http://wow.allakhazam.com/item.html?witem=16813
-- 2005-02-08 01:42:37 to 2005-02-25 04:19:45 (days delta 17) on for example: http://wow.allakhazam.com/dyn/items/iname1.html
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=23, `stat_value2`=23, `stat_value3`=15, `holy_res`=3, `fire_res`=0 WHERE entry=16813;
-- SPELLS CHANGED: Circlet of Prophecy (ilevel 66 entry 16813). 3 versions
-- Source: http://www.thottbot.com/?i=27456 / http://wow.allakhazam.com/item.html?witem=16813
-- Source: http://wow.allakhazam.com/item.html?witem=16813
-- Source: http://wow.allakhazam.com/dyn/items/iname1.html
-- * Modified spell 1
-- 1.12 spell 9417 (Increases damage and healing done by magical spells and effects by up to 12.)
-- 1.04 spell 9328 (Increases damage done by Shadow spells and effects by up to 21.)
-- * Modified spell 2
-- 1.12 spell 0
-- 1.04 spell 9408 (Increases healing done by spells and effects by up to 22.)
UPDATE item_template SET `spellid_1`=9328, `spellid_2`=9408, `spelltrigger_2`=1 WHERE entry=16813;
-- STATS CHANGED: Netherwind Belt (ilevel 76 entry 16818). 2/4 versions
-- CONFLICT:
-- 2005-06-24 12:01:37 to 2005-12-27 19:24:43 (days delta 189) on for example: http://wow.allakhazam.com/db/itemset.html?setid=210
-- 2005-04-28 15:13:18 to 2005-06-07 12:06:52 (days delta 41) on for example: http://www.thottbot.com/?n=509427 / http://wow.allakhazam.com/db/itemset.html?setid=210
-- 2005-05-30 06:00:54 to 2005-05-30 06:04:30 (days delta 0) on for example: http://www.thottbot.com/?set=210
-- 2005-02-07 01:49:22 to 2005-04-04 19:07:26 (days delta 59) on for example: http://wow.allakhazam.com/db/itemset.html?setid=210
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=30, `stat_value3`=0, `fire_res`=13, `shadow_res`=0 WHERE entry=16818;
-- SPELLS CHANGED: Netherwind Belt (ilevel 76 entry 16818). 4 versions
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=210
-- Source: http://www.thottbot.com/?n=509427 / http://wow.allakhazam.com/db/itemset.html?setid=210
-- Source: http://www.thottbot.com/?set=210
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=210
-- * Modified spell 1
-- 1.12 spell 14047 (Increases damage and healing done by magical spells and effects by up to 23.)
-- 1.04 spell 23481 (Increases damage done by Fire spells and effects by up to 14.)
UPDATE item_template SET `spellid_1`=23481 WHERE entry=16818;
-- STATS CHANGED: Vambraces of Prophecy (ilevel 66 entry 16819). 1/2 versions
UPDATE item_template SET `stat_value1`=11, `stat_value2`=15, `stat_value3`=3, `fire_res`=5, `shadow_res`=5 WHERE entry=16819;
-- SPELLS CHANGED: Vambraces of Prophecy (ilevel 66 entry 16819). 2 versions
-- Source: http://www.thottbot.com/?n=616013
-- Source: http://wow.allakhazam.com/item.html?witem=16819
-- * Modified spell 1
-- 1.12 spell 21624 (Restores 2 mana per 5 sec.)
-- 1.04 spell 9408 (Increases healing done by spells and effects by up to 22.)
-- * Modified spell 2
-- 1.12 spell 9314 (Increases healing done by spells and effects by up to 24.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=9408, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16819;
-- STATS CHANGED: Cenarion Belt (ilevel 66 entry 16828). 1/3 versions
UPDATE item_template SET `stat_value1`=20, `stat_value2`=7, `stat_value3`=8, `stat_type4`=4, `stat_value4`=10, `fire_res`=0, `nature_res`=6 WHERE entry=16828;
-- SPELLS CHANGED: Cenarion Belt (ilevel 66 entry 16828). 3 versions
-- Source: http://www.thottbot.com/?i=28155 / http://wow.allakhazam.com/db/price.html?witem=16828
-- Source: http://www.thottbot.com/?i=26495
-- Source: http://www.thottbot.com/?n=219939 / http://wow.allakhazam.com/db/price.html?witem=16828
-- * Modified spell 1
-- 1.12 spell 21618 (Restores 4 mana per 5 sec.)
-- 1.04 spell 13605 (Increases damage done by Arcane spells and effects by up to 21.)
-- * Modified spell 2
-- 1.12 spell 9415 (Increases damage and healing done by magical spells and effects by up to 9.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=13605, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16828;
-- STATS CHANGED: Cenarion Boots (ilevel 66 entry 16829). 2/3 versions
-- CONFLICT:
-- 2005-02-07 01:18:39 to 2005-05-28 02:12:33 (days delta 114) on for example: http://www.thottbot.com/?n=613931 / http://wow.allakhazam.com/item.html?witem=16829
-- 2005-05-17 18:56:54 to 2005-05-17 18:56:54 (days delta 0) on for example: http://www.thottbot.com/?i=27204
-- 2005-02-15 11:03:31 to 2005-04-06 14:47:39 (days delta 53) on for example: http://wow.allakhazam.com/dyn/items/itype8.html
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=11, `stat_value2`=20, `stat_value3`=12, `stat_type4`=3, `stat_value4`=7, `holy_res`=6, `nature_res`=8, `frost_res`=5, `shadow_res`=0 WHERE entry=16829;
-- SPELLS REMOVED: Cenarion Boots (ilevel 66 entry 16829). 3 versions
-- Source: http://www.thottbot.com/?n=613931 / http://wow.allakhazam.com/item.html?witem=16829
-- Source: http://www.thottbot.com/?i=27204
-- Source: http://wow.allakhazam.com/dyn/items/itype8.html
-- * Modified spell 1
-- 1.12 spell 21625 (Restores 3 mana per 5 sec.)
-- 1.04 spell 0
-- * Modified spell 2
-- 1.12 spell 9406 (Increases healing done by spells and effects by up to 18.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16829;
-- STATS CHANGED: Cenarion Bracers (ilevel 66 entry 16830). 1/3 versions
UPDATE item_template SET `stat_value1`=11, `stat_value2`=10, `stat_value3`=5, `fire_res`=6 WHERE entry=16830;
-- SPELLS CHANGED: Cenarion Bracers (ilevel 66 entry 16830). 3 versions
-- Source: http://www.thottbot.com/?n=174320 / http://wow.allakhazam.com/dyn/items/iname9.html
-- Source: http://www.thottbot.com/?i=26155
-- Source: http://www.thottbot.com/?n=174320 / http://wow.allakhazam.com/item.html?witem=16830
-- * Modified spell 1
-- 1.12 spell 9396 (Increases damage and healing done by magical spells and effects by up to 6.)
-- 1.04 spell 9318 (Increases healing done by spells and effects by up to 33.)
UPDATE item_template SET `spellid_1`=9318 WHERE entry=16830;
-- STATS CHANGED: Cenarion Gloves (ilevel 66 entry 16831). 1/3 versions
UPDATE item_template SET `stat_value1`=10, `stat_value2`=22, `stat_value3`=8, `stat_type4`=4, `stat_value4`=10 WHERE entry=16831;
-- SPELLS CHANGED: Cenarion Gloves (ilevel 66 entry 16831). 3 versions
-- Source: http://www.thottbot.com/?n=615341 / http://wow.allakhazam.com/dyn/items/iname10.html
-- Source: http://www.thottbot.com/?i=27124
-- Source: http://wow.allakhazam.com/profile.html?4474
-- * Modified spell 1
-- 1.12 spell 9406 (Increases healing done by spells and effects by up to 18.)
-- 1.04 spell 13599 (Increases damage done by Arcane spells and effects by up to 14.)
UPDATE item_template SET `spellid_1`=13599 WHERE entry=16831;
-- STATS CHANGED: Bloodfang Spaulders (ilevel 76 entry 16832). 2/4 versions
-- CONFLICT:
-- 2005-02-07 02:12:36 to 2005-05-17 19:00:04 (days delta 103) on for example: http://www.thottbot.com/?i=36929 / http://wow.allakhazam.com/item.html?witem=16832
-- 2005-04-25 08:36:44 to 2005-04-26 07:21:03 (days delta 1) on for example: http://www.thottbot.com/?i=36327
-- 2005-02-28 02:35:15 to 2005-03-21 08:23:53 (days delta 24) on for example: http://www.thottbot.com/?i=27137
-- 2005-02-25 05:05:45 to 2005-03-15 03:54:16 (days delta 21) on for example: http://wow.allakhazam.com/dyn/items/iname3.html
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=30, `stat_value2`=13, `stat_value3`=4, `stat_type4`=6, `stat_value4`=3, `holy_res`=10, `fire_res`=0, `frost_res`=10 WHERE entry=16832;
-- SPELLS REMOVED: Bloodfang Spaulders (ilevel 76 entry 16832). 4 versions
-- Source: http://www.thottbot.com/?i=36929 / http://wow.allakhazam.com/item.html?witem=16832
-- Source: http://www.thottbot.com/?i=36327
-- Source: http://www.thottbot.com/?i=27137
-- Source: http://wow.allakhazam.com/dyn/items/iname3.html
-- * Modified spell 1
-- 1.12 spell 13669 (Increases your chance to dodge an attack by 1%.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16832;
-- STATS CHANGED: Earthfury Boots (ilevel 66 entry 16837). 2/3 versions
-- CONFLICT:
-- 2005-04-27 05:07:57 to 2005-05-18 08:32:54 (days delta 22) on for example: http://www.thottbot.com/?n=613931 / http://wow.allakhazam.com/item.html?witem=16837
-- 2005-04-06 14:05:36 to 2005-04-06 14:05:36 (days delta 0) on for example: http://wow.allakhazam.com/dyn/items/iname8.html
-- 2005-02-07 01:31:20 to 2005-03-18 17:16:05 (days delta 42) on for example: http://wow.allakhazam.com/item.html?witem=16837
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=0, `stat_value2`=19, `stat_value3`=13, `stat_type4`=3, `stat_value4`=11, `nature_res`=7, `shadow_res`=5, `arcane_res`=3 WHERE entry=16837;
-- SPELLS CHANGED: Earthfury Boots (ilevel 66 entry 16837). 3 versions
-- Source: http://www.thottbot.com/?n=613931 / http://wow.allakhazam.com/item.html?witem=16837
-- Source: http://wow.allakhazam.com/dyn/items/iname8.html
-- Source: http://wow.allakhazam.com/item.html?witem=16837
-- * Modified spell 1
-- 1.12 spell 9406 (Increases healing done by spells and effects by up to 18.)
-- 1.04 spell 9404 (Increases damage done by Frost spells and effects by up to 14.)
UPDATE item_template SET `spellid_1`=9404 WHERE entry=16837;
-- STATS CHANGED: Earthfury Belt (ilevel 66 entry 16838). 1/3 versions
UPDATE item_template SET `stat_value1`=18, `stat_value2`=12, `stat_value3`=7, `stat_type4`=4, `stat_value4`=8, `fire_res`=0, `frost_res`=3 WHERE entry=16838;
-- SPELLS CHANGED: Earthfury Belt (ilevel 66 entry 16838). 3 versions
-- Source: http://www.thottbot.com/?n=616013
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=207
-- Source: http://www.thottbot.com/?n=174320
-- * Modified spell 1
-- 1.12 spell 21618 (Restores 4 mana per 5 sec.)
-- 1.04 spell 9408 (Increases healing done by spells and effects by up to 22.)
-- * Modified spell 2
-- 1.12 spell 9406 (Increases healing done by spells and effects by up to 18.)
-- 1.04 spell 9361 (Increases damage done by Nature spells and effects by up to 21.)
UPDATE item_template SET `spellid_1`=9408, `spellid_2`=9361 WHERE entry=16838;
-- STATS CHANGED: Earthfury Gauntlets (ilevel 66 entry 16839). 1/2 versions
UPDATE item_template SET `stat_value1`=8, `stat_value2`=18, `stat_value3`=7, `stat_type4`=4, `stat_value4`=6, `frost_res`=5 WHERE entry=16839;
-- SPELLS CHANGED: Earthfury Gauntlets (ilevel 66 entry 16839). 2 versions
-- Source: http://www.thottbot.com/?n=617303
-- Source: http://wow.allakhazam.com/item.html?witem=16839
-- * Modified spell 1
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 9318 (Increases healing done by spells and effects by up to 33.)
-- * Modified spell 2
-- 1.12 spell 9415 (Increases damage and healing done by magical spells and effects by up to 9.)
-- 1.04 spell 9411 (Increases damage done by Nature spells and effects by up to 14.)
UPDATE item_template SET `spellid_1`=9318, `spellid_2`=9411 WHERE entry=16839;
-- STATS CHANGED: Earthfury Bracers (ilevel 66 entry 16840). 1/2 versions
UPDATE item_template SET `stat_value1`=10, `stat_value2`=8, `stat_value3`=7, `stat_type4`=4, `stat_value4`=8, `fire_res`=5 WHERE entry=16840;
-- SPELLS CHANGED: Earthfury Bracers (ilevel 66 entry 16840). 2 versions
-- Source: http://www.thottbot.com/?n=616009 / http://wow.allakhazam.com/item.html?witem=16840
-- Source: http://wow.allakhazam.com/dyn/items/itype9.html
-- * Modified spell 1
-- 1.12 spell 9396 (Increases damage and healing done by magical spells and effects by up to 6.)
-- 1.04 spell 9408 (Increases healing done by spells and effects by up to 22.)
UPDATE item_template SET `spellid_1`=9408 WHERE entry=16840;
-- STATS CHANGED: Earthfury Legguards (ilevel 66 entry 16843). 1/1 versions
UPDATE item_template SET `stat_value1`=14, `stat_value2`=23, `stat_value3`=13, `stat_type4`=4, `stat_value4`=12, `fire_res`=11, `nature_res`=7, `shadow_res`=7 WHERE entry=16843;
-- SPELLS CHANGED: Earthfury Legguards (ilevel 66 entry 16843). 1 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16843
-- * Modified spell 1
-- 1.12 spell 21627 (Restores 6 mana per 5 sec.)
-- 1.04 spell 9411 (Increases damage done by Nature spells and effects by up to 14.)
-- * Modified spell 2
-- 1.12 spell 9417 (Increases damage and healing done by magical spells and effects by up to 12.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=9411, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16843;
-- STATS CHANGED: Giantstalker's Helmet (ilevel 66 entry 16846). 2/2 versions
-- CONFLICT:
-- 2005-02-07 01:26:21 to 2005-05-25 00:32:20 (days delta 111) on for example: http://www.thottbot.com/?i=37286 / http://wow.allakhazam.com/item.html?witem=16846
-- 2005-02-23 02:06:35 to 2005-02-25 04:19:45 (days delta 2) on for example: http://wow.allakhazam.com/dyn/items/iname1.html
UPDATE item_template SET `stat_value1`=20, `stat_value2`=16, `stat_value3`=7, `holy_res`=8, `fire_res`=12, `frost_res`=12 WHERE entry=16846;
-- SPELLS REMOVED: Giantstalker's Helmet (ilevel 66 entry 16846). 2 versions
-- Source: http://www.thottbot.com/?i=37286 / http://wow.allakhazam.com/item.html?witem=16846
-- Source: http://wow.allakhazam.com/dyn/items/iname1.html
-- * Modified spell 1
-- 1.12 spell 7597 (Improves your chance to get a critical strike by 1%.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16846;
-- STATS CHANGED: Giantstalker's Boots (ilevel 66 entry 16849). 1/2 versions
UPDATE item_template SET `stat_value1`=22, `stat_value2`=7, `stat_value3`=15, `stat_type4`=4, `stat_value4`=6, `nature_res`=9, `shadow_res`=5 WHERE entry=16849;
-- STATS CHANGED: Giantstalker's Bracers (ilevel 66 entry 16850). 1/2 versions
UPDATE item_template SET `stat_value1`=15, `stat_value2`=7, `stat_value3`=6, `stat_value4`=8, `fire_res`=8, `frost_res`=7 WHERE entry=16850;
-- STATS CHANGED: Giantstalker's Belt (ilevel 66 entry 16851). 1/2 versions
UPDATE item_template SET `stat_value1`=15, `stat_value2`=5, `stat_value3`=12, `stat_value4`=11, `fire_res`=10, `nature_res`=9, `shadow_res`=9 WHERE entry=16851;
-- SPELLS REMOVED: Giantstalker's Belt (ilevel 66 entry 16851). 2 versions
-- Source: http://www.thottbot.com/?n=171098 / http://wow.allakhazam.com/db/itemset.html?setid=206
-- Source: http://www.thottbot.com/?i=27034
-- * Modified spell 1
-- 1.12 spell 7597 (Improves your chance to get a critical strike by 1%.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16851;
-- STATS CHANGED: Giantstalker's Gloves (ilevel 66 entry 16852). 1/1 versions
UPDATE item_template SET `stat_value1`=15, `stat_value2`=10, `stat_type3`=6, `stat_value3`=3, `fire_res`=0 WHERE entry=16852;
-- SPELLS CHANGED: Giantstalker's Gloves (ilevel 66 entry 16852). 1 versions
-- Source: http://www.thottbot.com/?n=615341 / http://wow.allakhazam.com/item.html?witem=16852
-- * Modified spell 1
-- 1.12 spell 15465 (Improves your chance to hit by 2%.)
-- 1.04 spell 13670 (Increases your chance to dodge an attack by 2%.)
UPDATE item_template SET `spellid_1`=13670 WHERE entry=16852;
-- STATS CHANGED: Lawbringer Spaulders (ilevel 66 entry 16856). 1/2 versions
UPDATE item_template SET `stat_value1`=14, `stat_value3`=18, `stat_value4`=11, `stat_type5`=3, `stat_value5`=7, `fire_res`=8, `shadow_res`=8 WHERE entry=16856;
-- SPELLS REMOVED: Lawbringer Spaulders (ilevel 66 entry 16856). 2 versions
-- Source: http://www.thottbot.com/?i=Lawbringer%20Helm
-- Source: http://www.thottbot.com/?i=28234 / http://wow.allakhazam.com/item.html?witem=16856
-- * Modified spell 1
-- 1.12 spell 9406 (Increases healing done by spells and effects by up to 18.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16856;
-- STATS CHANGED: Lawbringer Bracers (ilevel 66 entry 16857). 1/3 versions
UPDATE item_template SET `stat_value1`=7, `stat_value2`=12, `stat_type5`=3, `stat_value5`=8 WHERE entry=16857;
-- SPELLS REMOVED: Lawbringer Bracers (ilevel 66 entry 16857). 3 versions
-- Source: http://www.thottbot.com/?i=28234 / http://wow.allakhazam.com/item.html?witem=16857
-- Source: http://www.thottbot.com/?i=Lawbringer%20Helm
-- Source: http://www.thottbot.com/?i=26863
-- * Modified spell 1
-- 1.12 spell 21618 (Restores 4 mana per 5 sec.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16857;
-- STATS CHANGED: Lawbringer Belt (ilevel 66 entry 16858). 2/5 versions
-- CONFLICT:
-- 2005-05-01 05:42:10 to 2005-08-25 13:21:24 (days delta 117) on for example: http://wow.allakhazam.com/db/item.html?entryid=217262
-- 2005-05-01 05:42:27 to 2005-08-24 04:46:05 (days delta 116) on for example: http://www.thottbot.com/?n=616013 / http://wow.allakhazam.com/db/item.html?entryid=217283
-- 2005-05-30 08:50:21 to 2005-05-30 08:50:21 (days delta 0) on for example: http://www.thottbot.com/?i=Lawbringer%20Helm
-- 2005-02-07 01:38:27 to 2005-04-24 19:39:20 (days delta 79) on for example: http://www.thottbot.com/?i=27084 / http://wow.allakhazam.com/db/itemset.html?setid=208
-- 2005-04-24 19:39:20 to 2005-04-24 19:39:20 (days delta 0) on for example: http://www.thottbot.com/?i=27084
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=16, `fire_res`=0, `arcane_res`=3 WHERE entry=16858;
-- SPELLS CHANGED: Lawbringer Belt (ilevel 66 entry 16858). 5 versions
-- Source: http://wow.allakhazam.com/db/item.html?entryid=217262
-- Source: http://www.thottbot.com/?n=616013 / http://wow.allakhazam.com/db/item.html?entryid=217283
-- Source: http://www.thottbot.com/?i=Lawbringer%20Helm
-- Source: http://www.thottbot.com/?i=27084 / http://wow.allakhazam.com/db/itemset.html?setid=208
-- Source: http://www.thottbot.com/?i=27084
-- * Modified spell 1
-- 1.12 spell 9406 (Increases healing done by spells and effects by up to 18.)
-- 1.04 spell 9408 (Increases healing done by spells and effects by up to 22.)
UPDATE item_template SET `spellid_1`=9408 WHERE entry=16858;
-- STATS CHANGED: Lawbringer Boots (ilevel 66 entry 16859). 1/3 versions
UPDATE item_template SET `stat_value1`=0, `stat_value2`=11, `stat_value4`=13, `stat_type5`=3, `stat_value5`=4, `shadow_res`=9 WHERE entry=16859;
-- SPELLS CHANGED: Lawbringer Boots (ilevel 66 entry 16859). 3 versions
-- Source: http://www.thottbot.com/?i=Lawbringer%20Helm
-- Source: http://www.thottbot.com/?n=613931 / http://wow.allakhazam.com/item.html?witem=16859
-- Source: http://www.thottbot.com/?i=27445
-- * Modified spell 1
-- 1.12 spell 21624 (Restores 2 mana per 5 sec.)
-- 1.04 spell 15464 (Improves your chance to hit by 1%.)
-- * Modified spell 2
-- 1.12 spell 9406 (Increases healing done by spells and effects by up to 18.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=15464, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16859;
-- STATS CHANGED: Lawbringer Gauntlets (ilevel 66 entry 16860). 2/4 versions
-- CONFLICT:
-- 2005-02-07 01:38:27 to 2005-08-26 05:27:47 (days delta 205) on for example: http://www.thottbot.com/?n=617303 / http://wow.allakhazam.com/item.html?witem=16860
-- 2005-05-01 05:42:18 to 2005-08-25 21:39:54 (days delta 117) on for example: http://wow.allakhazam.com/db/item.html?entryid=172398
-- 2005-05-30 08:50:21 to 2005-05-30 08:50:21 (days delta 0) on for example: http://www.thottbot.com/?i=Lawbringer%20Helm
-- 2005-05-17 19:15:39 to 2005-05-17 19:15:39 (days delta 0) on for example: http://www.thottbot.com/?i=28178
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=0, `stat_value2`=17, `stat_value3`=11, `stat_value4`=15, `fire_res`=0, `frost_res`=10, `arcane_res`=11 WHERE entry=16860;
-- SPELLS CHANGED: Lawbringer Gauntlets (ilevel 66 entry 16860). 4 versions
-- Source: http://www.thottbot.com/?n=617303 / http://wow.allakhazam.com/item.html?witem=16860
-- Source: http://wow.allakhazam.com/db/item.html?entryid=172398
-- Source: http://www.thottbot.com/?i=Lawbringer%20Helm
-- Source: http://www.thottbot.com/?i=28178
-- * Modified spell 1
-- 1.12 spell 9406 (Increases healing done by spells and effects by up to 18.)
-- 1.04 spell 13674 (Increases your chance to block attacks with a shield by 1%.)
UPDATE item_template SET `spellid_1`=13674 WHERE entry=16860;
-- STATS CHANGED: Bracers of Might (ilevel 66 entry 16861). 1/2 versions
UPDATE item_template SET `stat_value1`=18, `stat_type3`=3, `stat_value3`=8, `fire_res`=5 WHERE entry=16861;
-- STATS CHANGED: Sabatons of Might (ilevel 66 entry 16862). 1/2 versions
UPDATE item_template SET `stat_value1`=23, `stat_type3`=6, `stat_value3`=5, `frost_res`=7, `shadow_res`=0 WHERE entry=16862;
-- SPELLS REMOVED: Sabatons of Might (ilevel 66 entry 16862). 2 versions
-- Source: http://www.thottbot.com/?n=509427 / http://wow.allakhazam.com/item.html?witem=16862
-- Source: http://www.thottbot.com/?i=27205
-- * Modified spell 1
-- 1.12 spell 13383 (Increased Defense +5.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16862;
-- STATS CHANGED: Gauntlets of Might (ilevel 66 entry 16863). 1/1 versions
UPDATE item_template SET `stat_value2`=18, `stat_type3`=6, `stat_value3`=11, `shadow_res`=11 WHERE entry=16863;
-- SPELLS CHANGED: Gauntlets of Might (ilevel 66 entry 16863). 1 versions
-- Source: http://www.thottbot.com/?n=613931 / http://wow.allakhazam.com/profile.html?103342
-- * Modified spell 1
-- 1.12 spell 15464 (Improves your chance to hit by 1%.)
-- 1.04 spell 7597 (Improves your chance to get a critical strike by 1%.)
-- * Modified spell 2
-- 1.12 spell 13383 (Increased Defense +5.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=7597, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16863;
-- STATS CHANGED: Belt of Might (ilevel 66 entry 16864). 2/3 versions
-- CONFLICT:
-- 2005-02-07 01:41:47 to 2005-12-06 14:08:36 (days delta 309) on for example: http://www.thottbot.com/?n=171098 / http://wow.allakhazam.com/db/itemset.html?setid=209
-- 2005-04-27 23:49:31 to 2005-09-13 16:23:08 (days delta 141) on for example: http://wow.allakhazam.com/db/item.html?entryid=172350
-- 2005-05-09 12:11:15 to 2005-05-09 12:11:15 (days delta 0) on for example: http://www.thottbot.com/?i=26806
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value2`=17, `stat_type3`=3, `stat_value3`=5, `fire_res`=11, `nature_res`=8, `frost_res`=9, `arcane_res`=9 WHERE entry=16864;
-- SPELLS CHANGED: Belt of Might (ilevel 66 entry 16864). 3 versions
-- Source: http://www.thottbot.com/?n=171098 / http://wow.allakhazam.com/db/itemset.html?setid=209
-- Source: http://wow.allakhazam.com/db/item.html?entryid=172350
-- Source: http://www.thottbot.com/?i=26806
-- * Modified spell 2
-- 1.12 spell 13383 (Increased Defense +5.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16864;
-- SPELLS CHANGED: Breastplate of Might (ilevel 66 entry 16865). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16865
-- Source: http://www.thottbot.com/?n=508478 / http://wow.allakhazam.com/dyn/items/itype5.html
-- * Modified spell 2
-- 1.12 spell 13385 (Increased Defense +7.)
-- 1.04 spell 13386 (Increased Defense +7.)
UPDATE item_template SET `spellid_2`=13386 WHERE entry=16865;
-- STATS CHANGED: Helm of Might (ilevel 66 entry 16866). 2/2 versions
-- CONFLICT:
-- 2005-02-07 01:41:47 to 2005-05-09 12:11:32 (days delta 95) on for example: http://www.thottbot.com/?i=27519 / http://wow.allakhazam.com/item.html?witem=16866
-- 2005-02-25 03:28:41 to 2005-02-25 03:28:41 (days delta 0) on for example: http://wow.allakhazam.com/dyn/items/iminlev1.html
UPDATE item_template SET `stat_value1`=27, `stat_value2`=17, `stat_type3`=6, `stat_value3`=10, `holy_res`=12, `fire_res`=0, `nature_res`=7 WHERE entry=16866;
-- SPELLS CHANGED: Helm of Might (ilevel 66 entry 16866). 2 versions
-- Source: http://www.thottbot.com/?i=27519 / http://wow.allakhazam.com/item.html?witem=16866
-- Source: http://wow.allakhazam.com/dyn/items/iminlev1.html
-- * Modified spell 1
-- 1.12 spell 13669 (Increases your chance to dodge an attack by 1%.)
-- 1.04 spell 15464 (Improves your chance to hit by 1%.)
-- * Modified spell 2
-- 1.12 spell 13385 (Increased Defense +7.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=15464, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16866;
-- SPELLS CHANGED: Legplates of Might (ilevel 66 entry 16867). 3 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16867
-- Source: http://www.thottbot.com/?n=508478 / http://wow.allakhazam.com/item.html?witem=16867
-- Source: http://www.thottbot.com/?i=27519
-- * Modified spell 2
-- 1.12 spell 13385 (Increased Defense +7.)
-- 1.04 spell 13386 (Increased Defense +7.)
UPDATE item_template SET `spellid_2`=13386 WHERE entry=16867;
-- STATS CHANGED: Pauldrons of Might (ilevel 66 entry 16868). 1/2 versions
UPDATE item_template SET `stat_type3`=3, `stat_value3`=10, `nature_res`=6, `frost_res`=5, `shadow_res`=6 WHERE entry=16868;
-- SPELLS REMOVED: Pauldrons of Might (ilevel 66 entry 16868). 2 versions
-- Source: http://www.thottbot.com/?n=616010 / http://wow.allakhazam.com/item.html?witem=16868
-- Source: http://www.thottbot.com/?i=26588
-- * Modified spell 1
-- 1.12 spell 13675 (Increases your chance to block attacks with a shield by 2%.)
-- 1.04 spell 0
-- * Modified spell 2
-- 1.12 spell 13383 (Increased Defense +5.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16868;
-- STATS CHANGED: Stormrage Chestguard (ilevel 76 entry 16897). 1/2 versions
UPDATE item_template SET `stat_value1`=23, `stat_value2`=32, `stat_value3`=16, `stat_type4`=4, `stat_value4`=8, `fire_res`=5, `nature_res`=7, `frost_res`=6 WHERE entry=16897;
-- SPELLS CHANGED: Stormrage Chestguard (ilevel 76 entry 16897). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype5.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=16897
-- * Modified spell 1
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 13592 (Increases damage done by Arcane spells and effects by up to 4.)
-- * Modified spell 2
-- 1.12 spell 18032 (Increases healing done by spells and effects by up to 42.)
-- 1.04 spell 7692 (Increases damage done by Nature spells and effects by up to 4.)
-- * Modified spell 3
-- 1.12 spell 0
-- 1.04 spell 7678 (Increases healing done by spells and effects by up to 9.)
UPDATE item_template SET `spellid_1`=13592, `spellid_2`=7692, `spellid_3`=7678, `spelltrigger_3`=1 WHERE entry=16897;
-- STATS CHANGED: Stormrage Boots (ilevel 76 entry 16898). 1/1 versions
UPDATE item_template SET `stat_value1`=12, `stat_value2`=23, `stat_value3`=14, `stat_type4`=3, `stat_value4`=7, `fire_res`=8, `shadow_res`=6 WHERE entry=16898;
-- SPELLS CHANGED: Stormrage Boots (ilevel 76 entry 16898). 1 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16898
-- * Modified spell 1
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 13596 (Increases damage done by Arcane spells and effects by up to 10.)
-- * Modified spell 2
-- 1.12 spell 9315 (Increases healing done by spells and effects by up to 26.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=13596, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16898;
-- STATS CHANGED: Stormrage Handguards (ilevel 76 entry 16899). 1/2 versions
UPDATE item_template SET `stat_value1`=13, `stat_value2`=25, `stat_value3`=8, `stat_type4`=4, `stat_value4`=8, `shadow_res`=0 WHERE entry=16899;
-- SPELLS CHANGED: Stormrage Handguards (ilevel 76 entry 16899). 2 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=16899
-- Source: http://wow.allakhazam.com/item.html?witem=16899
-- * Modified spell 1
-- 1.12 spell 18032 (Increases healing done by spells and effects by up to 42.)
-- 1.04 spell 7694 (Increases damage done by Nature spells and effects by up to 7.)
-- * Modified spell 2
-- 1.12 spell 0
-- 1.04 spell 9318 (Increases healing done by spells and effects by up to 33.)
UPDATE item_template SET `spellid_1`=7694, `spellid_2`=9318, `spelltrigger_2`=1 WHERE entry=16899;
-- STATS CHANGED: Stormrage Cover (ilevel 76 entry 16900). 3/4 versions
-- CONFLICT:
-- 2005-05-07 11:50:31 to 2005-05-24 04:26:14 (days delta 17) on for example: http://wow.allakhazam.com/db/item.html?entryid=217281
-- 2005-05-07 11:50:28 to 2005-05-15 03:49:50 (days delta 8) on for example: http://wow.allakhazam.com/db/item.html?entryid=217254
-- 2005-02-22 12:34:30 to 2005-04-24 20:02:50 (days delta 64) on for example: http://www.thottbot.com/?n=480638 / http://wow.allakhazam.com/item.html?witem=16900
-- 2005-02-23 02:06:35 to 2005-02-25 04:19:45 (days delta 2) on for example: http://wow.allakhazam.com/dyn/items/iname1.html
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value2`=17, `stat_value3`=15, `holy_res`=9, `frost_res`=0, `shadow_res`=9 WHERE entry=16900;
-- SPELLS CHANGED: Stormrage Cover (ilevel 76 entry 16900). 4 versions
-- Source: http://wow.allakhazam.com/db/item.html?entryid=217281
-- Source: http://wow.allakhazam.com/db/item.html?entryid=217254
-- Source: http://www.thottbot.com/?n=480638 / http://wow.allakhazam.com/item.html?witem=16900
-- Source: http://wow.allakhazam.com/dyn/items/iname1.html
-- * Modified spell 1
-- 1.12 spell 21626 (Restores 6 mana per 5 sec.)
-- 1.04 spell 13604 (Increases damage done by Arcane spells and effects by up to 20.)
-- * Modified spell 2
-- 1.12 spell 9316 (Increases healing done by spells and effects by up to 29.)
-- 1.04 spell 18031 (Increases healing done by spells and effects by up to 40.)
UPDATE item_template SET `spellid_1`=13604, `spellid_2`=18031 WHERE entry=16900;
-- STATS CHANGED: Stormrage Legguards (ilevel 76 entry 16901). 1/2 versions
UPDATE item_template SET `stat_value1`=17, `stat_value2`=27, `stat_value3`=14, `stat_type4`=4, `stat_value4`=6, `fire_res`=12, `frost_res`=9, `shadow_res`=8, `arcane_res`=0 WHERE entry=16901;
-- SPELLS CHANGED: Stormrage Legguards (ilevel 76 entry 16901). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16901
-- Source: http://wow.allakhazam.com/db/item.html?witem=16901
-- * Modified spell 1
-- 1.12 spell 18034 (Increases healing done by spells and effects by up to 48.)
-- 1.04 spell 13592 (Increases damage done by Arcane spells and effects by up to 4.)
-- * Modified spell 2
-- 1.12 spell 18379 (Restores 6 mana per 5 sec.)
-- 1.04 spell 9360 (Increases damage done by Nature spells and effects by up to 20.)
UPDATE item_template SET `spellid_1`=13592, `spellid_2`=9360 WHERE entry=16901;
-- STATS CHANGED: Stormrage Pauldrons (ilevel 76 entry 16902). 1/1 versions
UPDATE item_template SET `stat_value1`=23, `stat_value2`=13, `stat_value3`=15, `stat_type4`=4, `stat_value4`=4, `fire_res`=6, `nature_res`=14 WHERE entry=16902;
-- SPELLS REMOVED: Stormrage Pauldrons (ilevel 76 entry 16902). 1 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16902
-- * Modified spell 1
-- 1.12 spell 9316 (Increases healing done by spells and effects by up to 29.)
-- 1.04 spell 0
-- * Modified spell 2
-- 1.12 spell 21618 (Restores 4 mana per 5 sec.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16902;
-- STATS CHANGED: Stormrage Belt (ilevel 76 entry 16903). 1/2 versions
UPDATE item_template SET `stat_value1`=20, `stat_value2`=13, `stat_value3`=6, `stat_type4`=4, `stat_value4`=10, `frost_res`=3, `shadow_res`=0 WHERE entry=16903;
-- SPELLS CHANGED: Stormrage Belt (ilevel 76 entry 16903). 2 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=16903
-- Source: http://wow.allakhazam.com/db/item.html?witem=16903
-- * Modified spell 1
-- 1.12 spell 9315 (Increases healing done by spells and effects by up to 26.)
-- 1.04 spell 17990 (Increases damage done by Nature spells and effects by up to 27.)
-- * Modified spell 2
-- 1.12 spell 21618 (Restores 4 mana per 5 sec.)
-- 1.04 spell 9408 (Increases healing done by spells and effects by up to 22.)
UPDATE item_template SET `spellid_1`=17990, `spellid_2`=9408 WHERE entry=16903;
-- STATS CHANGED: Stormrage Bracers (ilevel 76 entry 16904). 3/3 versions
-- CONFLICT:
-- 2005-04-27 22:57:01 to 2005-11-15 07:37:05 (days delta 205) on for example: http://wow.allakhazam.com/db/item.html?witem=16904
-- 2005-02-23 11:53:13 to 2005-03-24 05:00:42 (days delta 32) on for example: http://wow.allakhazam.com/dyn/items/itype9.html
-- 2005-02-22 12:34:47 to 2005-02-28 00:17:12 (days delta 6) on for example: http://wow.allakhazam.com/item.html?witem=16904
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=12, `stat_value2`=16, `stat_value3`=3, `arcane_res`=9 WHERE entry=16904;
-- SPELLS CHANGED: Stormrage Bracers (ilevel 76 entry 16904). 3 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=16904
-- Source: http://wow.allakhazam.com/dyn/items/itype9.html
-- Source: http://wow.allakhazam.com/item.html?witem=16904
-- * Modified spell 1
-- 1.12 spell 9318 (Increases healing done by spells and effects by up to 33.)
-- 1.04 spell 13605 (Increases damage done by Arcane spells and effects by up to 21.)
UPDATE item_template SET `spellid_1`=13605 WHERE entry=16904;
-- STATS CHANGED: Bloodfang Chestpiece (ilevel 76 entry 16905). 1/2 versions
UPDATE item_template SET `stat_value1`=40, `stat_value2`=12, `stat_value3`=11, `stat_type4`=6, `stat_value4`=11, `fire_res`=8, `nature_res`=0, `shadow_res`=8 WHERE entry=16905;
-- SPELLS CHANGED: Bloodfang Chestpiece (ilevel 76 entry 16905). 2 versions
-- Source: http://www.thottbot.com/?i=36929 / http://wow.allakhazam.com/dyn/items/itype5.html
-- Source: http://www.thottbot.com/?i=36928
-- * Modified spell 1
-- 1.12 spell 7597 (Improves your chance to get a critical strike by 1%.)
-- 1.04 spell 13669 (Increases your chance to dodge an attack by 1%.)
-- * Modified spell 2
-- 1.12 spell 15465 (Improves your chance to hit by 2%.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=13669, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16905;
-- STATS CHANGED: Bloodfang Boots (ilevel 76 entry 16906). 1/3 versions
UPDATE item_template SET `stat_value1`=27, `stat_value2`=16, `stat_value3`=4, `stat_type4`=6, `stat_value4`=8, `fire_res`=0, `nature_res`=13 WHERE entry=16906;
-- SPELLS REMOVED: Bloodfang Boots (ilevel 76 entry 16906). 3 versions
-- Source: http://www.thottbot.com/?i=36929 / http://wow.allakhazam.com/item.html?witem=16906
-- Source: http://wow.allakhazam.com/dyn/items/itype8.html
-- Source: http://www.thottbot.com/?i=27137
-- * Modified spell 1
-- 1.12 spell 13669 (Increases your chance to dodge an attack by 1%.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16906;
-- STATS CHANGED: Bloodfang Gloves (ilevel 76 entry 16907). 1/2 versions
UPDATE item_template SET `stat_value1`=17, `stat_value2`=13, `stat_value3`=16, `fire_res`=8, `shadow_res`=0 WHERE entry=16907;
-- SPELLS CHANGED: Bloodfang Gloves (ilevel 76 entry 16907). 2 versions
-- Source: http://www.thottbot.com/?n=508478 / http://wow.allakhazam.com/item.html?witem=16907
-- Source: http://www.thottbot.com/?i=27137
-- * Modified spell 1
-- 1.12 spell 7219 (Immune to Disarm.)
-- 1.04 spell 15465 (Improves your chance to hit by 2%.)
UPDATE item_template SET `spellid_1`=15465 WHERE entry=16907;
-- STATS CHANGED: Bloodfang Hood (ilevel 76 entry 16908). 2/3 versions
-- CONFLICT:
-- 2005-05-17 18:59:03 to 2005-05-17 19:00:04 (days delta 0) on for example: http://www.thottbot.com/?i=36929
-- 2005-02-05 00:36:31 to 2005-04-26 07:21:03 (days delta 83) on for example: http://www.thottbot.com/?n=480638 / http://wow.allakhazam.com/item.html?witem=16908
-- 2005-02-23 02:06:35 to 2005-02-25 04:19:45 (days delta 2) on for example: http://wow.allakhazam.com/dyn/items/iname1.html
UPDATE item_template SET `stat_value1`=23, `stat_value2`=17, `stat_value3`=9, `holy_res`=7, `frost_res`=7, `shadow_res`=8 WHERE entry=16908;
-- WARNING: NOT FOUND FOR DESC "1% chance to stun a victim struck in combat for 3 sec." (guessed 20884)
-- SPELLS CHANGED: Bloodfang Hood (ilevel 76 entry 16908). 3 versions
-- Source: http://www.thottbot.com/?i=36929
-- Source: http://www.thottbot.com/?n=480638 / http://wow.allakhazam.com/item.html?witem=16908
-- Source: http://wow.allakhazam.com/dyn/items/iname1.html
-- Warning: UNSURE DATA
-- * Modified spell 1
-- 1.12 spell 7597 (Improves your chance to get a critical strike by 1%.)
-- 1.04 spell 20884 (1% chance to stun a victim struck in combat for 1 sec.)
UPDATE item_template SET `spellid_1`=20884 WHERE entry=16908;
-- STATS CHANGED: Bloodfang Pants (ilevel 76 entry 16909). 2/3 versions
-- CONFLICT:
-- 2005-02-07 02:12:36 to 2005-05-29 17:07:35 (days delta 115) on for example: http://www.thottbot.com/?i=36929 / http://wow.allakhazam.com/item.html?witem=16909
-- 2005-05-17 19:00:04 to 2005-05-17 19:00:04 (days delta 0) on for example: http://www.thottbot.com/?i=36929
-- 2005-02-22 02:38:41 to 2005-02-23 12:25:35 (days delta 1) on for example: http://wow.allakhazam.com/dyn/items/iname7.html
UPDATE item_template SET `stat_value1`=36, `stat_value2`=18, `stat_type4`=6, `stat_value4`=8, `holy_res`=10, `nature_res`=10, `frost_res`=10, `shadow_res`=10, `arcane_res`=0 WHERE entry=16909;
-- SPELLS REMOVED: Bloodfang Pants (ilevel 76 entry 16909). 3 versions
-- Source: http://www.thottbot.com/?i=36929 / http://wow.allakhazam.com/item.html?witem=16909
-- Source: http://www.thottbot.com/?i=36929
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- * Modified spell 1
-- 1.12 spell 7597 (Improves your chance to get a critical strike by 1%.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16909;
-- STATS CHANGED: Bloodfang Belt (ilevel 76 entry 16910). 1/2 versions
UPDATE item_template SET `stat_value1`=17, `stat_value2`=11, `stat_type4`=6, `stat_value4`=5, `fire_res`=11, `nature_res`=3 WHERE entry=16910;
-- STATS CHANGED: Bloodfang Bracers (ilevel 76 entry 16911). 1/3 versions
UPDATE item_template SET `stat_type3`=6, `stat_value3`=9 WHERE entry=16911;
-- SPELLS REMOVED: Bloodfang Bracers (ilevel 76 entry 16911). 3 versions
-- Source: http://www.thottbot.com/?i=36929 / http://wow.allakhazam.com/item.html?witem=16911
-- Source: http://www.thottbot.com/?i=27594
-- Source: http://www.thottbot.com/?i=27137
-- * Modified spell 1
-- 1.12 spell 15464 (Improves your chance to hit by 1%.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16911;
-- STATS CHANGED: Netherwind Boots (ilevel 76 entry 16912). 1/3 versions
UPDATE item_template SET `stat_value1`=17, `stat_value2`=20, `fire_res`=0, `nature_res`=10 WHERE entry=16912;
-- SPELLS CHANGED: Netherwind Boots (ilevel 76 entry 16912). 3 versions
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=210
-- Source: http://www.thottbot.com/?set=210
-- Source: http://wow.allakhazam.com/item.html?witem=16912
-- * Modified spell 1
-- 1.12 spell 14054 (Increases damage and healing done by magical spells and effects by up to 27.)
-- 1.04 spell 13605 (Increases damage done by Arcane spells and effects by up to 21.)
UPDATE item_template SET `spellid_1`=13605 WHERE entry=16912;
-- STATS CHANGED: Netherwind Gloves (ilevel 76 entry 16913). 2/4 versions
-- CONFLICT:
-- 2005-06-24 12:01:37 to 2005-12-27 10:48:45 (days delta 189) on for example: http://wow.allakhazam.com/db/itemset.html?setid=210
-- 2005-05-26 05:37:43 to 2005-06-07 12:06:52 (days delta 12) on for example: http://wow.allakhazam.com/db/itemset.html?setid=210
-- 2005-05-30 06:00:54 to 2005-05-30 06:04:30 (days delta 0) on for example: http://www.thottbot.com/?set=210
-- 2005-02-07 01:49:22 to 2005-04-04 19:18:32 (days delta 59) on for example: http://wow.allakhazam.com/item.html?witem=16913
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=17, `stat_value2`=23, `stat_value3`=3, `shadow_res`=15 WHERE entry=16913;
-- SPELLS CHANGED: Netherwind Gloves (ilevel 76 entry 16913). 4 versions
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=210
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=210
-- Source: http://www.thottbot.com/?set=210
-- Source: http://wow.allakhazam.com/item.html?witem=16913
-- * Modified spell 2
-- 1.12 spell 14799 (Increases damage and healing done by magical spells and effects by up to 20.)
-- 1.04 spell 9344 (Increases damage and healing done by magical spells and effects by up to 15.)
UPDATE item_template SET `spellid_2`=9344 WHERE entry=16913;
-- STATS CHANGED: Netherwind Crown (ilevel 76 entry 16914). 2/4 versions
-- CONFLICT:
-- 2005-06-24 12:01:37 to 2005-12-24 23:58:45 (days delta 186) on for example: http://wow.allakhazam.com/profile.html?38061
-- 2005-04-24 20:02:50 to 2005-06-07 12:06:52 (days delta 45) on for example: http://www.thottbot.com/?n=480638 / http://wow.allakhazam.com/item.html?witem=16914
-- 2005-05-30 06:00:54 to 2005-05-30 06:04:30 (days delta 0) on for example: http://www.thottbot.com/?set=210
-- 2005-02-07 01:49:22 to 2005-04-11 08:25:10 (days delta 66) on for example: http://wow.allakhazam.com/item.html?witem=16914
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=40, `stat_value2`=14, `stat_value3`=8, `fire_res`=3, `frost_res`=0, `shadow_res`=0, `arcane_res`=8 WHERE entry=16914;
-- SPELLS CHANGED: Netherwind Crown (ilevel 76 entry 16914). 4 versions
-- Source: http://wow.allakhazam.com/profile.html?38061
-- Source: http://www.thottbot.com/?n=480638 / http://wow.allakhazam.com/item.html?witem=16914
-- Source: http://www.thottbot.com/?set=210
-- Source: http://wow.allakhazam.com/item.html?witem=16914
-- * Modified spell 1
-- 1.12 spell 21619 (Restores 4 mana per 5 sec.)
-- 1.04 spell 17824 (Increases damage done by Arcane spells and effects by up to 27.)
-- * Modified spell 2
-- 1.12 spell 17367 (Increases damage and healing done by magical spells and effects by up to 32.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=17824, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16914;
-- STATS CHANGED: Netherwind Pants (ilevel 76 entry 16915). 3/5 versions
-- CONFLICT:
-- 2005-06-24 12:01:37 to 2005-12-24 23:58:45 (days delta 186) on for example: http://wow.allakhazam.com/item.html?witem=16915
-- 2005-07-01 02:17:13 to 2005-07-06 05:22:49 (days delta 5) on for example: http://wow.allakhazam.com/dyn/items/iname7.html
-- 2005-04-27 22:57:06 to 2005-06-07 12:06:52 (days delta 42) on for example: http://wow.allakhazam.com/item.html?witem=16915
-- 2005-05-30 06:00:54 to 2005-05-30 06:04:30 (days delta 0) on for example: http://www.thottbot.com/?set=210
-- 2005-02-07 01:49:22 to 2005-05-20 01:10:26 (days delta 106) on for example: http://wow.allakhazam.com/item.html?witem=16915
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=26, `stat_value2`=27, `stat_value3`=0, `stat_type4`=3, `stat_value4`=8, `fire_res`=0, `nature_res`=3, `frost_res`=17, `arcane_res`=0 WHERE entry=16915;
-- SPELLS CHANGED: Netherwind Pants (ilevel 76 entry 16915). 5 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16915
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- Source: http://wow.allakhazam.com/item.html?witem=16915
-- Source: http://www.thottbot.com/?set=210
-- Source: http://wow.allakhazam.com/item.html?witem=16915
-- * Modified spell 1
-- 1.12 spell 14798 (Increases damage and healing done by magical spells and effects by up to 30.)
-- 1.04 spell 22747 (Increases damage and healing done by magical spells and effects by up to 30.)
-- * Modified spell 2
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=22747, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16915;
-- STATS CHANGED: Netherwind Robes (ilevel 76 entry 16916). 1/4 versions
UPDATE item_template SET `stat_value1`=36, `stat_value2`=17, `stat_value3`=8, `fire_res`=9, `nature_res`=3 WHERE entry=16916;
-- SPELLS CHANGED: Netherwind Robes (ilevel 76 entry 16916). 4 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16916
-- Source: http://wow.allakhazam.com/item.html?witem=16916
-- Source: http://www.thottbot.com/?set=210
-- Source: http://www.thottbot.com/?i=38375
-- * Modified spell 1
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 25065 (Increases damage done by fire spells and effects by up to 20.)
-- * Modified spell 2
-- 1.12 spell 17367 (Increases damage and healing done by magical spells and effects by up to 32.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=25065, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16916;
-- STATS CHANGED: Netherwind Mantle (ilevel 76 entry 16917). 3/5 versions
-- CONFLICT:
-- 2005-06-23 00:26:29 to 2005-12-24 23:58:45 (days delta 187) on for example: http://wow.allakhazam.com/item.html?witem=16917
-- 2005-05-02 11:00:14 to 2005-06-07 12:06:52 (days delta 36) on for example: http://wow.allakhazam.com/item.html?witem=16917
-- 2005-05-30 06:00:54 to 2005-05-30 06:04:30 (days delta 0) on for example: http://www.thottbot.com/?set=210
-- 2005-02-07 01:49:22 to 2005-04-04 19:55:25 (days delta 59) on for example: http://wow.allakhazam.com/item.html?witem=16917
-- 2005-02-22 12:13:20 to 2005-03-15 03:54:16 (days delta 24) on for example: http://wow.allakhazam.com/dyn/items/itype3.html
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=27, `stat_value2`=8, `stat_value3`=10, `stat_type4`=3, `stat_value4`=6, `holy_res`=6, `fire_res`=0 WHERE entry=16917;
-- SPELLS CHANGED: Netherwind Mantle (ilevel 76 entry 16917). 5 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16917
-- Source: http://wow.allakhazam.com/item.html?witem=16917
-- Source: http://www.thottbot.com/?set=210
-- Source: http://wow.allakhazam.com/item.html?witem=16917
-- Source: http://wow.allakhazam.com/dyn/items/itype3.html
-- * Modified spell 2
-- 1.12 spell 14248 (Increases damage and healing done by magical spells and effects by up to 21.)
-- 1.04 spell 9343 (Increases damage and healing done by magical spells and effects by up to 14.)
UPDATE item_template SET `spellid_2`=9343 WHERE entry=16917;
-- STATS CHANGED: Netherwind Bindings (ilevel 76 entry 16918). 1/2 versions
UPDATE item_template SET `stat_value1`=23, `stat_value2`=13 WHERE entry=16918;
-- SPELLS REMOVED: Netherwind Bindings (ilevel 76 entry 16918). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname9.html
-- Source: http://www.thottbot.com/?set=210
-- * Modified spell 1
-- 1.12 spell 14254 (Increases damage and healing done by magical spells and effects by up to 19.)
-- 1.04 spell 0
-- * Modified spell 2
-- 1.12 spell 21362 (Restores 4 mana per 5 sec.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16918;
-- STATS CHANGED: Boots of Transcendence (ilevel 76 entry 16919). 1/3 versions
UPDATE item_template SET `stat_value1`=13, `stat_value2`=23, `stat_value3`=15, `stat_type4`=3, `stat_value4`=6, `fire_res`=0 WHERE entry=16919;
-- SPELLS CHANGED: Boots of Transcendence (ilevel 76 entry 16919). 3 versions
-- Source: http://www.thottbot.com/?n=480638
-- Source: http://wow.allakhazam.com/item.html?witem=16919
-- Source: http://www.thottbot.com/?i=27861
-- * Modified spell 1
-- 1.12 spell 18029 (Increases healing done by spells and effects by up to 35.)
-- 1.04 spell 9328 (Increases damage done by Shadow spells and effects by up to 21.)
UPDATE item_template SET `spellid_1`=9328 WHERE entry=16919;
-- STATS CHANGED: Handguards of Transcendence (ilevel 76 entry 16920). 2/3 versions
-- CONFLICT:
-- 2005-02-07 01:58:06 to 2005-05-02 10:21:40 (days delta 88) on for example: http://www.thottbot.com/?n=519341 / http://wow.allakhazam.com/item.html?witem=16920
-- 2005-03-17 05:49:23 to 2005-03-17 05:49:23 (days delta 0) on for example: http://www.thottbot.com/?i=27861
-- 2005-02-24 05:09:52 to 2005-02-24 05:09:52 (days delta 0) on for example: http://wow.allakhazam.com/dyn/items/iminlev10.html
UPDATE item_template SET `stat_value1`=13, `stat_value2`=25, `stat_value3`=0, `holy_res`=12, `nature_res`=6, `shadow_res`=0 WHERE entry=16920;
-- SPELLS CHANGED: Handguards of Transcendence (ilevel 76 entry 16920). 3 versions
-- Source: http://www.thottbot.com/?n=519341 / http://wow.allakhazam.com/item.html?witem=16920
-- Source: http://www.thottbot.com/?i=27861
-- Source: http://wow.allakhazam.com/dyn/items/iminlev10.html
-- * Modified spell 1
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 25067 (Increases healing done by spells and effects by up to 30.)
-- * Modified spell 2
-- 1.12 spell 9316 (Increases healing done by spells and effects by up to 29.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=25067, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16920;
-- STATS CHANGED: Halo of Transcendence (ilevel 76 entry 16921). 1/2 versions
UPDATE item_template SET `stat_value2`=26, `fire_res`=12, `nature_res`=12, `frost_res`=0, `shadow_res`=12 WHERE entry=16921;
-- SPELLS REMOVED: Halo of Transcendence (ilevel 76 entry 16921). 2 versions
-- Source: http://www.thottbot.com/?n=480638 / http://wow.allakhazam.com/item.html?witem=16921
-- Source: http://www.thottbot.com/?i=27861
-- * Modified spell 1
-- 1.12 spell 18034 (Increases healing done by spells and effects by up to 48.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16921;
-- STATS CHANGED: Leggings of Transcendence (ilevel 76 entry 16922). 3/3 versions
-- CONFLICT:
-- 2005-07-06 05:22:49 to 2005-09-01 09:07:50 (days delta 57) on for example: http://wow.allakhazam.com/dyn/items/iname7.html
-- 2005-02-07 01:58:06 to 2005-04-18 19:10:09 (days delta 73) on for example: http://wow.allakhazam.com/item.html?witem=16922
-- 2005-02-23 12:25:35 to 2005-02-23 12:25:35 (days delta 0) on for example: http://wow.allakhazam.com/dyn/items/iminlev7.html
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=23, `stat_value2`=31, `stat_value3`=8, `holy_res`=3, `frost_res`=14, `shadow_res`=0, `arcane_res`=0 WHERE entry=16922;
-- SPELLS CHANGED: Leggings of Transcendence (ilevel 76 entry 16922). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- Source: http://wow.allakhazam.com/item.html?witem=16922
-- Source: http://wow.allakhazam.com/dyn/items/iminlev7.html
-- * Modified spell 1
-- 1.12 spell 18033 (Increases healing done by spells and effects by up to 46.)
-- 1.04 spell 25064 (Increases damage done by shadow spells and effects by up to 20.)
-- * Modified spell 2
-- 1.12 spell 21364 (Restores 7 mana per 5 sec.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=25064, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16922;
-- STATS CHANGED: Robes of Transcendence (ilevel 76 entry 16923). 2/2 versions
-- CONFLICT:
-- 2005-02-07 01:58:06 to 2005-08-31 09:03:12 (days delta 210) on for example: http://wow.allakhazam.com/item.html?witem=16923
-- 2005-05-27 19:24:40 to 2005-05-27 19:24:40 (days delta 0) on for example: http://wow.allakhazam.com/item.html?witem=16923
UPDATE item_template SET `stat_value2`=27, `fire_res`=0, `nature_res`=0, `shadow_res`=8 WHERE entry=16923;
-- SPELLS CHANGED: Robes of Transcendence (ilevel 76 entry 16923). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16923
-- Source: http://wow.allakhazam.com/item.html?witem=16923
-- * Modified spell 1
-- 1.12 spell 18037 (Increases healing done by spells and effects by up to 57.)
-- 1.04 spell 18031 (Increases healing done by spells and effects by up to 40.)
UPDATE item_template SET `spellid_1`=18031 WHERE entry=16923;
-- STATS CHANGED: Pauldrons of Transcendence (ilevel 76 entry 16924). 1/2 versions
UPDATE item_template SET `stat_type4`=3, `stat_value4`=4, `fire_res`=5, `nature_res`=3 WHERE entry=16924;
-- SPELLS CHANGED: Pauldrons of Transcendence (ilevel 76 entry 16924). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname3.html
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=211
-- * Modified spell 1
-- 1.12 spell 9315 (Increases healing done by spells and effects by up to 26.)
-- 1.04 spell 9408 (Increases healing done by spells and effects by up to 22.)
-- * Modified spell 2
-- 1.12 spell 0
-- 1.04 spell 9414 (Increases damage done by Shadow spells and effects by up to 14.)
UPDATE item_template SET `spellid_1`=9408, `spellid_2`=9414, `spelltrigger_2`=1 WHERE entry=16924;
-- STATS CHANGED: Belt of Transcendence (ilevel 76 entry 16925). 1/3 versions
UPDATE item_template SET `stat_value1`=25, `stat_value2`=17, `stat_value3`=8, `fire_res`=6, `shadow_res`=8 WHERE entry=16925;
-- SPELLS CHANGED: Belt of Transcendence (ilevel 76 entry 16925). 3 versions
-- Source: http://www.thottbot.com/?n=509429
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=211
-- Source: http://www.thottbot.com/?i=27861
-- * Modified spell 1
-- 1.12 spell 9315 (Increases healing done by spells and effects by up to 26.)
-- 1.04 spell 9408 (Increases healing done by spells and effects by up to 22.)
UPDATE item_template SET `spellid_1`=9408 WHERE entry=16925;
-- STATS CHANGED: Bindings of Transcendence (ilevel 76 entry 16926). 1/2 versions
UPDATE item_template SET `stat_value2`=23 WHERE entry=16926;
-- SPELLS REMOVED: Bindings of Transcendence (ilevel 76 entry 16926). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype9.html
-- Source: http://www.thottbot.com/?i=27861
-- * Modified spell 1
-- 1.12 spell 9318 (Increases healing done by spells and effects by up to 33.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16926;
-- STATS CHANGED: Nemesis Boots (ilevel 76 entry 16927). 1/2 versions
UPDATE item_template SET `stat_value1`=13, `stat_value2`=17, `fire_res`=0, `nature_res`=3 WHERE entry=16927;
-- SPELLS CHANGED: Nemesis Boots (ilevel 76 entry 16927). 2 versions
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=212
-- Source: http://wow.allakhazam.com/item.html?witem=16927
-- * Modified spell 1
-- 1.12 spell 14047 (Increases damage and healing done by magical spells and effects by up to 23.)
-- 1.04 spell 18009 (Increases damage done by Shadow spells and effects by up to 27.)
UPDATE item_template SET `spellid_1`=18009 WHERE entry=16927;
-- STATS CHANGED: Nemesis Gloves (ilevel 76 entry 16928). 3/4 versions
-- CONFLICT:
-- 2005-06-20 07:40:53 to 2005-12-24 05:06:27 (days delta 190) on for example: http://wow.allakhazam.com/db/itemset.html?setid=212
-- 2005-05-06 06:52:38 to 2005-05-17 19:29:37 (days delta 11) on for example: http://www.thottbot.com/?i=27588
-- 2005-02-07 02:07:53 to 2005-04-24 19:41:12 (days delta 79) on for example: http://www.thottbot.com/?i=27331 / http://wow.allakhazam.com/db/itemset.html?setid=212
-- 2005-02-24 05:57:04 to 2005-02-24 05:57:04 (days delta 0) on for example: http://wow.allakhazam.com/dyn/items/iname10.html
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=11, `stat_value3`=13, `stat_type2`=6, `stat_value2`=20, `holy_res`=3, `nature_res`=12, `shadow_res`=0 WHERE entry=16928;
-- SPELLS CHANGED: Nemesis Gloves (ilevel 76 entry 16928). 4 versions
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=212
-- Source: http://www.thottbot.com/?i=27588
-- Source: http://www.thottbot.com/?i=27331 / http://wow.allakhazam.com/db/itemset.html?setid=212
-- Source: http://wow.allakhazam.com/dyn/items/iname10.html
-- * Modified spell 1
-- 1.12 spell 21347 (Restores 4 health per 5 sec.)
-- 1.04 spell 25065 (Increases damage done by fire spells and effects by up to 20.)
-- * Modified spell 2
-- 1.12 spell 9344 (Increases damage and healing done by magical spells and effects by up to 15.)
-- 1.04 spell 9343 (Increases damage and healing done by magical spells and effects by up to 14.)
-- * Modified spell 3
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=25065, `spellid_2`=9343, `spellid_3`=0, `spelltrigger_3`=0 WHERE entry=16928;
-- STATS CHANGED: Nemesis Skullcap (ilevel 76 entry 16929). 3/4 versions
-- CONFLICT:
-- 2005-06-20 07:40:53 to 2005-12-31 12:05:37 (days delta 197) on for example: http://wow.allakhazam.com/item.html?witem=16929
-- 2005-02-23 02:06:35 to 2005-05-23 01:32:04 (days delta 93) on for example: http://wow.allakhazam.com/dyn/items/iname1.html
-- 2005-05-06 06:52:38 to 2005-05-17 19:29:37 (days delta 11) on for example: http://www.thottbot.com/?i=27588
-- 2005-02-07 02:07:53 to 2005-04-24 20:02:50 (days delta 79) on for example: http://www.thottbot.com/?n=480638 / http://wow.allakhazam.com/item.html?witem=16929
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=26, `stat_value2`=11, `stat_value3`=23, `fire_res`=3, `frost_res`=0, `shadow_res`=7, `arcane_res`=12 WHERE entry=16929;
-- SPELLS CHANGED: Nemesis Skullcap (ilevel 76 entry 16929). 4 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16929
-- Source: http://wow.allakhazam.com/dyn/items/iname1.html
-- Source: http://www.thottbot.com/?i=27588
-- Source: http://www.thottbot.com/?n=480638 / http://wow.allakhazam.com/item.html?witem=16929
-- * Modified spell 2
-- 1.12 spell 17367 (Increases damage and healing done by magical spells and effects by up to 32.)
-- 1.04 spell 14799 (Increases damage and healing done by magical spells and effects by up to 20.)
UPDATE item_template SET `spellid_2`=14799 WHERE entry=16929;
-- STATS CHANGED: Nemesis Leggings (ilevel 76 entry 16930). 3/4 versions
-- CONFLICT:
-- 2005-06-20 07:40:53 to 2006-02-21 18:51:36 (days delta 249) on for example: http://wow.allakhazam.com/db/itemset.html?setid=212
-- 2005-02-22 02:38:41 to 2006-02-13 20:35:04 (days delta 363) on for example: http://www.thottbot.com/?i=27588 / http://wow.allakhazam.com/dyn/items/itype7.html
-- 2005-07-01 02:17:13 to 2005-07-06 05:22:49 (days delta 5) on for example: http://wow.allakhazam.com/dyn/items/iname7.html
-- 2005-02-07 02:07:53 to 2005-02-27 12:47:14 (days delta 20) on for example: http://wow.allakhazam.com/item.html?witem=16930
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=17, `stat_value2`=23, `stat_value3`=20, `stat_type4`=3, `stat_value4`=9, `fire_res`=7, `frost_res`=3, `arcane_res`=0 WHERE entry=16930;
-- SPELLS CHANGED: Nemesis Leggings (ilevel 76 entry 16930). 4 versions
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=212
-- Source: http://www.thottbot.com/?i=27588 / http://wow.allakhazam.com/dyn/items/itype7.html
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- Source: http://wow.allakhazam.com/item.html?witem=16930
-- * Modified spell 1
-- 1.12 spell 18055 (Increases damage and healing done by magical spells and effects by up to 39.)
-- 1.04 spell 17872 (Increases damage done by Fire spells and effects by up to 34.)
UPDATE item_template SET `spellid_1`=17872 WHERE entry=16930;
-- STATS CHANGED: Nemesis Robes (ilevel 76 entry 16931). 1/2 versions
UPDATE item_template SET `stat_value1`=23, `stat_value2`=17, `stat_value3`=27, `stat_type4`=3, `stat_value4`=5, `fire_res`=3, `nature_res`=0, `shadow_res`=9 WHERE entry=16931;
-- SPELLS CHANGED: Nemesis Robes (ilevel 76 entry 16931). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16931
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=212
-- * Modified spell 1
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 25064 (Increases damage done by shadow spells and effects by up to 20.)
-- * Modified spell 2
-- 1.12 spell 17367 (Increases damage and healing done by magical spells and effects by up to 32.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=25064, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16931;
-- STATS CHANGED: Nemesis Spaulders (ilevel 76 entry 16932). 2/3 versions
-- CONFLICT:
-- 2005-06-20 07:40:53 to 2005-12-24 05:06:27 (days delta 190) on for example: http://wow.allakhazam.com/dyn/items/iname3.html
-- 2005-02-07 02:07:53 to 2005-05-17 19:29:37 (days delta 103) on for example: http://www.thottbot.com/?i=27588 / http://wow.allakhazam.com/item.html?witem=16932
-- 2005-04-24 19:41:12 to 2005-04-24 19:41:12 (days delta 0) on for example: http://www.thottbot.com/?i=27331
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=17, `stat_value2`=8, `stat_value3`=17, `stat_type4`=3, `stat_value4`=6, `fire_res`=6 WHERE entry=16932;
-- SPELLS CHANGED: Nemesis Spaulders (ilevel 76 entry 16932). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname3.html
-- Source: http://www.thottbot.com/?i=27588 / http://wow.allakhazam.com/item.html?witem=16932
-- Source: http://www.thottbot.com/?i=27331
-- * Modified spell 2
-- 1.12 spell 14047 (Increases damage and healing done by magical spells and effects by up to 23.)
-- 1.04 spell 9346 (Increases damage and healing done by magical spells and effects by up to 18.)
UPDATE item_template SET `spellid_2`=9346 WHERE entry=16932;
-- STATS CHANGED: Nemesis Belt (ilevel 76 entry 16933). 1/1 versions
UPDATE item_template SET `stat_value1`=20, `stat_value2`=11, `stat_value3`=14, `fire_res`=13, `frost_res`=12, `shadow_res`=13 WHERE entry=16933;
-- SPELLS REMOVED: Nemesis Belt (ilevel 76 entry 16933). 1 versions
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=212
-- * Modified spell 1
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 0
-- * Modified spell 2
-- 1.12 spell 15715 (Increases damage and healing done by magical spells and effects by up to 25.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16933;
-- STATS CHANGED: Nemesis Bracers (ilevel 76 entry 16934). 2/5 versions
-- CONFLICT:
-- 2005-06-20 07:40:53 to 2005-12-24 05:06:27 (days delta 190) on for example: http://wow.allakhazam.com/item.html?witem=16934
-- 2005-06-21 08:13:12 to 2005-12-23 18:11:49 (days delta 188) on for example: http://www.thottbot.com/?set=212
-- 2005-05-06 06:52:38 to 2005-05-17 19:29:37 (days delta 11) on for example: http://www.thottbot.com/?n=519349
-- 2005-05-17 19:29:37 to 2005-05-17 19:29:37 (days delta 0) on for example: http://www.thottbot.com/?i=27588
-- 2005-02-07 02:07:53 to 2005-04-24 19:41:12 (days delta 79) on for example: http://www.thottbot.com/?i=27331 / http://wow.allakhazam.com/item.html?witem=16934
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=13, `stat_value2`=9, `stat_value3`=16 WHERE entry=16934;
-- SPELLS CHANGED: Nemesis Bracers (ilevel 76 entry 16934). 5 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16934
-- Source: http://www.thottbot.com/?set=212
-- Source: http://www.thottbot.com/?n=519349
-- Source: http://www.thottbot.com/?i=27588
-- Source: http://www.thottbot.com/?i=27331 / http://wow.allakhazam.com/item.html?witem=16934
-- * Modified spell 1
-- 1.12 spell 9344 (Increases damage and healing done by magical spells and effects by up to 15.)
-- 1.04 spell 9414 (Increases damage done by Shadow spells and effects by up to 14.)
UPDATE item_template SET `spellid_1`=9414 WHERE entry=16934;
-- STATS CHANGED: Dragonstalker's Bracers (ilevel 76 entry 16935). 2/2 versions
-- CONFLICT:
-- 2005-02-22 12:35:06 to 2005-04-18 19:01:05 (days delta 58) on for example: http://wow.allakhazam.com/item.html?witem=16935
-- 2005-02-23 11:53:13 to 2005-02-23 11:53:13 (days delta 0) on for example: http://wow.allakhazam.com/dyn/items/itype9.html
UPDATE item_template SET `stat_value1`=21, `stat_value2`=8, `stat_value4`=9, `holy_res`=9 WHERE entry=16935;
-- STATS CHANGED: Dragonstalker's Belt (ilevel 76 entry 16936). 1/2 versions
UPDATE item_template SET `stat_value1`=15, `stat_value4`=12, `shadow_res`=0 WHERE entry=16936;
-- SPELLS CHANGED: Dragonstalker's Belt (ilevel 76 entry 16936). 2 versions
-- Source: http://www.thottbot.com/?n=508478 / http://wow.allakhazam.com/db/item.html?witem=16936
-- Source: http://www.thottbot.com/?i=27206
-- * Modified spell 1
-- 1.12 spell 7597 (Improves your chance to get a critical strike by 1%.)
-- 1.04 spell 13670 (Increases your chance to dodge an attack by 2%.)
UPDATE item_template SET `spellid_1`=13670 WHERE entry=16936;
-- STATS CHANGED: Dragonstalker's Spaulders (ilevel 76 entry 16937). 1/2 versions
UPDATE item_template SET `stat_value2`=14, `stat_value3`=8, `fire_res`=0, `nature_res`=9, `frost_res`=8 WHERE entry=16937;
-- SPELLS REMOVED: Dragonstalker's Spaulders (ilevel 76 entry 16937). 2 versions
-- Source: http://www.thottbot.com/?i=36702 / http://wow.allakhazam.com/dyn/items/itype3.html
-- Source: http://www.thottbot.com/?i=36293
-- * Modified spell 1
-- 1.12 spell 15464 (Improves your chance to hit by 1%.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16937;
-- STATS CHANGED: Dragonstalker's Legguards (ilevel 76 entry 16938). 3/3 versions
-- CONFLICT:
-- 2005-07-01 02:17:13 to 2005-09-01 09:07:50 (days delta 62) on for example: http://wow.allakhazam.com/dyn/items/iname7.html
-- 2005-02-22 02:38:41 to 2005-06-08 01:11:28 (days delta 110) on for example: http://wow.allakhazam.com/dyn/items/itype7.html
-- 2005-02-22 12:35:19 to 2005-05-18 11:19:25 (days delta 89) on for example: http://www.thottbot.com/?i=36702 / http://wow.allakhazam.com/item.html?witem=16938
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=33, `stat_value2`=11, `stat_value3`=16, `stat_value4`=23, `stat_type5`=4, `stat_value5`=8, `fire_res`=0, `arcane_res`=8 WHERE entry=16938;
-- SPELLS REMOVED: Dragonstalker's Legguards (ilevel 76 entry 16938). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- Source: http://wow.allakhazam.com/dyn/items/itype7.html
-- Source: http://www.thottbot.com/?i=36702 / http://wow.allakhazam.com/item.html?witem=16938
-- * Modified spell 1
-- 1.12 spell 15464 (Improves your chance to hit by 1%.)
-- 1.04 spell 0
-- * Modified spell 2
-- 1.12 spell 7597 (Improves your chance to get a critical strike by 1%.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16938;
-- STATS CHANGED: Dragonstalker's Helm (ilevel 76 entry 16939). 1/2 versions
UPDATE item_template SET `stat_value1`=20, `stat_value2`=21, `stat_value3`=6, `stat_value4`=21, `stat_type5`=4, `stat_value5`=7, `fire_res`=12, `frost_res`=0, `shadow_res`=11 WHERE entry=16939;
-- STATS CHANGED: Dragonstalker's Greaves (ilevel 76 entry 16941). 2/3 versions
-- CONFLICT:
-- 2005-02-22 12:35:30 to 2005-05-18 11:19:25 (days delta 89) on for example: http://www.thottbot.com/?i=36702 / http://wow.allakhazam.com/item.html?witem=16941
-- 2005-05-18 11:19:25 to 2005-05-18 11:19:25 (days delta 0) on for example: http://www.thottbot.com/?i=36702
-- 2005-02-23 01:41:33 to 2005-04-06 13:24:43 (days delta 45) on for example: http://wow.allakhazam.com/dyn/items/iname8.html
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=25, `stat_value2`=0, `stat_value3`=12, `stat_value4`=17, `holy_res`=6, `fire_res`=0, `shadow_res`=10 WHERE entry=16941;
-- STATS CHANGED: Dragonstalker's Breastplate (ilevel 76 entry 16942). 1/1 versions
UPDATE item_template SET `stat_value1`=36, `stat_value2`=16, `stat_value3`=4, `stat_value4`=23, `fire_res`=0, `nature_res`=0, `shadow_res`=3 WHERE entry=16942;
-- SPELLS CHANGED: Dragonstalker's Breastplate (ilevel 76 entry 16942). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype5.html
-- * Modified spell 1
-- 1.12 spell 7597 (Improves your chance to get a critical strike by 1%.)
-- 1.04 spell 15464 (Improves your chance to hit by 1%.)
UPDATE item_template SET `spellid_1`=15464 WHERE entry=16942;
-- STATS CHANGED: Bracers of Ten Storms (ilevel 76 entry 16943). 2/3 versions
-- CONFLICT:
-- 2005-03-02 04:21:04 to 2005-03-24 05:00:42 (days delta 22) on for example: http://wow.allakhazam.com/item.html?witem=16943
-- 2005-03-17 05:48:38 to 2005-03-17 05:48:38 (days delta 0) on for example: http://www.thottbot.com/?i=27850
-- 2005-01-16 03:12:45 to 2005-02-07 02:36:28 (days delta 22) on for example: http://wow.allakhazam.com/dyn/items/itype9.html
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `stat_value3`=0, `armor`=182 WHERE entry=16943;
-- SPELLS CHANGED: Bracers of Ten Storms (ilevel 76 entry 16943). 3 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16943
-- Source: http://www.thottbot.com/?i=27850
-- Source: http://wow.allakhazam.com/dyn/items/itype9.html
-- * Modified spell 1
-- 1.12 spell 18379 (Restores 6 mana per 5 sec.)
-- 1.04 spell 7696 (Increases damage done by Nature spells and effects by up to 10.)
UPDATE item_template SET `spellid_1`=7696 WHERE entry=16943;
-- STATS CHANGED: Belt of Ten Storms (ilevel 76 entry 16944). 2/4 versions
-- CONFLICT:
-- 2005-04-20 17:17:03 to 2005-05-27 05:18:52 (days delta 38) on for example: http://www.thottbot.com/?n=Gehennas / http://wow.allakhazam.com/db/item.html?witem=16944
-- 2005-03-18 17:17:59 to 2005-03-18 17:17:59 (days delta 0) on for example: http://wow.allakhazam.com/db/item.html?witem=16944
-- 2005-03-17 05:48:38 to 2005-03-17 05:48:38 (days delta 0) on for example: http://www.thottbot.com/?i=27850
-- 2005-02-07 02:36:28 to 2005-02-07 02:36:28 (days delta 0) on for example: http://wow.allakhazam.com/db/itemset.html?setid=216
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `stat_value3`=0, `armor`=234, `shadow_res`=0 WHERE entry=16944;
-- SPELLS CHANGED: Belt of Ten Storms (ilevel 76 entry 16944). 4 versions
-- Source: http://www.thottbot.com/?n=Gehennas / http://wow.allakhazam.com/db/item.html?witem=16944
-- Source: http://wow.allakhazam.com/db/item.html?witem=16944
-- Source: http://www.thottbot.com/?i=27850
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=216
-- * Modified spell 1
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 17371 (Increases healing done by spells and effects by up to 44.)
-- * Modified spell 2
-- 1.12 spell 9315 (Increases healing done by spells and effects by up to 26.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=17371, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16944;
-- STATS CHANGED: Epaulets of Ten Storms (ilevel 76 entry 16945). 4/4 versions
-- CONFLICT:
-- 2005-02-22 00:27:41 to 2005-08-31 08:00:58 (days delta 195) on for example: http://wow.allakhazam.com/dyn/items/iname3.html
-- 2005-04-27 22:57:13 to 2005-04-27 22:57:13 (days delta 0) on for example: http://wow.allakhazam.com/db/item.html?witem=16945
-- 2005-02-25 05:05:45 to 2005-03-15 03:54:16 (days delta 21) on for example: http://wow.allakhazam.com/dyn/items/iname3.html
-- 2005-02-07 02:36:28 to 2005-02-15 11:03:57 (days delta 8) on for example: http://wow.allakhazam.com/dyn/items/iname3.html
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `stat_value3`=0, `armor`=312, `fire_res`=0 WHERE entry=16945;
-- SPELLS CHANGED: Epaulets of Ten Storms (ilevel 76 entry 16945). 4 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname3.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=16945
-- Source: http://wow.allakhazam.com/dyn/items/iname3.html
-- Source: http://wow.allakhazam.com/dyn/items/iname3.html
-- * Modified spell 1
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 9407 (Increases healing done by spells and effects by up to 20.)
UPDATE item_template SET `spellid_1`=9407 WHERE entry=16945;
-- STATS CHANGED: Legplates of Ten Storms (ilevel 76 entry 16946). 5/6 versions
-- CONFLICT:
-- 2005-07-01 02:17:13 to 2005-09-01 09:07:50 (days delta 62) on for example: http://wow.allakhazam.com/dyn/items/iname7.html
-- 2005-02-22 02:38:41 to 2005-06-08 01:11:28 (days delta 110) on for example: http://wow.allakhazam.com/dyn/items/itype7.html
-- 2005-05-26 05:47:02 to 2005-05-26 05:47:02 (days delta 0) on for example: http://wow.allakhazam.com/db/item.html?witem=16946
-- 2005-04-27 22:57:14 to 2005-04-27 22:57:14 (days delta 0) on for example: http://wow.allakhazam.com/db/item.html?witem=16946
-- 2005-02-23 12:24:14 to 2005-03-18 17:18:06 (days delta 26) on for example: http://wow.allakhazam.com/item.html?witem=16946
-- 2005-02-07 02:36:28 to 2005-02-15 11:03:16 (days delta 8) on for example: http://wow.allakhazam.com/dyn/items/iname7.html
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `stat_value3`=0, `armor`=364, `fire_res`=0, `arcane_res`=0 WHERE entry=16946;
-- SPELLS CHANGED: Legplates of Ten Storms (ilevel 76 entry 16946). 6 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- Source: http://wow.allakhazam.com/dyn/items/itype7.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=16946
-- Source: http://wow.allakhazam.com/db/item.html?witem=16946
-- Source: http://wow.allakhazam.com/item.html?witem=16946
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- * Modified spell 1
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 7679 (Increases healing done by spells and effects by up to 11.)
-- * Modified spell 2
-- 1.12 spell 13881 (Increases damage and healing done by magical spells and effects by up to 29.)
-- 1.04 spell 23481 (Increases damage done by Fire spells and effects by up to 14.)
UPDATE item_template SET `spellid_1`=7679, `spellid_2`=23481 WHERE entry=16946;
-- STATS CHANGED: Helmet of Ten Storms (ilevel 76 entry 16947). 2/3 versions
-- CONFLICT:
-- 2005-04-24 20:02:50 to 2005-05-23 01:32:04 (days delta 30) on for example: http://www.thottbot.com/?n=480638 / http://wow.allakhazam.com/item.html?witem=16947
-- 2005-02-17 23:21:51 to 2005-04-11 08:38:41 (days delta 56) on for example: http://wow.allakhazam.com/item.html?witem=16947
-- 2005-01-16 02:23:48 to 2005-02-15 11:02:56 (days delta 30) on for example: http://wow.allakhazam.com/dyn/items/iname1.html
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `stat_value3`=0, `armor`=338, `frost_res`=0, `shadow_res`=0 WHERE entry=16947;
-- SPELLS CHANGED: Helmet of Ten Storms (ilevel 76 entry 16947). 3 versions
-- Source: http://www.thottbot.com/?n=480638 / http://wow.allakhazam.com/item.html?witem=16947
-- Source: http://wow.allakhazam.com/item.html?witem=16947
-- Source: http://wow.allakhazam.com/dyn/items/iname1.html
-- * Modified spell 1
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 17868 (Increases damage done by Fire spells and effects by up to 27.)
-- * Modified spell 2
-- 1.12 spell 9415 (Increases damage and healing done by magical spells and effects by up to 9.)
-- 1.04 spell 17990 (Increases damage done by Nature spells and effects by up to 27.)
-- * Modified spell 3
-- 1.12 spell 9406 (Increases healing done by spells and effects by up to 18.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=17868, `spellid_2`=17990, `spellid_3`=0, `spelltrigger_3`=0 WHERE entry=16947;
-- STATS CHANGED: Gauntlets of Ten Storms (ilevel 76 entry 16948). 2/2 versions
-- CONFLICT:
-- 2005-02-22 00:27:45 to 2005-03-18 17:18:13 (days delta 27) on for example: http://wow.allakhazam.com/item.html?witem=16948
-- 2005-02-07 02:36:28 to 2005-02-07 02:36:28 (days delta 0) on for example: http://wow.allakhazam.com/db/itemset.html?setid=216
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `stat_value3`=0, `armor`=260, `shadow_res`=0 WHERE entry=16948;
-- SPELLS CHANGED: Gauntlets of Ten Storms (ilevel 76 entry 16948). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16948
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=216
-- * Modified spell 1
-- 1.12 spell 21626 (Restores 6 mana per 5 sec.)
-- 1.04 spell 9407 (Increases healing done by spells and effects by up to 20.)
-- * Modified spell 2
-- 1.12 spell 9398 (Increases damage and healing done by magical spells and effects by up to 8.)
-- 1.04 spell 9411 (Increases damage done by Nature spells and effects by up to 14.)
-- * Modified spell 3
-- 1.12 spell 7681 (Increases healing done by spells and effects by up to 15.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=9407, `spellid_2`=9411, `spellid_3`=0, `spelltrigger_3`=0 WHERE entry=16948;
-- STATS CHANGED: Greaves of Ten Storms (ilevel 76 entry 16949). 2/3 versions
-- CONFLICT:
-- 2005-02-23 03:12:23 to 2005-04-16 03:05:52 (days delta 55) on for example: http://wow.allakhazam.com/item.html?witem=16949
-- 2005-03-17 05:48:38 to 2005-03-17 05:48:38 (days delta 0) on for example: http://www.thottbot.com/?i=27850
-- 2005-02-07 02:36:28 to 2005-02-15 11:03:31 (days delta 8) on for example: http://wow.allakhazam.com/dyn/items/iname8.html
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `stat_value3`=0, `armor`=286, `fire_res`=0 WHERE entry=16949;
-- SPELLS CHANGED: Greaves of Ten Storms (ilevel 76 entry 16949). 3 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16949
-- Source: http://www.thottbot.com/?i=27850
-- Source: http://wow.allakhazam.com/dyn/items/iname8.html
-- * Modified spell 1
-- 1.12 spell 14799 (Increases damage and healing done by magical spells and effects by up to 20.)
-- 1.04 spell 9307 (Increases damage done by Frost spells and effects by up to 20.)
UPDATE item_template SET `spellid_1`=9307 WHERE entry=16949;
-- STATS CHANGED: Breastplate of Ten Storms (ilevel 76 entry 16950). 2/3 versions
-- CONFLICT:
-- 2005-02-17 08:58:01 to 2005-08-30 19:44:24 (days delta 199) on for example: http://wow.allakhazam.com/item.html?witem=16950
-- 2005-04-27 22:57:18 to 2005-04-27 22:57:18 (days delta 0) on for example: http://wow.allakhazam.com/db/item.html?witem=16950
-- 2005-01-13 05:25:35 to 2005-02-17 08:58:58 (days delta 35) on for example: http://wow.allakhazam.com/dyn/items/iname5.html
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `stat_value3`=0, `armor`=416, `fire_res`=0, `nature_res`=0 WHERE entry=16950;
-- SPELLS CHANGED: Breastplate of Ten Storms (ilevel 76 entry 16950). 3 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16950
-- Source: http://wow.allakhazam.com/db/item.html?witem=16950
-- Source: http://wow.allakhazam.com/dyn/items/iname5.html
-- * Modified spell 1
-- 1.12 spell 14047 (Increases damage and healing done by magical spells and effects by up to 23.)
-- 1.04 spell 9407 (Increases healing done by spells and effects by up to 20.)
-- * Modified spell 2
-- 1.12 spell 0
-- 1.04 spell 7703 (Increases damage done by Frost spells and effects by up to 10.)
UPDATE item_template SET `spellid_1`=9407, `spellid_2`=7703, `spelltrigger_2`=1 WHERE entry=16950;
-- STATS CHANGED: Judgement Bindings (ilevel 76 entry 16951). 2/2 versions
-- CONFLICT:
-- 2005-02-07 02:38:42 to 2005-05-06 06:52:22 (days delta 92) on for example: http://www.thottbot.com/?i=27163 / http://wow.allakhazam.com/db/itemset.html?setid=217
-- 2005-02-23 11:53:13 to 2005-02-23 11:53:13 (days delta 0) on for example: http://wow.allakhazam.com/dyn/items/itype9.html
UPDATE item_template SET `stat_value2`=5, `stat_value3`=19, `stat_value4`=11, `holy_res`=6, `nature_res`=6 WHERE entry=16951;
-- SPELLS REMOVED: Judgement Bindings (ilevel 76 entry 16951). 2 versions
-- Source: http://www.thottbot.com/?i=27163 / http://wow.allakhazam.com/db/itemset.html?setid=217
-- Source: http://wow.allakhazam.com/dyn/items/itype9.html
-- * Modified spell 1
-- 1.12 spell 9397 (Increases damage and healing done by magical spells and effects by up to 7.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16951;
-- STATS CHANGED: Judgement Belt (ilevel 76 entry 16952). 1/3 versions
UPDATE item_template SET `stat_value2`=11, `stat_value3`=13, `stat_value4`=20, `fire_res`=8, `frost_res`=8, `shadow_res`=0 WHERE entry=16952;
-- SPELLS REMOVED: Judgement Belt (ilevel 76 entry 16952). 3 versions
-- Source: http://www.thottbot.com/?n=Gehennas / http://wow.allakhazam.com/db/itemset.html?setid=217
-- Source: http://www.thottbot.com/?i=27163
-- Source: http://thottbot.com/?l=latest
-- * Modified spell 1
-- 1.12 spell 14047 (Increases damage and healing done by magical spells and effects by up to 23.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16952;
-- STATS CHANGED: Judgement Spaulders (ilevel 76 entry 16953). 1/1 versions
UPDATE item_template SET `stat_value1`=17, `stat_value2`=12, `stat_value3`=25, `fire_res`=0 WHERE entry=16953;
-- SPELLS REMOVED: Judgement Spaulders (ilevel 76 entry 16953). 1 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16953
-- * Modified spell 1
-- 1.12 spell 21363 (Restores 5 mana per 5 sec.)
-- 1.04 spell 0
-- * Modified spell 2
-- 1.12 spell 9342 (Increases damage and healing done by magical spells and effects by up to 13.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16953;
-- STATS CHANGED: Judgement Legplates (ilevel 76 entry 16954). 1/1 versions
UPDATE item_template SET `stat_value1`=11, `stat_value2`=17, `stat_value3`=20, `stat_value4`=31, `stat_type5`=3, `stat_value5`=7, `fire_res`=0, `arcane_res`=0 WHERE entry=16954;
-- SPELLS CHANGED: Judgement Legplates (ilevel 76 entry 16954). 1 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16954
-- * Modified spell 1
-- 1.12 spell 14799 (Increases damage and healing done by magical spells and effects by up to 20.)
-- 1.04 spell 25067 (Increases healing done by spells and effects by up to 30.)
-- * Modified spell 2
-- 1.12 spell 21362 (Restores 4 mana per 5 sec.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=25067, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16954;
-- STATS CHANGED: Judgement Crown (ilevel 76 entry 16955). 2/3 versions
-- CONFLICT:
-- 2005-02-25 03:28:41 to 2005-08-27 06:53:09 (days delta 188) on for example: http://wow.allakhazam.com/dyn/items/iminlev1.html
-- 2005-05-06 06:52:22 to 2005-05-08 23:06:31 (days delta 2) on for example: http://www.thottbot.com/?i=27163 / http://wow.allakhazam.com/db/item.html?entryid=217295
-- 2005-02-07 02:38:42 to 2005-04-24 20:02:50 (days delta 79) on for example: http://www.thottbot.com/?n=480638 / http://wow.allakhazam.com/item.html?witem=16955
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=19, `stat_value2`=4, `stat_value3`=31, `stat_type5`=3, `stat_value5`=4, `fire_res`=8, `frost_res`=0, `shadow_res`=0, `arcane_res`=7 WHERE entry=16955;
-- SPELLS CHANGED: Judgement Crown (ilevel 76 entry 16955). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev1.html
-- Source: http://www.thottbot.com/?i=27163 / http://wow.allakhazam.com/db/item.html?entryid=217295
-- Source: http://www.thottbot.com/?n=480638 / http://wow.allakhazam.com/item.html?witem=16955
-- * Modified spell 1
-- 1.12 spell 17367 (Increases damage and healing done by magical spells and effects by up to 32.)
-- 1.04 spell 18031 (Increases healing done by spells and effects by up to 40.)
UPDATE item_template SET `spellid_1`=18031 WHERE entry=16955;
-- STATS CHANGED: Judgement Gauntlets (ilevel 76 entry 16956). 2/2 versions
-- CONFLICT:
-- 2005-02-07 02:38:42 to 2005-03-18 17:18:42 (days delta 42) on for example: http://wow.allakhazam.com/item.html?witem=16956
-- 2005-02-24 05:09:52 to 2005-02-24 05:09:52 (days delta 0) on for example: http://wow.allakhazam.com/dyn/items/iminlev10.html
UPDATE item_template SET `stat_value1`=0, `stat_value2`=13, `stat_value4`=19, `stat_type5`=3, `stat_value5`=6, `holy_res`=3, `frost_res`=8, `shadow_res`=5 WHERE entry=16956;
-- SPELLS CHANGED: Judgement Gauntlets (ilevel 76 entry 16956). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16956
-- Source: http://wow.allakhazam.com/dyn/items/iminlev10.html
-- * Modified spell 1
-- 1.12 spell 21626 (Restores 6 mana per 5 sec.)
-- 1.04 spell 25067 (Increases healing done by spells and effects by up to 30.)
-- * Modified spell 2
-- 1.12 spell 9344 (Increases damage and healing done by magical spells and effects by up to 15.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=25067, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16956;
-- STATS CHANGED: Judgement Sabatons (ilevel 76 entry 16957). 2/2 versions
-- CONFLICT:
-- 2005-04-03 23:56:47 to 2005-05-06 06:52:22 (days delta 34) on for example: http://www.thottbot.com/?i=27163 / http://wow.allakhazam.com/dyn/items/iminlev8.html
-- 2005-02-07 02:38:42 to 2005-03-18 17:18:46 (days delta 42) on for example: http://wow.allakhazam.com/db/itemset.html?setid=217
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=0, `stat_value2`=17, `stat_value3`=0, `stat_value4`=15, `stat_type5`=3, `stat_value5`=6, `fire_res`=0, `nature_res`=8, `shadow_res`=5 WHERE entry=16957;
-- SPELLS REMOVED: Judgement Sabatons (ilevel 76 entry 16957). 2 versions
-- Source: http://www.thottbot.com/?i=27163 / http://wow.allakhazam.com/dyn/items/iminlev8.html
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=217
-- * Modified spell 1
-- 1.12 spell 9346 (Increases damage and healing done by magical spells and effects by up to 18.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16957;
-- STATS CHANGED: Judgement Breastplate (ilevel 76 entry 16958). 1/1 versions
UPDATE item_template SET `stat_value1`=18, `stat_value2`=16, `stat_value3`=33, `stat_value4`=17, `stat_type5`=3, `stat_value5`=5, `fire_res`=6, `nature_res`=0, `shadow_res`=6 WHERE entry=16958;
-- SPELLS REMOVED: Judgement Breastplate (ilevel 76 entry 16958). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype5.html
-- * Modified spell 1
-- 1.12 spell 21363 (Restores 5 mana per 5 sec.)
-- 1.04 spell 0
-- * Modified spell 2
-- 1.12 spell 15715 (Increases damage and healing done by magical spells and effects by up to 25.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16958;
-- STATS CHANGED: Bracelets of Wrath (ilevel 76 entry 16959). 1/1 versions
UPDATE item_template SET `stat_value1`=23, `stat_type3`=6, `stat_value3`=6 WHERE entry=16959;
-- SPELLS CHANGED: Waistband of Wrath (ilevel 76 entry 16960). 3 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=16960
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=218
-- Source: http://wow.allakhazam.com/db/item.html?entryid=217242
-- * Modified spell 2
-- 1.12 spell 13385 (Increased Defense +7.)
-- 1.04 spell 13390 (Increased Defense +10.)
UPDATE item_template SET `spellid_2`=13390 WHERE entry=16960;
-- STATS CHANGED: Pauldrons of Wrath (ilevel 76 entry 16961). 2/2 versions
-- CONFLICT:
-- 2005-02-07 02:48:46 to 2005-04-27 22:57:23 (days delta 82) on for example: http://wow.allakhazam.com/item.html?witem=16961
-- 2005-02-22 12:13:20 to 2005-02-22 12:13:20 (days delta 0) on for example: http://wow.allakhazam.com/dyn/items/itype3.html
UPDATE item_template SET `stat_value1`=30, `stat_value2`=17, `stat_type3`=3, `stat_value3`=8, `holy_res`=6, `fire_res`=0, `shadow_res`=6 WHERE entry=16961;
-- SPELLS REMOVED: Pauldrons of Wrath (ilevel 76 entry 16961). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16961
-- Source: http://wow.allakhazam.com/dyn/items/itype3.html
-- * Modified spell 1
-- 1.12 spell 23516 (Increases the block value of your shield by 27.)
-- 1.04 spell 0
-- * Modified spell 2
-- 1.12 spell 13385 (Increased Defense +7.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16961;
-- STATS CHANGED: Legplates of Wrath (ilevel 76 entry 16962). 2/2 versions
-- CONFLICT:
-- 2005-07-01 02:17:13 to 2005-09-01 09:07:50 (days delta 62) on for example: http://wow.allakhazam.com/dyn/items/iname7.html
-- 2005-02-04 05:35:21 to 2005-06-08 01:11:28 (days delta 128) on for example: http://wow.allakhazam.com/item.html?witem=16962
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=23, `stat_value2`=36, `stat_type3`=6, `stat_value3`=8, `fire_res`=7, `arcane_res`=0 WHERE entry=16962;
-- SPELLS CHANGED: Legplates of Wrath (ilevel 76 entry 16962). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- Source: http://wow.allakhazam.com/item.html?witem=16962
-- * Modified spell 1
-- 1.12 spell 13670 (Increases your chance to dodge an attack by 2%.)
-- 1.04 spell 13669 (Increases your chance to dodge an attack by 1%.)
-- * Modified spell 2
-- 1.12 spell 18185 (Increased Defense +11.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=13669, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16962;
-- STATS CHANGED: Helm of Wrath (ilevel 76 entry 16963). 1/1 versions
UPDATE item_template SET `stat_value1`=36, `stat_value2`=22, `stat_type3`=6, `stat_value3`=3, `fire_res`=6, `frost_res`=6, `shadow_res`=5 WHERE entry=16963;
-- SPELLS CHANGED: Helm of Wrath (ilevel 76 entry 16963). 1 versions
-- Source: http://www.thottbot.com/?n=480638 / http://wow.allakhazam.com/item.html?witem=16963
-- * Modified spell 1
-- 1.12 spell 18185 (Increased Defense +11.)
-- 1.04 spell 7597 (Improves your chance to get a critical strike by 1%.)
UPDATE item_template SET `spellid_1`=7597 WHERE entry=16963;
-- STATS CHANGED: Gauntlets of Wrath (ilevel 76 entry 16964). 2/2 versions
-- CONFLICT:
-- 2005-02-04 05:54:11 to 2005-04-08 04:30:52 (days delta 66) on for example: http://wow.allakhazam.com/item.html?witem=16964
-- 2005-02-24 05:57:04 to 2005-02-24 05:57:04 (days delta 0) on for example: http://wow.allakhazam.com/dyn/items/iname10.html
UPDATE item_template SET `stat_value1`=17, `stat_value2`=23, `stat_type3`=6, `stat_value3`=7, `holy_res`=8, `nature_res`=10, `shadow_res`=8 WHERE entry=16964;
-- SPELLS CHANGED: Gauntlets of Wrath (ilevel 76 entry 16964). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16964
-- Source: http://wow.allakhazam.com/dyn/items/iname10.html
-- * Modified spell 1
-- 1.12 spell 13665 (Increases your chance to parry an attack by 1%.)
-- 1.04 spell 15464 (Improves your chance to hit by 1%.)
-- * Modified spell 2
-- 1.12 spell 13385 (Increased Defense +7.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=15464, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16964;
-- STATS CHANGED: Sabatons of Wrath (ilevel 76 entry 16965). 1/1 versions
UPDATE item_template SET `stat_value2`=16, `stat_type3`=6, `stat_value3`=3, `fire_res`=0, `frost_res`=8 WHERE entry=16965;
-- SPELLS REMOVED: Sabatons of Wrath (ilevel 76 entry 16965). 1 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16965
-- * Modified spell 1
-- 1.12 spell 23515 (Increases the block value of your shield by 14.)
-- 1.04 spell 0
-- * Modified spell 2
-- 1.12 spell 13385 (Increased Defense +7.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16965;
-- STATS CHANGED: Breastplate of Wrath (ilevel 76 entry 16966). 1/1 versions
UPDATE item_template SET `stat_value2`=23, `stat_type3`=6, `stat_value3`=10, `fire_res`=0, `nature_res`=3 WHERE entry=16966;
-- SPELLS REMOVED: Breastplate of Wrath (ilevel 76 entry 16966). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype5.html
-- * Modified spell 1
-- 1.12 spell 18185 (Increased Defense +11.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16966;
-- SPELLS CHANGED: Medallion of Steadfast Might (ilevel 68 entry 17065). 2 versions
-- Source: http://www.thottbot.com/?n=508478 / http://wow.allakhazam.com/dyn/items/iname2.html
-- Source: http://wow.allakhazam.com/item.html?witem=17065
-- * Modified spell 2
-- 1.12 spell 13387 (Increased Defense +8.)
-- 1.04 spell 21408 (Increased Defense +12.)
UPDATE item_template SET `spellid_2`=21408 WHERE entry=17065;
-- DAMAGE CHANGED: Fang of the Mystics (ilevel 70 entry 17070). 1/4 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname13.html
-- Source: http://wow.allakhazam.com/item.html?witem=17070
-- Source: http://www.thottbot.com/?n=508404 / http://wow.allakhazam.com/item.html?witem=17070
-- Source: http://wow.allakhazam.com/dyn/items/wminlev15.html
UPDATE item_template SET `dmg_min1`=54, `dmg_max1`=101 WHERE entry=17070;
-- SPELLS CHANGED: Fang of the Mystics (ilevel 70 entry 17070). 4 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname13.html
-- Source: http://wow.allakhazam.com/item.html?witem=17070
-- Source: http://www.thottbot.com/?n=508404 / http://wow.allakhazam.com/item.html?witem=17070
-- Source: http://wow.allakhazam.com/dyn/items/wminlev15.html
-- * Modified spell 3
-- 1.12 spell 18056 (Increases damage and healing done by magical spells and effects by up to 40.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_3`=0, `spelltrigger_3`=0 WHERE entry=17070;
-- STATS REMOVED for item Bonereaver's Edge (http://wow.allakhazam.com/item.html?witem=17076) 
UPDATE item_template SET stat_value1=0, stat_type1=0 WHERE entry=17076;
-- SPELLS CHANGED: Shard of the Flame (ilevel 74 entry 17082). 4 versions
-- Source: http://wow.allakhazam.com/item.html?witem=17082
-- Source: http://www.thottbot.com/?i=36927 / http://wow.allakhazam.com/item.html?witem=17082
-- Source: http://www.thottbot.com/?i=36927
-- Source: http://wow.allakhazam.com/dyn/items/itype12.html
-- * Modified spell 1
-- 1.12 spell 23210 (Restores 16 health per 5 sec.)
-- 1.04 spell 21604 (Restores 9 health per 5 sec.)
UPDATE item_template SET `spellid_1`=21604 WHERE entry=17082;
-- DAMAGE CHANGED: Aurastone Hammer (ilevel 69 entry 17105). 2/5 versions
-- Source: http://wow.allakhazam.com/dyn/items/wname4.html
-- Source: http://wow.allakhazam.com/dyn/items/wminlev4.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=17105
-- Source: http://www.thottbot.com/?n=509427
-- Source: http://wow.allakhazam.com/item.html?witem=17105
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `dmg_min1`=89, `dmg_max1`=166 WHERE entry=17105;
-- STATS CHANGED: Dragon's Blood Cape (ilevel 73 entry 17107). 1/1 versions
UPDATE item_template SET `holy_res`=5, `arcane_res`=0 WHERE entry=17107;
-- STATS CHANGED: Seal of the Archmagus (ilevel 70 entry 17110). 3/4 versions
-- CONFLICT:
-- 2005-04-28 03:31:57 to 2005-09-15 17:07:26 (days delta 142) on for example: http://wow.allakhazam.com/dyn/items/iname11.html
-- 2005-04-08 04:32:09 to 2005-04-08 04:32:09 (days delta 0) on for example: http://wow.allakhazam.com/db/item.html?witem=17110
-- 2005-02-27 20:17:28 to 2005-03-18 17:18:58 (days delta 22) on for example: http://wow.allakhazam.com/item.html?witem=17110
-- 2005-02-23 02:20:49 to 2005-02-24 06:05:40 (days delta 1) on for example: http://wow.allakhazam.com/dyn/items/iname11.html
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `stat_value1`=10, `stat_value2`=10, `stat_value3`=10, `holy_res`=5, `fire_res`=5, `nature_res`=5, `frost_res`=5, `shadow_res`=5, `arcane_res`=0 WHERE entry=17110;
-- SPELLS CHANGED: Seal of the Archmagus (ilevel 70 entry 17110). 4 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname11.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=17110
-- Source: http://wow.allakhazam.com/item.html?witem=17110
-- Source: http://wow.allakhazam.com/dyn/items/iname11.html
-- * Modified spell 1
-- 1.12 spell 21361 (Restores 3 mana per 5 sec.)
-- 1.04 spell 21360 (Restores 2 mana per 5 sec.)
UPDATE item_template SET `spellid_1`=21360 WHERE entry=17110;
-- DAMAGE CHANGED: Amberseal Keeper (ilevel 67 entry 17113). 2/4 versions
-- Source: http://wow.allakhazam.com/dyn/items/wminlev10.html
-- Source: http://wow.allakhazam.com/dyn/items/wratio10.html
-- Source: http://www.thottbot.com/?n=509154
-- Source: http://wow.allakhazam.com/db/item.html?witem=17113
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `dmg_min1`=144, `dmg_max1`=229 WHERE entry=17113;
-- SPELLS CHANGED: Sulfuras, Hand of Ragnaros (ilevel 80 entry 17182). 3 versions
-- Source: http://www.thottbot.com/?i=40103
-- Source: http://wow.allakhazam.com/dyn/items/wratio5.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=17182
-- * Modified spell 1
-- 1.12 spell 0
-- 1.04 spell 21162 (Hurls a fiery ball that causes 273 to 334 Fire damage and an additional 75 damage over 10 sec.)
-- * Modified spell 2
-- 1.12 spell 21162 (Hurls a fiery ball that causes 273 to 334 Fire damage and an additional 75 damage over 10 sec.)
-- 1.04 spell 21142 (Deals 5 Fire damage to anyone who strikes you with a melee attack.)
-- * Modified spell 3
-- 1.12 spell 21142 (Deals 5 Fire damage to anyone who strikes you with a melee attack.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_2`=21142, `spelltrigger_2`=1, `spellid_1`=21162, `spelltrigger_1`=2, `spellid_3`=0, `spelltrigger_3`=0 WHERE entry=17182;
-- SPELLS CHANGED: Helm of the Mountain (ilevel 53 entry 17734). 3 versions
-- Source: http://www.thottbot.com/?n=111545 / http://wow.allakhazam.com/item.html?witem=17734
-- Source: http://www.thottbot.com/?i=Helm%20of%20the%20Mountain
-- Source: http://www.thottbot.com/?i=Helm%20of%20the%20Mountain
-- * Modified spell 1
-- 1.12 spell 13385 (Increased Defense +7.)
-- 1.04 spell 13390 (Increased Defense +10.)
UPDATE item_template SET `spellid_1`=13390 WHERE entry=17734;
-- SPELLS CHANGED: Resurgence Rod (ilevel 53 entry 17743). 6 versions
-- Source: http://www.thottbot.com/?i=Verdant%20Keeper%27s%20Aim / http://wow.allakhazam.com/item.html?witem=17743
-- Source: http://wow.allakhazam.com/item.html?witem=17743
-- Source: http://www.thottbot.com/?i=19544
-- Source: http://wow.allakhazam.com/dyn/items/wminlev10.html
-- Source: http://www.thottbot.com/?i=Verdant%20Keeper%27s%20Aim
-- Source: http://www.thottbot.com/?i=Resurgence%20Rod
-- * Modified spell 2
-- 1.12 spell 20969 (Restores 5 health every 5 sec.)
-- 1.04 spell 21345 (Restores 2 health per 5 sec.)
UPDATE item_template SET `spellid_2`=21345 WHERE entry=17743;
-- DAMAGE CHANGED: Blade of Eternal Darkness (ilevel 54 entry 17780). 2/5 versions
-- Source: http://wow.allakhazam.com/dyn/items/wratio15.html
-- Source: http://wow.allakhazam.com/dyn/items/wminlev15.html
-- Source: http://www.thottbot.com/?i=25000
-- Source: http://wow.allakhazam.com/item.html?witem=17780
-- Source: http://www.thottbot.com/?n=158030
-- Warning: UNRESOLVED conflict
UPDATE item_template SET `dmg_min1`=33, `dmg_max1`=69 WHERE entry=17780;
-- SPELLS REMOVED: Stormpike Insignia Rank 4 (ilevel 60 entry 17902). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname12.html
-- * Modified spell 1
-- 1.12 spell 21596 (Restores 5 health per 5 sec.)
-- 1.04 spell 0
-- * Modified spell 2
-- 1.12 spell 13669 (Increases your chance to dodge an attack by 1%.)
-- 1.04 spell 0
-- * Modified spell 3
-- 1.12 spell 22564 (Returns you to the sanctuary of Dun Baldar.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0, `spellid_3`=0 WHERE entry=17902;
-- SPELLS CHANGED: Stormpike Insignia Rank 6 (ilevel 60 entry 17904). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname12.html
-- * Modified spell 1
-- 1.12 spell 20885 (Restores 8 health per 5 sec.)
-- 1.04 spell 21596 (Restores 5 health per 5 sec.)
UPDATE item_template SET `spellid_1`=21596 WHERE entry=17904;
-- SPELLS CHANGED: Frostwolf Insignia Rank 4 (ilevel 60 entry 17907). 2 versions
-- Source: http://wow.allakhazam.com/profile.html?38298
-- Source: http://www.thottbot.com/?i=40521
-- * Modified spell 1
-- 1.12 spell 21596 (Restores 5 health per 5 sec.)
-- 1.04 spell 21592 (Restores 3 health per 5 sec.)
UPDATE item_template SET `spellid_1`=21592 WHERE entry=17907;
-- SPELLS CHANGED: Frostwolf Insignia Rank 5 (ilevel 60 entry 17908). 2 versions
-- Source: http://wow.allakhazam.com/profile.html?103342
-- Source: http://www.thottbot.com/?i=40521
-- * Modified spell 1
-- 1.12 spell 21600 (Restores 7 health per 5 sec.)
-- 1.04 spell 21347 (Restores 4 health per 5 sec.)
UPDATE item_template SET `spellid_1`=21347 WHERE entry=17908;
-- SPELLS CHANGED: Frostwolf Insignia Rank 6 (ilevel 60 entry 17909). 1 versions
-- Source: http://wow.allakhazam.com/profile.html?103342
-- * Modified spell 1
-- 1.12 spell 20885 (Restores 8 health per 5 sec.)
-- 1.04 spell 21596 (Restores 5 health per 5 sec.)
UPDATE item_template SET `spellid_1`=21596 WHERE entry=17909;
-- SPELLS REMOVED: Fist of Stone (ilevel 53 entry 17943). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/wname4.html
-- Source: http://wow.allakhazam.com/dyn/items/wminlev4.html
-- Source: http://wow.allakhazam.com/dyn/items/iminlev21.html
-- * Modified spell 1
-- 1.12 spell 21951 (Restores 50 mana.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=17943;
-- STATS CHANGED: Coal Miner Boots (ilevel 57 entry 18043). 1/2 versions
UPDATE item_template SET `stat_value1`=13, `stat_value2`=0, `armor`=102 WHERE entry=18043;
-- QUALITY CHANGED: Coal Miner Boots (ilevel 57 entry 18043)
UPDATE item_template SET Quality=2 WHERE entry=18043;
-- STATS CHANGED: Hurley's Tankard (ilevel 57 entry 18044). 1/3 versions
UPDATE item_template SET `stat_value1`=10, `stat_value2`=0 WHERE entry=18044;
-- DAMAGE CHANGED: Hurley's Tankard (ilevel 57 entry 18044). 1/3 versions
-- Source: http://www.thottbot.com/?n=615157 / http://wow.allakhazam.com/item.html?witem=18044
-- Source: http://wow.allakhazam.com/dyn/items/wminlev4.html
-- Source: http://www.thottbot.com/?i=35862
UPDATE item_template SET `delay`=1800, `dmg_min1`=42, `dmg_max1`=80 WHERE entry=18044;
-- QUALITY CHANGED: Hurley's Tankard (ilevel 57 entry 18044)
UPDATE item_template SET Quality=2 WHERE entry=18044;
-- STATS CHANGED: Flame Walkers (ilevel 62 entry 18047). 1/2 versions
UPDATE item_template SET `stat_value1`=0, `fire_res`=10 WHERE entry=18047;
-- SPELLS CHANGED: Flame Walkers (ilevel 62 entry 18047). 2 versions
-- Source: http://www.thottbot.com/?n=88426 / http://wow.allakhazam.com/dyn/items/itype8.html
-- Source: http://www.thottbot.com/?i=Flame%20Walkers
-- * Modified spell 1
-- 1.12 spell 13669 (Increases your chance to dodge an attack by 1%.)
-- 1.04 spell 13670 (Increases your chance to dodge an attack by 2%.)
UPDATE item_template SET `spellid_1`=13670 WHERE entry=18047;
-- STATS CHANGED: Mastersmith's Hammer (ilevel 60 entry 18048). 1/4 versions
UPDATE item_template SET `stat_value1`=0, `fire_res`=10 WHERE entry=18048;
-- DAMAGE CHANGED: Mastersmith's Hammer (ilevel 60 entry 18048). 1/4 versions
-- Source: http://wow.allakhazam.com/dyn/items/wminlev4.html
-- Source: http://wow.allakhazam.com/dyn/items/wname4.html
-- Source: http://www.thottbot.com/?n=88426 / http://wow.allakhazam.com/item.html?witem=18048
-- Source: http://wow.allakhazam.com/item.html?witem=18048
UPDATE item_template SET `dmg_min1`=62, `dmg_max1`=116 WHERE entry=18048;
-- SPELLS CHANGED: Mastersmith's Hammer (ilevel 60 entry 18048). 4 versions
-- Source: http://wow.allakhazam.com/dyn/items/wminlev4.html
-- Source: http://wow.allakhazam.com/dyn/items/wname4.html
-- Source: http://www.thottbot.com/?n=88426 / http://wow.allakhazam.com/item.html?witem=18048
-- Source: http://wow.allakhazam.com/item.html?witem=18048
-- * Modified spell 1
-- 1.12 spell 9343 (Increases damage and healing done by magical spells and effects by up to 14.)
-- 1.04 spell 7688 (Increases damage done by Fire spells and effects by up to 9.)
UPDATE item_template SET `spellid_1`=7688 WHERE entry=18048;
-- QUALITY CHANGED: Mastersmith's Hammer (ilevel 60 entry 18048)
UPDATE item_template SET Quality=2 WHERE entry=18048;
-- STATS CHANGED: Feralsurge Girdle (ilevel 63 entry 18104). 1/1 versions
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0 WHERE entry=18104;
-- SPELLS CHANGED: Feralsurge Girdle (ilevel 63 entry 18104). 1 versions
-- Source: http://www.thottbot.com/?n=479925 / http://wow.allakhazam.com/db/item.html?witem=18104
-- * Modified spell 1
-- 1.12 spell 0
-- 1.04 spell 7597 (Improves your chance to get a critical strike by 1%.)
-- * Modified spell 2
-- 1.12 spell 21629 (Restores 8 mana per 5 sec.)
-- 1.04 spell 18378 (Restores 8 mana per 5 sec.)
UPDATE item_template SET `spellid_2`=18378, `spellid_1`=7597, `spelltrigger_1`=1 WHERE entry=18104;
-- SPELLS REMOVED: Eskhandar's Left Claw (ilevel 66 entry 18202). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/wminlev13.html
-- * Modified spell 1
-- 1.12 spell 22639 (Slows enemy's movement by 60% and causes them to bleed for 150 damage over 30 sec.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=18202;
-- STATS CHANGED: Drape of Benediction (ilevel 67 entry 18208). 1/2 versions
UPDATE item_template SET `stat_value1`=10, `stat_value2`=9, `stat_value3`=4 WHERE entry=18208;
-- SPELLS CHANGED: Drape of Benediction (ilevel 67 entry 18208). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=18208
-- Source: http://www.thottbot.com/?n=481660 / http://wow.allakhazam.com/item.html?witem=18208
-- * Modified spell 1
-- 1.12 spell 9317 (Increases healing done by spells and effects by up to 31.)
-- 1.04 spell 9407 (Increases healing done by spells and effects by up to 20.)
UPDATE item_template SET `spellid_1`=9407 WHERE entry=18208;
-- SPELLS CHANGED: Unbridled Leggings (ilevel 56 entry 18298). 2 versions
-- Source: http://www.thottbot.com/?n=475989 / http://wow.allakhazam.com/item.html?witem=18298
-- Source: http://www.thottbot.com/?i=Unbridled%20Leggings
-- * Modified spell 1
-- 1.12 spell 21601 (Restores 7 health per 5 sec.)
-- 1.04 spell 21596 (Restores 5 health per 5 sec.)
UPDATE item_template SET `spellid_1`=21596 WHERE entry=18298;
-- STATS CHANGED: Satyr's Bow (ilevel 58 entry 18323). 1/3 versions
UPDATE item_template SET `stat_value1`=7 WHERE entry=18323;
-- SPELLS CHANGED: Evil Eye Pendant (ilevel 62 entry 18381). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=18381
-- Source: http://www.thottbot.com/?n=614364
-- * Modified spell 1
-- 1.12 spell 13385 (Increased Defense +7.)
-- 1.04 spell 13386 (Increased Defense +7.)
UPDATE item_template SET `spellid_1`=13386 WHERE entry=18381;
-- SPELLS CHANGED: Force Imbued Gauntlets (ilevel 61 entry 18383). 2 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=18383
-- Source: http://www.thottbot.com/?i=Force%20Imbued%20Gauntlets
-- * Modified spell 1
-- 1.12 spell 13385 (Increased Defense +7.)
-- 1.04 spell 13390 (Increased Defense +10.)
UPDATE item_template SET `spellid_1`=13390 WHERE entry=18383;
-- SPELLS CHANGED: Bile-etched Spaulders (ilevel 62 entry 18384). 1 versions
-- Source: http://www.thottbot.com/?n=614364 / http://wow.allakhazam.com/dyn/items/iname3.html
-- * Modified spell 1
-- 1.12 spell 13385 (Increased Defense +7.)
-- 1.04 spell 13390 (Increased Defense +10.)
UPDATE item_template SET `spellid_1`=13390 WHERE entry=18384;
-- SPELLS CHANGED: Onyxia Blood Talisman (ilevel 74 entry 18406). 1 versions
-- Source: http://wow.allakhazam.com/item.html?witem=18406
-- * Modified spell 2
-- 1.12 spell 13387 (Increased Defense +8.)
-- 1.04 spell 21408 (Increased Defense +12.)
-- * Modified spell 3
-- 1.12 spell 21601 (Restores 7 health per 5 sec.)
-- 1.04 spell 21596 (Restores 5 health per 5 sec.)
UPDATE item_template SET `spellid_2`=21408, `spellid_3`=21596 WHERE entry=18406;
-- SPELLS CHANGED: Cloak of Warding (ilevel 62 entry 18413). 4 versions
-- Source: http://www.thottbot.com/?i=8859
-- Source: http://www.thottbot.com/?i=8859 / http://wow.allakhazam.com/item.html?witem=18413
-- Source: http://www.thottbot.com/?i=35977
-- Source: http://www.thottbot.com/?i=35977
-- * Modified spell 1
-- 1.12 spell 7518 (Increased Defense +5.)
-- 1.04 spell 13386 (Increased Defense +7.)
UPDATE item_template SET `spellid_1`=13386 WHERE entry=18413;
-- SPELLS CHANGED: Oddly Magical Belt (ilevel 60 entry 18475). 1 versions
-- Source: http://www.thottbot.com/?n=478397 / http://wow.allakhazam.com/db/item.html?witem=18475
-- * Modified spell 1
-- 1.12 spell 9345 (Increases damage and healing done by magical spells and effects by up to 16.)
-- 1.04 spell 25110 (Increases damage and healing done by magical spells and effects by up to 16.)
UPDATE item_template SET `spellid_1`=25110 WHERE entry=18475;
-- SPELLS CHANGED: Redoubt Cloak (ilevel 63 entry 18495). 1 versions
-- Source: http://www.thottbot.com/?n=478397 / http://wow.allakhazam.com/profile.html?55827
-- * Modified spell 1
-- 1.12 spell 13385 (Increased Defense +7.)
-- 1.04 spell 13390 (Increased Defense +10.)
UPDATE item_template SET `spellid_1`=13390 WHERE entry=18495;
-- SPELLS CHANGED: Monstrous Glaive (ilevel 62 entry 18502). 1 versions
-- Source: http://www.thottbot.com/?n=614388 / http://wow.allakhazam.com/item.html?witem=18502
-- * Modified spell 2
-- 1.12 spell 13385 (Increased Defense +7.)
-- 1.04 spell 13390 (Increased Defense +10.)
UPDATE item_template SET `spellid_2`=13390 WHERE entry=18502;
-- SPELLS CHANGED: Kromcrush's Chestplate (ilevel 62 entry 18503). 1 versions
-- Source: http://www.thottbot.com/?n=614388 / http://wow.allakhazam.com/profile.html?55827
-- * Modified spell 1
-- 1.12 spell 13390 (Increased Defense +10.)
-- 1.04 spell 21411 (Increased Defense +15.)
UPDATE item_template SET `spellid_1`=21411 WHERE entry=18503;
-- SPELLS CHANGED: Unyielding Maul (ilevel 62 entry 18531). 1 versions
-- Source: http://www.thottbot.com/?n=478397 / http://wow.allakhazam.com/item.html?witem=18531
-- * Modified spell 1
-- 1.12 spell 13387 (Increased Defense +8.)
-- 1.04 spell 21408 (Increased Defense +12.)
UPDATE item_template SET `spellid_1`=21408 WHERE entry=18531;
-- SPELLS CHANGED: Milli's Shield (ilevel 59 entry 18535). 2 versions
-- Source: http://www.thottbot.com/?i=35696 / http://wow.allakhazam.com/item.html?witem=18535
-- Source: http://www.thottbot.com/?i=Milli%27s%20Shield
-- * Modified spell 1
-- 1.12 spell 21347 (Restores 4 health per 5 sec.)
-- 1.04 spell 21592 (Restores 3 health per 5 sec.)
UPDATE item_template SET `spellid_1`=21592 WHERE entry=18535;
-- SPELLS CHANGED: Infernal Headcage (ilevel 69 entry 18546). 3 versions
-- Source: http://www.thottbot.com/?n=509154 / http://wow.allakhazam.com/item.html?witem=18546
-- Source: http://wow.allakhazam.com/dyn/items/iminlev1.html
-- Source: http://www.thottbot.com/?i=36286
-- * Modified spell 1
-- 1.12 spell 9345 (Increases damage and healing done by magical spells and effects by up to 16.)
-- 1.04 spell 25110 (Increases damage and healing done by magical spells and effects by up to 16.)
UPDATE item_template SET `spellid_1`=25110 WHERE entry=18546;
-- SPELLS CHANGED: Unmelting Ice Girdle (ilevel 71 entry 18547). 1 versions
-- Source: http://www.thottbot.com/?n=481660 / http://wow.allakhazam.com/profile.html?103342
-- * Modified spell 1
-- 1.12 spell 13387 (Increased Defense +8.)
-- 1.04 spell 21408 (Increased Defense +12.)
UPDATE item_template SET `spellid_1`=21408 WHERE entry=18547;
-- NOT FOUND: The Twin Blades of Azzinoth (ilevel 100 entry 18582)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 18582);
-- NOT FOUND: Warglaive of Azzinoth (Right) (ilevel 100 entry 18583)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 18583);
-- NOT FOUND: Warglaive of Azzinoth (Left) (ilevel 100 entry 18584)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 18584);
-- SPELLS CHANGED: Tome of Sacrifice (ilevel 60 entry 18602). 1 versions
-- Source: http://wow.allakhazam.com/item.html?witem=18602
-- * Modified spell 1
-- 1.12 spell 21348 (Restores 6 health per 5 sec.)
-- 1.04 spell 21347 (Restores 4 health per 5 sec.)
UPDATE item_template SET `spellid_1`=21347 WHERE entry=18602;
-- SPELLS CHANGED: Benediction (ilevel 75 entry 18608). 2 versions
-- Source: http://www.thottbot.com/?i=Anathema
-- Source: http://wow.allakhazam.com/profile.html?47143
-- * Modified spell 3
-- 1.12 spell 23264 (Increases healing done by spells and effects by up to 106.)
-- 1.04 spell 26225 (Increases healing done by spells and effects by up to 106.)
UPDATE item_template SET `spellid_3`=26225 WHERE entry=18608;
-- NOT FOUND: Bloody Chain Boots (ilevel 8 entry 18612)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 18612);
-- NOT FOUND: Sash of the Windreaver (ilevel 61 entry 18676)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 18676);
-- DAMAGE CHANGED: Ancient Bone Bow (ilevel 61 entry 18680). 1/3 versions
-- Source: http://wow.allakhazam.com/dyn/items/wminlev2.html
-- Source: http://wow.allakhazam.com/dyn/items/wratio2.html
-- Source: http://www.thottbot.com/?i=37260
UPDATE item_template SET `dmg_min1`=87, `dmg_max1`=88 WHERE entry=18680;
-- SPELLS CHANGED: Dark Advisor's Pendant (ilevel 61 entry 18691). 1 versions
-- Source: http://www.thottbot.com/?i=Dark%20Advisor%27s%20Pendant / http://wow.allakhazam.com/item.html?witem=18691
-- * Modified spell 1
-- 1.12 spell 9327 (Increases damage done by Shadow spells and effects by up to 20.)
-- 1.04 spell 25064 (Increases damage done by shadow spells and effects by up to 20.)
UPDATE item_template SET `spellid_1`=25064 WHERE entry=18691;
-- SPELLS CHANGED: Rhok'delar, Longbow of the Ancient Keepers (ilevel 75 entry 18713). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/wminlev2.html
-- Source: http://wow.allakhazam.com/item.html?witem=18713
-- * Modified spell 1
-- 1.12 spell 0
-- 1.04 spell 23193 (Transforms into Lok'delar, Stave of the Ancient Keepers.)
UPDATE item_template SET `spellid_1`=23193 WHERE entry=18713;
-- SPELLS CHANGED: Lok'delar, Stave of the Ancient Keepers (ilevel 75 entry 18715). 1 versions
-- Source: http://wow.allakhazam.com/item.html?witem=18715
-- * Modified spell 1
-- 1.12 spell 0
-- 1.04 spell 23194 (Transforms into Rhok'delar, Longbow of the Ancient Keepers and Lok'delar, Stave of the Ancient Keepers.)
UPDATE item_template SET `spellid_1`=23194 WHERE entry=18715;
-- SPELLS CHANGED: Crimson Felt Hat (ilevel 59 entry 18727). 1 versions
-- Source: http://wow.allakhazam.com/profile.html?49695
-- * Modified spell 1
-- 1.12 spell 14798 (Increases damage and healing done by magical spells and effects by up to 30.)
-- 1.04 spell 22747 (Increases damage and healing done by magical spells and effects by up to 30.)
UPDATE item_template SET `spellid_1`=22747 WHERE entry=18727;
-- DAMAGE CHANGED: Carapace Spine Crossbow (ilevel 61 entry 18738). 1/3 versions
-- Source: http://www.thottbot.com/?n=614959 / http://wow.allakhazam.com/profile.html?103342
-- Source: http://www.thottbot.com/?n=614959
-- Source: http://www.thottbot.com/?i=37177
UPDATE item_template SET `dmg_min1`=72, `dmg_max1`=134 WHERE entry=18738;
-- SPELLS REMOVED: Malicious Axe (ilevel 62 entry 18759). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/wratio1.html
-- Source: http://wow.allakhazam.com/dyn/items/wname1.html
-- Source: http://wow.allakhazam.com/dyn/items/wratio1.html
-- * Modified spell 1
-- 1.12 spell 9334 (+26 Attack Power.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=18759;
-- SPELLS REMOVED: Necromantic Band (ilevel 62 entry 18760). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype11.html
-- * Modified spell 1
-- 1.12 spell 20885 (Restores 8 health per 5 sec.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=18760;
-- SPELLS CHANGED: Ring of Binding (ilevel 73 entry 18813). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname11.html
-- Source: http://www.thottbot.com/?n=480638
-- * Modified spell 1
-- 1.12 spell 7517 (Increased Defense +4.)
-- 1.04 spell 13384 (Increased Defense +6.)
UPDATE item_template SET `spellid_1`=13384 WHERE entry=18813;
-- STATS CHANGED: Grand Marshal's Aegis (ilevel 78 entry 18825). 1/1 versions
UPDATE item_template SET `stat_value1`=18, `stat_value2`=7, `armor`=2468 WHERE entry=18825;
-- SPELLS REMOVED: Grand Marshal's Aegis (ilevel 78 entry 18825). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname14.html
-- * Modified spell 1
-- 1.12 spell 13959 (When struck in combat has a 5% chance of inflicting 35 to 66 Nature damage to the attacker.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=18825;
-- STATS CHANGED: High Warlord's Shield Wall (ilevel 78 entry 18826). 1/1 versions
UPDATE item_template SET `stat_value1`=18, `stat_value2`=7, `armor`=2468 WHERE entry=18826;
-- SPELLS REMOVED: High Warlord's Shield Wall (ilevel 78 entry 18826). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname14.html
-- * Modified spell 1
-- 1.12 spell 13959 (When struck in combat has a 5% chance of inflicting 35 to 66 Nature damage to the attacker.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=18826;
-- STATS CHANGED: Grand Marshal's Handaxe (ilevel 78 entry 18827). 1/3 versions
UPDATE item_template SET `stat_value1`=6 WHERE entry=18827;
-- DAMAGE CHANGED: Grand Marshal's Handaxe (ilevel 78 entry 18827). 1/3 versions
-- Source: http://wow.allakhazam.com/dyn/items/wname0.html
-- Source: http://wow.allakhazam.com/dyn/items/iname13.html
-- Source: http://wow.allakhazam.com/item.html?witem=18827
UPDATE item_template SET `dmg_min1`=115, `dmg_max1`=173 WHERE entry=18827;
-- SPELLS CHANGED: Grand Marshal's Handaxe (ilevel 78 entry 18827). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/wname0.html
-- Source: http://wow.allakhazam.com/dyn/items/iname13.html
-- Source: http://wow.allakhazam.com/item.html?witem=18827
-- * Modified spell 2
-- 1.12 spell 9335 (+28 Attack Power.)
-- 1.04 spell 9141 (+12 Attack Power.)
UPDATE item_template SET `spellid_2`=9141 WHERE entry=18827;
-- STATS CHANGED: High Warlord's Cleaver (ilevel 78 entry 18828). 1/4 versions
UPDATE item_template SET `stat_value1`=6 WHERE entry=18828;
-- DAMAGE CHANGED: High Warlord's Cleaver (ilevel 78 entry 18828). 1/4 versions
-- Source: http://wow.allakhazam.com/dyn/items/wname0.html
-- Source: http://wow.allakhazam.com/dyn/items/wratio0.html
-- Source: http://wow.allakhazam.com/item.html?witem=18828
-- Source: http://wow.allakhazam.com/dyn/items/iname13.html
UPDATE item_template SET `dmg_min1`=115, `dmg_max1`=173 WHERE entry=18828;
-- SPELLS CHANGED: High Warlord's Cleaver (ilevel 78 entry 18828). 4 versions
-- Source: http://wow.allakhazam.com/dyn/items/wname0.html
-- Source: http://wow.allakhazam.com/dyn/items/wratio0.html
-- Source: http://wow.allakhazam.com/item.html?witem=18828
-- Source: http://wow.allakhazam.com/dyn/items/iname13.html
-- * Modified spell 2
-- 1.12 spell 9335 (+28 Attack Power.)
-- 1.04 spell 9141 (+12 Attack Power.)
UPDATE item_template SET `spellid_2`=9141 WHERE entry=18828;
-- STATS CHANGED: Grand Marshal's Sunderer (ilevel 78 entry 18830). 1/2 versions
UPDATE item_template SET `stat_value1`=36, `stat_value2`=20 WHERE entry=18830;
-- DAMAGE CHANGED: Grand Marshal's Sunderer (ilevel 78 entry 18830). 1/2 versions
-- Source: http://wow.allakhazam.com/dyn/items/wname1.html
-- Source: http://wow.allakhazam.com/item.html?witem=18830
UPDATE item_template SET `dmg_min1`=196, `dmg_max1`=295 WHERE entry=18830;
-- STATS CHANGED: High Warlord's Battle Axe (ilevel 78 entry 18831). 1/3 versions
UPDATE item_template SET `stat_value1`=36, `stat_value2`=20 WHERE entry=18831;
-- DAMAGE CHANGED: High Warlord's Battle Axe (ilevel 78 entry 18831). 1/3 versions
-- Source: http://wow.allakhazam.com/dyn/items/wname1.html
-- Source: http://wow.allakhazam.com/dyn/items/iname17.html
-- Source: http://wow.allakhazam.com/item.html?witem=18831
UPDATE item_template SET `dmg_min1`=196, `dmg_max1`=295 WHERE entry=18831;
-- STATS CHANGED: Grand Marshal's Dirk (ilevel 78 entry 18838). 1/1 versions
UPDATE item_template SET `stat_value1`=6 WHERE entry=18838;
-- SPELLS REMOVED: Grand Marshal's Dirk (ilevel 78 entry 18838). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/wratio15.html
-- * Modified spell 1
-- 1.12 spell 7597 (Improves your chance to get a critical strike by 1%.)
-- 1.04 spell 0
-- * Modified spell 2
-- 1.12 spell 9335 (+28 Attack Power.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=18838;
-- STATS CHANGED: High Warlord's Razor (ilevel 78 entry 18840). 1/2 versions
UPDATE item_template SET `stat_value1`=6 WHERE entry=18840;
-- DAMAGE CHANGED: High Warlord's Razor (ilevel 78 entry 18840). 1/2 versions
-- Source: http://wow.allakhazam.com/dyn/items/wname15.html
-- Source: http://wow.allakhazam.com/item.html?witem=18840
UPDATE item_template SET `dmg_min1`=79, `dmg_max1`=120 WHERE entry=18840;
-- SPELLS CHANGED: High Warlord's Razor (ilevel 78 entry 18840). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/wname15.html
-- Source: http://wow.allakhazam.com/item.html?witem=18840
-- * Modified spell 2
-- 1.12 spell 9335 (+28 Attack Power.)
-- 1.04 spell 9141 (+12 Attack Power.)
UPDATE item_template SET `spellid_2`=9141 WHERE entry=18840;
-- STATS CHANGED: Grand Marshal's Right Hand Blade (ilevel 78 entry 18843). 1/1 versions
UPDATE item_template SET `stat_value1`=6 WHERE entry=18843;
-- SPELLS REMOVED: Grand Marshal's Right Hand Blade (ilevel 78 entry 18843). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/wminlev13.html
-- * Modified spell 1
-- 1.12 spell 7597 (Improves your chance to get a critical strike by 1%.)
-- 1.04 spell 0
-- * Modified spell 2
-- 1.12 spell 9335 (+28 Attack Power.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=18843;
-- SPELLS REMOVED: Insignia of the Horde (ilevel 0 entry 18845). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname12.html
-- * Modified spell 1
-- 1.12 spell 5579 (Dispels all Immobilizing, Slowing and Stun effects.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0 WHERE entry=18845;
-- SPELLS REMOVED: Insignia of the Horde (ilevel 0 entry 18846). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname12.html
-- * Modified spell 1
-- 1.12 spell 5579 (Dispels all Immobilizing, Slowing and Stun effects.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0 WHERE entry=18846;
-- STATS CHANGED: Grand Marshal's Left Hand Blade (ilevel 78 entry 18847). 1/2 versions
UPDATE item_template SET `stat_value1`=6 WHERE entry=18847;
-- SPELLS REMOVED: Grand Marshal's Left Hand Blade (ilevel 78 entry 18847). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/wminlev13.html
-- Source: http://wow.allakhazam.com/dyn/items/wname13.html
-- * Modified spell 1
-- 1.12 spell 7597 (Improves your chance to get a critical strike by 1%.)
-- 1.04 spell 0
-- * Modified spell 2
-- 1.12 spell 9335 (+28 Attack Power.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=18847;
-- STATS CHANGED: High Warlord's Left Claw (ilevel 78 entry 18848). 1/2 versions
UPDATE item_template SET `stat_value1`=6 WHERE entry=18848;
-- SPELLS REMOVED: High Warlord's Left Claw (ilevel 78 entry 18848). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/wname13.html
-- Source: http://wow.allakhazam.com/dyn/items/iname22.html
-- * Modified spell 1
-- 1.12 spell 7597 (Improves your chance to get a critical strike by 1%.)
-- 1.04 spell 0
-- * Modified spell 2
-- 1.12 spell 9335 (+28 Attack Power.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=18848;
-- SPELLS REMOVED: Insignia of the Horde (ilevel 0 entry 18849). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname12.html
-- * Modified spell 1
-- 1.12 spell 23273 (Dispels all Charm, Fear and Polymorph effects.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0 WHERE entry=18849;
-- SPELLS REMOVED: Insignia of the Horde (ilevel 0 entry 18850). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname12.html
-- * Modified spell 1
-- 1.12 spell 23274 (Dispels all Fear, Polymorph and Slowing effects.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0 WHERE entry=18850;
-- SPELLS REMOVED: Insignia of the Horde (ilevel 0 entry 18851). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname12.html
-- * Modified spell 1
-- 1.12 spell 23276 (Dispels all Fear, Polymorph and Stun effects.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0 WHERE entry=18851;
-- SPELLS REMOVED: Insignia of the Horde (ilevel 0 entry 18852). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname12.html
-- * Modified spell 1
-- 1.12 spell 23273 (Dispels all Charm, Fear and Polymorph effects.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0 WHERE entry=18852;
-- SPELLS REMOVED: Insignia of the Horde (ilevel 0 entry 18853). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname12.html
-- * Modified spell 1
-- 1.12 spell 23277 (Dispels all Charm, Fear and Stun effects.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0 WHERE entry=18853;
-- SPELLS REMOVED: Insignia of the Alliance (ilevel 0 entry 18856). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname12.html
-- * Modified spell 1
-- 1.12 spell 5579 (Dispels all Immobilizing, Slowing and Stun effects.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0 WHERE entry=18856;
-- SPELLS REMOVED: Insignia of the Alliance (ilevel 0 entry 18857). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname12.html
-- * Modified spell 1
-- 1.12 spell 23273 (Dispels all Charm, Fear and Polymorph effects.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0 WHERE entry=18857;
-- SPELLS REMOVED: Insignia of the Alliance (ilevel 0 entry 18858). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname12.html
-- * Modified spell 1
-- 1.12 spell 23273 (Dispels all Charm, Fear and Polymorph effects.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0 WHERE entry=18858;
-- SPELLS REMOVED: Insignia of the Alliance (ilevel 0 entry 18859). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname12.html
-- * Modified spell 1
-- 1.12 spell 23274 (Dispels all Fear, Polymorph and Slowing effects.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0 WHERE entry=18859;
-- STATS CHANGED: Flamewaker Legplates (ilevel 61 entry 18861). 1/1 versions
UPDATE item_template SET `stat_value2`=12 WHERE entry=18861;
-- SPELLS REMOVED: Insignia of the Alliance (ilevel 0 entry 18862). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname12.html
-- * Modified spell 1
-- 1.12 spell 23276 (Dispels all Fear, Polymorph and Stun effects.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0 WHERE entry=18862;
-- SPELLS REMOVED: Insignia of the Alliance (ilevel 0 entry 18863). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname12.html
-- * Modified spell 1
-- 1.12 spell 23277 (Dispels all Charm, Fear and Stun effects.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0 WHERE entry=18863;
-- SPELLS REMOVED: Insignia of the Alliance (ilevel 0 entry 18864). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname12.html
-- * Modified spell 1
-- 1.12 spell 23276 (Dispels all Fear, Polymorph and Stun effects.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0 WHERE entry=18864;
-- STATS CHANGED: Grand Marshal's Punisher (ilevel 78 entry 18865). 1/4 versions
UPDATE item_template SET `stat_value1`=6 WHERE entry=18865;
-- DAMAGE CHANGED: Grand Marshal's Punisher (ilevel 78 entry 18865). 1/4 versions
-- Source: http://wow.allakhazam.com/dyn/items/wname4.html
-- Source: http://wow.allakhazam.com/dyn/items/wminlev4.html
-- Source: http://wow.allakhazam.com/item.html?witem=18865
-- Source: http://wow.allakhazam.com/dyn/items/iname13.html
UPDATE item_template SET `dmg_min1`=115, `dmg_max1`=173 WHERE entry=18865;
-- SPELLS CHANGED: Grand Marshal's Punisher (ilevel 78 entry 18865). 4 versions
-- Source: http://wow.allakhazam.com/dyn/items/wname4.html
-- Source: http://wow.allakhazam.com/dyn/items/wminlev4.html
-- Source: http://wow.allakhazam.com/item.html?witem=18865
-- Source: http://wow.allakhazam.com/dyn/items/iname13.html
-- * Modified spell 2
-- 1.12 spell 9335 (+28 Attack Power.)
-- 1.04 spell 9141 (+12 Attack Power.)
UPDATE item_template SET `spellid_2`=9141 WHERE entry=18865;
-- STATS CHANGED: High Warlord's Bludgeon (ilevel 78 entry 18866). 1/3 versions
UPDATE item_template SET `stat_value1`=6 WHERE entry=18866;
-- DAMAGE CHANGED: High Warlord's Bludgeon (ilevel 78 entry 18866). 1/3 versions
-- Source: http://wow.allakhazam.com/dyn/items/wname4.html
-- Source: http://wow.allakhazam.com/dyn/items/iname13.html
-- Source: http://wow.allakhazam.com/item.html?witem=18866
UPDATE item_template SET `dmg_min1`=115, `dmg_max1`=173 WHERE entry=18866;
-- SPELLS CHANGED: High Warlord's Bludgeon (ilevel 78 entry 18866). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/wname4.html
-- Source: http://wow.allakhazam.com/dyn/items/iname13.html
-- Source: http://wow.allakhazam.com/item.html?witem=18866
-- * Modified spell 2
-- 1.12 spell 9335 (+28 Attack Power.)
-- 1.04 spell 9141 (+12 Attack Power.)
UPDATE item_template SET `spellid_2`=9141 WHERE entry=18866;
-- STATS CHANGED: Grand Marshal's Battle Hammer (ilevel 78 entry 18867). 1/3 versions
UPDATE item_template SET `stat_value1`=36, `stat_value2`=20 WHERE entry=18867;
-- SPELLS REMOVED: Grand Marshal's Battle Hammer (ilevel 78 entry 18867). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/wminlev5.html
-- Source: http://wow.allakhazam.com/dyn/items/iname17.html
-- Source: http://wow.allakhazam.com/dyn/items/wratio5.html
-- * Modified spell 1
-- 1.12 spell 7597 (Improves your chance to get a critical strike by 1%.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=18867;
-- STATS CHANGED: High Warlord's Pulverizer (ilevel 78 entry 18868). 1/2 versions
UPDATE item_template SET `stat_value1`=36, `stat_value2`=20 WHERE entry=18868;
-- SPELLS REMOVED: High Warlord's Pulverizer (ilevel 78 entry 18868). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/wname5.html
-- Source: http://wow.allakhazam.com/dyn/items/wminlev5.html
-- * Modified spell 1
-- 1.12 spell 7597 (Improves your chance to get a critical strike by 1%.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=18868;
-- STATS CHANGED: Grand Marshal's Glaive (ilevel 78 entry 18869). 1/2 versions
UPDATE item_template SET `stat_value1`=36, `stat_value2`=20 WHERE entry=18869;
-- SPELLS REMOVED: Grand Marshal's Glaive (ilevel 78 entry 18869). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname17.html
-- Source: http://wow.allakhazam.com/dyn/items/wratio6.html
-- * Modified spell 1
-- 1.12 spell 7597 (Improves your chance to get a critical strike by 1%.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=18869;
-- STATS CHANGED: High Warlord's Pig Sticker (ilevel 78 entry 18871). 1/2 versions
UPDATE item_template SET `stat_value1`=36, `stat_value2`=20 WHERE entry=18871;
-- DAMAGE CHANGED: High Warlord's Pig Sticker (ilevel 78 entry 18871). 1/2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname17.html
-- Source: http://wow.allakhazam.com/item.html?witem=18871
UPDATE item_template SET `dmg_min1`=196, `dmg_max1`=295 WHERE entry=18871;
-- STATS CHANGED: Grand Marshal's Stave (ilevel 78 entry 18873). 1/1 versions
UPDATE item_template SET `stat_value1`=36, `stat_value2`=20, `stat_value3`=15 WHERE entry=18873;
-- DAMAGE CHANGED: Grand Marshal's Stave (ilevel 78 entry 18873). 1/1 versions
-- Source: http://wow.allakhazam.com/dyn/items/wname10.html
UPDATE item_template SET `dmg_min1`=125, `dmg_max1`=203 WHERE entry=18873;
-- SPELLS CHANGED: Grand Marshal's Stave (ilevel 78 entry 18873). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/wname10.html
-- * Modified spell 1
-- 1.12 spell 23929 (Increases damage and healing done by magical spells and effects by up to 71.)
-- 1.04 spell 17493 (Increases damage and healing done by magical spells and effects by up to 44.)
UPDATE item_template SET `spellid_1`=17493 WHERE entry=18873;
-- STATS CHANGED: High Warlord's War Staff (ilevel 78 entry 18874). 1/1 versions
UPDATE item_template SET `stat_value1`=36, `stat_value2`=20, `stat_value3`=15 WHERE entry=18874;
-- SPELLS REMOVED: High Warlord's War Staff (ilevel 78 entry 18874). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/wratio10.html
-- * Modified spell 1
-- 1.12 spell 23929 (Increases damage and healing done by magical spells and effects by up to 71.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=18874;
-- STATS CHANGED: Grand Marshal's Claymore (ilevel 78 entry 18876). 1/1 versions
UPDATE item_template SET `stat_value1`=36, `stat_value2`=20 WHERE entry=18876;
-- SPELLS REMOVED: Grand Marshal's Claymore (ilevel 78 entry 18876). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/wminlev8.html
-- * Modified spell 1
-- 1.12 spell 7597 (Improves your chance to get a critical strike by 1%.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=18876;
-- STATS CHANGED: High Warlord's Greatsword (ilevel 78 entry 18877). 1/2 versions
UPDATE item_template SET `stat_value1`=36, `stat_value2`=20 WHERE entry=18877;
-- DAMAGE CHANGED: High Warlord's Greatsword (ilevel 78 entry 18877). 1/2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=18877
-- Source: http://wow.allakhazam.com/dyn/items/wratio8.html
UPDATE item_template SET `dmg_min1`=196, `dmg_max1`=295 WHERE entry=18877;
-- SPELLS CHANGED: Heavy Dark Iron Ring (ilevel 66 entry 18879). 2 versions
-- Source: http://www.thottbot.com/?n=617303 / http://wow.allakhazam.com/profile.html?103342
-- Source: http://www.thottbot.com/?i=37315
-- * Modified spell 1
-- 1.12 spell 13383 (Increased Defense +5.)
-- 1.04 spell 13387 (Increased Defense +8.)
UPDATE item_template SET `spellid_1`=13387 WHERE entry=18879;
-- NOT FOUND: Ring of Critical Testing 2 (ilevel 60 entry 18970)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 18970);
-- SPELLS REMOVED: Dimensional Ripper - Everlook (ilevel 55 entry 18984). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname12.html
-- * Modified spell 1
-- 1.12 spell 23442 (Rips the dimensional walls asunder and transports you to Everlook in Winterspring.  There are technical problems that sometimes occur, but that's what Goblin Engineering is all about!)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0 WHERE entry=18984;
-- -----------------------------------
-- (MOSTLY) 1.6 (BWL) AND BEYOND ITEMS, WITH A FEW EXCEPTIONS WHICH ARE ACCOUNTED FOR BELOW
-- THIS SECTION
-- -----------------------------------
-- NOT FOUND: Thunderfury, Blessed Blade of the Windseeker (ilevel 80 entry 19019)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19019);
-- NOT FOUND: Heavy Timbermaw Belt (ilevel 58 entry 19043)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19043);
-- NOT FOUND: Might of the Timbermaw (ilevel 58 entry 19044)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19044);
-- NOT FOUND: Wisdom of the Timbermaw (ilevel 58 entry 19047)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19047);
-- NOT FOUND: Heavy Timbermaw Boots (ilevel 64 entry 19048)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19048);
-- NOT FOUND: Timbermaw Brawlers (ilevel 64 entry 19049)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19049);
-- NOT FOUND: Mantle of the Timbermaw (ilevel 64 entry 19050)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19050);
-- STATS REMOVED for item Dawn Treaders (http://wow.allakhazam.com/dyn/items/wname5.html) 
UPDATE item_template SET armor=0, stat_value1=0, stat_type1=0 WHERE entry=19052;
-- SPELLS REMOVED: Dawn Treaders (ilevel 58 entry 19052). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/wname5.html
-- * Modified spell 1
-- 1.12 spell 13669 (Increases your chance to dodge an attack by 1%.)
-- 1.04 spell 0
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=19052;
-- QUALITY CHANGED: Dawn Treaders (ilevel 58 entry 19052)
UPDATE item_template SET Quality=4 WHERE entry=19052;
-- NOT FOUND: Argent Boots (ilevel 58 entry 19056)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19056);
-- NOT FOUND: Gloves of the Dawn (ilevel 64 entry 19057)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19057);
-- NOT FOUND: Golden Mantle of the Dawn (ilevel 64 entry 19058)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19058);
-- NOT FOUND: Argent Shoulders (ilevel 64 entry 19059)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19059);
-- NOT FOUND: Greenleaf Handwraps (ilevel 50 entry 19116)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19116);
-- NOT FOUND: Owlbeast Hide Gloves (ilevel 50 entry 19119)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19119);
-- NOT FOUND: Blacklight Bracer (ilevel 66 entry 19135)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19135);
-- NOT FOUND: Dark Iron Helm (ilevel 66 entry 19148)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19148);
-- NOT FOUND: Lava Belt (ilevel 66 entry 19149)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19149);
-- NOT FOUND: Flarecore Robe (ilevel 66 entry 19156)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19156);
-- NOT FOUND: Chromatic Gauntlets (ilevel 70 entry 19157)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19157);
-- NOT FOUND: Contest Winner's Tabard (ilevel 1 entry 19160)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19160);
-- NOT FOUND: Corehound Belt (ilevel 70 entry 19162)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19162);
-- NOT FOUND: Molten Belt (ilevel 70 entry 19163)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19163);
-- NOT FOUND: Dark Iron Gauntlets (ilevel 70 entry 19164)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19164);
-- NOT FOUND: Flarecore Leggings (ilevel 70 entry 19165)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19165);
-- NOT FOUND: Black Amnesty (ilevel 66 entry 19166)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19166);
-- NOT FOUND: Blackfury (ilevel 66 entry 19167)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19167);
-- NOT FOUND: Blackguard (ilevel 70 entry 19168)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19168);
-- NOT FOUND: Nightfall (ilevel 70 entry 19169)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19169);
-- NOT FOUND: Ebon Hand (ilevel 70 entry 19170)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19170);
-- NOT FOUND: Darkmoon Card: Heroism (ilevel 66 entry 19287)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19287);
-- NOT FOUND: Darkmoon Card: Blue Dragon (ilevel 66 entry 19288)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19288);
-- NOT FOUND: Darkmoon Card: Maelstrom (ilevel 66 entry 19289)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19289);
-- NOT FOUND: Darkmoon Card: Twisting Nether (ilevel 66 entry 19290)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19290);
-- NOT FOUND: Last Month's Mutton (ilevel 34 entry 19292)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19292);
-- NOT FOUND: Last Year's Mutton (ilevel 55 entry 19293)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19293);
-- NOT FOUND: Darkmoon Flower (ilevel 20 entry 19295)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19295);
-- NOT FOUND: Darkmoon Ring (ilevel 55 entry 19302)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19302);
-- NOT FOUND: Darkmoon Necklace (ilevel 55 entry 19303)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19303);
-- NOT FOUND: The Untamed Blade (ilevel 73 entry 19334)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19334);
-- NOT FOUND: Spineshatter (ilevel 73 entry 19335)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19335);
-- NOT FOUND: Arcane Infused Gem (ilevel 76 entry 19336)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19336);
-- NOT FOUND: The Black Book (ilevel 76 entry 19337)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19337);
-- NOT FOUND: Mind Quickening Gem (ilevel 76 entry 19339)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19339);
-- NOT FOUND: Rune of Metamorphosis (ilevel 76 entry 19340)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19340);
-- NOT FOUND: Lifegiving Gem (ilevel 76 entry 19341)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19341);
-- NOT FOUND: Venomous Totem (ilevel 76 entry 19342)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19342);
-- NOT FOUND: Scrolls of Blinding Light (ilevel 76 entry 19343)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19343);
-- NOT FOUND: Natural Alignment Crystal (ilevel 76 entry 19344)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19344);
-- NOT FOUND: Aegis of Preservation (ilevel 76 entry 19345)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19345);
-- NOT FOUND: Dragonfang Blade (ilevel 74 entry 19346)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19346);
-- NOT FOUND: Claw of Chromaggus (ilevel 77 entry 19347)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19347);
-- NOT FOUND: Red Dragonscale Protector (ilevel 74 entry 19348)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19348);
-- NOT FOUND: Elementium Reinforced Bulwark (ilevel 77 entry 19349)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19349);
-- NOT FOUND: Heartstriker (ilevel 75 entry 19350)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19350);
-- NOT FOUND: Maladath, Runed Blade of the Black Flight (ilevel 75 entry 19351)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19351);
-- NOT FOUND: Chromatically Tempered Sword (ilevel 77 entry 19352)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19352);
-- NOT FOUND: Drake Talon Cleaver (ilevel 75 entry 19353)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19353);
-- NOT FOUND: Draconic Avenger (ilevel 71 entry 19354)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19354);
-- NOT FOUND: Shadow Wing Focus Staff (ilevel 75 entry 19355)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19355);
-- NOT FOUND: Staff of the Shadow Flame (ilevel 81 entry 19356)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19356);
-- NOT FOUND: Herald of Woe (ilevel 75 entry 19357)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19357);
-- NOT FOUND: Draconic Maul (ilevel 70 entry 19358)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19358);
-- NOT FOUND: Lok'amir il Romathis (ilevel 81 entry 19360)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19360);
-- NOT FOUND: Ashjre'thul, Crossbow of Smiting (ilevel 77 entry 19361)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19361);
-- NOT FOUND: Doom's Edge (ilevel 70 entry 19362)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19362);
-- NOT FOUND: Crul'shorukh, Edge of Chaos (ilevel 81 entry 19363)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19363);
-- NOT FOUND: Ashkandi, Greatsword of the Brotherhood (ilevel 81 entry 19364)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19364);
-- NOT FOUND: Claw of the Black Drake (ilevel 75 entry 19365)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19365);
-- NOT FOUND: Master Dragonslayer's Orb (ilevel 83 entry 19366)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19366);
-- NOT FOUND: Dragon's Touch (ilevel 75 entry 19367)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19367);
-- NOT FOUND: Dragonbreath Hand Cannon (ilevel 75 entry 19368)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19368);
-- NOT FOUND: Gloves of Rapid Evolution (ilevel 73 entry 19369)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19369);
-- NOT FOUND: Mantle of the Blackwing Cabal (ilevel 73 entry 19370)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19370);
-- NOT FOUND: Pendant of the Fallen Dragon (ilevel 74 entry 19371)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19371);
-- NOT FOUND: Helm of Endless Rage (ilevel 74 entry 19372)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19372);
-- NOT FOUND: Black Brood Pauldrons (ilevel 75 entry 19373)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19373);
-- NOT FOUND: Bracers of Arcane Accuracy (ilevel 75 entry 19374)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19374);
-- NOT FOUND: Mish'undare, Circlet of the Mind Flayer (ilevel 83 entry 19375)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19375);
-- NOT FOUND: Archimtiros' Ring of Reckoning (ilevel 83 entry 19376)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19376);
-- NOT FOUND: Prestor's Talisman of Connivery (ilevel 83 entry 19377)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19377);
-- NOT FOUND: Cloak of the Brood Lord (ilevel 83 entry 19378)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19378);
-- NOT FOUND: Neltharion's Tear (ilevel 83 entry 19379)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19379);
-- NOT FOUND: Therazane's Link (ilevel 83 entry 19380)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19380);
-- NOT FOUND: Boots of the Shadow Flame (ilevel 83 entry 19381)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19381);
-- NOT FOUND: Pure Elementium Band (ilevel 83 entry 19382)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19382);
-- NOT FOUND: Master Dragonslayer's Medallion (ilevel 83 entry 19383)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19383);
-- NOT FOUND: Master Dragonslayer's Ring (ilevel 83 entry 19384)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19384);
-- NOT FOUND: Empowered Leggings (ilevel 77 entry 19385)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19385);
-- NOT FOUND: Elementium Threaded Cloak (ilevel 77 entry 19386)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19386);
-- NOT FOUND: Chromatic Boots (ilevel 77 entry 19387)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19387);
-- NOT FOUND: Angelista's Grasp (ilevel 77 entry 19388)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19388);
-- NOT FOUND: Taut Dragonhide Shoulderpads (ilevel 77 entry 19389)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19389);
-- NOT FOUND: Taut Dragonhide Gloves (ilevel 77 entry 19390)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19390);
-- NOT FOUND: Shimmering Geta (ilevel 77 entry 19391)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19391);
-- NOT FOUND: Girdle of the Fallen Crusader (ilevel 77 entry 19392)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19392);
-- NOT FOUND: Primalist's Linked Waistguard (ilevel 77 entry 19393)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19393);
-- NOT FOUND: Drake Talon Pauldrons (ilevel 75 entry 19394)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19394);
-- NOT FOUND: Rejuvenating Gem (ilevel 75 entry 19395)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19395);
-- NOT FOUND: Taut Dragonhide Belt (ilevel 75 entry 19396)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19396);
-- NOT FOUND: Ring of Blackrock (ilevel 75 entry 19397)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19397);
-- NOT FOUND: Cloak of Firemaw (ilevel 75 entry 19398)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19398);
-- NOT FOUND: Black Ash Robe (ilevel 75 entry 19399)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19399);
-- NOT FOUND: Firemaw's Clutch (ilevel 75 entry 19400)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19400);
-- NOT FOUND: Primalist's Linked Legguards (ilevel 75 entry 19401)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19401);
-- NOT FOUND: Legguards of the Fallen Crusader (ilevel 75 entry 19402)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19402);
-- NOT FOUND: Band of Forced Concentration (ilevel 75 entry 19403)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19403);
-- NOT FOUND: Malfurion's Blessed Bulwark (ilevel 75 entry 19405)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19405);
-- NOT FOUND: Drake Fang Talisman (ilevel 75 entry 19406)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19406);
-- NOT FOUND: Ebony Flame Gloves (ilevel 75 entry 19407)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19407);
-- NOT FOUND: Orb of the Darkmoon (ilevel 65 entry 19426)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19426);
-- NOT FOUND: Shroud of Pure Thought (ilevel 75 entry 19430)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19430);
-- NOT FOUND: Styleen's Impeding Scarab (ilevel 75 entry 19431)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19431);
-- NOT FOUND: Circle of Applied Force (ilevel 75 entry 19432)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19432);
-- NOT FOUND: Emberweave Leggings (ilevel 75 entry 19433)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19433);
-- NOT FOUND: Band of Dark Dominion (ilevel 70 entry 19434)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19434);
-- NOT FOUND: Essence Gatherer (ilevel 70 entry 19435)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19435);
-- NOT FOUND: Cloak of Draconic Might (ilevel 70 entry 19436)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19436);
-- NOT FOUND: Boots of Pure Thought (ilevel 70 entry 19437)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19437);
-- NOT FOUND: Ringo's Blizzard Boots (ilevel 71 entry 19438)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19438);
-- NOT FOUND: Interlaced Shadow Jerkin (ilevel 71 entry 19439)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19439);
-- NOT FOUND: Amulet of the Darkmoon (ilevel 65 entry 19491)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19491);
-- NOT FOUND: Warsong Battle Tabard (ilevel 20 entry 19505)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19505);
-- NOT FOUND: Silverwing Battle Tabard (ilevel 20 entry 19506)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19506);
-- NOT FOUND: Inquisitor's Shawl (ilevel 41 entry 19507)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19507);
-- NOT FOUND: Branded Leather Bracers (ilevel 41 entry 19508)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19508);
-- NOT FOUND: Dusty Mail Boots (ilevel 41 entry 19509)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19509);
-- NOT FOUND: Legionnaire's Band (ilevel 63 entry 19510)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19510);
-- NOT FOUND: Legionnaire's Band (ilevel 53 entry 19511)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19511);
-- NOT FOUND: Legionnaire's Band (ilevel 43 entry 19512)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19512);
-- NOT FOUND: Legionnaire's Band (ilevel 33 entry 19513)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19513);
-- NOT FOUND: Protector's Band (ilevel 63 entry 19514)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19514);
-- NOT FOUND: Protector's Band (ilevel 43 entry 19515)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19515);
-- NOT FOUND: Protector's Band (ilevel 53 entry 19516)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19516);
-- NOT FOUND: Protector's Band (ilevel 33 entry 19517)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19517);
-- NOT FOUND: Advisor's Ring (ilevel 63 entry 19518)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19518);
-- NOT FOUND: Advisor's Ring (ilevel 53 entry 19519)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19519);
-- NOT FOUND: Advisor's Ring (ilevel 43 entry 19520)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19520);
-- NOT FOUND: Advisor's Ring (ilevel 33 entry 19521)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19521);
-- NOT FOUND: Lorekeeper's Ring (ilevel 63 entry 19522)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19522);
-- NOT FOUND: Lorekeeper's Ring (ilevel 53 entry 19523)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19523);
-- NOT FOUND: Lorekeeper's Ring (ilevel 43 entry 19524)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19524);
-- NOT FOUND: Lorekeeper's Ring (ilevel 33 entry 19525)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19525);
-- NOT FOUND: Battle Healer's Cloak (ilevel 63 entry 19526)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19526);
-- NOT FOUND: Battle Healer's Cloak (ilevel 53 entry 19527)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19527);
-- NOT FOUND: Battle Healer's Cloak (ilevel 43 entry 19528)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19528);
-- NOT FOUND: Battle Healer's Cloak (ilevel 33 entry 19529)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19529);
-- NOT FOUND: Caretaker's Cape (ilevel 63 entry 19530)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19530);
-- NOT FOUND: Caretaker's Cape (ilevel 53 entry 19531)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19531);
-- NOT FOUND: Caretaker's Cape (ilevel 43 entry 19532)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19532);
-- NOT FOUND: Caretaker's Cape (ilevel 33 entry 19533)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19533);
-- NOT FOUND: Scout's Medallion (ilevel 63 entry 19534)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19534);
-- NOT FOUND: Scout's Medallion (ilevel 53 entry 19535)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19535);
-- NOT FOUND: Scout's Medallion (ilevel 43 entry 19536)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19536);
-- NOT FOUND: Scout's Medallion (ilevel 33 entry 19537)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19537);
-- NOT FOUND: Sentinel's Medallion (ilevel 63 entry 19538)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19538);
-- NOT FOUND: Sentinel's Medallion (ilevel 53 entry 19539)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19539);
-- NOT FOUND: Sentinel's Medallion (ilevel 43 entry 19540)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19540);
-- NOT FOUND: Sentinel's Medallion (ilevel 33 entry 19541)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19541);
-- NOT FOUND: Scout's Blade (ilevel 63 entry 19542)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19542);
-- NOT FOUND: Scout's Blade (ilevel 53 entry 19543)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19543);
-- NOT FOUND: Scout's Blade (ilevel 43 entry 19544)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19544);
-- NOT FOUND: Scout's Blade (ilevel 33 entry 19545)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19545);
-- NOT FOUND: Sentinel's Blade (ilevel 63 entry 19546)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19546);
-- NOT FOUND: Sentinel's Blade (ilevel 53 entry 19547)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19547);
-- NOT FOUND: Sentinel's Blade (ilevel 43 entry 19548)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19548);
-- NOT FOUND: Sentinel's Blade (ilevel 33 entry 19549)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19549);
-- NOT FOUND: Legionnaire's Sword (ilevel 63 entry 19550)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19550);
-- NOT FOUND: Legionnaire's Sword (ilevel 53 entry 19551)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19551);
-- NOT FOUND: Legionnaire's Sword (ilevel 43 entry 19552)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19552);
-- NOT FOUND: Legionnaire's Sword (ilevel 33 entry 19553)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19553);
-- NOT FOUND: Protector's Sword (ilevel 63 entry 19554)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19554);
-- NOT FOUND: Protector's Sword (ilevel 53 entry 19555)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19555);
-- NOT FOUND: Protector's Sword (ilevel 43 entry 19556)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19556);
-- NOT FOUND: Protector's Sword (ilevel 33 entry 19557)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19557);
-- NOT FOUND: Outrider's Bow (ilevel 63 entry 19558)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19558);
-- NOT FOUND: Outrider's Bow (ilevel 53 entry 19559)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19559);
-- NOT FOUND: Outrider's Bow (ilevel 43 entry 19560)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19560);
-- NOT FOUND: Outrider's Bow (ilevel 33 entry 19561)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19561);
-- NOT FOUND: Outrunner's Bow (ilevel 63 entry 19562)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19562);
-- NOT FOUND: Outrunner's Bow (ilevel 53 entry 19563)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19563);
-- NOT FOUND: Outrunner's Bow (ilevel 43 entry 19564)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19564);
-- NOT FOUND: Outrunner's Bow (ilevel 33 entry 19565)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19565);
-- NOT FOUND: Advisor's Gnarled Staff (ilevel 63 entry 19566)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19566);
-- NOT FOUND: Advisor's Gnarled Staff (ilevel 53 entry 19567)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19567);
-- NOT FOUND: Advisor's Gnarled Staff (ilevel 43 entry 19568)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19568);
-- NOT FOUND: Advisor's Gnarled Staff (ilevel 33 entry 19569)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19569);
-- NOT FOUND: Lorekeeper's Staff (ilevel 63 entry 19570)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19570);
-- NOT FOUND: Lorekeeper's Staff (ilevel 53 entry 19571)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19571);
-- NOT FOUND: Lorekeeper's Staff (ilevel 43 entry 19572)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19572);
-- NOT FOUND: Lorekeeper's Staff (ilevel 33 entry 19573)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19573);
-- NOT FOUND: Strength of Mugamba (ilevel 60 entry 19574)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19574);
-- NOT FOUND: Strength of Mugamba (ilevel 60 entry 19575)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19575);
-- NOT FOUND: Strength of Mugamba (ilevel 68 entry 19576)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19576);
-- NOT FOUND: Rage of Mugamba (ilevel 65 entry 19577)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19577);
-- NOT FOUND: Berserker Bracers (ilevel 65 entry 19578)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19578);
-- NOT FOUND: Heathen's Brand (ilevel 60 entry 19579)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19579);
-- NOT FOUND: Berserker Bracers (ilevel 55 entry 19580)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19580);
-- NOT FOUND: Berserker Bracers (ilevel 45 entry 19581)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19581);
-- NOT FOUND: Windtalker's Wristguards (ilevel 65 entry 19582)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19582);
-- NOT FOUND: Windtalker's Wristguards (ilevel 55 entry 19583)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19583);
-- NOT FOUND: Windtalker's Wristguards (ilevel 45 entry 19584)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19584);
-- NOT FOUND: Heathen's Brand (ilevel 60 entry 19585)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19585);
-- NOT FOUND: Heathen's Brand (ilevel 68 entry 19586)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19586);
-- NOT FOUND: Forest Stalker's Bracers (ilevel 65 entry 19587)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19587);
-- NOT FOUND: Hero's Brand (ilevel 65 entry 19588)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19588);
-- NOT FOUND: Forest Stalker's Bracers (ilevel 55 entry 19589)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19589);
-- NOT FOUND: Forest Stalker's Bracers (ilevel 45 entry 19590)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19590);
-- NOT FOUND: The Eye of Zuldazar (ilevel 60 entry 19591)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19591);
-- NOT FOUND: The Eye of Zuldazar (ilevel 60 entry 19592)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19592);
-- NOT FOUND: The Eye of Zuldazar (ilevel 68 entry 19593)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19593);
-- NOT FOUND: The All-Seeing Eye of Zuldazar (ilevel 65 entry 19594)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19594);
-- NOT FOUND: Dryad's Wrist Bindings (ilevel 65 entry 19595)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19595);
-- NOT FOUND: Dryad's Wrist Bindings (ilevel 55 entry 19596)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19596);
-- NOT FOUND: Dryad's Wrist Bindings (ilevel 45 entry 19597)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19597);
-- NOT FOUND: Pebble of Kajaro (ilevel 60 entry 19598)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19598);
-- NOT FOUND: Pebble of Kajaro (ilevel 60 entry 19599)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19599);
-- NOT FOUND: Pebble of Kajaro (ilevel 68 entry 19600)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19600);
-- NOT FOUND: Jewel of Kajaro (ilevel 65 entry 19601)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19601);
-- NOT FOUND: Kezan's Taint (ilevel 60 entry 19602)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19602);
-- NOT FOUND: Kezan's Taint (ilevel 60 entry 19603)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19603);
-- NOT FOUND: Kezan's Taint (ilevel 68 entry 19604)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19604);
-- NOT FOUND: Kezan's Unstoppable Taint (ilevel 65 entry 19605)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19605);
-- NOT FOUND: Vision of Voodress (ilevel 60 entry 19606)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19606);
-- NOT FOUND: Vision of Voodress (ilevel 60 entry 19607)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19607);
-- NOT FOUND: Vision of Voodress (ilevel 68 entry 19608)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19608);
-- NOT FOUND: Unmarred Vision of Voodress (ilevel 65 entry 19609)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19609);
-- NOT FOUND: Enchanted South Seas Kelp (ilevel 60 entry 19610)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19610);
-- NOT FOUND: Enchanted South Seas Kelp (ilevel 60 entry 19611)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19611);
-- NOT FOUND: Enchanted South Seas Kelp (ilevel 68 entry 19612)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19612);
-- NOT FOUND: Pristine Enchanted South Seas Kelp (ilevel 65 entry 19613)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19613);
-- NOT FOUND: Zandalarian Shadow Talisman (ilevel 60 entry 19614)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19614);
-- NOT FOUND: Zandalarian Shadow Talisman (ilevel 60 entry 19615)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19615);
-- NOT FOUND: Zandalarian Shadow Talisman (ilevel 68 entry 19616)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19616);
-- NOT FOUND: Zandalarian Shadow Mastery Talisman (ilevel 65 entry 19617)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19617);
-- NOT FOUND: Maelstrom's Tendril (ilevel 60 entry 19618)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19618);
-- NOT FOUND: Maelstrom's Tendril (ilevel 60 entry 19619)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19619);
-- NOT FOUND: Maelstrom's Tendril (ilevel 68 entry 19620)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19620);
-- NOT FOUND: Maelstrom's Wrath (ilevel 65 entry 19621)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19621);
-- NOT FOUND: Bloodvine Vest (ilevel 65 entry 19682)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19682);
-- NOT FOUND: Bloodvine Leggings (ilevel 65 entry 19683)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19683);
-- NOT FOUND: Bloodvine Boots (ilevel 65 entry 19684)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19684);
-- NOT FOUND: Primal Batskin Jerkin (ilevel 65 entry 19685)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19685);
-- NOT FOUND: Primal Batskin Gloves (ilevel 65 entry 19686)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19686);
-- NOT FOUND: Primal Batskin Bracers (ilevel 65 entry 19687)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19687);
-- NOT FOUND: Blood Tiger Breastplate (ilevel 65 entry 19688)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19688);
-- NOT FOUND: Blood Tiger Shoulders (ilevel 65 entry 19689)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19689);
-- NOT FOUND: Bloodsoul Breastplate (ilevel 65 entry 19690)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19690);
-- NOT FOUND: Bloodsoul Shoulders (ilevel 65 entry 19691)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19691);
-- NOT FOUND: Bloodsoul Gauntlets (ilevel 65 entry 19692)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19692);
-- NOT FOUND: Darksoul Breastplate (ilevel 65 entry 19693)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19693);
-- NOT FOUND: Darksoul Leggings (ilevel 65 entry 19694)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19694);
-- NOT FOUND: Darksoul Shoulders (ilevel 65 entry 19695)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19695);
-- NOT FOUND: Bounty of the Harvest (ilevel 1 entry 19697)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19697);
-- NOT FOUND: Overlord's Embrace (ilevel 71 entry 19760)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19760);
-- NOT FOUND: Rockhide Strongfish (ilevel 45 entry 19808)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19808);
-- NOT FOUND: Rune of the Dawn (ilevel 61 entry 19812)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19812);
-- NOT FOUND: Zandalar Vindicator's Breastplate (ilevel 65 entry 19822)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19822);
-- NOT FOUND: Zandalar Vindicator's Belt (ilevel 61 entry 19823)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19823);
-- NOT FOUND: Zandalar Vindicator's Armguards (ilevel 61 entry 19824)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19824);
-- NOT FOUND: Zandalar Freethinker's Breastplate (ilevel 65 entry 19825)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19825);
-- NOT FOUND: Zandalar Freethinker's Belt (ilevel 61 entry 19826)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19826);
-- NOT FOUND: Zandalar Freethinker's Armguards (ilevel 61 entry 19827)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19827);
-- NOT FOUND: Zandalar Augur's Hauberk (ilevel 65 entry 19828)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19828);
-- NOT FOUND: Zandalar Augur's Belt (ilevel 61 entry 19829)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19829);
-- NOT FOUND: Zandalar Augur's Bracers (ilevel 61 entry 19830)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19830);
-- NOT FOUND: Zandalar Predator's Mantle (ilevel 68 entry 19831)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19831);
-- NOT FOUND: Zandalar Predator's Belt (ilevel 61 entry 19832)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19832);
-- NOT FOUND: Zandalar Predator's Bracers (ilevel 61 entry 19833)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19833);
-- NOT FOUND: Zandalar Madcap's Tunic (ilevel 65 entry 19834)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19834);
-- NOT FOUND: Zandalar Madcap's Mantle (ilevel 61 entry 19835)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19835);
-- NOT FOUND: Zandalar Madcap's Bracers (ilevel 61 entry 19836)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19836);
-- NOT FOUND: Zandalar Haruspex's Tunic (ilevel 65 entry 19838)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19838);
-- NOT FOUND: Zandalar Haruspex's Belt (ilevel 61 entry 19839)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19839);
-- NOT FOUND: Zandalar Haruspex's Bracers (ilevel 61 entry 19840)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19840);
-- NOT FOUND: Zandalar Confessor's Mantle (ilevel 68 entry 19841)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19841);
-- NOT FOUND: Zandalar Confessor's Bindings (ilevel 61 entry 19842)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19842);
-- NOT FOUND: Zandalar Confessor's Wraps (ilevel 61 entry 19843)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19843);
-- NOT FOUND: Zandalar Illusionist's Mantle (ilevel 61 entry 19845)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19845);
-- NOT FOUND: Zandalar Illusionist's Wraps (ilevel 61 entry 19846)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19846);
-- NOT FOUND: Zandalar Demoniac's Wraps (ilevel 61 entry 19848)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19848);
-- NOT FOUND: Zandalar Demoniac's Mantle (ilevel 61 entry 19849)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19849);
-- NOT FOUND: Ancient Hakkari Manslayer (ilevel 68 entry 19852)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19852);
-- NOT FOUND: Gurubashi Dwarf Destroyer (ilevel 68 entry 19853)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19853);
-- NOT FOUND: Zin'rokh, Destroyer of Worlds (ilevel 68 entry 19854)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19854);
-- NOT FOUND: Bloodsoaked Legplates (ilevel 68 entry 19855)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19855);
-- NOT FOUND: The Eye of Hakkar (ilevel 68 entry 19856)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19856);
-- NOT FOUND: Cloak of Consumption (ilevel 68 entry 19857)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19857);
-- NOT FOUND: Fang of the Faceless (ilevel 68 entry 19859)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19859);
-- NOT FOUND: Touch of Chaos (ilevel 68 entry 19861)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19861);
-- NOT FOUND: Aegis of the Blood God (ilevel 68 entry 19862)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19862);
-- NOT FOUND: Primalist's Seal (ilevel 71 entry 19863)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19863);
-- NOT FOUND: Bloodcaller (ilevel 68 entry 19864)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19864);
-- NOT FOUND: Warblade of the Hakkari (ilevel 68 entry 19865)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19865);
-- NOT FOUND: Warblade of the Hakkari (ilevel 66 entry 19866)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19866);
-- NOT FOUND: Bloodlord's Defender (ilevel 66 entry 19867)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19867);
-- NOT FOUND: Blooddrenched Grips (ilevel 71 entry 19869)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19869);
-- NOT FOUND: Hakkari Loa Cloak (ilevel 71 entry 19870)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19870);
-- NOT FOUND: Talisman of Protection (ilevel 68 entry 19871)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19871);
-- NOT FOUND: Overlord's Crimson Band (ilevel 71 entry 19873)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19873);
-- NOT FOUND: Halberd of Smiting (ilevel 66 entry 19874)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19874);
-- NOT FOUND: Bloodstained Coif (ilevel 71 entry 19875)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19875);
-- NOT FOUND: Soul Corrupter's Necklace (ilevel 68 entry 19876)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19876);
-- NOT FOUND: Animist's Leggings (ilevel 71 entry 19877)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19877);
-- NOT FOUND: Bloodsoaked Pauldrons (ilevel 71 entry 19878)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19878);
-- NOT FOUND: Alex's Test Beatdown Staff (ilevel 70 entry 19879)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19879);
-- NOT FOUND: Jin'do's Judgement (ilevel 66 entry 19884)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19884);
-- NOT FOUND: Jin'do's Evil Eye (ilevel 66 entry 19885)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19885);
-- NOT FOUND: The Hexxer's Cover (ilevel 71 entry 19886)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19886);
-- NOT FOUND: Bloodstained Legplates (ilevel 71 entry 19887)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19887);
-- NOT FOUND: Overlord's Embrace (ilevel 71 entry 19888)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19888);
-- NOT FOUND: Blooddrenched Leggings (ilevel 71 entry 19889)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19889);
-- NOT FOUND: Jin'do's Hexxer (ilevel 66 entry 19890)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19890);
-- NOT FOUND: Jin'do's Bag of Whammies (ilevel 66 entry 19891)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19891);
-- NOT FOUND: Animist's Boots (ilevel 71 entry 19892)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19892);
-- NOT FOUND: Zanzil's Seal (ilevel 71 entry 19893)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19893);
-- NOT FOUND: Bloodsoaked Gauntlets (ilevel 71 entry 19894)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19894);
-- NOT FOUND: Bloodtinged Kilt (ilevel 71 entry 19895)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19895);
-- NOT FOUND: Thekal's Grasp (ilevel 65 entry 19896)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19896);
-- NOT FOUND: Betrayer's Boots (ilevel 65 entry 19897)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19897);
-- NOT FOUND: Seal of Jin (ilevel 68 entry 19898)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19898);
-- NOT FOUND: Ritualistic Legguards (ilevel 68 entry 19899)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19899);
-- NOT FOUND: Zulian Stone Axe (ilevel 68 entry 19900)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19900);
-- NOT FOUND: Zulian Slicer (ilevel 68 entry 19901)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19901);
-- NOT FOUND: Fang of Venoxis (ilevel 65 entry 19903)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19903);
-- NOT FOUND: Runed Bloodstained Hauberk (ilevel 65 entry 19904)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19904);
-- NOT FOUND: Zanzil's Band (ilevel 68 entry 19905)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19905);
-- NOT FOUND: Blooddrenched Footpads (ilevel 68 entry 19906)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19906);
-- NOT FOUND: Zulian Tigerhide Cloak (ilevel 68 entry 19907)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19907);
-- NOT FOUND: Sceptre of Smiting (ilevel 65 entry 19908)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19908);
-- NOT FOUND: Will of Arlokk (ilevel 65 entry 19909)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19909);
-- NOT FOUND: Arlokk's Grasp (ilevel 65 entry 19910)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19910);
-- NOT FOUND: Overlord's Onyx Band (ilevel 68 entry 19912)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19912);
-- NOT FOUND: Bloodsoaked Greaves (ilevel 68 entry 19913)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19913);
-- NOT FOUND: Zulian Defender (ilevel 68 entry 19915)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19915);
-- NOT FOUND: Jeklik's Crusher (ilevel 65 entry 19918)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19918);
-- NOT FOUND: Bloodstained Greaves (ilevel 68 entry 19919)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19919);
-- NOT FOUND: Primalist's Band (ilevel 68 entry 19920)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19920);
-- NOT FOUND: Arlokk's Hoodoo Stick (ilevel 68 entry 19922)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19922);
-- NOT FOUND: Jeklik's Opaline Talisman (ilevel 68 entry 19923)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19923);
-- NOT FOUND: Band of Jin (ilevel 68 entry 19925)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19925);
-- NOT FOUND: Mar'li's Touch (ilevel 65 entry 19927)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19927);
-- NOT FOUND: Animist's Spaulders (ilevel 68 entry 19928)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19928);
-- NOT FOUND: Bloodtinged Gloves (ilevel 71 entry 19929)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19929);
-- NOT FOUND: Mar'li's Eye (ilevel 68 entry 19930)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19930);
-- NOT FOUND: Nat Pagle's Fish Terminator (ilevel 65 entry 19944)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19944);
-- NOT FOUND: Foror's Eyepatch (ilevel 65 entry 19945)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19945);
-- NOT FOUND: Tigule's Harpoon (ilevel 68 entry 19946)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19946);
-- NOT FOUND: Nat Pagle's Broken Reel (ilevel 68 entry 19947)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19947);
-- NOT FOUND: Zandalarian Hero Badge (ilevel 68 entry 19948)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19948);
-- NOT FOUND: Zandalarian Hero Medallion (ilevel 68 entry 19949)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19949);
-- NOT FOUND: Zandalarian Hero Charm (ilevel 68 entry 19950)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19950);
-- NOT FOUND: Gri'lek's Charm of Might (ilevel 65 entry 19951)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19951);
-- NOT FOUND: Gri'lek's Charm of Valor (ilevel 65 entry 19952)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19952);
-- NOT FOUND: Renataki's Charm of Beasts (ilevel 65 entry 19953)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19953);
-- NOT FOUND: Renataki's Charm of Trickery (ilevel 65 entry 19954)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19954);
-- NOT FOUND: Wushoolay's Charm of Nature (ilevel 65 entry 19955)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19955);
-- NOT FOUND: Wushoolay's Charm of Spirits (ilevel 65 entry 19956)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19956);
-- NOT FOUND: Hazza'rah's Charm of Destruction (ilevel 65 entry 19957)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19957);
-- NOT FOUND: Hazza'rah's Charm of Healing (ilevel 65 entry 19958)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19958);
-- NOT FOUND: Hazza'rah's Charm of Magic (ilevel 65 entry 19959)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19959);
-- NOT FOUND: Gri'lek's Grinder (ilevel 68 entry 19961)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19961);
-- NOT FOUND: Gri'lek's Carver (ilevel 68 entry 19962)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19962);
-- NOT FOUND: Pitchfork of Madness (ilevel 68 entry 19963)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19963);
-- NOT FOUND: Renataki's Soul Conduit (ilevel 68 entry 19964)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19964);
-- NOT FOUND: Wushoolay's Poker (ilevel 68 entry 19965)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19965);
-- NOT FOUND: Thoughtblighter (ilevel 68 entry 19967)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19967);
-- NOT FOUND: Fiery Retributer (ilevel 68 entry 19968)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19968);
-- NOT FOUND: Nat Pagle's Extreme Anglin' Boots (ilevel 40 entry 19969)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19969);
-- NOT FOUND: Arcanite Fishing Pole (ilevel 20 entry 19970)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19970);
-- NOT FOUND: Lucky Fishing Hat (ilevel 40 entry 19972)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19972);
-- NOT FOUND: Hook of the Master Angler (ilevel 65 entry 19979)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19979);
-- NOT FOUND: Duskbat Drape (ilevel 52 entry 19982)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19982);
-- NOT FOUND: Ebon Mask (ilevel 52 entry 19984)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19984);
-- NOT FOUND: Blessed Prayer Beads (ilevel 52 entry 19990)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19990);
-- NOT FOUND: Devilsaur Eye (ilevel 52 entry 19991)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19991);
-- NOT FOUND: Devilsaur Tooth (ilevel 52 entry 19992)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19992);
-- NOT FOUND: Hoodoo Hunting Bow (ilevel 68 entry 19993)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19993);
-- NOT FOUND: Bloodvine Lens (ilevel 65 entry 19998)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19998);
-- NOT FOUND: Bloodvine Goggles (ilevel 65 entry 19999)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19999);
-- NOT FOUND: Circle of Hope (ilevel 52 entry 20006)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20006);
-- NOT FOUND: Flowing Ritual Robes (ilevel 65 entry 20032)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20032);
-- NOT FOUND: Zandalar Demoniac's Robe (ilevel 65 entry 20033)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20033);
-- NOT FOUND: Zandalar Illusionist's Robe (ilevel 65 entry 20034)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20034);
-- NOT FOUND: Glacial Spike (ilevel 52 entry 20035)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20035);
-- NOT FOUND: Fire Ruby (ilevel 52 entry 20036)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20036);
-- NOT FOUND: Arcane Crystal Pendant (ilevel 52 entry 20037)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20037);
-- NOT FOUND: Mandokir's Sting (ilevel 66 entry 20038)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20038);
-- NOT FOUND: Highlander's Plate Girdle (ilevel 63 entry 20041)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20041);
-- NOT FOUND: Highlander's Lamellar Girdle (ilevel 63 entry 20042)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20042);
-- NOT FOUND: Highlander's Chain Girdle (ilevel 63 entry 20043)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20043);
-- NOT FOUND: Highlander's Mail Girdle (ilevel 63 entry 20044)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20044);
-- NOT FOUND: Highlander's Leather Girdle (ilevel 63 entry 20045)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20045);
-- NOT FOUND: Highlander's Lizardhide Girdle (ilevel 63 entry 20046)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20046);
-- NOT FOUND: Highlander's Cloth Girdle (ilevel 63 entry 20047)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20047);
-- NOT FOUND: Highlander's Plate Greaves (ilevel 63 entry 20048)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20048);
-- NOT FOUND: Highlander's Lamellar Greaves (ilevel 63 entry 20049)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20049);
-- AB Rep rewards?? Not available yet. Added in 1.7
-- STATS CHANGED: Highlander's Chain Greaves (ilevel 63 entry 20050). 1/2 versions
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20050);
-- STATS CHANGED: Highlander's Mail Greaves (ilevel 63 entry 20051). 1/1 versions
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20051);
-- QUALITY CHANGED: Highlander's Leather Boots (ilevel 63 entry 20052)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20052);
-- STATS CHANGED: Highlander's Lizardhide Boots (ilevel 63 entry 20053). 1/2 versions
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20053);
-- QUALITY CHANGED: Highlander's Cloth Boots (ilevel 63 entry 20054)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20054);
-- STATS CHANGED: Highlander's Chain Pauldrons (ilevel 65 entry 20055). 1/2 versions
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20055);
-- NOT FOUND: Highlander's Mail Pauldrons (ilevel 65 entry 20056)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20056);
-- STATS CHANGED: Highlander's Plate Spaulders (ilevel 65 entry 20057). 1/3 versions
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20057);
-- STATS CHANGED: Highlander's Lamellar Spaulders (ilevel 65 entry 20058). 1/3 versions
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20058);
-- NOT FOUND: Highlander's Leather Shoulders (ilevel 65 entry 20059)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20059);
-- NOT FOUND: Highlander's Lizardhide Shoulders (ilevel 65 entry 20060)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20060);
-- NOT FOUND: Highlander's Epaulets (ilevel 65 entry 20061)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20061);
-- NOT FOUND: Deathguard's Cloak (ilevel 65 entry 20068)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20068);
-- NOT FOUND: Ironbark Staff (ilevel 65 entry 20069)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20069);
-- NOT FOUND: Sageclaw (ilevel 65 entry 20070)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20070);
-- NOT FOUND: Talisman of Arathor (ilevel 63 entry 20071)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20071);
-- NOT FOUND: Defiler's Talisman (ilevel 63 entry 20072)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20072);
-- NOT FOUND: Cloak of the Honor Guard (ilevel 65 entry 20073)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20073);
-- NOT FOUND: Woestave (ilevel 52 entry 20082)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20082);
-- NOT FOUND: Hunting Spear (ilevel 52 entry 20083)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20083);
-- NOT FOUND: Dusksteel Throwing Knife (ilevel 52 entry 20086)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20086);
-- NOT FOUND: Highlander's Chain Girdle (ilevel 53 entry 20088)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20088);
-- NOT FOUND: Highlander's Chain Girdle (ilevel 43 entry 20089)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20089);
-- NOT FOUND: Highlander's Chain Girdle (ilevel 33 entry 20090)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20090);
-- NOT FOUND: Highlander's Chain Greaves (ilevel 53 entry 20091)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20091);
-- NOT FOUND: Highlander's Chain Greaves (ilevel 43 entry 20092)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20092);
-- NOT FOUND: Highlander's Chain Greaves (ilevel 33 entry 20093)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20093);
-- NOT FOUND: Highlander's Cloth Boots (ilevel 53 entry 20094)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20094);
-- NOT FOUND: Highlander's Cloth Boots (ilevel 43 entry 20095)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20095);
-- NOT FOUND: Highlander's Cloth Boots (ilevel 33 entry 20096)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20096);
-- NOT FOUND: Highlander's Cloth Girdle (ilevel 53 entry 20097)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20097);
-- NOT FOUND: Highlander's Cloth Girdle (ilevel 43 entry 20098)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20098);
-- NOT FOUND: Highlander's Cloth Girdle (ilevel 33 entry 20099)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20099);
-- NOT FOUND: Highlander's Lizardhide Boots (ilevel 53 entry 20100)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20100);
-- NOT FOUND: Highlander's Lizardhide Boots (ilevel 43 entry 20101)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20101);
-- NOT FOUND: Highlander's Lizardhide Boots (ilevel 33 entry 20102)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20102);
-- NOT FOUND: Highlander's Lizardhide Girdle (ilevel 53 entry 20103)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20103);
-- NOT FOUND: Highlander's Lizardhide Girdle (ilevel 43 entry 20104)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20104);
-- NOT FOUND: Highlander's Lizardhide Girdle (ilevel 33 entry 20105)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20105);
-- NOT FOUND: Highlander's Lamellar Girdle (ilevel 53 entry 20106)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20106);
-- NOT FOUND: Highlander's Lamellar Girdle (ilevel 43 entry 20107)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20107);
-- NOT FOUND: Highlander's Lamellar Girdle (ilevel 33 entry 20108)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20108);
-- NOT FOUND: Highlander's Lamellar Greaves (ilevel 53 entry 20109)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20109);
-- NOT FOUND: Highlander's Lamellar Greaves (ilevel 43 entry 20110)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20110);
-- NOT FOUND: Highlander's Lamellar Greaves (ilevel 33 entry 20111)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20111);
-- NOT FOUND: Highlander's Leather Boots (ilevel 53 entry 20112)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20112);
-- NOT FOUND: Highlander's Leather Boots (ilevel 43 entry 20113)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20113);
-- NOT FOUND: Highlander's Leather Boots (ilevel 33 entry 20114)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20114);
-- NOT FOUND: Highlander's Leather Girdle (ilevel 53 entry 20115)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20115);
-- NOT FOUND: Highlander's Leather Girdle (ilevel 43 entry 20116)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20116);
-- NOT FOUND: Highlander's Leather Girdle (ilevel 33 entry 20117)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20117);
-- NOT FOUND: Highlander's Plate Girdle (ilevel 53 entry 20124)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20124);
-- NOT FOUND: Highlander's Plate Girdle (ilevel 43 entry 20125)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20125);
-- NOT FOUND: Highlander's Plate Girdle (ilevel 33 entry 20126)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20126);
-- NOT FOUND: Highlander's Plate Greaves (ilevel 53 entry 20127)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20127);
-- NOT FOUND: Highlander's Plate Greaves (ilevel 43 entry 20128)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20128);
-- NOT FOUND: Highlander's Plate Greaves (ilevel 33 entry 20129)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20129);
-- NOT FOUND: Diamond Flask (ilevel 52 entry 20130)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20130);
-- NOT FOUND: Battle Tabard of the Defilers (ilevel 20 entry 20131)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20131);
-- NOT FOUND: Arathor Battle Tabard (ilevel 20 entry 20132)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20132);
-- NOT FOUND: Skyfury Helm (ilevel 62 entry 20134)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20134);
-- NOT FOUND: Defiler's Chain Girdle (ilevel 63 entry 20150)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20150);
-- NOT FOUND: Defiler's Chain Girdle (ilevel 53 entry 20151)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20151);
-- NOT FOUND: Defiler's Chain Girdle (ilevel 33 entry 20152)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20152);
-- NOT FOUND: Defiler's Chain Girdle (ilevel 43 entry 20153)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20153);
-- NOT FOUND: Defiler's Chain Greaves (ilevel 63 entry 20154)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20154);
-- NOT FOUND: Defiler's Chain Greaves (ilevel 53 entry 20155)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20155);
-- NOT FOUND: Defiler's Chain Greaves (ilevel 43 entry 20156)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20156);
-- NOT FOUND: Defiler's Chain Greaves (ilevel 33 entry 20157)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20157);
-- NOT FOUND: Defiler's Chain Pauldrons (ilevel 65 entry 20158)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20158);
-- NOT FOUND: Defiler's Cloth Boots (ilevel 63 entry 20159)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20159);
-- NOT FOUND: Defiler's Cloth Boots (ilevel 53 entry 20160)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20160);
-- NOT FOUND: Defiler's Cloth Boots (ilevel 43 entry 20161)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20161);
-- NOT FOUND: Defiler's Cloth Boots (ilevel 33 entry 20162)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20162);
-- NOT FOUND: Defiler's Cloth Girdle (ilevel 63 entry 20163)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20163);
-- NOT FOUND: Defiler's Cloth Girdle (ilevel 33 entry 20164)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20164);
-- NOT FOUND: Defiler's Cloth Girdle (ilevel 53 entry 20165)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20165);
-- NOT FOUND: Defiler's Cloth Girdle (ilevel 43 entry 20166)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20166);
-- NOT FOUND: Defiler's Lizardhide Boots (ilevel 63 entry 20167)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20167);
-- NOT FOUND: Defiler's Lizardhide Boots (ilevel 43 entry 20168)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20168);
-- NOT FOUND: Defiler's Lizardhide Boots (ilevel 33 entry 20169)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20169);
-- NOT FOUND: Defiler's Lizardhide Boots (ilevel 53 entry 20170)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20170);
-- NOT FOUND: Defiler's Lizardhide Girdle (ilevel 63 entry 20171)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20171);
-- NOT FOUND: Defiler's Lizardhide Girdle (ilevel 33 entry 20172)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20172);
-- NOT FOUND: Defiler's Lizardhide Girdle (ilevel 43 entry 20173)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20173);
-- NOT FOUND: Defiler's Lizardhide Girdle (ilevel 53 entry 20174)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20174);
-- NOT FOUND: Defiler's Lizardhide Shoulders (ilevel 65 entry 20175)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20175);
-- NOT FOUND: Defiler's Epaulets (ilevel 65 entry 20176)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20176);
-- NOT FOUND: Defiler's Lamellar Girdle (ilevel 63 entry 20177)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20177);
-- NOT FOUND: Defiler's Lamellar Greaves (ilevel 63 entry 20181)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20181);
-- NOT FOUND: Defiler's Lamellar Spaulders (ilevel 65 entry 20184)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20184);
-- NOT FOUND: Defiler's Leather Boots (ilevel 63 entry 20186)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20186);
-- NOT FOUND: Defiler's Leather Boots (ilevel 43 entry 20187)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20187);
-- NOT FOUND: Defiler's Leather Boots (ilevel 33 entry 20188)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20188);
-- NOT FOUND: Defiler's Leather Boots (ilevel 53 entry 20189)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20189);
-- NOT FOUND: Defiler's Leather Girdle (ilevel 63 entry 20190)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20190);
-- NOT FOUND: Defiler's Leather Girdle (ilevel 33 entry 20191)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20191);
-- NOT FOUND: Defiler's Leather Girdle (ilevel 43 entry 20192)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20192);
-- NOT FOUND: Defiler's Leather Girdle (ilevel 53 entry 20193)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20193);
-- NOT FOUND: Defiler's Leather Shoulders (ilevel 65 entry 20194)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20194);
-- NOT FOUND: Defiler's Mail Girdle (ilevel 63 entry 20195)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20195);
-- NOT FOUND: Defiler's Mail Girdle (ilevel 53 entry 20196)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20196);
-- NOT FOUND: Defiler's Mail Girdle (ilevel 33 entry 20197)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20197);
-- NOT FOUND: Defiler's Mail Girdle (ilevel 43 entry 20198)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20198);
-- NOT FOUND: Defiler's Mail Greaves (ilevel 63 entry 20199)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20199);
-- NOT FOUND: Defiler's Mail Greaves (ilevel 43 entry 20200)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20200);
-- NOT FOUND: Defiler's Mail Greaves (ilevel 33 entry 20201)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20201);
-- NOT FOUND: Defiler's Mail Greaves (ilevel 53 entry 20202)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20202);
-- NOT FOUND: Defiler's Mail Pauldrons (ilevel 65 entry 20203)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20203);
-- NOT FOUND: Defiler's Plate Girdle (ilevel 63 entry 20204)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20204);
-- NOT FOUND: Defiler's Plate Girdle (ilevel 53 entry 20205)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20205);
-- NOT FOUND: Defiler's Plate Girdle (ilevel 43 entry 20206)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20206);
-- NOT FOUND: Defiler's Plate Girdle (ilevel 33 entry 20207)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20207);
-- NOT FOUND: Defiler's Plate Greaves (ilevel 63 entry 20208)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20208);
-- NOT FOUND: Defiler's Plate Greaves (ilevel 43 entry 20209)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20209);
-- NOT FOUND: Defiler's Plate Greaves (ilevel 33 entry 20210)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20210);
-- NOT FOUND: Defiler's Plate Greaves (ilevel 53 entry 20211)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20211);
-- NOT FOUND: Defiler's Plate Spaulders (ilevel 65 entry 20212)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20212);
-- NOT FOUND: Belt of Shrunken Heads (ilevel 70 entry 20213)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20213);
-- NOT FOUND: Mindfang (ilevel 65 entry 20214)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20214);
-- NOT FOUND: Belt of Shriveled Heads (ilevel 70 entry 20215)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20215);
-- NOT FOUND: Belt of Preserved Heads (ilevel 70 entry 20216)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20216);
-- NOT FOUND: Belt of Tiny Heads (ilevel 70 entry 20217)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20217);
-- NOT FOUND: Faded Hakkari Cloak (ilevel 59 entry 20218)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20218);
-- NOT FOUND: Tattered Hakkari Cape (ilevel 59 entry 20219)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20219);
-- NOT FOUND: Ironbark Staff (ilevel 65 entry 20220)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20220);
-- NOT FOUND: Whisperwalk Boots (ilevel 52 entry 20255)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20255);
-- NOT FOUND: Seafury Gauntlets (ilevel 68 entry 20257)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20257);
-- NOT FOUND: Zulian Ceremonial Staff (ilevel 65 entry 20258)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20258);
-- NOT FOUND: Shadow Panther Hide Gloves (ilevel 65 entry 20259)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20259);
-- NOT FOUND: Seafury Leggings (ilevel 68 entry 20260)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20260);
-- NOT FOUND: Shadow Panther Hide Belt (ilevel 65 entry 20261)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20261);
-- NOT FOUND: Seafury Boots (ilevel 68 entry 20262)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20262);
-- NOT FOUND: Gurubashi Helm (ilevel 65 entry 20263)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20263);
-- NOT FOUND: Peacekeeper Gauntlets (ilevel 68 entry 20264)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20264);
-- NOT FOUND: Peacekeeper Boots (ilevel 68 entry 20265)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20265);
-- NOT FOUND: Peacekeeper Leggings (ilevel 68 entry 20266)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20266);
-- NOT FOUND: Blue Dragonscale Leggings (ilevel 60 entry 20295)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20295);
-- NOT FOUND: Green Dragonscale Gauntlets (ilevel 56 entry 20296)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20296);
-- NOT FOUND: Azurite Fists (ilevel 52 entry 20369)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20369);
-- NOT FOUND: Dreamscale Breastplate (ilevel 68 entry 20380)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20380);
-- NOT FOUND: Flimsy Male Gnome Mask (ilevel 1 entry 20391)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20391);
-- NOT FOUND: Flimsy Female Gnome Mask (ilevel 1 entry 20392)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20392);
-- NOT FOUND: Twilight Cultist Mantle (ilevel 60 entry 20406)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20406);
-- NOT FOUND: Twilight Cultist Robe (ilevel 60 entry 20407)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20407);
-- NOT FOUND: Twilight Cultist Cowl (ilevel 60 entry 20408)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20408);
-- NOT FOUND: Advisor's Gnarled Staff (ilevel 23 entry 20425)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20425);
-- NOT FOUND: Advisor's Ring (ilevel 23 entry 20426)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20426);
-- NOT FOUND: Battle Healer's Cloak (ilevel 23 entry 20427)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20427);
-- NOT FOUND: Caretaker's Cape (ilevel 23 entry 20428)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20428);
-- NOT FOUND: Legionnaire's Band (ilevel 23 entry 20429)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20429);
-- NOT FOUND: Legionnaire's Sword (ilevel 23 entry 20430)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20430);
-- NOT FOUND: Lorekeeper's Ring (ilevel 23 entry 20431)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20431);
-- NOT FOUND: Lorekeeper's Staff (ilevel 23 entry 20434)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20434);
-- NOT FOUND: Outrider's Bow (ilevel 23 entry 20437)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20437);
-- NOT FOUND: Outrunner's Bow (ilevel 23 entry 20438)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20438);
-- NOT FOUND: Protector's Band (ilevel 23 entry 20439)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20439);
-- NOT FOUND: Protector's Sword (ilevel 23 entry 20440)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20440);
-- NOT FOUND: Scout's Blade (ilevel 23 entry 20441)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20441);
-- NOT FOUND: Scout's Medallion (ilevel 23 entry 20442)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20442);
-- NOT FOUND: Sentinel's Blade (ilevel 23 entry 20443)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20443);
-- NOT FOUND: Sentinel's Medallion (ilevel 23 entry 20444)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20444);
-- NOT FOUND: Sandstalker Bracers (ilevel 62 entry 20476)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20476);
-- NOT FOUND: Sandstalker Gauntlets (ilevel 62 entry 20477)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20477);
-- NOT FOUND: Sandstalker Breastplate (ilevel 62 entry 20478)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20478);
-- NOT FOUND: Spitfire Breastplate (ilevel 62 entry 20479)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20479);
-- NOT FOUND: Spitfire Gauntlets (ilevel 62 entry 20480)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20480);
-- NOT FOUND: Spitfire Bracers (ilevel 62 entry 20481)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20481);
-- NOT FOUND: Lok'delar, Stave of the Ancient Keepers DEP (ilevel 75 entry 20487)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20487);
-- NOT FOUND: Rhok'delar, Longbow of the Ancient Keepers DEP (ilevel 75 entry 20488)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20488);
-- NOT FOUND: Enamored Water Spirit (ilevel 52 entry 20503)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20503);
-- NOT FOUND: Lightforged Blade (ilevel 52 entry 20504)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20504);
-- NOT FOUND: Chivalrous Signet (ilevel 52 entry 20505)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20505);
-- NOT FOUND: Sanctified Orb (ilevel 52 entry 20512)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20512);
-- NOT FOUND: Razorsteel Shoulders (ilevel 52 entry 20517)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20517);
-- NOT FOUND: Fury Visor (ilevel 52 entry 20521)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20521);
-- NOT FOUND: Robes of Servitude (ilevel 52 entry 20530)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20530);
-- NOT FOUND: Abyss Shard (ilevel 52 entry 20534)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20534);
-- NOT FOUND: Soul Harvester (ilevel 52 entry 20536)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20536);
-- NOT FOUND: Runed Stygian Boots (ilevel 63 entry 20537)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20537);
-- NOT FOUND: Runed Stygian Leggings (ilevel 63 entry 20538)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20538);
-- NOT FOUND: Runed Stygian Belt (ilevel 63 entry 20539)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20539);
-- NOT FOUND: Darkrune Gauntlets (ilevel 63 entry 20549)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20549);
-- NOT FOUND: Darkrune Breastplate (ilevel 63 entry 20550)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20550);
-- NOT FOUND: Darkrune Helm (ilevel 63 entry 20551)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20551);
-- NOT FOUND: Wildstaff (ilevel 52 entry 20556)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20556);
-- NOT FOUND: Flimsy Male Dwarf Mask (ilevel 1 entry 20561)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20561);
-- NOT FOUND: Flimsy Female Dwarf Mask (ilevel 1 entry 20562)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20562);
-- NOT FOUND: Flimsy Female Nightelf Mask (ilevel 1 entry 20563)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20563);
-- NOT FOUND: Flimsy Male Nightelf Mask (ilevel 1 entry 20564)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20564);
-- NOT FOUND: Flimsy Female Human Mask (ilevel 1 entry 20565)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20565);
-- NOT FOUND: Flimsy Male Human Mask (ilevel 1 entry 20566)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20566);
-- NOT FOUND: Flimsy Female Troll Mask (ilevel 1 entry 20567)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20567);
-- NOT FOUND: Flimsy Male Troll Mask (ilevel 1 entry 20568)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20568);
-- NOT FOUND: Flimsy Female Orc Mask (ilevel 1 entry 20569)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20569);
-- NOT FOUND: Flimsy Male Orc Mask (ilevel 1 entry 20570)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20570);
-- NOT FOUND: Flimsy Female Tauren Mask (ilevel 1 entry 20571)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20571);
-- NOT FOUND: Flimsy Male Tauren Mask (ilevel 1 entry 20572)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20572);
-- NOT FOUND: Flimsy Male Undead Mask (ilevel 1 entry 20573)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20573);
-- NOT FOUND: Flimsy Female Undead Mask (ilevel 1 entry 20574)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20574);
-- NOT FOUND: Black Whelp Tunic (ilevel 20 entry 20575)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20575);
-- NOT FOUND: Nightmare Blade (ilevel 71 entry 20577)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20577);
-- NOT FOUND: Emerald Dragonfang (ilevel 71 entry 20578)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20578);
-- NOT FOUND: Green Dragonskin Cloak (ilevel 71 entry 20579)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20579);
-- NOT FOUND: Hammer of Bestial Fury (ilevel 71 entry 20580)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20580);
-- NOT FOUND: Staff of Rampant Growth (ilevel 71 entry 20581)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20581);
-- NOT FOUND: Trance Stone (ilevel 71 entry 20582)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20582);
-- NOT FOUND: Polished Ironwood Crossbow (ilevel 71 entry 20599)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20599);
-- NOT FOUND: Malfurion's Signet Ring (ilevel 72 entry 20600)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20600);
-- NOT FOUND: Dragonspur Wraps (ilevel 71 entry 20615)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20615);
-- NOT FOUND: Dragonbone Wristguards (ilevel 71 entry 20616)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20616);
-- NOT FOUND: Ancient Corroded Leggings (ilevel 72 entry 20617)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20617);
-- NOT FOUND: Gloves of Delusional Power (ilevel 72 entry 20618)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20618);
-- NOT FOUND: Acid Inscribed Greaves (ilevel 72 entry 20619)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20619);
-- NOT FOUND: Boots of the Endless Moor (ilevel 71 entry 20621)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20621);
-- NOT FOUND: Dragonheart Necklace (ilevel 71 entry 20622)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20622);
-- NOT FOUND: Circlet of Restless Dreams (ilevel 72 entry 20623)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20623);
-- NOT FOUND: Ring of the Unliving (ilevel 72 entry 20624)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20624);
-- NOT FOUND: Belt of the Dark Bog (ilevel 71 entry 20625)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20625);
-- NOT FOUND: Black Bark Wristbands (ilevel 71 entry 20626)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20626);
-- NOT FOUND: Dark Heart Pants (ilevel 71 entry 20627)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20627);
-- NOT FOUND: Deviate Growth Cap (ilevel 72 entry 20628)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20628);
-- NOT FOUND: Malignant Footguards (ilevel 72 entry 20629)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20629);
-- NOT FOUND: Gauntlets of the Shining Light (ilevel 72 entry 20630)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20630);
-- NOT FOUND: Mendicant's Slippers (ilevel 71 entry 20631)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20631);
-- NOT FOUND: Mindtear Band (ilevel 71 entry 20632)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20632);
-- NOT FOUND: Unnatural Leather Spaulders (ilevel 72 entry 20633)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20633);
-- NOT FOUND: Boots of Fright (ilevel 72 entry 20634)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20634);
-- NOT FOUND: Jade Inlaid Vestments (ilevel 71 entry 20635)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20635);
-- NOT FOUND: Hibernation Crystal (ilevel 71 entry 20636)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20636);
-- NOT FOUND: Acid Inscribed Pauldrons (ilevel 72 entry 20637)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20637);
-- NOT FOUND: Leggings of the Demented Mind (ilevel 72 entry 20638)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20638);
-- NOT FOUND: Strangely Glyphed Legplates (ilevel 72 entry 20639)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20639);
-- NOT FOUND: Southsea Head Bucket (ilevel 45 entry 20640)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20640);
-- NOT FOUND: Southsea Mojo Boots (ilevel 45 entry 20641)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20641);
-- NOT FOUND: Antiquated Nobleman's Tunic (ilevel 47 entry 20642)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20642);
-- NOT FOUND: Undercity Reservist's Cap (ilevel 47 entry 20643)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20643);
-- NOT FOUND: Nature's Whisper (ilevel 60 entry 20645)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20645);
-- NOT FOUND: Sandstrider's Mark (ilevel 59 entry 20646)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20646);
-- NOT FOUND: Black Crystal Dagger (ilevel 59 entry 20647)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20647);
-- NOT FOUND: Sunprism Pendant (ilevel 60 entry 20649)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20649);
-- NOT FOUND: Desert Wind Gauntlets (ilevel 60 entry 20650)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20650);
-- NOT FOUND: Amethyst War Staff (ilevel 60 entry 20654)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20654);
-- NOT FOUND: Crystal Tipped Stiletto (ilevel 60 entry 20657)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20657);
-- NOT FOUND: Stonecutting Glaive (ilevel 60 entry 20660)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20660);
-- NOT FOUND: Deep Strike Bow (ilevel 60 entry 20663)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20663);
-- NOT FOUND: Hardened Steel Warhammer (ilevel 62 entry 20666)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20666);
-- NOT FOUND: Darkstone Claymore (ilevel 62 entry 20669)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20669);
-- NOT FOUND: Sparkling Crystal Wand (ilevel 62 entry 20672)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20672);
-- NOT FOUND: Soulrender (ilevel 62 entry 20675)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20675);
-- NOT FOUND: Elemental Focus Band (ilevel 65 entry 20682)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20682);
-- NOT FOUND: Wavefront Necklace (ilevel 65 entry 20685)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20685);
-- NOT FOUND: Earthen Guard (ilevel 65 entry 20688)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20688);
-- NOT FOUND: Windshear Cape (ilevel 65 entry 20691)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20691);
-- NOT FOUND: Weighted Cloak (ilevel 60 entry 20693)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20693);
-- NOT FOUND: Glowing Black Orb (ilevel 60 entry 20694)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20694);
-- NOT FOUND: Abyssal War Beads (ilevel 63 entry 20695)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20695);
-- NOT FOUND: Crystal Spiked Maul (ilevel 63 entry 20696)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20696);
-- NOT FOUND: Crystalline Threaded Cape (ilevel 63 entry 20697)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20697);
-- NOT FOUND: Elemental Attuned Blade (ilevel 63 entry 20698)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20698);
-- NOT FOUND: Cenarion Reservist's Legplates (ilevel 63 entry 20699)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20699);
-- NOT FOUND: Cenarion Reservist's Legplates (ilevel 63 entry 20700)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20700);
-- NOT FOUND: Cenarion Reservist's Legguards (ilevel 63 entry 20701)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20701);
-- NOT FOUND: Cenarion Reservist's Legguards (ilevel 63 entry 20702)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20702);
-- NOT FOUND: Cenarion Reservist's Leggings (ilevel 63 entry 20703)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20703);
-- NOT FOUND: Cenarion Reservist's Leggings (ilevel 63 entry 20704)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20704);
-- NOT FOUND: Cenarion Reservist's Pants (ilevel 63 entry 20705)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20705);
-- NOT FOUND: Cenarion Reservist's Pants (ilevel 63 entry 20706)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20706);
-- NOT FOUND: Cenarion Reservist's Pants (ilevel 63 entry 20707)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20707);
-- NOT FOUND: Crystal Encrusted Greaves (ilevel 63 entry 20710)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20710);
-- NOT FOUND: Crystal Lined Greaves (ilevel 63 entry 20711)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20711);
-- NOT FOUND: Wastewalker's Gauntlets (ilevel 63 entry 20712)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20712);
-- NOT FOUND: Desertstalkers's Gauntlets (ilevel 63 entry 20713)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20713);
-- NOT FOUND: Sandstorm Boots (ilevel 63 entry 20714)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20714);
-- NOT FOUND: Dunestalker's Boots (ilevel 63 entry 20715)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20715);
-- NOT FOUND: Sandworm Skin Gloves (ilevel 63 entry 20716)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20716);
-- NOT FOUND: Desert Bloom Gloves (ilevel 63 entry 20717)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20717);
-- NOT FOUND: Dark Whisper Blade (ilevel 65 entry 20720)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20720);
-- NOT FOUND: Band of the Cultist (ilevel 65 entry 20721)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20721);
-- NOT FOUND: Crystal Slugthrower (ilevel 65 entry 20722)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20722);
-- NOT FOUND: Brann's Trusty Pick (ilevel 62 entry 20723)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20723);
-- NOT FOUND: Corrupted Blackwood Staff (ilevel 62 entry 20724)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20724);
-- NOT FOUND: Narain's Turban (ilevel 1 entry 21039)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21039);
-- NOT FOUND: Narain's Robe (ilevel 1 entry 21040)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21040);
-- NOT FOUND: Defiler's Talisman (ilevel 53 entry 21115)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21115);
-- NOT FOUND: Defiler's Talisman (ilevel 43 entry 21116)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21116);
-- NOT FOUND: Talisman of Arathor (ilevel 53 entry 21117)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21117);
-- NOT FOUND: Talisman of Arathor (ilevel 43 entry 21118)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21118);
-- NOT FOUND: Talisman of Arathor (ilevel 33 entry 21119)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21119);
-- NOT FOUND: Defiler's Talisman (ilevel 33 entry 21120)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21120);
-- NOT FOUND: Death's Sting (ilevel 84 entry 21126)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21126);
-- NOT FOUND: Staff of the Qiraji Prophets (ilevel 75 entry 21128)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21128);
-- NOT FOUND: Dark Edge of Insanity (ilevel 84 entry 21134)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21134);
-- NOT FOUND: Festival Dress (ilevel 1 entry 21154)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21154);
-- NOT FOUND: Festive Green Dress (ilevel 1 entry 21157)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21157);
-- NOT FOUND: Gloves of Earthen Power (ilevel 62 entry 21178)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21178);
-- NOT FOUND: Band of Earthen Wrath (ilevel 62 entry 21179)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21179);
-- NOT FOUND: Earthstrike (ilevel 66 entry 21180)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21180);
-- NOT FOUND: Grace of Earth (ilevel 66 entry 21181)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21181);
-- NOT FOUND: Band of Earthen Might (ilevel 66 entry 21182)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21182);
-- NOT FOUND: Earthpower Vest (ilevel 66 entry 21183)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21183);
-- NOT FOUND: Deeprock Bracers (ilevel 62 entry 21184)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21184);
-- NOT FOUND: Earthcalm Orb (ilevel 62 entry 21185)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21185);
-- NOT FOUND: Rockfury Bracers (ilevel 62 entry 21186)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21186);
-- NOT FOUND: Earthweave Cloak (ilevel 62 entry 21187)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21187);
-- NOT FOUND: Fist of Cenarius (ilevel 66 entry 21188)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21188);
-- NOT FOUND: Might of Cenarius (ilevel 62 entry 21189)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21189);
-- NOT FOUND: Wrath of Cenarius (ilevel 66 entry 21190)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21190);
-- NOT FOUND: Signet Ring of the Bronze Dragonflight (ilevel 60 entry 21196)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21196);
-- NOT FOUND: Signet Ring of the Bronze Dragonflight (ilevel 65 entry 21197)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21197);
-- NOT FOUND: Signet Ring of the Bronze Dragonflight (ilevel 70 entry 21198)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21198);
-- NOT FOUND: Signet Ring of the Bronze Dragonflight (ilevel 75 entry 21199)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21199);
-- NOT FOUND: Signet Ring of the Bronze Dragonflight (ilevel 80 entry 21200)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21200);
-- NOT FOUND: Signet Ring of the Bronze Dragonflight (ilevel 60 entry 21201)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21201);
-- NOT FOUND: Signet Ring of the Bronze Dragonflight (ilevel 65 entry 21202)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21202);
-- NOT FOUND: Signet Ring of the Bronze Dragonflight (ilevel 70 entry 21203)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21203);
-- NOT FOUND: Signet Ring of the Bronze Dragonflight (ilevel 75 entry 21204)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21204);
-- NOT FOUND: Signet Ring of the Bronze Dragonflight (ilevel 80 entry 21205)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21205);
-- NOT FOUND: Signet Ring of the Bronze Dragonflight (ilevel 60 entry 21206)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21206);
-- NOT FOUND: Signet Ring of the Bronze Dragonflight (ilevel 65 entry 21207)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21207);
-- NOT FOUND: Signet Ring of the Bronze Dragonflight (ilevel 70 entry 21208)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21208);
-- NOT FOUND: Signet Ring of the Bronze Dragonflight (ilevel 75 entry 21209)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21209);
-- NOT FOUND: Signet Ring of the Bronze Dragonflight (ilevel 80 entry 21210)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21210);
-- NOT FOUND: Blessed Qiraji War Axe (ilevel 79 entry 21242)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21242);
-- NOT FOUND: Blessed Qiraji Pugio (ilevel 79 entry 21244)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21244);
-- NOT FOUND: Blessed Qiraji War Hammer (ilevel 79 entry 21268)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21268);
-- NOT FOUND: Blessed Qiraji Bulwark (ilevel 79 entry 21269)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21269);
-- NOT FOUND: Blessed Qiraji Musket (ilevel 79 entry 21272)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21272);
-- NOT FOUND: Blessed Qiraji Acolyte Staff (ilevel 79 entry 21273)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21273);
-- NOT FOUND: Blessed Qiraji Augur Staff (ilevel 79 entry 21275)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21275);
-- NOT FOUND: Stormshroud Gloves (ilevel 62 entry 21278)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21278);
-- NOT FOUND: Earth Warder's Vest (ilevel 48 entry 21311)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21311);
-- NOT FOUND: Belt of the Den Watcher (ilevel 48 entry 21312)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21312);
-- NOT FOUND: Leggings of the Ursa (ilevel 55 entry 21316)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21316);
-- NOT FOUND: Helm of the Pathfinder (ilevel 55 entry 21317)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21317);
-- NOT FOUND: Earth Warder's Gloves (ilevel 58 entry 21318)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21318);
-- NOT FOUND: Gloves of the Pathfinder (ilevel 58 entry 21319)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21319);
-- NOT FOUND: Vest of the Den Watcher (ilevel 58 entry 21320)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21320);
-- NOT FOUND: Ursa's Embrace (ilevel 58 entry 21322)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21322);
-- NOT FOUND: Defender of the Timbermaw (ilevel 62 entry 21326)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21326);
-- NOT FOUND: Conqueror's Crown (ilevel 81 entry 21329)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21329);
-- NOT FOUND: Conqueror's Spaulders (ilevel 78 entry 21330)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21330);
-- NOT FOUND: Conqueror's Breastplate (ilevel 88 entry 21331)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21331);
-- NOT FOUND: Conqueror's Legguards (ilevel 81 entry 21332)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21332);
-- NOT FOUND: Conqueror's Greaves (ilevel 78 entry 21333)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21333);
-- NOT FOUND: Doomcaller's Robes (ilevel 88 entry 21334)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21334);
-- NOT FOUND: Doomcaller's Mantle (ilevel 78 entry 21335)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21335);
-- NOT FOUND: Doomcaller's Trousers (ilevel 81 entry 21336)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21336);
-- NOT FOUND: Doomcaller's Circlet (ilevel 81 entry 21337)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21337);
-- NOT FOUND: Doomcaller's Footwraps (ilevel 78 entry 21338)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21338);
-- NOT FOUND: Enigma Robes (ilevel 88 entry 21343)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21343);
-- NOT FOUND: Enigma Boots (ilevel 78 entry 21344)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21344);
-- NOT FOUND: Enigma Shoulderpads (ilevel 78 entry 21345)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21345);
-- NOT FOUND: Enigma Leggings (ilevel 81 entry 21346)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21346);
-- NOT FOUND: Enigma Circlet (ilevel 81 entry 21347)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21347);
-- NOT FOUND: Tiara of the Oracle (ilevel 81 entry 21348)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21348);
-- NOT FOUND: Footwraps of the Oracle (ilevel 78 entry 21349)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21349);
-- NOT FOUND: Mantle of the Oracle (ilevel 78 entry 21350)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21350);
-- NOT FOUND: Vestments of the Oracle (ilevel 88 entry 21351)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21351);
-- NOT FOUND: Trousers of the Oracle (ilevel 81 entry 21352)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21352);
-- NOT FOUND: Genesis Helm (ilevel 81 entry 21353)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21353);
-- NOT FOUND: Genesis Shoulderpads (ilevel 78 entry 21354)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21354);
-- NOT FOUND: Genesis Boots (ilevel 78 entry 21355)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21355);
-- NOT FOUND: Genesis Trousers (ilevel 81 entry 21356)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21356);
-- NOT FOUND: Genesis Vest (ilevel 88 entry 21357)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21357);
-- NOT FOUND: Deathdealer's Boots (ilevel 78 entry 21359)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21359);
-- NOT FOUND: Deathdealer's Helm (ilevel 81 entry 21360)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21360);
-- NOT FOUND: Deathdealer's Spaulders (ilevel 78 entry 21361)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21361);
-- NOT FOUND: Deathdealer's Leggings (ilevel 81 entry 21362)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21362);
-- NOT FOUND: Deathdealer's Vest (ilevel 88 entry 21364)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21364);
-- NOT FOUND: Striker's Footguards (ilevel 78 entry 21365)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21365);
-- NOT FOUND: Striker's Diadem (ilevel 81 entry 21366)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21366);
-- NOT FOUND: Striker's Pauldrons (ilevel 81 entry 21367)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21367);
-- NOT FOUND: Striker's Leggings (ilevel 81 entry 21368)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21368);
-- NOT FOUND: Striker's Hauberk (ilevel 88 entry 21370)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21370);
-- NOT FOUND: Stormcaller's Diadem (ilevel 81 entry 21372)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21372);
-- NOT FOUND: Stormcaller's Footguards (ilevel 78 entry 21373)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21373);
-- NOT FOUND: Stormcaller's Hauberk (ilevel 88 entry 21374)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21374);
-- NOT FOUND: Stormcaller's Leggings (ilevel 81 entry 21375)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21375);
-- NOT FOUND: Stormcaller's Pauldrons (ilevel 78 entry 21376)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21376);
-- NOT FOUND: Avenger's Crown (ilevel 81 entry 21387)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21387);
-- NOT FOUND: Avenger's Greaves (ilevel 78 entry 21388)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21388);
-- NOT FOUND: Avenger's Breastplate (ilevel 88 entry 21389)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21389);
-- NOT FOUND: Avenger's Legguards (ilevel 81 entry 21390)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21390);
-- NOT FOUND: Avenger's Pauldrons (ilevel 78 entry 21391)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21391);
-- NOT FOUND: Sickle of Unyielding Strength (ilevel 70 entry 21392)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21392);
-- NOT FOUND: Signet of Unyielding Strength (ilevel 65 entry 21393)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21393);
-- NOT FOUND: Drape of Unyielding Strength (ilevel 67 entry 21394)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21394);
-- NOT FOUND: Blade of Eternal Justice (ilevel 70 entry 21395)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21395);
-- NOT FOUND: Ring of Eternal Justice (ilevel 65 entry 21396)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21396);
-- NOT FOUND: Cape of Eternal Justice (ilevel 67 entry 21397)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21397);
-- NOT FOUND: Hammer of the Gathering Storm (ilevel 70 entry 21398)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21398);
-- NOT FOUND: Ring of the Gathering Storm (ilevel 65 entry 21399)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21399);
-- NOT FOUND: Cloak of the Gathering Storm (ilevel 67 entry 21400)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21400);
-- NOT FOUND: Scythe of the Unseen Path (ilevel 70 entry 21401)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21401);
-- NOT FOUND: Signet of the Unseen Path (ilevel 65 entry 21402)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21402);
-- NOT FOUND: Cloak of the Unseen Path (ilevel 67 entry 21403)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21403);
-- NOT FOUND: Dagger of Veiled Shadows (ilevel 70 entry 21404)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21404);
-- NOT FOUND: Band of Veiled Shadows (ilevel 65 entry 21405)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21405);
-- NOT FOUND: Cloak of Veiled Shadows (ilevel 67 entry 21406)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21406);
-- NOT FOUND: Mace of Unending Life (ilevel 70 entry 21407)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21407);
-- NOT FOUND: Band of Unending Life (ilevel 65 entry 21408)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21408);
-- NOT FOUND: Cloak of Unending Life (ilevel 67 entry 21409)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21409);
-- NOT FOUND: Gavel of Infinite Wisdom (ilevel 70 entry 21410)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21410);
-- NOT FOUND: Ring of Infinite Wisdom (ilevel 65 entry 21411)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21411);
-- NOT FOUND: Shroud of Infinite Wisdom (ilevel 67 entry 21412)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21412);
-- NOT FOUND: Blade of Vaulted Secrets (ilevel 70 entry 21413)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21413);
-- NOT FOUND: Band of Vaulted Secrets (ilevel 65 entry 21414)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21414);
-- NOT FOUND: Drape of Vaulted Secrets (ilevel 67 entry 21415)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21415);
-- NOT FOUND: Kris of Unspoken Names (ilevel 70 entry 21416)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21416);
-- NOT FOUND: Ring of Unspoken Names (ilevel 65 entry 21417)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21417);
-- NOT FOUND: Shroud of Unspoken Names (ilevel 67 entry 21418)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21418);
-- NOT FOUND: Staff of the Ruins (ilevel 72 entry 21452)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21452);
-- NOT FOUND: Mantle of the Horusath (ilevel 72 entry 21453)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21453);
-- NOT FOUND: Runic Stone Shoulders (ilevel 72 entry 21454)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21454);
-- NOT FOUND: Southwind Helm (ilevel 74 entry 21455)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21455);
-- NOT FOUND: Sandstorm Cloak (ilevel 72 entry 21456)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21456);
-- NOT FOUND: Bracers of Brutality (ilevel 72 entry 21457)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21457);
-- NOT FOUND: Gauntlets of New Life (ilevel 72 entry 21458)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21458);
-- NOT FOUND: Crossbow of Imminent Doom (ilevel 72 entry 21459)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21459);
-- NOT FOUND: Helm of Domination (ilevel 72 entry 21460)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21460);
-- NOT FOUND: Leggings of the Black Blizzard (ilevel 72 entry 21461)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21461);
-- NOT FOUND: Gloves of Dark Wisdom (ilevel 72 entry 21462)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21462);
-- NOT FOUND: Ossirian's Binding (ilevel 72 entry 21463)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21463);
-- NOT FOUND: Shackles of the Unscarred (ilevel 72 entry 21464)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21464);
-- NOT FOUND: Stinger of Ayamiss (ilevel 69 entry 21466)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21466);
-- NOT FOUND: Thick Silithid Chestguard (ilevel 69 entry 21467)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21467);
-- NOT FOUND: Mantle of Maz'Nadir (ilevel 74 entry 21468)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21468);
-- NOT FOUND: Gauntlets of Southwind (ilevel 74 entry 21469)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21469);
-- NOT FOUND: Cloak of the Savior (ilevel 74 entry 21470)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21470);
-- NOT FOUND: Talon of Furious Concentration (ilevel 69 entry 21471)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21471);
-- NOT FOUND: Dustwind Turban (ilevel 69 entry 21472)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21472);
-- NOT FOUND: Eye of Moam (ilevel 74 entry 21473)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21473);
-- NOT FOUND: Chitinous Shoulderguards (ilevel 74 entry 21474)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21474);
-- NOT FOUND: Legplates of the Destroyer (ilevel 74 entry 21475)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21475);
-- NOT FOUND: Obsidian Scaled Leggings (ilevel 74 entry 21476)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21476);
-- NOT FOUND: Ring of Fury (ilevel 74 entry 21477)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21477);
-- NOT FOUND: Bow of Taut Sinew (ilevel 68 entry 21478)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21478);
-- NOT FOUND: Gauntlets of the Immovable (ilevel 68 entry 21479)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21479);
-- NOT FOUND: Scaled Silithid Gauntlets (ilevel 73 entry 21480)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21480);
-- NOT FOUND: Boots of the Desert Protector (ilevel 73 entry 21481)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21481);
-- NOT FOUND: Boots of the Fiery Sands (ilevel 73 entry 21482)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21482);
-- NOT FOUND: Ring of the Desert Winds (ilevel 73 entry 21483)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21483);
-- NOT FOUND: Helm of Regrowth (ilevel 73 entry 21484)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21484);
-- NOT FOUND: Buru's Skull Fragment (ilevel 68 entry 21485)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21485);
-- NOT FOUND: Gloves of the Swarm (ilevel 68 entry 21486)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21486);
-- NOT FOUND: Slimy Scaled Gauntlets (ilevel 68 entry 21487)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21487);
-- NOT FOUND: Fetish of Chitinous Spikes (ilevel 73 entry 21488)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21488);
-- NOT FOUND: Quicksand Waders (ilevel 73 entry 21489)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21489);
-- NOT FOUND: Slime Kickers (ilevel 73 entry 21490)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21490);
-- NOT FOUND: Scaled Bracers of the Gorger (ilevel 73 entry 21491)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21491);
-- NOT FOUND: Manslayer of the Qiraji (ilevel 66 entry 21492)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21492);
-- NOT FOUND: Boots of the Vanguard (ilevel 66 entry 21493)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21493);
-- NOT FOUND: Southwind's Grasp (ilevel 71 entry 21494)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21494);
-- NOT FOUND: Legplates of the Qiraji Command (ilevel 71 entry 21495)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21495);
-- NOT FOUND: Bracers of Qiraji Command (ilevel 71 entry 21496)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21496);
-- NOT FOUND: Boots of the Qiraji General (ilevel 71 entry 21497)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21497);
-- NOT FOUND: Qiraji Sacrificial Dagger (ilevel 66 entry 21498)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21498);
-- NOT FOUND: Vestments of the Shifting Sands (ilevel 66 entry 21499)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21499);
-- NOT FOUND: Belt of the Inquisition (ilevel 71 entry 21500)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21500);
-- NOT FOUND: Toughened Silithid Hide Gloves (ilevel 71 entry 21501)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21501);
-- NOT FOUND: Sand Reaver Wristguards (ilevel 71 entry 21502)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21502);
-- NOT FOUND: Belt of the Sand Reaver (ilevel 71 entry 21503)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21503);
-- NOT FOUND: Charm of the Shifting Sands (ilevel 70 entry 21504)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21504);
-- NOT FOUND: Choker of the Shifting Sands (ilevel 70 entry 21505)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21505);
-- NOT FOUND: Pendant of the Shifting Sands (ilevel 70 entry 21506)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21506);
-- NOT FOUND: Amulet of the Shifting Sands (ilevel 70 entry 21507)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21507);
-- NOT FOUND: Gnomish Turban of Psychic Might (ilevel 75 entry 21517)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21517);
-- NOT FOUND: Ravencrest's Legacy (ilevel 76 entry 21520)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21520);
-- NOT FOUND: Runesword of the Red (ilevel 76 entry 21521)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21521);
-- NOT FOUND: Shadowsong's Sorrow (ilevel 76 entry 21522)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21522);
-- NOT FOUND: Fang of Korialstrasz (ilevel 76 entry 21523)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21523);
-- NOT FOUND: Red Winter Hat (ilevel 1 entry 21524)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21524);
-- NOT FOUND: Green Winter Hat (ilevel 1 entry 21525)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21525);
-- NOT FOUND: Band of Icy Depths (ilevel 77 entry 21526)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21526);
-- NOT FOUND: Darkwater Robes (ilevel 77 entry 21527)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21527);
-- NOT FOUND: Amulet of Shadow Shielding (ilevel 77 entry 21529)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21529);
-- NOT FOUND: Onyx Embedded Leggings (ilevel 77 entry 21530)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21530);
-- NOT FOUND: Drake Tooth Necklace (ilevel 77 entry 21531)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21531);
-- NOT FOUND: Drudge Boots (ilevel 77 entry 21532)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21532);
-- NOT FOUND: Festive Pink Dress (ilevel 1 entry 21538)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21538);
-- NOT FOUND: Festive Purple Dress (ilevel 1 entry 21539)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21539);
-- NOT FOUND: Festive Black Pant Suit (ilevel 1 entry 21541)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21541);
-- NOT FOUND: Festival Suit (ilevel 1 entry 21542)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21542);
-- NOT FOUND: Festive Teal Pant Suit (ilevel 1 entry 21543)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21543);
-- NOT FOUND: Festive Blue Pant Suit (ilevel 1 entry 21544)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21544);
-- NOT FOUND: Don Rodrigo's Band (ilevel 65 entry 21563)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21563);
-- NOT FOUND: Rune of Perfection (ilevel 45 entry 21565)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21565);
-- NOT FOUND: Rune of Perfection (ilevel 25 entry 21566)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21566);
-- NOT FOUND: Rune of Duty (ilevel 45 entry 21567)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21567);
-- NOT FOUND: Rune of Duty (ilevel 25 entry 21568)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21568);
-- NOT FOUND: Vanquished Tentacle of C'Thun (ilevel 88 entry 21579)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21579);
-- NOT FOUND: Gauntlets of Annihilation (ilevel 88 entry 21581)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21581);
-- NOT FOUND: Grasp of the Old God (ilevel 88 entry 21582)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21582);
-- NOT FOUND: Cloak of Clarity (ilevel 88 entry 21583)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21583);
-- NOT FOUND: Dark Storm Gauntlets (ilevel 88 entry 21585)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21585);
-- NOT FOUND: Belt of Never-ending Agony (ilevel 88 entry 21586)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21586);
-- NOT FOUND: Wristguards of Castigation (ilevel 88 entry 21587)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21587);
-- NOT FOUND: Ring of the Godslayer (ilevel 88 entry 21596)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21596);
-- NOT FOUND: Royal Scepter of Vek'lor (ilevel 81 entry 21597)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21597);
-- NOT FOUND: Royal Qiraji Belt (ilevel 81 entry 21598)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21598);
-- NOT FOUND: Vek'lor's Gloves of Devastation (ilevel 81 entry 21599)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21599);
-- NOT FOUND: Boots of Epiphany (ilevel 81 entry 21600)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21600);
-- NOT FOUND: Ring of Emperor Vek'lor (ilevel 81 entry 21601)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21601);
-- NOT FOUND: Qiraji Execution Bracers (ilevel 81 entry 21602)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21602);
-- NOT FOUND: Wand of Qiraji Nobility (ilevel 78 entry 21603)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21603);
-- NOT FOUND: Bracelets of Royal Redemption (ilevel 81 entry 21604)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21604);
-- NOT FOUND: Gloves of the Hidden Temple (ilevel 81 entry 21605)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21605);
-- NOT FOUND: Belt of the Fallen Emperor (ilevel 81 entry 21606)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21606);
-- NOT FOUND: Grasp of the Fallen Emperor (ilevel 81 entry 21607)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21607);
-- NOT FOUND: Amulet of Vek'nilash (ilevel 81 entry 21608)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21608);
-- NOT FOUND: Regenerating Belt of Vek'nilash (ilevel 81 entry 21609)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21609);
-- NOT FOUND: Wormscale Blocker (ilevel 81 entry 21610)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21610);
-- NOT FOUND: Burrower Bracers (ilevel 81 entry 21611)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21611);
-- NOT FOUND: Don Rigoberto's Lost Hat (ilevel 81 entry 21615)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21615);
-- NOT FOUND: Huhuran's Stinger (ilevel 78 entry 21616)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21616);
-- NOT FOUND: Wasphide Gauntlets (ilevel 78 entry 21617)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21617);
-- NOT FOUND: Hive Defiler Wristguards (ilevel 78 entry 21618)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21618);
-- NOT FOUND: Gloves of the Messiah (ilevel 78 entry 21619)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21619);
-- NOT FOUND: Ring of the Martyr (ilevel 78 entry 21620)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21620);
-- NOT FOUND: Cloak of the Golden Hive (ilevel 78 entry 21621)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21621);
-- NOT FOUND: Sharpened Silithid Femur (ilevel 78 entry 21622)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21622);
-- NOT FOUND: Gauntlets of the Righteous Champion (ilevel 78 entry 21623)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21623);
-- NOT FOUND: Gauntlets of Kalimdor (ilevel 78 entry 21624)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21624);
-- NOT FOUND: Scarab Brooch (ilevel 78 entry 21625)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21625);
-- NOT FOUND: Slime-coated Leggings (ilevel 78 entry 21626)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21626);
-- NOT FOUND: Cloak of Untold Secrets (ilevel 77 entry 21627)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21627);
-- NOT FOUND: Barb of the Sand Reaver (ilevel 77 entry 21635)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21635);
-- NOT FOUND: Pauldrons of the Unrelenting (ilevel 77 entry 21639)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21639);
-- NOT FOUND: Hive Tunneler's Boots (ilevel 77 entry 21645)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21645);
-- NOT FOUND: Fetish of the Sand Reaver (ilevel 77 entry 21647)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21647);
-- NOT FOUND: Recomposed Boots (ilevel 76 entry 21648)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21648);
-- NOT FOUND: Ancient Qiraji Ripper (ilevel 77 entry 21650)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21650);
-- NOT FOUND: Scaled Sand Reaver Leggings (ilevel 77 entry 21651)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21651);
-- NOT FOUND: Silithid Carapace Chestguard (ilevel 77 entry 21652)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21652);
-- NOT FOUND: Robes of the Guardian Saint (ilevel 77 entry 21663)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21663);
-- NOT FOUND: Barbed Choker (ilevel 77 entry 21664)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21664);
-- NOT FOUND: Mantle of Wicked Revenge (ilevel 77 entry 21665)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21665);
-- NOT FOUND: Sartura's Might (ilevel 76 entry 21666)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21666);
-- NOT FOUND: Legplates of Blazing Light (ilevel 76 entry 21667)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21667);
-- NOT FOUND: Scaled Leggings of Qiraji Fury (ilevel 76 entry 21668)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21668);
-- NOT FOUND: Creeping Vine Helm (ilevel 76 entry 21669)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21669);
-- NOT FOUND: Badge of the Swarmguard (ilevel 76 entry 21670)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21670);
-- NOT FOUND: Robes of the Battleguard (ilevel 76 entry 21671)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21671);
-- NOT FOUND: Gloves of Enforcement (ilevel 76 entry 21672)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21672);
-- NOT FOUND: Silithid Claw (ilevel 76 entry 21673)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21673);
-- NOT FOUND: Gauntlets of Steadfast Determination (ilevel 76 entry 21674)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21674);
-- NOT FOUND: Thick Qirajihide Belt (ilevel 76 entry 21675)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21675);
-- NOT FOUND: Leggings of the Festering Swarm (ilevel 76 entry 21676)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21676);
-- NOT FOUND: Ring of the Qiraji Fury (ilevel 78 entry 21677)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21677);
-- NOT FOUND: Necklace of Purity (ilevel 76 entry 21678)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21678);
-- NOT FOUND: Kalimdor's Revenge (ilevel 81 entry 21679)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21679);
-- NOT FOUND: Vest of Swift Execution (ilevel 78 entry 21680)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21680);
-- NOT FOUND: Ring of the Devoured (ilevel 78 entry 21681)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21681);
-- NOT FOUND: Bile-Covered Gauntlets (ilevel 78 entry 21682)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21682);
-- NOT FOUND: Mantle of the Desert Crusade (ilevel 76 entry 21683)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21683);
-- NOT FOUND: Mantle of the Desert's Fury (ilevel 76 entry 21684)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21684);
-- NOT FOUND: Petrified Scarab (ilevel 76 entry 21685)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21685);
-- NOT FOUND: Mantle of Phrenic Power (ilevel 76 entry 21686)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21686);
-- NOT FOUND: Ukko's Ring of Darkness (ilevel 76 entry 21687)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21687);
-- NOT FOUND: Boots of the Fallen Hero (ilevel 75 entry 21688)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21688);
-- NOT FOUND: Gloves of Ebru (ilevel 75 entry 21689)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21689);
-- NOT FOUND: Angelista's Charm (ilevel 75 entry 21690)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21690);
-- NOT FOUND: Ooze-ridden Gauntlets (ilevel 75 entry 21691)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21691);
-- NOT FOUND: Triad Girdle (ilevel 75 entry 21692)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21692);
-- NOT FOUND: Guise of the Devourer (ilevel 75 entry 21693)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21693);
-- NOT FOUND: Ternary Mantle (ilevel 75 entry 21694)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21694);
-- NOT FOUND: Angelista's Touch (ilevel 75 entry 21695)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21695);
-- NOT FOUND: Robes of the Triumvirate (ilevel 75 entry 21696)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21696);
-- NOT FOUND: Cape of the Trinity (ilevel 75 entry 21697)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21697);
-- NOT FOUND: Leggings of Immersion (ilevel 73 entry 21698)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21698);
-- NOT FOUND: Barrage Shoulders (ilevel 73 entry 21699)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21699);
-- NOT FOUND: Pendant of the Qiraji Guardian (ilevel 73 entry 21700)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21700);
-- NOT FOUND: Cloak of Concentrated Hatred (ilevel 73 entry 21701)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21701);
-- NOT FOUND: Amulet of Foul Warding (ilevel 73 entry 21702)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21702);
-- NOT FOUND: Hammer of Ji'zhi (ilevel 73 entry 21703)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21703);
-- NOT FOUND: Boots of the Redeemed Prophecy (ilevel 73 entry 21704)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21704);
-- NOT FOUND: Boots of the Fallen Prophet (ilevel 73 entry 21705)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21705);
-- NOT FOUND: Boots of the Unwavering Will (ilevel 73 entry 21706)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21706);
-- NOT FOUND: Ring of Swarming Thought (ilevel 73 entry 21707)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21707);
-- NOT FOUND: Beetle Scaled Wristguards (ilevel 73 entry 21708)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21708);
-- NOT FOUND: Ring of the Fallen God (ilevel 88 entry 21709)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21709);
-- NOT FOUND: Cloak of the Fallen God (ilevel 88 entry 21710)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21710);
-- NOT FOUND: Amulet of the Fallen God (ilevel 88 entry 21712)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21712);
-- NOT FOUND: Elune's Candle (ilevel 1 entry 21713)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21713);
-- NOT FOUND: Sand Polished Hammer (ilevel 72 entry 21715)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21715);
-- NOT FOUND: Silithid Husked Launcher (ilevel 68 entry 21800)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21800);
-- NOT FOUND: Antenna of Invigoration (ilevel 68 entry 21801)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21801);
-- NOT FOUND: The Lost Kris of Zedd (ilevel 68 entry 21802)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21802);
-- NOT FOUND: Helm of the Holy Avenger (ilevel 68 entry 21803)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21803);
-- NOT FOUND: Coif of Elemental Fury (ilevel 68 entry 21804)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21804);
-- NOT FOUND: Polished Obsidian Pauldrons (ilevel 68 entry 21805)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21805);
-- NOT FOUND: Gavel of Qiraji Authority (ilevel 71 entry 21806)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21806);
-- NOT FOUND: Fury of the Forgotten Swarm (ilevel 71 entry 21809)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21809);
-- NOT FOUND: Treads of the Wandering Nomad (ilevel 71 entry 21810)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21810);
-- NOT FOUND: Breastplate of Annihilation (ilevel 73 entry 21814)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21814);
-- NOT FOUND: Ritssyn's Ring of Chaos (ilevel 71 entry 21836)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21836);
-- NOT FOUND: Anubisath Warhammer (ilevel 71 entry 21837)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21837);
-- NOT FOUND: Garb of Royal Ascension (ilevel 71 entry 21838)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21838);
-- NOT FOUND: Scepter of the False Prophet (ilevel 84 entry 21839)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21839);
-- NOT FOUND: Neretzek, The Blood Drinker (ilevel 71 entry 21856)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21856);
-- NOT FOUND: Gloves of the Immortal (ilevel 71 entry 21888)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21888);
-- NOT FOUND: Gloves of the Redeemed Prophecy (ilevel 75 entry 21889)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21889);
-- NOT FOUND: Shard of the Fallen Star (ilevel 75 entry 21891)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21891);
-- NOT FOUND: Belt of Heroism (ilevel 65 entry 21994)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21994);
-- NOT FOUND: Boots of Heroism (ilevel 60 entry 21995)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21995);
-- NOT FOUND: Bracers of Heroism (ilevel 65 entry 21996)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21996);
-- NOT FOUND: Breastplate of Heroism (ilevel 60 entry 21997)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21997);
-- NOT FOUND: Gauntlets of Heroism (ilevel 55 entry 21998)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21998);
-- NOT FOUND: Helm of Heroism (ilevel 60 entry 21999)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 21999);
-- NOT FOUND: Legplates of Heroism (ilevel 66 entry 22000)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22000);
-- NOT FOUND: Spaulders of Heroism (ilevel 65 entry 22001)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22001);
-- NOT FOUND: Darkmantle Belt (ilevel 65 entry 22002)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22002);
-- NOT FOUND: Darkmantle Boots (ilevel 60 entry 22003)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22003);
-- NOT FOUND: Darkmantle Bracers (ilevel 65 entry 22004)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22004);
-- NOT FOUND: Darkmantle Cap (ilevel 60 entry 22005)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22005);
-- NOT FOUND: Darkmantle Gloves (ilevel 55 entry 22006)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22006);
-- NOT FOUND: Darkmantle Pants (ilevel 66 entry 22007)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22007);
-- NOT FOUND: Darkmantle Spaulders (ilevel 65 entry 22008)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22008);
-- NOT FOUND: Darkmantle Tunic (ilevel 60 entry 22009)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22009);
-- NOT FOUND: Beastmaster's Belt (ilevel 65 entry 22010)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22010);
-- NOT FOUND: Beastmaster's Bindings (ilevel 65 entry 22011)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22011);
-- NOT FOUND: Beastmaster's Cap (ilevel 60 entry 22013)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22013);
-- NOT FOUND: Beastmaster's Gloves (ilevel 55 entry 22015)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22015);
-- NOT FOUND: Beastmaster's Mantle (ilevel 65 entry 22016)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22016);
-- NOT FOUND: Beastmaster's Pants (ilevel 66 entry 22017)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22017);
-- NOT FOUND: Beastmaster's Tunic (ilevel 60 entry 22060)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22060);
-- NOT FOUND: Beastmaster's Boots (ilevel 60 entry 22061)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22061);
-- NOT FOUND: Sorcerer's Belt (ilevel 65 entry 22062)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22062);
-- NOT FOUND: Sorcerer's Bindings (ilevel 65 entry 22063)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22063);
-- NOT FOUND: Sorcerer's Boots (ilevel 60 entry 22064)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22064);
-- NOT FOUND: Sorcerer's Crown (ilevel 60 entry 22065)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22065);
-- NOT FOUND: Sorcerer's Gloves (ilevel 55 entry 22066)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22066);
-- NOT FOUND: Sorcerer's Leggings (ilevel 66 entry 22067)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22067);
-- NOT FOUND: Sorcerer's Mantle (ilevel 65 entry 22068)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22068);
-- NOT FOUND: Sorcerer's Robes (ilevel 60 entry 22069)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22069);
-- NOT FOUND: Deathmist Belt (ilevel 65 entry 22070)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22070);
-- NOT FOUND: Deathmist Bracers (ilevel 65 entry 22071)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22071);
-- NOT FOUND: Deathmist Leggings (ilevel 66 entry 22072)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22072);
-- NOT FOUND: Deathmist Mantle (ilevel 65 entry 22073)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22073);
-- NOT FOUND: Deathmist Mask (ilevel 60 entry 22074)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22074);
-- NOT FOUND: Deathmist Robe (ilevel 60 entry 22075)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22075);
-- NOT FOUND: Deathmist Sandals (ilevel 60 entry 22076)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22076);
-- NOT FOUND: Deathmist Wraps (ilevel 55 entry 22077)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22077);
-- NOT FOUND: Virtuous Belt (ilevel 65 entry 22078)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22078);
-- NOT FOUND: Virtuous Bracers (ilevel 65 entry 22079)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22079);
-- NOT FOUND: Virtuous Crown (ilevel 60 entry 22080)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22080);
-- NOT FOUND: Virtuous Gloves (ilevel 55 entry 22081)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22081);
-- NOT FOUND: Virtuous Mantle (ilevel 65 entry 22082)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22082);
-- NOT FOUND: Virtuous Robe (ilevel 60 entry 22083)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22083);
-- NOT FOUND: Virtuous Sandals (ilevel 60 entry 22084)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22084);
-- NOT FOUND: Virtuous Skirt (ilevel 66 entry 22085)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22085);
-- NOT FOUND: Soulforge Belt (ilevel 65 entry 22086)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22086);
-- NOT FOUND: Soulforge Boots (ilevel 60 entry 22087)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22087);
-- NOT FOUND: Soulforge Bracers (ilevel 65 entry 22088)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22088);
-- NOT FOUND: Soulforge Breastplate (ilevel 60 entry 22089)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22089);
-- NOT FOUND: Soulforge Gauntlets (ilevel 55 entry 22090)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22090);
-- NOT FOUND: Soulforge Helm (ilevel 60 entry 22091)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22091);
-- NOT FOUND: Soulforge Legplates (ilevel 66 entry 22092)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22092);
-- NOT FOUND: Soulforge Spaulders (ilevel 65 entry 22093)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22093);
-- NOT FOUND: Bindings of The Five Thunders (ilevel 65 entry 22095)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22095);
-- NOT FOUND: Boots of The Five Thunders (ilevel 60 entry 22096)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22096);
-- NOT FOUND: Coif of The Five Thunders (ilevel 60 entry 22097)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22097);
-- NOT FOUND: Cord of The Five Thunders (ilevel 65 entry 22098)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22098);
-- NOT FOUND: Gauntlets of The Five Thunders (ilevel 55 entry 22099)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22099);
-- NOT FOUND: Kilt of The Five Thunders (ilevel 66 entry 22100)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22100);
-- NOT FOUND: Pauldrons of The Five Thunders (ilevel 65 entry 22101)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22101);
-- NOT FOUND: Vest of The Five Thunders (ilevel 60 entry 22102)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22102);
-- NOT FOUND: Feralheart Belt (ilevel 65 entry 22106)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22106);
-- NOT FOUND: Feralheart Boots (ilevel 60 entry 22107)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22107);
-- NOT FOUND: Feralheart Bracers (ilevel 65 entry 22108)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22108);
-- NOT FOUND: Feralheart Cowl (ilevel 60 entry 22109)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22109);
-- NOT FOUND: Feralheart Gloves (ilevel 55 entry 22110)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22110);
-- NOT FOUND: Feralheart Kilt (ilevel 66 entry 22111)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22111);
-- NOT FOUND: Feralheart Spaulders (ilevel 65 entry 22112)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22112);
-- NOT FOUND: Feralheart Vest (ilevel 60 entry 22113)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22113);
-- NOT FOUND: Beads of Ogre Mojo (ilevel 63 entry 22149)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22149);
-- NOT FOUND: Beads of Ogre Might (ilevel 63 entry 22150)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22150);
-- NOT FOUND: Obsidian Mail Tunic (ilevel 72 entry 22191)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22191);
-- NOT FOUND: Black Grasp of the Destroyer (ilevel 70 entry 22194)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22194);
-- NOT FOUND: Light Obsidian Belt (ilevel 68 entry 22195)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22195);
-- NOT FOUND: Thick Obsidian Breastplate (ilevel 72 entry 22196)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22196);
-- NOT FOUND: Heavy Obsidian Belt (ilevel 68 entry 22197)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22197);
-- NOT FOUND: Jagged Obsidian Shield (ilevel 70 entry 22198)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22198);
-- NOT FOUND: Wristguards of Renown (ilevel 60 entry 22204)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22204);
-- NOT FOUND: Black Steel Bindings (ilevel 57 entry 22205)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22205);
-- NOT FOUND: Bouquet of Red Roses (ilevel 1 entry 22206)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22206);
-- NOT FOUND: Sash of the Grand Hunt (ilevel 60 entry 22207)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22207);
-- NOT FOUND: Lavastone Hammer (ilevel 58 entry 22208)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22208);
-- NOT FOUND: Golem Fitted Pauldrons (ilevel 56 entry 22212)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22212);
-- NOT FOUND: Foreman's Head Protector (ilevel 55 entry 22223)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22223);
-- NOT FOUND: Kayser's Boots of Precision (ilevel 61 entry 22231)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22231);
-- NOT FOUND: Marksman's Girdle (ilevel 61 entry 22232)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22232);
-- NOT FOUND: Mantle of Lost Hope (ilevel 53 entry 22234)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22234);
-- NOT FOUND: Greaves of Withering Despair (ilevel 53 entry 22240)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22240);
-- NOT FOUND: Dark Warder's Pauldrons (ilevel 57 entry 22241)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22241);
-- NOT FOUND: Verek's Leash (ilevel 56 entry 22242)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22242);
-- NOT FOUND: Soot Encrusted Footwear (ilevel 56 entry 22245)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22245);
-- NOT FOUND: Faith Healer's Boots (ilevel 63 entry 22247)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22247);
-- NOT FOUND: Tome of the Lost (ilevel 63 entry 22253)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22253);
-- NOT FOUND: Wand of Eternal Light (ilevel 57 entry 22254)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22254);
-- NOT FOUND: Magma Forged Band (ilevel 57 entry 22255)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22255);
-- NOT FOUND: Mana Shaping Handwraps (ilevel 57 entry 22256)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22256);
-- NOT FOUND: Bloodclot Band (ilevel 57 entry 22257)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22257);
-- NOT FOUND: Flarethorn (ilevel 57 entry 22266)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22266);
-- NOT FOUND: Spellweaver's Turban (ilevel 63 entry 22267)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22267);
-- NOT FOUND: Draconic Infused Emblem (ilevel 63 entry 22268)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22268);
-- NOT FOUND: Shadow Prowler's Cloak (ilevel 63 entry 22269)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22269);
-- NOT FOUND: Entrenching Boots (ilevel 55 entry 22270)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22270);
-- NOT FOUND: Leggings of Frenzied Magic (ilevel 57 entry 22271)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22271);
-- NOT FOUND: Forest's Embrace (ilevel 52 entry 22272)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22272);
-- NOT FOUND: Grizzled Pelt (ilevel 52 entry 22274)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22274);
-- NOT FOUND: Firemoss Boots (ilevel 57 entry 22275)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22275);
-- NOT FOUND: Lovely Red Dress (ilevel 1 entry 22276)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22276);
-- NOT FOUND: Red Dinner Suit (ilevel 1 entry 22277)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22277);
-- NOT FOUND: Lovely Blue Dress (ilevel 1 entry 22278)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22278);
-- NOT FOUND: Lovely Black Dress (ilevel 1 entry 22279)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22279);
-- NOT FOUND: Lovely Purple Dress (ilevel 1 entry 22280)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22280);
-- NOT FOUND: Blue Dinner Suit (ilevel 1 entry 22281)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22281);
-- NOT FOUND: Purple Dinner Suit (ilevel 1 entry 22282)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22282);
-- NOT FOUND: Ironweave Robe (ilevel 63 entry 22301)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22301);
-- NOT FOUND: Ironweave Cowl (ilevel 63 entry 22302)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22302);
-- NOT FOUND: Ironweave Pants (ilevel 62 entry 22303)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22303);
-- NOT FOUND: Ironweave Gloves (ilevel 61 entry 22304)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22304);
-- NOT FOUND: Ironweave Mantle (ilevel 61 entry 22305)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22305);
-- NOT FOUND: Ironweave Belt (ilevel 61 entry 22306)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22306);
-- NOT FOUND: Ironweave Boots (ilevel 61 entry 22311)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22311);
-- NOT FOUND: Ironweave Bracers (ilevel 61 entry 22313)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22313);
-- NOT FOUND: Huntsman's Harpoon (ilevel 61 entry 22314)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22314);
-- NOT FOUND: Hammer of Revitalization (ilevel 61 entry 22315)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22315);
-- NOT FOUND: Lefty's Brass Knuckle (ilevel 61 entry 22317)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22317);
-- NOT FOUND: Malgen's Long Bow (ilevel 61 entry 22318)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22318);
-- NOT FOUND: Tome of Divine Right (ilevel 61 entry 22319)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22319);
-- NOT FOUND: Heart of Wyrmthalak (ilevel 61 entry 22321)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22321);
-- NOT FOUND: The Jaw Breaker (ilevel 61 entry 22322)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22322);
-- NOT FOUND: Belt of the Trickster (ilevel 61 entry 22325)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22325);
-- NOT FOUND: Amalgam's Band (ilevel 63 entry 22326)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22326);
-- NOT FOUND: Amulet of the Redeemed (ilevel 63 entry 22327)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22327);
-- NOT FOUND: Legplates of Vigilance (ilevel 63 entry 22328)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22328);
-- NOT FOUND: Scepter of Interminable Focus (ilevel 63 entry 22329)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22329);
-- NOT FOUND: Shroud of Arcane Mastery (ilevel 61 entry 22330)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22330);
-- NOT FOUND: Band of the Steadfast Hero (ilevel 62 entry 22331)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22331);
-- NOT FOUND: Blade of Necromancy (ilevel 62 entry 22332)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22332);
-- NOT FOUND: Hammer of Divine Might (ilevel 62 entry 22333)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22333);
-- NOT FOUND: Band of Mending (ilevel 62 entry 22334)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22334);
-- NOT FOUND: Lord Valthalak's Staff of Command (ilevel 63 entry 22335)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22335);
-- NOT FOUND: Draconian Aegis of the Legion (ilevel 63 entry 22336)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22336);
-- NOT FOUND: Shroud of Domination (ilevel 63 entry 22337)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22337);
-- NOT FOUND: Rune Band of Wizardry (ilevel 63 entry 22339)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22339);
-- NOT FOUND: Pendant of Celerity (ilevel 63 entry 22340)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22340);
-- NOT FOUND: Leggings of Torment (ilevel 63 entry 22342)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22342);
-- NOT FOUND: Handguards of Savagery (ilevel 63 entry 22343)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22343);
-- NOT FOUND: Totem of Rebirth (ilevel 62 entry 22345)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22345);
-- NOT FOUND: Fahrad's Reloading Repeater (ilevel 65 entry 22347)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22347);
-- NOT FOUND: Doomulus Prime (ilevel 65 entry 22348)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22348);
-- NOT FOUND: The Thunderwood Poker (ilevel 65 entry 22377)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22377);
-- NOT FOUND: Ravenholdt Slicer (ilevel 65 entry 22378)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22378);
-- NOT FOUND: Shivsprocket's Shiv (ilevel 65 entry 22379)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22379);
-- NOT FOUND: Simone's Cultivating Hammer (ilevel 65 entry 22380)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22380);
-- NOT FOUND: Sageblade (ilevel 64 entry 22383)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22383);
-- NOT FOUND: Persuader (ilevel 63 entry 22384)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22384);
-- NOT FOUND: Titanic Leggings (ilevel 60 entry 22385)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22385);
-- NOT FOUND: Staff of Metanoia (ilevel 62 entry 22394)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22394);
-- NOT FOUND: Totem of Rage (ilevel 57 entry 22395)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22395);
-- NOT FOUND: Totem of Life (ilevel 78 entry 22396)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22396);
-- NOT FOUND: Idol of Ferocity (ilevel 57 entry 22397)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22397);
-- NOT FOUND: Idol of Rejuvenation (ilevel 62 entry 22398)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22398);
-- NOT FOUND: Idol of Health (ilevel 78 entry 22399)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22399);
-- NOT FOUND: Libram of Truth (ilevel 57 entry 22400)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22400);
-- NOT FOUND: Libram of Hope (ilevel 62 entry 22401)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22401);
-- NOT FOUND: Libram of Grace (ilevel 78 entry 22402)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22402);
-- NOT FOUND: Diana's Pearl Necklace (ilevel 61 entry 22403)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22403);
-- NOT FOUND: Willey's Back Scratcher (ilevel 61 entry 22404)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22404);
-- NOT FOUND: Mantle of the Scarlet Crusade (ilevel 61 entry 22405)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22405);
-- NOT FOUND: Redemption (ilevel 61 entry 22406)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22406);
-- NOT FOUND: Helm of the New Moon (ilevel 61 entry 22407)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22407);
-- NOT FOUND: Ritssyn's Wand of Bad Mojo (ilevel 63 entry 22408)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22408);
-- NOT FOUND: Tunic of the Crescent Moon (ilevel 63 entry 22409)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22409);
-- NOT FOUND: Gauntlets of Deftness (ilevel 63 entry 22410)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22410);
-- NOT FOUND: Helm of the Executioner (ilevel 63 entry 22411)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22411);
-- NOT FOUND: Thuzadin Mantle (ilevel 63 entry 22412)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22412);
-- NOT FOUND: Dreadnaught Breastplate (ilevel 92 entry 22416)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22416);
-- NOT FOUND: Dreadnaught Legplates (ilevel 88 entry 22417)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22417);
-- NOT FOUND: Dreadnaught Helmet (ilevel 88 entry 22418)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22418);
-- NOT FOUND: Dreadnaught Pauldrons (ilevel 86 entry 22419)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22419);
-- NOT FOUND: Dreadnaught Sabatons (ilevel 86 entry 22420)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22420);
-- NOT FOUND: Dreadnaught Gauntlets (ilevel 88 entry 22421)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22421);
-- NOT FOUND: Dreadnaught Waistguard (ilevel 88 entry 22422)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22422);
-- NOT FOUND: Dreadnaught Bracers (ilevel 88 entry 22423)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22423);
-- NOT FOUND: Redemption Wristguards (ilevel 88 entry 22424)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22424);
-- NOT FOUND: Redemption Tunic (ilevel 92 entry 22425)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22425);
-- NOT FOUND: Redemption Handguards (ilevel 88 entry 22426)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22426);
-- NOT FOUND: Redemption Legguards (ilevel 88 entry 22427)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22427);
-- NOT FOUND: Redemption Headpiece (ilevel 88 entry 22428)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22428);
-- NOT FOUND: Redemption Spaulders (ilevel 86 entry 22429)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22429);
-- NOT FOUND: Redemption Boots (ilevel 86 entry 22430)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22430);
-- NOT FOUND: Redemption Girdle (ilevel 88 entry 22431)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22431);
-- NOT FOUND: Don Mauricio's Band of Domination (ilevel 63 entry 22433)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22433);
-- NOT FOUND: Cryptstalker Tunic (ilevel 92 entry 22436)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22436);
-- NOT FOUND: Cryptstalker Legguards (ilevel 88 entry 22437)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22437);
-- NOT FOUND: Cryptstalker Headpiece (ilevel 88 entry 22438)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22438);
-- NOT FOUND: Cryptstalker Spaulders (ilevel 86 entry 22439)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22439);
-- NOT FOUND: Cryptstalker Boots (ilevel 86 entry 22440)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22440);
-- NOT FOUND: Cryptstalker Handguards (ilevel 88 entry 22441)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22441);
-- NOT FOUND: Cryptstalker Girdle (ilevel 88 entry 22442)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22442);
-- NOT FOUND: Cryptstalker Wristguards (ilevel 88 entry 22443)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22443);
-- NOT FOUND: Moonshadow Stave (ilevel 52 entry 22458)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22458);
-- NOT FOUND: Earthshatter Tunic (ilevel 92 entry 22464)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22464);
-- NOT FOUND: Earthshatter Legguards (ilevel 88 entry 22465)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22465);
-- NOT FOUND: Earthshatter Headpiece (ilevel 88 entry 22466)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22466);
-- NOT FOUND: Earthshatter Spaulders (ilevel 86 entry 22467)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22467);
-- NOT FOUND: Earthshatter Boots (ilevel 86 entry 22468)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22468);
-- NOT FOUND: Earthshatter Handguards (ilevel 88 entry 22469)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22469);
-- NOT FOUND: Earthshatter Girdle (ilevel 88 entry 22470)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22470);
-- NOT FOUND: Earthshatter Wristguards (ilevel 88 entry 22471)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22471);
-- NOT FOUND: Boots of Ferocity (ilevel 61 entry 22472)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22472);
-- NOT FOUND: Bonescythe Breastplate (ilevel 92 entry 22476)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22476);
-- NOT FOUND: Bonescythe Legplates (ilevel 88 entry 22477)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22477);
-- NOT FOUND: Bonescythe Helmet (ilevel 88 entry 22478)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22478);
-- NOT FOUND: Bonescythe Pauldrons (ilevel 86 entry 22479)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22479);
-- NOT FOUND: Bonescythe Sabatons (ilevel 86 entry 22480)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22480);
-- NOT FOUND: Bonescythe Gauntlets (ilevel 88 entry 22481)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22481);
-- NOT FOUND: Bonescythe Waistguard (ilevel 88 entry 22482)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22482);
-- NOT FOUND: Bonescythe Bracers (ilevel 88 entry 22483)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22483);
-- NOT FOUND: Dreamwalker Tunic (ilevel 92 entry 22488)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22488);
-- NOT FOUND: Dreamwalker Legguards (ilevel 88 entry 22489)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22489);
-- NOT FOUND: Dreamwalker Headpiece (ilevel 88 entry 22490)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22490);
-- NOT FOUND: Dreamwalker Spaulders (ilevel 86 entry 22491)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22491);
-- NOT FOUND: Dreamwalker Boots (ilevel 86 entry 22492)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22492);
-- NOT FOUND: Dreamwalker Handguards (ilevel 88 entry 22493)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22493);
-- NOT FOUND: Dreamwalker Girdle (ilevel 88 entry 22494)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22494);
-- NOT FOUND: Dreamwalker Wristguards (ilevel 88 entry 22495)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22495);
-- NOT FOUND: Frostfire Robe (ilevel 92 entry 22496)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22496);
-- NOT FOUND: Frostfire Leggings (ilevel 88 entry 22497)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22497);
-- NOT FOUND: Frostfire Circlet (ilevel 88 entry 22498)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22498);
-- NOT FOUND: Frostfire Shoulderpads (ilevel 86 entry 22499)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22499);
-- NOT FOUND: Frostfire Sandals (ilevel 86 entry 22500)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22500);
-- NOT FOUND: Frostfire Gloves (ilevel 88 entry 22501)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22501);
-- NOT FOUND: Frostfire Belt (ilevel 88 entry 22502)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22502);
-- NOT FOUND: Frostfire Bindings (ilevel 88 entry 22503)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22503);
-- NOT FOUND: Plagueheart Robe (ilevel 92 entry 22504)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22504);
-- NOT FOUND: Plagueheart Leggings (ilevel 88 entry 22505)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22505);
-- NOT FOUND: Plagueheart Circlet (ilevel 88 entry 22506)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22506);
-- NOT FOUND: Plagueheart Shoulderpads (ilevel 86 entry 22507)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22507);
-- NOT FOUND: Plagueheart Sandals (ilevel 86 entry 22508)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22508);
-- NOT FOUND: Plagueheart Gloves (ilevel 88 entry 22509)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22509);
-- NOT FOUND: Plagueheart Belt (ilevel 88 entry 22510)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22510);
-- NOT FOUND: Plagueheart Bindings (ilevel 88 entry 22511)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22511);
-- NOT FOUND: Robe of Faith (ilevel 92 entry 22512)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22512);
-- NOT FOUND: Leggings of Faith (ilevel 88 entry 22513)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22513);
-- NOT FOUND: Circlet of Faith (ilevel 88 entry 22514)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22514);
-- NOT FOUND: Shoulderpads of Faith (ilevel 86 entry 22515)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22515);
-- NOT FOUND: Sandals of Faith (ilevel 86 entry 22516)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22516);
-- NOT FOUND: Gloves of Faith (ilevel 88 entry 22517)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22517);
-- NOT FOUND: Belt of Faith (ilevel 88 entry 22518)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22518);
-- NOT FOUND: Bindings of Faith (ilevel 88 entry 22519)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22519);
-- NOT FOUND: Atiesh, Greatstaff of the Guardian (ilevel 90 entry 22589)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22589);
-- NOT FOUND: Atiesh, Greatstaff of the Guardian (ilevel 90 entry 22630)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22630);
-- NOT FOUND: Atiesh, Greatstaff of the Guardian (ilevel 90 entry 22631)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22631);
-- NOT FOUND: Atiesh, Greatstaff of the Guardian (ilevel 90 entry 22632)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22632);
-- NOT FOUND: Outrider's Plate Legguards (ilevel 65 entry 22651)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22651);
-- NOT FOUND: Glacial Vest (ilevel 80 entry 22652)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22652);
-- NOT FOUND: Glacial Gloves (ilevel 80 entry 22654)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22654);
-- NOT FOUND: Glacial Wrists (ilevel 80 entry 22655)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22655);
-- NOT FOUND: The Purifier (ilevel 60 entry 22656)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22656);
-- NOT FOUND: Amulet of the Dawn (ilevel 60 entry 22657)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22657);
-- NOT FOUND: Glacial Cloak (ilevel 80 entry 22658)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22658);
-- NOT FOUND: Medallion of the Dawn (ilevel 60 entry 22659)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22659);
-- NOT FOUND: Gaea's Embrace (ilevel 70 entry 22660)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22660);
-- NOT FOUND: Polar Tunic (ilevel 80 entry 22661)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22661);
-- NOT FOUND: Polar Gloves (ilevel 80 entry 22662)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22662);
-- NOT FOUND: Polar Bracers (ilevel 80 entry 22663)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22663);
-- NOT FOUND: Icy Scale Breastplate (ilevel 80 entry 22664)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22664);
-- NOT FOUND: Icy Scale Bracers (ilevel 80 entry 22665)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22665);
-- NOT FOUND: Icy Scale Gauntlets (ilevel 80 entry 22666)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22666);
-- NOT FOUND: Bracers of Hope (ilevel 60 entry 22667)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22667);
-- NOT FOUND: Bracers of Subterfuge (ilevel 60 entry 22668)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22668);
-- NOT FOUND: Icebane Breastplate (ilevel 80 entry 22669)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22669);
-- NOT FOUND: Icebane Gauntlets (ilevel 80 entry 22670)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22670);
-- NOT FOUND: Icebane Bracers (ilevel 80 entry 22671)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22671);
-- NOT FOUND: Sentinel's Plate Legguards (ilevel 65 entry 22672)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22672);
-- NOT FOUND: Outrider's Chain Leggings (ilevel 65 entry 22673)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22673);
-- NOT FOUND: Outrider's Mail Leggings (ilevel 65 entry 22676)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22676);
-- NOT FOUND: Talisman of Ascendance (ilevel 60 entry 22678)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22678);
-- NOT FOUND: Band of Resolution (ilevel 66 entry 22680)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22680);
-- NOT FOUND: Band of Piety (ilevel 66 entry 22681)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22681);
-- NOT FOUND: Verimonde's Last Resort (ilevel 66 entry 22688)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22688);
-- NOT FOUND: Sanctified Leather Helm (ilevel 66 entry 22689)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22689);
-- NOT FOUND: Leggings of the Plague Hunter (ilevel 66 entry 22690)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22690);
-- NOT FOUND: Corrupted Ashbringer (ilevel 86 entry 22691)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22691);
-- NOT FOUND: Icebane Leggings (ilevel 80 entry 22699)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22699);
-- NOT FOUND: Glacial Leggings (ilevel 80 entry 22700)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22700);
-- NOT FOUND: Polar Leggings (ilevel 80 entry 22701)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22701);
-- NOT FOUND: Icy Scale Leggings (ilevel 80 entry 22702)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22702);
-- NOT FOUND: Ramaladni's Icy Grasp (ilevel 80 entry 22707)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22707);
-- NOT FOUND: Cloak of the Hakkari Worshipers (ilevel 68 entry 22711)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22711);
-- NOT FOUND: Might of the Tribe (ilevel 68 entry 22712)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22712);
-- NOT FOUND: Zulian Scepter of Rites (ilevel 68 entry 22713)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22713);
-- NOT FOUND: Sacrificial Gauntlets (ilevel 68 entry 22714)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22714);
-- NOT FOUND: Gloves of the Tormented (ilevel 68 entry 22715)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22715);
-- NOT FOUND: Belt of Untapped Power (ilevel 68 entry 22716)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22716);
-- NOT FOUND: Blooddrenched Mask (ilevel 68 entry 22718)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22718);
-- NOT FOUND: Zulian Headdress (ilevel 68 entry 22720)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22720);
-- NOT FOUND: Band of Servitude (ilevel 65 entry 22721)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22721);
-- NOT FOUND: Seal of the Gurubashi Berserker (ilevel 65 entry 22722)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22722);
-- NOT FOUND: Band of Cenarius (ilevel 70 entry 22725)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22725);
-- NOT FOUND: Eyestalk Waist Cord (ilevel 88 entry 22730)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22730);
-- NOT FOUND: Cloak of the Devoured (ilevel 88 entry 22731)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22731);
-- NOT FOUND: Mark of C'Thun (ilevel 88 entry 22732)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22732);
-- NOT FOUND: Andonisus, Reaper of Souls (ilevel 100 entry 22736)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22736);
-- NOT FOUND: Outrider's Leather Pants (ilevel 65 entry 22740)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22740);
-- NOT FOUND: Outrider's Lizardhide Pants (ilevel 65 entry 22741)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22741);
-- NOT FOUND: Bloodsail Shirt (ilevel 1 entry 22742)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22742);
-- NOT FOUND: Bloodsail Boots (ilevel 1 entry 22744)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22744);
-- NOT FOUND: Bloodsail Pants (ilevel 1 entry 22745)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22745);
-- NOT FOUND: Outrider's Silk Leggings (ilevel 65 entry 22747)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22747);
-- NOT FOUND: Sentinel's Chain Leggings (ilevel 65 entry 22748)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22748);
-- NOT FOUND: Sentinel's Leather Pants (ilevel 65 entry 22749)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22749);
-- NOT FOUND: Sentinel's Lizardhide Pants (ilevel 65 entry 22750)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22750);
-- NOT FOUND: Sentinel's Silk Leggings (ilevel 65 entry 22752)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22752);
-- NOT FOUND: Sentinel's Lamellar Legguards (ilevel 65 entry 22753)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22753);
-- NOT FOUND: Sylvan Vest (ilevel 70 entry 22756)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22756);
-- NOT FOUND: Sylvan Crown (ilevel 70 entry 22757)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22757);
-- NOT FOUND: Sylvan Shoulders (ilevel 70 entry 22758)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22758);
-- NOT FOUND: Bramblewood Helm (ilevel 70 entry 22759)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22759);
-- NOT FOUND: Bramblewood Boots (ilevel 70 entry 22760)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22760);
-- NOT FOUND: Bramblewood Belt (ilevel 70 entry 22761)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22761);
-- NOT FOUND: Ironvine Breastplate (ilevel 70 entry 22762)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22762);
-- NOT FOUND: Ironvine Gloves (ilevel 70 entry 22763)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22763);
-- NOT FOUND: Ironvine Belt (ilevel 70 entry 22764)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22764);
-- NOT FOUND: Might of Menethil (ilevel 89 entry 22798)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22798);
-- NOT FOUND: Soulseeker (ilevel 89 entry 22799)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22799);
-- NOT FOUND: Brimstone Staff (ilevel 83 entry 22800)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22800);
-- NOT FOUND: Spire of Twilight (ilevel 83 entry 22801)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22801);
-- NOT FOUND: Kingsfall (ilevel 89 entry 22802)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22802);
-- NOT FOUND: Midnight Haze (ilevel 81 entry 22803)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22803);
-- NOT FOUND: Maexxna's Fang (ilevel 83 entry 22804)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22804);
-- NOT FOUND: Widow's Remorse (ilevel 81 entry 22806)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22806);
-- NOT FOUND: Wraith Blade (ilevel 83 entry 22807)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22807);
-- NOT FOUND: The Castigator (ilevel 83 entry 22808)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22808);
-- NOT FOUND: Maul of the Redeemed Crusader (ilevel 83 entry 22809)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22809);
-- NOT FOUND: Toxin Injector (ilevel 81 entry 22810)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22810);
-- NOT FOUND: Soulstring (ilevel 83 entry 22811)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22811);
-- NOT FOUND: Nerubian Slavemaker (ilevel 89 entry 22812)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22812);
-- NOT FOUND: Claymore of Unholy Might (ilevel 81 entry 22813)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22813);
-- NOT FOUND: Severance (ilevel 81 entry 22815)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22815);
-- NOT FOUND: Hatchet of Sundered Bone (ilevel 83 entry 22816)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22816);
-- NOT FOUND: The Plague Bearer (ilevel 83 entry 22818)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22818);
-- NOT FOUND: Shield of Condemnation (ilevel 92 entry 22819)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22819);
-- NOT FOUND: Wand of Fates (ilevel 83 entry 22820)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22820);
-- NOT FOUND: Doomfinger (ilevel 92 entry 22821)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22821);
-- NOT FOUND: Blood Guard's Chain Greaves (ilevel 66 entry 22843)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22843);
-- NOT FOUND: Blood Guard's Dragonhide Treads (ilevel 66 entry 22852)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22852);
-- NOT FOUND: Blood Guard's Dreadweave Walkers (ilevel 66 entry 22855)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22855);
-- NOT FOUND: Blood Guard's Leather Walkers (ilevel 66 entry 22856)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22856);
-- NOT FOUND: Blood Guard's Mail Greaves (ilevel 66 entry 22857)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22857);
-- NOT FOUND: Blood Guard's Plate Greaves (ilevel 66 entry 22858)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22858);
-- NOT FOUND: Blood Guard's Satin Walkers (ilevel 66 entry 22859)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22859);
-- NOT FOUND: Blood Guard's Silk Walkers (ilevel 66 entry 22860)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22860);
-- NOT FOUND: Blood Guard's Chain Vices (ilevel 66 entry 22862)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22862);
-- NOT FOUND: Blood Guard's Dragonhide Grips (ilevel 66 entry 22863)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22863);
-- NOT FOUND: Blood Guard's Leather Grips (ilevel 66 entry 22864)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22864);
-- NOT FOUND: Blood Guard's Dreadweave Handwraps (ilevel 66 entry 22865)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22865);
-- NOT FOUND: Blood Guard's Mail Vices (ilevel 66 entry 22867)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22867);
-- NOT FOUND: Blood Guard's Plate Gauntlets (ilevel 66 entry 22868)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22868);
-- NOT FOUND: Blood Guard's Satin Handwraps (ilevel 66 entry 22869)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22869);
-- NOT FOUND: Blood Guard's Silk Handwraps (ilevel 66 entry 22870)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22870);
-- NOT FOUND: Legionnaire's Plate Hauberk (ilevel 68 entry 22872)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22872);
-- NOT FOUND: Legionnaire's Plate Leggings (ilevel 68 entry 22873)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22873);
-- NOT FOUND: Legionnaire's Chain Hauberk (ilevel 68 entry 22874)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22874);
-- NOT FOUND: Legionnaire's Chain Legguards (ilevel 68 entry 22875)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22875);
-- NOT FOUND: Legionnaire's Mail Hauberk (ilevel 68 entry 22876)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22876);
-- NOT FOUND: Legionnaire's Dragonhide Chestpiece (ilevel 68 entry 22877)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22877);
-- NOT FOUND: Legionnaire's Dragonhide Leggings (ilevel 68 entry 22878)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22878);
-- NOT FOUND: Legionnaire's Leather Chestpiece (ilevel 68 entry 22879)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22879);
-- NOT FOUND: Legionnaire's Leather Legguards (ilevel 68 entry 22880)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22880);
-- NOT FOUND: Legionnaire's Dreadweave Legguards (ilevel 68 entry 22881)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22881);
-- NOT FOUND: Legionnaire's Satin Legguards (ilevel 68 entry 22882)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22882);
-- NOT FOUND: Legionnaire's Silk Legguards (ilevel 68 entry 22883)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22883);
-- NOT FOUND: Legionnaire's Dreadweave Tunic (ilevel 68 entry 22884)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22884);
-- NOT FOUND: Legionnaire's Satin Tunic (ilevel 68 entry 22885)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22885);
-- NOT FOUND: Legionnaire's Silk Tunic (ilevel 68 entry 22886)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22886);
-- NOT FOUND: Legionnaire's Mail Legguards (ilevel 68 entry 22887)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22887);
-- NOT FOUND: Touch of Frost (ilevel 83 entry 22935)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22935);
-- NOT FOUND: Wristguards of Vengeance (ilevel 83 entry 22936)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22936);
-- NOT FOUND: Gem of Nerubis (ilevel 83 entry 22937)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22937);
-- NOT FOUND: Cryptfiend Silk Cloak (ilevel 83 entry 22938)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22938);
-- NOT FOUND: Band of Unanswered Prayers (ilevel 83 entry 22939)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22939);
-- NOT FOUND: Icebane Pauldrons (ilevel 83 entry 22940)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22940);
-- NOT FOUND: Polar Shoulder Pads (ilevel 83 entry 22941)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22941);
-- NOT FOUND: The Widow's Embrace (ilevel 81 entry 22942)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22942);
-- NOT FOUND: Malice Stone Pendant (ilevel 83 entry 22943)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22943);
-- NOT FOUND: Pendant of Forgotten Names (ilevel 85 entry 22947)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22947);
-- NOT FOUND: Kiss of the Spider (ilevel 85 entry 22954)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22954);
-- NOT FOUND: Cloak of Suturing (ilevel 83 entry 22960)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22960);
-- NOT FOUND: Band of Reanimation (ilevel 83 entry 22961)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22961);
-- NOT FOUND: Icy Scale Spaulders (ilevel 83 entry 22967)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22967);
-- NOT FOUND: Glacial Mantle (ilevel 83 entry 22968)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22968);
-- NOT FOUND: Gluth's Missing Collar (ilevel 83 entry 22981)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22981);
-- NOT FOUND: Rime Covered Mantle (ilevel 83 entry 22983)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22983);
-- NOT FOUND: The End of Dreams (ilevel 83 entry 22988)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22988);
-- NOT FOUND: Digested Hand of Power (ilevel 83 entry 22994)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 22994);
-- NOT FOUND: Plated Abomination Ribcage (ilevel 85 entry 23000)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23000);
-- NOT FOUND: Eye of Diminution (ilevel 85 entry 23001)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23001);
-- NOT FOUND: Idol of Longevity (ilevel 83 entry 23004)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23004);
-- NOT FOUND: Totem of Flowing Water (ilevel 83 entry 23005)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23005);
-- NOT FOUND: Libram of Light (ilevel 83 entry 23006)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23006);
-- NOT FOUND: Wand of the Whispering Dead (ilevel 83 entry 23009)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23009);
-- NOT FOUND: Iblis, Blade of the Fallen Seraph (ilevel 81 entry 23014)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23014);
-- NOT FOUND: Veil of Eclipse (ilevel 83 entry 23017)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23017);
-- NOT FOUND: Signet of the Fallen Defender (ilevel 83 entry 23018)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23018);
-- NOT FOUND: Icebane Helmet (ilevel 83 entry 23019)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23019);
-- NOT FOUND: Polar Helmet (ilevel 83 entry 23020)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23020);
-- NOT FOUND: The Soul Harvester's Bindings (ilevel 83 entry 23021)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23021);
-- NOT FOUND: Sadist's Collar (ilevel 83 entry 23023)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23023);
-- NOT FOUND: Seal of the Damned (ilevel 85 entry 23025)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23025);
-- NOT FOUND: Warmth of Forgiveness (ilevel 85 entry 23027)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23027);
-- NOT FOUND: Hailstone Band (ilevel 83 entry 23028)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23028);
-- NOT FOUND: Noth's Frigid Heart (ilevel 83 entry 23029)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23029);
-- NOT FOUND: Cloak of the Scourge (ilevel 83 entry 23030)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23030);
-- NOT FOUND: Band of the Inevitable (ilevel 83 entry 23031)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23031);
-- NOT FOUND: Glacial Headdress (ilevel 83 entry 23032)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23032);
-- NOT FOUND: Icy Scale Coif (ilevel 83 entry 23033)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23033);
-- NOT FOUND: Preceptor's Hat (ilevel 83 entry 23035)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23035);
-- NOT FOUND: Necklace of Necropsy (ilevel 83 entry 23036)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23036);
-- NOT FOUND: Ring of Spiritual Fervor (ilevel 85 entry 23037)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23037);
-- NOT FOUND: Band of Unnatural Forces (ilevel 85 entry 23038)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23038);
-- NOT FOUND: The Eye of Nerub (ilevel 83 entry 23039)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23039);
-- NOT FOUND: Glyph of Deflection (ilevel 90 entry 23040)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23040);
-- NOT FOUND: Slayer's Crest (ilevel 90 entry 23041)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23041);
-- NOT FOUND: Loatheb's Reflection (ilevel 85 entry 23042)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23042);
-- NOT FOUND: The Face of Death (ilevel 90 entry 23043)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23043);
-- NOT FOUND: Harbinger of Doom (ilevel 83 entry 23044)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23044);
-- NOT FOUND: Shroud of Dominion (ilevel 90 entry 23045)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23045);
-- NOT FOUND: The Restrained Essence of Sapphiron (ilevel 90 entry 23046)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23046);
-- NOT FOUND: Eye of the Dead (ilevel 90 entry 23047)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23047);
-- NOT FOUND: Sapphiron's Right Eye (ilevel 90 entry 23048)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23048);
-- NOT FOUND: Sapphiron's Left Eye (ilevel 90 entry 23049)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23049);
-- NOT FOUND: Cloak of the Necropolis (ilevel 90 entry 23050)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23050);
-- NOT FOUND: Glaive of the Defender (ilevel 86 entry 23051)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23051);
-- NOT FOUND: Stormrage's Talisman of Seething (ilevel 92 entry 23053)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23053);
-- NOT FOUND: Gressil, Dawn of Ruin (ilevel 89 entry 23054)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23054);
-- NOT FOUND: Hammer of the Twisting Nether (ilevel 89 entry 23056)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23056);
-- NOT FOUND: Gem of Trapped Innocents (ilevel 92 entry 23057)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23057);
-- NOT FOUND: Ring of the Dreadnaught (ilevel 92 entry 23059)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23059);
-- NOT FOUND: Bonescythe Ring (ilevel 92 entry 23060)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23060);
-- NOT FOUND: Ring of Faith (ilevel 92 entry 23061)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23061);
-- NOT FOUND: Frostfire Ring (ilevel 92 entry 23062)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23062);
-- NOT FOUND: Plagueheart Ring (ilevel 92 entry 23063)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23063);
-- NOT FOUND: Ring of The Dreamwalker (ilevel 92 entry 23064)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23064);
-- NOT FOUND: Ring of the Earthshatterer (ilevel 92 entry 23065)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23065);
-- NOT FOUND: Ring of Redemption (ilevel 92 entry 23066)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23066);
-- NOT FOUND: Ring of  the Cryptstalker (ilevel 92 entry 23067)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23067);
-- NOT FOUND: Legplates of Carnage (ilevel 83 entry 23068)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23068);
-- NOT FOUND: Necro-Knight's Garb (ilevel 85 entry 23069)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23069);
-- NOT FOUND: Leggings of Polarity (ilevel 85 entry 23070)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23070);
-- NOT FOUND: Leggings of Apocalypse (ilevel 83 entry 23071)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23071);
-- NOT FOUND: Boots of Displacement (ilevel 83 entry 23073)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23073);
-- NOT FOUND: Death's Bargain (ilevel 83 entry 23075)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23075);
-- NOT FOUND: Gauntlets of Undead Slaying (ilevel 63 entry 23078)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23078);
-- NOT FOUND: Handwraps of Undead Slaying (ilevel 63 entry 23081)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23081);
-- NOT FOUND: Handguards of Undead Slaying (ilevel 63 entry 23082)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23082);
-- NOT FOUND: Gloves of Undead Cleansing (ilevel 63 entry 23084)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23084);
-- NOT FOUND: Robe of Undead Cleansing (ilevel 63 entry 23085)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23085);
-- NOT FOUND: Breastplate of Undead Slaying (ilevel 63 entry 23087)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23087);
-- NOT FOUND: Chestguard of Undead Slaying (ilevel 63 entry 23088)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23088);
-- NOT FOUND: Tunic of Undead Slaying (ilevel 63 entry 23089)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23089);
-- NOT FOUND: Bracers of Undead Slaying (ilevel 63 entry 23090)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23090);
-- NOT FOUND: Bracers of Undead Cleansing (ilevel 63 entry 23091)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23091);
-- NOT FOUND: Wristguards of Undead Slaying (ilevel 63 entry 23092)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23092);
-- NOT FOUND: Wristwraps of Undead Slaying (ilevel 63 entry 23093)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23093);
-- NOT FOUND: Staff of Balzaphon (ilevel 60 entry 23124)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23124);
-- NOT FOUND: Chains of the Lich (ilevel 60 entry 23125)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23125);
-- NOT FOUND: Waistband of Balzaphon (ilevel 60 entry 23126)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23126);
-- NOT FOUND: Cloak of Revanchion (ilevel 63 entry 23127)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23127);
-- NOT FOUND: The Shadow's Grasp (ilevel 62 entry 23128)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23128);
-- NOT FOUND: Bracers of Mending (ilevel 62 entry 23129)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23129);
-- NOT FOUND: Lord Blackwood's Blade (ilevel 62 entry 23132)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23132);
-- NOT FOUND: Lord Blackwood's Buckler (ilevel 62 entry 23139)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23139);
-- NOT FOUND: Blackwood's Thigh (ilevel 62 entry 23156)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23156);
-- NOT FOUND: Scorn's Focal Dagger (ilevel 35 entry 23168)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23168);
-- NOT FOUND: Scorn's Icy Choker (ilevel 35 entry 23169)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23169);
-- NOT FOUND: The Frozen Clutch (ilevel 35 entry 23170)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23170);
-- NOT FOUND: The Axe of Severing (ilevel 25 entry 23171)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23171);
-- NOT FOUND: Abomination Skin Leggings (ilevel 25 entry 23173)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23173);
-- NOT FOUND: Lady Falther'ess' Finger (ilevel 41 entry 23177)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23177);
-- NOT FOUND: Mantle of Lady Falther'ess (ilevel 41 entry 23178)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23178);
-- NOT FOUND: Idol of the Moon (ilevel 65 entry 23197)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23197);
-- NOT FOUND: Idol of Brutality (ilevel 65 entry 23198)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23198);
-- NOT FOUND: Totem of the Storm (ilevel 65 entry 23199)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23199);
-- NOT FOUND: Totem of Sustaining (ilevel 65 entry 23200)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23200);
-- NOT FOUND: Libram of Divinity (ilevel 65 entry 23201)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23201);
-- NOT FOUND: Libram of Fervor (ilevel 65 entry 23203)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23203);
-- NOT FOUND: Mark of the Champion (ilevel 90 entry 23206)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23206);
-- NOT FOUND: Mark of the Champion (ilevel 90 entry 23207)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23207);
-- NOT FOUND: Girdle of the Mentor (ilevel 85 entry 23219)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23219);
-- NOT FOUND: Crystal Webbed Robe (ilevel 85 entry 23220)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23220);
-- NOT FOUND: Misplaced Servo Arm (ilevel 83 entry 23221)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23221);
-- NOT FOUND: Ghoul Skin Tunic (ilevel 83 entry 23226)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23226);
-- NOT FOUND: Ring of the Eternal Flame (ilevel 83 entry 23237)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23237);
-- NOT FOUND: Stygian Buckler (ilevel 83 entry 23238)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23238);
-- NOT FOUND: Claw of the Frost Wyrm (ilevel 88 entry 23242)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23242);
-- NOT FOUND: Champion's Plate Shoulders (ilevel 71 entry 23243)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23243);
-- NOT FOUND: Champion's Plate Helm (ilevel 71 entry 23244)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23244);
-- NOT FOUND: Champion's Chain Helm (ilevel 71 entry 23251)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23251);
-- NOT FOUND: Champion's Chain Shoulders (ilevel 71 entry 23252)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23252);
-- NOT FOUND: Champion's Dragonhide Headguard (ilevel 71 entry 23253)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23253);
-- NOT FOUND: Champion's Dragonhide Shoulders (ilevel 71 entry 23254)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23254);
-- NOT FOUND: Champion's Dreadweave Cowl (ilevel 71 entry 23255)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23255);
-- NOT FOUND: Champion's Dreadweave Spaulders (ilevel 71 entry 23256)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23256);
-- NOT FOUND: Champion's Leather Helm (ilevel 71 entry 23257)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23257);
-- NOT FOUND: Champion's Leather Shoulders (ilevel 71 entry 23258)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23258);
-- NOT FOUND: Champion's Mail Headguard (ilevel 71 entry 23259)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23259);
-- NOT FOUND: Champion's Mail Pauldrons (ilevel 71 entry 23260)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23260);
-- NOT FOUND: Champion's Satin Hood (ilevel 71 entry 23261)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23261);
-- NOT FOUND: Champion's Satin Mantle (ilevel 71 entry 23262)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23262);
-- NOT FOUND: Champion's Silk Cowl (ilevel 71 entry 23263)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23263);
-- NOT FOUND: Champion's Silk Mantle (ilevel 71 entry 23264)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23264);
-- NOT FOUND: Knight-Captain's Lamellar Breastplate (ilevel 68 entry 23272)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23272);
-- NOT FOUND: Knight-Captain's Lamellar Leggings (ilevel 68 entry 23273)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23273);
-- NOT FOUND: Knight-Lieutenant's Lamellar Gauntlets (ilevel 66 entry 23274)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23274);
-- NOT FOUND: Knight-Lieutenant's Lamellar Sabatons (ilevel 66 entry 23275)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23275);
-- NOT FOUND: Lieutenant Commander's Lamellar Headguard (ilevel 71 entry 23276)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23276);
-- NOT FOUND: Lieutenant Commander's Lamellar Shoulders (ilevel 71 entry 23277)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23277);
-- NOT FOUND: Knight-Lieutenant's Chain Greaves (ilevel 66 entry 23278)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23278);
-- NOT FOUND: Knight-Lieutenant's Chain Vices (ilevel 66 entry 23279)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23279);
-- NOT FOUND: Knight-Lieutenant's Dragonhide Grips (ilevel 66 entry 23280)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23280);
-- NOT FOUND: Knight-Lieutenant's Dragonhide Treads (ilevel 66 entry 23281)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23281);
-- NOT FOUND: Knight-Lieutenant's Dreadweave Handwraps (ilevel 66 entry 23282)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23282);
-- NOT FOUND: Knight-Lieutenant's Dreadweave Walkers (ilevel 66 entry 23283)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23283);
-- NOT FOUND: Knight-Lieutenant's Leather Grips (ilevel 66 entry 23284)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23284);
-- NOT FOUND: Knight-Lieutenant's Leather Walkers (ilevel 66 entry 23285)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23285);
-- NOT FOUND: Knight-Lieutenant's Plate Gauntlets (ilevel 66 entry 23286)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23286);
-- NOT FOUND: Knight-Lieutenant's Plate Greaves (ilevel 66 entry 23287)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23287);
-- NOT FOUND: Knight-Lieutenant's Satin Handwraps (ilevel 66 entry 23288)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23288);
-- NOT FOUND: Knight-Lieutenant's Satin Walkers (ilevel 66 entry 23289)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23289);
-- NOT FOUND: Knight-Lieutenant's Silk Handwraps (ilevel 66 entry 23290)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23290);
-- NOT FOUND: Knight-Lieutenant's Silk Walkers (ilevel 66 entry 23291)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23291);
-- NOT FOUND: Knight-Captain's Chain Hauberk (ilevel 68 entry 23292)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23292);
-- NOT FOUND: Knight-Captain's Chain Legguards (ilevel 68 entry 23293)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23293);
-- NOT FOUND: Knight-Captain's Dragonhide Chestpiece (ilevel 68 entry 23294)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23294);
-- NOT FOUND: Knight-Captain's Dragonhide Leggings (ilevel 68 entry 23295)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23295);
-- NOT FOUND: Knight-Captain's Dreadweave Legguards (ilevel 68 entry 23296)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23296);
-- NOT FOUND: Knight-Captain's Dreadweave Tunic (ilevel 68 entry 23297)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23297);
-- NOT FOUND: Knight-Captain's Leather Chestpiece (ilevel 68 entry 23298)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23298);
-- NOT FOUND: Knight-Captain's Leather Legguards (ilevel 68 entry 23299)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23299);
-- NOT FOUND: Knight-Captain's Plate Hauberk (ilevel 68 entry 23300)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23300);
-- NOT FOUND: Knight-Captain's Plate Leggings (ilevel 68 entry 23301)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23301);
-- NOT FOUND: Knight-Captain's Satin Legguards (ilevel 68 entry 23302)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23302);
-- NOT FOUND: Knight-Captain's Satin Tunic (ilevel 68 entry 23303)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23303);
-- NOT FOUND: Knight-Captain's Silk Legguards (ilevel 68 entry 23304)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23304);
-- NOT FOUND: Knight-Captain's Silk Tunic (ilevel 68 entry 23305)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23305);
-- NOT FOUND: Lieutenant Commander's Chain Helm (ilevel 71 entry 23306)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23306);
-- NOT FOUND: Lieutenant Commander's Chain Shoulders (ilevel 71 entry 23307)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23307);
-- NOT FOUND: Lieutenant Commander's Dragonhide Headguard (ilevel 71 entry 23308)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23308);
-- NOT FOUND: Lieutenant Commander's Dragonhide Shoulders (ilevel 71 entry 23309)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23309);
-- NOT FOUND: Lieutenant Commander's Dreadweave Cowl (ilevel 71 entry 23310)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23310);
-- NOT FOUND: Lieutenant Commander's Dreadweave Spaulders (ilevel 71 entry 23311)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23311);
-- NOT FOUND: Lieutenant Commander's Leather Helm (ilevel 71 entry 23312)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23312);
-- NOT FOUND: Lieutenant Commander's Leather Shoulders (ilevel 71 entry 23313)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23313);
-- NOT FOUND: Lieutenant Commander's Plate Helm (ilevel 71 entry 23314)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23314);
-- NOT FOUND: Lieutenant Commander's Plate Shoulders (ilevel 71 entry 23315)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23315);
-- NOT FOUND: Lieutenant Commander's Satin Hood (ilevel 71 entry 23316)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23316);
-- NOT FOUND: Lieutenant Commander's Satin Mantle (ilevel 71 entry 23317)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23317);
-- NOT FOUND: Lieutenant Commander's Silk Cowl (ilevel 71 entry 23318)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23318);
-- NOT FOUND: Lieutenant Commander's Silk Mantle (ilevel 71 entry 23319)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23319);
-- NOT FOUND: Crown of the Fire Festival (ilevel 1 entry 23323)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23323);
-- NOT FOUND: Mantle of the Fire Festival (ilevel 1 entry 23324)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23324);
-- NOT FOUND: Grand Marshal's Mageblade (ilevel 78 entry 23451)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23451);
-- NOT FOUND: Grand Marshal's Tome of Power (ilevel 78 entry 23452)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23452);
-- NOT FOUND: Grand Marshal's Tome of Restoration (ilevel 78 entry 23453)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23453);
-- NOT FOUND: Grand Marshal's Warhammer (ilevel 78 entry 23454)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23454);
-- NOT FOUND: Grand Marshal's Demolisher (ilevel 78 entry 23455)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23455);
-- NOT FOUND: Grand Marshal's Swiftblade (ilevel 78 entry 23456)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23456);
-- NOT FOUND: High Warlord's Battle Mace (ilevel 78 entry 23464)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23464);
-- NOT FOUND: High Warlord's Destroyer (ilevel 78 entry 23465)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23465);
-- NOT FOUND: High Warlord's Spellblade (ilevel 78 entry 23466)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23466);
-- NOT FOUND: High Warlord's Quickblade (ilevel 78 entry 23467)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23467);
-- NOT FOUND: High Warlord's Tome of Destruction (ilevel 78 entry 23468)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23468);
-- NOT FOUND: High Warlord's Tome of Mending (ilevel 78 entry 23469)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23469);
-- NOT FOUND: Larvae of the Great Worm (ilevel 81 entry 23557)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23557);
-- NOT FOUND: The Burrower's Shell (ilevel 81 entry 23558)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23558);
-- NOT FOUND: Jom Gabbar (ilevel 81 entry 23570)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23570);
-- NOT FOUND: The Hungering Cold (ilevel 89 entry 23577)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23577);
-- NOT FOUND: Girdle of Elemental Fury (ilevel 85 entry 23663)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23663);
-- NOT FOUND: Pauldrons of Elemental Fury (ilevel 85 entry 23664)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23664);
-- NOT FOUND: Leggings of Elemental Fury (ilevel 85 entry 23665)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23665);
-- NOT FOUND: Belt of the Grand Crusader (ilevel 85 entry 23666)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23666);
-- NOT FOUND: Spaulders of the Grand Crusader (ilevel 85 entry 23667)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23667);
-- NOT FOUND: Leggings of the Grand Crusader (ilevel 85 entry 23668)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 23668);
-- NOT FOUND: The Shadowfoot Stabber (ilevel 57 entry 24222)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 24222);

-- Flarecore Gloves are Soulbound https://github.com/elysium-project/itemization/issues/13
UPDATE `item_template` SET `bonding` = 1 WHERE `entry` = 16979;

-- Nerfed PvP Weapons
REPLACE INTO `item_template` VALUE (18877,2,8,'High Warlord\'s Greatsword',31998,4,32768,1,301699,60339,17,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,36,4,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,196,295,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3800,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,1,1,0,0,0,120,0,0,0,'',0,0,0,0,0,0,1),(18873,2,10,'Grand Marshal\'s Stave',31764,4,32768,1,297299,59459,17,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,36,5,20,6,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,125,203,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3000,0,0,17493,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,2,2,0,0,0,120,0,0,0,'',0,0,0,0,0,0,1),(18871,2,6,'High Warlord\'s Pig Sticker',31766,4,32768,1,295085,59017,17,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,36,4,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,196,295,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3800,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,1,2,0,0,0,120,0,0,0,'',0,0,0,0,0,0,1),(18869,2,6,'Grand Marshal\'s Glaive',31761,4,32768,1,284969,56993,17,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,36,4,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,196,295,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3800,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,1,2,0,0,0,120,0,0,0,'',0,0,0,0,0,0,1),(18868,2,5,'High Warlord\'s Pulverizer',31750,4,32768,1,313819,62763,17,-1,-1,78,60,0,0,199,18,0,0,0,0,1,0,7,36,4,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,196,295,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3800,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,2,1,0,0,0,120,0,0,0,'',0,0,0,0,0,0,1),(18866,2,4,'High Warlord\'s Bludgeon',31751,4,32768,1,249308,49861,13,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,115,173,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2900,0,0,7597,1,0,0,-1,0,-1,9141,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,2,3,0,0,0,105,0,0,0,'',0,0,0,0,0,0,1),(18860,2,3,'High Warlord\'s Street Sweeper',31747,4,32768,1,183012,36602,26,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,90,135,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2900,3,100,21436,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,-1,1,'',0,0,0,0,0,1,0,0,0,0,90,0,0,0,'',0,0,0,0,0,0,1),(18833,2,2,'Grand Marshal\'s Bullseye',31759,4,32768,1,173657,34731,15,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,55,84,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1800,2,100,21436,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,-1,1,'',0,0,0,0,0,2,0,0,0,0,90,0,0,0,'',0,0,0,0,0,0,1),(18855,2,3,'Grand Marshal\'s Hand Cannon',31758,4,32768,1,179726,35945,26,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,90,135,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2900,3,100,21436,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,-1,1,'',0,0,0,0,0,1,0,0,0,0,90,0,0,0,'',0,0,0,0,0,0,1),(18847,2,13,'Grand Marshal\'s Left Hand Blade',32032,4,32768,1,250218,50043,22,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,115,173,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2900,0,0,7597,1,0,0,-1,0,-1,9141,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,1,7,0,0,0,75,0,0,0,'',0,0,0,0,0,0,1),(18840,2,15,'High Warlord\'s Razor',31381,4,32768,1,244064,48812,13,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,79,120,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2000,0,0,7597,1,0,0,-1,0,-1,9141,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,1,3,0,0,0,75,0,0,0,'',0,0,0,0,0,0,1),(18838,2,15,'Grand Marshal\'s Dirk',31379,4,32768,1,242293,48458,13,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,79,120,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2000,0,0,7597,1,0,0,-1,0,-1,9141,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,1,3,0,0,0,75,0,0,0,'',0,0,0,0,0,0,1),(18837,2,18,'High Warlord\'s Crossbow',31749,4,32768,1,176297,35259,26,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,90,135,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2900,2,100,21436,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,-1,1,'',0,0,0,0,0,2,0,0,0,0,90,0,0,0,'',0,0,0,0,0,0,1),(18836,2,18,'Grand Marshal\'s Repeater',31757,4,32768,1,175650,35130,26,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,90,135,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2900,2,100,21436,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,-1,1,'',0,0,0,0,0,2,0,0,0,0,90,0,0,0,'',0,0,0,0,0,0,1),(18835,2,2,'High Warlord\'s Recurve',31748,4,32768,1,174986,34997,15,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,55,84,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1800,2,100,21436,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,-1,1,'',0,0,0,0,0,2,0,0,0,0,90,0,0,0,'',0,0,0,0,0,0,1),(18848,2,13,'High Warlord\'s Left Claw',31752,4,32768,1,251079,50215,22,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,115,173,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2900,0,0,7597,1,0,0,-1,0,-1,9141,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,1,7,0,0,0,75,0,0,0,'',0,0,0,0,0,0,1),(18831,2,1,'High Warlord\'s Battle Axe',31958,4,32768,1,287244,57448,17,-1,-1,78,60,0,0,197,18,0,0,0,0,1,0,7,36,4,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,196,295,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3800,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,1,1,0,0,0,120,0,0,0,'',0,0,0,0,0,0,1),(18830,2,1,'Grand Marshal\'s Sunderer',31302,4,32768,1,286137,57227,17,-1,-1,78,60,0,0,197,18,0,0,0,0,1,0,7,36,4,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,196,295,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3800,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,1,1,0,0,0,120,0,0,0,'',0,0,0,0,0,0,1),(18828,2,0,'High Warlord\'s Cleaver',31957,4,32768,1,251127,50225,13,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,115,173,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2900,0,0,7597,1,0,0,-1,0,-1,9141,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,1,3,0,0,0,105,0,0,0,'',0,0,0,0,0,0,1),(16345,2,7,'High Warlord\'s Blade',31997,4,32768,1,247416,49483,13,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,115,173,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2900,0,0,7597,1,0,0,-1,0,-1,9141,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,1,3,0,0,0,105,0,0,0,'',0,0,0,0,0,0,1),(18827,2,0,'Grand Marshal\'s Handaxe',31956,4,32768,1,250241,50048,13,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,115,173,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2900,0,0,7597,1,0,0,-1,0,-1,9141,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,1,3,0,0,0,105,0,0,0,'',0,0,0,0,0,0,1),(18843,2,13,'Grand Marshal\'s Right Hand Blade',32033,4,32768,1,246698,49339,21,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,115,173,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2900,0,0,7597,1,0,0,-1,0,-1,9141,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,1,7,0,0,0,75,0,0,0,'',0,0,0,0,0,0,1),(18865,2,4,'Grand Marshal\'s Punisher',31955,4,32768,1,248422,49684,13,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,115,173,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2900,0,0,7597,1,0,0,-1,0,-1,9141,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,2,3,0,0,0,105,0,0,0,'',0,0,0,0,0,0,1),(18867,2,5,'Grand Marshal\'s Battle Hammer',31954,4,32768,1,312712,62542,17,-1,-1,78,60,0,0,199,18,0,0,0,0,1,0,7,36,4,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,196,295,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3800,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,2,1,0,0,0,120,0,0,0,'',0,0,0,0,0,0,1),(18876,2,8,'Grand Marshal\'s Claymore',31996,4,32768,1,300592,60118,17,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,36,4,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,196,295,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3800,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,1,1,0,0,0,120,0,0,0,'',0,0,0,0,0,0,1),(18874,2,10,'High Warlord\'s War Staff',31765,4,32768,1,298407,59681,17,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,36,5,20,6,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,125,203,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3000,0,0,17493,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,2,2,0,0,0,120,0,0,0,'',0,0,0,0,0,0,1),(12584,2,7,'Grand Marshal\'s Longsword',31966,4,32768,1,248182,49636,13,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,115,173,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2900,0,0,7597,1,0,0,-1,0,-1,9141,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,1,3,0,0,0,105,0,0,0,'',0,0,0,0,0,0,1),(18844,2,13,'High Warlord\'s Right Claw',31754,4,32768,1,247584,49516,21,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,115,173,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2900,0,0,7597,1,0,0,-1,0,-1,9141,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,1,7,0,0,0,75,0,0,0,'',0,0,0,0,0,0,1);
-- Nerfed PvP Gear
REPLACE INTO `item_template` VALUE (15197,4,0,'Scout\'s Tabard',31255,1,0,1,10000,2500,19,-1,-1,20,0,0,0,0,5,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(15200,4,0,'Senior Sergeant\'s Insignia',30797,3,32768,1,20000,5000,2,-1,-1,35,30,0,0,0,8,0,0,0,1,1,0,7,4,6,4,5,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(16341,4,1,'Sergeant\'s Cloak',27088,3,32768,1,21425,4285,16,-1,-1,50,45,0,0,0,7,0,0,0,1,1,0,7,14,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,96,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(16342,4,1,'Sergeant\'s Cape',27087,3,32768,1,44154,8830,16,-1,-1,63,58,0,0,0,7,0,0,0,1,1,0,7,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,115,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(16486,4,1,'First Sergeant\'s Silk Cuffs',27255,3,32768,1,28477,5695,9,400,-1,63,58,0,0,0,9,0,0,0,1,1,0,7,17,5,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,39,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,0,30,0,0,0,'',0,0,0,0,0,0,1),(16497,4,2,'First Sergeant\'s Leather Armguards',30801,3,32768,1,34402,6880,9,8,-1,63,58,0,0,0,9,0,0,0,1,1,0,7,17,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,77,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,0,35,0,0,0,'',0,0,0,0,0,0,1),(16532,4,3,'First Sergeant\'s Mail Wristguards',27277,3,32768,1,44802,8960,9,68,-1,63,58,0,0,0,9,0,0,0,1,1,0,7,17,5,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,162,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,0,40,0,0,0,'',0,0,0,0,0,0,1),(18429,4,4,'First Sergeant\'s Plate Bracers',27273,3,32768,1,29447,5889,9,1,-1,63,58,0,0,0,9,0,0,0,1,1,0,7,17,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,287,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,0,45,0,0,0,'',0,0,0,0,0,0,1),(18434,4,2,'First Sergeant\'s Dragonhide Armguards',27262,3,32768,1,37468,7493,9,1024,-1,63,58,0,0,0,9,0,0,0,1,1,0,7,17,5,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,77,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,0,35,0,0,0,'',0,0,0,0,0,0,1),(18435,4,2,'First Sergeant\'s Leather Armguards',30801,3,32768,1,18311,3662,9,8,-1,50,45,0,0,0,9,0,0,0,1,1,0,7,14,3,0,5,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,0,35,0,0,0,'',0,0,0,0,0,0,1),(18440,4,1,'Sergeant\'s Cape',27087,3,32768,1,6443,1288,16,-1,-1,35,30,0,0,0,7,0,0,0,1,1,0,7,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,66,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18441,4,1,'Sergeant\'s Cape',27087,3,32768,1,20891,4178,16,-1,-1,50,45,0,0,0,7,0,0,0,1,1,0,7,14,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,96,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18442,4,0,'Master Sergeant\'s Insignia',30799,3,32768,1,20000,5000,2,-1,-1,35,30,0,0,0,8,0,0,0,1,1,0,7,9,6,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18443,4,0,'Master Sergeant\'s Insignia',30799,3,32768,1,40000,10000,2,-1,-1,63,58,0,0,0,8,0,0,0,1,1,0,7,17,6,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18444,4,0,'Master Sergeant\'s Insignia',30799,3,32768,1,30000,7500,2,-1,-1,50,45,0,0,0,8,0,0,0,1,1,0,7,14,6,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18445,4,4,'Sergeant Major\'s Plate Wristguards',27223,3,32768,1,29021,5804,9,3,-1,63,58,0,0,0,9,0,0,0,1,1,0,7,17,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,287,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,0,45,0,0,0,'',0,0,0,0,0,0,1),(18447,4,4,'Sergeant Major\'s Plate Wristguards',27223,3,32768,1,14235,2847,9,3,-1,50,45,0,0,0,9,0,0,0,1,1,0,7,14,4,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,231,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,0,45,0,0,0,'',0,0,0,0,0,0,1),(18449,4,3,'Sergeant Major\'s Chain Armguards',31248,3,32768,1,21507,4301,9,4,-1,50,45,0,0,0,9,0,0,0,1,1,0,7,14,5,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,131,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,0,40,0,0,0,'',0,0,0,0,0,0,1),(18453,4,2,'Sergeant Major\'s Leather Armsplints',30804,3,32768,1,16890,3378,9,8,-1,50,45,0,0,0,9,0,0,0,1,1,0,7,14,3,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,0,35,0,0,0,'',0,0,0,0,0,0,1),(18455,4,2,'Sergeant Major\'s Dragonhide Armsplints',30805,3,32768,1,17020,3404,9,1024,-1,50,45,0,0,0,9,0,0,0,1,1,0,7,14,5,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,0,35,0,0,0,'',0,0,0,0,0,0,1),(18456,4,1,'Sergeant Major\'s Silk Cuffs',30806,3,32768,1,28065,5613,9,400,-1,63,58,0,0,0,9,0,0,0,1,1,0,7,18,5,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,39,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,0,30,0,0,0,'',0,0,0,0,0,0,1),(18457,4,1,'Sergeant Major\'s Silk Cuffs',30806,3,32768,1,13373,2674,9,400,-1,50,45,0,0,0,9,0,0,0,1,1,0,7,14,5,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,31,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,0,30,0,0,0,'',0,0,0,0,0,0,1),(18461,4,1,'Sergeant\'s Cloak',27088,3,32768,1,42888,8577,16,-1,-1,63,58,0,0,0,7,0,0,0,1,1,0,7,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,115,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(22859,4,1,'Blood Guard\'s Satin Walkers',31027,3,32768,1,47684,9536,8,16,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,17,5,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,9343,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,540,40,0,0,0,'',0,0,0,0,0,0,1),(16496,4,2,'Blood Guard\'s Dragonhide Gauntlets',27265,3,32768,1,34268,6853,10,1024,-1,63,58,0,0,0,11,0,0,0,1,1,0,4,12,3,12,7,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,110,0,0,0,0,0,0,0,0,0,23217,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,382,35,0,0,0,'',0,0,0,0,0,0,1),(23305,4,1,'Knight-Captain\'s Silk Tunic',36024,3,32768,1,76291,15258,20,128,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,18,5,17,6,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,156,0,0,0,0,0,0,0,0,0,18384,1,0,0,-1,0,-1,14248,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,546,80,0,0,0,'',0,0,0,0,0,0,1),(23304,4,1,'Knight-Captain\'s Silk Legguards',36022,3,32768,1,76019,15203,7,128,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,18,5,17,6,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,144,0,0,0,0,0,0,0,0,0,14248,1,0,0,-1,0,-1,18384,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,546,65,0,0,0,'',0,0,0,0,0,0,1),(23317,4,1,'Lieutenant Commander\'s Satin Mantle',36038,3,32768,1,64355,12871,3,16,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,14,5,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,115,0,0,0,0,0,0,0,0,0,9345,1,0,0,-1,0,-1,21626,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,549,50,0,0,0,'',0,0,0,0,0,0,1),(23316,4,1,'Lieutenant Commander\'s Satin Hood',36042,3,32768,1,64119,12823,1,16,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,20,5,18,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,131,0,0,0,0,0,0,0,0,0,14248,1,0,0,-1,0,-1,21626,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,549,50,0,0,0,'',0,0,0,0,0,0,1),(23315,4,4,'Lieutenant Commander\'s Plate Shoulders',35811,3,32768,1,63883,12776,3,1,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,18,4,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,552,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,545,80,0,0,0,'',0,0,0,0,0,0,1),(23314,4,4,'Lieutenant Commander\'s Plate Helm',35810,3,32768,1,63647,12729,1,1,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,24,4,21,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,598,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,545,80,0,0,0,'',0,0,0,0,0,0,1),(23313,4,2,'Lieutenant Commander\'s Leather Shoulders',36044,3,32768,1,79271,15854,3,8,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,196,0,0,0,0,0,0,0,0,0,9332,1,0,0,-1,0,-1,7597,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,548,60,0,0,0,'',0,0,0,0,0,0,1),(23312,4,2,'Lieutenant Commander\'s Leather Helm',36043,3,32768,1,78976,15795,1,8,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,23,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,238,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,14089,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,548,60,0,0,0,'',0,0,0,0,0,0,1),(23311,4,1,'Lieutenant Commander\'s Dreadweave Spaulders',36027,3,32768,1,62945,12589,3,256,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,17,5,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0,0,0,9417,1,0,0,-1,0,-1,18384,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,547,50,0,0,0,'',0,0,0,0,0,0,1),(23310,4,1,'Lieutenant Commander\'s Dreadweave Cowl',36040,3,32768,1,62709,12541,1,256,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,21,5,18,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,81,0,0,0,0,0,0,0,0,0,14248,1,0,0,-1,0,-1,18384,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,547,50,0,0,0,'',0,0,0,0,0,0,1),(23308,4,2,'Lieutenant Commander\'s Dragonhide Headguard',35806,3,32768,1,77804,15560,1,1024,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,16,3,12,4,16,5,16,6,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,198,0,0,0,0,0,0,0,0,0,9346,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,551,60,0,0,0,'',0,0,0,0,0,0,1),(23290,4,1,'Knight-Lieutenant\'s Silk Handwraps',36013,3,32768,1,32762,6552,10,128,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,12,5,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,98,0,0,0,0,0,0,0,0,0,23037,1,0,0,-1,0,-1,9346,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,546,30,0,0,0,'',0,0,0,0,0,0,1),(23303,4,1,'Knight-Captain\'s Satin Tunic',36021,3,32768,1,75747,15149,20,16,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,19,5,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,156,0,0,0,0,0,0,0,0,0,14248,1,0,0,-1,0,-1,21626,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,549,80,0,0,0,'',0,0,0,0,0,0,1),(23302,4,1,'Knight-Captain\'s Satin Legguards',36018,3,32768,1,75483,15096,7,16,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,19,5,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,144,0,0,0,0,0,0,0,0,0,14248,1,0,0,-1,0,-1,21626,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,549,65,0,0,0,'',0,0,0,0,0,0,1),(23301,4,4,'Knight-Captain\'s Plate Leggings',35809,3,32768,1,75211,15042,7,1,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,17,4,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,618,0,0,0,0,0,0,0,0,0,7598,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,545,100,0,0,0,'',0,0,0,0,0,0,1),(23300,4,4,'Knight-Captain\'s Plate Hauberk',31083,3,32768,1,74939,14987,5,1,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,23,4,21,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,706,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,545,135,0,0,0,'',0,0,0,0,0,0,1),(23299,4,2,'Knight-Captain\'s Leather Legguards',36014,3,32768,1,93334,18666,7,8,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,22,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,225,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,15806,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,548,75,0,0,0,'',0,0,0,0,0,0,1),(23298,4,2,'Knight-Captain\'s Leather Chestpiece',36015,3,32768,1,93003,18600,5,8,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,22,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,248,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,15806,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,548,100,0,0,0,'',0,0,0,0,0,0,1),(23297,4,1,'Knight-Captain\'s Dreadweave Tunic',36017,3,32768,1,74130,14826,20,256,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,20,5,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,96,0,0,0,0,0,0,0,0,0,15715,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,547,80,0,0,0,'',0,0,0,0,0,0,1),(23296,4,1,'Knight-Captain\'s Dreadweave Legguards',30385,3,32768,1,73859,14771,7,256,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,21,5,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,84,0,0,0,0,0,0,0,0,0,14127,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,547,65,0,0,0,'',0,0,0,0,0,0,1),(23294,4,2,'Knight-Captain\'s Dragonhide Chestpiece',35805,3,32768,1,91653,18330,5,1024,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,13,4,13,3,12,5,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,218,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,9344,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,551,100,0,0,0,'',0,0,0,0,0,0,1),(23280,4,2,'Knight-Lieutenant\'s Dragonhide Grips',36003,3,32768,1,42486,8497,10,1024,-1,66,60,0,0,0,11,0,0,0,1,1,0,4,13,3,10,7,12,5,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,115,0,0,0,0,0,0,0,0,0,23217,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,551,35,0,0,0,'',0,0,0,0,0,0,1),(23293,4,3,'Knight-Captain\'s Chain Legguards',35800,3,32768,1,109575,21915,7,4,-1,68,60,0,0,0,12,0,0,0,1,1,0,3,16,7,13,5,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,348,0,0,0,0,0,0,0,0,0,7598,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,550,90,0,0,0,'',0,0,0,0,0,0,1),(23292,4,3,'Knight-Captain\'s Chain Hauberk',35799,3,32768,1,109168,21833,5,4,-1,68,60,0,0,0,12,0,0,0,1,1,0,3,16,7,13,5,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,398,0,0,0,0,0,0,0,0,0,7598,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,550,120,0,0,0,'',0,0,0,0,0,0,1),(23319,4,1,'Lieutenant Commander\'s Silk Mantle',27231,3,32768,1,64821,12964,3,128,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,14,5,11,6,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,135,0,0,0,0,0,0,0,0,0,9344,1,0,0,-1,0,-1,18384,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,546,50,0,0,0,'',0,0,0,0,0,0,1),(23318,4,1,'Lieutenant Commander\'s Silk Cowl',36041,3,32768,1,64585,12917,1,128,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,19,5,18,6,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,141,0,0,0,0,0,0,0,0,0,18384,1,0,0,-1,0,-1,14248,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,546,50,0,0,0,'',0,0,0,0,0,0,1),(23289,4,1,'Knight-Lieutenant\'s Satin Walkers',36008,3,32768,1,47634,9526,8,16,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,17,5,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,9343,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,549,40,0,0,0,'',0,0,0,0,0,0,1),(23288,4,1,'Knight-Lieutenant\'s Satin Handwraps',36010,3,32768,1,34969,6993,10,16,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,12,5,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,98,0,0,0,0,0,0,0,0,0,23043,1,0,0,-1,0,-1,14248,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,549,30,0,0,0,'',0,0,0,0,0,0,1),(23287,4,4,'Knight-Lieutenant\'s Plate Greaves',26752,3,32768,1,52274,10454,8,1,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,23,4,10,3,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,472,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,545,65,0,0,0,'',0,0,0,0,0,0,1),(23286,4,4,'Knight-Lieutenant\'s Plate Gauntlets',35808,3,32768,1,34726,6945,10,1,-1,66,60,0,0,0,11,0,0,0,1,1,0,4,17,7,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,429,0,0,0,0,0,0,0,0,0,22778,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,545,45,0,0,0,'',0,0,0,0,0,0,1),(23285,4,2,'Knight-Lieutenant\'s Leather Walkers',31068,3,32768,1,64880,12976,8,8,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,18,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,166,0,0,0,0,0,0,0,0,0,23049,1,0,0,-1,0,-1,9335,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,548,50,0,0,0,'',0,0,0,0,0,0,1),(23284,4,2,'Knight-Lieutenant\'s Leather Grips',31075,3,32768,1,43099,8619,10,8,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,18,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,155,0,0,0,0,0,0,0,0,0,9331,1,0,0,-1,0,-1,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,548,35,0,0,0,'',0,0,0,0,0,0,1),(23283,4,1,'Knight-Lieutenant\'s Dreadweave Walkers',36007,3,32768,1,51539,10307,8,256,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,17,5,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,9346,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,547,40,0,0,0,'',0,0,0,0,0,0,1),(23282,4,1,'Knight-Lieutenant\'s Dreadweave Handwraps',31060,3,32768,1,34236,6847,10,256,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,14,5,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,58,0,0,0,0,0,0,0,0,0,23046,1,0,0,-1,0,-1,14248,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,547,30,0,0,0,'',0,0,0,0,0,0,1),(23295,4,2,'Knight-Captain\'s Dragonhide Leggings',27235,3,32768,1,91983,18396,7,1024,-1,68,60,0,0,0,12,0,0,0,1,1,0,4,12,3,12,7,12,6,5,5,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,215,0,0,0,0,0,0,0,0,0,18384,1,0,0,-1,0,-1,9343,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,551,75,0,0,0,'',0,0,0,0,0,0,1),(23281,4,2,'Knight-Lieutenant\'s Dragonhide Treads',36004,3,32768,1,63961,12792,8,1024,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,13,4,13,5,6,3,6,6,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,126,0,0,0,0,0,0,0,0,0,9343,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,551,50,0,0,0,'',0,0,0,0,0,0,1),(23279,4,3,'Knight-Lieutenant\'s Chain Vices',35798,3,32768,1,50804,10160,10,4,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,16,3,18,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,242,0,0,0,0,0,0,0,0,0,28539,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,550,40,0,0,0,'',0,0,0,0,0,0,1),(23278,4,3,'Knight-Lieutenant\'s Chain Greaves',36006,3,32768,1,76266,15253,8,4,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,19,3,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,266,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,550,60,0,0,0,'',0,0,0,0,0,0,1),(23277,4,4,'Lieutenant Commander\'s Lamellar Shoulders',31085,3,32768,1,64368,12873,3,2,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,14,4,14,5,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,552,0,0,0,0,0,0,0,0,0,14799,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,544,80,0,0,0,'',0,0,0,0,0,0,1),(23276,4,4,'Lieutenant Commander\'s Lamellar Headguard',30316,3,32768,1,64132,12826,1,2,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,19,4,18,5,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,598,0,0,0,0,0,0,0,0,0,18049,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,544,80,0,0,0,'',0,0,0,0,0,0,1),(23274,4,4,'Knight-Lieutenant\'s Lamellar Gauntlets',30321,3,32768,1,33256,6651,10,2,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,13,4,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,429,0,0,0,0,0,0,0,0,0,23300,1,0,0,-1,0,-1,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,544,45,0,0,0,'',0,0,0,0,0,0,1),(23273,4,4,'Knight-Captain\'s Lamellar Leggings',31084,3,32768,1,71110,14222,7,2,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,17,4,18,5,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,618,0,0,0,0,0,0,0,0,0,15715,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,544,100,0,0,0,'',0,0,0,0,0,0,1),(23272,4,4,'Knight-Captain\'s Lamellar Breastplate',30315,3,32768,1,70845,14169,5,2,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,18,4,17,5,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,706,0,0,0,0,0,0,0,0,0,15715,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,544,135,0,0,0,'',0,0,0,0,0,0,1),(23263,4,1,'Champion\'s Silk Cowl',31099,3,0,1,65784,13156,1,128,511,71,60,0,0,0,14,0,0,0,1,1,0,7,19,5,18,6,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,141,0,0,0,0,0,0,0,0,0,18384,1,0,0,-1,0,-1,14248,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,542,50,0,0,0,'',0,0,0,0,0,0,1),(23264,4,1,'Champion\'s Silk Mantle',31100,3,0,1,66020,13204,3,128,511,71,60,0,0,0,14,0,0,0,1,1,0,7,14,5,11,6,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,135,0,0,0,0,0,0,0,0,0,9344,1,0,0,-1,0,-1,18384,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,542,50,0,0,0,'',0,0,0,0,0,0,1),(23262,4,1,'Champion\'s Satin Mantle',31031,3,32768,1,65548,13109,3,16,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,14,5,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,115,0,0,0,0,0,0,0,0,0,9345,1,0,0,-1,0,-1,21626,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,540,50,0,0,0,'',0,0,0,0,0,0,1),(23261,4,1,'Champion\'s Satin Hood',31030,3,32768,1,65312,13062,1,16,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,20,5,18,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,131,0,0,0,0,0,0,0,0,0,14248,1,0,0,-1,0,-1,21626,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,540,50,0,0,0,'',0,0,0,0,0,0,1),(22876,4,3,'Legionnaire\'s Mail Hauberk',31185,3,32768,1,107525,21505,5,64,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,18,5,18,4,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,398,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,538,120,0,0,0,'',0,0,0,0,0,0,1),(22887,4,3,'Legionnaire\'s Mail Legguards',31186,3,32768,1,111979,22395,7,64,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,18,5,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,348,0,0,0,0,0,0,0,0,0,14248,1,0,0,0,0,0,18384,1,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,538,90,0,0,0,'',0,0,0,0,0,0,1),(23258,4,2,'Champion\'s Leather Shoulders',31038,3,32768,1,80763,16152,3,8,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,196,0,0,0,0,0,0,0,0,0,9332,1,0,0,-1,0,-1,7597,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,522,60,0,0,0,'',0,0,0,0,0,0,1),(23257,4,2,'Champion\'s Leather Helm',30358,3,32768,1,78362,15672,1,8,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,23,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,238,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,14089,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,522,60,0,0,0,'',0,0,0,0,0,0,1),(23256,4,1,'Champion\'s Dreadweave Spaulders',30381,3,32768,1,62454,12490,3,256,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,17,5,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0,0,0,9417,1,0,0,-1,0,-1,18384,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,541,50,0,0,0,'',0,0,0,0,0,0,1),(23255,4,1,'Champion\'s Dreadweave Cowl',27258,3,32768,1,62217,12443,1,256,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,21,5,18,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,81,0,0,0,0,0,0,0,0,0,14248,1,0,0,-1,0,-1,18384,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,541,50,0,0,0,'',0,0,0,0,0,0,1),(23254,4,2,'Champion\'s Dragonhide Shoulders',28935,3,32768,1,77477,15495,3,1024,-1,71,60,0,0,0,14,0,0,0,1,1,0,4,12,3,6,7,12,6,6,5,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,206,0,0,0,0,0,0,0,0,0,9343,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,539,60,0,0,0,'',0,0,0,0,0,0,1),(23253,4,2,'Champion\'s Dragonhide Headguard',28106,3,32768,1,77190,15438,1,1024,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,16,3,12,4,16,5,16,6,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,198,0,0,0,0,0,0,0,0,0,9346,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,539,60,0,0,0,'',0,0,0,0,0,0,1),(23252,4,3,'Champion\'s Chain Shoulders',31047,3,32768,1,92684,18536,3,4,-1,71,60,0,0,0,14,0,0,0,1,1,0,3,18,7,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,311,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,543,70,0,0,0,'',0,0,0,0,0,0,1),(23251,4,3,'Champion\'s Chain Helm',31184,3,32768,1,91920,18384,1,4,-1,71,60,0,0,0,14,0,0,0,1,1,0,3,18,7,14,5,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,337,0,0,0,0,0,0,0,0,0,7598,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,543,70,0,0,0,'',0,0,0,0,0,0,1),(23244,4,4,'Champion\'s Plate Helm',30071,3,32768,1,66027,13205,1,1,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,24,4,21,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,598,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,537,80,0,0,0,'',0,0,0,0,0,0,1),(23243,4,4,'Champion\'s Plate Shoulders',31049,3,32768,1,65791,13158,3,1,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,18,4,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,552,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,537,80,0,0,0,'',0,0,0,0,0,0,1),(22886,4,1,'Legionnaire\'s Silk Tunic',31102,3,0,1,74380,14876,20,128,511,68,60,0,0,0,12,0,0,0,1,1,0,7,18,5,17,6,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,156,0,0,0,0,0,0,0,0,0,18384,1,0,0,-1,0,-1,14248,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,542,80,0,0,0,'',0,0,0,0,0,0,1),(22885,4,1,'Legionnaire\'s Satin Tunic',30351,3,32768,1,74108,14821,20,16,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,19,5,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,156,0,0,0,0,0,0,0,0,0,14248,1,0,0,-1,0,-1,21626,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,540,80,0,0,0,'',0,0,0,0,0,0,1),(22884,4,1,'Legionnaire\'s Dreadweave Tunic',27260,3,32768,1,73844,14768,20,256,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,20,5,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,96,0,0,0,0,0,0,0,0,0,15715,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,541,80,0,0,0,'',0,0,0,0,0,0,1),(22870,4,1,'Blood Guard\'s Silk Handwraps',31098,3,0,1,34226,6845,10,128,511,66,60,0,0,0,11,0,0,0,1,1,0,7,12,5,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,98,0,0,0,0,0,0,0,0,0,23037,1,0,0,-1,0,-1,9346,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,542,30,0,0,0,'',0,0,0,0,0,0,1),(22882,4,1,'Legionnaire\'s Satin Legguards',31033,3,32768,1,73300,14660,7,16,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,19,5,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,144,0,0,0,0,0,0,0,0,0,14248,1,0,0,-1,0,-1,21626,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,540,65,0,0,0,'',0,0,0,0,0,0,1),(22881,4,1,'Legionnaire\'s Dreadweave Legguards',31032,3,32768,1,73028,14605,7,256,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,21,5,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,84,0,0,0,0,0,0,0,0,0,14127,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,541,65,0,0,0,'',0,0,0,0,0,0,1),(22880,4,2,'Legionnaire\'s Leather Legguards',31040,3,32768,1,90955,18191,7,8,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,22,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,225,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,15806,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,522,75,0,0,0,'',0,0,0,0,0,0,1),(22879,4,2,'Legionnaire\'s Leather Chestpiece',31039,3,32768,1,90615,18123,5,8,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,22,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,248,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,15806,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,522,100,0,0,0,'',0,0,0,0,0,0,1),(22878,4,2,'Legionnaire\'s Dragonhide Leggings',27267,3,32768,1,90275,18055,7,1024,-1,68,60,0,0,0,12,0,0,0,1,1,0,4,12,3,12,7,12,6,5,5,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,215,0,0,0,0,0,0,0,0,0,18384,1,0,0,-1,0,-1,9343,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,539,75,0,0,0,'',0,0,0,0,0,0,1),(22877,4,2,'Legionnaire\'s Dragonhide Chestpiece',31037,3,32768,1,89935,17987,5,1024,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,13,4,13,3,12,5,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,218,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,9344,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,539,100,0,0,0,'',0,0,0,0,0,0,1),(22867,4,3,'Blood Guard\'s Mail Vices',27279,3,32768,1,50789,10157,10,64,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,15,5,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,242,0,0,0,0,0,0,0,0,0,18384,1,0,0,-1,0,-1,9342,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,538,40,0,0,0,'',0,0,0,0,0,0,1),(22875,4,3,'Legionnaire\'s Chain Legguards',30367,3,32768,1,107117,21423,7,4,-1,68,60,0,0,0,12,0,0,0,1,1,0,3,16,7,13,5,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,348,0,0,0,0,0,0,0,0,0,7598,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,543,90,0,0,0,'',0,0,0,0,0,0,1),(22874,4,3,'Legionnaire\'s Chain Hauberk',31048,3,32768,1,106709,21341,5,4,-1,68,60,0,0,0,12,0,0,0,1,1,0,3,16,7,13,5,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,398,0,0,0,0,0,0,0,0,0,7598,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,543,120,0,0,0,'',0,0,0,0,0,0,1),(22873,4,4,'Legionnaire\'s Plate Leggings',31052,3,32768,1,70875,14175,7,1,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,17,4,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,618,0,0,0,0,0,0,0,0,0,7598,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,537,100,0,0,0,'',0,0,0,0,0,0,1),(22872,4,4,'Legionnaire\'s Plate Hauberk',27274,3,32768,1,70603,14120,5,1,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,23,4,21,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,706,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,537,135,0,0,0,'',0,0,0,0,0,0,1),(22860,4,1,'Blood Guard\'s Silk Walkers',31097,3,0,1,49504,9900,8,128,511,66,60,0,0,0,11,0,0,0,1,1,0,7,15,5,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,104,0,0,0,0,0,0,0,0,0,9344,1,0,0,-1,0,-1,23727,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,542,40,0,0,0,'',0,0,0,0,0,0,1),(22869,4,1,'Blood Guard\'s Satin Handwraps',31028,3,32768,1,34106,6821,10,16,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,12,5,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,98,0,0,0,0,0,0,0,0,0,23043,1,0,0,-1,0,-1,14248,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,540,30,0,0,0,'',0,0,0,0,0,0,1),(22868,4,4,'Blood Guard\'s Plate Gauntlets',31051,3,32768,1,31789,6357,10,1,-1,66,60,0,0,0,11,0,0,0,1,1,0,4,17,7,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,429,0,0,0,0,0,0,0,0,0,22778,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,537,45,0,0,0,'',0,0,0,0,0,0,1),(23259,4,3,'Champion\'s Mail Headguard',30072,3,32768,1,97270,19454,1,64,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,24,5,16,4,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,337,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,18384,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,538,70,0,0,0,'',0,0,0,0,0,0,1),(22865,4,1,'Blood Guard\'s Dreadweave Handwraps',27256,3,32768,1,33616,6723,10,256,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,14,5,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,58,0,0,0,0,0,0,0,0,0,23046,1,0,0,-1,0,-1,14248,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,541,30,0,0,0,'',0,0,0,0,0,0,1),(22858,4,4,'Blood Guard\'s Plate Greaves',31050,3,32768,1,49139,9827,8,1,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,23,4,10,3,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,472,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,537,65,0,0,0,'',0,0,0,0,0,0,1),(23260,4,3,'Champion\'s Mail Pauldrons',30382,3,32768,1,98058,19611,3,64,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,16,5,10,4,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,311,0,0,0,0,0,0,0,0,0,9344,1,0,0,-1,0,-1,18384,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,538,70,0,0,0,'',0,0,0,0,0,0,1),(22856,4,2,'Blood Guard\'s Leather Walkers',31035,3,32768,1,60961,12192,8,8,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,18,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,166,0,0,0,0,0,0,0,0,0,23049,1,0,0,-1,0,-1,9335,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,522,50,0,0,0,'',0,0,0,0,0,0,1),(22855,4,1,'Blood Guard\'s Dreadweave Walkers',31026,3,32768,1,47684,9536,8,256,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,17,5,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,9346,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,541,40,0,0,0,'',0,0,0,0,0,0,1),(22852,4,2,'Blood Guard\'s Dragonhide Treads',27263,3,32768,1,59605,11921,8,1024,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,13,4,13,5,6,3,6,6,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,126,0,0,0,0,0,0,0,0,0,9343,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,539,50,0,0,0,'',0,0,0,0,0,0,1),(18864,4,0,'Insignia of the Alliance',31318,3,32768,1,15000,3750,12,2,77,0,0,0,0,0,6,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,23276,0,0,0,300000,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18863,4,0,'Insignia of the Alliance',31318,3,32768,1,15000,3750,12,1024,77,0,0,0,0,0,6,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,23277,0,0,0,300000,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18862,4,0,'Insignia of the Alliance',31318,3,32768,1,15000,3750,12,16,77,0,0,0,0,0,6,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,23276,0,0,0,300000,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(17584,4,1,'Marshal\'s Dreadweave Gloves',32995,4,32768,1,59280,11856,10,256,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,16,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,63,0,0,0,0,0,0,0,0,0,23046,1,0,0,-1,0,-1,22747,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,392,35,0,0,0,'',0,0,0,0,0,0,1),(18858,4,0,'Insignia of the Alliance',31318,3,32768,1,15000,3750,12,256,77,0,0,0,0,0,6,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,23273,0,0,0,300000,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18857,4,0,'Insignia of the Alliance',31318,3,32768,1,15000,3750,12,8,77,0,0,0,0,0,6,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,23273,0,0,0,300000,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18854,4,0,'Insignia of the Alliance',31318,3,32768,1,15000,3750,12,1,77,0,0,0,0,0,6,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5579,0,0,0,300000,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18853,4,0,'Insignia of the Horde',31306,3,32768,1,15000,3750,12,1024,-1,0,0,0,0,0,6,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,23277,0,0,0,300000,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18852,4,0,'Insignia of the Horde',31306,3,32768,1,15000,3750,12,256,-1,0,0,0,0,0,6,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,23273,0,0,0,300000,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(17590,4,1,'Warlord\'s Dreadweave Mantle',33088,4,0,1,95255,19051,3,256,511,74,60,0,0,0,17,0,0,0,1,1,0,7,22,5,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0,0,0,25110,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,391,60,0,0,0,'',0,0,0,0,0,0,1),(18850,4,0,'Insignia of the Horde',31306,3,32768,1,15000,3750,12,128,-1,0,0,0,0,0,6,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,23274,0,0,0,300000,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18849,4,0,'Insignia of the Horde',31306,3,32768,1,15000,3750,12,8,-1,0,0,0,0,0,6,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,23273,0,0,0,300000,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18856,4,0,'Insignia of the Alliance',31318,3,32768,1,15000,3750,12,4,77,0,0,0,0,0,6,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5579,0,0,0,300000,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18846,4,0,'Insignia of the Horde',31306,3,32768,1,15000,3750,12,4,-1,0,0,0,0,0,6,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5579,0,0,0,300000,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18845,4,0,'Insignia of the Horde',31306,3,32768,1,15000,3750,12,64,-1,0,0,0,0,0,6,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5579,0,0,0,300000,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18851,4,0,'Insignia of the Horde',31306,3,32768,1,15000,3750,12,16,-1,0,0,0,0,0,6,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,23276,0,0,0,300000,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18834,4,0,'Insignia of the Horde',31306,3,32768,1,15000,3750,12,1,-1,0,0,0,0,0,6,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5579,0,0,0,300000,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18859,4,0,'Insignia of the Alliance',31318,3,32768,1,15000,3750,12,128,77,0,0,0,0,0,6,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,23274,0,0,0,300000,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18826,4,6,'High Warlord\'s Shield Wall',31746,4,32768,1,159587,31917,14,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,23,4,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2929,0,0,0,0,0,0,0,0,0,13959,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,1,4,0,55,0,120,0,0,0,'',0,0,0,0,0,0,1),(18825,4,6,'Grand Marshal\'s Aegis',31733,4,32768,1,159036,31807,14,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,18,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2929,0,0,0,0,0,0,0,0,0,13959,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,1,4,0,55,0,120,0,0,0,'',0,0,0,0,0,0,1),(18454,4,2,'Sergeant Major\'s Dragonhide Armsplints',30805,3,32768,1,34815,6963,9,1024,-1,63,58,0,0,0,9,0,0,0,1,1,0,7,17,5,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,77,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,0,35,0,0,0,'',0,0,0,0,0,0,1),(18452,4,2,'Sergeant Major\'s Leather Armsplints',30804,3,32768,1,34553,6910,9,8,-1,63,58,0,0,0,9,0,0,0,1,1,0,7,17,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,77,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,0,35,0,0,0,'',0,0,0,0,0,0,1),(18448,4,3,'Sergeant Major\'s Chain Armguards',31248,3,32768,1,44007,8801,9,4,-1,63,58,0,0,0,9,0,0,0,1,1,0,7,17,5,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,162,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,0,40,0,0,0,'',0,0,0,0,0,0,1),(18437,4,1,'First Sergeant\'s Silk Cuffs',27255,3,32768,1,13721,2744,9,400,-1,50,45,0,0,0,9,0,0,0,1,1,0,7,14,5,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,31,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,0,30,0,0,0,'',0,0,0,0,0,0,1),(18436,4,2,'First Sergeant\'s Dragonhide Armguards',27262,3,32768,1,17086,3417,9,1024,-1,50,45,0,0,0,9,0,0,0,1,1,0,7,14,5,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,0,35,0,0,0,'',0,0,0,0,0,0,1),(18432,4,3,'First Sergeant\'s Mail Wristguards',27277,3,32768,1,21742,4348,9,68,-1,50,45,0,0,0,9,0,0,0,1,1,0,7,14,5,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,131,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,0,40,0,0,0,'',0,0,0,0,0,0,1),(18430,4,4,'First Sergeant\'s Plate Bracers',27273,3,32768,1,14391,2878,9,1,-1,50,45,0,0,0,9,0,0,0,1,1,0,7,14,4,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,231,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,0,45,0,0,0,'',0,0,0,0,0,0,1),(18428,4,0,'Senior Sergeant\'s Insignia',30797,3,32768,1,30000,7500,2,-1,-1,50,45,0,0,0,8,0,0,0,1,1,0,7,14,6,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18427,4,1,'Sergeant\'s Cloak',27088,3,32768,1,6611,1322,16,-1,-1,35,30,0,0,0,7,0,0,0,1,1,0,7,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,66,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(17617,4,1,'Blood Guard\'s Satin Gloves',31028,3,32768,1,29344,5868,10,16,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,56,0,0,0,0,0,0,0,0,0,23043,1,0,0,-1,0,-1,14248,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,342,30,0,0,0,'',0,0,0,0,0,0,1),(17616,4,1,'Blood Guard\'s Satin Boots',31027,3,32768,1,43860,8772,8,16,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,16,5,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,61,0,0,0,0,0,0,0,0,0,9417,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,342,40,0,0,0,'',0,0,0,0,0,0,1),(17613,4,1,'Champion\'s Satin Shoulderpads',31031,3,32768,1,42236,8447,3,16,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,16,5,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,67,0,0,0,0,0,0,0,0,0,9417,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,342,50,0,0,0,'',0,0,0,0,0,0,1),(17612,4,1,'Legionnaire\'s Satin Vestments',30351,3,32768,1,56108,11221,20,16,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,20,5,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,89,0,0,0,0,0,0,0,0,0,9345,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,342,80,0,0,0,'',0,0,0,0,0,0,1),(17611,4,1,'Legionnaire\'s Satin Trousers',31033,3,32768,1,55895,11179,7,16,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,16,5,13,6,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,78,0,0,0,0,0,0,0,0,0,14254,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,342,65,0,0,0,'',0,0,0,0,0,0,1),(17610,4,1,'Champion\'s Satin Cowl',31030,3,32768,1,41761,8352,1,16,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,20,5,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,73,0,0,0,0,0,0,0,0,0,9345,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,342,50,0,0,0,'',0,0,0,0,0,0,1),(17601,4,1,'Lieutenant Commander\'s Satin Amice',31067,3,32768,1,44659,8931,3,16,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,16,5,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,67,0,0,0,0,0,0,0,0,0,9417,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,344,50,0,0,0,'',0,0,0,0,0,0,1),(17600,4,1,'Knight-Captain\'s Satin Robes',31058,3,32768,1,59333,11866,20,16,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,20,5,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,89,0,0,0,0,0,0,0,0,0,9345,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,344,80,0,0,0,'',0,0,0,0,0,0,1),(17599,4,1,'Knight-Captain\'s Satin Leggings',25198,3,32768,1,57594,11518,7,16,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,16,5,13,6,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,78,0,0,0,0,0,0,0,0,0,14254,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,344,65,0,0,0,'',0,0,0,0,0,0,1),(17598,4,1,'Lieutenant Commander\'s Diadem',31065,3,32768,1,43035,8607,1,16,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,20,5,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,73,0,0,0,0,0,0,0,0,0,9345,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,344,50,0,0,0,'',0,0,0,0,0,0,1),(17596,4,1,'Knight-Lieutenant\'s Satin Gloves',31062,3,32768,1,28480,5696,10,16,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,56,0,0,0,0,0,0,0,0,0,23043,1,0,0,-1,0,-1,14248,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,344,30,0,0,0,'',0,0,0,0,0,0,1),(17594,4,1,'Knight-Lieutenant\'s Satin Boots',31061,3,32768,1,42405,8481,8,16,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,16,5,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,61,0,0,0,0,0,0,0,0,0,9417,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,344,40,0,0,0,'',0,0,0,0,0,0,1),(17577,4,1,'Blood Guard\'s Dreadweave Gloves',27256,3,32768,1,28589,5717,10,256,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,56,0,0,0,0,0,0,0,0,0,23046,1,0,0,-1,0,-1,14248,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,345,30,0,0,0,'',0,0,0,0,0,0,1),(17576,4,1,'Blood Guard\'s Dreadweave Boots',31026,3,32768,1,42724,8544,8,256,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,16,5,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,61,0,0,0,0,0,0,0,0,0,9417,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,345,40,0,0,0,'',0,0,0,0,0,0,1),(17573,4,1,'Champion\'s Dreadweave Shoulders',30381,3,32768,1,42249,8449,3,256,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,16,5,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,67,0,0,0,0,0,0,0,0,0,9417,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,345,50,0,0,0,'',0,0,0,0,0,0,1),(17572,4,1,'Legionnaire\'s Dreadweave Robe',27260,3,32768,1,56119,11223,20,256,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,20,5,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,89,0,0,0,0,0,0,0,0,0,9345,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,345,80,0,0,0,'',0,0,0,0,0,0,1),(17571,4,1,'Legionnaire\'s Dreadweave Leggings',31032,3,32768,1,55912,11182,7,256,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,15,5,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,78,0,0,0,0,0,0,0,0,0,14127,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,345,65,0,0,0,'',0,0,0,0,0,0,1),(17570,4,1,'Champion\'s Dreadweave Hood',27258,3,32768,1,41774,8354,1,256,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,20,5,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,73,0,0,0,0,0,0,0,0,0,9345,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,345,50,0,0,0,'',0,0,0,0,0,0,1),(17569,4,1,'Lieutenant Commander\'s Dreadweave Mantle',31066,3,32768,1,41614,8322,3,256,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,16,5,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,67,0,0,0,0,0,0,0,0,0,9417,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,346,50,0,0,0,'',0,0,0,0,0,0,1),(17568,4,1,'Knight-Captain\'s Dreadweave Robe',31053,3,32768,1,55273,11054,20,256,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,20,5,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,89,0,0,0,0,0,0,0,0,0,9345,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,346,80,0,0,0,'',0,0,0,0,0,0,1),(17567,4,1,'Knight-Captain\'s Dreadweave Leggings',30385,3,32768,1,59304,11860,7,256,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,21,5,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,78,0,0,0,0,0,0,0,0,0,9345,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,346,65,0,0,0,'',0,0,0,0,0,0,1),(16531,4,3,'Blood Guard\'s Chain Boots',31181,3,32768,1,67261,13452,8,4,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,17,3,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255,0,0,0,0,0,0,0,0,0,13669,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,361,60,0,0,0,'',0,0,0,0,0,0,1),(16530,4,3,'Blood Guard\'s Chain Gauntlets',31182,3,32768,1,44482,8896,10,4,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,18,3,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,231,0,0,0,0,0,0,0,0,0,23157,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,361,40,0,0,0,'',0,0,0,0,0,0,1),(16528,4,3,'Champion\'s Chain Pauldrons',31047,3,32768,1,66545,13309,3,4,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,20,3,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,278,0,0,0,0,0,0,0,0,0,9141,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,361,70,0,0,0,'',0,0,0,0,0,0,1),(16498,4,2,'Blood Guard\'s Leather Treads',31035,3,32768,1,51802,10360,8,8,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,18,3,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,121,0,0,0,0,0,0,0,0,0,23049,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,347,50,0,0,0,'',0,0,0,0,0,0,1),(16526,4,3,'Champion\'s Chain Headguard',31184,3,32768,1,65771,13154,1,4,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,24,3,15,5,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,301,0,0,0,0,0,0,0,0,0,9141,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,361,70,0,0,0,'',0,0,0,0,0,0,1),(16524,4,3,'Champion\'s Mail Shoulders',30382,3,32768,1,65588,13117,3,64,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,16,5,15,4,5,3,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,278,0,0,0,0,0,0,0,0,0,9396,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,301,70,0,0,0,'',0,0,0,0,0,0,1),(16513,4,4,'Legionnaire\'s Plate Armor',27274,3,32768,1,59955,11991,5,1,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,25,4,9,3,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,657,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,281,135,0,0,0,'',0,0,0,0,0,0,1),(16504,4,2,'Legionnaire\'s Dragonhide Breastplate',31037,3,32768,1,70653,14130,5,1024,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,14,4,13,3,9,5,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,176,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,9345,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,382,100,0,0,0,'',0,0,0,0,0,0,1),(16436,4,4,'Lieutenant Commander\'s Lamellar Shoulders',31085,3,32768,1,44318,8863,3,2,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,12,4,12,3,12,5,7,6,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,493,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,401,80,0,0,0,'',0,0,0,0,0,0,1),(16435,4,4,'Knight-Captain\'s Lamellar Leggings',31084,3,32768,1,58878,11775,7,2,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,13,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,575,0,0,0,0,0,0,0,0,0,7598,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,401,100,0,0,0,'',0,0,0,0,0,0,1),(16434,4,4,'Lieutenant Commander\'s Lamellar Headguard',30316,3,32768,1,44003,8800,1,2,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,31,4,9,3,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,534,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,401,80,0,0,0,'',0,0,0,0,0,0,1),(16431,4,4,'Knight-Captain\'s Plate Leggings',26659,3,32768,1,58031,11606,7,1,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,13,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,575,0,0,0,0,0,0,0,0,0,7598,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,282,100,0,0,0,'',0,0,0,0,0,0,1),(16430,4,4,'Knight-Captain\'s Plate Chestguard',31083,3,32768,1,57824,11564,5,1,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,25,4,9,3,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,657,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,282,135,0,0,0,'',0,0,0,0,0,0,1),(16429,4,4,'Lieutenant Commander\'s Plate Helm',28934,3,32768,1,43208,8641,1,1,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,31,4,9,3,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,534,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,282,80,0,0,0,'',0,0,0,0,0,0,1),(16428,4,3,'Lieutenant Commander\'s Chain Helmet',31246,3,32768,1,64573,12914,1,4,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,24,3,15,5,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,301,0,0,0,0,0,0,0,0,0,9141,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,362,70,0,0,0,'',0,0,0,0,0,0,1),(16426,4,3,'Knight-Captain\'s Chain Leggings',31242,3,32768,1,83178,16635,7,4,-1,63,58,0,0,0,12,0,0,0,1,1,0,3,18,7,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,324,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,13669,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,362,90,0,0,0,'',0,0,0,0,0,0,1),(16427,4,3,'Lieutenant Commander\'s Chain Pauldrons',31247,3,32768,1,64619,12923,3,4,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,20,3,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,278,0,0,0,0,0,0,0,0,0,9141,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,362,70,0,0,0,'',0,0,0,0,0,0,1),(16425,4,3,'Knight-Captain\'s Chain Hauberk',31241,3,32768,1,82858,16571,5,4,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,18,3,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,370,0,0,0,0,0,0,0,0,0,9334,1,0,0,-1,0,-1,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,362,120,0,0,0,'',0,0,0,0,0,0,1),(16424,4,2,'Lieutenant Commander\'s Dragonhide Shroud',27234,3,32768,1,51586,10317,1,1024,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,16,3,11,4,11,5,11,6,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,143,0,0,0,0,0,0,0,0,0,9329,1,0,0,-1,0,-1,9342,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,381,60,0,0,0,'',0,0,0,0,0,0,1),(16423,4,2,'Lieutenant Commander\'s Dragonhide Epaulets',27236,3,32768,1,51392,10278,3,1024,-1,63,58,0,0,0,14,0,0,0,1,1,0,4,10,3,10,7,10,6,10,5,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,132,0,0,0,0,0,0,0,0,0,9398,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,381,60,0,0,0,'',0,0,0,0,0,0,1),(16422,4,2,'Knight-Captain\'s Dragonhide Leggings',27235,3,32768,1,75461,15092,7,1024,-1,63,58,0,0,0,12,0,0,0,1,1,0,4,12,3,12,7,12,5,9,6,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,154,0,0,0,0,0,0,0,0,0,13669,1,0,0,-1,0,-1,9330,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,381,75,0,0,0,'',0,0,0,0,0,0,1),(16421,4,2,'Knight-Captain\'s Dragonhide Tunic',31074,3,32768,1,75195,15039,5,1024,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,14,4,13,3,9,5,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,176,0,0,0,0,0,0,0,0,0,9345,1,0,0,-1,0,-1,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,381,100,0,0,0,'',0,0,0,0,0,0,1),(16419,4,2,'Knight-Captain\'s Leather Legguards',31073,3,32768,1,74670,14934,7,8,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,13,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,154,0,0,0,0,0,0,0,0,0,7598,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,348,75,0,0,0,'',0,0,0,0,0,0,1),(16396,4,2,'Knight-Lieutenant\'s Leather Gauntlets',31075,3,32768,1,36942,7388,10,8,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,15,3,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,110,0,0,0,0,0,0,0,0,0,15807,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,348,35,0,0,0,'',0,0,0,0,0,0,1),(16420,4,2,'Lieutenant Commander\'s Leather Spaulders',31076,3,32768,1,56197,11239,3,8,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,23,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,132,0,0,0,0,0,0,0,0,0,9141,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,348,60,0,0,0,'',0,0,0,0,0,0,1),(16417,4,2,'Knight-Captain\'s Leather Armor',31072,3,32768,1,74137,14827,5,8,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,25,3,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,176,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,348,100,0,0,0,'',0,0,0,0,0,0,1),(16416,4,1,'Lieutenant Commander\'s Crown',27232,3,32768,1,44322,8864,1,128,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,16,5,16,6,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,73,0,0,0,0,0,0,0,0,0,18384,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,343,50,0,0,0,'',0,0,0,0,0,0,1),(16415,4,1,'Lieutenant Commander\'s Silk Spaulders',27231,3,32768,1,44167,8833,3,128,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,16,5,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,67,0,0,0,0,0,0,0,0,0,9417,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,343,50,0,0,0,'',0,0,0,0,0,0,1),(16414,4,1,'Knight-Captain\'s Silk Leggings',27230,3,32768,1,58676,11735,7,128,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,16,6,16,5,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,78,0,0,0,0,0,0,0,0,0,14254,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,343,65,0,0,0,'',0,0,0,0,0,0,1),(16413,4,1,'Knight-Captain\'s Silk Raiment',31057,3,32768,1,58463,11692,20,128,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,20,5,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,89,0,0,0,0,0,0,0,0,0,18384,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,343,80,0,0,0,'',0,0,0,0,0,0,1),(16410,4,4,'Knight-Lieutenant\'s Lamellar Gauntlets',30321,3,32768,1,28152,5630,10,2,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,16,4,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,410,0,0,0,0,0,0,0,0,0,23300,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,401,45,0,0,0,'',0,0,0,0,0,0,1),(16409,4,4,'Knight-Lieutenant\'s Lamellar Sabatons',31082,3,32768,1,42068,8413,8,2,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,16,4,15,5,7,3,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,452,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,401,65,0,0,0,'',0,0,0,0,0,0,1),(16406,4,4,'Knight-Lieutenant\'s Plate Gauntlets',31086,3,32768,1,27728,5545,10,1,-1,63,58,0,0,0,11,0,0,0,1,1,0,4,16,7,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,410,0,0,0,0,0,0,0,0,0,22778,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,282,45,0,0,0,'',0,0,0,0,0,0,1),(16405,4,4,'Knight-Lieutenant\'s Plate Boots',26752,3,32768,1,41433,8286,8,1,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,23,4,8,3,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,452,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,282,65,0,0,0,'',0,0,0,0,0,0,1),(16403,4,3,'Knight-Lieutenant\'s Chain Gauntlets',31245,3,32768,1,41118,8223,10,4,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,18,3,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,231,0,0,0,0,0,0,0,0,0,23157,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,362,40,0,0,0,'',0,0,0,0,0,0,1),(16401,4,3,'Knight-Lieutenant\'s Chain Boots',31244,3,32768,1,67983,13596,8,4,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,17,3,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255,0,0,0,0,0,0,0,0,0,13669,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,362,60,0,0,0,'',0,0,0,0,0,0,1),(16397,4,2,'Knight-Lieutenant\'s Dragonhide Gloves',31071,3,32768,1,37072,7414,10,1024,-1,63,58,0,0,0,11,0,0,0,1,1,0,4,12,3,12,7,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,110,0,0,0,0,0,0,0,0,0,23217,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,381,35,0,0,0,'',0,0,0,0,0,0,1),(16418,4,2,'Lieutenant Commander\'s Leather Veil',31077,3,32768,1,55802,11160,1,8,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,26,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,143,0,0,0,0,0,0,0,0,0,13669,1,0,0,-1,0,-1,9141,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,348,60,0,0,0,'',0,0,0,0,0,0,1),(16393,4,2,'Knight-Lieutenant\'s Dragonhide Footwraps',31070,3,32768,1,53384,10676,8,1024,-1,63,58,0,0,0,11,0,0,0,1,1,0,4,12,3,5,7,12,5,5,6,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,121,0,0,0,0,0,0,0,0,0,9343,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,381,50,0,0,0,'',0,0,0,0,0,0,1),(16392,4,2,'Knight-Lieutenant\'s Leather Boots',31068,3,32768,1,53190,10638,8,8,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,18,3,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,121,0,0,0,0,0,0,0,0,0,23049,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,348,50,0,0,0,'',0,0,0,0,0,0,1),(16369,4,1,'Knight-Lieutenant\'s Silk Boots',31063,3,32768,1,42081,8416,8,128,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,16,5,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,61,0,0,0,0,0,0,0,0,0,9417,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,343,40,0,0,0,'',0,0,0,0,0,0,1),(16335,4,0,'Senior Sergeant\'s Insignia',30797,3,32768,1,40000,10000,2,-1,-1,63,58,0,0,0,8,0,0,0,1,1,0,7,17,6,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(15199,4,0,'Stone Guard\'s Herald',31252,1,0,1,40000,10000,19,-1,-1,40,0,0,0,0,10,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(15198,4,0,'Knight\'s Colors',31253,1,0,1,40000,10000,19,-1,-1,40,0,0,0,0,10,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(17625,4,1,'General\'s Satin Leggings',26021,4,32768,1,118947,23789,7,16,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,23,5,16,6,19,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,88,0,0,0,0,0,0,0,0,0,14127,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,390,75,0,0,0,'',0,0,0,0,0,0,1),(17624,4,1,'Warlord\'s Satin Robes',33084,4,32768,1,137223,27444,20,16,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,30,5,25,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,100,0,0,0,0,0,0,0,0,0,25110,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,390,100,0,0,0,'',0,0,0,0,0,0,1),(17623,4,1,'Warlord\'s Satin Cowl',33082,4,32768,1,102553,20510,1,16,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,28,5,24,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,81,0,0,0,0,0,0,0,0,0,14799,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,390,60,0,0,0,'',0,0,0,0,0,0,1),(17622,4,1,'Warlord\'s Satin Mantle',33083,4,32768,1,102188,20437,3,16,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,22,5,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0,0,0,25110,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,390,60,0,0,0,'',0,0,0,0,0,0,1),(17620,4,1,'General\'s Satin Gloves',33081,4,32768,1,58435,11687,10,16,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,16,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,63,0,0,0,0,0,0,0,0,0,23043,1,0,0,-1,0,-1,22747,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,390,35,0,0,0,'',0,0,0,0,0,0,1),(17618,4,1,'General\'s Satin Boots',33080,4,32768,1,87023,17404,8,16,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,21,5,21,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,69,0,0,0,0,0,0,0,0,0,9342,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,390,50,0,0,0,'',0,0,0,0,0,0,1),(17604,4,1,'Field Marshal\'s Satin Mantle',33005,4,32768,1,102927,20585,3,16,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,22,5,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0,0,0,25110,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,389,60,0,0,0,'',0,0,0,0,0,0,1),(17605,4,1,'Field Marshal\'s Satin Vestments',32984,4,32768,1,137722,27544,20,16,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,30,5,25,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,100,0,0,0,0,0,0,0,0,0,25110,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,389,100,0,0,0,'',0,0,0,0,0,0,1),(17603,4,1,'Marshal\'s Satin Pants',32991,4,32768,1,118130,23626,7,16,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,23,5,16,6,19,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,88,0,0,0,0,0,0,0,0,0,14127,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,389,75,0,0,0,'',0,0,0,0,0,0,1),(17607,4,1,'Marshal\'s Satin Sandals',32992,4,32768,1,81332,16266,8,16,-1,71,60,0,0,0,16,0,0,0,1,1,0,5,21,7,21,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,69,0,0,0,0,0,0,0,0,0,9342,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,389,50,0,0,0,'',0,0,0,0,0,0,1),(17608,4,1,'Marshal\'s Satin Gloves',32990,4,32768,1,54431,10886,10,16,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,16,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,63,0,0,0,0,0,0,0,0,0,22747,1,0,0,-1,0,-1,23043,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,389,35,0,0,0,'',0,0,0,0,0,0,1),(17592,4,1,'Warlord\'s Dreadweave Robe',33079,4,0,1,127965,25593,20,256,511,74,60,0,0,0,17,0,0,0,1,1,0,7,30,5,25,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,100,0,0,0,0,0,0,0,0,0,25110,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,391,100,0,0,0,'',0,0,0,0,0,0,1),(17593,4,1,'General\'s Dreadweave Pants',30380,4,0,1,110961,22192,7,256,511,71,60,0,0,0,16,0,0,0,1,1,0,7,23,5,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,88,0,0,0,0,0,0,0,0,0,14055,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,391,75,0,0,0,'',0,0,0,0,0,0,1),(17586,4,1,'General\'s Dreadweave Boots',33076,4,0,1,81034,16206,8,256,511,71,60,0,0,0,16,0,0,0,1,1,0,7,21,5,21,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,69,0,0,0,0,0,0,0,0,0,9342,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,391,50,0,0,0,'',0,0,0,0,0,0,1),(17588,4,1,'General\'s Dreadweave Gloves',33077,4,0,1,54437,10887,10,256,511,71,60,0,0,0,16,0,0,0,1,1,0,7,16,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,63,0,0,0,0,0,0,0,0,0,23046,1,0,0,-1,0,-1,22747,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,391,35,0,0,0,'',0,0,0,0,0,0,1),(17591,4,1,'Warlord\'s Dreadweave Hood',33071,4,0,1,95609,19121,1,256,511,74,60,0,0,0,17,0,0,0,1,1,0,7,28,5,24,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,81,0,0,0,0,0,0,0,0,0,14799,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,391,60,0,0,0,'',0,0,0,0,0,0,1),(17583,4,1,'Marshal\'s Dreadweave Boots',33006,4,32768,1,86351,17270,8,256,-1,71,60,0,0,0,16,0,0,0,1,1,0,5,21,7,21,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,69,0,0,0,0,0,0,0,0,0,9342,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,392,50,0,0,0,'',0,0,0,0,0,0,1),(17581,4,1,'Field Marshal\'s Dreadweave Robe',33001,4,32768,1,132325,26465,20,256,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,30,5,25,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,100,0,0,0,0,0,0,0,0,0,25110,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,392,100,0,0,0,'',0,0,0,0,0,0,1),(17579,4,1,'Marshal\'s Dreadweave Leggings',33007,4,32768,1,113479,22695,7,256,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,23,5,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,88,0,0,0,0,0,0,0,0,0,14055,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,392,75,0,0,0,'',0,0,0,0,0,0,1),(17580,4,1,'Field Marshal\'s Dreadweave Shoulders',33002,4,32768,1,98879,19775,3,256,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,22,5,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0,0,0,25110,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,392,60,0,0,0,'',0,0,0,0,0,0,1),(17578,4,1,'Field Marshal\'s Coronal',32979,4,32768,1,98160,19632,1,256,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,28,5,24,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,81,0,0,0,0,0,0,0,0,0,14799,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,392,60,0,0,0,'',0,0,0,0,0,0,1),(16580,4,3,'Warlord\'s Mail Spaulders',32128,4,32768,1,147331,29466,3,64,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,18,5,17,4,11,3,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,312,0,0,0,0,0,0,0,0,0,25109,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,386,85,0,0,0,'',0,0,0,0,0,0,1),(16579,4,3,'General\'s Mail Leggings',32127,4,32768,1,168313,33662,7,64,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,23,5,19,3,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,364,0,0,0,0,0,0,0,0,0,14127,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,386,105,0,0,0,'',0,0,0,0,0,0,1),(16578,4,3,'Warlord\'s Mail Helm',32133,4,32768,1,145586,29117,1,64,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,35,5,11,4,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,338,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,386,85,0,0,0,'',0,0,0,0,0,0,1),(16577,4,3,'Warlord\'s Mail Armor',32103,4,32768,1,193406,38681,5,64,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,35,5,20,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,416,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,386,140,0,0,0,'',0,0,0,0,0,0,1),(16574,4,3,'General\'s Mail Gauntlets',32100,4,32768,1,82591,16518,10,64,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,17,5,15,4,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,260,0,0,0,0,0,0,0,0,0,14248,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,386,50,0,0,0,'',0,0,0,0,0,0,1),(16573,4,3,'General\'s Mail Boots',32126,4,32768,1,123976,24795,8,64,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,18,5,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,286,0,0,0,0,0,0,0,0,0,22801,1,0,0,-1,0,-1,14254,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,386,70,0,0,0,'',0,0,0,0,0,0,1),(16571,4,3,'General\'s Chain Gloves',32119,4,32768,1,81655,16331,10,4,-1,71,60,0,0,0,16,0,0,0,1,1,0,3,17,7,18,5,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,260,0,0,0,0,0,0,0,0,0,23157,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,396,50,0,0,0,'',0,0,0,0,0,0,1),(16568,4,3,'Warlord\'s Chain Shoulders',32125,4,32768,1,151709,30341,3,4,-1,74,60,0,0,0,17,0,0,0,1,1,0,3,15,7,26,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,312,0,0,0,0,0,0,0,0,0,9332,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,396,85,0,0,0,'',0,0,0,0,0,0,1),(16550,4,2,'Warlord\'s Dragonhide Helmet',32134,4,32768,1,126788,25357,1,1024,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,16,3,16,4,15,5,15,6,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,160,0,0,0,0,0,0,0,0,0,9346,1,0,0,-1,0,-1,14027,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,398,70,0,0,0,'',0,0,0,0,0,0,1),(16567,4,3,'General\'s Chain Legguards',32120,4,32768,1,173333,34666,7,4,-1,71,60,0,0,0,16,0,0,0,1,1,0,3,23,7,22,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,364,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,13669,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,396,105,0,0,0,'',0,0,0,0,0,0,1),(16566,4,3,'Warlord\'s Chain Helmet',32135,4,32768,1,149959,29991,1,4,-1,74,60,0,0,0,17,0,0,0,1,1,0,3,19,7,27,5,17,6,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,338,0,0,0,0,0,0,0,0,0,9331,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,396,85,0,0,0,'',0,0,0,0,0,0,1),(16565,4,3,'Warlord\'s Chain Chestpiece',32122,4,32768,1,199217,39843,5,4,-1,74,60,0,0,0,17,0,0,0,1,1,0,3,23,7,24,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,416,0,0,0,0,0,0,0,0,0,14049,1,0,0,-1,0,-1,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,396,140,0,0,0,'',0,0,0,0,0,0,1),(16564,4,2,'General\'s Leather Legguards',32112,4,32768,1,142884,28576,7,8,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,24,3,0,4,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,173,0,0,0,0,0,0,0,0,0,7598,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,393,90,0,0,0,'',0,0,0,0,0,0,1),(16563,4,2,'Warlord\'s Leather Breastplate',32115,4,32768,1,164799,32959,5,8,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,35,3,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,197,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,393,120,0,0,0,'',0,0,0,0,0,0,1),(16562,4,2,'Warlord\'s Leather Spaulders',32131,4,32768,1,123156,24631,3,8,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,26,3,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,148,0,0,0,0,0,0,0,0,0,9332,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,393,70,0,0,0,'',0,0,0,0,0,0,1),(16561,4,2,'Warlord\'s Leather Helm',32132,4,32768,1,122700,24540,1,8,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,35,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,160,0,0,0,0,0,0,0,0,0,9336,1,0,0,-1,0,-1,13669,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,393,70,0,0,0,'',0,0,0,0,0,0,1),(16560,4,2,'General\'s Leather Mitts',32113,4,32768,1,70400,14080,10,8,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,18,3,14,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,123,0,0,0,0,0,0,0,0,0,14049,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,393,40,0,0,0,'',0,0,0,0,0,0,1),(16473,4,4,'Field Marshal\'s Lamellar Chestplate',30315,4,32768,1,133270,26654,5,2,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,35,4,14,5,0,3,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,738,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,402,165,0,0,0,'',0,0,0,0,0,0,1),(16472,4,4,'Marshal\'s Lamellar Boots',30319,4,32768,1,86028,17205,8,2,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,26,4,15,5,8,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,507,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,402,75,0,0,0,'',0,0,0,0,0,0,1),(16554,4,2,'General\'s Dragonhide Boots',32106,4,32768,1,111087,22217,8,1024,-1,71,60,0,0,0,16,0,0,0,1,1,0,4,15,7,14,5,11,3,10,6,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,136,0,0,0,0,0,0,0,0,0,25110,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,398,60,0,0,0,'',0,0,0,0,0,0,1),(16552,4,2,'General\'s Dragonhide Leggings',32108,4,32768,1,147067,29413,7,1024,-1,71,60,0,0,0,16,0,0,0,1,1,0,4,16,3,16,7,15,6,15,5,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,173,0,0,0,0,0,0,0,0,0,13669,1,0,0,-1,0,-1,9332,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,398,90,0,0,0,'',0,0,0,0,0,0,1),(16569,4,3,'General\'s Chain Boots',32124,4,32768,1,131526,26305,8,4,-1,71,60,0,0,0,16,0,0,0,1,1,0,3,14,7,26,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,286,0,0,0,0,0,0,0,0,0,13669,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,396,70,0,0,0,'',0,0,0,0,0,0,1),(16551,4,2,'Warlord\'s Dragonhide Epaulets',32129,4,32768,1,127243,25448,3,1024,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,12,3,12,4,12,6,11,5,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,148,0,0,0,0,0,0,0,0,0,9346,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,398,70,0,0,0,'',0,0,0,0,0,0,1),(16549,4,2,'Warlord\'s Dragonhide Hauberk',32110,4,32768,1,168443,33688,5,1024,-1,74,60,0,0,0,17,0,0,0,1,1,0,4,19,7,18,3,14,5,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,197,0,0,0,0,0,0,0,0,0,14248,1,0,0,-1,0,-1,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,398,120,0,0,0,'',0,0,0,0,0,0,1),(16548,4,4,'General\'s Plate Gauntlets',30371,4,32768,1,57993,11598,10,1,-1,71,60,0,0,0,16,0,0,0,1,1,0,4,18,7,17,3,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,461,0,0,0,0,0,0,0,0,0,22778,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,383,55,0,0,0,'',0,0,0,0,0,0,1),(16545,4,4,'General\'s Plate Boots',30370,4,32768,1,86054,17210,8,1,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,26,4,15,3,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,507,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,383,75,0,0,0,'',0,0,0,0,0,0,1),(16544,4,4,'Warlord\'s Plate Shoulders',30928,4,32768,1,99253,19850,3,1,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,26,4,15,3,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,553,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,383,100,0,0,0,'',0,0,0,0,0,0,1),(16543,4,4,'General\'s Plate Leggings',30375,4,32768,1,113910,22782,7,1,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,20,4,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,646,0,0,0,0,0,0,0,0,0,7598,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,383,120,0,0,0,'',0,0,0,0,0,0,1),(16542,4,4,'Warlord\'s Plate Headpiece',30374,4,32768,1,98535,19707,1,1,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,35,4,19,3,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,599,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,383,100,0,0,0,'',0,0,0,0,0,0,1),(16541,4,4,'Warlord\'s Plate Armor',30373,4,32768,1,130894,26178,5,1,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,35,4,13,3,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,738,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,383,165,0,0,0,'',0,0,0,0,0,0,1),(16540,4,1,'General\'s Silk Handguards',32997,4,32768,1,56325,11265,10,128,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,16,5,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,63,0,0,0,0,0,0,0,0,0,23037,1,0,0,-1,0,-1,22747,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,387,35,0,0,0,'',0,0,0,0,0,0,1),(16558,4,2,'General\'s Leather Treads',32114,4,32768,1,104823,20964,8,8,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,26,3,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,136,0,0,0,0,0,0,0,0,0,23049,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,393,60,0,0,0,'',0,0,0,0,0,0,1),(16555,4,2,'General\'s Dragonhide Gloves',32107,4,32768,1,69095,13819,10,1024,-1,71,60,0,0,0,16,0,0,0,1,1,0,4,18,3,17,7,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,123,0,0,0,0,0,0,0,0,0,23217,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,398,40,0,0,0,'',0,0,0,0,0,0,1),(16535,4,1,'Warlord\'s Silk Raiment',33085,4,32768,1,137669,27533,20,128,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,30,5,25,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,100,0,0,0,0,0,0,0,0,0,18384,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,387,100,0,0,0,'',0,0,0,0,0,0,1),(16534,4,1,'General\'s Silk Trousers',32998,4,32768,1,118504,23700,7,128,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,23,6,19,5,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,88,0,0,0,0,0,0,0,0,0,14127,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,387,75,0,0,0,'',0,0,0,0,0,0,1),(16484,4,4,'Marshal\'s Plate Gauntlets',30321,4,32768,1,55679,11135,10,1,-1,71,60,0,0,0,16,0,0,0,1,1,0,4,18,7,17,3,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,461,0,0,0,0,0,0,0,0,0,22778,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,384,55,0,0,0,'',0,0,0,0,0,0,1),(16533,4,1,'Warlord\'s Silk Cowl',32999,4,32768,1,102523,20504,1,128,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,24,5,24,6,19,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,81,0,0,0,0,0,0,0,0,0,18384,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,387,60,0,0,0,'',0,0,0,0,0,0,1),(16483,4,4,'Marshal\'s Plate Boots',30319,4,32768,1,83212,16642,8,1,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,26,4,15,3,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,507,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,384,75,0,0,0,'',0,0,0,0,0,0,1),(16480,4,4,'Field Marshal\'s Plate Shoulderguards',30318,4,32768,1,95235,19047,3,1,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,26,4,15,3,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,553,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,384,100,0,0,0,'',0,0,0,0,0,0,1),(16479,4,4,'Marshal\'s Plate Legguards',30317,4,32768,1,109282,21856,7,1,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,20,4,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,646,0,0,0,0,0,0,0,0,0,7598,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,384,120,0,0,0,'',0,0,0,0,0,0,1),(16478,4,4,'Field Marshal\'s Plate Helm',30316,4,32768,1,94516,18903,1,1,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,35,4,19,3,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,599,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,384,100,0,0,0,'',0,0,0,0,0,0,1),(16477,4,4,'Field Marshal\'s Plate Armor',30315,4,32768,1,125536,25107,5,1,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,35,4,13,3,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,738,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,384,165,0,0,0,'',0,0,0,0,0,0,1),(16476,4,4,'Field Marshal\'s Lamellar Pauldrons',30318,4,32768,1,93787,18757,3,2,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,18,4,17,5,10,6,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,553,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,402,100,0,0,0,'',0,0,0,0,0,0,1),(16475,4,4,'Marshal\'s Lamellar Legplates',30317,4,32768,1,118969,23793,7,2,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,19,4,15,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,646,0,0,0,0,0,0,0,0,0,15464,1,0,0,-1,0,-1,7598,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,402,120,0,0,0,'',0,0,0,0,0,0,1),(16474,4,4,'Field Marshal\'s Lamellar Faceguard',30316,4,32768,1,100317,20063,1,2,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,35,4,19,5,0,3,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,599,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,402,100,0,0,0,'',0,0,0,0,0,0,1),(16539,4,1,'General\'s Silk Boots',32996,4,32768,1,84182,16836,8,128,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,21,5,21,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,69,0,0,0,0,0,0,0,0,0,9342,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,387,50,0,0,0,'',0,0,0,0,0,0,1),(16536,4,1,'Warlord\'s Silk Amice',33089,4,32768,1,93758,18751,3,128,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,22,5,17,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0,0,0,25110,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,387,60,0,0,0,'',0,0,0,0,0,0,1),(16471,4,4,'Marshal\'s Lamellar Gloves',30321,4,32768,1,57148,11429,10,2,-1,71,60,0,0,0,16,0,0,0,1,1,0,4,20,7,16,5,0,3,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,461,0,0,0,0,0,0,0,0,0,23300,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,402,55,0,0,0,'',0,0,0,0,0,0,1),(16468,4,3,'Field Marshal\'s Chain Spaulders',32092,4,32768,1,147880,29576,3,4,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,26,3,15,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,312,0,0,0,0,0,0,0,0,0,9332,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,395,85,0,0,0,'',0,0,0,0,0,0,1),(16467,4,3,'Marshal\'s Chain Legguards',32097,4,32768,1,168943,33788,7,4,-1,71,60,0,0,0,16,0,0,0,1,1,0,3,23,7,22,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,364,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,13669,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,395,105,0,0,0,'',0,0,0,0,0,0,1),(16466,4,3,'Field Marshal\'s Chain Breastplate',32094,4,32768,1,194844,38968,5,4,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,24,3,23,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,416,0,0,0,0,0,0,0,0,0,14049,1,0,0,-1,0,-1,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,395,140,0,0,0,'',0,0,0,0,0,0,1),(16465,4,3,'Field Marshal\'s Chain Helm',32093,4,32768,1,145586,29117,1,4,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,27,3,19,5,17,6,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,338,0,0,0,0,0,0,0,0,0,9331,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,395,85,0,0,0,'',0,0,0,0,0,0,1),(16463,4,3,'Marshal\'s Chain Grips',32098,4,32768,1,83221,16644,10,4,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,18,3,17,5,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,260,0,0,0,0,0,0,0,0,0,23157,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,395,50,0,0,0,'',0,0,0,0,0,0,1),(16462,4,3,'Marshal\'s Chain Boots',32095,4,32768,1,124912,24982,8,4,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,26,3,14,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,286,0,0,0,0,0,0,0,0,0,13669,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,395,70,0,0,0,'',0,0,0,0,0,0,1),(16459,4,2,'Marshal\'s Dragonhide Boots',30333,4,32768,1,102463,20492,8,1024,-1,71,60,0,0,0,16,0,0,0,1,1,0,4,15,7,14,5,11,6,10,3,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,136,0,0,0,0,0,0,0,0,0,25110,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,397,60,0,0,0,'',0,0,0,0,0,0,1),(16457,4,2,'Field Marshal\'s Leather Epaulets',30328,4,32768,1,126763,25352,3,8,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,26,3,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,148,0,0,0,0,0,0,0,0,0,9332,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,394,70,0,0,0,'',0,0,0,0,0,0,1),(16456,4,2,'Marshal\'s Leather Leggings',30329,4,32768,1,145493,29098,7,8,-1,71,60,0,0,0,16,0,0,0,1,1,0,3,0,7,24,4,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,173,0,0,0,0,0,0,0,0,0,7598,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,394,90,0,0,0,'',0,0,0,0,0,0,1),(16455,4,2,'Field Marshal\'s Leather Mask',30330,4,32768,1,125864,25172,1,8,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,35,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,160,0,0,0,0,0,0,0,0,0,13669,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,9336,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,394,70,0,0,0,'',0,0,0,0,0,0,1),(16454,4,2,'Marshal\'s Leather Handgrips',30334,4,32768,1,72222,14444,10,8,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,18,3,14,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,123,0,0,0,0,0,0,0,0,0,14049,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,394,40,0,0,0,'',0,0,0,0,0,0,1),(16453,4,2,'Field Marshal\'s Leather Chestpiece',30327,4,32768,1,166621,33324,5,8,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,35,3,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,197,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,394,120,0,0,0,'',0,0,0,0,0,0,1),(16452,4,2,'Field Marshal\'s Dragonhide Breastplate',30327,4,32768,1,166014,33202,5,1024,-1,74,60,0,0,0,17,0,0,0,1,1,0,4,19,7,18,3,14,5,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,197,0,0,0,0,0,0,0,0,0,14089,1,0,0,-1,0,-1,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,397,120,0,0,0,'',0,0,0,0,0,0,1),(16451,4,2,'Field Marshal\'s Dragonhide Helmet',30330,4,32768,1,124055,24811,1,1024,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,16,3,16,4,15,5,15,6,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,160,0,0,0,0,0,0,0,0,0,9346,1,0,0,-1,0,-1,14027,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,397,70,0,0,0,'',0,0,0,0,0,0,1),(16450,4,2,'Marshal\'s Dragonhide Legguards',30329,4,32768,1,142360,28472,7,1024,-1,71,60,0,0,0,16,0,0,0,1,1,0,4,16,3,16,7,15,5,13,6,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,173,0,0,0,0,0,0,0,0,0,13669,1,0,0,-1,0,-1,9332,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,397,90,0,0,0,'',0,0,0,0,0,0,1),(16449,4,2,'Field Marshal\'s Dragonhide Spaulders',30328,4,32768,1,123156,24631,3,1024,-1,74,60,0,0,0,17,0,0,0,1,1,0,4,12,3,12,7,12,6,11,5,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,148,0,0,0,0,0,0,0,0,0,9346,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,397,70,0,0,0,'',0,0,0,0,0,0,1),(16446,4,2,'Marshal\'s Leather Footguards',30333,4,32768,1,105206,21041,8,8,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,26,3,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,136,0,0,0,0,0,0,0,0,0,23049,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,394,60,0,0,0,'',0,0,0,0,0,0,1),(16444,4,1,'Field Marshal\'s Silk Spaulders',33004,4,32768,1,96713,19342,3,128,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,22,5,17,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0,0,0,25110,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,388,60,0,0,0,'',0,0,0,0,0,0,1),(16443,4,1,'Field Marshal\'s Silk Vestments',32981,4,32768,1,128464,25692,20,128,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,30,5,25,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,100,0,0,0,0,0,0,0,0,0,18384,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,388,100,0,0,0,'',0,0,0,0,0,0,1),(16442,4,1,'Marshal\'s Silk Leggings',28715,4,32768,1,118901,23780,7,128,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,23,6,19,5,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,88,0,0,0,0,0,0,0,0,0,14127,1,0,0,-1,0,-1,0,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,388,75,0,0,0,'',0,0,0,0,0,0,1),(16441,4,1,'Field Marshal\'s Coronet',32978,4,32768,1,102878,20575,1,128,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,24,5,24,6,19,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,81,0,0,0,0,0,0,0,0,0,18384,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,388,60,0,0,0,'',0,0,0,0,0,0,1),(16440,4,1,'Marshal\'s Silk Gloves',32988,4,32768,1,59036,11807,10,128,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,16,5,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,63,0,0,0,0,0,0,0,0,0,22747,1,0,0,-1,0,-1,23037,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,388,35,0,0,0,'',0,0,0,0,0,0,1),(16494,4,2,'Blood Guard\'s Dragonhide Boots',27263,3,32768,1,56412,11282,8,1024,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,12,4,12,5,5,3,5,6,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,121,0,0,0,0,0,0,0,0,0,9343,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,382,50,0,0,0,'',0,0,0,0,0,0,1),(16492,4,1,'Champion\'s Silk Shoulderpads',31100,3,32768,1,44810,8962,3,128,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,16,5,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,67,0,0,0,0,0,0,0,0,0,9417,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,341,50,0,0,0,'',0,0,0,0,0,0,1),(16491,4,1,'Legionnaire\'s Silk Robes',31102,3,32768,1,59534,11906,20,128,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,20,5,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,89,0,0,0,0,0,0,0,0,0,18384,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,341,80,0,0,0,'',0,0,0,0,0,0,1),(16490,4,1,'Legionnaire\'s Silk Pants',26144,3,32768,1,57801,11560,7,128,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,16,6,16,5,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,78,0,0,0,0,0,0,0,0,0,14254,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,341,65,0,0,0,'',0,0,0,0,0,0,1),(16489,4,1,'Champion\'s Silk Hood',31099,3,32768,1,43191,8638,1,128,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,16,5,16,6,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,73,0,0,0,0,0,0,0,0,0,18384,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,341,50,0,0,0,'',0,0,0,0,0,0,1),(16487,4,1,'Blood Guard\'s Silk Gloves',31098,3,32768,1,28584,5716,10,128,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,56,0,0,0,0,0,0,0,0,0,23037,1,0,0,-1,0,-1,14248,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,341,30,0,0,0,'',0,0,0,0,0,0,1),(16485,4,1,'Blood Guard\'s Silk Footwraps',31097,3,32768,1,42556,8511,8,128,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,16,5,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,61,0,0,0,0,0,0,0,0,0,9417,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,341,40,0,0,0,'',0,0,0,0,0,0,1),(22857,4,3,'Blood Guard\'s Mail Greaves',31183,3,32768,1,73757,14751,8,64,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,14,5,12,4,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,266,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,22801,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,538,60,0,0,0,'',0,0,0,0,0,0,1),(23309,4,2,'Lieutenant Commander\'s Dragonhide Shoulders',35807,3,32768,1,78099,15619,3,1024,-1,71,60,0,0,0,14,0,0,0,1,1,0,4,12,3,6,7,12,6,6,5,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,206,0,0,0,0,0,0,0,0,0,9343,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,551,60,0,0,0,'',0,0,0,0,0,0,1),(23307,4,3,'Lieutenant Commander\'s Chain Shoulders',35802,3,32768,1,93424,18684,3,4,-1,71,60,0,0,0,14,0,0,0,1,1,0,3,18,7,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,311,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,550,70,0,0,0,'',0,0,0,0,0,0,1),(23306,4,3,'Lieutenant Commander\'s Chain Helm',35801,3,32768,1,92666,18533,1,4,-1,71,60,0,0,0,14,0,0,0,1,1,0,3,18,7,14,5,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,337,0,0,0,0,0,0,0,0,0,7598,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,550,70,0,0,0,'',0,0,0,0,0,0,1),(23291,4,1,'Knight-Lieutenant\'s Silk Walkers',31063,3,32768,1,49329,9865,8,128,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,15,5,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,104,0,0,0,0,0,0,0,0,0,9344,1,0,0,-1,0,-1,23727,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,546,40,0,0,0,'',0,0,0,0,0,0,1),(16518,4,3,'Blood Guard\'s Mail Walkers',31183,3,32768,1,62426,12485,8,64,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,14,5,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255,0,0,0,0,0,0,0,0,0,9343,1,0,0,-1,0,-1,22801,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,301,60,0,0,0,'',0,0,0,0,0,0,1),(16501,4,2,'Champion\'s Dragonhide Spaulders',28935,3,32768,1,52396,10479,3,1024,-1,63,58,0,0,0,14,0,0,0,1,1,0,4,10,3,10,7,10,6,10,5,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,132,0,0,0,0,0,0,0,0,0,9398,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,382,60,0,0,0,'',0,0,0,0,0,0,1),(23275,4,4,'Knight-Lieutenant\'s Lamellar Sabatons',31082,3,32768,1,50069,10013,8,2,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,12,4,12,5,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,472,0,0,0,0,0,0,0,0,0,9344,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,544,65,0,0,0,'',0,0,0,0,0,0,1),(22883,4,1,'Legionnaire\'s Silk Legguards',26144,3,0,1,73572,14714,7,128,511,68,60,0,0,0,12,0,0,0,1,1,0,7,18,5,17,6,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,144,0,0,0,0,0,0,0,0,0,14248,1,0,0,-1,0,-1,18384,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,542,65,0,0,0,'',0,0,0,0,0,0,1),(22862,4,3,'Blood Guard\'s Chain Vices',31182,3,32768,1,49869,9973,10,4,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,16,3,18,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,242,0,0,0,0,0,0,0,0,0,28539,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,543,40,0,0,0,'',0,0,0,0,0,0,1),(22863,4,2,'Blood Guard\'s Dragonhide Grips',27265,3,32768,1,39737,7947,10,1024,-1,66,60,0,0,0,11,0,0,0,1,1,0,4,13,3,10,7,12,5,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,115,0,0,0,0,0,0,0,0,0,23217,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,539,35,0,0,0,'',0,0,0,0,0,0,1),(16521,4,3,'Champion\'s Mail Helm',30072,3,32768,1,62862,12572,1,64,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,25,5,9,4,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,301,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,301,70,0,0,0,'',0,0,0,0,0,0,1),(16527,4,3,'Legionnaire\'s Chain Leggings',30367,3,32768,1,88015,17603,7,4,-1,63,58,0,0,0,12,0,0,0,1,1,0,3,18,7,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,324,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,13669,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,361,90,0,0,0,'',0,0,0,0,0,0,1),(16432,4,4,'Lieutenant Commander\'s Plate Pauldrons',26662,3,32768,1,43683,8736,3,1,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,23,4,7,3,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,493,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,282,80,0,0,0,'',0,0,0,0,0,0,1),(16514,4,4,'Champion\'s Plate Headguard',30071,3,32768,1,45121,9024,1,1,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,31,4,9,3,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,534,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,281,80,0,0,0,'',0,0,0,0,0,0,1),(16503,4,2,'Champion\'s Dragonhide Helm',28106,3,32768,1,52790,10558,1,1024,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,16,3,11,4,11,5,11,6,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,143,0,0,0,0,0,0,0,0,0,9329,1,0,0,-1,0,-1,9342,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,382,60,0,0,0,'',0,0,0,0,0,0,1),(16510,4,4,'Blood Guard\'s Plate Gloves',31051,3,32768,1,29657,5931,10,1,-1,63,58,0,0,0,11,0,0,0,1,1,0,4,16,7,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,410,0,0,0,0,0,0,0,0,0,22778,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,281,45,0,0,0,'',0,0,0,0,0,0,1),(16516,4,4,'Champion\'s Plate Pauldrons',31049,3,32768,1,41118,8223,3,1,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,23,4,7,3,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,493,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,281,80,0,0,0,'',0,0,0,0,0,0,1),(17566,4,1,'Lieutenant Commander\'s Headguard',30341,3,32768,1,44318,8863,1,256,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,20,5,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,73,0,0,0,0,0,0,0,0,0,9345,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,346,50,0,0,0,'',0,0,0,0,0,0,1),(16433,4,4,'Knight-Captain\'s Lamellar Breastplate',30315,3,32768,1,58457,11691,5,2,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,25,4,9,3,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,657,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,401,135,0,0,0,'',0,0,0,0,0,0,1),(22843,4,3,'Blood Guard\'s Chain Greaves',31181,3,32768,1,75422,15084,8,4,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,19,3,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,266,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,543,60,0,0,0,'',0,0,0,0,0,0,1),(17564,4,1,'Knight-Lieutenant\'s Dreadweave Gloves',31060,3,32768,1,29332,5866,10,256,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,18,5,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,56,0,0,0,0,0,0,0,0,0,23046,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,346,30,0,0,0,'',0,0,0,0,0,0,1),(17562,4,1,'Knight-Lieutenant\'s Dreadweave Boots',31059,3,32768,1,43683,8736,8,256,-1,63,58,0,0,0,11,0,0,0,1,1,0,5,15,7,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,61,0,0,0,0,0,0,0,0,0,14254,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,346,40,0,0,0,'',0,0,0,0,0,0,1),(16525,4,3,'Legionnaire\'s Chain Breastplate',31048,3,32768,1,87375,17475,5,4,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,18,3,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,370,0,0,0,0,0,0,0,0,0,9334,1,0,0,-1,0,-1,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,361,120,0,0,0,'',0,0,0,0,0,0,1),(16523,4,3,'Legionnaire\'s Mail Leggings',31186,3,32768,1,86745,17349,7,64,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,20,5,11,3,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,324,0,0,0,0,0,0,0,0,0,15715,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,301,90,0,0,0,'',0,0,0,0,0,0,1),(16515,4,4,'Legionnaire\'s Plate Legguards',31052,3,32768,1,60375,12075,7,1,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,13,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,575,0,0,0,0,0,0,0,0,0,7598,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,281,100,0,0,0,'',0,0,0,0,0,0,1),(16522,4,3,'Legionnaire\'s Mail Chestpiece',31185,3,32768,1,84136,16827,5,64,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,20,5,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,370,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,301,120,0,0,0,'',0,0,0,0,0,0,1),(16519,4,3,'Blood Guard\'s Mail Grips',27279,3,32768,1,41593,8318,10,64,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,15,5,7,4,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,231,0,0,0,0,0,0,0,0,0,14254,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,301,40,0,0,0,'',0,0,0,0,0,0,1),(17602,4,1,'Field Marshal\'s Headdress',32980,4,32768,1,102198,20439,1,16,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,28,5,24,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,81,0,0,0,0,0,0,0,0,0,14799,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,389,60,0,0,0,'',0,0,0,0,0,0,1),(16505,4,2,'Legionnaire\'s Leather Hauberk',31039,3,32768,1,70920,14184,5,8,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,25,3,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,176,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,347,100,0,0,0,'',0,0,0,0,0,0,1),(16508,4,2,'Legionnaire\'s Leather Leggings',31040,3,32768,1,73619,14723,7,8,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,13,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,154,0,0,0,0,0,0,0,0,0,7598,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,347,75,0,0,0,'',0,0,0,0,0,0,1),(16506,4,2,'Champion\'s Leather Headguard',30358,3,32768,1,53384,10676,1,8,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,26,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,143,0,0,0,0,0,0,0,0,0,13669,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,9141,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,347,60,0,0,0,'',0,0,0,0,0,0,1),(16507,4,2,'Champion\'s Leather Mantle',31038,3,32768,1,55014,11002,3,8,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,23,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,132,0,0,0,0,0,0,0,0,0,9141,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,347,60,0,0,0,'',0,0,0,0,0,0,1),(16509,4,4,'Blood Guard\'s Plate Boots',31050,3,32768,1,44331,8866,8,1,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,23,4,8,3,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,452,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,281,65,0,0,0,'',0,0,0,0,0,0,1),(16499,4,2,'Blood Guard\'s Leather Vices',31036,3,32768,1,34664,6932,10,8,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,15,3,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,110,0,0,0,0,0,0,0,0,0,15807,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,347,35,0,0,0,'',0,0,0,0,0,0,1),(22864,4,2,'Blood Guard\'s Leather Grips',31036,3,32768,1,41866,8373,10,8,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,18,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,155,0,0,0,0,0,0,0,0,0,9331,1,0,0,-1,0,-1,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,522,35,0,0,0,'',0,0,0,0,0,0,1),(16437,4,1,'Marshal\'s Silk Footwraps',33009,4,32768,1,87619,17523,8,128,-1,71,60,0,0,0,16,0,0,0,1,1,0,5,21,7,21,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,69,0,0,0,0,0,0,0,0,0,9342,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,388,50,0,0,0,'',0,0,0,0,0,0,1),(16502,4,2,'Legionnaire\'s Dragonhide Trousers',27267,3,32768,1,70128,14025,7,1024,-1,63,58,0,0,0,12,0,0,0,1,1,0,4,12,3,12,7,12,6,12,5,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,154,0,0,0,0,0,0,0,0,0,13669,1,0,0,-1,0,-1,9330,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,382,75,0,0,0,'',0,0,0,0,0,0,1),(16448,4,2,'Marshal\'s Dragonhide Gauntlets',30334,4,32768,1,70662,14132,10,1024,-1,71,60,0,0,0,16,0,0,0,1,1,0,4,18,3,17,7,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,123,0,0,0,0,0,0,0,0,0,23217,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,397,40,0,0,0,'',0,0,0,0,0,0,1),(15196,4,0,'Private\'s Tabard',31254,1,0,1,10000,2500,19,-1,-1,20,0,0,0,0,5,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(16391,4,1,'Knight-Lieutenant\'s Silk Gloves',31064,3,32768,1,28261,5652,10,128,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,56,0,0,0,0,0,0,0,0,0,23037,1,0,0,-1,0,-1,14248,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,343,30,0,0,0,'',0,0,0,0,0,0,1);

-- Reset T1/T2 sets to 1.5 stats rather than 1.12 stats above
INSERT INTO item_template
(entry,
stat_type1, stat_value1, stat_type2, stat_value2, stat_type3, stat_value3, stat_type4, stat_value4, stat_type5, stat_value5, stat_type6, stat_value6,
armor, fire_res, nature_res, frost_res, shadow_res, arcane_res,
spellid_1, spelltrigger_1, spellid_2, spelltrigger_2, spellid_3, spelltrigger_3)
VALUES
('16811','5','18','6','15','7','17','0','0','0','0','0','0','70','0','0','0','7','0','9406','1','0','0','0','0'),
('16812','5','15','6','15','7','10','0','0','0','0','0','0','63','7','0','0','0','0','21626','1','9406','1','0','0'),
('16813','5','27','6','20','7','17','0','0','0','0','0','0','83','10','0','0','0','0','9417','1','9408','1','0','0'),
('16814','5','24','6','20','7','18','0','0','0','0','0','0','89','0','0','0','10','0','21626','1','9408','1','0','0'),
('16815','5','27','6','17','7','20','0','0','0','0','0','0','102','10','0','0','0','0','9408','1','0','0','0','0'),
('16816','5','23','6','10','7','13','0','0','0','0','0','0','76','0','0','0','7','0','9415','1','0','0','0','0'),
('16817','5','22','6','10','7','10','0','0','0','0','0','0','57','7','0','0','0','0','21618','1','9415','1','0','0'),
('16819','7','8','5','12','6','7','0','0','0','0','0','0','44','0','0','0','0','0','21624','1','9407','1','0','0'),
('16820','3','29','7','20','4','10','0','0','0','0','0','0','200','10','0','0','0','0','7597','1','0','0','0','0'),
('16821','3','20','7','19','4','6','0','0','0','0','0','0','163','10','0','0','0','0','7598','1','0','0','0','0'),
('16822','3','33','7','15','4','10','0','0','0','0','0','0','175','0','0','0','10','0','7597','1','0','0','0','0'),
('16823','3','26','7','12','4','3','0','0','0','0','0','0','150','0','0','0','7','0','15464','1','0','0','0','0'),
('16824','3','26','7','18','0','0','0','0','0','0','0','0','138','0','0','0','7','0','0','0','0','0','0','0'),
('16825','3','20','7','15','0','0','0','0','0','0','0','0','88','0','0','0','0','0','0','0','0','0','0','0'),
('16826','3','18','7','17','4','12','0','0','0','0','0','0','125','7','0','0','0','0','15464','1','0','0','0','0'),
('16827','3','17','7','18','4','9','0','0','0','0','0','0','113','7','0','0','0','0','7597','1','0','0','0','0'),
('16828','5','22','6','10','7','10','0','0','0','0','0','0','113','7','0','0','0','0','21618','1','9415','1','0','0'),
('16829','5','13','6','15','7','16','0','0','0','0','0','0','138','0','0','0','7','0','21625','1','9406','1','0','0'),
('16830','5','14','6','13','7','13','0','0','0','0','0','0','88','0','0','0','0','0','9396','1','0','0','0','0'),
('16831','5','18','6','15','7','17','0','0','0','0','0','0','125','7','0','0','0','0','9406','1','0','0','0','0'),
('16832','3','25','7','17','4','6','0','0','0','0','0','0','169','10','0','0','0','0','13669','1','0','0','0','0'),
('16833','5','24','6','16','7','23','0','0','0','0','0','0','200','10','0','0','0','0','21625','1','9408','1','0','0'),
('16834','5','28','6','13','7','26','0','0','0','0','0','0','163','10','0','0','0','0','9417','1','0','0','0','0'),
('16835','5','19','6','20','7','18','0','0','0','0','0','0','175','0','0','0','10','0','18384','1','21362','1','9408','1'),
('16836','5','20','6','10','7','13','0','0','0','0','0','0','150','0','0','0','7','0','21618','1','9406','1','0','0'),
('16837','5','10','6','22','7','15','0','0','0','0','0','0','290','0','0','0','7','0','9406','1','0','0','0','0'),
('16838','5','21','6','7','7','12','0','0','0','0','0','0','237','7','0','0','0','0','21618','1','9406','1','0','0'),
('16839','5','13','6','15','7','14','0','0','0','0','0','0','264','7','0','0','0','0','18384','1','9415','1','0','0'),
('16840','5','17','6','11','7','10','0','0','0','0','0','0','185','0','0','0','0','0','9396','1','0','0','0','0'),
('16841','5','27','6','13','7','17','0','0','0','0','0','0','422','10','0','0','0','0','18384','1','9408','1','0','0'),
('16842','5','23','6','13','7','24','0','0','0','0','0','0','343','10','0','0','0','0','21626','1','9408','1','0','0'),
('16843','5','19','6','21','7','18','0','0','0','0','0','0','369','0','0','0','10','0','21627','1','9417','1','0','0'),
('16844','5','18','6','10','7','17','0','0','0','0','0','0','317','0','0','0','7','0','21618','1','9406','1','0','0'),
('16845','3','26','5','11','7','23','0','0','0','0','0','0','422','10','0','0','0','0','7597','1','0','0','0','0'),
('16846','3','23','5','15','6','8','7','23','0','0','0','0','343','10','0','0','0','0','7597','1','0','0','0','0'),
('16847','3','32','5','6','6','8','7','15','0','0','0','0','369','0','0','0','10','0','7597','1','0','0','0','0'),
('16848','3','24','5','5','6','9','7','14','0','0','0','0','317','0','0','0','7','0','15464','1','0','0','0','0'),
('16849','3','28','6','6','7','14','0','0','0','0','0','0','290','0','0','0','7','0','0','0','0','0','0','0'),
('16850','3','20','5','6','6','5','7','11','0','0','0','0','185','0','0','0','0','0','0','0','0','0','0','0'),
('16851','3','18','5','9','6','4','7','16','0','0','0','0','237','7','0','0','0','0','7597','1','0','0','0','0'),
('16852','3','18','7','12','0','0','0','0','0','0','0','0','264','7','0','0','0','0','15465','1','0','0','0','0'),
('16853','5','21','6','13','7','26','4','8','0','0','0','0','749','10','0','0','0','0','9408','1','0','0','0','0'),
('16854','5','24','6','10','7','20','4','9','0','0','0','0','608','10','0','0','0','0','21619','1','9408','1','0','0'),
('16855','5','18','6','18','7','24','4','7','0','0','0','0','655','0','0','0','10','0','21625','1','9408','1','0','0'),
('16856','5','15','6','8','7','22','4','10','0','0','0','0','562','0','0','0','7','0','9406','1','0','0','0','0'),
('16857','5','8','6','11','7','11','4','10','0','0','0','0','328','0','0','0','0','0','21618','1','0','0','0','0'),
('16858','5','20','6','8','7','15','4','13','0','0','0','0','421','7','0','0','0','0','9406','1','0','0','0','0'),
('16859','5','13','6','10','7','20','4','7','0','0','0','0','515','0','0','0','7','0','21624','1','9406','1','0','0'),
('16860','5','15','6','14','7','15','4','10','0','0','0','0','468','7','0','0','0','0','9406','1','0','0','0','0'),
('16861','7','23','4','11','0','0','0','0','0','0','0','0','328','0','0','0','0','0','0','0','0','0','0','0'),
('16862','7','26','4','15','0','0','0','0','0','0','0','0','515','0','0','0','7','0','13383','1','0','0','0','0'),
('16863','7','17','4','22','0','0','0','0','0','0','0','0','468','7','0','0','0','0','15464','1','13383','1','0','0'),
('16864','7','15','4','21','0','0','0','0','0','0','0','0','421','7','0','0','0','0','13669','1','13383','1','0','0'),
('16865','7','28','4','20','0','0','0','0','0','0','0','0','749','10','0','0','0','0','13676','1','13386','1','0','0'),
('16866','7','35','4','15','0','0','0','0','0','0','0','0','608','10','0','0','0','0','13669','1','13386','1','0','0'),
('16867','7','23','4','24','0','0','0','0','0','0','0','0','655','0','0','0','10','0','13665','1','13386','1','0','0'),
('16868','7','22','4','15','0','0','0','0','0','0','0','0','562','0','0','0','7','0','13675','1','13383','1','0','0'),
('16897','5','25','6','17','7','20','0','0','0','0','0','0','225','10','10','0','0','0','18384','1','18032','1','0','0'),
('16898','5','17','6','11','7','15','0','0','0','0','0','0','154','10','0','0','0','0','18384','1','9315','1','0','0'),
('16899','5','19','6','15','7','13','0','0','0','0','0','0','140','0','0','0','10','0','18032','1','0','0','0','0'),
('16900','5','31','6','12','7','20','0','0','0','0','0','0','183','0','0','10','10','0','21626','1','9316','1','0','0'),
('16901','5','26','6','23','7','17','0','0','0','0','0','0','197','10','0','0','0','10','18034','1','0','1','0','0'),
('16902','5','23','6','12','7','15','0','0','0','0','0','0','169','10','0','0','0','0','9316','1','0','1','0','0'),
('16903','5','25','6','12','7','13','0','0','0','0','0','0','126','0','0','0','10','0','9315','1','0','1','0','0'),
('16904','5','15','6','12','7','11','0','0','0','0','0','0','98','0','0','0','0','0','9318','1','0','0','0','0'),
('16905','3','26','7','17','4','12','0','0','0','0','0','0','225','10','10','0','0','0','7597','1','15465','1','0','0'),
('16906','3','25','7','17','4','6','0','0','0','0','0','0','154','10','0','0','0','0','13669','1','0','0','0','0'),
('16907','3','20','7','20','4','19','0','0','0','0','0','0','140','0','0','0','10','0','7219','1','0','0','0','0'),
('16908','3','27','7','25','4','19','0','0','0','0','0','0','183','0','0','10','10','0','7597','1','0','0','0','0'),
('16909','3','37','7','17','4','11','0','0','0','0','0','0','197','10','0','0','0','10','7597','1','0','0','0','0'),
('16910','3','20','7','15','4','13','0','0','0','0','0','0','126','0','0','0','10','0','7597','1','0','0','0','0'),
('16911','3','23','7','13','0','0','0','0','0','0','0','0','98','0','0','0','0','0','15464','1','0','0','0','0'),
('16919','5','17','6','17','7','17','0','0','0','0','0','0','80','10','0','0','0','0','18029','1','0','0','0','0'),
('16920','5','20','6','13','7','12','0','0','0','0','0','0','72','0','0','0','10','0','18384','1','9316','1','0','0'),
('16921','5','27','6','22','7','17','0','0','0','0','0','0','94','10','0','10','0','0','18034','1','0','0','0','0'),
('16922','5','21','6','21','7','16','0','0','0','0','0','0','101','0','0','0','10','10','18033','1','0','0','0','0'),
('16923','5','27','6','16','7','17','0','0','0','0','0','0','116','10','10','0','0','0','18037','1','0','0','0','0'),
('16924','5','25','6','13','7','12','0','0','0','0','0','0','87','5','3','0','0','0','9315','1','0','0','0','0'),
('16925','5','26','6','9','7','14','0','0','0','0','0','0','65','0','0','0','10','0','9315','1','0','0','0','0'),
('16926','5','13','6','16','7','9','0','0','0','0','0','0','51','0','0','0','0','0','9318','1','0','0','0','0'),
('16935','3','23','5','6','6','6','7','13','0','0','0','0','211','0','0','0','0','0','0','0','0','0','0','0'),
('16936','3','20','5','13','6','11','7','15','0','0','0','0','271','0','0','0','10','0','7597','1','0','0','0','0'),
('16937','3','23','5','13','6','6','7','15','0','0','0','0','362','10','0','0','0','0','15464','1','0','0','0','0'),
('16938','3','31','5','15','6','8','7','16','0','0','0','0','422','10','0','0','0','10','15464','1','7597','1','0','0'),
('16939','3','27','5','16','6','8','7','26','0','0','0','0','392','0','0','10','10','0','7597','1','0','0','0','0'),
('16940','3','20','5','13','6','6','7','17','0','0','0','0','301','0','0','0','10','0','7597','1','0','0','0','0'),
('16941','3','30','5','6','6','6','7','15','0','0','0','0','332','10','0','0','0','0','0','0','0','0','0','0'),
('16942','3','34','5','14','6','6','7','17','0','0','0','0','482','10','10','0','0','0','7597','1','0','0','0','0'),
('16943','5','16','6','9','7','13','0','0','0','0','0','0','211','0','0','0','0','0','18379','1','0','0','0','0'),
('16944','5','18','6','11','7','13','0','0','0','0','0','0','271','0','0','0','10','0','18384','1','9315','1','0','0'),
('16945','5','17','6','8','7','23','0','0','0','0','0','0','362','10','0','0','0','0','9317','1','0','0','0','0'),
('16946','5','18','6','20','7','16','0','0','0','0','0','0','422','10','0','0','0','10','18384','1','13881','1','0','0'),
('16947','5','24','6','12','7','20','0','0','0','0','0','0','392','0','0','10','10','0','18384','1','18029','1','0','0'),
('16948','5','17','6','13','7','15','0','0','0','0','0','0','301','0','0','0','10','0','21626','1','9317','1','0','0'),
('16949','5','16','6','16','7','17','0','0','0','0','0','0','332','10','0','0','0','0','14799','1','0','0','0','0'),
('16950','5','31','6','16','7','17','0','0','0','0','0','0','482','10','10','0','0','0','17371','1','0','0','0','0'),
('16951','5','13','6','9','7','23','4','0','0','0','0','0','375','0','0','0','0','0','0','0','0','0','0','0'),
('16952','5','23','6','8','7','15','4','0','0','0','0','0','482','0','0','0','10','0','18029','1','0','0','0','0'),
('16953','5','17','6','8','7','20','4','0','0','0','0','0','642','10','0','0','0','0','21363','1','9408','1','0','0'),
('16954','5','27','6','17','7','26','4','0','0','0','0','0','749','0','0','0','0','0','18029','1','0','0','0','0'),
('16955','5','29','6','17','7','21','4','0','0','0','0','0','696','0','0','10','10','0','18033','1','0','0','0','0'),
('16956','5','20','6','10','7','17','4','0','0','0','0','0','535','0','0','0','10','0','21626','1','23796','1','0','0'),
('16957','5','15','6','12','7','23','4','0','0','0','0','0','589','10','0','0','0','0','9316','1','0','0','0','0'),
('16958','5','21','6','12','7','23','4','0','0','0','0','0','857','10','10','0','0','10','18379','1','18030','1','0','0'),
('16959','7','27','4','13','0','0','0','0','0','0','0','0','375','0','0','0','0','0','0','0','0','0','0','0'),
('16960','7','20','4','20','0','0','0','0','0','0','0','0','482','0','0','0','10','0','13676','1','13386','1','0','0'),
('16961','7','27','4','13','0','0','0','0','0','0','0','0','642','10','0','0','0','0','23516','1','13386','1','0','0'),
('16962','7','27','4','19','0','0','0','0','0','0','0','0','749','10','0','0','0','10','13670','1','21407','1','0','0'),
('16963','7','40','4','17','0','0','0','0','0','0','0','0','696','0','0','10','10','0','21407','1','0','0','0','0'),
('16964','7','20','4','15','0','0','0','0','0','0','0','0','535','0','0','0','10','0','13665','1','13386','1','0','0'),
('16965','7','30','4','13','0','0','0','0','0','0','0','0','589','10','0','0','0','0','23515','1','13386','1','0','0'),
('16966','7','40','4','17','0','0','0','0','0','0','0','0','857','10','10','0','0','0','21407','1','0','0','0','0'),
-- arcanist (1.5)
('16795','7','14','5','35','6','8','0','0','0','0','0','0','83','10','0','0','0','0','9344','1','0','0','0','0'),
('16796','5','24','6','13','7','23','0','0','0','0','0','0','89','0','0','0','10','10','18384','1','9404','1','0','0'),
('16797','5','24','6','9','7','10','0','0','0','0','0','0','76','5','0','0','0','0','13605','1','0','0','0','0'),
('16798','5','33','6','16','7','7','3','7','0','0','0','0','102','0','0','0','0','0','13599','1','9401','0','9404','0'),
('16799','5','20','7','6','6','8','0','0','0','0','0','0','44','7','0','4','0','0','9396','1','21624','1','0','0'),
('16800','7','13','5','15','6','14','0','0','0','0','0','0','70','0','0','0','10','10','18384','1','9402','1','0','0'),
('16801','5','18','6','10','7','17','0','0','0','0','0','0','63','7','0','0','0','0','21618','1','0','0','0','0'),
('16802','5','26','6','10','7','10','0','0','0','0','0','0','57','7','0','0','0','0','9415','1','0','0','0','0'),
-- felheart (1.5)
('16803','5','10','6','8','7','27','0','0','0','0','0','0','70','0','0','0','7','7','9412','1','0','0','0','0'),
('16804','5','11','6','8','7','18','0','0','0','0','0','0','44','0','0','0','0','0','21346','1','7708','1','0','0'),
('16805','5','15','6','8','7','18','0','0','0','0','0','0','63','7','0','0','0','0','18384','1','9415','1','0','0'),
('16806','5','14','6','13','7','14','0','0','0','0','0','0','57','7','0','0','0','0','21348','1','9412','0','0','0'),
('16807','5','17','6','7','7','25','0','0','0','0','0','0','76','0','0','0','7','7','9415','1','0','0','0','0'),
('16808','5','20','6','12','7','27','0','0','0','0','0','0','83','10','0','0','0','0','21595','1','9414','1','0','0'),
('16809','5','20','7','31','0','0','0','0','0','0','0','0','102','10','0','0','0','0','9342','1','23727','1','0','0'),
('16810','5','19','6','10','7','20','0','0','0','0','0','0','89','0','0','0','10','10','14798','1','0','0','0','0'),
-- netherwind (1.5)
('16818', '5', '25', '6', '13', '7', '12', '0', '0', '0', '0', '0', '0', '65', '0', '0', '0', '10', '0', '9343', '1', '0', '0', '0', '0'),
('16912', '5', '17', '6', '20', '7', '13', '0', '0', '0', '0', '0', '0', '80', '0', '10', '0', '0', '0', '13605', '1', '0', '0', '0', '0'),
('16913', '5', '17', '6', '14', '7', '15', '0', '0', '0', '0', '0', '0', '72', '0', '0', '0', '10', '0', '18384', '1', '9344', '1', '0', '0'),
('16914', '5', '32', '6', '12', '7', '14', '0', '0', '0', '0', '0', '0', '94', '0', '0', '10', '10', '0', '18049', '1', '0', '0', '0', '0'),
('16915', '5', '27', '6', '17', '7', '16', '0', '0', '0', '0', '0', '0', '101', '10', '0', '0', '0', '10', '14798', '1', '0', '0', '0', '0'),
('16916', '5', '36', '6', '17', '7', '8', '0', '0', '0', '0', '0', '0', '116', '9', '3', '0', '0', '0', '17868', '1', '0', '0', '0', '0'),
('16917', '5', '18', '6', '13', '7', '16', '0', '0', '0', '0', '0', '0', '87', '10', '0', '0', '0', '0', '21619', '1', '9343', '1', '0', '0'),
('16918', '5', '23', '6', '13', '7', '9', '0', '0', '0', '0', '0', '0', '51', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
-- nemesis (1.5)
('16927', '5', '13', '6', '17', '7', '20', '0', '0', '0', '0', '0', '0', '80', '0', '3', '0', '0', '0', '18009', '1', '0', '0', '0', '0'),
('16928', '5', '16', '6', '7', '7', '17', '0', '0', '0', '0', '0', '0', '72', '0', '0', '0', '10', '0', '20885', '1', '9343', '1', '0', '0'),
('16929', '5', '18', '6', '13', '7', '27', '0', '0', '0', '0', '0', '0', '94', '0', '0', '10', '10', '0', '21599', '1', '14799', '1', '0', '0'),
('16930', '5', '17', '6', '16', '7', '27', '0', '0', '0', '0', '0', '0', '101', '10', '0', '0', '0', '10', '14798', '1', '0', '0', '0', '0'),
('16931', '3', '5', '5', '23', '6', '17', '7', '27', '0', '0', '0', '0', '116', '3', '0', '0', '9', '0', '18009', '1', '0', '0', '0', '0'),
('16932', '5', '13', '6', '10', '7', '20', '0', '0', '0', '0', '0', '0', '87', '10', '0', '0', '0', '0', '21598', '1', '9346', '1', '0', '0'),
('16933', '5', '20', '6', '11', '7', '14', '0', '0', '0', '0', '0', '0', '65', '13', '0', '12', '13', '0', '0', '0', '0', '0', '0', '0'),
('16934', '5', '13', '6', '9', '7', '21', '0', '0', '0', '0', '0', '0', '51', '0', '0', '0', '0', '0', '9397', '1', '0', '0', '0', '0')
ON DUPLICATE KEY UPDATE
stat_type1 = VALUES(stat_type1), stat_value1 = VALUES(stat_value1), stat_type2 = VALUES(stat_type2), stat_value2 = VALUES(stat_value2),
stat_type3 = VALUES(stat_type3), stat_value3 = VALUES(stat_value3), stat_type4 = VALUES(stat_type4), stat_value4 = VALUES(stat_value4),
stat_type5 = VALUES(stat_type5), stat_value5 = VALUES(stat_value5), stat_type6 = VALUES(stat_type6), stat_value6 = VALUES(stat_value6),
armor = VALUES(armor),
fire_res = VALUES(fire_res), nature_res = VALUES(nature_res), frost_res = VALUES(frost_res), shadow_res = VALUES(shadow_res), arcane_res = VALUES(arcane_res),
spellid_1 = VALUES(spellid_1), spelltrigger_1 = VALUES(spelltrigger_1), spellid_2 = VALUES(spellid_2), spelltrigger_2 = VALUES(spelltrigger_2),
spellid_3 = VALUES(spellid_3), spelltrigger_3 = VALUES(spelltrigger_3);

-- Felheart Set (1.5)
-- Felheart Belt ID: 16806
UPDATE `item_template` SET `stat_type1` = 5, `stat_value1` = 14, `stat_type2` = 6, `stat_value2` = 13, `stat_type3` = 7, `stat_value3` = 14, `stat_type4` = 0, `stat_value4` = 0, `stat_type5` = 0, `stat_value5` = 0, `stat_type6` = 0, `stat_value6` = 0, `stat_type7` = 0, `stat_value7` = 0, `stat_type8` = 0, `stat_value8` = 0, `stat_type9` = 0, `stat_value9` = 0, `stat_type10` = 0, `stat_value10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 57, `holy_res` = 0, `fire_res` = 7, `nature_res` = 0, `frost_res` = 0, `shadow_res` = 0, `arcane_res` = 0, `spellid_1` = 21348, `spelltrigger_1` = 1, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 9412, `spelltrigger_2` = 1, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16806;
-- Felheart Bracers ID: 16804
UPDATE `item_template` SET `stat_type1` = 5, `stat_value1` = 11, `stat_type2` = 6, `stat_value2` = 8, `stat_type3` = 7, `stat_value3` = 18, `stat_type4` = 0, `stat_value4` = 0, `stat_type5` = 0, `stat_value5` = 0, `stat_type6` = 0, `stat_value6` = 0, `stat_type7` = 0, `stat_value7` = 0, `stat_type8` = 0, `stat_value8` = 0, `stat_type9` = 0, `stat_value9` = 0, `stat_type10` = 0, `stat_value10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 44, `holy_res` = 0, `fire_res` = 0, `nature_res` = 0, `frost_res` = 0, `shadow_res` = 0, `arcane_res` = 0, `spellid_1` = 21346, `spelltrigger_1` = 1, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 7708, `spelltrigger_2` = 1, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16804;
-- Felheart Gloves ID: 16805
UPDATE `item_template` SET `stat_type1` = 5, `stat_value1` = 15, `stat_type2` = 6, `stat_value2` = 8, `stat_type3` = 7, `stat_value3` = 18, `stat_type4` = 0, `stat_value4` = 0, `stat_type5` = 0, `stat_value5` = 0, `stat_type6` = 0, `stat_value6` = 0, `stat_type7` = 0, `stat_value7` = 0, `stat_type8` = 0, `stat_value8` = 0, `stat_type9` = 0, `stat_value9` = 0, `stat_type10` = 0, `stat_value10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 63, `holy_res` = 0, `fire_res` = 7, `nature_res` = 0, `frost_res` = 0, `shadow_res` = 0, `arcane_res` = 0, `spellid_1` = 18384, `spelltrigger_1` = 1, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 9415, `spelltrigger_2` = 1, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16805;
-- Felheart Pants ID: 16810
UPDATE `item_template` SET `stat_type1` = 5, `stat_value1` = 19, `stat_type2` = 6, `stat_value2` = 19, `stat_type3` = 7, `stat_value3` = 20, `stat_type4` = 0, `stat_value4` = 0, `stat_type5` = 0, `stat_value5` = 0, `stat_type6` = 0, `stat_value6` = 0, `stat_type7` = 0, `stat_value7` = 0, `stat_type8` = 0, `stat_value8` = 0, `stat_type9` = 0, `stat_value9` = 0, `stat_type10` = 0, `stat_value10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 89, `holy_res` = 0, `fire_res` = 0, `nature_res` = 0, `frost_res` = 0, `shadow_res` = 10, `arcane_res` = 10, `spellid_1` = 21596, `spelltrigger_1` = 1, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 9417, `spelltrigger_2` = 1, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16810;
-- Felheart Robes ID: 16809
UPDATE `item_template` SET `stat_type1` = 5, `stat_value1` = 20, `stat_type2` = 7, `stat_value2` = 31, `stat_type3` = 6, `stat_value3` = 10, `stat_type4` = 0, `stat_value4` = 0, `stat_type5` = 0, `stat_value5` = 0, `stat_type6` = 0, `stat_value6` = 0, `stat_type7` = 0, `stat_value7` = 0, `stat_type8` = 0, `stat_value8` = 0, `stat_type9` = 0, `stat_value9` = 0, `stat_type10` = 0, `stat_value10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 102, `holy_res` = 0, `fire_res` = 10, `nature_res` = 0, `frost_res` = 0, `shadow_res` = 0, `arcane_res` = 0, `spellid_1` = 9417, `spelltrigger_1` = 1, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 0, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16809;
-- Felheart Shoulder Pads ID: 16807
UPDATE `item_template` SET `stat_type1` = 5, `stat_value1` = 17, `stat_type2` = 6, `stat_value2` = 7, `stat_type3` = 7, `stat_value3` = 25, `stat_type4` = 0, `stat_value4` = 0, `stat_type5` = 0, `stat_value5` = 0, `stat_type6` = 0, `stat_value6` = 0, `stat_type7` = 0, `stat_value7` = 0, `stat_type8` = 0, `stat_value8` = 0, `stat_type9` = 0, `stat_value9` = 0, `stat_type10` = 0, `stat_value10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 76, `holy_res` = 0, `fire_res` = 0, `nature_res` = 0, `frost_res` = 0, `shadow_res` = 7, `arcane_res` = 7, `spellid_1` = 9415, `spelltrigger_1` = 1, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 0, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16807;
-- Felheart Horns ID: 16808
UPDATE `item_template` SET `stat_type1` = 5, `stat_value1` = 17, `stat_type2` = 6, `stat_value2` = 7, `stat_type3` = 7, `stat_value3` = 25, `stat_type4` = 0, `stat_value4` = 0, `stat_type5` = 0, `stat_value5` = 0, `stat_type6` = 0, `stat_value6` = 0, `stat_type7` = 0, `stat_value7` = 0, `stat_type8` = 0, `stat_value8` = 0, `stat_type9` = 0, `stat_value9` = 0, `stat_type10` = 0, `stat_value10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 76, `holy_res` = 0, `fire_res` = 0, `nature_res` = 0, `frost_res` = 0, `shadow_res` = 7, `arcane_res` = 7, `spellid_1` = 21592, `spelltrigger_1` = 1, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 9414, `spelltrigger_2` = 1, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16808;
-- Felheart Slippers ID: 16803
UPDATE `item_template` SET `stat_type1` = 5, `stat_value1` = 10, `stat_type2` = 7, `stat_value2` = 27, `stat_type3` = 6, `stat_value3` = 8, `stat_type4` = 0, `stat_value4` = 0, `stat_type5` = 0, `stat_value5` = 0, `stat_type6` = 0, `stat_value6` = 0, `stat_type7` = 0, `stat_value7` = 0, `stat_type8` = 0, `stat_value8` = 0, `stat_type9` = 0, `stat_value9` = 0, `stat_type10` = 0, `stat_value10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 70, `holy_res` = 0, `fire_res` = 0, `nature_res` = 0, `frost_res` = 0, `shadow_res` = 7, `arcane_res` = 7, `spellid_1` = 9412, `spelltrigger_1` = 1, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 0, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16803;


-- Remove all AB rewards
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` IN (20068,20072,20150,20151,20152,20153,20154,20155,20156,20157,20158,20159,20160,20161,20162,20163,20164,20165,20166,20167,20168,20169,20170,20171,20172,20173,20174,20175,20176,20186,20187,20188,20189,20190,20191,20192,20193,20194,20195,20196,20197,20198,20199,20200,20201,20202,20203,20204,20205,20206,20207,20208,20209,20210,20211,20212,20214,20220,20222,20223,20224,20232,20234,20235,21115,21116,21120,20041,20042,20043,20045,20046,20047,20048,20049,20050,20052,20053,20054,20055,20057,20058,20059,20060,20061,20069,20070,20071,20073,20088,20089,20090,20091,20092,20093,20094,20095,20096,20097,20098,20099,20100,20101,20102,20103,20104,20105,20106,20107,20108,20109,20110,20111,20112,20113,20114,20115,20116,20117,20124,20125,20126,20127,20128,20129,20225,20226,20227,20237,20243,20244,21117,21118,21119);

-- Some items that are available from 1.5 onwards but were incorrectly removed
-- Alterac Valley reputation rewards
-- https://web.archive.org/web/20050611003534/http://wow.allakhazam.com:80/news/sdetail5686.html
-- Additionally, there are comments on individual items dating to just days after the release
INSERT IGNORE INTO `item_template` 
    VALUES  ('19084', '4', '1', 'Stormpike Soldier\'s Cloak', '27197', '3', '32768', '1', '75500', '15100', '16', '-1', '-1', '60', '55', '0', '0', '0', '0', '0', '0', '5', '0', '1', '0', '7', '11', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '43', '0', '0', '0', '5', '0', '0', '0', '0', '0', '14027', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '1'),
            ('19085', '4', '1', 'Frostwolf Advisor\'s Cloak', '31592', '3', '32768', '1', '75776', '15155', '16', '-1', '-1', '60', '55', '0', '0', '0', '0', '0', '0', '5', '0', '1', '0', '7', '11', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '43', '0', '0', '0', '5', '0', '0', '0', '0', '0', '9343', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '1'),
            ('19086', '4', '1', 'Stormpike Sage\'s Cloak', '15042', '3', '32768', '1', '76045', '15209', '16', '-1', '-1', '60', '55', '0', '0', '0', '0', '0', '0', '5', '0', '1', '0', '7', '11', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '43', '0', '0', '0', '5', '0', '0', '0', '0', '0', '9343', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '1'),
            ('19087', '4', '4', 'Frostwolf Plate Belt', '31598', '3', '32768', '1', '50881', '10176', '6', '-1', '-1', '60', '55', '0', '0', '0', '0', '0', '0', '5', '0', '1', '0', '3', '7', '7', '8', '4', '18', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '353', '0', '0', '0', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '5', '0', '0', '0', '0', '45', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '1'),
            ('19088', '4', '3', 'Frostwolf Mail Belt', '31599', '3', '32768', '1', '76597', '15319', '6', '-1', '-1', '60', '55', '0', '0', '0', '0', '0', '0', '5', '0', '1', '0', '3', '12', '7', '12', '5', '12', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '199', '0', '0', '0', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '5', '0', '0', '0', '0', '40', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '1'),
            ('19089', '4', '2', 'Frostwolf Leather Belt', '30839', '3', '32768', '1', '59304', '11860', '6', '-1', '-1', '60', '55', '0', '0', '0', '0', '0', '0', '5', '0', '1', '0', '3', '10', '7', '15', '4', '11', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '95', '0', '0', '0', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '8', '0', '0', '0', '0', '35', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '1'),
            ('19090', '4', '1', 'Frostwolf Cloth Belt', '14686', '3', '32768', '1', '51428', '10285', '6', '-1', '-1', '60', '55', '0', '0', '0', '0', '0', '0', '5', '0', '1', '0', '5', '10', '7', '11', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '48', '0', '0', '0', '5', '0', '0', '0', '0', '0', '9346', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '30', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '1'),
            ('19091', '4', '4', 'Stormpike Plate Girdle', '31597', '3', '32768', '1', '47443', '9488', '6', '-1', '-1', '60', '55', '0', '0', '0', '0', '0', '0', '5', '0', '1', '0', '3', '7', '7', '8', '4', '18', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '353', '0', '0', '0', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '5', '0', '0', '0', '0', '45', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '1'),
            ('19092', '4', '3', 'Stormpike Mail Girdle', '31600', '3', '32768', '1', '71165', '14233', '6', '-1', '-1', '60', '55', '0', '0', '0', '0', '0', '0', '5', '0', '1', '0', '3', '12', '7', '12', '5', '12', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '199', '0', '0', '0', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '5', '0', '0', '0', '0', '40', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '1'),
            ('19093', '4', '2', 'Stormpike Leather Girdle', '31601', '3', '32768', '1', '59304', '11860', '6', '-1', '-1', '60', '55', '0', '0', '0', '0', '0', '0', '5', '0', '1', '0', '3', '10', '7', '15', '4', '11', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '95', '0', '0', '0', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '8', '0', '0', '0', '0', '35', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '1'),
            ('19094', '4', '1', 'Stormpike Cloth Girdle', '31602', '3', '32768', '1', '47443', '9488', '6', '-1', '-1', '60', '55', '0', '0', '0', '0', '0', '0', '5', '0', '1', '0', '5', '10', '7', '11', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '48', '0', '0', '0', '5', '0', '0', '0', '0', '0', '9346', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '30', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '1'),
            ('19095', '4', '0', 'Frostwolf Legionnaire\'s Pendant', '31603', '3', '32768', '1', '71648', '17912', '2', '-1', '-1', '60', '55', '0', '0', '0', '0', '0', '0', '5', '0', '1', '0', '7', '15', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '9330', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '1'),
            ('19096', '4', '0', 'Frostwolf Advisor\'s Pendant', '9859', '3', '32768', '1', '71648', '17912', '2', '-1', '-1', '60', '55', '0', '0', '0', '0', '0', '0', '5', '0', '1', '0', '7', '10', '5', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '21362', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '1'),
            ('19097', '4', '0', 'Stormpike Soldier\'s Pendant', '31604', '3', '32768', '1', '71648', '17912', '2', '-1', '-1', '60', '55', '0', '0', '0', '0', '0', '0', '5', '0', '1', '0', '7', '15', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '9330', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '1');
-- Add summonable boss rewards with correct stats
REPLACE INTO `item_template`
    VALUES  ('19105', '4', '1', 'Frost Runed Headdress', '33462', '3', '0', '1', '87704', '17540', '1', '-1', '-1', '63', '58', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '5', '10', '7', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '73', '0', '0', '0', '0', '0', '0', '0', '0', '0', '17901', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '50', '0', '0', '0', '', '49', '0', '0', '0', '0', '0', '1'),
            ('19109', '4', '0', 'Deep Rooted Ring', '31616', '3', '0', '1', '135681', '33920', '11', '-1', '-1', '63', '58', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '5', '10', '7', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '9417', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '49', '0', '0', '0', '0', '0', '1'),
            ('19110', '2', '7', 'Cold Forged Blade', '31617', '3', '0', '1', '274611', '54922', '13', '-1', '-1', '63', '58', '43', '0', '0', '0', '0', '0', '0', '0', '1', '0', '7', '13', '3', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '75', '140', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2600', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '1', '3', '0', '0', '0', '90', '0', '0', '0', '', '49', '0', '0', '0', '0', '0', '1'),
            ('19111', '4', '3', 'Winteraxe Epaulets', '31618', '3', '0', '1', '124124', '24824', '3', '-1', '-1', '63', '58', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '5', '10', '6', '6', '7', '20', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '278', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '5', '0', '0', '0', '0', '70', '0', '0', '0', '', '49', '0', '0', '0', '0', '0', '1'),
            ('19112', '4', '4', 'Frozen Steel Vambraces', '31619', '3', '0', '1', '54922', '10984', '9', '-1', '-1', '63', '58', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '3', '11', '7', '7', '4', '12', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '287', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '45', '0', '0', '0', '', '49', '0', '0', '0', '0', '0', '1'),
            ('19113', '4', '2', 'Yeti Hide Bracers', '31620', '3', '0', '1', '68652', '13730', '9', '-1', '-1', '63', '58', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '3', '8', '7', '14', '4', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '77', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '8', '0', '0', '0', '0', '35', '0', '0', '0', '', '49', '0', '0', '0', '0', '0', '1');

-- Misc craftables which should have been available since 1.2
-- Dawnbringer Shoulders (ilevel 58 entry 12625)
INSERT INTO `item_template` VALUES ('12625', '4', '4', 'Dawnbringer Shoulders', '25827', '3', '0', '1', '114235', '22847', '3', '-1', '-1', '58', '53', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '6', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '455', '0', '0', '0', '0', '0', '0', '0', '0', '0', '17371', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '2', '', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '80', '0', '0', '0', '', '48', '0', '0', '0', '0', '0', '1');
REPLACE INTO `item_template` VALUES ('12698', '9', '4', 'Plans: Dawnbringer Shoulders', '1102', '3', '64', '1', '22000', '5500', '0', '-1', '-1', '58', '0', '164', '290', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '-1', '16660', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', 'Teaches you how to make Dawnbringer Shoulders.', '0', '0', '0', '0', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '1');
-- Inlaid Thorium Hammer (ilevel 54 entry 12772)
INSERT IGNORE INTO `item_template` VALUES ('12772', '2', '5', 'Inlaid Thorium Hammer', '23230', '2', '0', '1', '194358', '38871', '17', '-1', '-1', '54', '49', '160', '0', '0', '0', '0', '0', '0', '0', '1', '0', '4', '23', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '151', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3000', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '2', '', '0', '0', '0', '0', '0', '2', '1', '0', '0', '0', '85', '0', '0', '0', '', '29', '0', '0', '0', '0', '0', '1');

-- New Hinterlands quest (reward)
INSERT IGNORE INTO `item_template` VALUES ('19115', '4', '0', 'Flask of Forest Mojo', '31623', '2', '0', '1', '44012', '11003', '23', '-1', '-1', '51', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '5', '8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '9415', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '29', '0', '0', '0', '0', '0', '1');

-- AV Completion Reward. Normally not available until 1.6. On Nostalrius the Korrak
-- quest gave rewards, but most players have completed it already with no reward.
-- Therefore it makes sense to use the normal quest. The hammer is a 1.6 item, but
-- if we do not add it here it will be unobtainable. Bit of a caveat.
INSERT IGNORE INTO `item_template` VALUES ('20648', '2', '4', 'Cold Forged Hammer', '33072', '3', '0', '1', '293469', '58693', '21', '-1', '-1', '63', '0', '54', '0', '0', '0', '0', '0', '0', '1', '1', '0', '7', '5', '5', '9', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '72', '135', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2500', '0', '0', '21625', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '1', '3', '0', '0', '0', '90', '0', '0', '0', '', '49', '0', '0', '0', '0', '0', '1');
UPDATE `quest_template` SET `MinLevel` = 51 WHERE `entry` IN (8271, 8272);
DELETE FROM `creature_questrelation` WHERE `quest` IN (8271, 8272);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (13841, 8271), (13840, 8272);

-- New Azuregos drops
-- Should already be available on Darrowshire
-- NOT FOUND: Snowblind Shoes (ilevel 69 entry 19131)
-- REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19131);
-- NOT FOUND: Crystal Adorned Crown (ilevel 68 entry 19132)
-- REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19132);

-- New Kazzak drops
-- Should already be available on Darrowshire
-- Fel Infused Leggings 19133
-- Flayed Doomguard Belt 19134
-- NOT FOUND: Flayed Doomguard Belt (ilevel 68 entry 19134)
-- REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 19134);

-- AQ quest starter item
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 20461);

-- NOT FOUND: Blackhand's Command (BWL Attunement Quest)
REPLACE INTO `forbidden_items` (SELECT `entry` FROM `item_template` WHERE `entry` = 18987);

-- Forbidden Items & quests for 1.5
REPLACE INTO forbidden_items SELECT entry FROM item_template WHERE entry BETWEEN 19574 AND 20266;
REPLACE INTO forbidden_items SELECT entry FROM item_template WHERE entry IN (12056, 12057, 22637, 22722, 22721, 22720, 22718, 22711, 22712, 22715, 22714, 22716, 22713);
REPLACE INTO forbidden_items SELECT entry FROM item_template WHERE entry IN (20214, 20220, 20212, 20203, 20175, 20194, 20176, 20158, 20068);
REPLACE INTO forbidden_items SELECT entry FROM item_template WHERE entry IN (23198, 22397, 22398, 22399, 23197, 23201, 23203, 22401, 22400, 22395, 22396, 22345, 23200, 23199);
REPLACE INTO forbidden_items SELECT entry FROM item_template WHERE entry IN (19202, 19203, 19204, 19205, 19206, 19207, 19208, 19209, 19210, 19211, 19212, 19215, 19216, 19217, 19218, 19219, 19220, 19221, 19326, 19327, 19328, 19329, 19330, 19331, 19332, 19333, 19442, 19444, 19445, 19446, 19447, 19448, 19449, 20040, 20382, 20506, 20507, 20508, 20509, 20510, 20511, 20761, 22392);
REPLACE INTO forbidden_items SELECT entry FROM item_template WHERE entry=22637;

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

CREATE TABLE IF NOT EXISTS forbidden_quests (entry mediumint);
-- Patch 1.5+ quests
REPLACE INTO forbidden_quests SELECT entry FROM quest_template WHERE entry IN (8115, 8122);	
-- Arathi Basin tabard quests and various rep quests
REPLACE INTO forbidden_quests SELECT entry FROM quest_template WHERE entry BETWEEN 8041 AND 8270;

-- T0.5 quests
REPLACE INTO `forbidden_quests` SELECT entry FROM quest_template WHERE entry IN (8949,8950,9015);

-- Add missing Timbermaw Quest (Patch 1.3 version). [DEPRECATED]Winterfall Activity
-- Should be replace with 1.12 version when 1.9 come up.
DELETE FROM `quest_template` WHERE entry = 6241;
INSERT INTO `quest_template` (`entry`, `Method`, `ZoneOrSort`, `MinLevel`, `QuestLevel`, `Type`, `RequiredClasses`, `RequiredRaces`, `RequiredSkill`, `RequiredSkillValue`, `RepObjectiveFaction`, `RepObjectiveValue`, `RequiredMinRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepFaction`, `RequiredMaxRepValue`, `SuggestedPlayers`, `LimitTime`, `QuestFlags`, `SpecialFlags`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `NextQuestInChain`, `SrcItemId`, `SrcItemCount`, `SrcSpell`, `Title`, `Details`, `Objectives`, `OfferRewardText`, `RequestItemsText`, `EndText`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `ReqItemId1`, `ReqItemId2`, `ReqItemId3`, `ReqItemId4`, `ReqItemCount1`, `ReqItemCount2`, `ReqItemCount3`, `ReqItemCount4`, `ReqSourceId1`, `ReqSourceId2`, `ReqSourceId3`, `ReqSourceId4`, `ReqSourceCount1`, `ReqSourceCount2`, `ReqSourceCount3`, `ReqSourceCount4`, `ReqCreatureOrGOId1`, `ReqCreatureOrGOId2`, `ReqCreatureOrGOId3`, `ReqCreatureOrGOId4`, `ReqCreatureOrGOCount1`, `ReqCreatureOrGOCount2`, `ReqCreatureOrGOCount3`, `ReqCreatureOrGOCount4`, `ReqSpellCast1`, `ReqSpellCast2`, `ReqSpellCast3`, `ReqSpellCast4`, `RewChoiceItemId1`, `RewChoiceItemId2`, `RewChoiceItemId3`, `RewChoiceItemId4`, `RewChoiceItemId5`, `RewChoiceItemId6`, `RewChoiceItemCount1`, `RewChoiceItemCount2`, `RewChoiceItemCount3`, `RewChoiceItemCount4`, `RewChoiceItemCount5`, `RewChoiceItemCount6`, `RewItemId1`, `RewItemId2`, `RewItemId3`, `RewItemId4`, `RewItemCount1`, `RewItemCount2`, `RewItemCount3`, `RewItemCount4`, `RewRepFaction1`, `RewRepFaction2`, `RewRepFaction3`, `RewRepFaction4`, `RewRepFaction5`, `RewRepValue1`, `RewRepValue2`, `RewRepValue3`, `RewRepValue4`, `RewRepValue5`, `RewOrReqMoney`, `RewMoneyMaxLevel`, `RewSpell`, `RewSpellCast`, `RewMailTemplateId`, `RewMailDelaySecs`, `PointMapId`, `PointX`, `PointY`, `PointOpt`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `IncompleteEmote`, `CompleteEmote`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `StartScript`, `CompleteScript`) VALUES (6241, 2, 1769, 51, 56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 'Winterfall Activity', 'The Timbermaw tend to stay to themselves, $N. While we do allow safe passage to those that have proven they can be trusted, we try to avoid other furbolg tribes if at all possible.$B$BLately I have noticed that the Winterfall tribe has become increasingly hostile towards us. They seem to be in a state of rage, completely engulfed by their own fear and hatred of anything they do not understand.$B$BIf you could reduce their numbers this would help us greatly, $N.', 'Salfa wants you to kill 6 Winterfall Totemics, 6 Winterfall Den Watchers, and 6 Winterfall Pathfinders.', 'Thank you for what you have done. Please continue to help us, $N. We have very few allies on which to call upon.', 'We very much appreciate what you have done for the Timbermaw, $N. Your continued efforts will surely earn my tribe\'s trust and respect.', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7441, 7440, 7442, 0, 6, 6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 576, 0, 0, 0, 0, 150, 0, 0, 0, 0, 0, 4026, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
-- Timbermaw quests are offered by NPC "Salfa" (ID: 11556)
DELETE FROM `creature_involvedrelation` WHERE id = 11556;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (11556, 6241);
-- INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (11556, 8465); should be back in 1.9
-- INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (11556, 8469); should be back in 1.9

-- Forbid quests which have had the rewards or requirements forbidden
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

DELETE FROM `creature_questrelation` WHERE `quest` BETWEEN 8041 AND 8270;
DELETE FROM `creature_involvedrelation` WHERE `quest` BETWEEN 8041 AND 8270;

-- Transition patch for old mounts (one week event!)

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
