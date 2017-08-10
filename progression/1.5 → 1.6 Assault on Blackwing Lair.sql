-- 1.5 → 1.6 | Assault on Blackwing Lair

DROP TABLE IF EXISTS `new_items`;
DROP TABLE IF EXISTS `new_events`;
DROP TABLE IF EXISTS `new_quests`;
DROP TABLE IF EXISTS `new_creatures`;

CREATE TABLE IF NOT EXISTS `new_quests` (entry mediumint PRIMARY KEY);
CREATE TABLE IF NOT EXISTS `new_items` (entry mediumint PRIMARY KEY);
CREATE TABLE IF NOT EXISTS `new_events` (entry mediumint PRIMARY KEY);
CREATE TABLE IF NOT EXISTS `new_creatures` (entry mediumint PRIMARY KEY);

-- * INDEX
-- - 1.  NEW ENCOUNTER				 
-- - 2.  NEW EVENTS 					          
-- - 3.  NEW ITEMS 	
-- - 4.  NEW CREATURES			
-- - 5.  NEW QUESTS	
-- - 6.  NEW SPELLS				
-- - 7.  NEW GAMEOBJECTS
-- - 8.  RESTORATION TOOLS	  
-- - 9.  ITEM STAT CHANGES
-- - 10. ADDITIONAL FIXES    

-- * NEW ENCOUNTER	

UPDATE `areatrigger_teleport` SET `required_level` = 60 WHERE `target_map` = 469; -- Blackwing Lair 1.6

-- * NEW EVENTS 	

REPLACE INTO new_events SELECT entry FROM game_event WHERE entry IN (
);

-- * NEW ITEMS 	

