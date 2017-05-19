-- Patch 1.6 World DB Itemization Changes.
-- To be applied on QA first for testing.

-- Removing Idols, Totems & Librams From Loot Table

DELETE FROM `creature_loot_template` WHERE `item` IN (23198, 22397, 22398, 23197, 23201, 23203, 22401, 22400, 22395, 22345, 23200, 23199, 22891, 22890, 22891, 22306, 22311, 22313, 22302, 22304, 22305, 22303, 22301, 22722, 22721, 22714, 22204, 22257, 23320, 22720, 22718, 22711, 22712, 22715, 22713);
DELETE FROM `reference_loot_template` WHERE `item` IN (23198, 22397, 22398, 23197, 23201, 23203, 22401, 22400, 22395, 22345, 23200, 23199, 22891, 22890, 22891, 22311, 22313, 22302, 22304, 22305, 22303, 22301, 22722, 22721, 22714, 22204, 22257, 23320, 22720, 22718, 22711, 22712, 22715, 22716, 22713);

-- Removing In Game Items That Were Released After Patch 1.9

DELETE FROM `creature_loot_template` WHERE `item` IN (24102, 23320, 24101, 22890, 22384, 22390, 22390, 22384, 22406, 22403, 22405, 22407, 22404, 22234, 22412, 22049, 22050, 22051, 22052, 22056, 22389, 22329, 22433, 21547, 22402,22408, 22409, 22410, 22411, 22242, 22241, 22240, 22275, 22232, 22231, 22223, 22212, 22208, 22207, 22205, 22204, 22256, 22255, 22254, 22394, 22311, 22305, 22313, 22321, 22225, 22269, 22268, 22267, 22266, 22271, 22253, 22306, 22311, 22313, 22302, 22304, 22305, 22303, 22301, 22247, 22270, 22245);
DELETE FROM `reference_loot_template` WHERE `item` IN (24102, 23320, 24101, 22890, 22384, 22390, 22390, 22384, 22406, 22403, 22405, 22407, 22404, 22234, 22412, 22049, 22050, 22051, 22052, 22056, 22389, 22329, 22433, 21547, 22402,22408, 22409, 22410, 22411, 22242, 22241, 22240, 22275, 22232, 22231, 22223, 22212, 22208, 22207, 22205, 22204, 22256, 22255, 22254, 22394, 22311, 22305, 22313, 22321, 22225, 22269, 22268, 22267, 22266, 22271, 22253, 22306, 22311, 22313, 22302, 22304, 22305, 22303, 22301, 22247, 22270, 22245);

-- Removing ZG 1.11 Drop

DELETE FROM `creature_loot_template` WHERE `item`  IN (23198, 22397, 22398, 22399, 23197, 23201, 23203, 22401, 22400, 22395, 22396, 22345, 23200, 23199);
DELETE FROM `reference_loot_template` WHERE `item` IN (23198, 22397, 22398, 22399, 23197, 23201, 23203, 22401, 22400, 22395, 22396, 22345, 23200, 23199);

-- Removing 1.11 Relics From Drop

DELETE FROM `creature_loot_template` WHERE `item` IN (23198, 22397, 22398, 23197, 23201, 23203, 22401, 22400, 22395, 22345, 23200, 23199);
DELETE FROM `reference_loot_template` WHERE `item` IN (23198, 22397, 22398, 23197, 23201, 23203, 22401, 22400, 22395, 22345, 23200, 23199);

-- GO "Sothos and Jarien's Heirlooms" Has Been Removed

DELETE FROM `gameobject` WHERE `id` = 181083;

-- Setting "Dreamscale Breastplate" Loot Type to BoP (should be shanged back in 1.10)

UPDATE `item_template` SET `bonding` = '1' WHERE `entry` = '20380';

-- Golemagg Loot Drop Rates & Faction Drop
update reference_loot_template set ChanceOrQuestChance = 20 where entry = 326158 and item in (18842, 17103, 17072);
update reference_loot_template set condition_id = 3 where entry = 326158 and item = 18824;
update reference_loot_template set condition_id = 2 where entry = 326158 and item = 18829;

-- Disable loot:
update creature_loot_template set ChanceOrQuestChance=0 where item=20424;

-- LBRS Gems Pre-1.11
update creature_loot_template set ChanceOrQuestChance=1 where item=12219;
update creature_loot_template set ChanceOrQuestChance=20 where item=12335;
update creature_loot_template set ChanceOrQuestChance=15 where item=12336;
update creature_loot_template set ChanceOrQuestChance=25 where item=12337;

update creature_loot_template set condition_id=70 where item in (22527,22529,22528,22525,22526);
