-- 1.8 → 1.9 | The Gates of Ahn'Qiraj

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

UPDATE `areatrigger_teleport` SET `required_level` = 61 WHERE `target_map` = 531; -- AQ40 (Temple of Ahn'Qiraj) 1.9
UPDATE `areatrigger_teleport` SET `required_level` = 61 WHERE `target_map` = 509; -- AQ20 (Ruins of Ahn'Qiraj) 1.9

-- * NEW EVENTS 	

REPLACE INTO new_events SELECT entry FROM game_event WHERE entry IN (
);

-- * NEW ITEMS 	

REPLACE INTO new_items SELECT entry FROM item_template WHERE entry IN (
20040,   -- Plans: Dark Iron Boots
21178,   -- Gloves of Earthen Power | Silithus badger quest
21179,   -- Band of Earthen Wrath | Silithus badger quest
21180,   -- Earthstrike | Silithus badger quest
21181,   -- Grace of Earth | Silithus badger quest
21182,   -- Band of Earthen Might | Silithus badger quest
21183,   -- Earthpower Vest | Silithus badger quest
21184,   -- Deeprock Bracers | Silithus badger quest
21185,   -- Earthcalm Orb | Silithus badger quest
21186,   -- Rockfury Bracers | Silithus badger quest
21187,   -- Earthweave Cloak | Silithus badger quest
21188,   -- Fist of Cenarius | Silithus badger quest
21189,   -- Might of Cenarius | Silithus badger quest
21190,   -- Wrath of Cenarius | Silithus badger quest
21196,   -- Signet Ring of the Bronze Dragonflight | AQ40 Loot
21197,   -- Signet Ring of the Bronze Dragonflight | AQ40 Loot
21198,   -- Signet Ring of the Bronze Dragonflight | AQ40 Loot
21199,   -- Signet Ring of the Bronze Dragonflight | AQ40 Loot
21200,   -- Signet Ring of the Bronze Dragonflight | AQ40 Loot
21201,   -- Signet Ring of the Bronze Dragonflight | AQ40 Loot
21202,   -- Signet Ring of the Bronze Dragonflight | AQ40 Loot
21203,   -- Signet Ring of the Bronze Dragonflight | AQ40 Loot
21204,   -- Signet Ring of the Bronze Dragonflight | AQ40 Loot
21205,   -- Signet Ring of the Bronze Dragonflight | AQ40 Loot
21206,   -- Signet Ring of the Bronze Dragonflight | AQ40 Loot
21207,   -- Signet Ring of the Bronze Dragonflight | AQ40 Loot
21208,   -- Signet Ring of the Bronze Dragonflight | AQ40 Loot
21209,   -- Signet Ring of the Bronze Dragonflight | AQ40 Loot
21210,   -- Signet Ring of the Bronze Dragonflight | AQ40 Loot
21242,   -- Blessed Qiraji War Axe | AQ40 Loot
21244,   -- Blessed Qiraji Pugio | AQ40 Loot
21268,   -- Blessed Qiraji War Hammer | AQ40 Loot
21269,   -- Blessed Qiraji Bulwark | AQ40 Loot
21272,   -- Blessed Qiraji Musket | AQ40 Loot
21273,   -- Blessed Qiraji Acolyte Staff | AQ40 Loot
21275,   -- Blessed Qiraji Augur Staff | AQ40 Loot
21329,   -- Conqueror's Crown | AQ40 Loot
21330,   -- Conqueror's Spaulders | AQ40 Loot
21331,   -- Conqueror's Breastplate | AQ40 Loot
21332,   -- Conqueror's Legguards | AQ40 Loot
21333,   -- Conqueror's Greaves | AQ40 Loot
21334,   -- Doomcaller's Robes | AQ40 Loot
21335,   -- Doomcaller's Mantle | AQ40 Loot
21336,   -- Doomcaller's Trousers | AQ40 Loot
21337,   -- Doomcaller's Circlet | AQ40 Loot
21338,   -- Doomcaller's Footwraps | AQ40 Loot
21343,   -- Enigma Robes | AQ40 Loot
21344,   -- Enigma Boots | AQ40 Loot
21345,   -- Enigma Shoulderpads | AQ40 Loot
21346,   -- Enigma Leggings | AQ40 Loot
21347,   -- Enigma Circlet | AQ40 Loot
21348,   -- Tiara of the Oracle | AQ40 Loot
21349,   -- Footwraps of the Oracle | AQ40 Loot
21350,   -- Mantle of the Oracle | AQ40 Loot
21351,   -- Vestments of the Oracle | AQ40 Loot
21352,   -- Trousers of the Oracle | AQ40 Loot
21353,   -- Genesis Helm | AQ40 Loot
21354,   -- Genesis Shoulderpads | AQ40 Loot
21355,   -- Genesis Boots | AQ40 Loot
21356,   -- Genesis Trousers | AQ40 Loot
21357,   -- Genesis Vest | AQ40 Loot
21359,   -- Deathdealer's Boots | AQ40 Loot
21360,   -- Deathdealer's Helm | AQ40 Loot
21361,   -- Deathdealer's Spaulders | AQ40 Loot
21362,   -- Deathdealer's Leggings | AQ40 Loot
21364,   -- Deathdealer's Vest | AQ40 Loot
21365,   -- Striker's Footguards | AQ40 Loot
21366,   -- Striker's Diadem | AQ40 Loot
21367,   -- Striker's Pauldrons | AQ40 Loot
21368,   -- Striker's Leggings | AQ40 Loot
21370,   -- Striker's Hauberk | AQ40 Loot
21372,   -- Stormcaller's Diadem | AQ40 Loot
21373,   -- Stormcaller's Footguards | AQ40 Loot
21374,   -- Stormcaller's Hauberk | AQ40 Loot
21375,   -- Stormcaller's Leggings | AQ40 Loot
21376,   -- Stormcaller's Pauldrons | AQ40 Loot
21387,   -- Avenger's Crown | AQ40 Loot
21388,   -- Avenger's Greaves | AQ40 Loot
21389,   -- Avenger's Breastplate | AQ40 Loot
21390,   -- Avenger's Legguards | AQ40 Loot
21391,   -- Avenger's Pauldrons | AQ40 Loot
21392,   -- Sickle of Unyielding Strength | AQ20 Loot
21393,   -- Signet of Unyielding Strength | AQ20 Loot
21394,   -- Drape of Unyielding Strength | AQ20 Loot
21395,   -- Blade of Eternal Justice | AQ20 Loot
21396,   -- Ring of Eternal Justice | AQ20 Loot
21397,   -- Cape of Eternal Justice | AQ20 Loot
21398,   -- Hammer of the Gathering Storm | AQ20 Loot
21399,   -- Ring of the Gathering Storm | AQ20 Loot
21400,   -- Cloak of the Gathering Storm | AQ20 Loot
21401,   -- Scythe of the Unseen Path | AQ20 Loot
21402,   -- Signet of the Unseen Path | AQ20 Loot
21403,   -- Cloak of the Unseen Path | AQ20 Loot
21404,   -- Dagger of Veiled Shadows | AQ20 Loot
21405,   -- Band of Veiled Shadows | AQ20 Loot
21406,   -- Cloak of Veiled Shadows | AQ20 Loot
21407,   -- Mace of Unending Life | AQ20 Loot
21408,   -- Band of Unending Life | AQ20 Loot
21409,   -- Cloak of Unending Life | AQ20 Loot
21410,   -- Gavel of Infinite Wisdom | AQ20 Loot
21411,   -- Ring of Infinite Wisdom | AQ20 Loot
21412,   -- Shroud of Infinite Wisdom | AQ20 Loot
21413,   -- Blade of Vaulted Secrets | AQ20 Loot
21414,   -- Band of Vaulted Secrets | AQ20 Loot
21415,   -- Drape of Vaulted Secrets | AQ20 Loot
21416,   -- Kris of Unspoken Names | AQ20 Loot
21417,   -- Ring of Unspoken Names | AQ20 Loot
21418,   -- Shroud of Unspoken Names | AQ20 Loot
21463,   -- Ossirian's Binding | AQ20 Loot
21464,   -- Shackles of the Unscarred | AQ20 Loot
21466,   -- Stinger of Ayamiss | AQ20 Loot
21485,   -- Buru's Skull Fragment | AQ20 Loot
21491,   -- Scaled Bracers of the Gorger | AQ20 Loot
21493,   -- Boots of the Vanguard | AQ20 Loot
21494,   -- Southwind's Grasp | AQ20 Loot
21579,   -- Vanquished Tentacle of C'Thun | AQ40 Loot
21581,   -- Gauntlets of Annihilation | AQ40 Loot
21582,   -- Grasp of the Old God | AQ40 Loot
21583,   -- Cloak of Clarity | AQ40 Loot
21585,   -- Dark Storm Gauntlets | AQ40 Loot
21586,   -- Belt of Never-ending Agony | AQ40 Loot
21587,   -- Wristguards of Castigation | AQ40 Loot
21596,   -- Ring of the Godslayer | AQ40 Loot
21597,   -- Royal Scepter of Vek'lor | AQ40 Loot
21598,   -- Royal Qiraji Belt | AQ40 Loot
21599,   -- Vek'lor's Gloves of Devastation | AQ40 Loot
21600,   -- Boots of Epiphany | AQ40 Loot
21601,   -- Ring of Emperor Vek'lor | AQ40 Loot
21602,   -- Qiraji Execution Bracers | AQ40 Loot
21603,   -- Wand of Qiraji Nobility | AQ40 Loot
21604,   -- Bracelets of Royal Redemption | AQ40 Loot
21605,   -- Gloves of the Hidden Temple | AQ40 Loot
21606,   -- Belt of the Fallen Emperor | AQ40 Loot
21607,   -- Grasp of the Fallen Emperor | AQ40 Loot
21608,   -- Amulet of Vek'nilash | AQ40 Loot
21609,   -- Regenerating Belt of Vek'nilash | AQ40 Loot
21610,   -- Wormscale Blocker | AQ40 Loot
21611,   -- Burrower Bracers | AQ40 Loot
21615,   -- Don Rigoberto's Lost Hat | AQ40 Loot
21616,   -- Huhuran's Stinger | AQ40 Loot
21617,   -- Wasphide Gauntlets | AQ40 Loot
21618,   -- Hive Defiler Wristguards | AQ40 Loot
21619,   -- Gloves of the Messiah | AQ40 Loot
21620,   -- Ring of the Martyr | AQ40 Loot
21621,   -- Cloak of the Golden Hive | AQ40 Loot
21622,   -- Sharpened Silithid Femur | AQ40 Loot
21623,   -- Gauntlets of the Righteous Champion | AQ40 Loot
21624,   -- Gauntlets of Kalimdor | AQ40 Loot
21625,   -- Scarab Brooch | AQ40 Loot
21626,   -- Slime-coated Leggings | AQ40 Loot
21627,   -- Cloak of Untold Secrets | AQ40 Loot
21635,   -- Barb of the Sand Reaver | AQ40 Loot
21639,   -- Pauldrons of the Unrelenting | AQ40 Loot
21645,   -- Hive Tunneler's Boots | AQ40 Loot
21647,   -- Fetish of the Sand Reaver | AQ40 Loot
21648,   -- Recomposed Boots | AQ40 Loot
21650,   -- Ancient Qiraji Ripper | AQ40 Loot
21651,   -- Scaled Sand Reaver Leggings | AQ40 Loot
21652,   -- Silithid Carapace Chestguard | AQ40 Loot
21663,   -- Robes of the Guardian Saint | AQ40 Loot
21664,   -- Barbed Choker | AQ40 Loot
21665,   -- Mantle of Wicked Revenge | AQ40 Loot
21666,   -- Sartura's Might | AQ40 Loot
21667,   -- Legplates of Blazing Light | AQ40 Loot
21668,   -- Scaled Leggings of Qiraji Fury | AQ40 Loot
21669,   -- Creeping Vine Helm | AQ40 Loot
21670,   -- Badge of the Swarmguard | AQ40 Loot
21671,   -- Robes of the Battleguard | AQ40 Loot
21672,   -- Gloves of Enforcement | AQ40 Loot
21673,   -- Silithid Claw | AQ40 Loot
21674,   -- Gauntlets of Steadfast Determination | AQ40 Loot
21675,   -- Thick Qirajihide Belt | AQ40 Loot
21676,   -- Leggings of the Festering Swarm | AQ40 Loot
21677,   -- Ring of the Qiraji Fury | AQ40 Loot
21678,   -- Necklace of Purity | AQ40 Loot
21679,   -- Kalimdor's Revenge | AQ40 Loot
21680,   -- Vest of Swift Execution | AQ40 Loot
21681,   -- Ring of the Devoured | AQ40 Loot
21682,   -- Bile-Covered Gauntlets | AQ40 Loot
21683,   -- Mantle of the Desert Crusade | AQ40 Loot
21684,   -- Mantle of the Desert's Fury | AQ40 Loot
21685,   -- Petrified Scarab | AQ40 Loot
21686,   -- Mantle of Phrenic Power | AQ40 Loot
21687,   -- Ukko's Ring of Darkness | AQ40 Loot
21688,   -- Boots of the Fallen Hero | AQ40 Loot
21689,   -- Gloves of Ebru | AQ40 Loot
21690,   -- Angelista's Charm | AQ40 Loot
21691,   -- Ooze-ridden Gauntlets | AQ40 Loot
21692,   -- Triad Girdle | AQ40 Loot
21693,   -- Guise of the Devourer | AQ40 Loot
21694,   -- Ternary Mantle | AQ40 Loot
21695,   -- Angelista's Touch | AQ40 Loot
21696,   -- Robes of the Triumvirate | AQ40 Loot
21697,   -- Cape of the Trinity | AQ40 Loot
21698,   -- Leggings of Immersion | AQ40 Loot
21699,   -- Barrage Shoulders | AQ40 Loot
21700,   -- Pendant of the Qiraji Guardian | AQ40 Loot
21701,   -- Cloak of Concentrated Hatred | AQ40 Loot
21702,   -- Amulet of Foul Warding | AQ40 Loot
21703,   -- Hammer of Ji'zhi | AQ40 Loot
21704,   -- Boots of the Redeemed Prophecy | AQ40 Loot
21705,   -- Boots of the Fallen Prophet | AQ40 Loot
21706,   -- Boots of the Unwavering Will | AQ40 Loot
21707,   -- Ring of Swarming Thought | AQ40 Loot
21708,   -- Beetle Scaled Wristguards | AQ40 Loot
21709,   -- Ring of the Fallen God | AQ40 Loot
21710,   -- Cloak of the Fallen God | AQ40 Loot
21712,   -- Amulet of the Fallen God | AQ40 Loot
21039,   -- Narain's Turban | AQ Gates Questline
21040,   -- Narain's Robe | AQ Gates Questline
21134,   -- Dark Edge of Insanity | AQ40 Loot
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