REPLACE INTO new_items SELECT entry FROM item_template WHERE entry IN (
19164,   -- Dark Iron Gauntlets | Retail Patch Notes
19165,   -- Flarecore Leggings | Retail Patch Notes
19166,   -- Black Amnesty | Retail Patch Notes
19167,   -- Blackfury | Retail Patch Notes
19168,   -- Blackguard | Retail Patch Notes
19169,   -- Nightfall | Retail Patch Notes
19170,   -- Ebon Hand | Retail Patch Notes
19202,   -- Plans: Heavy Timbermaw Belt | Retail Patch Notes
19203,   -- Plans: Girdle of the Dawn | Retail Patch Notes
19204,   -- Plans: Heavy Timbermaw Boots | Retail Patch Notes
19205,   -- Plans: Gloves of the Dawn | Retail Patch Notes
19206,   -- Plans: Dark Iron Helm | Retail Patch Notes
19207,   -- Plans: Dark Iron Gauntlets | Retail Patch Notes
19208,   -- Plans: Black Amnesty | Retail Patch Notes
19209,   -- Plans: Blackfury | Retail Patch Notes
19210,   -- Plans: Ebon Hand | Retail Patch Notes
19211,   -- Plans: Blackguard | Retail Patch Notes
19212,   -- Plans: Nightfall | Retail Patch Notes
19215,   -- Pattern: Wisdom of the Timbermaw | Retail Patch Notes
19216,   -- Pattern: Argent Boots | Retail Patch Notes
19217,   -- Pattern: Argent Shoulders | Retail Patch Notes
19218,   -- Pattern: Mantle of the Timbermaw | Retail Patch Notes
19219,   -- Pattern: Flarecore Robe | Retail Patch Notes
19220,   -- Pattern: Flarecore Leggings | Retail Patch Notes
19287,   -- Darkmoon Card: Heroism | Retail Patch Notes (Darkmoon Faire)
19288,   -- Darkmoon Card: Blue Dragon | Retail Patch Notes (Darkmoon Faire)
19289,   -- Darkmoon Card: Maelstrom | Retail Patch Notes (Darkmoon Faire)
19290,   -- Darkmoon Card: Twisting Nether | Retail Patch Notes (Darkmoon Faire)
19292,   -- Last Month's Mutton | Retail Patch Notes (Darkmoon Faire)
19293,   -- Last Year's Mutton | Retail Patch Notes (Darkmoon Faire)
19295,   -- Darkmoon Flower | Retail Patch Notes (Darkmoon Faire)
19302,   -- Darkmoon Ring | Retail Patch Notes (Darkmoon Faire)
19303,   -- Darkmoon Necklace | Retail Patch Notes (Darkmoon Faire)
19326,   -- Pattern: Might of the Timbermaw | Retail Patch Notes
19327,   -- Pattern: Timbermaw Brawlers | Retail Patch Notes
19328,   -- Pattern: Dawn Treaders | Retail Patch Notes
19329,   -- Pattern: Golden Mantle of the Dawn | Retail Patch Notes
19330,   -- Pattern: Lava Belt | Retail Patch Notes
19331,   -- Pattern: Chromatic Gauntlets | Retail Patch Notes
19332,   -- Pattern: Corehound Belt | Retail Patch Notes
19333,   -- Pattern: Molten Belt | Retail Patch Notes
19334,   -- The Untamed Blade | BWL Loot
19335,   -- Spineshatter | BWL Loot
19336,   -- Arcane Infused Gem | BWL Loot
19337,   -- The Black Book | BWL Loot
19339,   -- Mind Quickening Gem | BWL Loot
19340,   -- Rune of Metamorphosis | BWL Loot
19341,   -- Lifegiving Gem | BWL Loot
19342,   -- Venomous Totem | BWL Loot
19343,   -- Scrolls of Blinding Light | BWL Loot
19344,   -- Natural Alignment Crystal | BWL Loot
19345,   -- Aegis of Preservation | BWL Loot
19346,   -- Dragonfang Blade | BWL Loot
19347,   -- Claw of Chromaggus | BWL Loot
19348,   -- Red Dragonscale Protector | BWL Loot
19349,   -- Elementium Reinforced Bulwark | BWL Loot
19350,   -- Heartstriker | BWL Loot
19351,   -- Maladath, Runed Blade of the Black Flight | BWL Loot
19352,   -- Chromatically Tempered Sword | BWL Loot
19353,   -- Drake Talon Cleaver | BWL Loot
19354,   -- Draconic Avenger | BWL Loot
19355,   -- Shadow Wing Focus Staff | BWL Loot
19356,   -- Staff of the Shadow Flame | BWL Loot
19357,   -- Herald of Woe | BWL Loot
19358,   -- Draconic Maul | BWL Loot
19360,   -- Lok'amir il Romathis | BWL Loot
19361,   -- Ashjre'thul, Crossbow of Smiting | BWL Loot
19362,   -- Doom's Edge | BWL Loot
19363,   -- Crul'shorukh, Edge of Chaos | BWL Loot
19364,   -- Ashkandi, Greatsword of the Brotherhood | BWL Loot
19365,   -- Claw of the Black Drake | BWL Loot
19366,   -- Master Dragonslayer's Orb | BWL Loot
19367,   -- Dragon's Touch | BWL Loot
19368,   -- Dragonbreath Hand Cannon | BWL Loot
19369,   -- Gloves of Rapid Evolution | BWL Loot
19370,   -- Mantle of the Blackwing Cabal | BWL Loot
19371,   -- Pendant of the Fallen Dragon | BWL Loot
19372,   -- Helm of Endless Rage | BWL Loot
19373,   -- Black Brood Pauldrons | BWL Loot
19374,   -- Bracers of Arcane Accuracy | BWL Loot
19375,   -- Mish'undare, Circlet of the Mind Flayer | BWL Loot
19376,   -- Archimtiros' Ring of Reckoning | BWL Loot
19377,   -- Prestor's Talisman of Connivery | BWL Loot
19378,   -- Cloak of the Brood Lord | BWL Loot
19379,   -- Neltharion's Tear | BWL Loot
19380,   -- Therazane's Link | BWL Loot
19381,   -- Boots of the Shadow Flame | BWL Loot
19382,   -- Pure Elementium Band | BWL Loot
19383,   -- Master Dragonslayer's Medallion | BWL Loot
19384,   -- Master Dragonslayer's Ring | BWL Loot
19385,   -- Empowered Leggings | BWL Loot
19386,   -- Elementium Threaded Cloak | BWL Loot
19387,   -- Chromatic Boots | BWL Loot
19388,   -- Angelista's Grasp | BWL Loot
19389,   -- Taut Dragonhide Shoulderpads | BWL Loot
19390,   -- Taut Dragonhide Gloves | BWL Loot
19391,   -- Shimmering Geta | BWL Loot
19394,   -- Drake Talon Pauldrons | BWL Loot
19395,   -- Rejuvenating Gem | BWL Loot
19396,   -- Taut Dragonhide Belt | BWL Loot
19397,   -- Ring of Blackrock | BWL Loot
19398,   -- Cloak of Firemaw | BWL Loot
19399,   -- Black Ash Robe | BWL Loot
19400,   -- Firemaw's Clutch | BWL Loot
19402,   -- Legguards of the Fallen Crusader | BWL Loot
19403,   -- Band of Forced Concentration | BWL Loot
19405,   -- Malfurion's Blessed Bulwark | BWL Loot
19406,   -- Drake Fang Talisman | BWL Loot
19407,   -- Ebony Flame Gloves | BWL Loot
19426,   -- Orb of the Darkmoon,   -- ,   -- 
19430,   -- Shroud of Pure Thought | BWL Loot
19431,   -- Styleen's Impeding Scarab | BWL Loot
19432,   -- Circle of Applied Force | BWL Loot
19433,   -- Emberweave Leggings | BWL Loot
19434,   -- Band of Dark Dominion | BWL Loot
19435,   -- Essence Gatherer | BWL Loot
19436,   -- Cloak of Draconic Might | BWL Loot
19437,   -- Boots of Pure Thought | BWL Loot
19438,   -- Ringo's Blizzard Boots | BWL Loot
19439,   -- Interlaced Shadow Jerkin | BWL Loot
19505,   -- Warsong Battle Tabard | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19506,   -- Silverwing Battle Tabard | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19510,   -- Legionnaire's Band | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19511,   -- Legionnaire's Band | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19512,   -- Legionnaire's Band | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19513,   -- Legionnaire's Band | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19514,   -- Protector's Band | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19515,   -- Protector's Band | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19516,   -- Protector's Band | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19517,   -- Protector's Band | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19518,   -- Advisor's Ring | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19519,   -- Advisor's Ring | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19520,   -- Advisor's Ring | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19521,   -- Advisor's Ring | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19522,   -- Lorekeeper's Ring | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19523,   -- Lorekeeper's Ring | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19524,   -- Lorekeeper's Ring | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19525,   -- Lorekeeper's Ring | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19526,   -- Battle Healer's Cloak | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19527,   -- Battle Healer's Cloak | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19528,   -- Battle Healer's Cloak | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19529,   -- Battle Healer's Cloak | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19530,   -- Caretaker's Cape | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19531,   -- Caretaker's Cape | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19532,   -- Caretaker's Cape | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19533,   -- Caretaker's Cape | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19534,   -- Scout's Medallion | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19535,   -- Scout's Medallion | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19536,   -- Scout's Medallion | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19537,   -- Scout's Medallion | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19538,   -- Sentinel's Medallion | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19539,   -- Sentinel's Medallion | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19540,   -- Sentinel's Medallion | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19541,   -- Sentinel's Medallion | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19542,   -- Scout's Blade | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19543,   -- Scout's Blade | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19544,   -- Scout's Blade | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19545,   -- Scout's Blade | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19546,   -- Sentinel's Blade | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19547,   -- Sentinel's Blade | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19548,   -- Sentinel's Blade | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19549,   -- Sentinel's Blade | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19550,   -- Legionnaire's Sword | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19551,   -- Legionnaire's Sword | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19552,   -- Legionnaire's Sword | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19553,   -- Legionnaire's Sword | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19554,   -- Protector's Sword | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19555,   -- Protector's Sword | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19556,   -- Protector's Sword | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19557,   -- Protector's Sword | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19558,   -- Outrider's Bow | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19559,   -- Outrider's Bow | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19560,   -- Outrider's Bow | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19561,   -- Outrider's Bow | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19562,   -- Outrunner's Bow | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19563,   -- Outrunner's Bow | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19564,   -- Outrunner's Bow | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19565,   -- Outrunner's Bow | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19566,   -- Advisor's Gnarled Staff | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19567,   -- Advisor's Gnarled Staff | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19568,   -- Advisor's Gnarled Staff | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19569,   -- Advisor's Gnarled Staff | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19570,   -- Lorekeeper's Staff | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19571,   -- Lorekeeper's Staff | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19572,   -- Lorekeeper's Staff | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
19573,   -- Lorekeeper's Staff | WSG rep reward (originally patch 1.6...WSG released patch 1.5)
);

