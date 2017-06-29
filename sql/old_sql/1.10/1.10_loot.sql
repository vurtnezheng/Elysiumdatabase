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