-- * NEW CREATURES

REPLACE INTO new_creatures SELECT entry FROM creature_template WHERE entry IN (
);

-- * NEW QUESTS	

REPLACE INTO new_quests SELECT entry FROM quest_template WHERE entry IN (
);

-- * NEW SPELLS	

DELETE FROM spell_disabled WHERE entry IN ();
			
-- * NEW GAMEOBJECTS	

-- * RESTORATION TOOLS

REPLACE INTO creature_loot_template SELECT * FROM creature_loot_template_full WHERE item IN (SELECT entry FROM `new_items`);
REPLACE INTO reference_loot_template SELECT * FROM reference_loot_template_full WHERE item IN (SELECT entry FROM `new_items`);

REPLACE INTO creature_loot_template SELECT c.* FROM creature_loot_template_full c INNER JOIN reference_loot_template_full r ON c.item = r.entry WHERE r.item IN (SELECT entry FROM `new_items`);
REPLACE INTO disenchant_loot_template SELECT * FROM disenchant_loot_template_full WHERE item IN (SELECT entry FROM `new_items`); 
REPLACE INTO fishing_loot_template SELECT * FROM fishing_loot_template_full WHERE item IN (SELECT entry FROM `new_items`); 
REPLACE INTO gameobject_loot_template SELECT * FROM gameobject_loot_template_full WHERE item IN (SELECT entry FROM `new_items`); 
REPLACE INTO item_loot_template SELECT * FROM item_loot_template_full WHERE item IN (SELECT entry FROM `new_items`); 
REPLACE INTO mail_loot_template SELECT * FROM mail_loot_template_full WHERE item IN (SELECT entry FROM `new_items`); 
REPLACE INTO pickpocketing_loot_template SELECT * FROM pickpocketing_loot_template_full WHERE item IN (SELECT entry FROM `new_items`); 
REPLACE INTO skinning_loot_template SELECT * FROM skinning_loot_template_full WHERE item IN (SELECT entry FROM `new_items`); 
REPLACE INTO npc_vendor SELECT * FROM npc_vendor_full WHERE item IN (SELECT entry FROM `new_items`); 

UPDATE `quest_template` SET `Method` = (`Method` | 2) WHERE `entry` IN (SELECT * FROM `new_quests`);

UPDATE `creature` SET `spawnFlags` = (`spawnFlags` | 0) WHERE id IN (SELECT entry FROM new_creatures);

UPDATE `game_event` SET `disabled` = (`disabled` | 0) WHERE entry IN (SELECT entry FROM new_events);
 
-- * ITEM STATS | Items changed: 

-- * ADDITIONAL FIXES		

