
-- This is supposed to be an initial downgrading patch from 1.12 to 1.2 DB for use with future upgrading transition patches.
-- Apply it on the clean 1.12 DB only, with all latest migrations from /server/sql/migrations

DROP TABLE IF EXISTS `forbidden_items`;
DROP TABLE IF EXISTS `forbidden_quests`;
DROP TABLE IF EXISTS `forbidden_creatures`;
CREATE TABLE IF NOT EXISTS `forbidden_quests` (entry mediumint PRIMARY KEY);
CREATE TABLE IF NOT EXISTS forbidden_items (entry mediumint);
CREATE TABLE IF NOT EXISTS forbidden_creatures (entry mediumint);

-- * INDEX
-- - 1. ENCOUNTER				 
-- - 2. FORBIDDEN EVENTS 					          
-- - 3. FORBIDDEN ITEMS 		  
-- - 4. ITEMS AND LOOT		 	      
-- - 5. VENDORS 
-- - 6. FORBIDDEN CREATURES			
-- - 7. CREATURES	
-- - 8. FORBIDDEN QUESTS			
-- - 9. QUESTS					
-- - 10. PROFESSIONS				
-- - 11. SPELLS			 		
-- - 12. GAMEOBJECTS	
-- - 13. CLEANUP TOOLS	

-- * ENCOUNTER

--   533    -- Naxxramas 1.12
--   531    -- AQ40 (Temple of AQ) 1.9
--   509    -- AQ20 (Ruins of AQ) 1.9
--   429    -- Dire Maul 1.3
--   309    -- Zul'Gurub 1.7
--   469    -- Blackwing Lair 1.6

UPDATE `areatrigger_teleport` SET `required_level` = 61 WHERE `target_map` IN (533, 531, 509, 429, 309, 469);
UPDATE `battleground_template` SET `MinLvl` = 61, `MaxLvl` = 61 WHERE `id` = 1; -- Alterac Valley (Patch 1.5)

-- * EVENTS (need full list)

--   4, 5, 100, 101 	-- DarkMoon Faire 1.6
--   13					-- Elemental Invasion 1.5
--   16, 38, 39			-- Gurubashi Arena 1.5
--   14, 15, 40			-- Stranglethorn Fishing Extravaganza 1.7
--   156, 159			-- Dire Maul extra content(unchecked) 1.3
--   35, 36, 37			-- ??
--   42, 43, 44			-- The Maul 1.3
--   66					-- Dragons of Nightmare 1.8
--   18					-- Call to arms: Alterac Valley 1.5
--   154				-- Silithus @ 1.9
--   155				-- Argent dawn @ 1.11
--   158				-- 1.10 Patch : Recipes
--   160				-- 1.10 Patch : T0.5 Quest Chain 
--   161				-- Patch 1.3 
--   162				-- Patch 1.4 | 1.5
--   163				-- Patch 1.6
--   164				-- Patch 1.7
--   165				-- Patch 1.8
--   166				-- Patch 1.9
--   167				-- Patch 1.10
--   168 				-- Patch 1.11 ? 1.12
UPDATE `game_event` SET `disabled` = 1 WHERE `entry` IN (4, 5, 100, 101, 13, 16, 38, 39, 14, 15, 40, 155, 156, 159, 35, 36, 37,42, 43, 44, 66, 18, 54, 155, 158, 160, 161, 162, 163, 164, 165, 166, 167, 168);
-- Argent Dawn @ (pre-1.11) Hm...?
REPLACE INTO game_event VALUE (155, "2025-03-30 00:00:00", "2030-03-30 00:00:00", 1, 2, 0, "Argent dawn @ 1.11", 0, 1);

-- * FORBIDDEN ITEMS 

REPLACE INTO forbidden_items SELECT entry FROM item_template WHERE entry IN (
1215,   -- Support Girdle
1677,   -- Drake-scale Vest
2715,   -- Monster - Item, Lantern - Round
2899,   -- Wendigo Collar
5975,   -- Ruffian Belt
6118,   -- Squire's Pants
6119,   -- Neophyte's Robe
6129,   -- Acolyte's Robe
6136,   -- Thug Shirt
6833,   -- White Tuxedo Shirt
6836,   -- Dress Shoes
7809,   -- Easter Dress
10768,   -- Boar Champion's Belt
11662,   -- Ban'thok Sash
11703,   -- Stonewall Girdle
12422,   -- Imperial Plate Chest
12424,   -- Imperial Plate Belt
12425,   -- Imperial Plate Bracers
12426,   -- Imperial Plate Boots
12427,   -- Imperial Plate Helm
12428,   -- Imperial Plate Shoulders
12429,   -- Imperial Plate Leggings
12471,   -- Desertwalker Cane
12584,   -- Grand Marshal's Longsword
12618,   -- Enchanted Thorium Breastplate
12619,   -- Enchanted Thorium Leggings
12620,   -- Enchanted Thorium Helm
12625,   -- Dawnbringer Shoulders
12772,   -- Inlaid Thorium Hammer
12947,   -- Alex's Ring of Audacity
13075,   -- Direwing Legguards
13262,   -- Ashbringer
13384,   -- Rainbow Girdle
13956,   -- Clutch of Andros
14464,   -- Elunarian Silk Robes
14539,   -- Bone Ring Helm
14811,   -- Warstrike Chestguard
14812,   -- Warstrike Buckler
14815,   -- Warstrike Gauntlets
15196,   -- Private's Tabard
15198,   -- Knight's Colors
15199,   -- Stone Guard's Herald
15405,   -- Shucking Gloves
15410,   -- Scale of Onyxia
15968,   -- Elunarian Sphere
16165,   -- Test Arcane Res Legs Mail
16335,   -- Senior Sergeant's Insignia
16345,   -- High Warlord's Blade
16369,   -- Knight-Lieutenant's Silk Boots
16391,   -- Knight-Lieutenant's Silk Gloves
16392,   -- Knight-Lieutenant's Leather Boots
16393,   -- Knight-Lieutenant's Dragonhide Footwraps
16396,   -- Knight-Lieutenant's Leather Gauntlets
16397,   -- Knight-Lieutenant's Dragonhide Gloves
16401,   -- Knight-Lieutenant's Chain Boots
16403,   -- Knight-Lieutenant's Chain Gauntlets
16405,   -- Knight-Lieutenant's Plate Boots
16406,   -- Knight-Lieutenant's Plate Gauntlets
16409,   -- Knight-Lieutenant's Lamellar Sabatons
16410,   -- Knight-Lieutenant's Lamellar Gauntlets
16413,   -- Knight-Captain's Silk Raiment
16414,   -- Knight-Captain's Silk Leggings
16415,   -- Lieutenant Commander's Silk Spaulders
16416,   -- Lieutenant Commander's Crown
16417,   -- Knight-Captain's Leather Armor
16418,   -- Lieutenant Commander's Leather Veil
16419,   -- Knight-Captain's Leather Legguards
16420,   -- Lieutenant Commander's Leather Spaulders
16421,   -- Knight-Captain's Dragonhide Tunic
16422,   -- Knight-Captain's Dragonhide Leggings
16423,   -- Lieutenant Commander's Dragonhide Epaulets
16424,   -- Lieutenant Commander's Dragonhide Shroud
16425,   -- Knight-Captain's Chain Hauberk
16426,   -- Knight-Captain's Chain Leggings
16427,   -- Lieutenant Commander's Chain Pauldrons
16428,   -- Lieutenant Commander's Chain Helmet
16429,   -- Lieutenant Commander's Plate Helm
16430,   -- Knight-Captain's Plate Chestguard
16431,   -- Knight-Captain's Plate Leggings
16432,   -- Lieutenant Commander's Plate Pauldrons
16433,   -- Knight-Captain's Lamellar Breastplate
16434,   -- Lieutenant Commander's Lamellar Headguard
16435,   -- Knight-Captain's Lamellar Leggings
16436,   -- Lieutenant Commander's Lamellar Shoulders
16437,   -- Marshal's Silk Footwraps
16440,   -- Marshal's Silk Gloves
16441,   -- Field Marshal's Coronet
16442,   -- Marshal's Silk Leggings
16443,   -- Field Marshal's Silk Vestments
16444,   -- Field Marshal's Silk Spaulders
16446,   -- Marshal's Leather Footguards
16448,   -- Marshal's Dragonhide Gauntlets
16449,   -- Field Marshal's Dragonhide Spaulders
16450,   -- Marshal's Dragonhide Legguards
16451,   -- Field Marshal's Dragonhide Helmet
16452,   -- Field Marshal's Dragonhide Breastplate
16453,   -- Field Marshal's Leather Chestpiece
16454,   -- Marshal's Leather Handgrips
16455,   -- Field Marshal's Leather Mask
16456,   -- Marshal's Leather Leggings
16457,   -- Field Marshal's Leather Epaulets
16459,   -- Marshal's Dragonhide Boots
16462,   -- Marshal's Chain Boots
16463,   -- Marshal's Chain Grips
16465,   -- Field Marshal's Chain Helm
16466,   -- Field Marshal's Chain Breastplate
16467,   -- Marshal's Chain Legguards
16468,   -- Field Marshal's Chain Spaulders
16471,   -- Marshal's Lamellar Gloves
16472,   -- Marshal's Lamellar Boots
16473,   -- Field Marshal's Lamellar Chestplate
16474,   -- Field Marshal's Lamellar Faceguard
16475,   -- Marshal's Lamellar Legplates
16476,   -- Field Marshal's Lamellar Pauldrons
16477,   -- Field Marshal's Plate Armor
16478,   -- Field Marshal's Plate Helm
16479,   -- Marshal's Plate Legguards
16480,   -- Field Marshal's Plate Shoulderguards
16483,   -- Marshal's Plate Boots
16484,   -- Marshal's Plate Gauntlets
16485,   -- Blood Guard's Silk Footwraps
16487,   -- Blood Guard's Silk Gloves
16489,   -- Champion's Silk Hood
16490,   -- Legionnaire's Silk Pants
16491,   -- Legionnaire's Silk Robes
16492,   -- Champion's Silk Shoulderpads
16494,   -- Blood Guard's Dragonhide Boots
16496,   -- Blood Guard's Dragonhide Gauntlets
16498,   -- Blood Guard's Leather Treads
16499,   -- Blood Guard's Leather Vices
16501,   -- Champion's Dragonhide Spaulders
16502,   -- Legionnaire's Dragonhide Trousers
16503,   -- Champion's Dragonhide Helm
16504,   -- Legionnaire's Dragonhide Breastplate
16505,   -- Legionnaire's Leather Hauberk
16506,   -- Champion's Leather Headguard
16507,   -- Champion's Leather Mantle
16508,   -- Legionnaire's Leather Leggings
16509,   -- Blood Guard's Plate Boots
16510,   -- Blood Guard's Plate Gloves
16513,   -- Legionnaire's Plate Armor
16514,   -- Champion's Plate Headguard
16515,   -- Legionnaire's Plate Legguards
16516,   -- Champion's Plate Pauldrons
16518,   -- Blood Guard's Mail Walkers
16519,   -- Blood Guard's Mail Grips
16521,   -- Champion's Mail Helm
16522,   -- Legionnaire's Mail Chestpiece
16523,   -- Legionnaire's Mail Leggings
16524,   -- Champion's Mail Shoulders
16525,   -- Legionnaire's Chain Breastplate
16526,   -- Champion's Chain Headguard
16527,   -- Legionnaire's Chain Leggings
16528,   -- Champion's Chain Pauldrons
16530,   -- Blood Guard's Chain Gauntlets
16531,   -- Blood Guard's Chain Boots
16533,   -- Warlord's Silk Cowl
16534,   -- General's Silk Trousers
16535,   -- Warlord's Silk Raiment
16536,   -- Warlord's Silk Amice
16539,   -- General's Silk Boots
16540,   -- General's Silk Handguards
16541,   -- Warlord's Plate Armor
16542,   -- Warlord's Plate Headpiece
16543,   -- General's Plate Leggings
16544,   -- Warlord's Plate Shoulders
16545,   -- General's Plate Boots
16548,   -- General's Plate Gauntlets
16549,   -- Warlord's Dragonhide Hauberk
16550,   -- Warlord's Dragonhide Helmet
16551,   -- Warlord's Dragonhide Epaulets
16552,   -- General's Dragonhide Leggings
16554,   -- General's Dragonhide Boots
16555,   -- General's Dragonhide Gloves
16558,   -- General's Leather Treads
16560,   -- General's Leather Mitts
16561,   -- Warlord's Leather Helm
16562,   -- Warlord's Leather Spaulders
16563,   -- Warlord's Leather Breastplate
16564,   -- General's Leather Legguards
16565,   -- Warlord's Chain Chestpiece
16566,   -- Warlord's Chain Helmet
16567,   -- General's Chain Legguards
16568,   -- Warlord's Chain Shoulders
16569,   -- General's Chain Boots
16571,   -- General's Chain Gloves
16573,   -- General's Mail Boots
16574,   -- General's Mail Gauntlets
16577,   -- Warlord's Mail Armor
16578,   -- Warlord's Mail Helm
16579,   -- General's Mail Leggings
16580,   -- Warlord's Mail Spaulders
17061,   -- Juno's Shadow
17063,   -- Band of Accuria
17067,   -- Ancient Cornerstone Grimoire
17076,   -- Bonereaver's Edge
17102,   -- Cloak of the Shrouded Mists
17104,   -- Spinal Reaper
17106,   -- Malistar's Defender
17107,   -- Dragon's Blood Cape
17111,   -- Blazefury Medallion
17182,   -- Sulfuras, Hand of Ragnaros
17193,   -- Sulfuron Hammer
17203,   -- Sulfuron Ingot
17204,   -- Eye of Sulfuras
17562,   -- Knight-Lieutenant's Dreadweave Boots
17564,   -- Knight-Lieutenant's Dreadweave Gloves
17566,   -- Lieutenant Commander's Headguard
17567,   -- Knight-Captain's Dreadweave Leggings
17568,   -- Knight-Captain's Dreadweave Robe
17569,   -- Lieutenant Commander's Dreadweave Mantle
17570,   -- Champion's Dreadweave Hood
17571,   -- Legionnaire's Dreadweave Leggings
17572,   -- Legionnaire's Dreadweave Robe
17573,   -- Champion's Dreadweave Shoulders
17576,   -- Blood Guard's Dreadweave Boots
17577,   -- Blood Guard's Dreadweave Gloves
17578,   -- Field Marshal's Coronal
17579,   -- Marshal's Dreadweave Leggings
17580,   -- Field Marshal's Dreadweave Shoulders
17581,   -- Field Marshal's Dreadweave Robe
17583,   -- Marshal's Dreadweave Boots
17584,   -- Marshal's Dreadweave Gloves
17586,   -- General's Dreadweave Boots
17588,   -- General's Dreadweave Gloves
17590,   -- Warlord's Dreadweave Mantle
17591,   -- Warlord's Dreadweave Hood
17592,   -- Warlord's Dreadweave Robe
17593,   -- General's Dreadweave Pants
17594,   -- Knight-Lieutenant's Satin Boots
17596,   -- Knight-Lieutenant's Satin Gloves
17598,   -- Lieutenant Commander's Diadem
17599,   -- Knight-Captain's Satin Leggings
17600,   -- Knight-Captain's Satin Robes
17601,   -- Lieutenant Commander's Satin Amice
17602,   -- Field Marshal's Headdress
17603,   -- Marshal's Satin Pants
17604,   -- Field Marshal's Satin Mantle
17605,   -- Field Marshal's Satin Vestments
17607,   -- Marshal's Satin Sandals
17608,   -- Marshal's Satin Gloves
17610,   -- Champion's Satin Cowl
17611,   -- Legionnaire's Satin Trousers
17612,   -- Legionnaire's Satin Vestments
17613,   -- Champion's Satin Shoulderpads
17616,   -- Blood Guard's Satin Boots
17617,   -- Blood Guard's Satin Gloves
17618,   -- General's Satin Boots
17620,   -- General's Satin Gloves
17622,   -- Warlord's Satin Mantle
17623,   -- Warlord's Satin Cowl
17624,   -- Warlord's Satin Robes
17625,   -- General's Satin Leggings
17690,   -- Frostwolf Insignia Rank 1
17691,   -- Stormpike Insignia Rank 1
17900,   -- Stormpike Insignia Rank 2
17901,   -- Stormpike Insignia Rank 3
17902,   -- Stormpike Insignia Rank 4
17903,   -- Stormpike Insignia Rank 5
17904,   -- Stormpike Insignia Rank 6
17905,   -- Frostwolf Insignia Rank 2
17906,   -- Frostwolf Insignia Rank 3
17907,   -- Frostwolf Insignia Rank 4
17908,   -- Frostwolf Insignia Rank 5
17909,   -- Frostwolf Insignia Rank 6
17982,   -- Ragnaros Core
18022,   -- Royal Seal of Alexis
18083,   -- Jumanza Grips
18103,   -- Band of Rumination
18104,   -- Feralsurge Girdle
18168,   -- Force Reactive Disk
18202,   -- Eskhandar's Left Claw
18203,   -- Eskhandar's Right Claw
18204,   -- Eskhandar's Pelt
18205,   -- Eskhandar's Collar
18252,   -- Pattern: Core Armor Kit
18257,   -- Recipe: Major Rejuvenation Potion
18259,   -- Formula: Enchant Weapon - Spell Power
18260,   -- Formula: Enchant Weapon - Healing Power
18263,   -- Flarecore Wraps
18264,   -- Plans: Elemental Sharpening Stone
18265,   -- Pattern: Flarecore Wraps
18290,   -- Schematic: Biznicks 247x128 Accurascope
18291,   -- Schematic: Force Reactive Disk
18292,   -- Schematic: Core Marksman Rifle
18302,   -- Band of Vigor
18305,   -- Breakwater Legguards
18306,   -- Gloves of Shadowy Mist
18309,   -- Gloves of Restoration
18313,   -- Helm of Awareness
18315,   -- Ring of Demonic Potency
18323,   -- Satyr's Bow
18325,   -- Felhide Cap
18326,   -- Razor Gauntlets
18327,   -- Whipvine Cord
18337,   -- Orphic Bracers
18339,   -- Eidolon Cloak
18340,   -- Eidolon Talisman
18343,   -- Petrified Band
18349,   -- Gauntlets of Accuracy
18350,   -- Amplifying Cloak
18352,   -- Petrified Bark Shield
18368,   -- Gordok's Gloves
18369,   -- Gordok's Handwraps
18371,   -- Mindtap Talisman
18373,   -- Chestplate of Tranquility
18374,   -- Flamescarred Shoulders
18377,   -- Quickdraw Gloves
18378,   -- Silvermoon Leggings
18380,   -- Eldritch Reinforced Legplates
18381,   -- Evil Eye Pendant
18383,   -- Force Imbued Gauntlets
18384,   -- Bile-etched Spaulders
18386,   -- Padre's Trousers
18387,   -- Brightspark Gloves
18388,   -- Stoneshatter
18393,   -- Warpwood Binding
18395,   -- Emerald Flame Ring
18398,   -- Tidal Loop
18400,   -- Ring of Living Stone
18404,   -- Onyxia Tooth Pendant
18420,   -- Bonecrusher
18421,   -- Backwood Helm
18422,   -- Head of Onyxia
18423,   -- Head of Onyxia
18425,   -- Kreeg's Mug
18427,   -- Sergeant's Cloak
18428,   -- Senior Sergeant's Insignia
18430,   -- First Sergeant's Plate Bracers
18432,   -- First Sergeant's Mail Wristguards
18436,   -- First Sergeant's Dragonhide Armguards
18437,   -- First Sergeant's Silk Cuffs
18448,   -- Sergeant Major's Chain Armguards
18450,   -- Robe of Combustion
18451,   -- Hyena Hide Belt
18452,   -- Sergeant Major's Leather Armsplints
18454,   -- Sergeant Major's Dragonhide Armsplints
18464,   -- Gordok Nose Ring
18466,   -- Royal Seal of Eldre'Thalas
18468,   -- Royal Seal of Eldre'Thalas
18470,   -- Royal Seal of Eldre'Thalas
18472,   -- Royal Seal of Eldre'Thalas
18475,   -- Oddly Magical Belt
18480,   -- Scarab Plate Helm
18485,   -- Observer's Shield
18490,   -- Insightful Hood
18493,   -- Bulky Iron Spaulders
18494,   -- Denwatcher's Shoulders
18505,   -- Mugger's Belt
18510,   -- Hide of the Wild
18518,   -- Pattern: Hide of the Wild
18522,   -- Band of the Ogre King
18524,   -- Leggings of Destruction
18528,   -- Cyclone Spaulders
18535,   -- Milli's Shield
18536,   -- Milli's Lexicon
18537,   -- Counterattack Lodestone
18543,   -- Ring of Entropy
18544,   -- Doomhide Gauntlets
18545,   -- Leggings of Arcane Supremacy
18563,   -- Bindings of the Windseeker
18564,   -- Bindings of the Windseeker
18582,   -- The Twin Blades of Azzinoth
18583,   -- Warglaive of Azzinoth (Right)
18584,   -- Warglaive of Azzinoth (Left)
18592,   -- Plans: Sulfuron Hammer
18602,   -- Tome of Sacrifice
18608,   -- Benediction
18609,   -- Anathema
18610,   -- Keen Machete
18611,   -- Gnarlpine Leggings
18612,   -- Bloody Chain Boots
18634,   -- Gyrofreeze Ice Reflector
18637,   -- Major Recombobulator
18638,   -- Hyper-Radiant Flame Reflector
18639,   -- Ultra-Flash Shadow Reflector
18646,   -- The Eye of Divinity
18652,   -- Schematic: Gyrofreeze Ice Reflector
18655,   -- Schematic: Major Recombobulator
18657,   -- Schematic: Hyper-Radiant Flame Reflector
18658,   -- Schematic: Ultra-Flash Shadow Reflector
18665,   -- The Eye of Shadow
18671,   -- Baron Charr's Sceptre
18672,   -- Elemental Ember
18673,   -- Avalanchion's Stony Hide
18674,   -- Hardened Stone Band
18676,   -- Sash of the Windreaver
18677,   -- Zephyr Cloak
18678,   -- Tempestria's Frozen Necklace
18679,   -- Frigid Ring
18680,   -- Ancient Bone Bow
18681,   -- Burial Shawl
18682,   -- Ghoul Skin Leggings
18683,   -- Hammer of the Vesper
18686,   -- Bone Golem Shoulders
18689,   -- Phantasmal Cloak
18690,   -- Wraithplate Leggings
18691,   -- Dark Advisor's Pendant
18692,   -- Death Knight Sabatons
18693,   -- Shivery Handwraps
18694,   -- Shadowy Mail Greaves
18695,   -- Spellbound Tome
18696,   -- Intricately Runed Shield
18697,   -- Coldstone Slippers
18698,   -- Tattered Leather Hood
18699,   -- Icy Tomb Spaulders
18700,   -- Malefic Bracers
18701,   -- Innervating Band
18702,   -- Belt of the Ordained
18703,   -- Ancient Petrified Leaf
18704,   -- Mature Blue Dragon Sinew
18705,   -- Mature Black Dragon Sinew
18709,   -- Arena Wristguards
18710,   -- Arena Bracers
18711,   -- Arena Bands
18712,   -- Arena Vambraces
18713,   -- Rhok'delar, Longbow of the Ancient Keepers
18715,   -- Lok'delar, Stave of the Ancient Keepers
18716,   -- Ash Covered Boots
18717,   -- Hammer of the Grand Crusader
18718,   -- Grand Crusader's Helm
18720,   -- Shroud of the Nathrezim
18721,   -- Barrage Girdle
18722,   -- Death Grips
18723,   -- Animated Chain Necklace
18725,   -- Peacemaker
18726,   -- Magistrate's Cuffs
18727,   -- Crimson Felt Hat
18728,   -- Anastari Heirloom
18729,   -- Screeching Bow
18730,   -- Shadowy Laced Handwraps
18734,   -- Pale Moon Cloak
18735,   -- Maleki's Footwraps
18736,   -- Plaguehound Leggings
18737,   -- Bone Slicing Hatchet
18738,   -- Carapace Spine Crossbow
18739,   -- Chitinous Plate Legguards
18740,   -- Thuzadin Sash
18741,   -- Morlune's Bracer
18742,   -- Stratholme Militia Shoulderguard
18743,   -- Gracious Cape
18744,   -- Plaguebat Fur Gloves
18745,   -- Sacred Cloth Leggings
18754,   -- Fel Hardened Bracers
18755,   -- Xorothian Firestick
18756,   -- Dreadguard's Protector
18757,   -- Diabolic Mantle
18758,   -- Specter's Blade
18759,   -- Malicious Axe
18760,   -- Necromantic Band
18761,   -- Oblivion's Touch
18762,   -- Shard of the Green Flame
18803,   -- Finkle's Lava Dredger
18805,   -- Core Hound Tooth
18806,   -- Core Forged Greaves
18807,   -- Helm of Latent Power
18808,   -- Gloves of the Hypnotic Flame
18809,   -- Sash of Whispered Secrets
18810,   -- Wild Growth Spaulders
18811,   -- Fireproof Cloak
18812,   -- Wristguards of True Flight
18813,   -- Ring of Binding
18814,   -- Choker of the Fire Lord
18815,   -- Essence of the Pure Flame
18816,   -- Perdition's Blade
18817,   -- Crown of Destruction
18820,   -- Talisman of Ephemeral Power
18821,   -- Quick Strike Ring
18822,   -- Obsidian Edged Blade
18823,   -- Aged Core Leather Gloves
18824,   -- Magma Tempered Boots
18825,   -- Grand Marshal's Aegis
18826,   -- High Warlord's Shield Wall
18827,   -- Grand Marshal's Handaxe
18828,   -- High Warlord's Cleaver
18829,   -- Deep Earth Spaulders
18830,   -- Grand Marshal's Sunderer
18831,   -- High Warlord's Battle Axe
18832,   -- Brutality Blade
18833,   -- Grand Marshal's Bullseye
18834,   -- Insignia of the Horde
18835,   -- High Warlord's Recurve
18836,   -- Grand Marshal's Repeater
18837,   -- High Warlord's Crossbow
18838,   -- Grand Marshal's Dirk
18840,   -- High Warlord's Razor
18842,   -- Staff of Dominance
18843,   -- Grand Marshal's Right Hand Blade
18844,   -- High Warlord's Right Claw
18845,   -- Insignia of the Horde
18846,   -- Insignia of the Horde
18847,   -- Grand Marshal's Left Hand Blade
18848,   -- High Warlord's Left Claw
18849,   -- Insignia of the Horde
18850,   -- Insignia of the Horde
18851,   -- Insignia of the Horde
18852,   -- Insignia of the Horde
18853,   -- Insignia of the Horde
18854,   -- Insignia of the Alliance
18855,   -- Grand Marshal's Hand Cannon
18856,   -- Insignia of the Alliance
18857,   -- Insignia of the Alliance
18858,   -- Insignia of the Alliance
18859,   -- Insignia of the Alliance
18860,   -- High Warlord's Street Sweeper
18861,   -- Flamewaker Legplates
18862,   -- Insignia of the Alliance
18863,   -- Insignia of the Alliance
18864,   -- Insignia of the Alliance
18865,   -- Grand Marshal's Punisher
18866,   -- High Warlord's Bludgeon
18867,   -- Grand Marshal's Battle Hammer
18868,   -- High Warlord's Pulverizer
18869,   -- Grand Marshal's Glaive
18870,   -- Helm of the Lifegiver
18871,   -- High Warlord's Pig Sticker
18872,   -- Manastorm Leggings
18873,   -- Grand Marshal's Stave
18874,   -- High Warlord's War Staff
18875,   -- Salamander Scale Pants
18876,   -- Grand Marshal's Claymore
18877,   -- High Warlord's Greatsword
18878,   -- Sorcerous Dagger
18879,   -- Heavy Dark Iron Ring
18945,   -- Dark Iron Residue
18948,   -- Barbaric Bracers
18949,   -- Pattern: Barbaric Bracers
18957,   -- Brushwood Blade
18970,   -- Ring of Critical Testing 2
18984,   -- Dimensional Ripper - Everlook
18986,   -- Ultrasafe Transporter: Gadgetzan
19019,   -- Thunderfury, Blessed Blade of the Windseeker
19022,   -- Nat Pagle's Extreme Angler FC-5000
19024,   -- Arena Grand Master
19028,   -- Elegant Dress
19031,   -- Frostwolf Battle Tabard
19032,   -- Stormpike Battle Tabard
19037,   -- Emerald Peak Spaulders
19038,   -- Ring of Subtlety
19039,   -- Zorbin's Water Resistant Hat
19040,   -- Zorbin's Mega-Slicer
19041,   -- Pratt's Handcrafted Tunic
19042,   -- Jangdor's Handcrafted Tunic
19043,   -- Heavy Timbermaw Belt
19044,   -- Might of the Timbermaw
19047,   -- Wisdom of the Timbermaw
19048,   -- Heavy Timbermaw Boots
19049,   -- Timbermaw Brawlers
19050,   -- Mantle of the Timbermaw
19051,   -- Girdle of the Dawn
19052,   -- Dawn Treaders
19056,   -- Argent Boots
19057,   -- Gloves of the Dawn
19058,   -- Golden Mantle of the Dawn
19059,   -- Argent Shoulders
19083,   -- Frostwolf Legionnaire's Cloak
19084,   -- Stormpike Soldier's Cloak
19085,   -- Frostwolf Advisor's Cloak
19086,   -- Stormpike Sage's Cloak
19087,   -- Frostwolf Plate Belt
19088,   -- Frostwolf Mail Belt
19089,   -- Frostwolf Leather Belt
19090,   -- Frostwolf Cloth Belt
19091,   -- Stormpike Plate Girdle
19092,   -- Stormpike Mail Girdle
19093,   -- Stormpike Leather Girdle
19094,   -- Stormpike Cloth Girdle
19095,   -- Frostwolf Legionnaire's Pendant
19096,   -- Frostwolf Advisor's Pendant
19097,   -- Stormpike Soldier's Pendant
19098,   -- Stormpike Sage's Pendant
19099,   -- Glacial Blade
19100,   -- Electrified Dagger
19101,   -- Whiteout Staff
19102,   -- Crackling Staff
19103,   -- Frostbite
19104,   -- Stormstrike Hammer
19105,   -- Frost Runed Headdress
19106,   -- Ice Barbed Spear
19107,   -- Bloodseeker
19108,   -- Wand of Biting Cold
19109,   -- Deep Rooted Ring
19110,   -- Cold Forged Blade
19111,   -- Winteraxe Epaulets
19112,   -- Frozen Steel Vambraces
19113,   -- Yeti Hide Bracers
19114,   -- Highland Bow
19115,   -- Flask of Forest Mojo
19116,   -- Greenleaf Handwraps
19117,   -- Laquered Wooden Plate Legplates
19118,   -- Nature's Breath
19119,   -- Owlbeast Hide Gloves
19120,   -- Rune of the Guard Captain
19121,   -- Deep Woodlands Cloak
19123,   -- Everwarm Handwraps
19124,   -- Slagplate Leggings
19125,   -- Seared Mail Girdle
19126,   -- Slagplate Gauntlets
19127,   -- Charred Leather Tunic
19128,   -- Seared Mail Vest
19130,   -- Cold Snap
19131,   -- Snowblind Shoes
19132,   -- Crystal Adorned Crown
19133,   -- Fel Infused Leggings
19134,   -- Flayed Doomguard Belt
19135,   -- Blacklight Bracer
19136,   -- Mana Igniting Cord
19137,   -- Onslaught Girdle
19138,   -- Band of Sulfuras
19139,   -- Fireguard Shoulders
19140,   -- Cauterizing Band
19141,   -- Luffa
19142,   -- Fire Runed Grimoire
19143,   -- Flameguard Gauntlets
19144,   -- Sabatons of the Flamewalker
19145,   -- Robe of Volatile Power
19146,   -- Wristguards of Stability
19147,   -- Ring of Spell Power
19148,   -- Dark Iron Helm
19149,   -- Lava Belt
19156,   -- Flarecore Robe
19157,   -- Chromatic Gauntlets
19159,   -- Woven Ivy Necklace
19160,   -- Contest Winner's Tabard
19162,   -- Corehound Belt
19163,   -- Molten Belt
19164,   -- Dark Iron Gauntlets
19165,   -- Flarecore Leggings
19166,   -- Black Amnesty
19167,   -- Blackfury
19168,   -- Blackguard
19169,   -- Nightfall
19170,   -- Ebon Hand
19202,   -- Plans: Heavy Timbermaw Belt
19203,   -- Plans: Girdle of the Dawn
19204,   -- Plans: Heavy Timbermaw Boots
19205,   -- Plans: Gloves of the Dawn
19206,   -- Plans: Dark Iron Helm
19207,   -- Plans: Dark Iron Gauntlets
19208,   -- Plans: Black Amnesty
19209,   -- Plans: Blackfury
19210,   -- Plans: Ebon Hand
19211,   -- Plans: Blackguard
19212,   -- Plans: Nightfall
19215,   -- Pattern: Wisdom of the Timbermaw
19216,   -- Pattern: Argent Boots
19217,   -- Pattern: Argent Shoulders
19218,   -- Pattern: Mantle of the Timbermaw
19219,   -- Pattern: Flarecore Robe
19220,   -- Pattern: Flarecore Leggings
19287,   -- Darkmoon Card: Heroism
19288,   -- Darkmoon Card: Blue Dragon
19289,   -- Darkmoon Card: Maelstrom
19290,   -- Darkmoon Card: Twisting Nether
19292,   -- Last Month's Mutton
19293,   -- Last Year's Mutton
19295,   -- Darkmoon Flower
19302,   -- Darkmoon Ring
19303,   -- Darkmoon Necklace
19308,   -- Tome of Arcane Domination
19309,   -- Tome of Shadow Force
19310,   -- Tome of the Ice Lord
19311,   -- Tome of Fiery Arcana
19312,   -- Lei of the Lifegiver
19315,   -- Therazane's Touch
19321,   -- The Immovable Object
19323,   -- The Unstoppable Force
19324,   -- The Lobotomizer
19325,   -- Don Julio's Band
19326,   -- Pattern: Might of the Timbermaw
19327,   -- Pattern: Timbermaw Brawlers
19328,   -- Pattern: Dawn Treaders
19329,   -- Pattern: Golden Mantle of the Dawn
19330,   -- Pattern: Lava Belt
19331,   -- Pattern: Chromatic Gauntlets
19332,   -- Pattern: Corehound Belt
19333,   -- Pattern: Molten Belt
19334,   -- The Untamed Blade
19335,   -- Spineshatter
19336,   -- Arcane Infused Gem
19337,   -- The Black Book
19339,   -- Mind Quickening Gem
19340,   -- Rune of Metamorphosis
19341,   -- Lifegiving Gem
19342,   -- Venomous Totem
19343,   -- Scrolls of Blinding Light
19344,   -- Natural Alignment Crystal
19345,   -- Aegis of Preservation
19346,   -- Dragonfang Blade
19347,   -- Claw of Chromaggus
19348,   -- Red Dragonscale Protector
19349,   -- Elementium Reinforced Bulwark
19350,   -- Heartstriker
19351,   -- Maladath, Runed Blade of the Black Flight
19352,   -- Chromatically Tempered Sword
19353,   -- Drake Talon Cleaver
19354,   -- Draconic Avenger
19355,   -- Shadow Wing Focus Staff
19356,   -- Staff of the Shadow Flame
19357,   -- Herald of Woe
19358,   -- Draconic Maul
19360,   -- Lok'amir il Romathis
19361,   -- Ashjre'thul, Crossbow of Smiting
19362,   -- Doom's Edge
19363,   -- Crul'shorukh, Edge of Chaos
19364,   -- Ashkandi, Greatsword of the Brotherhood
19365,   -- Claw of the Black Drake
19366,   -- Master Dragonslayer's Orb
19367,   -- Dragon's Touch
19368,   -- Dragonbreath Hand Cannon
19369,   -- Gloves of Rapid Evolution
19370,   -- Mantle of the Blackwing Cabal
19371,   -- Pendant of the Fallen Dragon
19372,   -- Helm of Endless Rage
19373,   -- Black Brood Pauldrons
19374,   -- Bracers of Arcane Accuracy
19375,   -- Mish'undare, Circlet of the Mind Flayer
19376,   -- Archimtiros' Ring of Reckoning
19377,   -- Prestor's Talisman of Connivery
19378,   -- Cloak of the Brood Lord
19379,   -- Neltharion's Tear
19380,   -- Therazane's Link
19381,   -- Boots of the Shadow Flame
19382,   -- Pure Elementium Band
19383,   -- Master Dragonslayer's Medallion
19384,   -- Master Dragonslayer's Ring
19385,   -- Empowered Leggings
19386,   -- Elementium Threaded Cloak
19387,   -- Chromatic Boots
19388,   -- Angelista's Grasp
19389,   -- Taut Dragonhide Shoulderpads
19390,   -- Taut Dragonhide Gloves
19391,   -- Shimmering Geta
19392,   -- Girdle of the Fallen Crusader
19393,   -- Primalist's Linked Waistguard
19394,   -- Drake Talon Pauldrons
19395,   -- Rejuvenating Gem
19396,   -- Taut Dragonhide Belt
19397,   -- Ring of Blackrock
19398,   -- Cloak of Firemaw
19399,   -- Black Ash Robe
19400,   -- Firemaw's Clutch
19401,   -- Primalist's Linked Legguards
19402,   -- Legguards of the Fallen Crusader
19403,   -- Band of Forced Concentration
19405,   -- Malfurion's Blessed Bulwark
19406,   -- Drake Fang Talisman
19407,   -- Ebony Flame Gloves
19426,   -- Orb of the Darkmoon
19430,   -- Shroud of Pure Thought
19431,   -- Styleen's Impeding Scarab
19432,   -- Circle of Applied Force
19433,   -- Emberweave Leggings
19434,   -- Band of Dark Dominion
19435,   -- Essence Gatherer
19436,   -- Cloak of Draconic Might
19437,   -- Boots of Pure Thought
19438,   -- Ringo's Blizzard Boots
19439,   -- Interlaced Shadow Jerkin
19442,   -- Formula: Powerful Anti-Venom
19444,   -- Formula: Enchant Weapon - Strength
19445,   -- Formula: Enchant Weapon - Agility
19446,   -- Formula: Enchant Bracer - Mana Regeneration
19447,   -- Formula: Enchant Bracer - Healing
19448,   -- Formula: Enchant Weapon - Mighty Spirit
19449,   -- Formula: Enchant Weapon - Mighty Intellect
19491,   -- Amulet of the Darkmoon
19505,   -- Warsong Battle Tabard
19506,   -- Silverwing Battle Tabard
19507,   -- Inquisitor's Shawl
19508,   -- Branded Leather Bracers
19509,   -- Dusty Mail Boots
19510,   -- Legionnaire's Band
19511,   -- Legionnaire's Band
19512,   -- Legionnaire's Band
19513,   -- Legionnaire's Band
19514,   -- Protector's Band
19515,   -- Protector's Band
19516,   -- Protector's Band
19517,   -- Protector's Band
19518,   -- Advisor's Ring
19519,   -- Advisor's Ring
19520,   -- Advisor's Ring
19521,   -- Advisor's Ring
19522,   -- Lorekeeper's Ring
19523,   -- Lorekeeper's Ring
19524,   -- Lorekeeper's Ring
19525,   -- Lorekeeper's Ring
19526,   -- Battle Healer's Cloak
19527,   -- Battle Healer's Cloak
19528,   -- Battle Healer's Cloak
19529,   -- Battle Healer's Cloak
19530,   -- Caretaker's Cape
19531,   -- Caretaker's Cape
19532,   -- Caretaker's Cape
19533,   -- Caretaker's Cape
19534,   -- Scout's Medallion
19535,   -- Scout's Medallion
19536,   -- Scout's Medallion
19537,   -- Scout's Medallion
19538,   -- Sentinel's Medallion
19539,   -- Sentinel's Medallion
19540,   -- Sentinel's Medallion
19541,   -- Sentinel's Medallion
19542,   -- Scout's Blade
19543,   -- Scout's Blade
19544,   -- Scout's Blade
19545,   -- Scout's Blade
19546,   -- Sentinel's Blade
19547,   -- Sentinel's Blade
19548,   -- Sentinel's Blade
19549,   -- Sentinel's Blade
19550,   -- Legionnaire's Sword
19551,   -- Legionnaire's Sword
19552,   -- Legionnaire's Sword
19553,   -- Legionnaire's Sword
19554,   -- Protector's Sword
19555,   -- Protector's Sword
19556,   -- Protector's Sword
19557,   -- Protector's Sword
19558,   -- Outrider's Bow
19559,   -- Outrider's Bow
19560,   -- Outrider's Bow
19561,   -- Outrider's Bow
19562,   -- Outrunner's Bow
19563,   -- Outrunner's Bow
19564,   -- Outrunner's Bow
19565,   -- Outrunner's Bow
19566,   -- Advisor's Gnarled Staff
19567,   -- Advisor's Gnarled Staff
19568,   -- Advisor's Gnarled Staff
19569,   -- Advisor's Gnarled Staff
19570,   -- Lorekeeper's Staff
19571,   -- Lorekeeper's Staff
19572,   -- Lorekeeper's Staff
19573,   -- Lorekeeper's Staff
19574,   -- Strength of Mugamba
19575,   -- Strength of Mugamba
19576,   -- Strength of Mugamba
19577,   -- Rage of Mugamba
19578,   -- Berserker Bracers
19579,   -- Heathen's Brand
19580,   -- Berserker Bracers
19581,   -- Berserker Bracers
19582,   -- Windtalker's Wristguards
19583,   -- Windtalker's Wristguards
19584,   -- Windtalker's Wristguards
19585,   -- Heathen's Brand
19586,   -- Heathen's Brand
19587,   -- Forest Stalker's Bracers
19588,   -- Hero's Brand
19589,   -- Forest Stalker's Bracers
19590,   -- Forest Stalker's Bracers
19591,   -- The Eye of Zuldazar
19592,   -- The Eye of Zuldazar
19593,   -- The Eye of Zuldazar
19594,   -- The All-Seeing Eye of Zuldazar
19595,   -- Dryad's Wrist Bindings
19596,   -- Dryad's Wrist Bindings
19597,   -- Dryad's Wrist Bindings
19598,   -- Pebble of Kajaro
19599,   -- Pebble of Kajaro
19600,   -- Pebble of Kajaro
19601,   -- Jewel of Kajaro
19602,   -- Kezan's Taint
19603,   -- Kezan's Taint
19604,   -- Kezan's Taint
19605,   -- Kezan's Unstoppable Taint
19606,   -- Vision of Voodress
19607,   -- Vision of Voodress
19608,   -- Vision of Voodress
19609,   -- Unmarred Vision of Voodress
19610,   -- Enchanted South Seas Kelp
19611,   -- Enchanted South Seas Kelp
19612,   -- Enchanted South Seas Kelp
19613,   -- Pristine Enchanted South Seas Kelp
19614,   -- Zandalarian Shadow Talisman
19615,   -- Zandalarian Shadow Talisman
19616,   -- Zandalarian Shadow Talisman
19617,   -- Zandalarian Shadow Mastery Talisman
19618,   -- Maelstrom's Tendril
19619,   -- Maelstrom's Tendril
19620,   -- Maelstrom's Tendril
19621,   -- Maelstrom's Wrath
19682,   -- Bloodvine Vest
19683,   -- Bloodvine Leggings
19684,   -- Bloodvine Boots
19685,   -- Primal Batskin Jerkin
19686,   -- Primal Batskin Gloves
19687,   -- Primal Batskin Bracers
19688,   -- Blood Tiger Breastplate
19689,   -- Blood Tiger Shoulders
19690,   -- Bloodsoul Breastplate
19691,   -- Bloodsoul Shoulders
19692,   -- Bloodsoul Gauntlets
19693,   -- Darksoul Breastplate
19694,   -- Darksoul Leggings
19695,   -- Darksoul Shoulders
19697,   -- Bounty of the Harvest
19760,   -- Overlord's Embrace
19764,   -- Pattern: Bloodvine Vest
19765,   -- Pattern: Bloodvine Leggings
19766,   -- Pattern: Bloodvine Boots
19769,   -- Pattern: Primal Batskin Jerkin
19770,   -- Pattern: Primal Batskin Gloves
19771,   -- Pattern: Primal Batskin Bracers
19772,   -- Pattern: Blood Tiger Breastplate
19773,   -- Pattern: Blood Tiger Shoulders
19776,   -- Plans: Bloodsoul Breastplate
19777,   -- Plans: Bloodsoul Shoulders
19778,   -- Plans: Bloodsoul Gauntlets
19779,   -- Plans: Darksoul Breastplate
19780,   -- Plans: Darksoul Leggings
19781,   -- Plans: Darksoul Shoulders
19808,   -- Rockhide Strongfish
19812,   -- Rune of the Dawn
19822,   -- Zandalar Vindicator's Breastplate
19823,   -- Zandalar Vindicator's Belt
19824,   -- Zandalar Vindicator's Armguards
19825,   -- Zandalar Freethinker's Breastplate
19826,   -- Zandalar Freethinker's Belt
19827,   -- Zandalar Freethinker's Armguards
19828,   -- Zandalar Augur's Hauberk
19829,   -- Zandalar Augur's Belt
19830,   -- Zandalar Augur's Bracers
19831,   -- Zandalar Predator's Mantle
19832,   -- Zandalar Predator's Belt
19833,   -- Zandalar Predator's Bracers
19834,   -- Zandalar Madcap's Tunic
19835,   -- Zandalar Madcap's Mantle
19836,   -- Zandalar Madcap's Bracers
19838,   -- Zandalar Haruspex's Tunic
19839,   -- Zandalar Haruspex's Belt
19840,   -- Zandalar Haruspex's Bracers
19841,   -- Zandalar Confessor's Mantle
19842,   -- Zandalar Confessor's Bindings
19843,   -- Zandalar Confessor's Wraps
19845,   -- Zandalar Illusionist's Mantle
19846,   -- Zandalar Illusionist's Wraps
19848,   -- Zandalar Demoniac's Wraps
19849,   -- Zandalar Demoniac's Mantle
19852,   -- Ancient Hakkari Manslayer
19853,   -- Gurubashi Dwarf Destroyer
19854,   -- Zin'rokh, Destroyer of Worlds
19855,   -- Bloodsoaked Legplates
19856,   -- The Eye of Hakkar
19857,   -- Cloak of Consumption
19859,   -- Fang of the Faceless
19861,   -- Touch of Chaos
19862,   -- Aegis of the Blood God
19863,   -- Primalist's Seal
19864,   -- Bloodcaller
19865,   -- Warblade of the Hakkari
19866,   -- Warblade of the Hakkari
19867,   -- Bloodlord's Defender
19869,   -- Blooddrenched Grips
19870,   -- Hakkari Loa Cloak
19871,   -- Talisman of Protection
19873,   -- Overlord's Crimson Band
19874,   -- Halberd of Smiting
19875,   -- Bloodstained Coif
19876,   -- Soul Corrupter's Necklace
19877,   -- Animist's Leggings
19878,   -- Bloodsoaked Pauldrons
19879,   -- Alex's Test Beatdown Staff
19884,   -- Jin'do's Judgement
19885,   -- Jin'do's Evil Eye
19886,   -- The Hexxer's Cover
19887,   -- Bloodstained Legplates
19888,   -- Overlord's Embrace
19889,   -- Blooddrenched Leggings
19890,   -- Jin'do's Hexxer
19891,   -- Jin'do's Bag of Whammies
19892,   -- Animist's Boots
19893,   -- Zanzil's Seal
19894,   -- Bloodsoaked Gauntlets
19895,   -- Bloodtinged Kilt
19896,   -- Thekal's Grasp
19897,   -- Betrayer's Boots
19898,   -- Seal of Jin
19899,   -- Ritualistic Legguards
19900,   -- Zulian Stone Axe
19901,   -- Zulian Slicer
19903,   -- Fang of Venoxis
19904,   -- Runed Bloodstained Hauberk
19905,   -- Zanzil's Band
19906,   -- Blooddrenched Footpads
19907,   -- Zulian Tigerhide Cloak
19908,   -- Sceptre of Smiting
19909,   -- Will of Arlokk
19910,   -- Arlokk's Grasp
19912,   -- Overlord's Onyx Band
19913,   -- Bloodsoaked Greaves
19915,   -- Zulian Defender
19918,   -- Jeklik's Crusher
19919,   -- Bloodstained Greaves
19920,   -- Primalist's Band
19922,   -- Arlokk's Hoodoo Stick
19923,   -- Jeklik's Opaline Talisman
19925,   -- Band of Jin
19927,   -- Mar'li's Touch
19928,   -- Animist's Spaulders
19929,   -- Bloodtinged Gloves
19930,   -- Mar'li's Eye
19944,   -- Nat Pagle's Fish Terminator
19945,   -- Foror's Eyepatch
19946,   -- Tigule's Harpoon
19947,   -- Nat Pagle's Broken Reel
19948,   -- Zandalarian Hero Badge
19949,   -- Zandalarian Hero Medallion
19950,   -- Zandalarian Hero Charm
19951,   -- Gri'lek's Charm of Might
19952,   -- Gri'lek's Charm of Valor
19953,   -- Renataki's Charm of Beasts
19954,   -- Renataki's Charm of Trickery
19955,   -- Wushoolay's Charm of Nature
19956,   -- Wushoolay's Charm of Spirits
19957,   -- Hazza'rah's Charm of Destruction
19958,   -- Hazza'rah's Charm of Healing
19959,   -- Hazza'rah's Charm of Magic
19961,   -- Gri'lek's Grinder
19962,   -- Gri'lek's Carver
19963,   -- Pitchfork of Madness
19964,   -- Renataki's Soul Conduit
19965,   -- Wushoolay's Poker
19967,   -- Thoughtblighter
19968,   -- Fiery Retributer
19969,   -- Nat Pagle's Extreme Anglin' Boots
19970,   -- Arcanite Fishing Pole
19972,   -- Lucky Fishing Hat
19979,   -- Hook of the Master Angler
19982,   -- Duskbat Drape
19984,   -- Ebon Mask
19990,   -- Blessed Prayer Beads
19991,   -- Devilsaur Eye
19992,   -- Devilsaur Tooth
19993,   -- Hoodoo Hunting Bow
19998,   -- Bloodvine Lens
19999,   -- Bloodvine Goggles
20000,   -- Schematic: Bloodvine Goggles
20001,   -- Schematic: Bloodvine Lens
20006,   -- Circle of Hope
20032,   -- Flowing Ritual Robes
20033,   -- Zandalar Demoniac's Robe
20034,   -- Zandalar Illusionist's Robe
20035,   -- Glacial Spike
20036,   -- Fire Ruby
20037,   -- Arcane Crystal Pendant
20038,   -- Mandokir's Sting
20039,   -- Dark Iron Boots
20040,   -- Plans: Dark Iron Boots
20041,   -- Highlander's Plate Girdle
20042,   -- Highlander's Lamellar Girdle
20043,   -- Highlander's Chain Girdle
20044,   -- Highlander's Mail Girdle
20045,   -- Highlander's Leather Girdle
20046,   -- Highlander's Lizardhide Girdle
20047,   -- Highlander's Cloth Girdle
20048,   -- Highlander's Plate Greaves
20049,   -- Highlander's Lamellar Greaves
20050,   -- Highlander's Chain Greaves
20051,   -- Highlander's Mail Greaves
20052,   -- Highlander's Leather Boots
20053,   -- Highlander's Lizardhide Boots
20054,   -- Highlander's Cloth Boots
20055,   -- Highlander's Chain Pauldrons
20056,   -- Highlander's Mail Pauldrons
20057,   -- Highlander's Plate Spaulders
20058,   -- Highlander's Lamellar Spaulders
20059,   -- Highlander's Leather Shoulders
20060,   -- Highlander's Lizardhide Shoulders
20061,   -- Highlander's Epaulets
20068,   -- Deathguard's Cloak
20069,   -- Ironbark Staff
20070,   -- Sageclaw
20071,   -- Talisman of Arathor
20072,   -- Defiler's Talisman
20073,   -- Cloak of the Honor Guard
20082,   -- Woestave
20083,   -- Hunting Spear
20086,   -- Dusksteel Throwing Knife
20088,   -- Highlander's Chain Girdle
20089,   -- Highlander's Chain Girdle
20090,   -- Highlander's Chain Girdle
20091,   -- Highlander's Chain Greaves
20092,   -- Highlander's Chain Greaves
20093,   -- Highlander's Chain Greaves
20094,   -- Highlander's Cloth Boots
20095,   -- Highlander's Cloth Boots
20096,   -- Highlander's Cloth Boots
20097,   -- Highlander's Cloth Girdle
20098,   -- Highlander's Cloth Girdle
20099,   -- Highlander's Cloth Girdle
20100,   -- Highlander's Lizardhide Boots
20101,   -- Highlander's Lizardhide Boots
20102,   -- Highlander's Lizardhide Boots
20103,   -- Highlander's Lizardhide Girdle
20104,   -- Highlander's Lizardhide Girdle
20105,   -- Highlander's Lizardhide Girdle
20106,   -- Highlander's Lamellar Girdle
20107,   -- Highlander's Lamellar Girdle
20108,   -- Highlander's Lamellar Girdle
20109,   -- Highlander's Lamellar Greaves
20110,   -- Highlander's Lamellar Greaves
20111,   -- Highlander's Lamellar Greaves
20112,   -- Highlander's Leather Boots
20113,   -- Highlander's Leather Boots
20114,   -- Highlander's Leather Boots
20115,   -- Highlander's Leather Girdle
20116,   -- Highlander's Leather Girdle
20117,   -- Highlander's Leather Girdle
20124,   -- Highlander's Plate Girdle
20125,   -- Highlander's Plate Girdle
20126,   -- Highlander's Plate Girdle
20127,   -- Highlander's Plate Greaves
20128,   -- Highlander's Plate Greaves
20129,   -- Highlander's Plate Greaves
20130,   -- Diamond Flask
20131,   -- Battle Tabard of the Defilers
20132,   -- Arathor Battle Tabard
20134,   -- Skyfury Helm
20150,   -- Defiler's Chain Girdle
20151,   -- Defiler's Chain Girdle
20152,   -- Defiler's Chain Girdle
20153,   -- Defiler's Chain Girdle
20154,   -- Defiler's Chain Greaves
20155,   -- Defiler's Chain Greaves
20156,   -- Defiler's Chain Greaves
20157,   -- Defiler's Chain Greaves
20158,   -- Defiler's Chain Pauldrons
20159,   -- Defiler's Cloth Boots
20160,   -- Defiler's Cloth Boots
20161,   -- Defiler's Cloth Boots
20162,   -- Defiler's Cloth Boots
20163,   -- Defiler's Cloth Girdle
20164,   -- Defiler's Cloth Girdle
20165,   -- Defiler's Cloth Girdle
20166,   -- Defiler's Cloth Girdle
20167,   -- Defiler's Lizardhide Boots
20168,   -- Defiler's Lizardhide Boots
20169,   -- Defiler's Lizardhide Boots
20170,   -- Defiler's Lizardhide Boots
20171,   -- Defiler's Lizardhide Girdle
20172,   -- Defiler's Lizardhide Girdle
20173,   -- Defiler's Lizardhide Girdle
20174,   -- Defiler's Lizardhide Girdle
20175,   -- Defiler's Lizardhide Shoulders
20176,   -- Defiler's Epaulets
20177,   -- Defiler's Lamellar Girdle
20181,   -- Defiler's Lamellar Greaves
20184,   -- Defiler's Lamellar Spaulders
20186,   -- Defiler's Leather Boots
20187,   -- Defiler's Leather Boots
20188,   -- Defiler's Leather Boots
20189,   -- Defiler's Leather Boots
20190,   -- Defiler's Leather Girdle
20191,   -- Defiler's Leather Girdle
20192,   -- Defiler's Leather Girdle
20193,   -- Defiler's Leather Girdle
20194,   -- Defiler's Leather Shoulders
20195,   -- Defiler's Mail Girdle
20196,   -- Defiler's Mail Girdle
20197,   -- Defiler's Mail Girdle
20198,   -- Defiler's Mail Girdle
20199,   -- Defiler's Mail Greaves
20200,   -- Defiler's Mail Greaves
20201,   -- Defiler's Mail Greaves
20202,   -- Defiler's Mail Greaves
20203,   -- Defiler's Mail Pauldrons
20204,   -- Defiler's Plate Girdle
20205,   -- Defiler's Plate Girdle
20206,   -- Defiler's Plate Girdle
20207,   -- Defiler's Plate Girdle
20208,   -- Defiler's Plate Greaves
20209,   -- Defiler's Plate Greaves
20210,   -- Defiler's Plate Greaves
20211,   -- Defiler's Plate Greaves
20212,   -- Defiler's Plate Spaulders
20213,   -- Belt of Shrunken Heads
20214,   -- Mindfang
20215,   -- Belt of Shriveled Heads
20216,   -- Belt of Preserved Heads
20217,   -- Belt of Tiny Heads
20218,   -- Faded Hakkari Cloak
20219,   -- Tattered Hakkari Cape
20220,   -- Ironbark Staff
20255,   -- Whisperwalk Boots
20257,   -- Seafury Gauntlets
20258,   -- Zulian Ceremonial Staff
20259,   -- Shadow Panther Hide Gloves
20260,   -- Seafury Leggings
20261,   -- Shadow Panther Hide Belt
20262,   -- Seafury Boots
20263,   -- Gurubashi Helm
20264,   -- Peacekeeper Gauntlets
20265,   -- Peacekeeper Boots
20266,   -- Peacekeeper Leggings
20295,   -- Blue Dragonscale Leggings
20296,   -- Green Dragonscale Gauntlets
20369,   -- Azurite Fists
20380,   -- Dreamscale Breastplate
20382,   -- Pattern: Dreamscale Breastplate
20391,   -- Flimsy Male Gnome Mask
20392,   -- Flimsy Female Gnome Mask
20406,   -- Twilight Cultist Mantle
20407,   -- Twilight Cultist Robe
20408,   -- Twilight Cultist Cowl
20425,   -- Advisor's Gnarled Staff
20426,   -- Advisor's Ring
20427,   -- Battle Healer's Cloak
20428,   -- Caretaker's Cape
20429,   -- Legionnaire's Band
20430,   -- Legionnaire's Sword
20431,   -- Lorekeeper's Ring
20434,   -- Lorekeeper's Staff
20437,   -- Outrider's Bow
20438,   -- Outrunner's Bow
20439,   -- Protector's Band
20440,   -- Protector's Sword
20441,   -- Scout's Blade
20442,   -- Scout's Medallion
20443,   -- Sentinel's Blade
20444,   -- Sentinel's Medallion
20451,   -- Twilight Cultist Ring of Lordship
20476,   -- Sandstalker Bracers
20477,   -- Sandstalker Gauntlets
20478,   -- Sandstalker Breastplate
20479,   -- Spitfire Breastplate
20480,   -- Spitfire Gauntlets
20481,   -- Spitfire Bracers
20487,   -- Lok'delar, Stave of the Ancient Keepers DEP
20488,   -- Rhok'delar, Longbow of the Ancient Keepers DEP
20503,   -- Enamored Water Spirit
20504,   -- Lightforged Blade
20505,   -- Chivalrous Signet
20506,   -- Pattern: Spitfire Bracers
20507,   -- Pattern: Spitfire Gauntlets
20508,   -- Pattern: Spitfire Breastplate
20509,   -- Pattern: Sandstalker Bracers
20510,   -- Pattern: Sandstalker Gauntlets
20511,   -- Pattern: Sandstalker Breastplate
20512,   -- Sanctified Orb
20517,   -- Razorsteel Shoulders
20521,   -- Fury Visor
20530,   -- Robes of Servitude
20534,   -- Abyss Shard
20536,   -- Soul Harvester
20537,   -- Runed Stygian Boots
20538,   -- Runed Stygian Leggings
20539,   -- Runed Stygian Belt
20546,   -- Pattern: Runed Stygian Leggings
20547,   -- Pattern: Runed Stygian Boots
20548,   -- Pattern: Runed Stygian Belt
20549,   -- Darkrune Gauntlets
20550,   -- Darkrune Breastplate
20551,   -- Darkrune Helm
20553,   -- Plans: Darkrune Gauntlets
20554,   -- Plans: Darkrune Breastplate
20555,   -- Plans: Darkrune Helm
20556,   -- Wildstaff
20561,   -- Flimsy Male Dwarf Mask
20562,   -- Flimsy Female Dwarf Mask
20563,   -- Flimsy Female Nightelf Mask
20564,   -- Flimsy Male Nightelf Mask
20565,   -- Flimsy Female Human Mask
20566,   -- Flimsy Male Human Mask
20567,   -- Flimsy Female Troll Mask
20568,   -- Flimsy Male Troll Mask
20569,   -- Flimsy Female Orc Mask
20570,   -- Flimsy Male Orc Mask
20571,   -- Flimsy Female Tauren Mask
20572,   -- Flimsy Male Tauren Mask
20573,   -- Flimsy Male Undead Mask
20574,   -- Flimsy Female Undead Mask
20575,   -- Black Whelp Tunic
20576,   -- Pattern: Black Whelp Tunic
20577,   -- Nightmare Blade
20578,   -- Emerald Dragonfang
20579,   -- Green Dragonskin Cloak
20580,   -- Hammer of Bestial Fury
20581,   -- Staff of Rampant Growth
20582,   -- Trance Stone
20599,   -- Polished Ironwood Crossbow
20600,   -- Malfurion's Signet Ring
20615,   -- Dragonspur Wraps
20616,   -- Dragonbone Wristguards
20617,   -- Ancient Corroded Leggings
20618,   -- Gloves of Delusional Power
20619,   -- Acid Inscribed Greaves
20621,   -- Boots of the Endless Moor
20622,   -- Dragonheart Necklace
20623,   -- Circlet of Restless Dreams
20624,   -- Ring of the Unliving
20625,   -- Belt of the Dark Bog
20626,   -- Black Bark Wristbands
20627,   -- Dark Heart Pants
20628,   -- Deviate Growth Cap
20629,   -- Malignant Footguards
20630,   -- Gauntlets of the Shining Light
20631,   -- Mendicant's Slippers
20632,   -- Mindtear Band
20633,   -- Unnatural Leather Spaulders
20634,   -- Boots of Fright
20635,   -- Jade Inlaid Vestments
20636,   -- Hibernation Crystal
20637,   -- Acid Inscribed Pauldrons
20638,   -- Leggings of the Demented Mind
20639,   -- Strangely Glyphed Legplates
20640,   -- Southsea Head Bucket
20641,   -- Southsea Mojo Boots
20642,   -- Antiquated Nobleman's Tunic
20643,   -- Undercity Reservist's Cap
20645,   -- Nature's Whisper
20646,   -- Sandstrider's Mark
20647,   -- Black Crystal Dagger
20648,   -- Cold Forged Hammer
20649,   -- Sunprism Pendant
20650,   -- Desert Wind Gauntlets
20654,   -- Amethyst War Staff
20657,   -- Crystal Tipped Stiletto
20660,   -- Stonecutting Glaive
20663,   -- Deep Strike Bow
20666,   -- Hardened Steel Warhammer
20669,   -- Darkstone Claymore
20672,   -- Sparkling Crystal Wand
20675,   -- Soulrender
20682,   -- Elemental Focus Band
20685,   -- Wavefront Necklace
20688,   -- Earthen Guard
20691,   -- Windshear Cape
20693,   -- Weighted Cloak
20694,   -- Glowing Black Orb
20695,   -- Abyssal War Beads
20696,   -- Crystal Spiked Maul
20697,   -- Crystalline Threaded Cape
20698,   -- Elemental Attuned Blade
20699,   -- Cenarion Reservist's Legplates
20700,   -- Cenarion Reservist's Legplates
20701,   -- Cenarion Reservist's Legguards
20702,   -- Cenarion Reservist's Legguards
20703,   -- Cenarion Reservist's Leggings
20704,   -- Cenarion Reservist's Leggings
20705,   -- Cenarion Reservist's Pants
20706,   -- Cenarion Reservist's Pants
20707,   -- Cenarion Reservist's Pants
20710,   -- Crystal Encrusted Greaves
20711,   -- Crystal Lined Greaves
20712,   -- Wastewalker's Gauntlets
20713,   -- Desertstalkers's Gauntlets
20714,   -- Sandstorm Boots
20715,   -- Dunestalker's Boots
20716,   -- Sandworm Skin Gloves
20717,   -- Desert Bloom Gloves
20720,   -- Dark Whisper Blade
20721,   -- Band of the Cultist
20722,   -- Crystal Slugthrower
20723,   -- Brann's Trusty Pick
20724,   -- Corrupted Blackwood Staff
20761,   -- Recipe: Transmute Elemental Fire
21039,   -- Narain's Turban
21040,   -- Narain's Robe
21115,   -- Defiler's Talisman
21116,   -- Defiler's Talisman
21117,   -- Talisman of Arathor
21118,   -- Talisman of Arathor
21119,   -- Talisman of Arathor
21120,   -- Defiler's Talisman
21126,   -- Death's Sting
21128,   -- Staff of the Qiraji Prophets
21134,   -- Dark Edge of Insanity
21154,   -- Festival Dress
21157,   -- Festive Green Dress
21178,   -- Gloves of Earthen Power
21179,   -- Band of Earthen Wrath
21180,   -- Earthstrike
21181,   -- Grace of Earth
21182,   -- Band of Earthen Might
21183,   -- Earthpower Vest
21184,   -- Deeprock Bracers
21185,   -- Earthcalm Orb
21186,   -- Rockfury Bracers
21187,   -- Earthweave Cloak
21188,   -- Fist of Cenarius
21189,   -- Might of Cenarius
21190,   -- Wrath of Cenarius
21196,   -- Signet Ring of the Bronze Dragonflight
21197,   -- Signet Ring of the Bronze Dragonflight
21198,   -- Signet Ring of the Bronze Dragonflight
21199,   -- Signet Ring of the Bronze Dragonflight
21200,   -- Signet Ring of the Bronze Dragonflight
21201,   -- Signet Ring of the Bronze Dragonflight
21202,   -- Signet Ring of the Bronze Dragonflight
21203,   -- Signet Ring of the Bronze Dragonflight
21204,   -- Signet Ring of the Bronze Dragonflight
21205,   -- Signet Ring of the Bronze Dragonflight
21206,   -- Signet Ring of the Bronze Dragonflight
21207,   -- Signet Ring of the Bronze Dragonflight
21208,   -- Signet Ring of the Bronze Dragonflight
21209,   -- Signet Ring of the Bronze Dragonflight
21210,   -- Signet Ring of the Bronze Dragonflight
21242,   -- Blessed Qiraji War Axe
21244,   -- Blessed Qiraji Pugio
21268,   -- Blessed Qiraji War Hammer
21269,   -- Blessed Qiraji Bulwark
21272,   -- Blessed Qiraji Musket
21273,   -- Blessed Qiraji Acolyte Staff
21275,   -- Blessed Qiraji Augur Staff
21278,   -- Stormshroud Gloves
21311,   -- Earth Warder's Vest
21312,   -- Belt of the Den Watcher
21316,   -- Leggings of the Ursa
21317,   -- Helm of the Pathfinder
21318,   -- Earth Warder's Gloves
21319,   -- Gloves of the Pathfinder
21320,   -- Vest of the Den Watcher
21322,   -- Ursa's Embrace
21326,   -- Defender of the Timbermaw
21329,   -- Conqueror's Crown
21330,   -- Conqueror's Spaulders
21331,   -- Conqueror's Breastplate
21332,   -- Conqueror's Legguards
21333,   -- Conqueror's Greaves
21334,   -- Doomcaller's Robes
21335,   -- Doomcaller's Mantle
21336,   -- Doomcaller's Trousers
21337,   -- Doomcaller's Circlet
21338,   -- Doomcaller's Footwraps
21343,   -- Enigma Robes
21344,   -- Enigma Boots
21345,   -- Enigma Shoulderpads
21346,   -- Enigma Leggings
21347,   -- Enigma Circlet
21348,   -- Tiara of the Oracle
21349,   -- Footwraps of the Oracle
21350,   -- Mantle of the Oracle
21351,   -- Vestments of the Oracle
21352,   -- Trousers of the Oracle
21353,   -- Genesis Helm
21354,   -- Genesis Shoulderpads
21355,   -- Genesis Boots
21356,   -- Genesis Trousers
21357,   -- Genesis Vest
21359,   -- Deathdealer's Boots
21360,   -- Deathdealer's Helm
21361,   -- Deathdealer's Spaulders
21362,   -- Deathdealer's Leggings
21364,   -- Deathdealer's Vest
21365,   -- Striker's Footguards
21366,   -- Striker's Diadem
21367,   -- Striker's Pauldrons
21368,   -- Striker's Leggings
21370,   -- Striker's Hauberk
21372,   -- Stormcaller's Diadem
21373,   -- Stormcaller's Footguards
21374,   -- Stormcaller's Hauberk
21375,   -- Stormcaller's Leggings
21376,   -- Stormcaller's Pauldrons
21387,   -- Avenger's Crown
21388,   -- Avenger's Greaves
21389,   -- Avenger's Breastplate
21390,   -- Avenger's Legguards
21391,   -- Avenger's Pauldrons
21392,   -- Sickle of Unyielding Strength
21393,   -- Signet of Unyielding Strength
21394,   -- Drape of Unyielding Strength
21395,   -- Blade of Eternal Justice
21396,   -- Ring of Eternal Justice
21397,   -- Cape of Eternal Justice
21398,   -- Hammer of the Gathering Storm
21399,   -- Ring of the Gathering Storm
21400,   -- Cloak of the Gathering Storm
21401,   -- Scythe of the Unseen Path
21402,   -- Signet of the Unseen Path
21403,   -- Cloak of the Unseen Path
21404,   -- Dagger of Veiled Shadows
21405,   -- Band of Veiled Shadows
21406,   -- Cloak of Veiled Shadows
21407,   -- Mace of Unending Life
21408,   -- Band of Unending Life
21409,   -- Cloak of Unending Life
21410,   -- Gavel of Infinite Wisdom
21411,   -- Ring of Infinite Wisdom
21412,   -- Shroud of Infinite Wisdom
21413,   -- Blade of Vaulted Secrets
21414,   -- Band of Vaulted Secrets
21415,   -- Drape of Vaulted Secrets
21416,   -- Kris of Unspoken Names
21417,   -- Ring of Unspoken Names
21418,   -- Shroud of Unspoken Names
21452,   -- Staff of the Ruins
21453,   -- Mantle of the Horusath
21454,   -- Runic Stone Shoulders
21455,   -- Southwind Helm
21456,   -- Sandstorm Cloak
21457,   -- Bracers of Brutality
21458,   -- Gauntlets of New Life
21459,   -- Crossbow of Imminent Doom
21460,   -- Helm of Domination
21461,   -- Leggings of the Black Blizzard
21462,   -- Gloves of Dark Wisdom
21463,   -- Ossirian's Binding
21464,   -- Shackles of the Unscarred
21466,   -- Stinger of Ayamiss
21467,   -- Thick Silithid Chestguard
21468,   -- Mantle of Maz'Nadir
21469,   -- Gauntlets of Southwind
21470,   -- Cloak of the Savior
21471,   -- Talon of Furious Concentration
21472,   -- Dustwind Turban
21473,   -- Eye of Moam
21474,   -- Chitinous Shoulderguards
21475,   -- Legplates of the Destroyer
21476,   -- Obsidian Scaled Leggings
21477,   -- Ring of Fury
21478,   -- Bow of Taut Sinew
21479,   -- Gauntlets of the Immovable
21480,   -- Scaled Silithid Gauntlets
21481,   -- Boots of the Desert Protector
21482,   -- Boots of the Fiery Sands
21483,   -- Ring of the Desert Winds
21484,   -- Helm of Regrowth
21485,   -- Buru's Skull Fragment
21486,   -- Gloves of the Swarm
21487,   -- Slimy Scaled Gauntlets
21488,   -- Fetish of Chitinous Spikes
21489,   -- Quicksand Waders
21490,   -- Slime Kickers
21491,   -- Scaled Bracers of the Gorger
21492,   -- Manslayer of the Qiraji
21493,   -- Boots of the Vanguard
21494,   -- Southwind's Grasp
21495,   -- Legplates of the Qiraji Command
21496,   -- Bracers of Qiraji Command
21497,   -- Boots of the Qiraji General
21498,   -- Qiraji Sacrificial Dagger
21499,   -- Vestments of the Shifting Sands
21500,   -- Belt of the Inquisition
21501,   -- Toughened Silithid Hide Gloves
21502,   -- Sand Reaver Wristguards
21503,   -- Belt of the Sand Reaver
21504,   -- Charm of the Shifting Sands
21505,   -- Choker of the Shifting Sands
21506,   -- Pendant of the Shifting Sands
21507,   -- Amulet of the Shifting Sands
21517,   -- Gnomish Turban of Psychic Might
21520,   -- Ravencrest's Legacy
21521,   -- Runesword of the Red
21522,   -- Shadowsong's Sorrow
21523,   -- Fang of Korialstrasz
21524,   -- Red Winter Hat
21525,   -- Green Winter Hat
21526,   -- Band of Icy Depths
21527,   -- Darkwater Robes
21529,   -- Amulet of Shadow Shielding
21530,   -- Onyx Embedded Leggings
21531,   -- Drake Tooth Necklace
21532,   -- Drudge Boots
21538,   -- Festive Pink Dress
21539,   -- Festive Purple Dress
21541,   -- Festive Black Pant Suit
21542,   -- Festival Suit
21543,   -- Festive Teal Pant Suit
21544,   -- Festive Blue Pant Suit
21547,   -- Recipe: Elixir of Greater Firepower
21548,   -- Pattern: Stormshroud Gloves
21563,   -- Don Rodrigo's Band
21565,   -- Rune of Perfection
21566,   -- Rune of Perfection
21567,   -- Rune of Duty
21568,   -- Rune of Duty
21579,   -- Vanquished Tentacle of C'Thun
21581,   -- Gauntlets of Annihilation
21582,   -- Grasp of the Old God
21583,   -- Cloak of Clarity
21585,   -- Dark Storm Gauntlets
21586,   -- Belt of Never-ending Agony
21587,   -- Wristguards of Castigation
21596,   -- Ring of the Godslayer
21597,   -- Royal Scepter of Vek'lor
21598,   -- Royal Qiraji Belt
21599,   -- Vek'lor's Gloves of Devastation
21600,   -- Boots of Epiphany
21601,   -- Ring of Emperor Vek'lor
21602,   -- Qiraji Execution Bracers
21603,   -- Wand of Qiraji Nobility
21604,   -- Bracelets of Royal Redemption
21605,   -- Gloves of the Hidden Temple
21606,   -- Belt of the Fallen Emperor
21607,   -- Grasp of the Fallen Emperor
21608,   -- Amulet of Vek'nilash
21609,   -- Regenerating Belt of Vek'nilash
21610,   -- Wormscale Blocker
21611,   -- Burrower Bracers
21615,   -- Don Rigoberto's Lost Hat
21616,   -- Huhuran's Stinger
21617,   -- Wasphide Gauntlets
21618,   -- Hive Defiler Wristguards
21619,   -- Gloves of the Messiah
21620,   -- Ring of the Martyr
21621,   -- Cloak of the Golden Hive
21622,   -- Sharpened Silithid Femur
21623,   -- Gauntlets of the Righteous Champion
21624,   -- Gauntlets of Kalimdor
21625,   -- Scarab Brooch
21626,   -- Slime-coated Leggings
21627,   -- Cloak of Untold Secrets
21635,   -- Barb of the Sand Reaver
21639,   -- Pauldrons of the Unrelenting
21645,   -- Hive Tunneler's Boots
21647,   -- Fetish of the Sand Reaver
21648,   -- Recomposed Boots
21650,   -- Ancient Qiraji Ripper
21651,   -- Scaled Sand Reaver Leggings
21652,   -- Silithid Carapace Chestguard
21663,   -- Robes of the Guardian Saint
21664,   -- Barbed Choker
21665,   -- Mantle of Wicked Revenge
21666,   -- Sartura's Might
21667,   -- Legplates of Blazing Light
21668,   -- Scaled Leggings of Qiraji Fury
21669,   -- Creeping Vine Helm
21670,   -- Badge of the Swarmguard
21671,   -- Robes of the Battleguard
21672,   -- Gloves of Enforcement
21673,   -- Silithid Claw
21674,   -- Gauntlets of Steadfast Determination
21675,   -- Thick Qirajihide Belt
21676,   -- Leggings of the Festering Swarm
21677,   -- Ring of the Qiraji Fury
21678,   -- Necklace of Purity
21679,   -- Kalimdor's Revenge
21680,   -- Vest of Swift Execution
21681,   -- Ring of the Devoured
21682,   -- Bile-Covered Gauntlets
21683,   -- Mantle of the Desert Crusade
21684,   -- Mantle of the Desert's Fury
21685,   -- Petrified Scarab
21686,   -- Mantle of Phrenic Power
21687,   -- Ukko's Ring of Darkness
21688,   -- Boots of the Fallen Hero
21689,   -- Gloves of Ebru
21690,   -- Angelista's Charm
21691,   -- Ooze-ridden Gauntlets
21692,   -- Triad Girdle
21693,   -- Guise of the Devourer
21694,   -- Ternary Mantle
21695,   -- Angelista's Touch
21696,   -- Robes of the Triumvirate
21697,   -- Cape of the Trinity
21698,   -- Leggings of Immersion
21699,   -- Barrage Shoulders
21700,   -- Pendant of the Qiraji Guardian
21701,   -- Cloak of Concentrated Hatred
21702,   -- Amulet of Foul Warding
21703,   -- Hammer of Ji'zhi
21704,   -- Boots of the Redeemed Prophecy
21705,   -- Boots of the Fallen Prophet
21706,   -- Boots of the Unwavering Will
21707,   -- Ring of Swarming Thought
21708,   -- Beetle Scaled Wristguards
21709,   -- Ring of the Fallen God
21710,   -- Cloak of the Fallen God
21712,   -- Amulet of the Fallen God
21713,   -- Elune's Candle
21715,   -- Sand Polished Hammer
21722,   -- Pattern: Festival Dress
21723,   -- Pattern: Festive Red Pant Suit
21800,   -- Silithid Husked Launcher
21801,   -- Antenna of Invigoration
21802,   -- The Lost Kris of Zedd
21803,   -- Helm of the Holy Avenger
21804,   -- Coif of Elemental Fury
21805,   -- Polished Obsidian Pauldrons
21806,   -- Gavel of Qiraji Authority
21809,   -- Fury of the Forgotten Swarm
21810,   -- Treads of the Wandering Nomad
21814,   -- Breastplate of Annihilation
21836,   -- Ritssyn's Ring of Chaos
21837,   -- Anubisath Warhammer
21838,   -- Garb of Royal Ascension
21839,   -- Scepter of the False Prophet
21856,   -- Neretzek, The Blood Drinker
21888,   -- Gloves of the Immortal
21889,   -- Gloves of the Redeemed Prophecy
21891,   -- Shard of the Fallen Star
21994,   -- Belt of Heroism
21995,   -- Boots of Heroism
21996,   -- Bracers of Heroism
21997,   -- Breastplate of Heroism
21998,   -- Gauntlets of Heroism
21999,   -- Helm of Heroism
22000,   -- Legplates of Heroism
22001,   -- Spaulders of Heroism
22002,   -- Darkmantle Belt
22003,   -- Darkmantle Boots
22004,   -- Darkmantle Bracers
22005,   -- Darkmantle Cap
22006,   -- Darkmantle Gloves
22007,   -- Darkmantle Pants
22008,   -- Darkmantle Spaulders
22009,   -- Darkmantle Tunic
22010,   -- Beastmaster's Belt
22011,   -- Beastmaster's Bindings
22013,   -- Beastmaster's Cap
22015,   -- Beastmaster's Gloves
22016,   -- Beastmaster's Mantle
22017,   -- Beastmaster's Pants
22049,   -- Brazier of Beckoning
22050,   -- Brazier of Beckoning
22051,   -- Brazier of Beckoning
22052,   -- Brazier of Beckoning
22056,   -- Brazier of Beckoning
22060,   -- Beastmaster's Tunic
22061,   -- Beastmaster's Boots
22062,   -- Sorcerer's Belt
22063,   -- Sorcerer's Bindings
22064,   -- Sorcerer's Boots
22065,   -- Sorcerer's Crown
22066,   -- Sorcerer's Gloves
22067,   -- Sorcerer's Leggings
22068,   -- Sorcerer's Mantle
22069,   -- Sorcerer's Robes
22070,   -- Deathmist Belt
22071,   -- Deathmist Bracers
22072,   -- Deathmist Leggings
22073,   -- Deathmist Mantle
22074,   -- Deathmist Mask
22075,   -- Deathmist Robe
22076,   -- Deathmist Sandals
22077,   -- Deathmist Wraps
22078,   -- Virtuous Belt
22079,   -- Virtuous Bracers
22080,   -- Virtuous Crown
22081,   -- Virtuous Gloves
22082,   -- Virtuous Mantle
22083,   -- Virtuous Robe
22084,   -- Virtuous Sandals
22085,   -- Virtuous Skirt
22086,   -- Soulforge Belt
22087,   -- Soulforge Boots
22088,   -- Soulforge Bracers
22089,   -- Soulforge Breastplate
22090,   -- Soulforge Gauntlets
22091,   -- Soulforge Helm
22092,   -- Soulforge Legplates
22093,   -- Soulforge Spaulders
22095,   -- Bindings of The Five Thunders
22096,   -- Boots of The Five Thunders
22097,   -- Coif of The Five Thunders
22098,   -- Cord of The Five Thunders
22099,   -- Gauntlets of The Five Thunders
22100,   -- Kilt of The Five Thunders
22101,   -- Pauldrons of The Five Thunders
22102,   -- Vest of The Five Thunders
22106,   -- Feralheart Belt
22107,   -- Feralheart Boots
22108,   -- Feralheart Bracers
22109,   -- Feralheart Cowl
22110,   -- Feralheart Gloves
22111,   -- Feralheart Kilt
22112,   -- Feralheart Spaulders
22113,   -- Feralheart Vest
22149,   -- Beads of Ogre Mojo
22150,   -- Beads of Ogre Might
22191,   -- Obsidian Mail Tunic
22194,   -- Black Grasp of the Destroyer
22195,   -- Light Obsidian Belt
22196,   -- Thick Obsidian Breastplate
22197,   -- Heavy Obsidian Belt
22198,   -- Jagged Obsidian Shield
22204,   -- Wristguards of Renown
22205,   -- Black Steel Bindings
22206,   -- Bouquet of Red Roses
22207,   -- Sash of the Grand Hunt
22208,   -- Lavastone Hammer
22209,   -- Plans: Heavy Obsidian Belt
22212,   -- Golem Fitted Pauldrons
22214,   -- Plans: Light Obsidian Belt
22219,   -- Plans: Jagged Obsidian Shield
22220,   -- Plans: Black Grasp of the Destroyer
22221,   -- Plans: Obsidian Mail Tunic
22222,   -- Plans: Thick Obsidian Breastplate
22223,   -- Foreman's Head Protector
22225,   -- Dragonskin Cowl
22231,   -- Kayser's Boots of Precision
22232,   -- Marksman's Girdle
22234,   -- Mantle of Lost Hope
22240,   -- Greaves of Withering Despair
22241,   -- Dark Warder's Pauldrons
22242,   -- Verek's Leash
22245,   -- Soot Encrusted Footwear
22247,   -- Faith Healer's Boots
22253,   -- Tome of the Lost
22254,   -- Wand of Eternal Light
22255,   -- Magma Forged Band
22256,   -- Mana Shaping Handwraps
22257,   -- Bloodclot Band
22266,   -- Flarethorn
22267,   -- Spellweaver's Turban
22268,   -- Draconic Infused Emblem
22269,   -- Shadow Prowler's Cloak
22270,   -- Entrenching Boots
22271,   -- Leggings of Frenzied Magic
22272,   -- Forest's Embrace
22274,   -- Grizzled Pelt
22275,   -- Firemoss Boots
22276,   -- Lovely Red Dress
22277,   -- Red Dinner Suit
22278,   -- Lovely Blue Dress
22279,   -- Lovely Black Dress
22280,   -- Lovely Purple Dress
22281,   -- Blue Dinner Suit
22282,   -- Purple Dinner Suit
22301,   -- Ironweave Robe
22302,   -- Ironweave Cowl
22303,   -- Ironweave Pants
22304,   -- Ironweave Gloves
22305,   -- Ironweave Mantle
22306,   -- Ironweave Belt
22311,   -- Ironweave Boots
22313,   -- Ironweave Bracers
22314,   -- Huntsman's Harpoon
22315,   -- Hammer of Revitalization
22317,   -- Lefty's Brass Knuckle
22318,   -- Malgen's Long Bow
22319,   -- Tome of Divine Right
22321,   -- Heart of Wyrmthalak
22322,   -- The Jaw Breaker
22325,   -- Belt of the Trickster
22326,   -- Amalgam's Band
22327,   -- Amulet of the Redeemed
22328,   -- Legplates of Vigilance
22329,   -- Scepter of Interminable Focus
22330,   -- Shroud of Arcane Mastery
22331,   -- Band of the Steadfast Hero
22332,   -- Blade of Necromancy
22333,   -- Hammer of Divine Might
22334,   -- Band of Mending
22335,   -- Lord Valthalak's Staff of Command
22336,   -- Draconian Aegis of the Legion
22337,   -- Shroud of Domination
22339,   -- Rune Band of Wizardry
22340,   -- Pendant of Celerity
22342,   -- Leggings of Torment
22343,   -- Handguards of Savagery
22345,   -- Totem of Rebirth
22347,   -- Fahrad's Reloading Repeater
22348,   -- Doomulus Prime
22377,   -- The Thunderwood Poker
22378,   -- Ravenholdt Slicer
22379,   -- Shivsprocket's Shiv
22380,   -- Simone's Cultivating Hammer
22383,   -- Sageblade
22384,   -- Persuader
22385,   -- Titanic Leggings
22388,   -- Plans: Titanic Leggings
22389,   -- Plans: Sageblade
22390,   -- Plans: Persuader
22392,   -- Formula: Enchant 2H Weapon - Agility
22394,   -- Staff of Metanoia
22395,   -- Totem of Rage
22396,   -- Totem of Life
22397,   -- Idol of Ferocity
22398,   -- Idol of Rejuvenation
22399,   -- Idol of Health
22400,   -- Libram of Truth
22401,   -- Libram of Hope
22402,   -- Libram of Grace
22403,   -- Diana's Pearl Necklace
22404,   -- Willey's Back Scratcher
22405,   -- Mantle of the Scarlet Crusade
22406,   -- Redemption
22407,   -- Helm of the New Moon
22408,   -- Ritssyn's Wand of Bad Mojo
22409,   -- Tunic of the Crescent Moon
22410,   -- Gauntlets of Deftness
22411,   -- Helm of the Executioner
22412,   -- Thuzadin Mantle
22416,   -- Dreadnaught Breastplate
22417,   -- Dreadnaught Legplates
22418,   -- Dreadnaught Helmet
22419,   -- Dreadnaught Pauldrons
22420,   -- Dreadnaught Sabatons
22421,   -- Dreadnaught Gauntlets
22422,   -- Dreadnaught Waistguard
22423,   -- Dreadnaught Bracers
22424,   -- Redemption Wristguards
22425,   -- Redemption Tunic
22426,   -- Redemption Handguards
22427,   -- Redemption Legguards
22428,   -- Redemption Headpiece
22429,   -- Redemption Spaulders
22430,   -- Redemption Boots
22431,   -- Redemption Girdle
22433,   -- Don Mauricio's Band of Domination
22436,   -- Cryptstalker Tunic
22437,   -- Cryptstalker Legguards
22438,   -- Cryptstalker Headpiece
22439,   -- Cryptstalker Spaulders
22440,   -- Cryptstalker Boots
22441,   -- Cryptstalker Handguards
22442,   -- Cryptstalker Girdle
22443,   -- Cryptstalker Wristguards
22458,   -- Moonshadow Stave
22464,   -- Earthshatter Tunic
22465,   -- Earthshatter Legguards
22466,   -- Earthshatter Headpiece
22467,   -- Earthshatter Spaulders
22468,   -- Earthshatter Boots
22469,   -- Earthshatter Handguards
22470,   -- Earthshatter Girdle
22471,   -- Earthshatter Wristguards
22472,   -- Boots of Ferocity
22476,   -- Bonescythe Breastplate
22477,   -- Bonescythe Legplates
22478,   -- Bonescythe Helmet
22479,   -- Bonescythe Pauldrons
22480,   -- Bonescythe Sabatons
22481,   -- Bonescythe Gauntlets
22482,   -- Bonescythe Waistguard
22483,   -- Bonescythe Bracers
22488,   -- Dreamwalker Tunic
22489,   -- Dreamwalker Legguards
22490,   -- Dreamwalker Headpiece
22491,   -- Dreamwalker Spaulders
22492,   -- Dreamwalker Boots
22493,   -- Dreamwalker Handguards
22494,   -- Dreamwalker Girdle
22495,   -- Dreamwalker Wristguards
22496,   -- Frostfire Robe
22497,   -- Frostfire Leggings
22498,   -- Frostfire Circlet
22499,   -- Frostfire Shoulderpads
22500,   -- Frostfire Sandals
22501,   -- Frostfire Gloves
22502,   -- Frostfire Belt
22503,   -- Frostfire Bindings
22504,   -- Plagueheart Robe
22505,   -- Plagueheart Leggings
22506,   -- Plagueheart Circlet
22507,   -- Plagueheart Shoulderpads
22508,   -- Plagueheart Sandals
22509,   -- Plagueheart Gloves
22510,   -- Plagueheart Belt
22511,   -- Plagueheart Bindings
22512,   -- Robe of Faith
22513,   -- Leggings of Faith
22514,   -- Circlet of Faith
22515,   -- Shoulderpads of Faith
22516,   -- Sandals of Faith
22517,   -- Gloves of Faith
22518,   -- Belt of Faith
22519,   -- Bindings of Faith
22589,   -- Atiesh, Greatstaff of the Guardian
22630,   -- Atiesh, Greatstaff of the Guardian
22631,   -- Atiesh, Greatstaff of the Guardian
22632,   -- Atiesh, Greatstaff of the Guardian
22637,   -- Primal Hakkari Idol
22651,   -- Outrider's Plate Legguards
22652,   -- Glacial Vest
22654,   -- Glacial Gloves
22655,   -- Glacial Wrists
22656,   -- The Purifier
22657,   -- Amulet of the Dawn
22658,   -- Glacial Cloak
22659,   -- Medallion of the Dawn
22660,   -- Gaea's Embrace
22661,   -- Polar Tunic
22662,   -- Polar Gloves
22663,   -- Polar Bracers
22664,   -- Icy Scale Breastplate
22665,   -- Icy Scale Bracers
22666,   -- Icy Scale Gauntlets
22667,   -- Bracers of Hope
22668,   -- Bracers of Subterfuge
22669,   -- Icebane Breastplate
22670,   -- Icebane Gauntlets
22671,   -- Icebane Bracers
22672,   -- Sentinel's Plate Legguards
22673,   -- Outrider's Chain Leggings
22676,   -- Outrider's Mail Leggings
22678,   -- Talisman of Ascendance
22680,   -- Band of Resolution
22681,   -- Band of Piety
22683,   -- Pattern: Gaea's Embrace
22688,   -- Verimonde's Last Resort
22689,   -- Sanctified Leather Helm
22690,   -- Leggings of the Plague Hunter
22691,   -- Corrupted Ashbringer
22699,   -- Icebane Leggings
22700,   -- Glacial Leggings
22701,   -- Polar Leggings
22702,   -- Icy Scale Leggings
22707,   -- Ramaladni's Icy Grasp
22711,   -- Cloak of the Hakkari Worshipers
22712,   -- Might of the Tribe
22713,   -- Zulian Scepter of Rites
22714,   -- Sacrificial Gauntlets
22715,   -- Gloves of the Tormented
22716,   -- Belt of Untapped Power
22718,   -- Blooddrenched Mask
22720,   -- Zulian Headdress
22721,   -- Band of Servitude
22722,   -- Seal of the Gurubashi Berserker
22725,   -- Band of Cenarius
22730,   -- Eyestalk Waist Cord
22731,   -- Cloak of the Devoured
22732,   -- Mark of C'Thun
22736,   -- Andonisus, Reaper of Souls
22740,   -- Outrider's Leather Pants
22741,   -- Outrider's Lizardhide Pants
22742,   -- Bloodsail Shirt
22744,   -- Bloodsail Boots
22745,   -- Bloodsail Pants
22747,   -- Outrider's Silk Leggings
22748,   -- Sentinel's Chain Leggings
22749,   -- Sentinel's Leather Pants
22750,   -- Sentinel's Lizardhide Pants
22752,   -- Sentinel's Silk Leggings
22753,   -- Sentinel's Lamellar Legguards
22756,   -- Sylvan Vest
22757,   -- Sylvan Crown
22758,   -- Sylvan Shoulders
22759,   -- Bramblewood Helm
22760,   -- Bramblewood Boots
22761,   -- Bramblewood Belt
22762,   -- Ironvine Breastplate
22763,   -- Ironvine Gloves
22764,   -- Ironvine Belt
22766,   -- Plans: Ironvine Breastplate
22767,   -- Plans: Ironvine Gloves
22768,   -- Plans: Ironvine Belt
22769,   -- Pattern: Bramblewood Belt
22770,   -- Pattern: Bramblewood Boots
22771,   -- Pattern: Bramblewood Helm
22772,   -- Pattern: Sylvan Shoulders
22773,   -- Pattern: Sylvan Crown
22774,   -- Pattern: Sylvan Vest
22798,   -- Might of Menethil
22799,   -- Soulseeker
22800,   -- Brimstone Staff
22801,   -- Spire of Twilight
22802,   -- Kingsfall
22803,   -- Midnight Haze
22804,   -- Maexxna's Fang
22806,   -- Widow's Remorse
22807,   -- Wraith Blade
22808,   -- The Castigator
22809,   -- Maul of the Redeemed Crusader
22810,   -- Toxin Injector
22811,   -- Soulstring
22812,   -- Nerubian Slavemaker
22813,   -- Claymore of Unholy Might
22815,   -- Severance
22816,   -- Hatchet of Sundered Bone
22818,   -- The Plague Bearer
22819,   -- Shield of Condemnation
22820,   -- Wand of Fates
22821,   -- Doomfinger
22843,   -- Blood Guard's Chain Greaves
22852,   -- Blood Guard's Dragonhide Treads
22855,   -- Blood Guard's Dreadweave Walkers
22856,   -- Blood Guard's Leather Walkers
22857,   -- Blood Guard's Mail Greaves
22858,   -- Blood Guard's Plate Greaves
22859,   -- Blood Guard's Satin Walkers
22860,   -- Blood Guard's Silk Walkers
22862,   -- Blood Guard's Chain Vices
22863,   -- Blood Guard's Dragonhide Grips
22864,   -- Blood Guard's Leather Grips
22865,   -- Blood Guard's Dreadweave Handwraps
22867,   -- Blood Guard's Mail Vices
22868,   -- Blood Guard's Plate Gauntlets
22869,   -- Blood Guard's Satin Handwraps
22870,   -- Blood Guard's Silk Handwraps
22872,   -- Legionnaire's Plate Hauberk
22873,   -- Legionnaire's Plate Leggings
22874,   -- Legionnaire's Chain Hauberk
22875,   -- Legionnaire's Chain Legguards
22876,   -- Legionnaire's Mail Hauberk
22877,   -- Legionnaire's Dragonhide Chestpiece
22878,   -- Legionnaire's Dragonhide Leggings
22879,   -- Legionnaire's Leather Chestpiece
22880,   -- Legionnaire's Leather Legguards
22881,   -- Legionnaire's Dreadweave Legguards
22882,   -- Legionnaire's Satin Legguards
22883,   -- Legionnaire's Silk Legguards
22884,   -- Legionnaire's Dreadweave Tunic
22885,   -- Legionnaire's Satin Tunic
22886,   -- Legionnaire's Silk Tunic
22887,   -- Legionnaire's Mail Legguards
22890,   -- Tome of Frost Ward V
22891,   -- Grimoire of Shadow Ward IV
22935,   -- Touch of Frost
22936,   -- Wristguards of Vengeance
22937,   -- Gem of Nerubis
22938,   -- Cryptfiend Silk Cloak
22939,   -- Band of Unanswered Prayers
22940,   -- Icebane Pauldrons
22941,   -- Polar Shoulder Pads
22942,   -- The Widow's Embrace
22943,   -- Malice Stone Pendant
22947,   -- Pendant of Forgotten Names
22954,   -- Kiss of the Spider
22960,   -- Cloak of Suturing
22961,   -- Band of Reanimation
22967,   -- Icy Scale Spaulders
22968,   -- Glacial Mantle
22981,   -- Gluth's Missing Collar
22983,   -- Rime Covered Mantle
22988,   -- The End of Dreams
22994,   -- Digested Hand of Power
22999,   -- Tabard of the Argent Dawn
23000,   -- Plated Abomination Ribcage
23001,   -- Eye of Diminution
23004,   -- Idol of Longevity
23005,   -- Totem of Flowing Water
23006,   -- Libram of Light
23009,   -- Wand of the Whispering Dead
23014,   -- Iblis, Blade of the Fallen Seraph
23017,   -- Veil of Eclipse
23018,   -- Signet of the Fallen Defender
23019,   -- Icebane Helmet
23020,   -- Polar Helmet
23021,   -- The Soul Harvester's Bindings
23023,   -- Sadist's Collar
23025,   -- Seal of the Damned
23027,   -- Warmth of Forgiveness
23028,   -- Hailstone Band
23029,   -- Noth's Frigid Heart
23030,   -- Cloak of the Scourge
23031,   -- Band of the Inevitable
23032,   -- Glacial Headdress
23033,   -- Icy Scale Coif
23035,   -- Preceptor's Hat
23036,   -- Necklace of Necropsy
23037,   -- Ring of Spiritual Fervor
23038,   -- Band of Unnatural Forces
23039,   -- The Eye of Nerub
23040,   -- Glyph of Deflection
23041,   -- Slayer's Crest
23042,   -- Loatheb's Reflection
23043,   -- The Face of Death
23044,   -- Harbinger of Doom
23045,   -- Shroud of Dominion
23046,   -- The Restrained Essence of Sapphiron
23047,   -- Eye of the Dead
23048,   -- Sapphiron's Right Eye
23049,   -- Sapphiron's Left Eye
23050,   -- Cloak of the Necropolis
23051,   -- Glaive of the Defender
23053,   -- Stormrage's Talisman of Seething
23054,   -- Gressil, Dawn of Ruin
23056,   -- Hammer of the Twisting Nether
23057,   -- Gem of Trapped Innocents
23059,   -- Ring of the Dreadnaught
23060,   -- Bonescythe Ring
23061,   -- Ring of Faith
23062,   -- Frostfire Ring
23063,   -- Plagueheart Ring
23064,   -- Ring of The Dreamwalker
23065,   -- Ring of the Earthshatterer
23066,   -- Ring of Redemption
23067,   -- Ring of  the Cryptstalker
23068,   -- Legplates of Carnage
23069,   -- Necro-Knight's Garb
23070,   -- Leggings of Polarity
23071,   -- Leggings of Apocalypse
23073,   -- Boots of Displacement
23075,   -- Death's Bargain
23078,   -- Gauntlets of Undead Slaying
23081,   -- Handwraps of Undead Slaying
23082,   -- Handguards of Undead Slaying
23084,   -- Gloves of Undead Cleansing
23085,   -- Robe of Undead Cleansing
23087,   -- Breastplate of Undead Slaying
23088,   -- Chestguard of Undead Slaying
23089,   -- Tunic of Undead Slaying
23090,   -- Bracers of Undead Slaying
23091,   -- Bracers of Undead Cleansing
23092,   -- Wristguards of Undead Slaying
23093,   -- Wristwraps of Undead Slaying
23124,   -- Staff of Balzaphon
23125,   -- Chains of the Lich
23126,   -- Waistband of Balzaphon
23127,   -- Cloak of Revanchion
23128,   -- The Shadow's Grasp
23129,   -- Bracers of Mending
23132,   -- Lord Blackwood's Blade
23139,   -- Lord Blackwood's Buckler
23156,   -- Blackwood's Thigh
23168,   -- Scorn's Focal Dagger
23169,   -- Scorn's Icy Choker
23170,   -- The Frozen Clutch
23171,   -- The Axe of Severing
23173,   -- Abomination Skin Leggings
23177,   -- Lady Falther'ess' Finger
23178,   -- Mantle of Lady Falther'ess
23197,   -- Idol of the Moon
23198,   -- Idol of Brutality
23199,   -- Totem of the Storm
23200,   -- Totem of Sustaining
23201,   -- Libram of Divinity
23203,   -- Libram of Fervor
23206,   -- Mark of the Champion
23207,   -- Mark of the Champion
23219,   -- Girdle of the Mentor
23220,   -- Crystal Webbed Robe
23221,   -- Misplaced Servo Arm
23226,   -- Ghoul Skin Tunic
23237,   -- Ring of the Eternal Flame
23238,   -- Stygian Buckler
23242,   -- Claw of the Frost Wyrm
23243,   -- Champion's Plate Shoulders
23244,   -- Champion's Plate Helm
23251,   -- Champion's Chain Helm
23252,   -- Champion's Chain Shoulders
23253,   -- Champion's Dragonhide Headguard
23254,   -- Champion's Dragonhide Shoulders
23255,   -- Champion's Dreadweave Cowl
23256,   -- Champion's Dreadweave Spaulders
23257,   -- Champion's Leather Helm
23258,   -- Champion's Leather Shoulders
23259,   -- Champion's Mail Headguard
23260,   -- Champion's Mail Pauldrons
23261,   -- Champion's Satin Hood
23262,   -- Champion's Satin Mantle
23263,   -- Champion's Silk Cowl
23264,   -- Champion's Silk Mantle
23272,   -- Knight-Captain's Lamellar Breastplate
23273,   -- Knight-Captain's Lamellar Leggings
23274,   -- Knight-Lieutenant's Lamellar Gauntlets
23275,   -- Knight-Lieutenant's Lamellar Sabatons
23276,   -- Lieutenant Commander's Lamellar Headguard
23277,   -- Lieutenant Commander's Lamellar Shoulders
23278,   -- Knight-Lieutenant's Chain Greaves
23279,   -- Knight-Lieutenant's Chain Vices
23280,   -- Knight-Lieutenant's Dragonhide Grips
23281,   -- Knight-Lieutenant's Dragonhide Treads
23282,   -- Knight-Lieutenant's Dreadweave Handwraps
23283,   -- Knight-Lieutenant's Dreadweave Walkers
23284,   -- Knight-Lieutenant's Leather Grips
23285,   -- Knight-Lieutenant's Leather Walkers
23286,   -- Knight-Lieutenant's Plate Gauntlets
23287,   -- Knight-Lieutenant's Plate Greaves
23288,   -- Knight-Lieutenant's Satin Handwraps
23289,   -- Knight-Lieutenant's Satin Walkers
23290,   -- Knight-Lieutenant's Silk Handwraps
23291,   -- Knight-Lieutenant's Silk Walkers
23292,   -- Knight-Captain's Chain Hauberk
23293,   -- Knight-Captain's Chain Legguards
23294,   -- Knight-Captain's Dragonhide Chestpiece
23295,   -- Knight-Captain's Dragonhide Leggings
23296,   -- Knight-Captain's Dreadweave Legguards
23297,   -- Knight-Captain's Dreadweave Tunic
23298,   -- Knight-Captain's Leather Chestpiece
23299,   -- Knight-Captain's Leather Legguards
23300,   -- Knight-Captain's Plate Hauberk
23301,   -- Knight-Captain's Plate Leggings
23302,   -- Knight-Captain's Satin Legguards
23303,   -- Knight-Captain's Satin Tunic
23304,   -- Knight-Captain's Silk Legguards
23305,   -- Knight-Captain's Silk Tunic
23306,   -- Lieutenant Commander's Chain Helm
23307,   -- Lieutenant Commander's Chain Shoulders
23308,   -- Lieutenant Commander's Dragonhide Headguard
23309,   -- Lieutenant Commander's Dragonhide Shoulders
23310,   -- Lieutenant Commander's Dreadweave Cowl
23311,   -- Lieutenant Commander's Dreadweave Spaulders
23312,   -- Lieutenant Commander's Leather Helm
23313,   -- Lieutenant Commander's Leather Shoulders
23314,   -- Lieutenant Commander's Plate Helm
23315,   -- Lieutenant Commander's Plate Shoulders
23316,   -- Lieutenant Commander's Satin Hood
23317,   -- Lieutenant Commander's Satin Mantle
23318,   -- Lieutenant Commander's Silk Cowl
23319,   -- Lieutenant Commander's Silk Mantle
23320,   -- Tablet of Flame Shock VI
23323,   -- Crown of the Fire Festival
23324,   -- Mantle of the Fire Festival
23451,   -- Grand Marshal's Mageblade
23452,   -- Grand Marshal's Tome of Power
23453,   -- Grand Marshal's Tome of Restoration
23454,   -- Grand Marshal's Warhammer
23455,   -- Grand Marshal's Demolisher
23456,   -- Grand Marshal's Swiftblade
23464,   -- High Warlord's Battle Mace
23465,   -- High Warlord's Destroyer
23466,   -- High Warlord's Spellblade
23467,   -- High Warlord's Quickblade
23468,   -- High Warlord's Tome of Destruction
23469,   -- High Warlord's Tome of Mending
23557,   -- Larvae of the Great Worm
23558,   -- The Burrower's Shell
23570,   -- Jom Gabbar
23577,   -- The Hungering Cold
23663,   -- Girdle of Elemental Fury
23664,   -- Pauldrons of Elemental Fury
23665,   -- Leggings of Elemental Fury
23666,   -- Belt of the Grand Crusader
23667,   -- Spaulders of the Grand Crusader
23668,   -- Leggings of the Grand Crusader
24101,   -- Book of Ferocious Bite V
24102,   -- Manual of Eviscerate IX
24222   -- The Shadowfoot Stabber
);

-- * ITEMS AND LOOT

-- Finished initial loading
-- SPELLS CHANGED: Ardent Custodian (ilevel 43 entry 868). 2 versions
-- Source: http://www.thottbot.com/?n=41260 / http://wow.allakhazam.com/dyn/items/itype21.html
-- Source: http://www.thottbot.com/?n=91113
-- * Modified spell 1
-- 1.12 spell 7518 (Increased Defense +5.)
-- 1.04 spell 13386 (Increased Defense +7.)
-- SPELLS CHANGED: Staff of Jordan (ilevel 40 entry 873). 5 versions
-- Source: http://www.thottbot.com/?n=90936 / http://wow.allakhazam.com/db/item.html?witem=873
-- Source: http://wow.allakhazam.com/dyn/items/iname17.html
-- Source: http://www.thottbot.com/?n=91110
-- Source: http://wow.allakhazam.com/dyn/items/wminlev10.html
-- Source: http://www.thottbot.com/?i=7166
-- * Modified spell 1
-- 1.12 spell 18049 (Increases damage and healing done by magical spells and effects by up to 26.)
-- 1.04 spell 9346 (Increases damage and healing done by magical spells and effects by up to 18.)
-- SPELLS CHANGED: Gnoll Casting Gloves (ilevel 22 entry 892). 2 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=892
-- Source: http://www.thottbot.com/?n=5761
-- * Modified spell 1
-- 1.12 spell 9396 (Increases damage and healing done by magical spells and effects by up to 6.)
-- 1.04 spell 9393 (Increases damage and healing done by magical spells and effects by up to 2.)
-- SPELLS CHANGED: Freezing Band (ilevel 52 entry 942). 2 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=942
-- Source: http://www.thottbot.com/?n=15081
-- * Modified spell 1
-- 1.12 spell 9308 (Increases damage done by Frost spells and effects by up to 21.)
-- 1.04 spell 9404 (Increases damage done by Frost spells and effects by up to 14.)
-- SPELLS CHANGED: Warden Staff (ilevel 48 entry 943). 5 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype17.html
-- Source: http://wow.allakhazam.com/dyn/items/wminlev10.html
-- Source: http://www.thottbot.com/?n=161375 / http://wow.allakhazam.com/db/price.html?witem=943
-- Source: http://www.thottbot.com/?n=74695
-- Source: http://www.thottbot.com/?n=149424
-- * Modified spell 1
-- 1.12 spell 13390 (Increased Defense +10.)
-- 1.04 spell 21411 (Increased Defense +15.)
-- SPELLS CHANGED: Elemental Mage Staff (ilevel 61 entry 944). 4 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname17.html
-- Source: http://wow.allakhazam.com/dyn/items/wminlev10.html
-- Source: http://wow.allakhazam.com/db/price.html?witem=944
-- Source: http://www.thottbot.com/?n=39392
-- * Modified spell 1
-- 1.12 spell 17873 (Increases damage done by Fire spells and effects by up to 36.)
-- 1.04 spell 17870 (Increases damage done by Fire spells and effects by up to 31.)
-- * Modified spell 2
-- 1.12 spell 17897 (Increases damage done by Frost spells and effects by up to 36.)
-- 1.04 spell 17894 (Increases damage done by Frost spells and effects by up to 31.)
-- NOT FOUND: Support Girdle (ilevel 22 entry 1215)
-- SPELLS CHANGED: Lesser Firestone (ilevel 28 entry 1254). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname23.html
-- * Modified spell 2
-- 1.12 spell 23480 (Increases damage done by Fire spells and effects by up to 10.)
-- 1.04 spell 0 ()
-- SPELLS CHANGED: Witching Stave (ilevel 22 entry 1484). 4 versions
-- Source: http://www.thottbot.com/?n=7253 / http://wow.allakhazam.com/db/item.html?witem=1484
-- Source: http://www.thottbot.com/?n=10371
-- Source: http://wow.allakhazam.com/dyn/items/itype17.html
-- Source: http://wow.allakhazam.com/dyn/items/wminlev10.html
-- * Modified spell 1
-- 1.12 spell 9412 (Increases damage done by Shadow spells and effects by up to 11.)
-- 1.04 spell 7708 (Increases damage done by Shadow spells and effects by up to 7.)
-- SPELLS CHANGED: Spellforce Rod (ilevel 41 entry 1664). 5 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname17.html
-- Source: http://wow.allakhazam.com/dyn/items/wminlev10.html
-- Source: http://www.thottbot.com/?i=Spellforce%20Rod
-- Source: http://www.thottbot.com/?n=94415
-- Source: http://wow.allakhazam.com/item.html?witem=1664
-- * Modified spell 1
-- 1.12 spell 14799 (Increases damage and healing done by magical spells and effects by up to 20.)
-- 1.04 spell 9416 (Increases damage and healing done by magical spells and effects by up to 11.)
-- NOT FOUND: Drake-scale Vest (ilevel 46 entry 1677)
-- SPELLS CHANGED: Robe of the Magi (ilevel 40 entry 1716). 3 versions
-- Source: http://www.thottbot.com/?n=224623 / http://wow.allakhazam.com/db/item.html?witem=1716
-- Source: http://www.thottbot.com/?n=108214
-- Source: http://wow.allakhazam.com/dyn/items/iname20.html
-- * Modified spell 1
-- 1.12 spell 15714 (Increases damage and healing done by magical spells and effects by up to 22.)
-- 1.04 spell 9343 (Increases damage and healing done by magical spells and effects by up to 14.)
-- SPELLS REMOVED: Double Link Tunic (ilevel 30 entry 1717). 4 versions
-- Source: http://wow.allakhazam.com/profile.html?26338
-- Source: http://www.thottbot.com/?n=128329
-- Source: http://wow.allakhazam.com/dyn/items/iname5.html
-- Source: http://www.thottbot.com/?n=11363
-- * Modified spell 1
-- 1.12 spell 0 ()
-- 1.04 spell 21410 (Increased Defense +14.)
-- * Modified spell 2
-- 1.12 spell 18369 (Increased Defense +9.)
-- 1.04 spell 0 ()
-- SPELLS CHANGED: Tanglewood Staff (ilevel 46 entry 1720). 4 versions
-- Source: http://www.thottbot.com/?n=298498 / http://wow.allakhazam.com/dyn/items/itype17.html
-- Source: http://www.thottbot.com/?i=14725
-- Source: http://www.thottbot.com/?n=7124
-- Source: http://wow.allakhazam.com/dyn/items/wminlev10.html
-- * Modified spell 1
-- 1.12 spell 9411 (Increases damage done by Nature spells and effects by up to 14.)
-- 1.04 spell 7696 (Increases damage done by Nature spells and effects by up to 10.)
-- SPELLS CHANGED: Underworld Band (ilevel 43 entry 1980). 2 versions
-- Source: http://www.thottbot.com/?n=224530 / http://wow.allakhazam.com/item.html?witem=1980
-- Source: http://wow.allakhazam.com/dyn/items/iname11.html
-- * Modified spell 1
-- 1.12 spell 9414 (Increases damage done by Shadow spells and effects by up to 14.)
-- 1.04 spell 7709 (Increases damage done by Shadow spells and effects by up to 10.)
-- SPELLS CHANGED: Swampchill Fetish (ilevel 38 entry 1992). 2 versions
-- Source: http://www.thottbot.com/?n=246722
-- Source: http://wow.allakhazam.com/dyn/items/iname23.html
-- * Modified spell 1
-- 1.12 spell 9402 (Increases damage done by Frost spells and effects by up to 11.)
-- 1.04 spell 7701 (Increases damage done by Frost spells and effects by up to 7.)
-- * Modified spell 2
-- 1.12 spell 9412 (Increases damage done by Shadow spells and effects by up to 11.)
-- 1.04 spell 7708 (Increases damage done by Shadow spells and effects by up to 7.)
-- STATS CHANGED: Voodoo Band (ilevel 37 entry 1996). 1/1 versions
-- SPELLS CHANGED: Bloodscalp Channeling Staff (ilevel 33 entry 1998). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype17.html
-- Source: http://wow.allakhazam.com/dyn/items/wminlev10.html
-- * Modified spell 1
-- 1.12 spell 9359 (Increases damage done by Nature spells and effects by up to 19.)
-- 1.04 spell 9411 (Increases damage done by Nature spells and effects by up to 14.)
-- SPELLS CHANGED: Inferno Robe (ilevel 40 entry 2231). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=2231
-- Source: http://wow.allakhazam.com/dyn/items/iname20.html
-- * Modified spell 1
-- 1.12 spell 17747 (Increases damage done by Fire spells and effects by up to 23.)
-- 1.04 spell 9294 (Increases damage done by Fire spells and effects by up to 16.)
-- SPELLS CHANGED: Staff of the Blessed Seer (ilevel 23 entry 2271). 3 versions
-- Source: http://www.thottbot.com/?n=10405 / http://wow.allakhazam.com/db/item.html?witem=2271
-- Source: http://wow.allakhazam.com/dyn/items/wminlev10.html
-- Source: http://www.thottbot.com/?n=9022
-- * Modified spell 1
-- 1.12 spell 9314 (Increases healing done by spells and effects by up to 24.)
-- 1.04 spell 9408 (Increases healing done by spells and effects by up to 22.)
-- SPELLS CHANGED: Necromancer Leggings (ilevel 35 entry 2277). 3 versions
-- Source: http://www.thottbot.com/?n=11572 / http://wow.allakhazam.com/db/item.html?witem=2277
-- Source: http://www.thottbot.com/?n=16473
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- * Modified spell 1
-- 1.12 spell 7709 (Increases damage done by Shadow spells and effects by up to 10.)
-- 1.04 spell 7708 (Increases damage done by Shadow spells and effects by up to 7.)
-- SPELLS CHANGED: Staff of the Shade (ilevel 27 entry 2549). 3 versions
-- Source: http://www.thottbot.com/?n=7338
-- Source: http://wow.allakhazam.com/item.html?witem=2549
-- Source: http://wow.allakhazam.com/dyn/items/wminlev10.html
-- * Modified spell 1
-- 1.12 spell 9328 (Increases damage done by Shadow spells and effects by up to 21.)
-- 1.04 spell 9414 (Increases damage done by Shadow spells and effects by up to 14.)
-- SPELLS CHANGED: Elven Spirit Claws (ilevel 50 entry 2564). 2 versions
-- Source: http://www.thottbot.com/?i=5518 / http://wow.allakhazam.com/dyn/items/iname10.html
-- Source: http://www.thottbot.com/?n=5813
-- * Modified spell 1
-- 1.12 spell 9361 (Increases damage done by Nature spells and effects by up to 21.)
-- 1.04 spell 9411 (Increases damage done by Nature spells and effects by up to 14.)
-- SPELLS CHANGED: Rod of Molten Fire (ilevel 35 entry 2565). 1 versions
-- Source: http://www.thottbot.com/?n=16473 / http://wow.allakhazam.com/item.html?witem=2565
-- * Modified spell 1
-- 1.12 spell 9400 (Increases damage done by Fire spells and effects by up to 13.)
-- 1.04 spell 7688 (Increases damage done by Fire spells and effects by up to 9.)
-- STATS CHANGED: Augural Shroud (ilevel 39 entry 2620). 1/3 versions
-- SPELLS REMOVED: Augural Shroud (ilevel 39 entry 2620). 3 versions
-- Source: http://www.thottbot.com/?n=27061
-- Source: http://wow.allakhazam.com/db/item.html?witem=2620
-- Source: http://wow.allakhazam.com/dyn/items/iname1.html
-- * Modified spell 1
-- 1.12 spell 9416 (Increases damage and healing done by magical spells and effects by up to 11.)
-- 1.04 spell 0 ()
-- NOT FOUND: Monster - Item, Lantern - Round (ilevel 1 entry 2715)
-- SPELLS CHANGED: Holy Shroud (ilevel 32 entry 2721). 3 versions
-- Source: http://www.thottbot.com/?i=7288 / http://wow.allakhazam.com/db/price.html?witem=2721
-- Source: http://www.thottbot.com/?n=7753
-- Source: http://wow.allakhazam.com/dyn/items/iname1.html
-- * Modified spell 1
-- 1.12 spell 9318 (Increases healing done by spells and effects by up to 33.)
-- 1.04 spell 25067 (Increases healing done by spells and effects by up to 30.)
-- SPELLS CHANGED: Death Speaker Scepter (ilevel 33 entry 2816). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/wname4.html
-- Source: http://wow.allakhazam.com/dyn/items/itype21.html
-- Source: http://www.thottbot.com/?i=Death%20Speaker%20Scepter
-- * Modified spell 1
-- 1.12 spell 7679 (Increases healing done by spells and effects by up to 11.)
-- 1.04 spell 7678 (Increases healing done by spells and effects by up to 9.)
-- * Modified spell 2
-- 1.12 spell 7708 (Increases damage done by Shadow spells and effects by up to 7.)
-- 1.04 spell 7706 (Increases damage done by Shadow spells and effects by up to 4.)
-- SPELLS REMOVED: Hurricane (ilevel 53 entry 2824). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/wratio2.html
-- Source: http://wow.allakhazam.com/dyn/items/iminlev15.html
-- Source: http://www.thottbot.com/?n=183477
-- * Modified spell 1
-- 1.12 spell 29501 (Chance to strike your target with a Frost Arrow for 31 to 46 Frost damage.)
-- 1.04 spell 0 ()
-- SPELLS CHANGED: Antipodean Rod (ilevel 22 entry 2879). 1 versions
-- Source: http://www.thottbot.com/?n=5244 / http://wow.allakhazam.com/db/item.html?witem=2879
-- * Modified spell 1
-- 1.12 spell 7686 (Increases damage done by Fire spells and effects by up to 6.)
-- 1.04 spell 7685 (Increases damage done by Fire spells and effects by up to 4.)
-- * Modified spell 2
-- 1.12 spell 7700 (Increases damage done by Frost spells and effects by up to 6.)
-- 1.04 spell 7699 (Increases damage done by Frost spells and effects by up to 4.)
-- NOT FOUND: Wendigo Collar (ilevel 15 entry 2899)
-- STATS CHANGED: Seal of Wrynn (ilevel 31 entry 2933). 1/1 versions
-- QUALITY CHANGED: Seal of Wrynn (ilevel 31 entry 2933)
-- SPELLS CHANGED: Eye of Paleth (ilevel 31 entry 2943). 1 versions
-- Source: http://www.thottbot.com/?i=Eye%20of%20Paleth / http://wow.allakhazam.com/dyn/items/iname23.html
-- * Modified spell 1
-- 1.12 spell 7680 (Increases healing done by spells and effects by up to 13.)
-- 1.04 spell 7679 (Increases healing done by spells and effects by up to 11.)
-- SPELLS CHANGED: Cursed Eye of Paleth (ilevel 31 entry 2944). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname23.html
-- * Modified spell 1
-- 1.12 spell 7709 (Increases damage done by Shadow spells and effects by up to 10.)
-- 1.04 spell 7708 (Increases damage done by Shadow spells and effects by up to 7.)
-- SPELLS CHANGED: Icicle Rod (ilevel 25 entry 2950). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype17.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=2950
-- * Modified spell 1
-- 1.12 spell 7703 (Increases damage done by Frost spells and effects by up to 10.)
-- 1.04 spell 7701 (Increases damage done by Frost spells and effects by up to 7.)
-- STATS CHANGED: Night Watch Pantaloons (ilevel 33 entry 2954). 1/3 versions
-- SPELLS CHANGED: Smoldering Pants (ilevel 26 entry 3073). 1 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=3073
-- * Modified spell 1
-- 1.12 spell 9400 (Increases damage done by Fire spells and effects by up to 13.)
-- 1.04 spell 7688 (Increases damage done by Fire spells and effects by up to 9.)
-- SPELLS CHANGED: Eye of Flame (ilevel 55 entry 3075). 3 versions
-- Source: http://www.thottbot.com/?n=258500 / http://wow.allakhazam.com/item.html?witem=3075
-- Source: http://www.thottbot.com/?n=15081
-- Source: http://wow.allakhazam.com/dyn/items/iname1.html
-- * Modified spell 1
-- 1.12 spell 17878 (Increases damage done by Fire spells and effects by up to 43.)
-- 1.04 spell 17876 (Increases damage done by Fire spells and effects by up to 41.)
-- WARNING: NOT FOUND FOR DESC "Launches a bolt of frost at the enemy causing 20 to 30 Frost damage and slowing movement speed by 50% for 5 sec." (guessed 13439)
-- SPELLS CHANGED: Scorching Sash (ilevel 44 entry 4117). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=4117
-- Source: http://www.thottbot.com/?i=Scorching%20Sash
-- * Modified spell 1
-- 1.12 spell 9400 (Increases damage done by Fire spells and effects by up to 13.)
-- 1.04 spell 7688 (Increases damage done by Fire spells and effects by up to 9.)
-- SPELLS CHANGED: Phoenix Pants (ilevel 25 entry 4317). 2 versions
-- Source: http://www.thottbot.com/?i=1180 / http://wow.allakhazam.com/dyn/items/iname7.html
-- Source: http://www.thottbot.com/?i=9330
-- * Modified spell 1
-- 1.12 spell 7689 (Increases damage done by Fire spells and effects by up to 10.)
-- 1.04 spell 7687 (Increases damage done by Fire spells and effects by up to 7.)
-- SPELLS CHANGED: Azure Silk Gloves (ilevel 29 entry 4319). 2 versions
-- Source: http://www.thottbot.com/?i=301 / http://wow.allakhazam.com/dyn/items/iminlev10.html
-- Source: http://www.thottbot.com/?i=Heavy%20Leather
-- * Modified spell 1
-- 1.12 spell 7703 (Increases damage done by Frost spells and effects by up to 10.)
-- 1.04 spell 7701 (Increases damage done by Frost spells and effects by up to 7.)
-- SPELLS CHANGED: Shadow Hood (ilevel 34 entry 4323). 3 versions
-- Source: http://www.thottbot.com/?i=4543 / http://wow.allakhazam.com/item.html?witem=4323
-- Source: http://www.thottbot.com/?i=4543
-- Source: http://wow.allakhazam.com/dyn/items/iname1.html
-- * Modified spell 1
-- 1.12 spell 7708 (Increases damage done by Shadow spells and effects by up to 7.)
-- 1.04 spell 7706 (Increases damage done by Shadow spells and effects by up to 4.)
-- SPELLS CHANGED: Azure Silk Vest (ilevel 30 entry 4324). 2 versions
-- Source: http://www.thottbot.com/?i=1192 / http://wow.allakhazam.com/db/item.html?witem=4324
-- Source: http://wow.allakhazam.com/dyn/items/iname5.html
-- * Modified spell 1
-- 1.12 spell 7701 (Increases damage done by Frost spells and effects by up to 7.)
-- 1.04 spell 7699 (Increases damage done by Frost spells and effects by up to 4.)
-- SPELLS CHANGED: Star Belt (ilevel 40 entry 4329). 2 versions
-- Source: http://www.thottbot.com/?i=4596 / http://wow.allakhazam.com/item.html?witem=4329
-- Source: http://www.thottbot.com/?i=4596
-- * Modified spell 1
-- 1.12 spell 9342 (Increases damage and healing done by magical spells and effects by up to 13.)
-- 1.04 spell 9397 (Increases damage and healing done by magical spells and effects by up to 7.)
-- SPELLS CHANGED: Phoenix Gloves (ilevel 25 entry 4331). 2 versions
-- Source: http://www.thottbot.com/?i=1180 / http://wow.allakhazam.com/db/item.html?witem=4331
-- Source: http://www.thottbot.com/?i=Iridescent%20Pearl
-- * Modified spell 1
-- 1.12 spell 7688 (Increases damage done by Fire spells and effects by up to 9.)
-- 1.04 spell 7686 (Increases damage done by Fire spells and effects by up to 6.)
-- SPELLS REMOVED: Minor Recombobulator (ilevel 28 entry 4381). 2 versions
-- Source: http://www.thottbot.com/?i=Medium%20Leather
-- Source: http://wow.allakhazam.com/dyn/items/iminlev12.html
-- * Modified spell 1
-- 1.12 spell 18805 (Dispels Polymorph effects on a friendly target. Also restores 150 to 251 health and mana.)
-- 1.04 spell 0 ()
-- QUALITY CHANGED: Minor Recombobulator (ilevel 28 entry 4381)
-- DAMAGE CHANGED: Blackvenom Blade (ilevel 26 entry 4446). 1/2 versions
-- Source: http://wow.allakhazam.com/dyn/items/wname15.html
-- Source: http://wow.allakhazam.com/item.html?witem=4446
-- STATS CHANGED: Swampland Trousers (ilevel 31 entry 4505). 1/3 versions
-- SPELLS CHANGED: Pulsating Hydra Heart (ilevel 20 entry 5183). 1 versions
-- Source: http://www.thottbot.com/?i=Pulsating%20Hydra%20Heart / http://wow.allakhazam.com/db/item.html?witem=5183
-- * Modified spell 1
-- 1.12 spell 7687 (Increases damage done by Fire spells and effects by up to 7.)
-- 1.04 spell 7685 (Increases damage done by Fire spells and effects by up to 4.)
-- SPELLS CHANGED: Spellstone (ilevel 36 entry 5522). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname23.html
-- Source: http://wow.allakhazam.com/item.html?witem=5522
-- * Modified spell 2
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Murloc Scale Belt (ilevel 18 entry 5780). 1/2 versions
-- QUALITY CHANGED: Murloc Scale Belt (ilevel 18 entry 5780)
-- NOT FOUND: Ruffian Belt (ilevel 23 entry 5975)
-- STATS CHANGED: Wandering Boots (ilevel 24 entry 6095). 1/2 versions
-- NOT FOUND: Squire's Pants (ilevel 1 entry 6118)
-- NOT FOUND: Neophyte's Robe (ilevel 1 entry 6119)
-- NOT FOUND: Acolyte's Robe (ilevel 1 entry 6129)
-- NOT FOUND: Thug Shirt (ilevel 1 entry 6136)
-- NOT FOUND: White Tuxedo Shirt (ilevel 25 entry 6833)
-- NOT FOUND: Dress Shoes (ilevel 1 entry 6836)
-- SPELLS CHANGED: Orb of Soran'ruk (ilevel 25 entry 6898). 3 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=6898
-- Source: http://wow.allakhazam.com/dyn/items/iname23.html
-- Source: http://www.thottbot.com/?i=8720
-- * Modified spell 1
-- 1.12 spell 7685 (Increases damage done by Fire spells and effects by up to 4.)
-- 1.04 spell 7684 (Increases damage done by Fire spells and effects by up to 3.)
-- * Modified spell 2
-- 1.12 spell 7706 (Increases damage done by Shadow spells and effects by up to 4.)
-- 1.04 spell 7705 (Increases damage done by Shadow spells and effects by up to 3.)
-- SPELLS CHANGED: Azure Silk Pants (ilevel 28 entry 7046). 3 versions
-- Source: http://www.thottbot.com/?i=301 / http://wow.allakhazam.com/item.html?witem=7046
-- Source: http://www.thottbot.com/?i=301
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- * Modified spell 1
-- 1.12 spell 7703 (Increases damage done by Frost spells and effects by up to 10.)
-- 1.04 spell 7701 (Increases damage done by Frost spells and effects by up to 7.)
-- SPELLS CHANGED: Hands of Darkness (ilevel 29 entry 7047). 2 versions
-- Source: http://www.thottbot.com/?i=11768 / http://wow.allakhazam.com/dyn/items/iname10.html
-- Source: http://www.thottbot.com/?i=Heavy%20Leather
-- * Modified spell 1
-- 1.12 spell 7710 (Increases damage done by Shadow spells and effects by up to 9.)
-- 1.04 spell 7707 (Increases damage done by Shadow spells and effects by up to 6.)
-- SPELLS CHANGED: Truefaith Gloves (ilevel 30 entry 7049). 2 versions
-- Source: http://www.thottbot.com/?i=2215 / http://wow.allakhazam.com/dyn/items/iname10.html
-- Source: http://www.thottbot.com/?i=2215
-- * Modified spell 1
-- 1.12 spell 7681 (Increases healing done by spells and effects by up to 15.)
-- 1.04 spell 7680 (Increases healing done by spells and effects by up to 13.)
-- SPELLS CHANGED: Azure Silk Cloak (ilevel 35 entry 7053). 2 versions
-- Source: http://www.thottbot.com/?i=301 / http://wow.allakhazam.com/item.html?witem=7053
-- Source: http://wow.allakhazam.com/dyn/items/iminlev16.html
-- * Modified spell 1
-- 1.12 spell 7703 (Increases damage done by Frost spells and effects by up to 10.)
-- 1.04 spell 7701 (Increases damage done by Frost spells and effects by up to 7.)
-- SPELLS CHANGED: Robe of Power (ilevel 38 entry 7054). 2 versions
-- Source: http://www.thottbot.com/?i=3790 / http://wow.allakhazam.com/db/item.html?witem=7054
-- Source: http://www.thottbot.com/?i=3555
-- * Modified spell 1
-- 1.12 spell 9343 (Increases damage and healing done by magical spells and effects by up to 14.)
-- 1.04 spell 25109 (Increases damage and healing done by magical spells and effects by up to 8.)
-- SPELLS CHANGED: Azure Shoulders (ilevel 38 entry 7060). 1 versions
-- Source: http://www.thottbot.com/?i=428 / http://wow.allakhazam.com/dyn/items/iminlev3.html
-- * Modified spell 1
-- 1.12 spell 9403 (Increases damage done by Frost spells and effects by up to 13.)
-- 1.04 spell 7702 (Increases damage done by Frost spells and effects by up to 9.)
-- SPELLS CHANGED: Crimson Silk Gloves (ilevel 42 entry 7064). 2 versions
-- Source: http://www.thottbot.com/?i=4286 / http://wow.allakhazam.com/db/item.html?witem=7064
-- Source: http://www.thottbot.com/?i=4286
-- * Modified spell 1
-- 1.12 spell 9401 (Increases damage done by Fire spells and effects by up to 14.)
-- 1.04 spell 23480 (Increases damage done by Fire spells and effects by up to 10.)
-- SPELLS CHANGED: Frost Leather Cloak (ilevel 36 entry 7377). 1 versions
-- Source: http://www.thottbot.com/?i=3555 / http://wow.allakhazam.com/item.html?witem=7377
-- * Modified spell 1
-- 1.12 spell 9402 (Increases damage done by Frost spells and effects by up to 11.)
-- 1.04 spell 7701 (Increases damage done by Frost spells and effects by up to 7.)
-- STATS CHANGED: Manaweave Robe (ilevel 20 entry 7509). 1/2 versions
-- STATS CHANGED: Lesser Spellfire Robes (ilevel 20 entry 7510). 1/2 versions
-- STATS CHANGED: Astral Knot Robe (ilevel 31 entry 7511). 1/1 versions
-- STATS CHANGED: Nether-lace Robe (ilevel 31 entry 7512). 1/1 versions
-- STATS REMOVED for item Ragefire Wand (http://wow.allakhazam.com/dyn/items/wminlev19.html) 
-- DAMAGE CHANGED: Ragefire Wand (ilevel 40 entry 7513). 1/4 versions
-- Source: http://wow.allakhazam.com/dyn/items/wminlev19.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=7513
-- Source: http://wow.allakhazam.com/dyn/items/iminlev26.html
-- Source: http://www.thottbot.com/?i=3399
-- SPELLS CHANGED: Ragefire Wand (ilevel 40 entry 7513). 4 versions
-- Source: http://wow.allakhazam.com/dyn/items/wminlev19.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=7513
-- Source: http://wow.allakhazam.com/dyn/items/iminlev26.html
-- Source: http://www.thottbot.com/?i=3399
-- * Modified spell 1
-- 1.12 spell 7688 (Increases damage done by Fire spells and effects by up to 9.)
-- 1.04 spell 7685 (Increases damage done by Fire spells and effects by up to 4.)
-- QUALITY CHANGED: Ragefire Wand (ilevel 40 entry 7513)
-- STATS REMOVED for item Icefury Wand (http://wow.allakhazam.com/db/item.html?witem=7514) 
-- DAMAGE CHANGED: Icefury Wand (ilevel 40 entry 7514). 1/3 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=7514
-- Source: http://wow.allakhazam.com/dyn/items/wname19.html
-- Source: http://www.thottbot.com/?i=3399
-- SPELLS CHANGED: Icefury Wand (ilevel 40 entry 7514). 3 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=7514
-- Source: http://wow.allakhazam.com/dyn/items/wname19.html
-- Source: http://www.thottbot.com/?i=3399
-- * Modified spell 1
-- 1.12 spell 7702 (Increases damage done by Frost spells and effects by up to 9.)
-- 1.04 spell 7699 (Increases damage done by Frost spells and effects by up to 4.)
-- QUALITY CHANGED: Icefury Wand (ilevel 40 entry 7514)
-- STATS CHANGED: Celestial Orb (ilevel 40 entry 7515). 1/1 versions
-- SPELLS CHANGED: Celestial Orb (ilevel 40 entry 7515). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname23.html
-- * Modified spell 1
-- 1.12 spell 9342 (Increases damage and healing done by magical spells and effects by up to 13.)
-- 1.04 spell 13593 (Increases damage done by Arcane spells and effects by up to 6.)
-- * Modified spell 2
-- 1.12 spell 9253 (Restores 400 to 1201 mana.)
-- 1.04 spell 7686 (Increases damage done by Fire spells and effects by up to 6.)
-- * Modified spell 3
-- 1.12 spell 0 ()
-- 1.04 spell 7700 (Increases damage done by Frost spells and effects by up to 6.)
-- SPELLS CHANGED: Band of the Unicorn (ilevel 48 entry 7553). 1 versions
-- Source: http://www.thottbot.com/?n=149426 / http://wow.allakhazam.com/db/price.html?witem=7553
-- * Modified spell 1
-- 1.12 spell 9342 (Increases damage and healing done by magical spells and effects by up to 13.)
-- 1.04 spell 9397 (Increases damage and healing done by magical spells and effects by up to 7.)
-- SPELLS CHANGED: Orb of the Forgotten Seer (ilevel 38 entry 7685). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname23.html
-- Source: http://wow.allakhazam.com/item.html?witem=7685
-- * Modified spell 1
-- 1.12 spell 9417 (Increases damage and healing done by magical spells and effects by up to 12.)
-- 1.04 spell 9397 (Increases damage and healing done by magical spells and effects by up to 7.)
-- SPELLS CHANGED: Blighted Leggings (ilevel 35 entry 7709). 3 versions
-- Source: http://www.thottbot.com/?n=30349
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- Source: http://wow.allakhazam.com/item.html?witem=7709
-- * Modified spell 1
-- 1.12 spell 7709 (Increases damage done by Shadow spells and effects by up to 10.)
-- 1.04 spell 7708 (Increases damage done by Shadow spells and effects by up to 7.)
-- SPELLS REMOVED: Hypnotic Blade (ilevel 39 entry 7714). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype13.html
-- Source: http://wow.allakhazam.com/dyn/items/wratio15.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=7714
-- * Modified spell 1
-- 1.12 spell 9415 (Increases damage and healing done by magical spells and effects by up to 9.)
-- 1.04 spell 0 ()
-- SPELLS CHANGED: Hand of Righteousness (ilevel 44 entry 7721). 3 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=7721
-- Source: http://wow.allakhazam.com/dyn/items/iminlev21.html
-- Source: http://wow.allakhazam.com/dyn/items/wname4.html
-- * Modified spell 1
-- 1.12 spell 7681 (Increases healing done by spells and effects by up to 15.)
-- 1.04 spell 7680 (Increases healing done by spells and effects by up to 13.)
-- SPELLS CHANGED: Omega Orb (ilevel 41 entry 7749). 1 versions
-- Source: http://wow.allakhazam.com/item.html?witem=7749
-- * Modified spell 1
-- 1.12 spell 9416 (Increases damage and healing done by magical spells and effects by up to 11.)
-- 1.04 spell 9396 (Increases damage and healing done by magical spells and effects by up to 6.)
-- SPELLS CHANGED: Windweaver Staff (ilevel 37 entry 7757). 3 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=7757
-- Source: http://wow.allakhazam.com/dyn/items/wminlev10.html
-- Source: http://www.thottbot.com/?n=373246
-- * Modified spell 1
-- 1.12 spell 13599 (Increases damage done by Arcane spells and effects by up to 14.)
-- 1.04 spell 13596 (Increases damage done by Arcane spells and effects by up to 10.)
-- NOT FOUND: Easter Dress (ilevel 30 entry 7809)
-- WARNING: NOT FOUND FOR DESC "Removes existing root spells and makes you immune to root for 5 sec." (guessed 9774)
-- SPELLS CHANGED: Archaic Defender (ilevel 36 entry 9385). 4 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype17.html
-- Source: http://www.thottbot.com/?i=4146
-- Source: http://www.thottbot.com/?n=7753
-- Source: http://wow.allakhazam.com/db/price.html?witem=9385
-- * Modified spell 1
-- 1.12 spell 13390 (Increased Defense +10.)
-- 1.04 spell 21411 (Increased Defense +15.)
-- SPELLS CHANGED: Beacon of Hope (ilevel 38 entry 9393). 2 versions
-- Source: http://www.thottbot.com/?n=7076 / http://wow.allakhazam.com/item.html?witem=9393
-- Source: http://wow.allakhazam.com/dyn/items/iname23.html
-- * Modified spell 1
-- 1.12 spell 9408 (Increases healing done by spells and effects by up to 22.)
-- 1.04 spell 9407 (Increases healing done by spells and effects by up to 20.)
-- SPELLS REMOVED: Energy Cloak (ilevel 39 entry 9397). 2 versions
-- Source: http://www.thottbot.com/?n=264100
-- Source: http://wow.allakhazam.com/dyn/items/iminlev16.html
-- * Modified spell 1
-- 1.12 spell 5405 (Restores 375 to 426 mana.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Worn Running Boots (ilevel 40 entry 9398). 1/3 versions
-- QUALITY CHANGED: Worn Running Boots (ilevel 40 entry 9398)
-- SPELLS CHANGED: Girdle of Golem Strength (ilevel 33 entry 9405). 3 versions
-- Source: http://www.thottbot.com/?i=7288 / http://wow.allakhazam.com/db/price.html?witem=9405
-- Source: http://www.thottbot.com/?n=7753
-- Source: http://www.thottbot.com/?n=21272
-- * Modified spell 1
-- 1.12 spell 7516 (Increased Defense +3.)
-- 1.04 spell 13383 (Increased Defense +5.)
-- SPELLS CHANGED: Papal Fez (ilevel 43 entry 9431). 2 versions
-- Source: http://www.thottbot.com/?n=197191
-- Source: http://wow.allakhazam.com/dyn/items/iminlev1.html
-- * Modified spell 1
-- 1.12 spell 9408 (Increases healing done by spells and effects by up to 22.)
-- 1.04 spell 9407 (Increases healing done by spells and effects by up to 20.)
-- SPELLS CHANGED: Elemental Raiment (ilevel 41 entry 9434). 3 versions
-- Source: http://www.thottbot.com/?i=10587 / http://wow.allakhazam.com/db/item.html?witem=9434
-- Source: http://www.thottbot.com/?n=7753
-- Source: http://wow.allakhazam.com/dyn/items/iname5.html
-- * Modified spell 1
-- 1.12 spell 14248 (Increases damage and healing done by magical spells and effects by up to 21.)
-- 1.04 spell 9417 (Increases damage and healing done by magical spells and effects by up to 12.)
-- STATS CHANGED: Spidertank Oilrag (ilevel 33 entry 9448). 1/2 versions
-- SPELLS REMOVED: Spidertank Oilrag (ilevel 33 entry 9448). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname9.html
-- Source: http://www.thottbot.com/?n=48364
-- * Modified spell 1
-- 1.12 spell 21361 (Restores 3 mana per 5 sec.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Acidic Walkers (ilevel 32 entry 9454). 1/2 versions
-- SPELLS REMOVED: Acidic Walkers (ilevel 32 entry 9454). 2 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=9454
-- Source: http://www.thottbot.com/?i=Acidic%20Walkers
-- * Modified spell 1
-- 1.12 spell 9395 (Increases damage and healing done by magical spells and effects by up to 5.)
-- 1.04 spell 0 ()
-- SPELLS REMOVED: Digmaster 5000 (ilevel 45 entry 9465). 3 versions
-- Source: http://wow.allakhazam.com/db/price.html?witem=9465
-- Source: http://www.thottbot.com/?n=36236
-- Source: http://wow.allakhazam.com/dyn/items/wratio0.html
-- * Modified spell 1
-- 1.12 spell 0 ()
-- 1.04 spell 11791 (Punctures target's armor lowering it by 100.)
-- * Modified spell 2
-- 1.12 spell 11791 (Punctures target's armor lowering it by 100.)
-- 1.04 spell 0 ()
-- SPELLS CHANGED: Bad Mojo Mask (ilevel 49 entry 9470). 3 versions
-- Source: http://www.thottbot.com/?n=5865
-- Source: http://wow.allakhazam.com/db/item.html?witem=9470
-- Source: http://wow.allakhazam.com/dyn/items/iname1.html
-- * Modified spell 1
-- 1.12 spell 9414 (Increases damage done by Shadow spells and effects by up to 14.)
-- 1.04 spell 7709 (Increases damage done by Shadow spells and effects by up to 10.)
-- SPELLS CHANGED: Witch Doctor's Cane (ilevel 47 entry 9482). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/wminlev10.html
-- Source: http://wow.allakhazam.com/db/price.html?witem=9482
-- * Modified spell 1
-- 1.12 spell 17993 (Increases damage done by Nature spells and effects by up to 33.)
-- 1.04 spell 17990 (Increases damage done by Nature spells and effects by up to 27.)
-- SPELLS CHANGED: Spellshock Leggings (ilevel 50 entry 9484). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=9484
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- * Modified spell 1
-- 1.12 spell 14047 (Increases damage and healing done by magical spells and effects by up to 23.)
-- 1.04 spell 9344 (Increases damage and healing done by magical spells and effects by up to 15.)
-- STATS CHANGED: Nether-lace Tunic (ilevel 31 entry 9515). 1/1 versions
-- STATS CHANGED: Astral Knot Blouse (ilevel 31 entry 9516). 1/1 versions
-- STATS CHANGED: Celestial Stave (ilevel 40 entry 9517). 1/3 versions
-- DAMAGE CHANGED: Celestial Stave (ilevel 40 entry 9517). 1/3 versions
-- Source: http://www.thottbot.com/?i=Celestial%20Stave
-- Source: http://wow.allakhazam.com/dyn/items/itype17.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=9517
-- SPELLS CHANGED: Celestial Stave (ilevel 40 entry 9517). 3 versions
-- Source: http://www.thottbot.com/?i=Celestial%20Stave
-- Source: http://wow.allakhazam.com/dyn/items/itype17.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=9517
-- * Modified spell 1
-- 1.12 spell 15714 (Increases damage and healing done by magical spells and effects by up to 22.)
-- 1.04 spell 13594 (Increases damage done by Arcane spells and effects by up to 7.)
-- * Modified spell 2
-- 1.12 spell 0 ()
-- 1.04 spell 7687 (Increases damage done by Fire spells and effects by up to 7.)
-- * Modified spell 3
-- 1.12 spell 0 ()
-- 1.04 spell 7701 (Increases damage done by Frost spells and effects by up to 7.)
-- QUALITY CHANGED: Celestial Stave (ilevel 40 entry 9517)
-- STATS CHANGED: Talvash's Gold Ring (ilevel 35 entry 9538). 1/2 versions
-- QUALITY CHANGED: Talvash's Gold Ring (ilevel 35 entry 9538)
-- STATS CHANGED: Nogg's Gold Ring (ilevel 35 entry 9588). 1/2 versions
-- QUALITY CHANGED: Nogg's Gold Ring (ilevel 35 entry 9588)
-- SPELLS CHANGED: Bastion of Stormwind (ilevel 25 entry 9607). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname14.html
-- Source: http://wow.allakhazam.com/item.html?witem=9607
-- Source: http://www.thottbot.com/?i=3247
-- * Modified spell 1
-- 1.12 spell 7516 (Increased Defense +3.)
-- 1.04 spell 13383 (Increased Defense +5.)
-- SPELLS REMOVED: Dual Reinforced Leggings (ilevel 37 entry 9625). 3 versions
-- Source: http://wow.allakhazam.com/db/quest.html?wquest=2929
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- Source: http://www.thottbot.com/?i=Triprunner%20Dungarees
-- * Modified spell 1
-- 1.12 spell 0 ()
-- 1.04 spell 13386 (Increased Defense +7.)
-- * Modified spell 2
-- 1.12 spell 7518 (Increased Defense +5.)
-- 1.04 spell 0 ()
-- DAMAGE CHANGED: Reforged Blade of Heroes (ilevel 38 entry 9718). 1/2 versions
-- Source: http://wow.allakhazam.com/dyn/items/wminlev7.html
-- Source: http://wow.allakhazam.com/item.html?witem=9718
-- SPELLS CHANGED: Shadoweave Pants (ilevel 42 entry 10002). 3 versions
-- Source: http://www.thottbot.com/?i=4287 / http://wow.allakhazam.com/item.html?witem=10002
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- Source: http://www.thottbot.com/?i=4290
-- * Modified spell 1
-- 1.12 spell 9328 (Increases damage done by Shadow spells and effects by up to 21.)
-- 1.04 spell 9414 (Increases damage done by Shadow spells and effects by up to 14.)
-- SPELLS CHANGED: Black Mageweave Gloves (ilevel 43 entry 10003). 3 versions
-- Source: http://www.thottbot.com/?i=3790 / http://wow.allakhazam.com/item.html?witem=10003
-- Source: http://wow.allakhazam.com/db/item.html?entryid=14763
-- Source: http://www.thottbot.com/?i=Heavy%20Silken%20Thread
-- * Modified spell 1
-- 1.12 spell 9344 (Increases damage and healing done by magical spells and effects by up to 15.)
-- 1.04 spell 9415 (Increases damage and healing done by magical spells and effects by up to 9.)
-- SPELLS CHANGED: Shadoweave Robe (ilevel 43 entry 10004). 3 versions
-- Source: http://www.thottbot.com/?i=4288 / http://wow.allakhazam.com/db/item.html?witem=10004
-- Source: http://wow.allakhazam.com/dyn/items/iname20.html
-- Source: http://www.thottbot.com/?i=4290
-- * Modified spell 1
-- 1.12 spell 9328 (Increases damage done by Shadow spells and effects by up to 21.)
-- 1.04 spell 9414 (Increases damage done by Shadow spells and effects by up to 14.)
-- SPELLS CHANGED: Red Mageweave Pants (ilevel 43 entry 10009). 2 versions
-- Source: http://www.thottbot.com/?i=3790 / http://wow.allakhazam.com/db/price.html?witem=10009
-- Source: http://www.thottbot.com/?i=Heavy%20Silken%20Thread
-- * Modified spell 1
-- 1.12 spell 9343 (Increases damage and healing done by magical spells and effects by up to 14.)
-- 1.04 spell 25109 (Increases damage and healing done by magical spells and effects by up to 8.)
-- SPELLS CHANGED: Red Mageweave Gloves (ilevel 45 entry 10018). 2 versions
-- Source: http://www.thottbot.com/?i=3790 / http://wow.allakhazam.com/dyn/items/iname10.html
-- Source: http://www.thottbot.com/?i=Heavy%20Silken%20Thread
-- * Modified spell 1
-- 1.12 spell 9416 (Increases damage and healing done by magical spells and effects by up to 11.)
-- 1.04 spell 9396 (Increases damage and healing done by magical spells and effects by up to 6.)
-- SPELLS CHANGED: Dreamweave Gloves (ilevel 45 entry 10019). 2 versions
-- Source: http://www.thottbot.com/?i=4113 / http://wow.allakhazam.com/dyn/items/iname10.html
-- Source: http://www.thottbot.com/?i=Heart%20of%20the%20Wild
-- * Modified spell 1
-- 1.12 spell 9346 (Increases damage and healing done by magical spells and effects by up to 18.)
-- 1.04 spell 7703 (Increases damage done by Frost spells and effects by up to 10.)
-- SPELLS CHANGED: Dreamweave Vest (ilevel 45 entry 10021). 3 versions
-- Source: http://www.thottbot.com/?i=2967 / http://wow.allakhazam.com/db/item.html?witem=10021
-- Source: http://wow.allakhazam.com/dyn/items/iminlev5.html
-- Source: http://www.thottbot.com/?i=Heart%20of%20the%20Wild
-- * Modified spell 1
-- 1.12 spell 9346 (Increases damage and healing done by magical spells and effects by up to 18.)
-- 1.04 spell 7703 (Increases damage done by Frost spells and effects by up to 10.)
-- SPELLS CHANGED: Shadoweave Gloves (ilevel 45 entry 10023). 2 versions
-- Source: http://www.thottbot.com/?i=4290 / http://wow.allakhazam.com/dyn/items/iname10.html
-- Source: http://www.thottbot.com/?i=Heavy%20Silken%20Thread
-- * Modified spell 1
-- 1.12 spell 9325 (Increases damage done by Shadow spells and effects by up to 17.)
-- 1.04 spell 9412 (Increases damage done by Shadow spells and effects by up to 11.)
-- SPELLS CHANGED: Shadoweave Mask (ilevel 49 entry 10025). 3 versions
-- Source: http://www.thottbot.com/?i=3790 / http://wow.allakhazam.com/item.html?witem=10025
-- Source: http://wow.allakhazam.com/dyn/items/iname1.html
-- Source: http://www.thottbot.com/?i=4290
-- * Modified spell 1
-- 1.12 spell 14794 (Increases damage done by Shadow spells and effects by up to 24.)
-- 1.04 spell 9325 (Increases damage done by Shadow spells and effects by up to 17.)
-- SPELLS CHANGED: Shadoweave Shoulders (ilevel 47 entry 10028). 2 versions
-- Source: http://www.thottbot.com/?i=4277 / http://wow.allakhazam.com/dyn/items/iname3.html
-- Source: http://www.thottbot.com/?i=4290
-- * Modified spell 1
-- 1.12 spell 9325 (Increases damage done by Shadow spells and effects by up to 17.)
-- 1.04 spell 9412 (Increases damage done by Shadow spells and effects by up to 11.)
-- SPELLS CHANGED: Shadoweave Boots (ilevel 48 entry 10031). 2 versions
-- Source: http://www.thottbot.com/?i=4288 / http://wow.allakhazam.com/dyn/items/iname8.html
-- Source: http://www.thottbot.com/?i=2972
-- * Modified spell 1
-- 1.12 spell 9414 (Increases damage done by Shadow spells and effects by up to 14.)
-- 1.04 spell 7709 (Increases damage done by Shadow spells and effects by up to 10.)
-- STATS CHANGED: Dreamweave Circlet (ilevel 50 entry 10041). 1/3 versions
-- SPELLS CHANGED: Dreamweave Circlet (ilevel 50 entry 10041). 3 versions
-- Source: http://www.thottbot.com/?i=4289 / http://wow.allakhazam.com/item.html?witem=10041
-- Source: http://wow.allakhazam.com/dyn/items/iname1.html
-- Source: http://www.thottbot.com/?i=4373
-- * Modified spell 1
-- 1.12 spell 14248 (Increases damage and healing done by magical spells and effects by up to 21.)
-- 1.04 spell 9415 (Increases damage and healing done by magical spells and effects by up to 9.)
-- QUALITY CHANGED: Dreamweave Circlet (ilevel 50 entry 10041)
-- SPELLS CHANGED: Cindercloth Robe (ilevel 45 entry 10042). 3 versions
-- Source: http://www.thottbot.com/?i=4278 / http://wow.allakhazam.com/item.html?witem=10042
-- Source: http://wow.allakhazam.com/dyn/items/iname20.html
-- Source: http://www.thottbot.com/?i=4376
-- * Modified spell 1
-- 1.12 spell 17868 (Increases damage done by Fire spells and effects by up to 27.)
-- 1.04 spell 25065 (Increases damage done by fire spells and effects by up to 20.)
-- SPELLS CHANGED: Cindercloth Boots (ilevel 49 entry 10044). 2 versions
-- Source: http://www.thottbot.com/?i=3790 / http://wow.allakhazam.com/dyn/items/iname8.html
-- Source: http://www.thottbot.com/?i=2972
-- * Modified spell 1
-- 1.12 spell 9298 (Increases damage done by Fire spells and effects by up to 21.)
-- 1.04 spell 23481 (Increases damage done by Fire spells and effects by up to 14.)
-- SPELLS CHANGED: Shadowy Bracers (ilevel 45 entry 10461). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname9.html
-- Source: http://wow.allakhazam.com/db/quest.html?wquest=3379
-- Source: http://www.thottbot.com/?i=8454
-- * Modified spell 1
-- 1.12 spell 7706 (Increases damage done by Shadow spells and effects by up to 4.)
-- 1.04 spell 7705 (Increases damage done by Shadow spells and effects by up to 3.)
-- SPELLS CHANGED: Spellpower Goggles Xtreme (ilevel 43 entry 10502). 3 versions
-- Source: http://www.thottbot.com/?i=10727 / http://wow.allakhazam.com/item.html?witem=10502
-- Source: http://www.thottbot.com/?i=15597
-- Source: http://wow.allakhazam.com/dyn/items/iname1.html
-- * Modified spell 1
-- 1.12 spell 14248 (Increases damage and healing done by magical spells and effects by up to 21.)
-- 1.04 spell 9417 (Increases damage and healing done by magical spells and effects by up to 12.)
-- DAMAGE CHANGED: Quillshooter (ilevel 38 entry 10567). 1/2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev15.html
-- Source: http://wow.allakhazam.com/item.html?witem=10567
-- SPELLS CHANGED: Freezing Shard (ilevel 39 entry 10572). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/wname19.html
-- Source: http://wow.allakhazam.com/db/price.html?witem=10572
-- * Modified spell 1
-- 1.12 spell 7703 (Increases damage done by Frost spells and effects by up to 10.)
-- 1.04 spell 7701 (Increases damage done by Frost spells and effects by up to 7.)
-- STATS CHANGED: Death's Head Vestment (ilevel 40 entry 10581). 1/2 versions
-- SPELLS CHANGED: Shard of Afrasa (ilevel 57 entry 10659). 1 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=10659
-- * Modified spell 1
-- 1.12 spell 21363 (Restores 5 mana per 5 sec.)
-- 1.04 spell 12732 (Increases your normal health and mana regeneration by 5.)
-- * Modified spell 2
-- 1.12 spell 21596 (Restores 5 health per 5 sec.)
-- 1.04 spell 0 ()
-- NOT FOUND: Boar Champion's Belt (ilevel 42 entry 10768)
-- DAMAGE CHANGED: Vanquisher's Sword (ilevel 44 entry 10823). 1/5 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname13.html
-- Source: http://wow.allakhazam.com/dyn/items/wname7.html
-- Source: http://wow.allakhazam.com/dyn/items/wratio7.html
-- Source: http://wow.allakhazam.com/db/quest.html?wquest=3636
-- Source: http://www.thottbot.com/?i=Amberglow%20Talisman
-- SPELLS CHANGED: Vanquisher's Sword (ilevel 44 entry 10823). 5 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname13.html
-- Source: http://wow.allakhazam.com/dyn/items/wname7.html
-- Source: http://wow.allakhazam.com/dyn/items/wratio7.html
-- Source: http://wow.allakhazam.com/db/quest.html?wquest=3636
-- Source: http://www.thottbot.com/?i=Amberglow%20Talisman
-- * Modified spell 1
-- 1.12 spell 9335 (+28 Attack Power.)
-- 1.04 spell 9329 (+16 Attack Power.)
-- SPELLS REMOVED: Spire of Hakkar (ilevel 54 entry 10844). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/wminlev10.html
-- Source: http://wow.allakhazam.com/dyn/items/iminlev17.html
-- * Modified spell 1
-- 1.12 spell 9346 (Increases damage and healing done by magical spells and effects by up to 18.)
-- 1.04 spell 0 ()
-- STATS REMOVED for item Nether Force Wand (http://wow.allakhazam.com/db/item.html?witem=11263) 
-- DAMAGE CHANGED: Nether Force Wand (ilevel 40 entry 11263). 1/4 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=11263
-- Source: http://wow.allakhazam.com/dyn/items/wname19.html
-- Source: http://wow.allakhazam.com/dyn/items/iminlev26.html
-- Source: http://www.thottbot.com/?i=3399
-- SPELLS CHANGED: Nether Force Wand (ilevel 40 entry 11263). 4 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=11263
-- Source: http://wow.allakhazam.com/dyn/items/wname19.html
-- Source: http://wow.allakhazam.com/dyn/items/iminlev26.html
-- Source: http://www.thottbot.com/?i=3399
-- * Modified spell 1
-- 1.12 spell 13595 (Increases damage done by Arcane spells and effects by up to 9.)
-- 1.04 spell 13592 (Increases damage done by Arcane spells and effects by up to 4.)
-- QUALITY CHANGED: Nether Force Wand (ilevel 40 entry 11263)
-- DAMAGE CHANGED: Lesser Magic Wand (ilevel 15 entry 11287). 1/3 versions
-- Source: http://www.thottbot.com/?i=1325
-- Source: http://wow.allakhazam.com/dyn/items/wname19.html
-- Source: http://wow.allakhazam.com/db/price.html?witem=11287
-- QUALITY CHANGED: Lesser Magic Wand (ilevel 15 entry 11287)
-- DAMAGE CHANGED: Greater Magic Wand (ilevel 23 entry 11288). 1/5 versions
-- Source: http://www.thottbot.com/?i=2297
-- Source: http://wow.allakhazam.com/dyn/items/wname19.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=11288
-- Source: http://wow.allakhazam.com/dyn/items/iname26.html
-- Source: http://www.thottbot.com/?i=Greater%20Magic%20Essence
-- QUALITY CHANGED: Greater Magic Wand (ilevel 23 entry 11288)
-- DAMAGE CHANGED: Lesser Mystic Wand (ilevel 31 entry 11289). 1/5 versions
-- Source: http://www.thottbot.com/?i=Soul%20Dust
-- Source: http://wow.allakhazam.com/dyn/items/wname19.html
-- Source: http://wow.allakhazam.com/dyn/items/iname26.html
-- Source: http://wow.allakhazam.com/db/price.html?witem=11289
-- Source: http://www.thottbot.com/?i=9416
-- QUALITY CHANGED: Lesser Mystic Wand (ilevel 31 entry 11289)
-- DAMAGE CHANGED: Greater Mystic Wand (ilevel 35 entry 11290). 1/2 versions
-- Source: http://www.thottbot.com/?i=Vision%20Dust
-- Source: http://wow.allakhazam.com/dyn/items/wname19.html
-- QUALITY CHANGED: Greater Mystic Wand (ilevel 35 entry 11290)
-- SPELLS CHANGED: Flameseer Mantle (ilevel 47 entry 11310). 3 versions
-- Source: http://www.thottbot.com/?i=Flameseer%20Mantle
-- Source: http://wow.allakhazam.com/item.html?witem=11310
-- Source: http://wow.allakhazam.com/dyn/items/iminlev3.html
-- * Modified spell 1
-- 1.12 spell 9401 (Increases damage done by Fire spells and effects by up to 14.)
-- 1.04 spell 23480 (Increases damage done by Fire spells and effects by up to 10.)
-- STATS CHANGED: Spritecaster Cape (ilevel 52 entry 11623). 1/1 versions
-- SPELLS REMOVED: Spritecaster Cape (ilevel 52 entry 11623). 1 versions
-- Source: http://www.thottbot.com/?n=7906 / http://wow.allakhazam.com/dyn/items/iname16.html
-- * Modified spell 1
-- 1.12 spell 9343 (Increases damage and healing done by magical spells and effects by up to 14.)
-- 1.04 spell 0 ()
-- QUALITY CHANGED: Spritecaster Cape (ilevel 52 entry 11623)
-- STATS CHANGED: Kentic Amice (ilevel 52 entry 11624). 1/3 versions
-- SPELLS REMOVED: Kentic Amice (ilevel 52 entry 11624). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev3.html
-- Source: http://www.thottbot.com/?n=7906
-- Source: http://wow.allakhazam.com/db/item.html?witem=11624
-- * Modified spell 1
-- 1.12 spell 9343 (Increases damage and healing done by magical spells and effects by up to 14.)
-- 1.04 spell 0 ()
-- QUALITY CHANGED: Kentic Amice (ilevel 52 entry 11624)
-- STATS CHANGED: Blackveil Cape (ilevel 53 entry 11626). 1/1 versions
-- QUALITY CHANGED: Blackveil Cape (ilevel 53 entry 11626)
-- STATS CHANGED: Fleetfoot Greaves (ilevel 53 entry 11627). 1/1 versions
-- QUALITY CHANGED: Fleetfoot Greaves (ilevel 53 entry 11627)
-- STATS REMOVED for item Houndmaster's Rifle (http://wow.allakhazam.com/dyn/items/wname3.html) 
-- STATS CHANGED: Stoneshell Guard (ilevel 52 entry 11631). 1/1 versions
-- QUALITY CHANGED: Stoneshell Guard (ilevel 52 entry 11631)
-- STATS CHANGED: Earthslag Shoulders (ilevel 52 entry 11632). 1/2 versions
-- SPELLS REMOVED: Earthslag Shoulders (ilevel 52 entry 11632). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=11632
-- Source: http://wow.allakhazam.com/dyn/items/itype3.html
-- * Modified spell 1
-- 1.12 spell 9415 (Increases damage and healing done by magical spells and effects by up to 9.)
-- 1.04 spell 0 ()
-- QUALITY CHANGED: Earthslag Shoulders (ilevel 52 entry 11632)
-- STATS CHANGED: Spiderfang Carapace (ilevel 54 entry 11633). 1/2 versions
-- SPELLS REMOVED: Spiderfang Carapace (ilevel 54 entry 11633). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev5.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=11633
-- * Modified spell 1
-- 1.12 spell 9342 (Increases damage and healing done by magical spells and effects by up to 13.)
-- 1.04 spell 0 ()
-- QUALITY CHANGED: Spiderfang Carapace (ilevel 54 entry 11633)
-- STATS CHANGED: Silkweb Gloves (ilevel 54 entry 11634). 1/1 versions
-- SPELLS REMOVED: Silkweb Gloves (ilevel 54 entry 11634). 1 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=11634
-- * Modified spell 1
-- 1.12 spell 21625 (Restores 3 mana per 5 sec.)
-- 1.04 spell 0 ()
-- QUALITY CHANGED: Silkweb Gloves (ilevel 54 entry 11634)
-- NOT FOUND: Ban'thok Sash (ilevel 54 entry 11662)
-- STATS CHANGED: Ogreseer Fists (ilevel 54 entry 11665). 1/1 versions
-- SPELLS REMOVED: Ogreseer Fists (ilevel 54 entry 11665). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev10.html
-- * Modified spell 1
-- 1.12 spell 9342 (Increases damage and healing done by magical spells and effects by up to 13.)
-- 1.04 spell 0 ()
-- QUALITY CHANGED: Ogreseer Fists (ilevel 54 entry 11665)
-- STATS CHANGED: Naglering (ilevel 59 entry 11669). 1/1 versions
-- SPELLS REMOVED: Naglering (ilevel 59 entry 11669). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev11.html
-- * Modified spell 1
-- 1.12 spell 15438 (When struck in combat inflicts 3 Arcane damage to the attacker.)
-- 1.04 spell 0 ()
-- * Modified spell 2
-- 1.12 spell 13383 (Increased Defense +5.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Shadefiend Boots (ilevel 55 entry 11675). 1/2 versions
-- QUALITY CHANGED: Shadefiend Boots (ilevel 55 entry 11675)
-- STATS CHANGED: Graverot Cape (ilevel 55 entry 11677). 1/1 versions
-- QUALITY CHANGED: Graverot Cape (ilevel 55 entry 11677)
-- STATS CHANGED: Rubicund Armguards (ilevel 55 entry 11679). 1/1 versions
-- QUALITY CHANGED: Rubicund Armguards (ilevel 55 entry 11679)
-- STATS CHANGED: Splinthide Shoulders (ilevel 55 entry 11685). 1/1 versions
-- SPELLS REMOVED: Splinthide Shoulders (ilevel 55 entry 11685). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype3.html
-- * Modified spell 1
-- 1.12 spell 9415 (Increases damage and healing done by magical spells and effects by up to 9.)
-- 1.04 spell 0 ()
-- QUALITY CHANGED: Splinthide Shoulders (ilevel 55 entry 11685)
-- STATS CHANGED: Grizzle's Skinner (ilevel 55 entry 11702). 1/2 versions
-- DAMAGE CHANGED: Grizzle's Skinner (ilevel 55 entry 11702). 1/2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname21.html
-- Source: http://wow.allakhazam.com/dyn/items/wminlev0.html
-- QUALITY CHANGED: Grizzle's Skinner (ilevel 55 entry 11702)
-- NOT FOUND: Stonewall Girdle (ilevel 55 entry 11703)
-- STATS CHANGED: Savage Gladiator Chain (ilevel 57 entry 11726). 1/2 versions
-- SPELLS CHANGED: Savage Gladiator Chain (ilevel 57 entry 11726). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev5.html
-- Source: http://www.thottbot.com/?i=17909
-- * Modified spell 1
-- 1.12 spell 0 ()
-- 1.04 spell 21416 (Increased Defense +20.)
-- STATS CHANGED: Savage Gladiator Leggings (ilevel 57 entry 11728). 1/3 versions
-- STATS CHANGED: Savage Gladiator Helm (ilevel 57 entry 11729). 1/3 versions
-- STATS CHANGED: Savage Gladiator Grips (ilevel 57 entry 11730). 1/2 versions
-- STATS CHANGED: Savage Gladiator Greaves (ilevel 57 entry 11731). 1/3 versions
-- STATS CHANGED: Fists of Phalanx (ilevel 56 entry 11745). 1/2 versions
-- QUALITY CHANGED: Fists of Phalanx (ilevel 56 entry 11745)
-- SPELLS CHANGED: Golem Skull Helm (ilevel 56 entry 11746). 2 versions
-- Source: http://www.thottbot.com/?n=303930 / http://wow.allakhazam.com/profile.html?55827
-- Source: http://wow.allakhazam.com/dyn/items/iname1.html
-- * Modified spell 1
-- 1.12 spell 13386 (Increased Defense +7.)
-- 1.04 spell 21407 (Increased Defense +11.)
-- STATS CHANGED: Flamestrider Robes (ilevel 53 entry 11747). 1/3 versions
-- SPELLS REMOVED: Flamestrider Robes (ilevel 53 entry 11747). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname20.html
-- Source: http://www.thottbot.com/?i=Flamestrider%20Robes
-- Source: http://wow.allakhazam.com/db/item.html?witem=11747
-- * Modified spell 1
-- 1.12 spell 14799 (Increases damage and healing done by magical spells and effects by up to 20.)
-- 1.04 spell 0 ()
-- SPELLS CHANGED: Pyric Caduceus (ilevel 53 entry 11748). 4 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=11748
-- Source: http://wow.allakhazam.com/dyn/items/wname19.html
-- Source: http://www.thottbot.com/?i=Pyric%20Caduceus
-- Source: http://wow.allakhazam.com/dyn/items/iname26.html
-- * Modified spell 1
-- 1.12 spell 9400 (Increases damage done by Fire spells and effects by up to 13.)
-- 1.04 spell 7688 (Increases damage done by Fire spells and effects by up to 9.)
-- STATS CHANGED: Searingscale Leggings (ilevel 53 entry 11749). 1/3 versions
-- STATS CHANGED: Kindling Stave (ilevel 53 entry 11750). 1/3 versions
-- SPELLS REMOVED: Kindling Stave (ilevel 53 entry 11750). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/wminlev10.html
-- Source: http://wow.allakhazam.com/item.html?witem=11750
-- Source: http://www.thottbot.com/?i=Kindling%20Stave
-- * Modified spell 1
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Boreal Mantle (ilevel 57 entry 11782). 1/2 versions
-- SPELLS CHANGED: Boreal Mantle (ilevel 57 entry 11782). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname3.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=11782
-- * Modified spell 1
-- 1.12 spell 13831 (Increases damage done by Frost spells and effects by up to 29.)
-- 1.04 spell 9308 (Increases damage done by Frost spells and effects by up to 21.)
-- STATS CHANGED: Arbiter's Blade (ilevel 53 entry 11784). 1/2 versions
-- SPELLS REMOVED: Arbiter's Blade (ilevel 53 entry 11784). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev21.html
-- Source: http://wow.allakhazam.com/dyn/items/wminlev7.html
-- * Modified spell 1
-- 1.12 spell 9398 (Increases damage and healing done by magical spells and effects by up to 8.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Rock Golem Bulwark (ilevel 58 entry 11785). 2/2 versions
-- CONFLICT:
-- 2005-02-17 23:56:17 to 2005-03-25 21:43:26 (days delta 39) on for example: http://www.thottbot.com/?n=7918 / http://wow.allakhazam.com/db/item.html?witem=11785
-- 2005-01-16 02:35:23 to 2005-03-06 04:49:01 (days delta 52) on for example: http://wow.allakhazam.com/dyn/items/iname14.html
-- Warning: UNRESOLVED conflict
-- STATS CHANGED: Lavacrest Leggings (ilevel 58 entry 11802). 1/2 versions
-- QUALITY CHANGED: Lavacrest Leggings (ilevel 58 entry 11802)
-- STATS REMOVED for item Force of Magma (http://wow.allakhazam.com/dyn/items/itype17.html) 
-- DAMAGE CHANGED: Force of Magma (ilevel 56 entry 11803). 1/3 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype17.html
-- Source: http://wow.allakhazam.com/dyn/items/wname5.html
-- Source: http://wow.allakhazam.com/item.html?witem=11803
-- QUALITY CHANGED: Force of Magma (ilevel 56 entry 11803)
-- STATS CHANGED: Sash of the Burning Heart (ilevel 58 entry 11807). 1/1 versions
-- SPELLS CHANGED: Sash of the Burning Heart (ilevel 58 entry 11807). 1 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=11807
-- * Modified spell 1
-- 1.12 spell 9401 (Increases damage done by Fire spells and effects by up to 14.)
-- 1.04 spell 23480 (Increases damage done by Fire spells and effects by up to 10.)
-- STATS CHANGED: Circle of Flame (ilevel 59 entry 11808). 1/2 versions
-- SPELLS CHANGED: Force of Will (ilevel 60 entry 11810). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev12.html
-- Source: http://www.thottbot.com/?n=259546 / http://wow.allakhazam.com/item.html?witem=11810
-- * Modified spell 2
-- 1.12 spell 13385 (Increased Defense +7.)
-- 1.04 spell 13390 (Increased Defense +10.)
-- STATS CHANGED: Cape of the Fire Salamander (ilevel 58 entry 11812). 1/2 versions
-- STATS CHANGED: Molten Fists (ilevel 58 entry 11814). 1/1 versions
-- STATS CHANGED: Angerforge's Battle Axe (ilevel 56 entry 11816). 1/3 versions
-- DAMAGE CHANGED: Angerforge's Battle Axe (ilevel 56 entry 11816). 1/3 versions
-- Source: http://wow.allakhazam.com/dyn/items/wname1.html
-- Source: http://wow.allakhazam.com/dyn/items/itype17.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=11816
-- QUALITY CHANGED: Angerforge's Battle Axe (ilevel 56 entry 11816)
-- SPELLS CHANGED: Second Wind (ilevel 59 entry 11819). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev12.html
-- Source: http://wow.allakhazam.com/item.html?witem=11819
-- Source: http://www.thottbot.com/?i=Second%20Wind
-- * Modified spell 2
-- 1.12 spell 9408 (Increases healing done by spells and effects by up to 22.)
-- 1.04 spell 9407 (Increases healing done by spells and effects by up to 20.)
-- STATS CHANGED: Royal Decorated Armor (ilevel 58 entry 11820). 1/2 versions
-- QUALITY CHANGED: Royal Decorated Armor (ilevel 58 entry 11820)
-- STATS CHANGED: Omnicast Boots (ilevel 59 entry 11822). 1/1 versions
-- SPELLS CHANGED: Omnicast Boots (ilevel 59 entry 11822). 1 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=11822
-- * Modified spell 1
-- 1.12 spell 15714 (Increases damage and healing done by magical spells and effects by up to 22.)
-- 1.04 spell 9343 (Increases damage and healing done by magical spells and effects by up to 14.)
-- QUALITY CHANGED: Omnicast Boots (ilevel 59 entry 11822)
-- STATS CHANGED: Luminary Kilt (ilevel 59 entry 11823). 1/1 versions
-- SPELLS REMOVED: Luminary Kilt (ilevel 59 entry 11823). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- * Modified spell 1
-- 1.12 spell 15714 (Increases damage and healing done by magical spells and effects by up to 22.)
-- 1.04 spell 0 ()
-- QUALITY CHANGED: Luminary Kilt (ilevel 59 entry 11823)
-- STATS CHANGED: Cyclopean Band (ilevel 54 entry 11824). 1/3 versions
-- SPELLS REMOVED: Cyclopean Band (ilevel 54 entry 11824). 3 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=11824
-- Source: http://www.thottbot.com/?i=Cyclopean%20Band
-- Source: http://wow.allakhazam.com/dyn/items/iname11.html
-- * Modified spell 1
-- 1.12 spell 9415 (Increases damage and healing done by magical spells and effects by up to 9.)
-- 1.04 spell 0 ()
-- SPELLS CHANGED: Burst of Knowledge (ilevel 58 entry 11832). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev12.html
-- Source: http://www.thottbot.com/?i=6142
-- * Modified spell 2
-- 1.12 spell 9417 (Increases damage and healing done by magical spells and effects by up to 12.)
-- 1.04 spell 9397 (Increases damage and healing done by magical spells and effects by up to 7.)
-- STATS CHANGED: Senior Designer's Pantaloons (ilevel 55 entry 11841). 1/1 versions
-- SPELLS REMOVED: Senior Designer's Pantaloons (ilevel 55 entry 11841). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- * Modified spell 1
-- 1.12 spell 18031 (Increases healing done by spells and effects by up to 40.)
-- 1.04 spell 0 ()
-- QUALITY CHANGED: Senior Designer's Pantaloons (ilevel 55 entry 11841)
-- STATS CHANGED: Lead Surveyor's Mantle (ilevel 55 entry 11842). 1/1 versions
-- SPELLS REMOVED: Lead Surveyor's Mantle (ilevel 55 entry 11842). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev3.html
-- * Modified spell 1
-- 1.12 spell 9344 (Increases damage and healing done by magical spells and effects by up to 15.)
-- 1.04 spell 0 ()
-- QUALITY CHANGED: Lead Surveyor's Mantle (ilevel 55 entry 11842)
-- SPELLS REMOVED: Linken's Sword of Mastery (ilevel 56 entry 11902). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/wminlev7.html
-- Source: http://www.thottbot.com/?i=4804
-- * Modified spell 1
-- 1.12 spell 18089 (Blasts a target for 45 to 76 Nature damage.)
-- 1.04 spell 0 ()
-- SPELLS CHANGED: Spirit of Aquementas (ilevel 56 entry 11904). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname23.html
-- * Modified spell 1
-- 1.12 spell 14799 (Increases damage and healing done by magical spells and effects by up to 20.)
-- 1.04 spell 12854 (Decreases mana cost to all spells by 25.)
-- SPELLS REMOVED: Beastsmasher (ilevel 55 entry 11906). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype21.html
-- * Modified spell 1
-- 1.12 spell 14565 (+30 Attack Power when fighting Beasts.)
-- 1.04 spell 0 ()
-- STATS REMOVED for item Blood-etched Blade (http://wow.allakhazam.com/dyn/items/wname15.html) 
-- DAMAGE CHANGED: Blood-etched Blade (ilevel 57 entry 11922). 1/2 versions
-- Source: http://wow.allakhazam.com/dyn/items/wname15.html
-- Source: http://www.thottbot.com/?n=7901 / http://wow.allakhazam.com/db/item.html?witem=11922
-- SPELLS CHANGED: Blood-etched Blade (ilevel 57 entry 11922). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/wname15.html
-- Source: http://www.thottbot.com/?n=7901 / http://wow.allakhazam.com/db/item.html?witem=11922
-- * Modified spell 1
-- 1.12 spell 9396 (Increases damage and healing done by magical spells and effects by up to 6.)
-- 1.04 spell 15695 (Wounds the target for 120 damage and converts that damage into mana to you.)
-- SPELLS CHANGED: The Hammer of Grace (ilevel 57 entry 11923). 3 versions
-- Source: http://www.thottbot.com/?n=7901
-- Source: http://wow.allakhazam.com/dyn/items/wname4.html
-- Source: http://wow.allakhazam.com/dyn/items/iminlev21.html
-- * Modified spell 1
-- 1.12 spell 9317 (Increases healing done by spells and effects by up to 31.)
-- 1.04 spell 9316 (Increases healing done by spells and effects by up to 29.)
-- STATS CHANGED: Robes of the Royal Crown (ilevel 60 entry 11924). 1/3 versions
-- SPELLS REMOVED: Robes of the Royal Crown (ilevel 60 entry 11924). 3 versions
-- Source: http://wow.allakhazam.com/profile.html?55827
-- Source: http://wow.allakhazam.com/dyn/items/iname20.html
-- Source: http://www.thottbot.com/?n=259546
-- * Modified spell 1
-- 1.12 spell 9346 (Increases damage and healing done by magical spells and effects by up to 18.)
-- 1.04 spell 0 ()
-- SPELLS REMOVED: Legplates of the Eternal Guardian (ilevel 57 entry 11927). 2 versions
-- Source: http://www.thottbot.com/?n=7901 / http://wow.allakhazam.com/db/item.html?witem=11927
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- * Modified spell 1
-- 1.12 spell 0 ()
-- 1.04 spell 21418 (Increased Defense +22.)
-- * Modified spell 2
-- 1.12 spell 18196 (Increased Defense +15.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Thaurissan's Royal Scepter (ilevel 60 entry 11928). 1/1 versions
-- SPELLS REMOVED: Thaurissan's Royal Scepter (ilevel 60 entry 11928). 1 versions
-- Source: http://www.thottbot.com/?n=259546 / http://wow.allakhazam.com/db/item.html?witem=11928
-- * Modified spell 1
-- 1.12 spell 9408 (Increases healing done by spells and effects by up to 22.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Guiding Stave of Wisdom (ilevel 59 entry 11932). 1/3 versions
-- SPELLS REMOVED: Guiding Stave of Wisdom (ilevel 59 entry 11932). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/wminlev10.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=11932
-- Source: http://www.thottbot.com/?n=259546
-- * Modified spell 1
-- 1.12 spell 15696 (Increases healing done by spells and effects by up to 53.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Star of Mystaria (ilevel 63 entry 12103). 1/1 versions
-- SPELLS REMOVED: Star of Mystaria (ilevel 63 entry 12103). 1 versions
-- Source: http://www.thottbot.com/?n=258751 / http://wow.allakhazam.com/dyn/items/iname2.html
-- * Modified spell 1
-- 1.12 spell 23727 (Improves your chance to hit with spells by 1%.)
-- 1.04 spell 0 ()
-- SPELLS CHANGED: Raincaster Drape (ilevel 58 entry 12110). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname16.html
-- Source: http://www.thottbot.com/?i=5232 / http://wow.allakhazam.com/item.html?witem=12110
-- Source: http://www.thottbot.com/?i=2940
-- * Modified spell 1
-- 1.12 spell 9408 (Increases healing done by spells and effects by up to 22.)
-- 1.04 spell 9407 (Increases healing done by spells and effects by up to 20.)
-- SPELLS CHANGED: Sunborne Cape (ilevel 56 entry 12113). 2 versions
-- Source: http://www.thottbot.com/?i=5020 / http://wow.allakhazam.com/dyn/items/iminlev16.html
-- Source: http://www.thottbot.com/?i=5158
-- * Modified spell 1
-- 1.12 spell 9295 (Increases damage done by Fire spells and effects by up to 17.)
-- 1.04 spell 9399 (Increases damage done by Fire spells and effects by up to 11.)
-- SPELLS CHANGED: Stalwart Clutch (ilevel 56 entry 12115). 2 versions
-- Source: http://www.thottbot.com/?i=5020
-- Source: http://wow.allakhazam.com/db/item.html?witem=12115
-- * Modified spell 1
-- 1.12 spell 13387 (Increased Defense +8.)
-- 1.04 spell 21408 (Increased Defense +12.)
-- SPELLS CHANGED: Cindercloth Leggings (ilevel 49 entry 12256). 3 versions
-- Source: http://www.thottbot.com/?n=1234
-- Source: http://wow.allakhazam.com/dyn/items/iminlev7.html
-- Source: http://wow.allakhazam.com/item.html?witem=12256
-- * Modified spell 1
-- 1.12 spell 9296 (Increases damage done by Fire spells and effects by up to 19.)
-- 1.04 spell 9400 (Increases damage done by Fire spells and effects by up to 13.)
-- SPELLS CHANGED: Searing Golden Blade (ilevel 39 entry 12260). 5 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname13.html
-- Source: http://www.thottbot.com/?i=531 / http://wow.allakhazam.com/db/price.html?witem=12260
-- Source: http://wow.allakhazam.com/dyn/items/wname15.html
-- Source: http://www.thottbot.com/?i=Searing%20Golden%20Blade
-- Source: http://www.thottbot.com/?i=Searing%20Golden%20Blade
-- * Modified spell 1
-- 1.12 spell 7689 (Increases damage done by Fire spells and effects by up to 10.)
-- 1.04 spell 7687 (Increases damage done by Fire spells and effects by up to 7.)
-- DAMAGE CHANGED: The Judge's Gavel (ilevel 52 entry 12400). 1/3 versions
-- Source: http://wow.allakhazam.com/item.html?witem=12528
-- Source: http://www.thottbot.com/?i=5706
-- Source: http://www.thottbot.com/?n=7891
-- SPELLS CHANGED: The Judge's Gavel (ilevel 52 entry 12400). 3 versions
-- Source: http://wow.allakhazam.com/item.html?witem=12528
-- Source: http://www.thottbot.com/?i=5706
-- Source: http://www.thottbot.com/?n=7891
-- * Modified spell 1
-- 1.12 spell 56 (Stuns target for 3 sec.)
-- 1.04 spell 16451 (Imprisons enemy target, preventing all action but making it invulnerable for up to 10 sec.)
-- NOT FOUND: Imperial Plate Chest (ilevel 60 entry 12422)
-- NOT FOUND: Imperial Plate Belt (ilevel 53 entry 12424)
-- NOT FOUND: Imperial Plate Bracers (ilevel 54 entry 12425)
-- NOT FOUND: Imperial Plate Boots (ilevel 59 entry 12426)
-- NOT FOUND: Imperial Plate Helm (ilevel 59 entry 12427)
-- NOT FOUND: Imperial Plate Shoulders (ilevel 53 entry 12428)
-- NOT FOUND: Imperial Plate Leggings (ilevel 61 entry 12429)
-- SPELLS CHANGED: Bloodfire Talons (ilevel 53 entry 12464). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev10.html
-- Source: http://www.thottbot.com/?i=Bloodfire%20Talons
-- * Modified spell 1
-- 1.12 spell 9346 (Increases damage and healing done by magical spells and effects by up to 18.)
-- 1.04 spell 9415 (Increases damage and healing done by magical spells and effects by up to 9.)
-- NOT FOUND: Desertwalker Cane (ilevel 47 entry 12471)
-- SPELLS REMOVED: The Judge's Gavel (ilevel 52 entry 12528). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype17.html
-- Source: http://wow.allakhazam.com/dyn/items/wratio5.html
-- * Modified spell 1
-- 1.12 spell 56 (Stuns target for 3 sec.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Spire of the Stoneshaper (ilevel 56 entry 12532). 1/3 versions
-- STATS CHANGED: Funeral Pyre Vestment (ilevel 51 entry 12542). 1/4 versions
-- SPELLS CHANGED: Songstone of Ironforge (ilevel 60 entry 12543). 2 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=12543
-- Source: http://wow.allakhazam.com/dyn/items/iname11.html
-- * Modified spell 1
-- 1.12 spell 9346 (Increases damage and healing done by magical spells and effects by up to 18.)
-- 1.04 spell 9415 (Increases damage and healing done by magical spells and effects by up to 9.)
-- SPELLS CHANGED: Eye of Orgrimmar (ilevel 60 entry 12545). 2 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=12545
-- Source: http://wow.allakhazam.com/dyn/items/iname11.html
-- * Modified spell 1
-- 1.12 spell 9346 (Increases damage and healing done by magical spells and effects by up to 18.)
-- 1.04 spell 9415 (Increases damage and healing done by magical spells and effects by up to 9.)
-- STATS CHANGED: Mar Alom's Grip (ilevel 56 entry 12547). 1/2 versions
-- SPELLS CHANGED: Mar Alom's Grip (ilevel 56 entry 12547). 2 versions
-- Source: http://www.thottbot.com/?n=258284
-- Source: http://wow.allakhazam.com/dyn/items/iname10.html
-- * Modified spell 1
-- 1.12 spell 9408 (Increases healing done by spells and effects by up to 22.)
-- 1.04 spell 9407 (Increases healing done by spells and effects by up to 20.)
-- SPELLS CHANGED: Runed Golem Shackles (ilevel 53 entry 12550). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname9.html
-- Source: http://www.thottbot.com/?n=14253 / http://wow.allakhazam.com/db/item.html?witem=12550
-- Source: http://www.thottbot.com/?n=7979
-- * Modified spell 1
-- 1.12 spell 7517 (Increased Defense +4.)
-- 1.04 spell 13384 (Increased Defense +6.)
-- SPELLS REMOVED: Hands of the Exalted Herald (ilevel 59 entry 12554). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname10.html
-- * Modified spell 1
-- 1.12 spell 9318 (Increases healing done by spells and effects by up to 33.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Ebonsteel Spaulders (ilevel 59 entry 12557). 1/2 versions
-- NOT FOUND: Grand Marshal's Longsword (ilevel 78 entry 12584)
-- STATS CHANGED: Dustfeather Sash (ilevel 61 entry 12589). 1/1 versions
-- SPELLS REMOVED: Dustfeather Sash (ilevel 61 entry 12589). 1 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=12589
-- * Modified spell 1
-- 1.12 spell 9415 (Increases damage and healing done by magical spells and effects by up to 9.)
-- 1.04 spell 0 ()
-- SPELLS REMOVED: Felstriker (ilevel 63 entry 12590). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/wratio15.html
-- * Modified spell 1
-- 1.12 spell 16551 (All attacks are guaranteed to land and will be critical strikes for the next 3 sec.)
-- 1.04 spell 0 ()
-- DAMAGE CHANGED: Blackblade of Shahram (ilevel 63 entry 12592). 1/2 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype17.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=12592
-- SPELLS CHANGED: Draconian Deflector (ilevel 63 entry 12602). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=12602
-- Source: http://wow.allakhazam.com/dyn/items/iname14.html
-- * Modified spell 1
-- 1.12 spell 13390 (Increased Defense +10.)
-- 1.04 spell 21411 (Increased Defense +15.)
-- STATS CHANGED: Crystallized Girdle (ilevel 61 entry 12606). 1/1 versions
-- SPELLS REMOVED: Crystallized Girdle (ilevel 61 entry 12606). 1 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=12606
-- * Modified spell 1
-- 1.12 spell 9415 (Increases damage and healing done by magical spells and effects by up to 9.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Butcher's Apron (ilevel 58 entry 12608). 1/2 versions
-- QUALITY CHANGED: Butcher's Apron (ilevel 58 entry 12608)
-- STATS CHANGED: Polychromatic Visionwrap (ilevel 61 entry 12609). 2/2 versions
-- CONFLICT:
-- 2005-02-17 08:42:26 to 2005-03-20 21:58:16 (days delta 34) on for example: http://wow.allakhazam.com/db/item.html?witem=12609
-- 2005-02-24 01:16:42 to 2005-02-25 05:27:10 (days delta 1) on for example: http://wow.allakhazam.com/dyn/items/iname5.html
-- NOT FOUND: Enchanted Thorium Breastplate (ilevel 63 entry 12618)
-- NOT FOUND: Enchanted Thorium Leggings (ilevel 63 entry 12619)
-- NOT FOUND: Enchanted Thorium Helm (ilevel 62 entry 12620)
-- SPELLS CHANGED: Wildthorn Mail (ilevel 54 entry 12624). 4 versions
-- Source: http://www.thottbot.com/?i=23247 / http://wow.allakhazam.com/dyn/items/iminlev5.html
-- Source: http://www.thottbot.com/?i=23247
-- Source: http://www.thottbot.com/?i=4373
-- Source: http://www.thottbot.com/?i=Wildthorn%20Mail
-- * Modified spell 1
-- 1.12 spell 16638 (Increases damage done by Nature spells and effects by up to 34.)
-- 1.04 spell 17991 (Increases damage done by Nature spells and effects by up to 30.)
-- NOT FOUND: Dawnbringer Shoulders (ilevel 58 entry 12625)
-- SPELLS CHANGED: Storm Gauntlets (ilevel 59 entry 12632). 3 versions
-- Source: http://www.thottbot.com/?i=24655 / http://wow.allakhazam.com/dyn/items/iminlev10.html
-- Source: http://www.thottbot.com/?i=24655
-- Source: http://www.thottbot.com/?i=8268
-- * Modified spell 2
-- 1.12 spell 9361 (Increases damage done by Nature spells and effects by up to 21.)
-- 1.04 spell 9411 (Increases damage done by Nature spells and effects by up to 14.)
-- SPELLS REMOVED: Whitesoul Helm (ilevel 60 entry 12633). 3 versions
-- Source: http://www.thottbot.com/?i=531 / http://wow.allakhazam.com/dyn/items/iname1.html
-- Source: http://www.thottbot.com/?i=24516
-- Source: http://www.thottbot.com/?i=10302
-- * Modified spell 1
-- 1.12 spell 0 ()
-- 1.04 spell 9317 (Increases healing done by spells and effects by up to 31.)
-- * Modified spell 2
-- 1.12 spell 18029 (Increases healing done by spells and effects by up to 35.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Backusarian Gauntlets (ilevel 60 entry 12637). 1/1 versions
-- SPELLS REMOVED: Backusarian Gauntlets (ilevel 60 entry 12637). 1 versions
-- Source: http://www.thottbot.com/?n=109215 / http://wow.allakhazam.com/dyn/items/iname10.html
-- * Modified spell 1
-- 1.12 spell 21618 (Restores 4 mana per 5 sec.)
-- 1.04 spell 0 ()
-- SPELLS CHANGED: Invulnerable Mail (ilevel 63 entry 12641). 3 versions
-- Source: http://www.thottbot.com/?i=24671 / http://wow.allakhazam.com/dyn/items/iname5.html
-- Source: http://www.thottbot.com/?i=26827
-- Source: http://www.thottbot.com/?i=26827
-- * Modified spell 2
-- 1.12 spell 0 ()
-- 1.04 spell 21416 (Increased Defense +20.)
-- * Modified spell 3
-- 1.12 spell 14249 (Increased Defense +13.)
-- 1.04 spell 0 ()
-- STATS REMOVED for item Blackcrow (http://wow.allakhazam.com/dyn/items/iname26.html) 
-- SPELLS CHANGED: Leggings of Arcana (ilevel 62 entry 12756). 1 versions
-- Source: http://wow.allakhazam.com/item.html?witem=12756
-- * Modified spell 1
-- 1.12 spell 9346 (Increases damage and healing done by magical spells and effects by up to 18.)
-- 1.04 spell 9415 (Increases damage and healing done by magical spells and effects by up to 9.)
-- NOT FOUND: Inlaid Thorium Hammer (ilevel 54 entry 12772)
-- STATS CHANGED: Mixologist's Tunic (ilevel 55 entry 12793). 1/3 versions
-- QUALITY CHANGED: Mixologist's Tunic (ilevel 55 entry 12793)
-- STATS CHANGED: Legguards of the Chromatic Defier (ilevel 62 entry 12903). 1/2 versions
-- STATS CHANGED: Wildfire Cape (ilevel 61 entry 12905). 1/2 versions
-- QUALITY CHANGED: Wildfire Cape (ilevel 61 entry 12905)
-- SPELLS CHANGED: Briarwood Reed (ilevel 60 entry 12930). 1 versions
-- Source: http://www.thottbot.com/?n=107118 / http://wow.allakhazam.com/item.html?witem=12930
-- * Modified spell 1
-- 1.12 spell 13881 (Increases damage and healing done by magical spells and effects by up to 29.)
-- 1.04 spell 15714 (Increases damage and healing done by magical spells and effects by up to 22.)
-- SPELLS CHANGED: Dal'Rend's Tribal Guardian (ilevel 63 entry 12939). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/wminlev7.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=12939
-- * Modified spell 1
-- 1.12 spell 13385 (Increased Defense +7.)
-- 1.04 spell 13390 (Increased Defense +10.)
-- STATS CHANGED: Legplates of the Chromatic Defier (ilevel 62 entry 12945). 1/2 versions
-- NOT FOUND: Alex's Ring of Audacity (ilevel 60 entry 12947)
-- STATS CHANGED: Spiritshroud Leggings (ilevel 63 entry 12965). 1/2 versions
-- SPELLS REMOVED: Spiritshroud Leggings (ilevel 63 entry 12965). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=12965
-- * Modified spell 1
-- 1.12 spell 14254 (Increases damage and healing done by magical spells and effects by up to 19.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Blackmist Armguards (ilevel 63 entry 12966). 1/1 versions
-- DAMAGE CHANGED: Seeping Willow (ilevel 63 entry 12969). 1/2 versions
-- Source: http://wow.allakhazam.com/dyn/items/wname5.html
-- Source: http://wow.allakhazam.com/item.html?witem=12969
-- SPELLS CHANGED: Ring of Defense (ilevel 22 entry 12985). 1 versions
-- Source: http://www.thottbot.com/?n=7040 / http://wow.allakhazam.com/dyn/items/iname11.html
-- * Modified spell 1
-- 1.12 spell 7517 (Increased Defense +4.)
-- 1.04 spell 13384 (Increased Defense +6.)
-- SPELLS CHANGED: Magician's Mantle (ilevel 25 entry 12998). 2 versions
-- Source: http://www.thottbot.com/?n=224824 / http://wow.allakhazam.com/dyn/items/iname3.html
-- Source: http://www.thottbot.com/?n=3160
-- * Modified spell 1
-- 1.12 spell 9395 (Increases damage and healing done by magical spells and effects by up to 5.)
-- 1.04 spell 9393 (Increases damage and healing done by magical spells and effects by up to 2.)
-- SPELLS CHANGED: Maiden's Circle (ilevel 61 entry 13001). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname11.html
-- Source: http://www.thottbot.com/?n=233172 / http://wow.allakhazam.com/db/item.html?witem=13001
-- * Modified spell 1
-- 1.12 spell 9346 (Increases damage and healing done by magical spells and effects by up to 18.)
-- 1.04 spell 9415 (Increases damage and healing done by magical spells and effects by up to 9.)
-- SPELLS CHANGED: Mageflame Cloak (ilevel 58 entry 13007). 2 versions
-- Source: http://www.thottbot.com/?i=Thorium%20Lockbox / http://wow.allakhazam.com/db/item.html?witem=13007
-- Source: http://www.thottbot.com/?i=16749
-- * Modified spell 1
-- 1.12 spell 9298 (Increases damage done by Fire spells and effects by up to 21.)
-- 1.04 spell 23481 (Increases damage done by Fire spells and effects by up to 14.)
-- SPELLS CHANGED: Elder Wizard's Mantle (ilevel 56 entry 13013). 3 versions
-- Source: http://www.thottbot.com/?n=9820 / http://wow.allakhazam.com/dyn/items/iname3.html
-- Source: http://www.thottbot.com/?i=7229
-- Source: http://www.thottbot.com/?n=75239
-- * Modified spell 1
-- 1.12 spell 9416 (Increases damage and healing done by magical spells and effects by up to 11.)
-- 1.04 spell 9396 (Increases damage and healing done by magical spells and effects by up to 6.)
-- SPELLS CHANGED: Umbral Crystal (ilevel 43 entry 13029). 1 versions
-- Source: http://www.thottbot.com/?n=94188 / http://wow.allakhazam.com/dyn/items/iname23.html
-- * Modified spell 1
-- 1.12 spell 9325 (Increases damage done by Shadow spells and effects by up to 17.)
-- 1.04 spell 9412 (Increases damage done by Shadow spells and effects by up to 11.)
-- SPELLS CHANGED: Orb of Mistmantle (ilevel 28 entry 13031). 1 versions
-- Source: http://www.thottbot.com/?n=3235 / http://wow.allakhazam.com/db/item.html?witem=13031
-- * Modified spell 1
-- 1.12 spell 7678 (Increases healing done by spells and effects by up to 9.)
-- 1.04 spell 7677 (Increases healing done by spells and effects by up to 7.)
-- * Modified spell 2
-- 1.12 spell 7707 (Increases damage done by Shadow spells and effects by up to 6.)
-- 1.04 spell 7706 (Increases damage done by Shadow spells and effects by up to 4.)
-- SPELLS CHANGED: Guardian Blade (ilevel 26 entry 13041). 3 versions
-- Source: http://www.thottbot.com/?n=7711 / http://wow.allakhazam.com/db/price.html?witem=13041
-- Source: http://wow.allakhazam.com/dyn/items/itype17.html
-- Source: http://www.thottbot.com/?n=7018
-- * Modified spell 1
-- 1.12 spell 13388 (Increased Defense +9.)
-- 1.04 spell 21409 (Increased Defense +13.)
-- SPELLS CHANGED: Deanship Claymore (ilevel 29 entry 13049). 3 versions
-- Source: http://www.thottbot.com/?n=743 / http://wow.allakhazam.com/db/item.html?witem=13049
-- Source: http://wow.allakhazam.com/dyn/items/itype17.html
-- Source: http://www.thottbot.com/?n=128329
-- * Modified spell 1
-- 1.12 spell 13390 (Increased Defense +10.)
-- 1.04 spell 21411 (Increased Defense +15.)
-- SPELLS CHANGED: Stonegrip Gauntlets (ilevel 60 entry 13072). 2 versions
-- Source: http://www.thottbot.com/?n=9820 / http://wow.allakhazam.com/db/price.html?witem=13072
-- Source: http://www.thottbot.com/?n=88476
-- * Modified spell 1
-- 1.12 spell 13390 (Increased Defense +10.)
-- 1.04 spell 21411 (Increased Defense +15.)
-- SPELLS CHANGED: Golem Shard Leggings (ilevel 46 entry 13074). 3 versions
-- Source: http://www.thottbot.com/?n=43133 / http://wow.allakhazam.com/item.html?witem=13074
-- Source: http://www.thottbot.com/?n=149426
-- Source: http://wow.allakhazam.com/dyn/items/itype7.html
-- * Modified spell 1
-- 1.12 spell 13384 (Increased Defense +6.)
-- 1.04 spell 18369 (Increased Defense +9.)
-- NOT FOUND: Direwing Legguards (ilevel 63 entry 13075)
-- SPELLS CHANGED: Medallion of Grand Marshal Morris (ilevel 57 entry 13091). 2 versions
-- Source: http://www.thottbot.com/?n=39395 / http://wow.allakhazam.com/item.html?witem=13091
-- Source: http://wow.allakhazam.com/dyn/items/iname2.html
-- * Modified spell 1
-- 1.12 spell 13390 (Increased Defense +10.)
-- 1.04 spell 21411 (Increased Defense +15.)
-- STATS CHANGED: Wolfrunner Shoes (ilevel 59 entry 13101). 1/4 versions
-- SPELLS REMOVED: Wolfrunner Shoes (ilevel 59 entry 13101). 4 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname8.html
-- Source: http://www.thottbot.com/?i=Thorium%20Lockbox / http://wow.allakhazam.com/item.html?witem=13101
-- Source: http://www.thottbot.com/?n=14633
-- Source: http://www.thottbot.com/?i=16052
-- * Modified spell 1
-- 1.12 spell 9342 (Increases damage and healing done by magical spells and effects by up to 13.)
-- 1.04 spell 0 ()
-- SPELLS CHANGED: Cassandra's Grace (ilevel 47 entry 13102). 2 versions
-- Source: http://www.thottbot.com/?n=4361
-- Source: http://wow.allakhazam.com/db/price.html?witem=13102
-- * Modified spell 1
-- 1.12 spell 17371 (Increases healing done by spells and effects by up to 44.)
-- 1.04 spell 18031 (Increases healing done by spells and effects by up to 40.)
-- STATS CHANGED: Tooth of Gnarr (ilevel 63 entry 13141). 1/2 versions
-- SPELLS REMOVED: Tooth of Gnarr (ilevel 63 entry 13141). 2 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=13141
-- Source: http://wow.allakhazam.com/dyn/items/itype2.html
-- * Modified spell 1
-- 1.12 spell 21361 (Restores 3 mana per 5 sec.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Brigam Girdle (ilevel 63 entry 13142). 1/1 versions
-- SPELLS REMOVED: Brigam Girdle (ilevel 63 entry 13142). 1 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=13142
-- * Modified spell 1
-- 1.12 spell 15464 (Improves your chance to hit by 1%.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Trindlehaven Staff (ilevel 61 entry 13161). 1/3 versions
-- SPELLS REMOVED: Trindlehaven Staff (ilevel 61 entry 13161). 3 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=13161
-- Source: http://wow.allakhazam.com/dyn/items/wminlev10.html
-- Source: http://wow.allakhazam.com/dyn/items/iname17.html
-- * Modified spell 1
-- 1.12 spell 9343 (Increases damage and healing done by magical spells and effects by up to 14.)
-- 1.04 spell 0 ()
-- DAMAGE CHANGED: Relentless Scythe (ilevel 62 entry 13163). 1/2 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype17.html
-- Source: http://wow.allakhazam.com/item.html?witem=13163
-- STATS CHANGED: Plate of the Shaman King (ilevel 60 entry 13168). 1/1 versions
-- SPELLS REMOVED: Plate of the Shaman King (ilevel 60 entry 13168). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev5.html
-- * Modified spell 1
-- 1.12 spell 9346 (Increases damage and healing done by magical spells and effects by up to 18.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Tressermane Leggings (ilevel 60 entry 13169). 1/2 versions
-- SPELLS REMOVED: Tressermane Leggings (ilevel 60 entry 13169). 2 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=13169
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- * Modified spell 1
-- 1.12 spell 14254 (Increases damage and healing done by magical spells and effects by up to 19.)
-- 1.04 spell 0 ()
-- SPELLS CHANGED: Skyshroud Leggings (ilevel 60 entry 13170). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- * Modified spell 1
-- 1.12 spell 18052 (Increases damage and healing done by magical spells and effects by up to 34.)
-- 1.04 spell 14127 (Increases damage and healing done by magical spells and effects by up to 28.)
-- STATS CHANGED: Talisman of Evasion (ilevel 60 entry 13177). 1/2 versions
-- QUALITY CHANGED: Talisman of Evasion (ilevel 60 entry 13177)
-- SPELLS REMOVED: Rosewine Circle (ilevel 60 entry 13178). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=13178
-- Source: http://wow.allakhazam.com/dyn/items/iname11.html
-- * Modified spell 1
-- 1.12 spell 21363 (Restores 5 mana per 5 sec.)
-- 1.04 spell 0 ()
-- * Modified spell 2
-- 1.12 spell 9316 (Increases healing done by spells and effects by up to 29.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Brazecore Armguards (ilevel 60 entry 13179). 1/2 versions
-- SPELLS REMOVED: Brazecore Armguards (ilevel 60 entry 13179). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname9.html
-- Source: http://wow.allakhazam.com/item.html?witem=13179
-- * Modified spell 1
-- 1.12 spell 21361 (Restores 3 mana per 5 sec.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Phase Blade (ilevel 57 entry 13182). 1/2 versions
-- DAMAGE CHANGED: Phase Blade (ilevel 57 entry 13182). 1/2 versions
-- Source: http://wow.allakhazam.com/dyn/items/wminlev7.html
-- Source: http://wow.allakhazam.com/item.html?witem=13182
-- QUALITY CHANGED: Phase Blade (ilevel 57 entry 13182)
-- STATS CHANGED: Fallbrush Handgrips (ilevel 61 entry 13184). 1/2 versions
-- SPELLS REMOVED: Fallbrush Handgrips (ilevel 61 entry 13184). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=13184
-- Source: http://wow.allakhazam.com/dyn/items/iname10.html
-- * Modified spell 1
-- 1.12 spell 9407 (Increases healing done by spells and effects by up to 20.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Sunderseer Mantle (ilevel 61 entry 13185). 1/2 versions
-- SPELLS REMOVED: Sunderseer Mantle (ilevel 61 entry 13185). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname3.html
-- Source: http://wow.allakhazam.com/item.html?witem=13185
-- * Modified spell 1
-- 1.12 spell 9398 (Increases damage and healing done by magical spells and effects by up to 8.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Armswake Cloak (ilevel 60 entry 13203). 1/1 versions
-- SPELLS REMOVED: Armswake Cloak (ilevel 60 entry 13203). 1 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=13203
-- * Modified spell 1
-- 1.12 spell 9329 (+16 Attack Power.)
-- 1.04 spell 0 ()
-- QUALITY CHANGED: Armswake Cloak (ilevel 60 entry 13203)
-- STATS REMOVED for item Bashguuder (http://wow.allakhazam.com/dyn/items/iminlev21.html) 
-- DAMAGE CHANGED: Bashguuder (ilevel 60 entry 13204). 1/3 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev21.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=13204
-- Source: http://wow.allakhazam.com/dyn/items/wname4.html
-- QUALITY CHANGED: Bashguuder (ilevel 60 entry 13204)
-- STATS CHANGED: Wolfshear Leggings (ilevel 61 entry 13206). 1/1 versions
-- SPELLS REMOVED: Wolfshear Leggings (ilevel 61 entry 13206). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- * Modified spell 1
-- 1.12 spell 9315 (Increases healing done by spells and effects by up to 26.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Bleak Howler Armguards (ilevel 61 entry 13208). 1/1 versions
-- SPELLS REMOVED: Bleak Howler Armguards (ilevel 61 entry 13208). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname9.html
-- * Modified spell 1
-- 1.12 spell 7681 (Increases healing done by spells and effects by up to 15.)
-- 1.04 spell 0 ()
-- SPELLS CHANGED: Seal of the Dawn (ilevel 61 entry 13209). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev12.html
-- Source: http://wow.allakhazam.com/item.html?witem=13209
-- * Modified spell 1
-- 1.12 spell 23930 (+81 Attack Power when fighting Undead. It also allows the acquisition of Scourgestones on behalf of the Argent Dawn.)
-- 1.04 spell 17319 (+81 Attack Power when fighting Undead.)
-- STATS CHANGED: Slashclaw Bracers (ilevel 60 entry 13211). 1/1 versions
-- QUALITY CHANGED: Slashclaw Bracers (ilevel 60 entry 13211)
-- STATS REMOVED for item Halycon's Spiked Collar (http://wow.allakhazam.com/dyn/items/iname2.html) 
-- SPELLS CHANGED: Halycon's Spiked Collar (ilevel 60 entry 13212). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname2.html
-- Source: http://wow.allakhazam.com/item.html?witem=13212
-- * Modified spell 1
-- 1.12 spell 17482 (+48 Attack Power when fighting Beasts.)
-- 1.04 spell 18067 (+45 Attack Power when fighting Beasts.)
-- QUALITY CHANGED: Halycon's Spiked Collar (ilevel 60 entry 13212)
-- SPELLS REMOVED: Argent Defender (ilevel 62 entry 13243). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname14.html
-- * Modified spell 1
-- 1.12 spell 17350 (Has a 1% chance when struck in combat of increasing chance to block by 50% for 10 sec.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Gilded Gauntlets (ilevel 60 entry 13244). 1/1 versions
-- SPELLS REMOVED: Gilded Gauntlets (ilevel 60 entry 13244). 1 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=13244
-- * Modified spell 1
-- 1.12 spell 21362 (Restores 4 mana per 5 sec.)
-- 1.04 spell 0 ()
-- QUALITY CHANGED: Gilded Gauntlets (ilevel 60 entry 13244)
-- SPELLS CHANGED: Kresh's Back (ilevel 20 entry 13245). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev14.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=13245
-- Source: http://www.thottbot.com/?i=Kresh%27s%20Back
-- * Modified spell 1
-- 1.12 spell 7517 (Increased Defense +4.)
-- 1.04 spell 13384 (Increased Defense +6.)
-- STATS CHANGED: Burstshot Harquebus (ilevel 56 entry 13248). 1/3 versions
-- SPELLS CHANGED: Hands of Power (ilevel 60 entry 13253). 2 versions
-- Source: http://www.thottbot.com/?n=66540
-- Source: http://wow.allakhazam.com/db/item.html?witem=13253
-- * Modified spell 1
-- 1.12 spell 18049 (Increases damage and healing done by magical spells and effects by up to 26.)
-- 1.04 spell 9346 (Increases damage and healing done by magical spells and effects by up to 18.)
-- STATS CHANGED: Trueaim Gauntlets (ilevel 59 entry 13255). 1/1 versions
-- SPELLS CHANGED: Trueaim Gauntlets (ilevel 59 entry 13255). 1 versions
-- Source: http://wow.allakhazam.com/item.html?witem=13255
-- * Modified spell 2
-- 1.12 spell 15464 (Improves your chance to hit by 1%.)
-- 1.04 spell 0 ()
-- * Modified spell 3
-- 1.12 spell 27743 (Increased Guns +8.)
-- 1.04 spell 0 ()
-- * Modified spell 4
-- 1.12 spell 27744 (Increased Crossbows +8.)
-- 1.04 spell 0 ()
-- QUALITY CHANGED: Trueaim Gauntlets (ilevel 59 entry 13255)
-- STATS CHANGED: Demonic Runed Spaulders (ilevel 59 entry 13257). 1/2 versions
-- NOT FOUND: Ashbringer (ilevel 76 entry 13262)
-- STATS CHANGED: Ogreseer Tower Boots (ilevel 59 entry 13282). 1/2 versions
-- STATS CHANGED: Magus Ring (ilevel 59 entry 13283). 1/2 versions
-- QUALITY CHANGED: Magus Ring (ilevel 59 entry 13283)
-- STATS CHANGED: Swiftdart Battleboots (ilevel 58 entry 13284). 1/2 versions
-- QUALITY CHANGED: Swiftdart Battleboots (ilevel 58 entry 13284)
-- SPELLS CHANGED: Alanna's Embrace (ilevel 62 entry 13314). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname20.html
-- Source: http://wow.allakhazam.com/item.html?witem=13314
-- * Modified spell 1
-- 1.12 spell 14799 (Increases damage and healing done by magical spells and effects by up to 20.)
-- 1.04 spell 9416 (Increases damage and healing done by magical spells and effects by up to 11.)
-- STATS CHANGED: Dracorian Gauntlets (ilevel 63 entry 13344). 1/2 versions
-- SPELLS REMOVED: Dracorian Gauntlets (ilevel 63 entry 13344). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=13344
-- Source: http://www.thottbot.com/?n=197406
-- * Modified spell 1
-- 1.12 spell 9345 (Increases damage and healing done by magical spells and effects by up to 16.)
-- 1.04 spell 0 ()
-- SPELLS CHANGED: Robes of the Exalted (ilevel 63 entry 13346). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname20.html
-- Source: http://wow.allakhazam.com/item.html?witem=13346
-- Source: http://www.thottbot.com/?n=197406
-- * Modified spell 1
-- 1.12 spell 18042 (Increases healing done by spells and effects by up to 68.)
-- 1.04 spell 18039 (Increases healing done by spells and effects by up to 62.)
-- DAMAGE CHANGED: Demonshear (ilevel 63 entry 13348). 1/4 versions
-- Source: http://wow.allakhazam.com/dyn/items/wminlev8.html
-- Source: http://wow.allakhazam.com/dyn/items/iminlev17.html
-- Source: http://www.thottbot.com/?n=258751
-- Source: http://wow.allakhazam.com/db/item.html?witem=13348
-- STATS CHANGED: Scepter of the Unholy (ilevel 63 entry 13349). 1/4 versions
-- SPELLS CHANGED: Scepter of the Unholy (ilevel 63 entry 13349). 4 versions
-- Source: http://wow.allakhazam.com/dyn/items/wname4.html
-- Source: http://wow.allakhazam.com/dyn/items/itype21.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=13349
-- Source: http://www.thottbot.com/?n=197406
-- * Modified spell 1
-- 1.12 spell 9326 (Increases damage done by Shadow spells and effects by up to 19.)
-- 1.04 spell 9325 (Increases damage done by Shadow spells and effects by up to 17.)
-- SPELLS CHANGED: Fire Striders (ilevel 63 entry 13369). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname8.html
-- Source: http://wow.allakhazam.com/item.html?witem=13369
-- Source: http://www.thottbot.com/?n=258751
-- * Modified spell 1
-- 1.12 spell 13830 (Increases damage done by Fire spells and effects by up to 29.)
-- 1.04 spell 23483 (Increases damage done by Fire spells and effects by up to 21.)
-- STATS REMOVED for item Slavedriver's Cane (http://wow.allakhazam.com/dyn/items/iname17.html) 
-- DAMAGE CHANGED: Slavedriver's Cane (ilevel 60 entry 13372). 1/4 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname17.html
-- Source: http://wow.allakhazam.com/dyn/items/wminlev10.html
-- Source: http://www.thottbot.com/?n=234016
-- Source: http://wow.allakhazam.com/db/item.html?witem=13372
-- STATS CHANGED: Willey's Portable Howitzer (ilevel 61 entry 13380). 1/3 versions
-- DAMAGE CHANGED: Willey's Portable Howitzer (ilevel 61 entry 13380). 1/3 versions
-- Source: http://wow.allakhazam.com/profile.html?2089
-- Source: http://wow.allakhazam.com/dyn/items/wname3.html
-- Source: http://www.thottbot.com/?n=14640
-- SPELLS REMOVED: Willey's Portable Howitzer (ilevel 61 entry 13380). 3 versions
-- Source: http://wow.allakhazam.com/profile.html?2089
-- Source: http://wow.allakhazam.com/dyn/items/wname3.html
-- Source: http://www.thottbot.com/?n=14640
-- * Modified spell 1
-- 1.12 spell 9139 (+8 Attack Power.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Woollies of the Prancing Minstrel (ilevel 58 entry 13383). 1/2 versions
-- SPELLS CHANGED: Woollies of the Prancing Minstrel (ilevel 58 entry 13383). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev7.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=13383
-- * Modified spell 1
-- 1.12 spell 21632 (Restores 10 mana per 5 sec.)
-- 1.04 spell 13670 (Increases your chance to dodge an attack by 2%.)
-- NOT FOUND: Rainbow Girdle (ilevel 58 entry 13384)
-- STATS CHANGED: The Postmaster's Tunic (ilevel 61 entry 13388). 1/3 versions
-- SPELLS REMOVED: The Postmaster's Tunic (ilevel 61 entry 13388). 3 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=13388
-- Source: http://wow.allakhazam.com/dyn/items/iminlev5.html
-- Source: http://www.thottbot.com/?i=The%20Postmaster%27s%20Seal
-- * Modified spell 1
-- 1.12 spell 9344 (Increases damage and healing done by magical spells and effects by up to 15.)
-- 1.04 spell 0 ()
-- STATS CHANGED: The Postmaster's Trousers (ilevel 61 entry 13389). 1/2 versions
-- STATS CHANGED: The Postmaster's Band (ilevel 61 entry 13390). 1/3 versions
-- SPELLS REMOVED: The Postmaster's Band (ilevel 61 entry 13390). 3 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=13390
-- Source: http://www.thottbot.com/?i=The%20Postmaster%27s%20Seal
-- Source: http://wow.allakhazam.com/dyn/items/iname1.html
-- * Modified spell 1
-- 1.12 spell 9343 (Increases damage and healing done by magical spells and effects by up to 14.)
-- 1.04 spell 0 ()
-- STATS CHANGED: The Postmaster's Treads (ilevel 61 entry 13391). 2/4 versions
-- CONFLICT:
-- 2005-04-03 23:56:47 to 2005-04-06 13:24:43 (days delta 3) on for example: http://wow.allakhazam.com/dyn/items/iminlev8.html
-- 2005-03-31 16:24:25 to 2005-04-01 15:12:59 (days delta 1) on for example: http://wow.allakhazam.com/db/item.html?witem=13391
-- 2005-03-10 08:25:19 to 2005-03-10 08:25:19 (days delta 0) on for example: http://www.thottbot.com/?i=The%20Postmaster%27s%20Seal
-- 2005-02-15 11:03:31 to 2005-02-24 21:12:13 (days delta 9) on for example: http://wow.allakhazam.com/item.html?witem=13391
-- SPELLS REMOVED: The Postmaster's Treads (ilevel 61 entry 13391). 4 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev8.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=13391
-- Source: http://www.thottbot.com/?i=The%20Postmaster%27s%20Seal
-- Source: http://wow.allakhazam.com/item.html?witem=13391
-- * Modified spell 1
-- 1.12 spell 9397 (Increases damage and healing done by magical spells and effects by up to 7.)
-- 1.04 spell 0 ()
-- STATS CHANGED: The Postmaster's Seal (ilevel 61 entry 13392). 1/2 versions
-- STATS CHANGED: Skul's Cold Embrace (ilevel 59 entry 13394). 1/2 versions
-- SPELLS REMOVED: Skul's Cold Embrace (ilevel 59 entry 13394). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname5.html
-- Source: http://wow.allakhazam.com/item.html?witem=13394
-- * Modified spell 1
-- 1.12 spell 13384 (Increased Defense +6.)
-- 1.04 spell 0 ()
-- SPELLS CHANGED: Skul's Ghastly Touch (ilevel 57 entry 13396). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/wminlev19.html
-- Source: http://wow.allakhazam.com/item.html?witem=13396
-- Source: http://wow.allakhazam.com/dyn/items/iminlev26.html
-- * Modified spell 1
-- 1.12 spell 9414 (Increases damage done by Shadow spells and effects by up to 14.)
-- 1.04 spell 7709 (Increases damage done by Shadow spells and effects by up to 10.)
-- STATS CHANGED: Boots of the Shrieker (ilevel 62 entry 13398). 1/2 versions
-- SPELLS REMOVED: Boots of the Shrieker (ilevel 62 entry 13398). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname8.html
-- Source: http://www.thottbot.com/?n=211493 / http://wow.allakhazam.com/profile.html?4474
-- * Modified spell 1
-- 1.12 spell 9417 (Increases damage and healing done by magical spells and effects by up to 12.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Vambraces of the Sadist (ilevel 59 entry 13400). 1/1 versions
-- STATS CHANGED: Timmy's Galoshes (ilevel 59 entry 13402). 1/2 versions
-- STATS CHANGED: Grimgore Noose (ilevel 59 entry 13403). 1/1 versions
-- STATS CHANGED: Wailing Nightbane Pauldrons (ilevel 57 entry 13405). 1/2 versions
-- SPELLS REMOVED: Wailing Nightbane Pauldrons (ilevel 57 entry 13405). 2 versions
-- Source: http://www.thottbot.com/?n=23036
-- Source: http://wow.allakhazam.com/dyn/items/iname3.html
-- * Modified spell 1
-- 1.12 spell 7516 (Increased Defense +3.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Handcrafted Mastersmith Leggings (ilevel 60 entry 13498). 1/1 versions
-- QUALITY CHANGED: Handcrafted Mastersmith Leggings (ilevel 60 entry 13498)
-- DAMAGE CHANGED: Runeblade of Baron Rivendare (ilevel 63 entry 13505). 1/3 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype17.html
-- Source: http://wow.allakhazam.com/item.html?witem=13505
-- Source: http://www.thottbot.com/?n=197406
-- SPELLS CHANGED: Greater Spellstone (ilevel 48 entry 13602). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname23.html
-- * Modified spell 2
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 0 ()
-- SPELLS CHANGED: Major Spellstone (ilevel 60 entry 13603). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname23.html
-- * Modified spell 2
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 0 ()
-- SPELLS CHANGED: Firestone (ilevel 36 entry 13699). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname23.html
-- * Modified spell 2
-- 1.12 spell 23481 (Increases damage done by Fire spells and effects by up to 14.)
-- 1.04 spell 0 ()
-- SPELLS REMOVED: Greater Firestone (ilevel 46 entry 13700). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname23.html
-- * Modified spell 1
-- 1.12 spell 17947 (Enchants the main hand weapon with fire, granting each attack a chance to deal 60 to 91 additional fire damage.)
-- 1.04 spell 0 ()
-- * Modified spell 2
-- 1.12 spell 23482 (Increases damage done by Fire spells and effects by up to 17.)
-- 1.04 spell 0 ()
-- SPELLS CHANGED: Major Firestone (ilevel 56 entry 13701). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname23.html
-- * Modified spell 2
-- 1.12 spell 23483 (Increases damage done by Fire spells and effects by up to 21.)
-- 1.04 spell 0 ()
-- SPELLS CHANGED: Runecloth Gloves (ilevel 55 entry 13863). 3 versions
-- Source: http://www.thottbot.com/?i=13778 / http://wow.allakhazam.com/item.html?witem=13863
-- Source: http://www.thottbot.com/?i=3380
-- Source: http://wow.allakhazam.com/dyn/items/iname10.html
-- * Modified spell 1
-- 1.12 spell 9417 (Increases damage and healing done by magical spells and effects by up to 12.)
-- 1.04 spell 9397 (Increases damage and healing done by magical spells and effects by up to 7.)
-- SPELLS CHANGED: Frostweave Robe (ilevel 51 entry 13868). 3 versions
-- Source: http://www.thottbot.com/?i=17299 / http://wow.allakhazam.com/item.html?witem=13868
-- Source: http://wow.allakhazam.com/dyn/items/iname20.html
-- Source: http://www.thottbot.com/?i=5964
-- * Modified spell 1
-- 1.12 spell 17890 (Increases damage done by Frost spells and effects by up to 24.)
-- 1.04 spell 9305 (Increases damage done by Frost spells and effects by up to 17.)
-- SPELLS CHANGED: Frostweave Tunic (ilevel 51 entry 13869). 3 versions
-- Source: http://www.thottbot.com/?i=419 / http://wow.allakhazam.com/item.html?witem=13869
-- Source: http://wow.allakhazam.com/dyn/items/iname5.html
-- Source: http://www.thottbot.com/?i=5964
-- * Modified spell 1
-- 1.12 spell 17890 (Increases damage done by Frost spells and effects by up to 24.)
-- 1.04 spell 9305 (Increases damage done by Frost spells and effects by up to 17.)
-- SPELLS CHANGED: Frostweave Gloves (ilevel 53 entry 13870). 2 versions
-- Source: http://www.thottbot.com/?i=419 / http://wow.allakhazam.com/dyn/items/iname10.html
-- Source: http://www.thottbot.com/?i=419
-- * Modified spell 1
-- 1.12 spell 9308 (Increases damage done by Frost spells and effects by up to 21.)
-- 1.04 spell 9404 (Increases damage done by Frost spells and effects by up to 14.)
-- SPELLS CHANGED: Frostweave Pants (ilevel 56 entry 13871). 4 versions
-- Source: http://www.thottbot.com/?i=18709 / http://wow.allakhazam.com/dyn/items/iname7.html
-- Source: http://www.thottbot.com/?i=17751
-- Source: http://www.thottbot.com/?i=17751
-- Source: http://www.thottbot.com/?i=17751
-- * Modified spell 1
-- 1.12 spell 17891 (Increases damage done by Frost spells and effects by up to 26.)
-- 1.04 spell 9305 (Increases damage done by Frost spells and effects by up to 17.)
-- SPELLS CHANGED: Bonecreeper Stylus (ilevel 62 entry 13938). 3 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=13938
-- Source: http://www.thottbot.com/?n=211493
-- Source: http://wow.allakhazam.com/dyn/items/wname19.html
-- * Modified spell 1
-- 1.12 spell 9416 (Increases damage and healing done by magical spells and effects by up to 11.)
-- 1.04 spell 9396 (Increases damage and healing done by magical spells and effects by up to 6.)
-- STATS CHANGED: Tombstone Breastplate (ilevel 62 entry 13944). 1/2 versions
-- DAMAGE CHANGED: Iceblade Hacker (ilevel 62 entry 13952). 1/2 versions
-- Source: http://wow.allakhazam.com/dyn/items/wminlev0.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=13952
-- SPELLS CHANGED: Verdant Footpads (ilevel 61 entry 13954). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev8.html
-- Source: http://wow.allakhazam.com/item.html?witem=13954
-- * Modified spell 1
-- 1.12 spell 18030 (Increases healing done by spells and effects by up to 37.)
-- 1.04 spell 9318 (Increases healing done by spells and effects by up to 33.)
-- * Modified spell 2
-- 1.12 spell 17988 (Increases damage done by Nature spells and effects by up to 24.)
-- 1.04 spell 9358 (Increases damage done by Nature spells and effects by up to 17.)
-- SPELLS REMOVED: Stoneform Shoulders (ilevel 61 entry 13955). 1 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=13955
-- * Modified spell 1
-- 1.12 spell 0 ()
-- 1.04 spell 13390 (Increased Defense +10.)
-- * Modified spell 2
-- 1.12 spell 13385 (Increased Defense +7.)
-- 1.04 spell 0 ()
-- NOT FOUND: Clutch of Andros (ilevel 61 entry 13956)
-- STATS CHANGED: Voone's Vice Grips (ilevel 60 entry 13963). 1/3 versions
-- SPELLS CHANGED: Witchblade (ilevel 62 entry 13964). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/wratio15.html
-- Source: http://www.thottbot.com/?n=211493 / http://wow.allakhazam.com/db/item.html?witem=13964
-- * Modified spell 1
-- 1.12 spell 9343 (Increases damage and healing done by magical spells and effects by up to 14.)
-- 1.04 spell 13596 (Increases damage done by Arcane spells and effects by up to 10.)
-- * Modified spell 2
-- 1.12 spell 0 ()
-- 1.04 spell 7709 (Increases damage done by Shadow spells and effects by up to 10.)
-- SPELLS REMOVED: Mark of Tyranny (ilevel 63 entry 13966). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev12.html
-- Source: http://www.thottbot.com/?i=Blackhand%27s%20Breadth / http://wow.allakhazam.com/db/item.html?witem=13966
-- * Modified spell 1
-- 1.12 spell 0 ()
-- 1.04 spell 13669 (Increases your chance to dodge an attack by 1%.)
-- * Modified spell 2
-- 1.12 spell 13669 (Increases your chance to dodge an attack by 1%.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Windreaver Greaves (ilevel 61 entry 13967). 1/2 versions
-- SPELLS REMOVED: Windreaver Greaves (ilevel 61 entry 13967). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname8.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=13967
-- * Modified spell 1
-- 1.12 spell 15464 (Improves your chance to hit by 1%.)
-- 1.04 spell 0 ()
-- SPELLS CHANGED: Loomguard Armbraces (ilevel 61 entry 13969). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=13969
-- Source: http://wow.allakhazam.com/dyn/items/itype9.html
-- * Modified spell 1
-- 1.12 spell 9318 (Increases healing done by spells and effects by up to 33.)
-- 1.04 spell 25067 (Increases healing done by spells and effects by up to 30.)
-- SPELLS REMOVED: Barov Peasant Caller (ilevel 62 entry 14023). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev12.html
-- * Modified spell 1
-- 1.12 spell 18308 (Calls forth 3 servants of the House Barov that will fight, cook, and clean for you.)
-- 1.04 spell 0 ()
-- SPELLS CHANGED: Cindercloth Vest (ilevel 52 entry 14042). 4 versions
-- Source: http://www.thottbot.com/?i=24100 / http://wow.allakhazam.com/db/item.html?witem=14042
-- Source: http://www.thottbot.com/?i=17185
-- Source: http://wow.allakhazam.com/dyn/items/iname5.html
-- Source: http://www.thottbot.com/?i=4376
-- * Modified spell 1
-- 1.12 spell 17866 (Increases damage done by Fire spells and effects by up to 24.)
-- 1.04 spell 23482 (Increases damage done by Fire spells and effects by up to 17.)
-- SPELLS CHANGED: Cindercloth Gloves (ilevel 54 entry 14043). 2 versions
-- Source: http://www.thottbot.com/?i=419 / http://wow.allakhazam.com/item.html?witem=14043
-- Source: http://www.thottbot.com/?i=4376
-- * Modified spell 1
-- 1.12 spell 9295 (Increases damage done by Fire spells and effects by up to 17.)
-- 1.04 spell 9399 (Increases damage done by Fire spells and effects by up to 11.)
-- SPELLS CHANGED: Cindercloth Cloak (ilevel 55 entry 14044). 2 versions
-- Source: http://www.thottbot.com/?i=10062 / http://wow.allakhazam.com/item.html?witem=14044
-- Source: http://wow.allakhazam.com/dyn/items/iname16.html
-- * Modified spell 1
-- 1.12 spell 9400 (Increases damage done by Fire spells and effects by up to 13.)
-- 1.04 spell 7688 (Increases damage done by Fire spells and effects by up to 9.)
-- SPELLS CHANGED: Cindercloth Pants (ilevel 56 entry 14045). 5 versions
-- Source: http://www.thottbot.com/?i=10062 / http://wow.allakhazam.com/db/item.html?witem=14045
-- Source: http://www.thottbot.com/?i=18120
-- Source: http://www.thottbot.com/?i=419
-- Source: http://www.thottbot.com/?i=18120
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- * Modified spell 1
-- 1.12 spell 17867 (Increases damage done by Fire spells and effects by up to 26.)
-- 1.04 spell 23482 (Increases damage done by Fire spells and effects by up to 17.)
-- SPELLS CHANGED: Brightcloth Cloak (ilevel 55 entry 14103). 1 versions
-- Source: http://www.thottbot.com/?i=14791 / http://wow.allakhazam.com/item.html?witem=14103
-- * Modified spell 1
-- 1.12 spell 7703 (Increases damage done by Frost spells and effects by up to 10.)
-- 1.04 spell 7701 (Increases damage done by Frost spells and effects by up to 7.)
-- SPELLS CHANGED: Felcloth Robe (ilevel 61 entry 14106). 5 versions
-- Source: http://www.thottbot.com/?i=13114 / http://wow.allakhazam.com/item.html?witem=14106
-- Source: http://www.thottbot.com/?i=10440
-- Source: http://wow.allakhazam.com/dyn/items/iname20.html
-- Source: http://www.thottbot.com/?i=10440
-- Source: http://www.thottbot.com/?i=10440
-- * Modified spell 1
-- 1.12 spell 18015 (Increases damage done by Shadow spells and effects by up to 36.)
-- 1.04 spell 18012 (Increases damage done by Shadow spells and effects by up to 31.)
-- SPELLS CHANGED: Felcloth Pants (ilevel 55 entry 14107). 4 versions
-- Source: http://www.thottbot.com/?i=419 / http://wow.allakhazam.com/item.html?witem=14107
-- Source: http://www.thottbot.com/?i=Felcloth
-- Source: http://www.thottbot.com/?i=8131
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- * Modified spell 1
-- 1.12 spell 18008 (Increases damage done by Shadow spells and effects by up to 26.)
-- 1.04 spell 9325 (Increases damage done by Shadow spells and effects by up to 17.)
-- SPELLS CHANGED: Felcloth Boots (ilevel 57 entry 14108). 3 versions
-- Source: http://www.thottbot.com/?i=419 / http://wow.allakhazam.com/item.html?witem=14108
-- Source: http://www.thottbot.com/?i=19642
-- Source: http://www.thottbot.com/?i=3217
-- * Modified spell 1
-- 1.12 spell 9295 (Increases damage done by Fire spells and effects by up to 17.)
-- 1.04 spell 9399 (Increases damage done by Fire spells and effects by up to 11.)
-- SPELLS CHANGED: Felcloth Hood (ilevel 58 entry 14111). 5 versions
-- Source: http://www.thottbot.com/?i=18159 / http://wow.allakhazam.com/db/price.html?witem=14111
-- Source: http://www.thottbot.com/?i=17881
-- Source: http://www.thottbot.com/?i=17881
-- Source: http://wow.allakhazam.com/dyn/items/iname1.html
-- Source: http://www.thottbot.com/?i=17881
-- * Modified spell 1
-- 1.12 spell 18011 (Increases damage done by Shadow spells and effects by up to 30.)
-- 1.04 spell 14794 (Increases damage done by Shadow spells and effects by up to 24.)
-- SPELLS CHANGED: Felcloth Shoulders (ilevel 62 entry 14112). 5 versions
-- Source: http://www.thottbot.com/?i=22731 / http://wow.allakhazam.com/item.html?witem=14112
-- Source: http://www.thottbot.com/?i=17746
-- Source: http://wow.allakhazam.com/dyn/items/iname3.html
-- Source: http://www.thottbot.com/?i=3217
-- Source: http://www.thottbot.com/?i=17746
-- * Modified spell 1
-- 1.12 spell 18008 (Increases damage done by Shadow spells and effects by up to 26.)
-- 1.04 spell 9325 (Increases damage done by Shadow spells and effects by up to 17.)
-- SPELLS CHANGED: Robe of Winter Night (ilevel 57 entry 14136). 4 versions
-- Source: http://www.thottbot.com/?i=21483 / http://wow.allakhazam.com/item.html?witem=14136
-- Source: http://wow.allakhazam.com/dyn/items/iname20.html
-- Source: http://www.thottbot.com/?i=8272
-- Source: http://www.thottbot.com/?i=8129
-- * Modified spell 1
-- 1.12 spell 18018 (Increases damage done by Shadow spells and effects by up to 40.)
-- 1.04 spell 18016 (Increases damage done by Shadow spells and effects by up to 37.)
-- * Modified spell 2
-- 1.12 spell 17900 (Increases damage done by Frost spells and effects by up to 40.)
-- 1.04 spell 17898 (Increases damage done by Frost spells and effects by up to 37.)
-- SPELLS CHANGED: Robe of the Archmage (ilevel 62 entry 14152). 3 versions
-- Source: http://www.thottbot.com/?i=10062 / http://wow.allakhazam.com/item.html?witem=14152
-- Source: http://www.thottbot.com/?i=26850
-- Source: http://wow.allakhazam.com/dyn/items/iminlev20.html
-- * Modified spell 1
-- 1.12 spell 18056 (Increases damage and healing done by magical spells and effects by up to 40.)
-- 1.04 spell 14055 (Increases damage and healing done by magical spells and effects by up to 35.)
-- SPELLS CHANGED: Robe of the Void (ilevel 62 entry 14153). 4 versions
-- Source: http://www.thottbot.com/?i=10062 / http://wow.allakhazam.com/dyn/items/iminlev20.html
-- Source: http://www.thottbot.com/?i=26067
-- Source: http://www.thottbot.com/?i=8272
-- Source: http://www.thottbot.com/?i=26067
-- * Modified spell 1
-- 1.12 spell 28264 (Increases damage and healing done by magical spells and effects by up to 46.)
-- 1.04 spell 18023 (Increases damage done by Shadow spells and effects by up to 47.)
-- WARNING: NOT FOUND FOR DESC "Reduces the cooldown of your Fade ability by 2 sec." (guessed 18388)
-- SPELLS CHANGED: Truefaith Vestments (ilevel 62 entry 14154). 5 versions
-- Source: http://www.thottbot.com/?i=4279
-- Source: http://www.thottbot.com/?i=4282
-- Source: http://wow.allakhazam.com/dyn/items/iname20.html
-- Source: http://www.thottbot.com/?i=14540
-- Source: http://www.thottbot.com/?i=24750
-- Warning: UNSURE DATA
-- * Modified spell 1
-- 1.12 spell 18044 (Increases healing done by spells and effects by up to 73.)
-- 1.04 spell 18041 (Increases healing done by spells and effects by up to 66.)
-- STATS CHANGED: Freezing Lich Robes (ilevel 62 entry 14340). 1/2 versions
-- SPELLS CHANGED: Freezing Lich Robes (ilevel 62 entry 14340). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname20.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=14340
-- * Modified spell 1
-- 1.12 spell 17902 (Increases damage done by Frost spells and effects by up to 43.)
-- 1.04 spell 17901 (Increases damage done by Frost spells and effects by up to 41.)
-- NOT FOUND: Elunarian Silk Robes (ilevel 64 entry 14464)
-- STATS CHANGED: Death's Clutch (ilevel 62 entry 14503). 1/2 versions
-- STATS CHANGED: Maelstrom Leggings (ilevel 62 entry 14522). 1/2 versions
-- SPELLS REMOVED: Maelstrom Leggings (ilevel 62 entry 14522). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- Source: http://wow.allakhazam.com/item.html?witem=14522
-- * Modified spell 1
-- 1.12 spell 7680 (Increases healing done by spells and effects by up to 13.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Boneclenched Gauntlets (ilevel 62 entry 14525). 1/1 versions
-- SPELLS REMOVED: Boneclenched Gauntlets (ilevel 62 entry 14525). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev10.html
-- * Modified spell 1
-- 1.12 spell 13385 (Increased Defense +7.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Rattlecage Buckler (ilevel 62 entry 14528). 1/2 versions
-- QUALITY CHANGED: Rattlecage Buckler (ilevel 62 entry 14528)
-- STATS CHANGED: Corpselight Greaves (ilevel 62 entry 14537). 1/2 versions
-- QUALITY CHANGED: Corpselight Greaves (ilevel 62 entry 14537)
-- STATS CHANGED: Deadwalker Mantle (ilevel 62 entry 14538). 1/1 versions
-- SPELLS REMOVED: Deadwalker Mantle (ilevel 62 entry 14538). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname3.html
-- * Modified spell 1
-- 1.12 spell 9413 (Increases damage done by Shadow spells and effects by up to 13.)
-- 1.04 spell 0 ()
-- QUALITY CHANGED: Deadwalker Mantle (ilevel 62 entry 14538)
-- NOT FOUND: Bone Ring Helm (ilevel 62 entry 14539)
-- SPELLS REMOVED: Barovian Family Sword (ilevel 61 entry 14541). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname17.html
-- Source: http://wow.allakhazam.com/dyn/items/wminlev8.html
-- * Modified spell 1
-- 1.12 spell 18652 (Deals 30 Shadow damage every 3 sec for 15 sec. All damage done is then transferred to the caster.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Darkshade Gloves (ilevel 62 entry 14543). 1/1 versions
-- QUALITY CHANGED: Darkshade Gloves (ilevel 62 entry 14543)
-- STATS CHANGED: Ghostloom Leggings (ilevel 62 entry 14545). 1/2 versions
-- SPELLS REMOVED: Ghostloom Leggings (ilevel 62 entry 14545). 2 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=14545
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- * Modified spell 1
-- 1.12 spell 21627 (Restores 6 mana per 5 sec.)
-- 1.04 spell 0 ()
-- QUALITY CHANGED: Ghostloom Leggings (ilevel 62 entry 14545)
-- STATS CHANGED: Royal Cap Spaulders (ilevel 62 entry 14548). 1/2 versions
-- SPELLS REMOVED: Royal Cap Spaulders (ilevel 62 entry 14548). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname3.html
-- Source: http://wow.allakhazam.com/item.html?witem=14548
-- * Modified spell 1
-- 1.12 spell 9315 (Increases healing done by spells and effects by up to 26.)
-- 1.04 spell 0 ()
-- QUALITY CHANGED: Royal Cap Spaulders (ilevel 62 entry 14548)
-- SPELLS CHANGED: Stockade Pauldrons (ilevel 55 entry 14552). 3 versions
-- Source: http://www.thottbot.com/?n=211272 / http://wow.allakhazam.com/db/item.html?witem=14552
-- Source: http://wow.allakhazam.com/dyn/items/iminlev3.html
-- Source: http://www.thottbot.com/?n=5677
-- * Modified spell 1
-- 1.12 spell 13390 (Increased Defense +10.)
-- 1.04 spell 21411 (Increased Defense +15.)
-- SPELLS CHANGED: Sash of Mercy (ilevel 61 entry 14553). 1 versions
-- Source: http://www.thottbot.com/?n=71189 / http://wow.allakhazam.com/db/item.html?witem=14553
-- * Modified spell 1
-- 1.12 spell 15696 (Increases healing done by spells and effects by up to 53.)
-- 1.04 spell 18034 (Increases healing done by spells and effects by up to 48.)
-- STATS CHANGED: Bloodmail Legguards (ilevel 61 entry 14612). 1/2 versions
-- QUALITY CHANGED: Bloodmail Legguards (ilevel 61 entry 14612)
-- STATS CHANGED: Bloodmail Belt (ilevel 61 entry 14614). 1/2 versions
-- QUALITY CHANGED: Bloodmail Belt (ilevel 61 entry 14614)
-- STATS CHANGED: Bloodmail Gauntlets (ilevel 61 entry 14615). 1/2 versions
-- SPELLS REMOVED: Bloodmail Gauntlets (ilevel 61 entry 14615). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname10.html
-- Source: http://www.thottbot.com/?i=Bloodmail%20Hauberk
-- * Modified spell 1
-- 1.12 spell 7597 (Improves your chance to get a critical strike by 1%.)
-- 1.04 spell 0 ()
-- QUALITY CHANGED: Bloodmail Gauntlets (ilevel 61 entry 14615)
-- STATS CHANGED: Bloodmail Boots (ilevel 61 entry 14616). 1/3 versions
-- SPELLS REMOVED: Bloodmail Boots (ilevel 61 entry 14616). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype8.html
-- Source: http://www.thottbot.com/?i=Bloodmail%20Hauberk
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=123
-- * Modified spell 1
-- 1.12 spell 15464 (Improves your chance to hit by 1%.)
-- 1.04 spell 0 ()
-- QUALITY CHANGED: Bloodmail Boots (ilevel 61 entry 14616)
-- STATS CHANGED: Deathbone Girdle (ilevel 61 entry 14620). 1/1 versions
-- SPELLS REMOVED: Deathbone Girdle (ilevel 61 entry 14620). 1 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=14620
-- * Modified spell 1
-- 1.12 spell 18369 (Increased Defense +9.)
-- 1.04 spell 0 ()
-- * Modified spell 2
-- 1.12 spell 21362 (Restores 4 mana per 5 sec.)
-- 1.04 spell 0 ()
-- QUALITY CHANGED: Deathbone Girdle (ilevel 61 entry 14620)
-- STATS CHANGED: Deathbone Sabatons (ilevel 61 entry 14621). 1/1 versions
-- SPELLS REMOVED: Deathbone Sabatons (ilevel 61 entry 14621). 1 versions
-- Source: http://wow.allakhazam.com/item.html?witem=14621
-- * Modified spell 1
-- 1.12 spell 21626 (Restores 6 mana per 5 sec.)
-- 1.04 spell 0 ()
-- * Modified spell 2
-- 1.12 spell 13390 (Increased Defense +10.)
-- 1.04 spell 0 ()
-- QUALITY CHANGED: Deathbone Sabatons (ilevel 61 entry 14621)
-- STATS CHANGED: Deathbone Gauntlets (ilevel 61 entry 14622). 1/1 versions
-- SPELLS REMOVED: Deathbone Gauntlets (ilevel 61 entry 14622). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname10.html
-- * Modified spell 1
-- 1.12 spell 13390 (Increased Defense +10.)
-- 1.04 spell 0 ()
-- * Modified spell 2
-- 1.12 spell 21362 (Restores 4 mana per 5 sec.)
-- 1.04 spell 0 ()
-- QUALITY CHANGED: Deathbone Gauntlets (ilevel 61 entry 14622)
-- STATS CHANGED: Deathbone Legguards (ilevel 61 entry 14623). 1/1 versions
-- SPELLS REMOVED: Deathbone Legguards (ilevel 61 entry 14623). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- * Modified spell 1
-- 1.12 spell 21363 (Restores 5 mana per 5 sec.)
-- 1.04 spell 0 ()
-- * Modified spell 2
-- 1.12 spell 14249 (Increased Defense +13.)
-- 1.04 spell 0 ()
-- QUALITY CHANGED: Deathbone Legguards (ilevel 61 entry 14623)
-- STATS CHANGED: Deathbone Chestplate (ilevel 61 entry 14624). 1/1 versions
-- SPELLS CHANGED: Deathbone Chestplate (ilevel 61 entry 14624). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev5.html
-- * Modified spell 1
-- 1.12 spell 13389 (Increased Defense +17.)
-- 1.04 spell 21423 (Increased Defense +25.)
-- * Modified spell 2
-- 1.12 spell 21363 (Restores 5 mana per 5 sec.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Necropile Robe (ilevel 61 entry 14626). 1/2 versions
-- SPELLS REMOVED: Necropile Robe (ilevel 61 entry 14626). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=14626
-- Source: http://wow.allakhazam.com/dyn/items/iname20.html
-- * Modified spell 1
-- 1.12 spell 9398 (Increases damage and healing done by magical spells and effects by up to 8.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Necropile Cuffs (ilevel 61 entry 14629). 1/1 versions
-- QUALITY CHANGED: Necropile Cuffs (ilevel 61 entry 14629)
-- STATS CHANGED: Necropile Boots (ilevel 61 entry 14631). 1/2 versions
-- SPELLS REMOVED: Necropile Boots (ilevel 61 entry 14631). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname8.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=14631
-- * Modified spell 1
-- 1.12 spell 9416 (Increases damage and healing done by magical spells and effects by up to 11.)
-- 1.04 spell 0 ()
-- QUALITY CHANGED: Necropile Boots (ilevel 61 entry 14631)
-- STATS CHANGED: Necropile Leggings (ilevel 61 entry 14632). 1/1 versions
-- QUALITY CHANGED: Necropile Leggings (ilevel 61 entry 14632)
-- STATS CHANGED: Necropile Mantle (ilevel 61 entry 14633). 1/1 versions
-- QUALITY CHANGED: Necropile Mantle (ilevel 61 entry 14633)
-- STATS CHANGED: Cadaverous Belt (ilevel 61 entry 14636). 1/1 versions
-- SPELLS REMOVED: Cadaverous Belt (ilevel 61 entry 14636). 1 versions
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=121
-- * Modified spell 1
-- 1.12 spell 14049 (+40 Attack Power.)
-- 1.04 spell 0 ()
-- QUALITY CHANGED: Cadaverous Belt (ilevel 61 entry 14636)
-- STATS CHANGED: Cadaverous Leggings (ilevel 61 entry 14638). 1/1 versions
-- SPELLS REMOVED: Cadaverous Leggings (ilevel 61 entry 14638). 1 versions
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=121
-- * Modified spell 1
-- 1.12 spell 15812 (+52 Attack Power.)
-- 1.04 spell 0 ()
-- QUALITY CHANGED: Cadaverous Leggings (ilevel 61 entry 14638)
-- STATS CHANGED: Cadaverous Gloves (ilevel 61 entry 14640). 1/2 versions
-- SPELLS REMOVED: Cadaverous Gloves (ilevel 61 entry 14640). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=14640
-- Source: http://wow.allakhazam.com/dyn/items/iname10.html
-- * Modified spell 1
-- 1.12 spell 15810 (+44 Attack Power.)
-- 1.04 spell 0 ()
-- QUALITY CHANGED: Cadaverous Gloves (ilevel 61 entry 14640)
-- STATS CHANGED: Cadaverous Walkers (ilevel 61 entry 14641). 1/2 versions
-- SPELLS REMOVED: Cadaverous Walkers (ilevel 61 entry 14641). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname8.html
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=121
-- * Modified spell 1
-- 1.12 spell 14027 (+24 Attack Power.)
-- 1.04 spell 0 ()
-- QUALITY CHANGED: Cadaverous Walkers (ilevel 61 entry 14641)
-- NOT FOUND: Warstrike Chestguard (ilevel 64 entry 14811)
-- NOT FOUND: Warstrike Buckler (ilevel 64 entry 14812)
-- NOT FOUND: Warstrike Gauntlets (ilevel 62 entry 14815)
-- STATS CHANGED: Warstrike Shoulder Pads (ilevel 62 entry 14817). 1/1 versions
-- STATS CHANGED: Green Dragonscale Breastplate (ilevel 52 entry 15045). 1/3 versions
-- STATS CHANGED: Green Dragonscale Leggings (ilevel 54 entry 15046). 1/5 versions
-- SPELLS CHANGED: Red Dragonscale Breastplate (ilevel 61 entry 15047). 4 versions
-- Source: http://www.thottbot.com/?i=19214
-- Source: http://www.thottbot.com/?i=25219
-- Source: http://wow.allakhazam.com/db/price.html?witem=15047
-- Source: http://wow.allakhazam.com/dyn/items/iname5.html
-- * Modified spell 1
-- 1.12 spell 18041 (Increases healing done by spells and effects by up to 66.)
-- 1.04 spell 18038 (Increases healing done by spells and effects by up to 59.)
-- STATS CHANGED: Stormshroud Shoulders (ilevel 59 entry 15058). 1/2 versions
-- QUALITY CHANGED: Stormshroud Shoulders (ilevel 59 entry 15058)
-- STATS CHANGED: Living Breastplate (ilevel 60 entry 15059). 1/3 versions
-- SPELLS CHANGED: Living Breastplate (ilevel 60 entry 15059). 3 versions
-- Source: http://www.thottbot.com/?i=4279 / http://wow.allakhazam.com/item.html?witem=15059
-- Source: http://www.thottbot.com/?i=8406
-- Source: http://wow.allakhazam.com/dyn/items/iname5.html
-- * Modified spell 1
-- 1.12 spell 9315 (Increases healing done by spells and effects by up to 26.)
-- 1.04 spell 23796 (Increases healing done by spells and effects by up to 24.)
-- STATS CHANGED: Living Leggings (ilevel 57 entry 15060). 1/4 versions
-- SPELLS CHANGED: Living Leggings (ilevel 57 entry 15060). 4 versions
-- Source: http://www.thottbot.com/?i=14770 / http://wow.allakhazam.com/item.html?witem=15060
-- Source: http://www.thottbot.com/?i=23745
-- Source: http://www.thottbot.com/?i=8406
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- * Modified spell 1
-- 1.12 spell 9315 (Increases healing done by spells and effects by up to 26.)
-- 1.04 spell 23796 (Increases healing done by spells and effects by up to 24.)
-- STATS CHANGED: Living Shoulders (ilevel 54 entry 15061). 1/2 versions
-- SPELLS CHANGED: Living Shoulders (ilevel 54 entry 15061). 2 versions
-- Source: http://www.thottbot.com/?i=419 / http://wow.allakhazam.com/db/item.html?entryid=45066
-- Source: http://www.thottbot.com/?i=18162
-- * Modified spell 1
-- 1.12 spell 9317 (Increases healing done by spells and effects by up to 31.)
-- 1.04 spell 9316 (Increases healing done by spells and effects by up to 29.)
-- SPELLS CHANGED: Staff of Noh'Orahil (ilevel 40 entry 15105). 3 versions
-- Source: http://wow.allakhazam.com/db/quest.html?wquest=4975
-- Source: http://wow.allakhazam.com/item.html?witem=15105
-- Source: http://wow.allakhazam.com/dyn/items/wminlev10.html
-- * Modified spell 1
-- 1.12 spell 9296 (Increases damage done by Fire spells and effects by up to 19.)
-- 1.04 spell 9400 (Increases damage done by Fire spells and effects by up to 13.)
-- SPELLS CHANGED: Staff of Dar'Orahil (ilevel 40 entry 15106). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/wminlev10.html
-- Source: http://wow.allakhazam.com/dyn/items/iname17.html
-- Source: http://wow.allakhazam.com/db/quest.html?wquest=4964
-- * Modified spell 1
-- 1.12 spell 9326 (Increases damage done by Shadow spells and effects by up to 19.)
-- 1.04 spell 9413 (Increases damage done by Shadow spells and effects by up to 13.)
-- SPELLS CHANGED: Orb of Noh'Orahil (ilevel 40 entry 15107). 3 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=15107
-- Source: http://www.thottbot.com/?i=3571
-- Source: http://wow.allakhazam.com/db/quest.html?wquest=4975
-- * Modified spell 1
-- 1.12 spell 9401 (Increases damage done by Fire spells and effects by up to 14.)
-- 1.04 spell 23480 (Increases damage done by Fire spells and effects by up to 10.)
-- SPELLS CHANGED: Orb of Dar'Orahil (ilevel 40 entry 15108). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname23.html
-- Source: http://wow.allakhazam.com/db/quest.html?wquest=4964
-- * Modified spell 1
-- 1.12 spell 9414 (Increases damage done by Shadow spells and effects by up to 14.)
-- 1.04 spell 7709 (Increases damage done by Shadow spells and effects by up to 10.)
-- SPELLS CHANGED: Staff of Soran'ruk (ilevel 25 entry 15109). 4 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype17.html
-- Source: http://wow.allakhazam.com/dyn/items/wminlev10.html
-- Source: http://wow.allakhazam.com/item.html?witem=15109
-- Source: http://www.thottbot.com/?i=8720
-- * Modified spell 1
-- 1.12 spell 7710 (Increases damage done by Shadow spells and effects by up to 9.)
-- 1.04 spell 7707 (Increases damage done by Shadow spells and effects by up to 6.)
-- * Modified spell 2
-- 1.12 spell 7688 (Increases damage done by Fire spells and effects by up to 9.)
-- 1.04 spell 7686 (Increases damage done by Fire spells and effects by up to 6.)
-- NOT FOUND: Private's Tabard (ilevel 20 entry 15196)
-- NOT FOUND: Knight's Colors (ilevel 40 entry 15198)
-- NOT FOUND: Stone Guard's Herald (ilevel 40 entry 15199)
-- STATS CHANGED: Senior Sergeant's Insignia (ilevel 35 entry 15200). 1/1 versions
-- NOT FOUND: Shucking Gloves (ilevel 17 entry 15405)
-- SPELLS CHANGED: Ornate Adamantium Breastplate (ilevel 63 entry 15413). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev5.html
-- Source: http://www.thottbot.com/?i=17848
-- Source: http://wow.allakhazam.com/db/item.html?witem=15413
-- * Modified spell 1
-- 1.12 spell 13390 (Increased Defense +10.)
-- 1.04 spell 21411 (Increased Defense +15.)
-- DAMAGE CHANGED: Fine Light Crossbow (ilevel 21 entry 15808). 1/3 versions
-- Source: http://wow.allakhazam.com/item.html?witem=15808
-- Source: http://wow.allakhazam.com/dyn/items/iname26.html
-- Source: http://www.thottbot.com/?n=2570
-- SPELLS REMOVED: Hameya's Slayer (ilevel 60 entry 15814). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/wratio7.html
-- * Modified spell 1
-- 1.12 spell 16406 (Wounds the target causing them to bleed for 80 damage over 30 sec.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Ring of Protection (ilevel 60 entry 15855). 1/1 versions
-- NOT FOUND: Elunarian Sphere (ilevel 64 entry 15968)
-- SPELLS CHANGED: Spellpower Goggles Xtreme Plus (ilevel 54 entry 15999). 2 versions
-- Source: http://www.thottbot.com/?i=17294 / http://wow.allakhazam.com/db/price.html?witem=15999
-- Source: http://www.thottbot.com/?i=17294
-- * Modified spell 1
-- 1.12 spell 14054 (Increases damage and healing done by magical spells and effects by up to 27.)
-- 1.04 spell 14254 (Increases damage and healing done by magical spells and effects by up to 19.)
-- SPELLS REMOVED: Arcanite Dragonling (ilevel 60 entry 16022). 2 versions
-- Source: http://www.thottbot.com/?i=7102
-- Source: http://wow.allakhazam.com/dyn/items/iminlev12.html
-- * Modified spell 1
-- 1.12 spell 23074 (Activates your Arcanite Dragonling to fight for you for 60 sec. It requires an hour to cool down before it can be used again.)
-- 1.04 spell 0 ()
-- STATS REMOVED for item Fordring's Seal (http://wow.allakhazam.com/dyn/items/iminlev11.html) 
-- SPELLS CHANGED: Fordring's Seal (ilevel 63 entry 16058). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev11.html
-- * Modified spell 1
-- 1.12 spell 18030 (Increases healing done by spells and effects by up to 37.)
-- 1.04 spell 9318 (Increases healing done by spells and effects by up to 33.)
-- NOT FOUND: Test Arcane Res Legs Mail (ilevel 35 entry 16165)
-- NOT FOUND: Senior Sergeant's Insignia (ilevel 63 entry 16335)
-- STATS CHANGED: Sergeant's Cape (ilevel 63 entry 16342). 3/4 versions
-- CONFLICT:
-- 2005-03-01 11:51:15 to 2005-03-01 11:51:15 (days delta 0) on for example: http://wow.allakhazam.com/item.html?witem=16341
-- 2005-03-01 11:36:29 to 2005-03-01 11:36:29 (days delta 0) on for example: http://wow.allakhazam.com/item.html?witem=16340
-- 2005-02-07 00:23:15 to 2005-02-17 08:58:41 (days delta 10) on for example: http://wow.allakhazam.com/dyn/items/iname16.html
-- 2005-02-17 08:57:09 to 2005-02-17 08:57:09 (days delta 0) on for example: http://wow.allakhazam.com/item.html?witem=16342
-- NOT FOUND: High Warlord's Blade (ilevel 78 entry 16345)
-- NOT FOUND: Knight-Lieutenant's Silk Boots (ilevel 63 entry 16369)
-- NOT FOUND: Knight-Lieutenant's Silk Gloves (ilevel 63 entry 16391)
-- NOT FOUND: Knight-Lieutenant's Leather Boots (ilevel 63 entry 16392)
-- NOT FOUND: Knight-Lieutenant's Dragonhide Footwraps (ilevel 63 entry 16393)
-- NOT FOUND: Knight-Lieutenant's Leather Gauntlets (ilevel 63 entry 16396)
-- NOT FOUND: Knight-Lieutenant's Dragonhide Gloves (ilevel 63 entry 16397)
-- NOT FOUND: Knight-Lieutenant's Chain Boots (ilevel 63 entry 16401)
-- NOT FOUND: Knight-Lieutenant's Chain Gauntlets (ilevel 63 entry 16403)
-- NOT FOUND: Knight-Lieutenant's Plate Boots (ilevel 63 entry 16405)
-- NOT FOUND: Knight-Lieutenant's Plate Gauntlets (ilevel 63 entry 16406)
-- NOT FOUND: Knight-Lieutenant's Lamellar Sabatons (ilevel 63 entry 16409)
-- NOT FOUND: Knight-Lieutenant's Lamellar Gauntlets (ilevel 63 entry 16410)
-- NOT FOUND: Knight-Captain's Silk Raiment (ilevel 63 entry 16413)
-- NOT FOUND: Knight-Captain's Silk Leggings (ilevel 63 entry 16414)
-- NOT FOUND: Lieutenant Commander's Silk Spaulders (ilevel 63 entry 16415)
-- NOT FOUND: Lieutenant Commander's Crown (ilevel 63 entry 16416)
-- NOT FOUND: Knight-Captain's Leather Armor (ilevel 63 entry 16417)
-- NOT FOUND: Lieutenant Commander's Leather Veil (ilevel 63 entry 16418)
-- NOT FOUND: Knight-Captain's Leather Legguards (ilevel 63 entry 16419)
-- NOT FOUND: Lieutenant Commander's Leather Spaulders (ilevel 63 entry 16420)
-- NOT FOUND: Knight-Captain's Dragonhide Tunic (ilevel 63 entry 16421)
-- NOT FOUND: Knight-Captain's Dragonhide Leggings (ilevel 63 entry 16422)
-- NOT FOUND: Lieutenant Commander's Dragonhide Epaulets (ilevel 63 entry 16423)
-- NOT FOUND: Lieutenant Commander's Dragonhide Shroud (ilevel 63 entry 16424)
-- NOT FOUND: Knight-Captain's Chain Hauberk (ilevel 63 entry 16425)
-- NOT FOUND: Knight-Captain's Chain Leggings (ilevel 63 entry 16426)
-- NOT FOUND: Lieutenant Commander's Chain Pauldrons (ilevel 63 entry 16427)
-- NOT FOUND: Lieutenant Commander's Chain Helmet (ilevel 63 entry 16428)
-- NOT FOUND: Lieutenant Commander's Plate Helm (ilevel 63 entry 16429)
-- NOT FOUND: Knight-Captain's Plate Chestguard (ilevel 63 entry 16430)
-- NOT FOUND: Knight-Captain's Plate Leggings (ilevel 63 entry 16431)
-- NOT FOUND: Lieutenant Commander's Plate Pauldrons (ilevel 63 entry 16432)
-- NOT FOUND: Knight-Captain's Lamellar Breastplate (ilevel 63 entry 16433)
-- NOT FOUND: Lieutenant Commander's Lamellar Headguard (ilevel 63 entry 16434)
-- NOT FOUND: Knight-Captain's Lamellar Leggings (ilevel 63 entry 16435)
-- NOT FOUND: Lieutenant Commander's Lamellar Shoulders (ilevel 63 entry 16436)
-- NOT FOUND: Marshal's Silk Footwraps (ilevel 71 entry 16437)
-- NOT FOUND: Marshal's Silk Gloves (ilevel 71 entry 16440)
-- NOT FOUND: Field Marshal's Coronet (ilevel 74 entry 16441)
-- NOT FOUND: Marshal's Silk Leggings (ilevel 71 entry 16442)
-- NOT FOUND: Field Marshal's Silk Vestments (ilevel 74 entry 16443)
-- NOT FOUND: Field Marshal's Silk Spaulders (ilevel 74 entry 16444)
-- NOT FOUND: Marshal's Leather Footguards (ilevel 71 entry 16446)
-- NOT FOUND: Marshal's Dragonhide Gauntlets (ilevel 71 entry 16448)
-- NOT FOUND: Field Marshal's Dragonhide Spaulders (ilevel 74 entry 16449)
-- NOT FOUND: Marshal's Dragonhide Legguards (ilevel 71 entry 16450)
-- NOT FOUND: Field Marshal's Dragonhide Helmet (ilevel 74 entry 16451)
-- NOT FOUND: Field Marshal's Dragonhide Breastplate (ilevel 74 entry 16452)
-- NOT FOUND: Field Marshal's Leather Chestpiece (ilevel 74 entry 16453)
-- NOT FOUND: Marshal's Leather Handgrips (ilevel 71 entry 16454)
-- NOT FOUND: Field Marshal's Leather Mask (ilevel 74 entry 16455)
-- NOT FOUND: Marshal's Leather Leggings (ilevel 71 entry 16456)
-- NOT FOUND: Field Marshal's Leather Epaulets (ilevel 74 entry 16457)
-- NOT FOUND: Marshal's Dragonhide Boots (ilevel 71 entry 16459)
-- NOT FOUND: Marshal's Chain Boots (ilevel 71 entry 16462)
-- NOT FOUND: Marshal's Chain Grips (ilevel 71 entry 16463)
-- NOT FOUND: Field Marshal's Chain Helm (ilevel 74 entry 16465)
-- NOT FOUND: Field Marshal's Chain Breastplate (ilevel 74 entry 16466)
-- NOT FOUND: Marshal's Chain Legguards (ilevel 71 entry 16467)
-- NOT FOUND: Field Marshal's Chain Spaulders (ilevel 74 entry 16468)
-- NOT FOUND: Marshal's Lamellar Gloves (ilevel 71 entry 16471)
-- NOT FOUND: Marshal's Lamellar Boots (ilevel 71 entry 16472)
-- NOT FOUND: Field Marshal's Lamellar Chestplate (ilevel 74 entry 16473)
-- NOT FOUND: Field Marshal's Lamellar Faceguard (ilevel 74 entry 16474)
-- NOT FOUND: Marshal's Lamellar Legplates (ilevel 71 entry 16475)
-- NOT FOUND: Field Marshal's Lamellar Pauldrons (ilevel 74 entry 16476)
-- NOT FOUND: Field Marshal's Plate Armor (ilevel 74 entry 16477)
-- NOT FOUND: Field Marshal's Plate Helm (ilevel 74 entry 16478)
-- NOT FOUND: Marshal's Plate Legguards (ilevel 71 entry 16479)
-- NOT FOUND: Field Marshal's Plate Shoulderguards (ilevel 74 entry 16480)
-- NOT FOUND: Marshal's Plate Boots (ilevel 71 entry 16483)
-- NOT FOUND: Marshal's Plate Gauntlets (ilevel 71 entry 16484)
-- NOT FOUND: Blood Guard's Silk Footwraps (ilevel 63 entry 16485)
-- NOT FOUND: Blood Guard's Silk Gloves (ilevel 63 entry 16487)
-- NOT FOUND: Champion's Silk Hood (ilevel 63 entry 16489)
-- NOT FOUND: Legionnaire's Silk Pants (ilevel 63 entry 16490)
-- NOT FOUND: Legionnaire's Silk Robes (ilevel 63 entry 16491)
-- NOT FOUND: Champion's Silk Shoulderpads (ilevel 63 entry 16492)
-- NOT FOUND: Blood Guard's Dragonhide Boots (ilevel 63 entry 16494)
-- NOT FOUND: Blood Guard's Dragonhide Gauntlets (ilevel 63 entry 16496)
-- NOT FOUND: Blood Guard's Leather Treads (ilevel 63 entry 16498)
-- NOT FOUND: Blood Guard's Leather Vices (ilevel 63 entry 16499)
-- NOT FOUND: Champion's Dragonhide Spaulders (ilevel 63 entry 16501)
-- NOT FOUND: Legionnaire's Dragonhide Trousers (ilevel 63 entry 16502)
-- NOT FOUND: Champion's Dragonhide Helm (ilevel 63 entry 16503)
-- NOT FOUND: Legionnaire's Dragonhide Breastplate (ilevel 63 entry 16504)
-- NOT FOUND: Legionnaire's Leather Hauberk (ilevel 63 entry 16505)
-- NOT FOUND: Champion's Leather Headguard (ilevel 63 entry 16506)
-- NOT FOUND: Champion's Leather Mantle (ilevel 63 entry 16507)
-- NOT FOUND: Legionnaire's Leather Leggings (ilevel 63 entry 16508)
-- NOT FOUND: Blood Guard's Plate Boots (ilevel 63 entry 16509)
-- NOT FOUND: Blood Guard's Plate Gloves (ilevel 63 entry 16510)
-- NOT FOUND: Legionnaire's Plate Armor (ilevel 63 entry 16513)
-- NOT FOUND: Champion's Plate Headguard (ilevel 63 entry 16514)
-- NOT FOUND: Legionnaire's Plate Legguards (ilevel 63 entry 16515)
-- NOT FOUND: Champion's Plate Pauldrons (ilevel 63 entry 16516)
-- NOT FOUND: Blood Guard's Mail Walkers (ilevel 63 entry 16518)
-- NOT FOUND: Blood Guard's Mail Grips (ilevel 63 entry 16519)
-- NOT FOUND: Champion's Mail Helm (ilevel 63 entry 16521)
-- NOT FOUND: Legionnaire's Mail Chestpiece (ilevel 63 entry 16522)
-- NOT FOUND: Legionnaire's Mail Leggings (ilevel 63 entry 16523)
-- NOT FOUND: Champion's Mail Shoulders (ilevel 63 entry 16524)
-- NOT FOUND: Legionnaire's Chain Breastplate (ilevel 63 entry 16525)
-- NOT FOUND: Champion's Chain Headguard (ilevel 63 entry 16526)
-- NOT FOUND: Legionnaire's Chain Leggings (ilevel 63 entry 16527)
-- NOT FOUND: Champion's Chain Pauldrons (ilevel 63 entry 16528)
-- NOT FOUND: Blood Guard's Chain Gauntlets (ilevel 63 entry 16530)
-- NOT FOUND: Blood Guard's Chain Boots (ilevel 63 entry 16531)
-- NOT FOUND: Warlord's Silk Cowl (ilevel 74 entry 16533)
-- NOT FOUND: General's Silk Trousers (ilevel 71 entry 16534)
-- NOT FOUND: Warlord's Silk Raiment (ilevel 74 entry 16535)
-- NOT FOUND: Warlord's Silk Amice (ilevel 74 entry 16536)
-- NOT FOUND: General's Silk Boots (ilevel 71 entry 16539)
-- NOT FOUND: General's Silk Handguards (ilevel 71 entry 16540)
-- NOT FOUND: Warlord's Plate Armor (ilevel 74 entry 16541)
-- NOT FOUND: Warlord's Plate Headpiece (ilevel 74 entry 16542)
-- NOT FOUND: General's Plate Leggings (ilevel 71 entry 16543)
-- NOT FOUND: Warlord's Plate Shoulders (ilevel 74 entry 16544)
-- NOT FOUND: General's Plate Boots (ilevel 71 entry 16545)
-- NOT FOUND: General's Plate Gauntlets (ilevel 71 entry 16548)
-- NOT FOUND: Warlord's Dragonhide Hauberk (ilevel 74 entry 16549)
-- NOT FOUND: Warlord's Dragonhide Helmet (ilevel 74 entry 16550)
-- NOT FOUND: Warlord's Dragonhide Epaulets (ilevel 74 entry 16551)
-- NOT FOUND: General's Dragonhide Leggings (ilevel 71 entry 16552)
-- NOT FOUND: General's Dragonhide Boots (ilevel 71 entry 16554)
-- NOT FOUND: General's Dragonhide Gloves (ilevel 71 entry 16555)
-- NOT FOUND: General's Leather Treads (ilevel 71 entry 16558)
-- NOT FOUND: General's Leather Mitts (ilevel 71 entry 16560)
-- NOT FOUND: Warlord's Leather Helm (ilevel 74 entry 16561)
-- NOT FOUND: Warlord's Leather Spaulders (ilevel 74 entry 16562)
-- NOT FOUND: Warlord's Leather Breastplate (ilevel 74 entry 16563)
-- NOT FOUND: General's Leather Legguards (ilevel 71 entry 16564)
-- NOT FOUND: Warlord's Chain Chestpiece (ilevel 74 entry 16565)
-- NOT FOUND: Warlord's Chain Helmet (ilevel 74 entry 16566)
-- NOT FOUND: General's Chain Legguards (ilevel 71 entry 16567)
-- NOT FOUND: Warlord's Chain Shoulders (ilevel 74 entry 16568)
-- NOT FOUND: General's Chain Boots (ilevel 71 entry 16569)
-- NOT FOUND: General's Chain Gloves (ilevel 71 entry 16571)
-- NOT FOUND: General's Mail Boots (ilevel 71 entry 16573)
-- NOT FOUND: General's Mail Gauntlets (ilevel 71 entry 16574)
-- NOT FOUND: Warlord's Mail Armor (ilevel 74 entry 16577)
-- NOT FOUND: Warlord's Mail Helm (ilevel 74 entry 16578)
-- NOT FOUND: General's Mail Leggings (ilevel 71 entry 16579)
-- NOT FOUND: Warlord's Mail Spaulders (ilevel 74 entry 16580)
-- STATS CHANGED: Magister's Gloves (ilevel 59 entry 16684). 1/2 versions
-- STATS CHANGED: Magister's Belt (ilevel 58 entry 16685). 1/2 versions
-- STATS CHANGED: Magister's Leggings (ilevel 61 entry 16687). 1/4 versions
-- STATS CHANGED: Magister's Robes (ilevel 63 entry 16688). 1/4 versions
-- STATS CHANGED: Magister's Mantle (ilevel 60 entry 16689). 1/2 versions
-- STATS CHANGED: Devout Gloves (ilevel 59 entry 16692). 1/2 versions
-- STATS CHANGED: Devout Skirt (ilevel 61 entry 16694). 1/1 versions
-- STATS CHANGED: Dreadmist Leggings (ilevel 61 entry 16699). 1/4 versions
-- STATS CHANGED: Dreadmist Wraps (ilevel 59 entry 16705). 1/2 versions
-- STATS CHANGED: Shadowcraft Boots (ilevel 59 entry 16711). 1/1 versions
-- STATS CHANGED: Arcanist Crown (ilevel 66 entry 16795). 1/1 versions
-- SPELLS CHANGED: Arcanist Crown (ilevel 66 entry 16795). 1 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=16795
-- * Modified spell 1
-- 1.12 spell 14799 (Increases damage and healing done by magical spells and effects by up to 20.)
-- 1.04 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- * Modified spell 2
-- 1.12 spell 23727 (Improves your chance to hit with spells by 1%.)
-- 1.04 spell 7685 (Increases damage done by Fire spells and effects by up to 4.)
-- STATS CHANGED: Arcanist Leggings (ilevel 66 entry 16796). 1/1 versions
-- SPELLS CHANGED: Arcanist Leggings (ilevel 66 entry 16796). 1 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16796
-- * Modified spell 1
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 13592 (Increases damage done by Arcane spells and effects by up to 4.)
-- * Modified spell 2
-- 1.12 spell 14799 (Increases damage and healing done by magical spells and effects by up to 20.)
-- 1.04 spell 23480 (Increases damage done by Fire spells and effects by up to 10.)
-- STATS CHANGED: Arcanist Mantle (ilevel 66 entry 16797). 2/2 versions
-- CONFLICT:
-- 2005-02-07 00:53:57 to 2005-03-18 17:10:09 (days delta 42) on for example: http://wow.allakhazam.com/db/item.html?witem=16797
-- 2005-02-25 05:05:45 to 2005-03-15 03:54:16 (days delta 21) on for example: http://wow.allakhazam.com/dyn/items/iminlev3.html
-- Warning: UNRESOLVED conflict
-- SPELLS CHANGED: Arcanist Mantle (ilevel 66 entry 16797). 2 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=16797
-- Source: http://wow.allakhazam.com/dyn/items/iminlev3.html
-- * Modified spell 1
-- 1.12 spell 21618 (Restores 4 mana per 5 sec.)
-- 1.04 spell 13599 (Increases damage done by Arcane spells and effects by up to 14.)
-- * Modified spell 2
-- 1.12 spell 9343 (Increases damage and healing done by magical spells and effects by up to 14.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Arcanist Robes (ilevel 66 entry 16798). 1/2 versions
-- SPELLS CHANGED: Arcanist Robes (ilevel 66 entry 16798). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16798
-- Source: http://thottbot.com/?l=latest
-- * Modified spell 1
-- 1.12 spell 14047 (Increases damage and healing done by magical spells and effects by up to 23.)
-- 1.04 spell 13596 (Increases damage done by Arcane spells and effects by up to 10.)
-- * Modified spell 2
-- 1.12 spell 0 ()
-- 1.04 spell 23480 (Increases damage done by Fire spells and effects by up to 10.)
-- * Modified spell 3
-- 1.12 spell 0 ()
-- 1.04 spell 7703 (Increases damage done by Frost spells and effects by up to 10.)
-- STATS CHANGED: Arcanist Bindings (ilevel 66 entry 16799). 2/2 versions
-- CONFLICT:
-- 2005-02-07 00:53:57 to 2005-03-18 17:10:15 (days delta 42) on for example: http://wow.allakhazam.com/item.html?witem=16799
-- 2005-02-23 11:53:13 to 2005-02-23 11:53:13 (days delta 0) on for example: http://wow.allakhazam.com/dyn/items/itype9.html
-- SPELLS REMOVED: Arcanist Bindings (ilevel 66 entry 16799). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16799
-- Source: http://wow.allakhazam.com/dyn/items/itype9.html
-- * Modified spell 1
-- 1.12 spell 9417 (Increases damage and healing done by magical spells and effects by up to 12.)
-- 1.04 spell 0 ()
-- * Modified spell 2
-- 1.12 spell 21625 (Restores 3 mana per 5 sec.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Arcanist Boots (ilevel 66 entry 16800). 1/1 versions
-- SPELLS REMOVED: Arcanist Boots (ilevel 66 entry 16800). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname8.html
-- * Modified spell 1
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 0 ()
-- * Modified spell 2
-- 1.12 spell 9416 (Increases damage and healing done by magical spells and effects by up to 11.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Arcanist Gloves (ilevel 66 entry 16801). 2/2 versions
-- CONFLICT:
-- 2005-02-07 00:53:57 to 2005-03-18 17:10:22 (days delta 42) on for example: http://wow.allakhazam.com/db/item.html?witem=16801
-- 2005-02-24 05:09:52 to 2005-02-24 05:57:04 (days delta 0) on for example: http://wow.allakhazam.com/dyn/items/iminlev10.html
-- SPELLS CHANGED: Arcanist Gloves (ilevel 66 entry 16801). 2 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=16801
-- Source: http://wow.allakhazam.com/dyn/items/iminlev10.html
-- * Modified spell 1
-- 1.12 spell 21618 (Restores 4 mana per 5 sec.)
-- 1.04 spell 23480 (Increases damage done by Fire spells and effects by up to 10.)
-- * Modified spell 2
-- 1.12 spell 9343 (Increases damage and healing done by magical spells and effects by up to 14.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Arcanist Belt (ilevel 66 entry 16802). 1/1 versions
-- SPELLS CHANGED: Arcanist Belt (ilevel 66 entry 16802). 1 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=16802
-- * Modified spell 1
-- 1.12 spell 9343 (Increases damage and healing done by magical spells and effects by up to 14.)
-- 1.04 spell 18379 (Restores 6 mana per 5 sec.)
-- STATS CHANGED: Felheart Slippers (ilevel 66 entry 16803). 1/2 versions
-- SPELLS CHANGED: Felheart Slippers (ilevel 66 entry 16803). 2 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=16803
-- Source: http://thottbot.com/?l=latest
-- * Modified spell 1
-- 1.12 spell 9346 (Increases damage and healing done by magical spells and effects by up to 18.)
-- 1.04 spell 7685 (Increases damage done by Fire spells and effects by up to 4.)
-- STATS CHANGED: Felheart Bracers (ilevel 66 entry 16804). 1/2 versions
-- SPELLS CHANGED: Felheart Bracers (ilevel 66 entry 16804). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname9.html
-- Source: http://www.thottbot.com/?n=174320
-- * Modified spell 1
-- 1.12 spell 9342 (Increases damage and healing done by magical spells and effects by up to 13.)
-- 1.04 spell 21587 (Restores 1 health per 5 sec.)
-- STATS CHANGED: Felheart Gloves (ilevel 66 entry 16805). 1/1 versions
-- SPELLS CHANGED: Felheart Gloves (ilevel 66 entry 16805). 1 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16805
-- * Modified spell 1
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 9414 (Increases damage done by Shadow spells and effects by up to 14.)
-- * Modified spell 2
-- 1.12 spell 9415 (Increases damage and healing done by magical spells and effects by up to 9.)
-- 1.04 spell 23480 (Increases damage done by Fire spells and effects by up to 10.)
-- STATS CHANGED: Felheart Belt (ilevel 66 entry 16806). 1/1 versions
-- SPELLS CHANGED: Felheart Belt (ilevel 66 entry 16806). 1 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=16806
-- * Modified spell 1
-- 1.12 spell 14799 (Increases damage and healing done by magical spells and effects by up to 20.)
-- 1.04 spell 7709 (Increases damage done by Shadow spells and effects by up to 10.)
-- * Modified spell 2
-- 1.12 spell 0 ()
-- 1.04 spell 21587 (Restores 1 health per 5 sec.)
-- STATS CHANGED: Felheart Shoulder Pads (ilevel 66 entry 16807). 2/3 versions
-- CONFLICT:
-- 2005-02-07 00:59:39 to 2005-04-03 22:10:55 (days delta 58) on for example: http://wow.allakhazam.com/db/item.html?witem=16807
-- 2005-01-16 02:43:04 to 2005-03-15 03:54:16 (days delta 61) on for example: http://wow.allakhazam.com/dyn/items/iname3.html
-- 2005-02-04 23:41:00 to 2005-02-04 23:41:00 (days delta 0) on for example: http://thottbot.com/?l=latest
-- Warning: UNRESOLVED conflict
-- SPELLS CHANGED: Felheart Shoulder Pads (ilevel 66 entry 16807). 3 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=16807
-- Source: http://wow.allakhazam.com/dyn/items/iname3.html
-- Source: http://thottbot.com/?l=latest
-- * Modified spell 1
-- 1.12 spell 9415 (Increases damage and healing done by magical spells and effects by up to 9.)
-- 1.04 spell 23480 (Increases damage done by Fire spells and effects by up to 10.)
-- STATS CHANGED: Felheart Horns (ilevel 66 entry 16808). 1/1 versions
-- SPELLS REMOVED: Felheart Horns (ilevel 66 entry 16808). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname1.html
-- * Modified spell 1
-- 1.12 spell 14799 (Increases damage and healing done by magical spells and effects by up to 20.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Felheart Robes (ilevel 66 entry 16809). 1/1 versions
-- SPELLS CHANGED: Felheart Robes (ilevel 66 entry 16809). 1 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=16809
-- * Modified spell 1
-- 1.12 spell 9342 (Increases damage and healing done by magical spells and effects by up to 13.)
-- 1.04 spell 7685 (Increases damage done by Fire spells and effects by up to 4.)
-- * Modified spell 2
-- 1.12 spell 23727 (Improves your chance to hit with spells by 1%.)
-- 1.04 spell 7706 (Increases damage done by Shadow spells and effects by up to 4.)
-- * Modified spell 3
-- 1.12 spell 0 ()
-- 1.04 spell 21587 (Restores 1 health per 5 sec.)
-- STATS CHANGED: Felheart Pants (ilevel 66 entry 16810). 2/2 versions
-- CONFLICT:
-- 2005-02-23 11:53:09 to 2005-02-23 11:53:09 (days delta 0) on for example: http://wow.allakhazam.com/dyn/items/itype7.html
-- 2005-02-07 00:59:39 to 2005-02-07 00:59:39 (days delta 0) on for example: http://wow.allakhazam.com/db/itemset.html?setid=203
-- SPELLS CHANGED: Felheart Pants (ilevel 66 entry 16810). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype7.html
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=203
-- * Modified spell 1
-- 1.12 spell 14798 (Increases damage and healing done by magical spells and effects by up to 30.)
-- 1.04 spell 7709 (Increases damage done by Shadow spells and effects by up to 10.)
-- * Modified spell 2
-- 1.12 spell 0 ()
-- 1.04 spell 7685 (Increases damage done by Fire spells and effects by up to 4.)
-- STATS CHANGED: Boots of Prophecy (ilevel 66 entry 16811). 2/2 versions
-- CONFLICT:
-- 2005-02-15 11:03:31 to 2005-04-06 14:05:36 (days delta 53) on for example: http://wow.allakhazam.com/dyn/items/iname8.html
-- 2005-02-07 01:47:36 to 2005-03-24 22:17:27 (days delta 48) on for example: http://wow.allakhazam.com/db/item.html?witem=16811
-- Warning: UNRESOLVED conflict
-- SPELLS REMOVED: Boots of Prophecy (ilevel 66 entry 16811). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname8.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=16811
-- * Modified spell 1
-- 1.12 spell 9406 (Increases healing done by spells and effects by up to 18.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Gloves of Prophecy (ilevel 66 entry 16812). 1/1 versions
-- SPELLS CHANGED: Gloves of Prophecy (ilevel 66 entry 16812). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname10.html
-- * Modified spell 1
-- 1.12 spell 21626 (Restores 6 mana per 5 sec.)
-- 1.04 spell 9414 (Increases damage done by Shadow spells and effects by up to 14.)
-- * Modified spell 2
-- 1.12 spell 9406 (Increases healing done by spells and effects by up to 18.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Circlet of Prophecy (ilevel 66 entry 16813). 2/2 versions
-- CONFLICT:
-- 2005-02-07 02:03:23 to 2005-04-04 18:29:55 (days delta 59) on for example: http://wow.allakhazam.com/db/item.html?witem=16813
-- 2005-02-08 01:42:37 to 2005-02-25 04:19:45 (days delta 17) on for example: http://wow.allakhazam.com/dyn/items/iname1.html
-- Warning: UNRESOLVED conflict
-- SPELLS CHANGED: Circlet of Prophecy (ilevel 66 entry 16813). 2 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=16813
-- Source: http://wow.allakhazam.com/dyn/items/iname1.html
-- * Modified spell 1
-- 1.12 spell 9417 (Increases damage and healing done by magical spells and effects by up to 12.)
-- 1.04 spell 9414 (Increases damage done by Shadow spells and effects by up to 14.)
-- * Modified spell 2
-- 1.12 spell 0 ()
-- 1.04 spell 9407 (Increases healing done by spells and effects by up to 20.)
-- STATS CHANGED: Pants of Prophecy (ilevel 66 entry 16814). 1/1 versions
-- SPELLS CHANGED: Pants of Prophecy (ilevel 66 entry 16814). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- * Modified spell 1
-- 1.12 spell 21626 (Restores 6 mana per 5 sec.)
-- 1.04 spell 25067 (Increases healing done by spells and effects by up to 30.)
-- * Modified spell 2
-- 1.12 spell 9408 (Increases healing done by spells and effects by up to 22.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Robes of Prophecy (ilevel 66 entry 16815). 2/2 versions
-- CONFLICT:
-- 2005-02-07 02:21:45 to 2005-04-04 18:44:23 (days delta 59) on for example: http://wow.allakhazam.com/db/item.html?witem=16815
-- 2005-02-07 03:28:48 to 2005-03-17 02:38:25 (days delta 41) on for example: http://wow.allakhazam.com/dyn/items/iname20.html
-- Warning: UNRESOLVED conflict
-- SPELLS CHANGED: Robes of Prophecy (ilevel 66 entry 16815). 2 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=16815
-- Source: http://wow.allakhazam.com/dyn/items/iname20.html
-- * Modified spell 1
-- 1.12 spell 9408 (Increases healing done by spells and effects by up to 22.)
-- 1.04 spell 7706 (Increases damage done by Shadow spells and effects by up to 4.)
-- STATS CHANGED: Mantle of Prophecy (ilevel 66 entry 16816). 1/1 versions
-- SPELLS CHANGED: Mantle of Prophecy (ilevel 66 entry 16816). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname3.html
-- * Modified spell 1
-- 1.12 spell 9415 (Increases damage and healing done by magical spells and effects by up to 9.)
-- 1.04 spell 9407 (Increases healing done by spells and effects by up to 20.)
-- STATS CHANGED: Girdle of Prophecy (ilevel 66 entry 16817). 1/1 versions
-- SPELLS CHANGED: Girdle of Prophecy (ilevel 66 entry 16817). 1 versions
-- Source: http://www.thottbot.com/?n=174320 / http://wow.allakhazam.com/db/item.html?witem=16817
-- * Modified spell 1
-- 1.12 spell 21618 (Restores 4 mana per 5 sec.)
-- 1.04 spell 9407 (Increases healing done by spells and effects by up to 20.)
-- * Modified spell 2
-- 1.12 spell 9415 (Increases damage and healing done by magical spells and effects by up to 9.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Netherwind Belt (ilevel 76 entry 16818). 1/1 versions
-- SPELLS CHANGED: Netherwind Belt (ilevel 76 entry 16818). 1 versions
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=210
-- * Modified spell 1
-- 1.12 spell 14047 (Increases damage and healing done by magical spells and effects by up to 23.)
-- 1.04 spell 23480 (Increases damage done by Fire spells and effects by up to 10.)
-- STATS CHANGED: Vambraces of Prophecy (ilevel 66 entry 16819). 1/2 versions
-- SPELLS CHANGED: Vambraces of Prophecy (ilevel 66 entry 16819). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname9.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=16819
-- * Modified spell 1
-- 1.12 spell 21624 (Restores 2 mana per 5 sec.)
-- 1.04 spell 9407 (Increases healing done by spells and effects by up to 20.)
-- * Modified spell 2
-- 1.12 spell 9314 (Increases healing done by spells and effects by up to 24.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Nightslayer Chestpiece (ilevel 66 entry 16820). 2/2 versions
-- CONFLICT:
-- 2005-02-07 03:41:19 to 2005-03-29 01:07:11 (days delta 53) on for example: http://wow.allakhazam.com/dyn/items/iminlev5.html
-- 2005-02-04 00:07:52 to 2005-03-13 13:46:32 (days delta 40) on for example: http://wow.allakhazam.com/item.html?witem=16820
-- Warning: UNRESOLVED conflict
-- SPELLS REMOVED: Nightslayer Chestpiece (ilevel 66 entry 16820). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev5.html
-- Source: http://wow.allakhazam.com/item.html?witem=16820
-- * Modified spell 1
-- 1.12 spell 7597 (Improves your chance to get a critical strike by 1%.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Nightslayer Cover (ilevel 66 entry 16821). 1/1 versions
-- STATS CHANGED: Nightslayer Pants (ilevel 66 entry 16822). 1/2 versions
-- SPELLS CHANGED: Nightslayer Pants (ilevel 66 entry 16822). 2 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=16822
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- * Modified spell 1
-- 1.12 spell 7597 (Improves your chance to get a critical strike by 1%.)
-- 1.04 spell 13669 (Increases your chance to dodge an attack by 1%.)
-- STATS CHANGED: Nightslayer Shoulder Pads (ilevel 66 entry 16823). 1/1 versions
-- STATS CHANGED: Nightslayer Boots (ilevel 66 entry 16824). 2/2 versions
-- CONFLICT:
-- 2005-04-06 14:05:36 to 2005-04-06 14:05:36 (days delta 0) on for example: http://wow.allakhazam.com/dyn/items/iname8.html
-- 2005-02-07 01:08:08 to 2005-03-18 17:11:18 (days delta 42) on for example: http://wow.allakhazam.com/db/item.html?witem=16824
-- STATS CHANGED: Nightslayer Bracelets (ilevel 66 entry 16825). 1/2 versions
-- STATS CHANGED: Nightslayer Gloves (ilevel 66 entry 16826). 1/1 versions
-- SPELLS REMOVED: Nightslayer Gloves (ilevel 66 entry 16826). 1 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=16826
-- * Modified spell 1
-- 1.12 spell 15464 (Improves your chance to hit by 1%.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Nightslayer Belt (ilevel 66 entry 16827). 1/1 versions
-- SPELLS REMOVED: Nightslayer Belt (ilevel 66 entry 16827). 1 versions
-- Source: http://www.thottbot.com/?n=174320 / http://wow.allakhazam.com/db/item.html?witem=16827
-- * Modified spell 1
-- 1.12 spell 7597 (Improves your chance to get a critical strike by 1%.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Cenarion Belt (ilevel 66 entry 16828). 1/1 versions
-- SPELLS CHANGED: Cenarion Belt (ilevel 66 entry 16828). 1 versions
-- Source: http://www.thottbot.com/?n=219939 / http://wow.allakhazam.com/db/price.html?witem=16828
-- * Modified spell 1
-- 1.12 spell 21618 (Restores 4 mana per 5 sec.)
-- 1.04 spell 13599 (Increases damage done by Arcane spells and effects by up to 14.)
-- * Modified spell 2
-- 1.12 spell 9415 (Increases damage and healing done by magical spells and effects by up to 9.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Cenarion Boots (ilevel 66 entry 16829). 2/2 versions
-- CONFLICT:
-- 2005-02-15 11:03:31 to 2005-04-06 14:47:39 (days delta 53) on for example: http://wow.allakhazam.com/dyn/items/itype8.html
-- 2005-02-07 01:18:39 to 2005-04-04 06:34:54 (days delta 59) on for example: http://wow.allakhazam.com/item.html?witem=16829
-- Warning: UNRESOLVED conflict
-- SPELLS REMOVED: Cenarion Boots (ilevel 66 entry 16829). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype8.html
-- Source: http://wow.allakhazam.com/item.html?witem=16829
-- * Modified spell 1
-- 1.12 spell 21625 (Restores 3 mana per 5 sec.)
-- 1.04 spell 0 ()
-- * Modified spell 2
-- 1.12 spell 9406 (Increases healing done by spells and effects by up to 18.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Cenarion Bracers (ilevel 66 entry 16830). 1/1 versions
-- SPELLS CHANGED: Cenarion Bracers (ilevel 66 entry 16830). 1 versions
-- Source: http://www.thottbot.com/?n=174320 / http://wow.allakhazam.com/dyn/items/iname9.html
-- * Modified spell 1
-- 1.12 spell 9396 (Increases damage and healing done by magical spells and effects by up to 6.)
-- 1.04 spell 25067 (Increases healing done by spells and effects by up to 30.)
-- STATS CHANGED: Cenarion Gloves (ilevel 66 entry 16831). 1/1 versions
-- SPELLS CHANGED: Cenarion Gloves (ilevel 66 entry 16831). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname10.html
-- * Modified spell 1
-- 1.12 spell 9406 (Increases healing done by spells and effects by up to 18.)
-- 1.04 spell 13596 (Increases damage done by Arcane spells and effects by up to 10.)
-- STATS CHANGED: Bloodfang Spaulders (ilevel 76 entry 16832). 2/3 versions
-- CONFLICT:
-- 2005-02-28 02:35:15 to 2005-03-21 08:23:53 (days delta 24) on for example: http://www.thottbot.com/?i=27137
-- 2005-02-07 02:12:36 to 2005-03-18 17:15:50 (days delta 42) on for example: http://wow.allakhazam.com/db/item.html?witem=16832
-- 2005-02-25 05:05:45 to 2005-03-15 03:54:16 (days delta 21) on for example: http://wow.allakhazam.com/dyn/items/iminlev3.html
-- Warning: UNRESOLVED conflict
-- SPELLS REMOVED: Bloodfang Spaulders (ilevel 76 entry 16832). 3 versions
-- Source: http://www.thottbot.com/?i=27137
-- Source: http://wow.allakhazam.com/db/item.html?witem=16832
-- Source: http://wow.allakhazam.com/dyn/items/iminlev3.html
-- * Modified spell 1
-- 1.12 spell 13669 (Increases your chance to dodge an attack by 1%.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Cenarion Vestments (ilevel 66 entry 16833). 1/2 versions
-- SPELLS CHANGED: Cenarion Vestments (ilevel 66 entry 16833). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16833
-- Source: http://wow.allakhazam.com/dyn/items/iname5.html
-- * Modified spell 1
-- 1.12 spell 21625 (Restores 3 mana per 5 sec.)
-- 1.04 spell 18031 (Increases healing done by spells and effects by up to 40.)
-- * Modified spell 2
-- 1.12 spell 9408 (Increases healing done by spells and effects by up to 22.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Cenarion Helm (ilevel 66 entry 16834). 2/2 versions
-- CONFLICT:
-- 2005-02-04 00:17:41 to 2005-04-01 07:56:02 (days delta 59) on for example: http://wow.allakhazam.com/db/item.html?witem=16834
-- 2005-01-16 02:23:48 to 2005-02-25 03:28:41 (days delta 40) on for example: http://wow.allakhazam.com/dyn/items/iminlev1.html
-- Warning: UNRESOLVED conflict
-- SPELLS CHANGED: Cenarion Helm (ilevel 66 entry 16834). 2 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=16834
-- Source: http://wow.allakhazam.com/dyn/items/iminlev1.html
-- * Modified spell 1
-- 1.12 spell 9417 (Increases damage and healing done by magical spells and effects by up to 12.)
-- 1.04 spell 25067 (Increases healing done by spells and effects by up to 30.)
-- STATS CHANGED: Cenarion Leggings (ilevel 66 entry 16835). 2/2 versions
-- CONFLICT:
-- 2005-02-07 01:18:39 to 2005-03-18 17:15:58 (days delta 42) on for example: http://wow.allakhazam.com/db/itemset.html?setid=205
-- 2005-02-15 11:03:16 to 2005-02-23 12:25:35 (days delta 8) on for example: http://wow.allakhazam.com/dyn/items/iname7.html
-- SPELLS CHANGED: Cenarion Leggings (ilevel 66 entry 16835). 2 versions
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=205
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- * Modified spell 1
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 13599 (Increases damage done by Arcane spells and effects by up to 14.)
-- * Modified spell 2
-- 1.12 spell 21362 (Restores 4 mana per 5 sec.)
-- 1.04 spell 9411 (Increases damage done by Nature spells and effects by up to 14.)
-- * Modified spell 3
-- 1.12 spell 9408 (Increases healing done by spells and effects by up to 22.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Cenarion Spaulders (ilevel 66 entry 16836). 1/1 versions
-- SPELLS CHANGED: Cenarion Spaulders (ilevel 66 entry 16836). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname3.html
-- * Modified spell 1
-- 1.12 spell 21618 (Restores 4 mana per 5 sec.)
-- 1.04 spell 9411 (Increases damage done by Nature spells and effects by up to 14.)
-- * Modified spell 2
-- 1.12 spell 9406 (Increases healing done by spells and effects by up to 18.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Earthfury Boots (ilevel 66 entry 16837). 2/2 versions
-- CONFLICT:
-- 2005-04-06 14:05:36 to 2005-04-06 14:05:36 (days delta 0) on for example: http://wow.allakhazam.com/dyn/items/iname8.html
-- 2005-02-07 01:31:20 to 2005-03-18 17:16:05 (days delta 42) on for example: http://wow.allakhazam.com/db/itemset.html?setid=207
-- SPELLS CHANGED: Earthfury Boots (ilevel 66 entry 16837). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname8.html
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=207
-- * Modified spell 1
-- 1.12 spell 9406 (Increases healing done by spells and effects by up to 18.)
-- 1.04 spell 7703 (Increases damage done by Frost spells and effects by up to 10.)
-- STATS CHANGED: Earthfury Belt (ilevel 66 entry 16838). 1/2 versions
-- SPELLS CHANGED: Earthfury Belt (ilevel 66 entry 16838). 2 versions
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=207
-- Source: http://www.thottbot.com/?n=174320
-- * Modified spell 1
-- 1.12 spell 21618 (Restores 4 mana per 5 sec.)
-- 1.04 spell 9407 (Increases healing done by spells and effects by up to 20.)
-- * Modified spell 2
-- 1.12 spell 9406 (Increases healing done by spells and effects by up to 18.)
-- 1.04 spell 9411 (Increases damage done by Nature spells and effects by up to 14.)
-- STATS CHANGED: Earthfury Gauntlets (ilevel 66 entry 16839). 1/1 versions
-- SPELLS CHANGED: Earthfury Gauntlets (ilevel 66 entry 16839). 1 versions
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=207
-- * Modified spell 1
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 25067 (Increases healing done by spells and effects by up to 30.)
-- * Modified spell 2
-- 1.12 spell 9415 (Increases damage and healing done by magical spells and effects by up to 9.)
-- 1.04 spell 7696 (Increases damage done by Nature spells and effects by up to 10.)
-- STATS CHANGED: Earthfury Bracers (ilevel 66 entry 16840). 1/1 versions
-- SPELLS CHANGED: Earthfury Bracers (ilevel 66 entry 16840). 1 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=16840
-- * Modified spell 1
-- 1.12 spell 9396 (Increases damage and healing done by magical spells and effects by up to 6.)
-- 1.04 spell 9407 (Increases healing done by spells and effects by up to 20.)
-- STATS CHANGED: Earthfury Vestments (ilevel 66 entry 16841). 1/2 versions
-- SPELLS CHANGED: Earthfury Vestments (ilevel 66 entry 16841). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev5.html
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=207
-- * Modified spell 1
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 18031 (Increases healing done by spells and effects by up to 40.)
-- * Modified spell 2
-- 1.12 spell 9408 (Increases healing done by spells and effects by up to 22.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Earthfury Helmet (ilevel 66 entry 16842). 2/2 versions
-- CONFLICT:
-- 2005-02-07 01:31:20 to 2005-03-18 17:16:17 (days delta 42) on for example: http://wow.allakhazam.com/db/itemset.html?setid=207
-- 2005-02-23 02:06:35 to 2005-02-25 04:19:45 (days delta 2) on for example: http://wow.allakhazam.com/dyn/items/iname1.html
-- SPELLS CHANGED: Earthfury Helmet (ilevel 66 entry 16842). 2 versions
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=207
-- Source: http://wow.allakhazam.com/dyn/items/iname1.html
-- * Modified spell 1
-- 1.12 spell 21626 (Restores 6 mana per 5 sec.)
-- 1.04 spell 23481 (Increases damage done by Fire spells and effects by up to 14.)
-- * Modified spell 2
-- 1.12 spell 9408 (Increases healing done by spells and effects by up to 22.)
-- 1.04 spell 9404 (Increases damage done by Frost spells and effects by up to 14.)
-- STATS CHANGED: Earthfury Legguards (ilevel 66 entry 16843). 1/1 versions
-- SPELLS CHANGED: Earthfury Legguards (ilevel 66 entry 16843). 1 versions
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=207
-- * Modified spell 1
-- 1.12 spell 21627 (Restores 6 mana per 5 sec.)
-- 1.04 spell 9411 (Increases damage done by Nature spells and effects by up to 14.)
-- * Modified spell 2
-- 1.12 spell 9417 (Increases damage and healing done by magical spells and effects by up to 12.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Earthfury Epaulets (ilevel 66 entry 16844). 2/2 versions
-- CONFLICT:
-- 2005-02-07 01:31:20 to 2005-03-18 17:16:26 (days delta 42) on for example: http://wow.allakhazam.com/db/itemset.html?setid=207
-- 2005-02-22 12:13:20 to 2005-03-15 03:54:16 (days delta 24) on for example: http://wow.allakhazam.com/dyn/items/iminlev3.html
-- Warning: UNRESOLVED conflict
-- SPELLS CHANGED: Earthfury Epaulets (ilevel 66 entry 16844). 2 versions
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=207
-- Source: http://wow.allakhazam.com/dyn/items/iminlev3.html
-- * Modified spell 1
-- 1.12 spell 21618 (Restores 4 mana per 5 sec.)
-- 1.04 spell 23480 (Increases damage done by Fire spells and effects by up to 10.)
-- * Modified spell 2
-- 1.12 spell 9406 (Increases healing done by spells and effects by up to 18.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Giantstalker's Breastplate (ilevel 66 entry 16845). 2/2 versions
-- CONFLICT:
-- 2005-02-07 01:26:21 to 2005-02-17 08:57:54 (days delta 10) on for example: http://wow.allakhazam.com/db/itemset.html?setid=206
-- 2005-02-07 01:17:16 to 2005-02-17 08:34:58 (days delta 10) on for example: http://wow.allakhazam.com/dyn/items/itype5.html
-- STATS CHANGED: Giantstalker's Helmet (ilevel 66 entry 16846). 2/2 versions
-- CONFLICT:
-- 2005-02-07 01:26:21 to 2005-03-18 17:16:29 (days delta 42) on for example: http://wow.allakhazam.com/db/itemset.html?setid=206
-- 2005-02-23 02:06:35 to 2005-02-25 04:19:45 (days delta 2) on for example: http://wow.allakhazam.com/dyn/items/iname1.html
-- SPELLS REMOVED: Giantstalker's Helmet (ilevel 66 entry 16846). 2 versions
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=206
-- Source: http://wow.allakhazam.com/dyn/items/iname1.html
-- * Modified spell 1
-- 1.12 spell 7597 (Improves your chance to get a critical strike by 1%.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Giantstalker's Leggings (ilevel 66 entry 16847). 2/2 versions
-- CONFLICT:
-- 2005-02-07 01:26:21 to 2005-03-18 17:16:33 (days delta 42) on for example: http://wow.allakhazam.com/db/itemset.html?setid=206
-- 2005-02-23 11:53:09 to 2005-02-23 12:25:35 (days delta 0) on for example: http://wow.allakhazam.com/dyn/items/iminlev7.html
-- SPELLS REMOVED: Giantstalker's Leggings (ilevel 66 entry 16847). 2 versions
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=206
-- Source: http://wow.allakhazam.com/dyn/items/iminlev7.html
-- * Modified spell 1
-- 1.12 spell 7597 (Improves your chance to get a critical strike by 1%.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Giantstalker's Epaulets (ilevel 66 entry 16848). 1/1 versions
-- STATS CHANGED: Giantstalker's Boots (ilevel 66 entry 16849). 1/1 versions
-- STATS CHANGED: Giantstalker's Bracers (ilevel 66 entry 16850). 1/2 versions
-- STATS CHANGED: Giantstalker's Belt (ilevel 66 entry 16851). 1/1 versions
-- SPELLS REMOVED: Giantstalker's Belt (ilevel 66 entry 16851). 1 versions
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=206
-- * Modified spell 1
-- 1.12 spell 7597 (Improves your chance to get a critical strike by 1%.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Giantstalker's Gloves (ilevel 66 entry 16852). 1/1 versions
-- SPELLS CHANGED: Giantstalker's Gloves (ilevel 66 entry 16852). 1 versions
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=206
-- * Modified spell 1
-- 1.12 spell 15465 (Improves your chance to hit by 2%.)
-- 1.04 spell 13670 (Increases your chance to dodge an attack by 2%.)
-- STATS CHANGED: Lawbringer Chestguard (ilevel 66 entry 16853). 1/2 versions
-- SPELLS CHANGED: Lawbringer Chestguard (ilevel 66 entry 16853). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev5.html
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=208
-- * Modified spell 1
-- 1.12 spell 9408 (Increases healing done by spells and effects by up to 22.)
-- 1.04 spell 25067 (Increases healing done by spells and effects by up to 30.)
-- STATS CHANGED: Lawbringer Helm (ilevel 66 entry 16854). 1/2 versions
-- SPELLS CHANGED: Lawbringer Helm (ilevel 66 entry 16854). 2 versions
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=208
-- Source: http://wow.allakhazam.com/dyn/items/iname1.html
-- * Modified spell 1
-- 1.12 spell 21619 (Restores 4 mana per 5 sec.)
-- 1.04 spell 7597 (Improves your chance to get a critical strike by 1%.)
-- * Modified spell 2
-- 1.12 spell 9408 (Increases healing done by spells and effects by up to 22.)
-- 1.04 spell 25067 (Increases healing done by spells and effects by up to 30.)
-- STATS CHANGED: Lawbringer Legplates (ilevel 66 entry 16855). 1/1 versions
-- SPELLS CHANGED: Lawbringer Legplates (ilevel 66 entry 16855). 1 versions
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=208
-- * Modified spell 1
-- 1.12 spell 21625 (Restores 3 mana per 5 sec.)
-- 1.04 spell 13669 (Increases your chance to dodge an attack by 1%.)
-- * Modified spell 2
-- 1.12 spell 9408 (Increases healing done by spells and effects by up to 22.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Lawbringer Spaulders (ilevel 66 entry 16856). 1/2 versions
-- SPELLS REMOVED: Lawbringer Spaulders (ilevel 66 entry 16856). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev3.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=16856
-- * Modified spell 1
-- 1.12 spell 9406 (Increases healing done by spells and effects by up to 18.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Lawbringer Bracers (ilevel 66 entry 16857). 1/2 versions
-- SPELLS REMOVED: Lawbringer Bracers (ilevel 66 entry 16857). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname9.html
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=208
-- * Modified spell 1
-- 1.12 spell 21618 (Restores 4 mana per 5 sec.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Lawbringer Belt (ilevel 66 entry 16858). 1/1 versions
-- SPELLS CHANGED: Lawbringer Belt (ilevel 66 entry 16858). 1 versions
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=208
-- * Modified spell 1
-- 1.12 spell 9406 (Increases healing done by spells and effects by up to 18.)
-- 1.04 spell 9407 (Increases healing done by spells and effects by up to 20.)
-- STATS CHANGED: Lawbringer Boots (ilevel 66 entry 16859). 1/1 versions
-- SPELLS CHANGED: Lawbringer Boots (ilevel 66 entry 16859). 1 versions
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=208
-- * Modified spell 1
-- 1.12 spell 21624 (Restores 2 mana per 5 sec.)
-- 1.04 spell 15464 (Improves your chance to hit by 1%.)
-- * Modified spell 2
-- 1.12 spell 9406 (Increases healing done by spells and effects by up to 18.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Lawbringer Gauntlets (ilevel 66 entry 16860). 1/1 versions
-- SPELLS CHANGED: Lawbringer Gauntlets (ilevel 66 entry 16860). 1 versions
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=208
-- * Modified spell 1
-- 1.12 spell 9406 (Increases healing done by spells and effects by up to 18.)
-- 1.04 spell 13674 (Increases your chance to block attacks with a shield by 1%.)
-- STATS CHANGED: Bracers of Might (ilevel 66 entry 16861). 1/1 versions
-- STATS CHANGED: Sabatons of Might (ilevel 66 entry 16862). 1/2 versions
-- SPELLS REMOVED: Sabatons of Might (ilevel 66 entry 16862). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype8.html
-- Source: http://wow.allakhazam.com/item.html?witem=16862
-- * Modified spell 1
-- 1.12 spell 13383 (Increased Defense +5.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Gauntlets of Might (ilevel 66 entry 16863). 1/1 versions
-- SPELLS CHANGED: Gauntlets of Might (ilevel 66 entry 16863). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev10.html
-- * Modified spell 1
-- 1.12 spell 15464 (Improves your chance to hit by 1%.)
-- 1.04 spell 7597 (Improves your chance to get a critical strike by 1%.)
-- * Modified spell 2
-- 1.12 spell 13383 (Increased Defense +5.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Belt of Might (ilevel 66 entry 16864). 1/1 versions
-- SPELLS CHANGED: Belt of Might (ilevel 66 entry 16864). 1 versions
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=209
-- * Modified spell 2
-- 1.12 spell 13383 (Increased Defense +5.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Breastplate of Might (ilevel 66 entry 16865). 1/1 versions
-- SPELLS CHANGED: Breastplate of Might (ilevel 66 entry 16865). 1 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=16865
-- * Modified spell 1
-- 1.12 spell 13676 (Increases your chance to block attacks with a shield by 3%.)
-- 1.04 spell 13675 (Increases your chance to block attacks with a shield by 2%.)
-- * Modified spell 2
-- 1.12 spell 13385 (Increased Defense +7.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Helm of Might (ilevel 66 entry 16866). 2/2 versions
-- CONFLICT:
-- 2005-02-07 01:41:47 to 2005-03-01 11:51:40 (days delta 25) on for example: http://wow.allakhazam.com/item.html?witem=16866
-- 2005-02-25 03:28:41 to 2005-02-25 03:28:41 (days delta 0) on for example: http://wow.allakhazam.com/dyn/items/iminlev1.html
-- SPELLS CHANGED: Helm of Might (ilevel 66 entry 16866). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16866
-- Source: http://wow.allakhazam.com/dyn/items/iminlev1.html
-- * Modified spell 1
-- 1.12 spell 13669 (Increases your chance to dodge an attack by 1%.)
-- 1.04 spell 15464 (Improves your chance to hit by 1%.)
-- * Modified spell 2
-- 1.12 spell 13385 (Increased Defense +7.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Legplates of Might (ilevel 66 entry 16867). 1/1 versions
-- SPELLS CHANGED: Legplates of Might (ilevel 66 entry 16867). 1 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16867
-- * Modified spell 2
-- 1.12 spell 13385 (Increased Defense +7.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Pauldrons of Might (ilevel 66 entry 16868). 1/1 versions
-- SPELLS REMOVED: Pauldrons of Might (ilevel 66 entry 16868). 1 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16868
-- * Modified spell 1
-- 1.12 spell 13675 (Increases your chance to block attacks with a shield by 2%.)
-- 1.04 spell 0 ()
-- * Modified spell 2
-- 1.12 spell 13383 (Increased Defense +5.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Stormrage Chestguard (ilevel 76 entry 16897). 1/2 versions
-- SPELLS CHANGED: Stormrage Chestguard (ilevel 76 entry 16897). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev5.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=16897
-- * Modified spell 1
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 13592 (Increases damage done by Arcane spells and effects by up to 4.)
-- * Modified spell 2
-- 1.12 spell 18032 (Increases healing done by spells and effects by up to 42.)
-- 1.04 spell 7692 (Increases damage done by Nature spells and effects by up to 4.)
-- * Modified spell 3
-- 1.12 spell 0 ()
-- 1.04 spell 7678 (Increases healing done by spells and effects by up to 9.)
-- STATS CHANGED: Stormrage Boots (ilevel 76 entry 16898). 1/1 versions
-- SPELLS CHANGED: Stormrage Boots (ilevel 76 entry 16898). 1 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16898
-- * Modified spell 1
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 13596 (Increases damage done by Arcane spells and effects by up to 10.)
-- * Modified spell 2
-- 1.12 spell 9315 (Increases healing done by spells and effects by up to 26.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Stormrage Handguards (ilevel 76 entry 16899). 1/1 versions
-- SPELLS CHANGED: Stormrage Handguards (ilevel 76 entry 16899). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname10.html
-- * Modified spell 1
-- 1.12 spell 18032 (Increases healing done by spells and effects by up to 42.)
-- 1.04 spell 7692 (Increases damage done by Nature spells and effects by up to 4.)
-- * Modified spell 2
-- 1.12 spell 0 ()
-- 1.04 spell 25067 (Increases healing done by spells and effects by up to 30.)
-- STATS CHANGED: Stormrage Cover (ilevel 76 entry 16900). 2/2 versions
-- CONFLICT:
-- 2005-02-22 12:34:30 to 2005-03-01 11:41:44 (days delta 10) on for example: http://wow.allakhazam.com/db/item.html?witem=16900
-- 2005-02-23 02:06:35 to 2005-02-25 04:19:45 (days delta 2) on for example: http://wow.allakhazam.com/dyn/items/iname1.html
-- SPELLS CHANGED: Stormrage Cover (ilevel 76 entry 16900). 2 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=16900
-- Source: http://wow.allakhazam.com/dyn/items/iname1.html
-- * Modified spell 1
-- 1.12 spell 21626 (Restores 6 mana per 5 sec.)
-- 1.04 spell 13604 (Increases damage done by Arcane spells and effects by up to 20.)
-- * Modified spell 2
-- 1.12 spell 9316 (Increases healing done by spells and effects by up to 29.)
-- 1.04 spell 18031 (Increases healing done by spells and effects by up to 40.)
-- STATS CHANGED: Stormrage Legguards (ilevel 76 entry 16901). 1/2 versions
-- SPELLS CHANGED: Stormrage Legguards (ilevel 76 entry 16901). 2 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=16901
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- * Modified spell 1
-- 1.12 spell 18034 (Increases healing done by spells and effects by up to 48.)
-- 1.04 spell 13592 (Increases damage done by Arcane spells and effects by up to 4.)
-- * Modified spell 2
-- 1.12 spell 18379 (Restores 6 mana per 5 sec.)
-- 1.04 spell 9360 (Increases damage done by Nature spells and effects by up to 20.)
-- STATS CHANGED: Stormrage Pauldrons (ilevel 76 entry 16902). 1/2 versions
-- SPELLS REMOVED: Stormrage Pauldrons (ilevel 76 entry 16902). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev3.html
-- Source: http://wow.allakhazam.com/item.html?witem=16902
-- * Modified spell 1
-- 1.12 spell 9316 (Increases healing done by spells and effects by up to 29.)
-- 1.04 spell 0 ()
-- * Modified spell 2
-- 1.12 spell 21618 (Restores 4 mana per 5 sec.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Stormrage Belt (ilevel 76 entry 16903). 1/1 versions
-- SPELLS CHANGED: Stormrage Belt (ilevel 76 entry 16903). 1 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=16903
-- * Modified spell 1
-- 1.12 spell 9315 (Increases healing done by spells and effects by up to 26.)
-- 1.04 spell 9360 (Increases damage done by Nature spells and effects by up to 20.)
-- * Modified spell 2
-- 1.12 spell 21618 (Restores 4 mana per 5 sec.)
-- 1.04 spell 9407 (Increases healing done by spells and effects by up to 20.)
-- STATS CHANGED: Stormrage Bracers (ilevel 76 entry 16904). 2/2 versions
-- CONFLICT:
-- 2005-02-23 11:53:13 to 2005-03-24 05:00:42 (days delta 32) on for example: http://wow.allakhazam.com/dyn/items/iname9.html
-- 2005-02-22 12:34:47 to 2005-02-28 00:17:12 (days delta 6) on for example: http://wow.allakhazam.com/item.html?witem=16904
-- Warning: UNRESOLVED conflict
-- SPELLS CHANGED: Stormrage Bracers (ilevel 76 entry 16904). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname9.html
-- Source: http://wow.allakhazam.com/item.html?witem=16904
-- * Modified spell 1
-- 1.12 spell 9318 (Increases healing done by spells and effects by up to 33.)
-- 1.04 spell 13599 (Increases damage done by Arcane spells and effects by up to 14.)
-- STATS CHANGED: Bloodfang Chestpiece (ilevel 76 entry 16905). 1/1 versions
-- SPELLS CHANGED: Bloodfang Chestpiece (ilevel 76 entry 16905). 1 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=16905
-- * Modified spell 1
-- 1.12 spell 7597 (Improves your chance to get a critical strike by 1%.)
-- 1.04 spell 13669 (Increases your chance to dodge an attack by 1%.)
-- * Modified spell 2
-- 1.12 spell 15465 (Improves your chance to hit by 2%.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Bloodfang Boots (ilevel 76 entry 16906). 1/3 versions
-- SPELLS REMOVED: Bloodfang Boots (ilevel 76 entry 16906). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname8.html
-- Source: http://www.thottbot.com/?i=27137
-- Source: http://wow.allakhazam.com/db/item.html?witem=16906
-- * Modified spell 1
-- 1.12 spell 13669 (Increases your chance to dodge an attack by 1%.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Bloodfang Gloves (ilevel 76 entry 16907). 1/2 versions
-- SPELLS CHANGED: Bloodfang Gloves (ilevel 76 entry 16907). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16907
-- Source: http://www.thottbot.com/?i=27137
-- * Modified spell 1
-- 1.12 spell 7219 (Immune to Disarm.)
-- 1.04 spell 15465 (Improves your chance to hit by 2%.)
-- STATS CHANGED: Bloodfang Hood (ilevel 76 entry 16908). 2/2 versions
-- CONFLICT:
-- 2005-02-05 00:36:31 to 2005-03-16 04:25:08 (days delta 42) on for example: http://wow.allakhazam.com/db/item.html?witem=16908
-- 2005-02-23 02:06:35 to 2005-02-25 04:19:45 (days delta 2) on for example: http://wow.allakhazam.com/dyn/items/iname1.html
-- SPELLS CHANGED: Bloodfang Hood (ilevel 76 entry 16908). 2 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=16908
-- Source: http://wow.allakhazam.com/dyn/items/iname1.html
-- * Modified spell 1
-- 1.12 spell 7597 (Improves your chance to get a critical strike by 1%.)
-- 1.04 spell 20884 (1% chance to stun a victim struck in combat for 1 sec.)
-- STATS CHANGED: Bloodfang Pants (ilevel 76 entry 16909). 2/2 versions
-- CONFLICT:
-- 2005-02-07 02:12:36 to 2005-03-18 17:17:05 (days delta 42) on for example: http://wow.allakhazam.com/db/item.html?witem=16909
-- 2005-02-22 02:38:41 to 2005-02-23 12:25:35 (days delta 1) on for example: http://wow.allakhazam.com/dyn/items/iname7.html
-- SPELLS REMOVED: Bloodfang Pants (ilevel 76 entry 16909). 2 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=16909
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- * Modified spell 1
-- 1.12 spell 7597 (Improves your chance to get a critical strike by 1%.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Bloodfang Belt (ilevel 76 entry 16910). 1/2 versions
-- STATS CHANGED: Bloodfang Bracers (ilevel 76 entry 16911). 1/2 versions
-- SPELLS REMOVED: Bloodfang Bracers (ilevel 76 entry 16911). 2 versions
-- Source: http://www.thottbot.com/?i=27137
-- Source: http://wow.allakhazam.com/item.html?witem=16911
-- * Modified spell 1
-- 1.12 spell 15464 (Improves your chance to hit by 1%.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Netherwind Boots (ilevel 76 entry 16912). 1/2 versions
-- SPELLS CHANGED: Netherwind Boots (ilevel 76 entry 16912). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype8.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=16912
-- * Modified spell 1
-- 1.12 spell 14054 (Increases damage and healing done by magical spells and effects by up to 27.)
-- 1.04 spell 13599 (Increases damage done by Arcane spells and effects by up to 14.)
-- STATS CHANGED: Netherwind Gloves (ilevel 76 entry 16913). 1/1 versions
-- SPELLS CHANGED: Netherwind Gloves (ilevel 76 entry 16913). 1 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=16913
-- * Modified spell 1
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 23480 (Increases damage done by Fire spells and effects by up to 10.)
-- * Modified spell 2
-- 1.12 spell 14799 (Increases damage and healing done by magical spells and effects by up to 20.)
-- 1.04 spell 7699 (Increases damage done by Frost spells and effects by up to 4.)
-- STATS CHANGED: Netherwind Crown (ilevel 76 entry 16914). 1/1 versions
-- SPELLS CHANGED: Netherwind Crown (ilevel 76 entry 16914). 1 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16914
-- * Modified spell 1
-- 1.12 spell 21619 (Restores 4 mana per 5 sec.)
-- 1.04 spell 13604 (Increases damage done by Arcane spells and effects by up to 20.)
-- * Modified spell 2
-- 1.12 spell 17367 (Increases damage and healing done by magical spells and effects by up to 32.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Netherwind Pants (ilevel 76 entry 16915). 1/2 versions
-- SPELLS CHANGED: Netherwind Pants (ilevel 76 entry 16915). 2 versions
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=210
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- * Modified spell 1
-- 1.12 spell 14798 (Increases damage and healing done by magical spells and effects by up to 30.)
-- 1.04 spell 9307 (Increases damage done by Frost spells and effects by up to 20.)
-- * Modified spell 2
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Netherwind Robes (ilevel 76 entry 16916). 1/2 versions
-- SPELLS CHANGED: Netherwind Robes (ilevel 76 entry 16916). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16916
-- Source: http://wow.allakhazam.com/dyn/items/iname20.html
-- * Modified spell 1
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 25065 (Increases damage done by fire spells and effects by up to 20.)
-- * Modified spell 2
-- 1.12 spell 17367 (Increases damage and healing done by magical spells and effects by up to 32.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Netherwind Mantle (ilevel 76 entry 16917). 2/2 versions
-- CONFLICT:
-- 2005-02-07 01:49:22 to 2005-04-04 19:55:25 (days delta 59) on for example: http://wow.allakhazam.com/item.html?witem=16917
-- 2005-02-22 12:13:20 to 2005-03-15 03:54:16 (days delta 24) on for example: http://wow.allakhazam.com/dyn/items/iname3.html
-- Warning: UNRESOLVED conflict
-- SPELLS CHANGED: Netherwind Mantle (ilevel 76 entry 16917). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16917
-- Source: http://wow.allakhazam.com/dyn/items/iname3.html
-- * Modified spell 1
-- 1.12 spell 21619 (Restores 4 mana per 5 sec.)
-- 1.04 spell 23481 (Increases damage done by Fire spells and effects by up to 14.)
-- * Modified spell 2
-- 1.12 spell 14248 (Increases damage and healing done by magical spells and effects by up to 21.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Netherwind Bindings (ilevel 76 entry 16918). 1/2 versions
-- SPELLS REMOVED: Netherwind Bindings (ilevel 76 entry 16918). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname9.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=16918
-- * Modified spell 1
-- 1.12 spell 14254 (Increases damage and healing done by magical spells and effects by up to 19.)
-- 1.04 spell 0 ()
-- * Modified spell 2
-- 1.12 spell 21362 (Restores 4 mana per 5 sec.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Boots of Transcendence (ilevel 76 entry 16919). 1/3 versions
-- SPELLS CHANGED: Boots of Transcendence (ilevel 76 entry 16919). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev8.html
-- Source: http://www.thottbot.com/?i=27861
-- Source: http://wow.allakhazam.com/item.html?witem=16919
-- * Modified spell 1
-- 1.12 spell 18029 (Increases healing done by spells and effects by up to 35.)
-- 1.04 spell 9414 (Increases damage done by Shadow spells and effects by up to 14.)
-- STATS CHANGED: Handguards of Transcendence (ilevel 76 entry 16920). 2/3 versions
-- CONFLICT:
-- 2005-03-17 05:49:23 to 2005-03-17 05:49:23 (days delta 0) on for example: http://www.thottbot.com/?i=27861
-- 2005-02-07 01:58:06 to 2005-02-28 05:51:07 (days delta 21) on for example: http://wow.allakhazam.com/db/itemset.html?setid=211
-- 2005-02-24 05:09:52 to 2005-02-24 05:09:52 (days delta 0) on for example: http://wow.allakhazam.com/dyn/items/iminlev10.html
-- SPELLS CHANGED: Handguards of Transcendence (ilevel 76 entry 16920). 3 versions
-- Source: http://www.thottbot.com/?i=27861
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=211
-- Source: http://wow.allakhazam.com/dyn/items/iminlev10.html
-- * Modified spell 1
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 25067 (Increases healing done by spells and effects by up to 30.)
-- * Modified spell 2
-- 1.12 spell 9316 (Increases healing done by spells and effects by up to 29.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Halo of Transcendence (ilevel 76 entry 16921). 1/3 versions
-- SPELLS REMOVED: Halo of Transcendence (ilevel 76 entry 16921). 3 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=16921
-- Source: http://www.thottbot.com/?i=27861
-- Source: http://wow.allakhazam.com/dyn/items/iname1.html
-- * Modified spell 1
-- 1.12 spell 18034 (Increases healing done by spells and effects by up to 48.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Leggings of Transcendence (ilevel 76 entry 16922). 2/2 versions
-- CONFLICT:
-- 2005-02-07 01:58:06 to 2005-03-23 20:02:15 (days delta 47) on for example: http://wow.allakhazam.com/db/itemset.html?setid=211
-- 2005-02-23 12:25:35 to 2005-02-23 12:25:35 (days delta 0) on for example: http://wow.allakhazam.com/dyn/items/iminlev7.html
-- SPELLS CHANGED: Leggings of Transcendence (ilevel 76 entry 16922). 2 versions
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=211
-- Source: http://wow.allakhazam.com/dyn/items/iminlev7.html
-- * Modified spell 1
-- 1.12 spell 18033 (Increases healing done by spells and effects by up to 46.)
-- 1.04 spell 25064 (Increases damage done by shadow spells and effects by up to 20.)
-- * Modified spell 2
-- 1.12 spell 21364 (Restores 7 mana per 5 sec.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Robes of Transcendence (ilevel 76 entry 16923). 1/1 versions
-- SPELLS CHANGED: Robes of Transcendence (ilevel 76 entry 16923). 1 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16923
-- * Modified spell 1
-- 1.12 spell 18037 (Increases healing done by spells and effects by up to 57.)
-- 1.04 spell 18031 (Increases healing done by spells and effects by up to 40.)
-- STATS CHANGED: Pauldrons of Transcendence (ilevel 76 entry 16924). 1/2 versions
-- SPELLS CHANGED: Pauldrons of Transcendence (ilevel 76 entry 16924). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev3.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=16924
-- * Modified spell 1
-- 1.12 spell 9315 (Increases healing done by spells and effects by up to 26.)
-- 1.04 spell 9407 (Increases healing done by spells and effects by up to 20.)
-- * Modified spell 2
-- 1.12 spell 0 ()
-- 1.04 spell 7709 (Increases damage done by Shadow spells and effects by up to 10.)
-- STATS CHANGED: Belt of Transcendence (ilevel 76 entry 16925). 1/2 versions
-- SPELLS CHANGED: Belt of Transcendence (ilevel 76 entry 16925). 2 versions
-- Source: http://www.thottbot.com/?i=27861
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=211
-- * Modified spell 1
-- 1.12 spell 9315 (Increases healing done by spells and effects by up to 26.)
-- 1.04 spell 9407 (Increases healing done by spells and effects by up to 20.)
-- STATS CHANGED: Bindings of Transcendence (ilevel 76 entry 16926). 1/3 versions
-- SPELLS REMOVED: Bindings of Transcendence (ilevel 76 entry 16926). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname9.html
-- Source: http://www.thottbot.com/?i=27861
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=211
-- * Modified spell 1
-- 1.12 spell 9318 (Increases healing done by spells and effects by up to 33.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Nemesis Boots (ilevel 76 entry 16927). 1/2 versions
-- SPELLS CHANGED: Nemesis Boots (ilevel 76 entry 16927). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype8.html
-- Source: http://wow.allakhazam.com/item.html?witem=16927
-- * Modified spell 1
-- 1.12 spell 14047 (Increases damage and healing done by magical spells and effects by up to 23.)
-- 1.04 spell 25064 (Increases damage done by shadow spells and effects by up to 20.)
-- STATS CHANGED: Nemesis Gloves (ilevel 76 entry 16928). 2/2 versions
-- CONFLICT:
-- 2005-02-07 02:07:53 to 2005-04-04 21:18:24 (days delta 59) on for example: http://wow.allakhazam.com/db/item.html?witem=16928
-- 2005-02-24 05:57:04 to 2005-02-24 05:57:04 (days delta 0) on for example: http://wow.allakhazam.com/dyn/items/iname10.html
-- SPELLS CHANGED: Nemesis Gloves (ilevel 76 entry 16928). 2 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=16928
-- Source: http://wow.allakhazam.com/dyn/items/iname10.html
-- * Modified spell 1
-- 1.12 spell 21347 (Restores 4 health per 5 sec.)
-- 1.04 spell 25065 (Increases damage done by fire spells and effects by up to 20.)
-- * Modified spell 2
-- 1.12 spell 9344 (Increases damage and healing done by magical spells and effects by up to 15.)
-- 1.04 spell 0 ()
-- * Modified spell 3
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Nemesis Skullcap (ilevel 76 entry 16929). 2/2 versions
-- CONFLICT:
-- 2005-02-07 02:07:53 to 2005-04-04 22:06:24 (days delta 59) on for example: http://wow.allakhazam.com/item.html?witem=16929
-- 2005-02-23 02:06:35 to 2005-02-25 04:19:45 (days delta 2) on for example: http://wow.allakhazam.com/dyn/items/iname1.html
-- SPELLS CHANGED: Nemesis Skullcap (ilevel 76 entry 16929). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16929
-- Source: http://wow.allakhazam.com/dyn/items/iname1.html
-- * Modified spell 1
-- 1.12 spell 21347 (Restores 4 health per 5 sec.)
-- 1.04 spell 18011 (Increases damage done by Shadow spells and effects by up to 30.)
-- * Modified spell 2
-- 1.12 spell 17367 (Increases damage and healing done by magical spells and effects by up to 32.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Nemesis Leggings (ilevel 76 entry 16930). 1/2 versions
-- SPELLS CHANGED: Nemesis Leggings (ilevel 76 entry 16930). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16930
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- * Modified spell 1
-- 1.12 spell 18055 (Increases damage and healing done by magical spells and effects by up to 39.)
-- 1.04 spell 17869 (Increases damage done by Fire spells and effects by up to 30.)
-- STATS CHANGED: Nemesis Robes (ilevel 76 entry 16931). 1/1 versions
-- SPELLS CHANGED: Nemesis Robes (ilevel 76 entry 16931). 1 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16931
-- * Modified spell 1
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 25064 (Increases damage done by shadow spells and effects by up to 20.)
-- * Modified spell 2
-- 1.12 spell 17367 (Increases damage and healing done by magical spells and effects by up to 32.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Nemesis Spaulders (ilevel 76 entry 16932). 1/1 versions
-- SPELLS REMOVED: Nemesis Spaulders (ilevel 76 entry 16932). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype3.html
-- * Modified spell 1
-- 1.12 spell 21347 (Restores 4 health per 5 sec.)
-- 1.04 spell 0 ()
-- * Modified spell 2
-- 1.12 spell 14047 (Increases damage and healing done by magical spells and effects by up to 23.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Nemesis Belt (ilevel 76 entry 16933). 1/1 versions
-- SPELLS REMOVED: Nemesis Belt (ilevel 76 entry 16933). 1 versions
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=212
-- * Modified spell 1
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 0 ()
-- * Modified spell 2
-- 1.12 spell 15715 (Increases damage and healing done by magical spells and effects by up to 25.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Nemesis Bracers (ilevel 76 entry 16934). 1/1 versions
-- SPELLS CHANGED: Nemesis Bracers (ilevel 76 entry 16934). 1 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16934
-- * Modified spell 1
-- 1.12 spell 9344 (Increases damage and healing done by magical spells and effects by up to 15.)
-- 1.04 spell 9414 (Increases damage done by Shadow spells and effects by up to 14.)
-- STATS CHANGED: Dragonstalker's Bracers (ilevel 76 entry 16935). 2/2 versions
-- CONFLICT:
-- 2005-02-22 12:35:06 to 2005-03-18 17:17:33 (days delta 27) on for example: http://wow.allakhazam.com/db/item.html?witem=16935
-- 2005-02-23 11:53:13 to 2005-02-23 11:53:13 (days delta 0) on for example: http://wow.allakhazam.com/dyn/items/itype9.html
-- STATS CHANGED: Dragonstalker's Belt (ilevel 76 entry 16936). 1/1 versions
-- SPELLS CHANGED: Dragonstalker's Belt (ilevel 76 entry 16936). 1 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=16936
-- * Modified spell 1
-- 1.12 spell 7597 (Improves your chance to get a critical strike by 1%.)
-- 1.04 spell 13670 (Increases your chance to dodge an attack by 2%.)
-- STATS CHANGED: Dragonstalker's Spaulders (ilevel 76 entry 16937). 1/1 versions
-- SPELLS REMOVED: Dragonstalker's Spaulders (ilevel 76 entry 16937). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev3.html
-- * Modified spell 1
-- 1.12 spell 15464 (Improves your chance to hit by 1%.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Dragonstalker's Legguards (ilevel 76 entry 16938). 2/2 versions
-- CONFLICT:
-- 2005-02-22 12:35:19 to 2005-03-18 17:17:42 (days delta 27) on for example: http://wow.allakhazam.com/db/item.html?witem=16938
-- 2005-02-22 02:38:41 to 2005-02-23 12:25:35 (days delta 1) on for example: http://wow.allakhazam.com/dyn/items/iname7.html
-- SPELLS REMOVED: Dragonstalker's Legguards (ilevel 76 entry 16938). 2 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=16938
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- * Modified spell 1
-- 1.12 spell 15464 (Improves your chance to hit by 1%.)
-- 1.04 spell 0 ()
-- * Modified spell 2
-- 1.12 spell 7597 (Improves your chance to get a critical strike by 1%.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Dragonstalker's Helm (ilevel 76 entry 16939). 1/2 versions
-- STATS CHANGED: Dragonstalker's Gauntlets (ilevel 76 entry 16940). 1/1 versions
-- SPELLS REMOVED: Dragonstalker's Gauntlets (ilevel 76 entry 16940). 1 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16940
-- * Modified spell 1
-- 1.12 spell 7597 (Improves your chance to get a critical strike by 1%.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Dragonstalker's Greaves (ilevel 76 entry 16941). 2/2 versions
-- CONFLICT:
-- 2005-02-23 01:41:33 to 2005-04-06 13:24:43 (days delta 45) on for example: http://wow.allakhazam.com/dyn/items/iname8.html
-- 2005-02-22 12:35:30 to 2005-03-18 17:17:49 (days delta 27) on for example: http://wow.allakhazam.com/db/item.html?witem=16941
-- Warning: UNRESOLVED conflict
-- STATS CHANGED: Dragonstalker's Breastplate (ilevel 76 entry 16942). 1/2 versions
-- SPELLS CHANGED: Dragonstalker's Breastplate (ilevel 76 entry 16942). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev5.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=16942
-- * Modified spell 1
-- 1.12 spell 7597 (Improves your chance to get a critical strike by 1%.)
-- 1.04 spell 15464 (Improves your chance to hit by 1%.)
-- STATS CHANGED: Bracers of Ten Storms (ilevel 76 entry 16943). 2/3 versions
-- CONFLICT:
-- 2005-03-02 04:21:04 to 2005-03-24 05:00:42 (days delta 22) on for example: http://wow.allakhazam.com/dyn/items/iname9.html
-- 2005-03-17 05:48:38 to 2005-03-17 05:48:38 (days delta 0) on for example: http://www.thottbot.com/?i=27850
-- 2005-01-16 03:12:45 to 2005-02-07 02:36:28 (days delta 22) on for example: http://wow.allakhazam.com/dyn/items/itype9.html
-- Warning: UNRESOLVED conflict
-- SPELLS CHANGED: Bracers of Ten Storms (ilevel 76 entry 16943). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname9.html
-- Source: http://www.thottbot.com/?i=27850
-- Source: http://wow.allakhazam.com/dyn/items/itype9.html
-- * Modified spell 1
-- 1.12 spell 18379 (Restores 6 mana per 5 sec.)
-- 1.04 spell 7696 (Increases damage done by Nature spells and effects by up to 10.)
-- STATS CHANGED: Belt of Ten Storms (ilevel 76 entry 16944). 2/3 versions
-- CONFLICT:
-- 2005-03-18 17:17:59 to 2005-03-18 17:17:59 (days delta 0) on for example: http://wow.allakhazam.com/db/item.html?witem=16944
-- 2005-03-17 05:48:38 to 2005-03-17 05:48:38 (days delta 0) on for example: http://www.thottbot.com/?i=27850
-- 2005-02-07 02:36:28 to 2005-02-07 02:36:28 (days delta 0) on for example: http://wow.allakhazam.com/db/itemset.html?setid=216
-- SPELLS CHANGED: Belt of Ten Storms (ilevel 76 entry 16944). 3 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=16944
-- Source: http://www.thottbot.com/?i=27850
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=216
-- * Modified spell 1
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 18031 (Increases healing done by spells and effects by up to 40.)
-- * Modified spell 2
-- 1.12 spell 9315 (Increases healing done by spells and effects by up to 26.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Epaulets of Ten Storms (ilevel 76 entry 16945). 3/3 versions
-- CONFLICT:
-- 2005-02-22 00:27:41 to 2005-03-18 17:18:02 (days delta 27) on for example: http://wow.allakhazam.com/db/item.html?witem=16945
-- 2005-02-25 05:05:45 to 2005-03-15 03:54:16 (days delta 21) on for example: http://wow.allakhazam.com/dyn/items/iname3.html
-- 2005-02-07 02:36:28 to 2005-02-15 11:03:57 (days delta 8) on for example: http://wow.allakhazam.com/dyn/items/iname3.html
-- Warning: UNRESOLVED conflict
-- SPELLS CHANGED: Epaulets of Ten Storms (ilevel 76 entry 16945). 3 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=16945
-- Source: http://wow.allakhazam.com/dyn/items/iname3.html
-- Source: http://wow.allakhazam.com/dyn/items/iname3.html
-- * Modified spell 1
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 9407 (Increases healing done by spells and effects by up to 20.)
-- STATS CHANGED: Legplates of Ten Storms (ilevel 76 entry 16946). 3/3 versions
-- CONFLICT:
-- 2005-02-23 12:24:14 to 2005-03-18 17:18:06 (days delta 26) on for example: http://wow.allakhazam.com/item.html?witem=16946
-- 2005-02-22 02:38:41 to 2005-02-23 11:53:09 (days delta 1) on for example: http://wow.allakhazam.com/dyn/items/iname7.html
-- 2005-02-07 02:36:28 to 2005-02-15 11:03:16 (days delta 8) on for example: http://wow.allakhazam.com/dyn/items/iname7.html
-- SPELLS CHANGED: Legplates of Ten Storms (ilevel 76 entry 16946). 3 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16946
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- * Modified spell 1
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 7678 (Increases healing done by spells and effects by up to 9.)
-- * Modified spell 2
-- 1.12 spell 13881 (Increases damage and healing done by magical spells and effects by up to 29.)
-- 1.04 spell 23480 (Increases damage done by Fire spells and effects by up to 10.)
-- STATS CHANGED: Helmet of Ten Storms (ilevel 76 entry 16947). 2/2 versions
-- CONFLICT:
-- 2005-02-17 23:21:51 to 2005-03-18 17:18:10 (days delta 32) on for example: http://wow.allakhazam.com/item.html?witem=16947
-- 2005-01-16 02:23:48 to 2005-02-15 11:02:56 (days delta 30) on for example: http://wow.allakhazam.com/dyn/items/iname1.html
-- Warning: UNRESOLVED conflict
-- SPELLS CHANGED: Helmet of Ten Storms (ilevel 76 entry 16947). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16947
-- Source: http://wow.allakhazam.com/dyn/items/iname1.html
-- * Modified spell 1
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 25065 (Increases damage done by fire spells and effects by up to 20.)
-- * Modified spell 2
-- 1.12 spell 9415 (Increases damage and healing done by magical spells and effects by up to 9.)
-- 1.04 spell 9360 (Increases damage done by Nature spells and effects by up to 20.)
-- * Modified spell 3
-- 1.12 spell 9406 (Increases healing done by spells and effects by up to 18.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Gauntlets of Ten Storms (ilevel 76 entry 16948). 2/2 versions
-- CONFLICT:
-- 2005-02-22 00:27:45 to 2005-03-18 17:18:13 (days delta 27) on for example: http://wow.allakhazam.com/db/item.html?witem=16948
-- 2005-02-07 02:36:28 to 2005-02-07 02:36:28 (days delta 0) on for example: http://wow.allakhazam.com/db/itemset.html?setid=216
-- SPELLS CHANGED: Gauntlets of Ten Storms (ilevel 76 entry 16948). 2 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=16948
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=216
-- * Modified spell 1
-- 1.12 spell 21626 (Restores 6 mana per 5 sec.)
-- 1.04 spell 9407 (Increases healing done by spells and effects by up to 20.)
-- * Modified spell 2
-- 1.12 spell 9398 (Increases damage and healing done by magical spells and effects by up to 8.)
-- 1.04 spell 9411 (Increases damage done by Nature spells and effects by up to 14.)
-- * Modified spell 3
-- 1.12 spell 7681 (Increases healing done by spells and effects by up to 15.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Greaves of Ten Storms (ilevel 76 entry 16949). 2/3 versions
-- CONFLICT:
-- 2005-02-23 03:12:23 to 2005-04-06 14:47:39 (days delta 45) on for example: http://wow.allakhazam.com/dyn/items/itype8.html
-- 2005-03-17 05:48:38 to 2005-03-17 05:48:38 (days delta 0) on for example: http://www.thottbot.com/?i=27850
-- 2005-02-07 02:36:28 to 2005-02-15 11:03:31 (days delta 8) on for example: http://wow.allakhazam.com/dyn/items/iname8.html
-- SPELLS CHANGED: Greaves of Ten Storms (ilevel 76 entry 16949). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype8.html
-- Source: http://www.thottbot.com/?i=27850
-- Source: http://wow.allakhazam.com/dyn/items/iname8.html
-- * Modified spell 1
-- 1.12 spell 14799 (Increases damage and healing done by magical spells and effects by up to 20.)
-- 1.04 spell 9307 (Increases damage done by Frost spells and effects by up to 20.)
-- STATS CHANGED: Breastplate of Ten Storms (ilevel 76 entry 16950). 2/4 versions
-- CONFLICT:
-- 2005-02-17 08:58:01 to 2005-03-18 17:18:22 (days delta 32) on for example: http://wow.allakhazam.com/item.html?witem=16950
-- 2005-02-24 01:16:42 to 2005-02-25 05:27:10 (days delta 1) on for example: http://wow.allakhazam.com/dyn/items/iname5.html
-- 2005-01-13 05:25:35 to 2005-02-17 08:58:58 (days delta 35) on for example: http://wow.allakhazam.com/dyn/items/iname5.html
-- 2005-02-07 02:36:28 to 2005-02-07 02:36:28 (days delta 0) on for example: http://wow.allakhazam.com/db/itemset.html?setid=216
-- Warning: UNRESOLVED conflict
-- SPELLS CHANGED: Breastplate of Ten Storms (ilevel 76 entry 16950). 4 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16950
-- Source: http://wow.allakhazam.com/dyn/items/iname5.html
-- Source: http://wow.allakhazam.com/dyn/items/iname5.html
-- Source: http://wow.allakhazam.com/db/itemset.html?setid=216
-- * Modified spell 1
-- 1.12 spell 14047 (Increases damage and healing done by magical spells and effects by up to 23.)
-- 1.04 spell 9407 (Increases healing done by spells and effects by up to 20.)
-- * Modified spell 2
-- 1.12 spell 0 ()
-- 1.04 spell 7703 (Increases damage done by Frost spells and effects by up to 10.)
-- STATS CHANGED: Judgement Bindings (ilevel 76 entry 16951). 2/2 versions
-- CONFLICT:
-- 2005-02-07 02:38:42 to 2005-03-18 17:18:26 (days delta 42) on for example: http://wow.allakhazam.com/db/item.html?witem=16951
-- 2005-02-23 11:53:13 to 2005-02-23 11:53:13 (days delta 0) on for example: http://wow.allakhazam.com/dyn/items/itype9.html
-- SPELLS REMOVED: Judgement Bindings (ilevel 76 entry 16951). 2 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=16951
-- Source: http://wow.allakhazam.com/dyn/items/itype9.html
-- * Modified spell 1
-- 1.12 spell 9397 (Increases damage and healing done by magical spells and effects by up to 7.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Judgement Belt (ilevel 76 entry 16952). 1/2 versions
-- SPELLS REMOVED: Judgement Belt (ilevel 76 entry 16952). 2 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=16952
-- Source: http://thottbot.com/?l=latest
-- * Modified spell 1
-- 1.12 spell 14047 (Increases damage and healing done by magical spells and effects by up to 23.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Judgement Spaulders (ilevel 76 entry 16953). 1/1 versions
-- SPELLS REMOVED: Judgement Spaulders (ilevel 76 entry 16953). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev3.html
-- * Modified spell 1
-- 1.12 spell 21363 (Restores 5 mana per 5 sec.)
-- 1.04 spell 0 ()
-- * Modified spell 2
-- 1.12 spell 9342 (Increases damage and healing done by magical spells and effects by up to 13.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Judgement Legplates (ilevel 76 entry 16954). 1/1 versions
-- SPELLS CHANGED: Judgement Legplates (ilevel 76 entry 16954). 1 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16954
-- * Modified spell 1
-- 1.12 spell 14799 (Increases damage and healing done by magical spells and effects by up to 20.)
-- 1.04 spell 25067 (Increases healing done by spells and effects by up to 30.)
-- * Modified spell 2
-- 1.12 spell 21362 (Restores 4 mana per 5 sec.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Judgement Crown (ilevel 76 entry 16955). 2/2 versions
-- CONFLICT:
-- 2005-02-07 02:38:42 to 2005-03-01 11:52:19 (days delta 25) on for example: http://wow.allakhazam.com/item.html?witem=16955
-- 2005-02-25 03:28:41 to 2005-02-25 03:28:41 (days delta 0) on for example: http://wow.allakhazam.com/dyn/items/iminlev1.html
-- SPELLS CHANGED: Judgement Crown (ilevel 76 entry 16955). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16955
-- Source: http://wow.allakhazam.com/dyn/items/iminlev1.html
-- * Modified spell 1
-- 1.12 spell 17367 (Increases damage and healing done by magical spells and effects by up to 32.)
-- 1.04 spell 18031 (Increases healing done by spells and effects by up to 40.)
-- STATS CHANGED: Judgement Gauntlets (ilevel 76 entry 16956). 2/2 versions
-- CONFLICT:
-- 2005-02-07 02:38:42 to 2005-03-18 17:18:42 (days delta 42) on for example: http://wow.allakhazam.com/db/item.html?witem=16956
-- 2005-02-24 05:09:52 to 2005-02-24 05:09:52 (days delta 0) on for example: http://wow.allakhazam.com/dyn/items/iminlev10.html
-- SPELLS CHANGED: Judgement Gauntlets (ilevel 76 entry 16956). 2 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=16956
-- Source: http://wow.allakhazam.com/dyn/items/iminlev10.html
-- * Modified spell 1
-- 1.12 spell 21626 (Restores 6 mana per 5 sec.)
-- 1.04 spell 25067 (Increases healing done by spells and effects by up to 30.)
-- * Modified spell 2
-- 1.12 spell 9344 (Increases damage and healing done by magical spells and effects by up to 15.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Judgement Sabatons (ilevel 76 entry 16957). 2/3 versions
-- CONFLICT:
-- 2005-04-03 23:56:47 to 2005-04-06 13:24:43 (days delta 3) on for example: http://wow.allakhazam.com/dyn/items/iminlev8.html
-- 2005-04-04 05:43:42 to 2005-04-04 05:43:42 (days delta 0) on for example: http://wow.allakhazam.com/db/item.html?witem=16957
-- 2005-02-07 02:38:42 to 2005-03-18 17:18:46 (days delta 42) on for example: http://wow.allakhazam.com/db/item.html?witem=16957
-- SPELLS REMOVED: Judgement Sabatons (ilevel 76 entry 16957). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev8.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=16957
-- Source: http://wow.allakhazam.com/db/item.html?witem=16957
-- * Modified spell 1
-- 1.12 spell 9346 (Increases damage and healing done by magical spells and effects by up to 18.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Judgement Breastplate (ilevel 76 entry 16958). 1/2 versions
-- SPELLS REMOVED: Judgement Breastplate (ilevel 76 entry 16958). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev5.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=16958
-- * Modified spell 1
-- 1.12 spell 21363 (Restores 5 mana per 5 sec.)
-- 1.04 spell 0 ()
-- * Modified spell 2
-- 1.12 spell 15715 (Increases damage and healing done by magical spells and effects by up to 25.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Bracelets of Wrath (ilevel 76 entry 16959). 1/2 versions
-- STATS CHANGED: Waistband of Wrath (ilevel 76 entry 16960). 1/1 versions
-- SPELLS CHANGED: Waistband of Wrath (ilevel 76 entry 16960). 1 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=16960
-- * Modified spell 1
-- 1.12 spell 13676 (Increases your chance to block attacks with a shield by 3%.)
-- 1.04 spell 13674 (Increases your chance to block attacks with a shield by 1%.)
-- * Modified spell 2
-- 1.12 spell 13385 (Increased Defense +7.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Pauldrons of Wrath (ilevel 76 entry 16961). 2/2 versions
-- CONFLICT:
-- 2005-02-07 02:48:46 to 2005-02-27 12:47:30 (days delta 20) on for example: http://wow.allakhazam.com/item.html?witem=16961
-- 2005-02-22 12:13:20 to 2005-02-22 12:13:20 (days delta 0) on for example: http://wow.allakhazam.com/dyn/items/itype3.html
-- SPELLS REMOVED: Pauldrons of Wrath (ilevel 76 entry 16961). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16961
-- Source: http://wow.allakhazam.com/dyn/items/itype3.html
-- * Modified spell 1
-- 1.12 spell 23516 (Increases the block value of your shield by 27.)
-- 1.04 spell 0 ()
-- * Modified spell 2
-- 1.12 spell 13385 (Increased Defense +7.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Legplates of Wrath (ilevel 76 entry 16962). 1/2 versions
-- SPELLS CHANGED: Legplates of Wrath (ilevel 76 entry 16962). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16962
-- Source: http://wow.allakhazam.com/dyn/items/iname7.html
-- * Modified spell 1
-- 1.12 spell 13670 (Increases your chance to dodge an attack by 2%.)
-- 1.04 spell 13669 (Increases your chance to dodge an attack by 1%.)
-- * Modified spell 2
-- 1.12 spell 18185 (Increased Defense +11.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Helm of Wrath (ilevel 76 entry 16963). 1/2 versions
-- SPELLS CHANGED: Helm of Wrath (ilevel 76 entry 16963). 2 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=16963
-- Source: http://wow.allakhazam.com/dyn/items/iname1.html
-- * Modified spell 1
-- 1.12 spell 18185 (Increased Defense +11.)
-- 1.04 spell 7597 (Improves your chance to get a critical strike by 1%.)
-- STATS CHANGED: Gauntlets of Wrath (ilevel 76 entry 16964). 2/2 versions
-- CONFLICT:
-- 2005-02-04 05:54:11 to 2005-02-28 05:51:18 (days delta 24) on for example: http://wow.allakhazam.com/item.html?witem=16964
-- 2005-02-24 05:57:04 to 2005-02-24 05:57:04 (days delta 0) on for example: http://wow.allakhazam.com/dyn/items/iname10.html
-- SPELLS CHANGED: Gauntlets of Wrath (ilevel 76 entry 16964). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=16964
-- Source: http://wow.allakhazam.com/dyn/items/iname10.html
-- * Modified spell 1
-- 1.12 spell 13665 (Increases your chance to parry an attack by 1%.)
-- 1.04 spell 15464 (Improves your chance to hit by 1%.)
-- * Modified spell 2
-- 1.12 spell 13385 (Increased Defense +7.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Sabatons of Wrath (ilevel 76 entry 16965). 1/2 versions
-- SPELLS REMOVED: Sabatons of Wrath (ilevel 76 entry 16965). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname8.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=16965
-- * Modified spell 1
-- 1.12 spell 23515 (Increases the block value of your shield by 14.)
-- 1.04 spell 0 ()
-- * Modified spell 2
-- 1.12 spell 13385 (Increased Defense +7.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Breastplate of Wrath (ilevel 76 entry 16966). 1/2 versions
-- SPELLS REMOVED: Breastplate of Wrath (ilevel 76 entry 16966). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname5.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=16966
-- * Modified spell 1
-- 1.12 spell 18185 (Increased Defense +11.)
-- 1.04 spell 0 ()
-- NOT FOUND: Juno's Shadow (ilevel 58 entry 17061)
-- NOT FOUND: Band of Accuria (ilevel 78 entry 17063)
-- SPELLS REMOVED: Shard of the Scale (ilevel 71 entry 17064). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname12.html
-- * Modified spell 1
-- 1.12 spell 23212 (Restores 16 mana per 5 sec.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Medallion of Steadfast Might (ilevel 68 entry 17065). 1/2 versions
-- SPELLS CHANGED: Medallion of Steadfast Might (ilevel 68 entry 17065). 2 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=17065
-- Source: http://wow.allakhazam.com/dyn/items/iminlev2.html
-- * Modified spell 2
-- 1.12 spell 13387 (Increased Defense +8.)
-- 1.04 spell 21408 (Increased Defense +12.)
-- STATS CHANGED: Drillborer Disk (ilevel 67 entry 17066). 2/2 versions
-- CONFLICT:
-- 2005-02-28 10:47:18 to 2005-02-28 10:47:18 (days delta 0) on for example: http://wow.allakhazam.com/item.html?witem=17066
-- 2005-02-25 04:35:55 to 2005-02-25 05:54:53 (days delta 0) on for example: http://wow.allakhazam.com/dyn/items/iname14.html
-- SPELLS CHANGED: Drillborer Disk (ilevel 67 entry 17066). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=17066
-- Source: http://wow.allakhazam.com/dyn/items/iname14.html
-- * Modified spell 3
-- 1.12 spell 22852 (Increases the block value of your shield by 23.)
-- 1.04 spell 0 ()
-- NOT FOUND: Ancient Cornerstone Grimoire (ilevel 76 entry 17067)
-- DAMAGE CHANGED: Deathbringer (ilevel 75 entry 17068). 1/3 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=17068
-- Source: http://wow.allakhazam.com/dyn/items/wminlev0.html
-- Source: http://wow.allakhazam.com/dyn/items/itype13.html
-- SPELLS CHANGED: Deathbringer (ilevel 75 entry 17068). 3 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=17068
-- Source: http://wow.allakhazam.com/dyn/items/wminlev0.html
-- Source: http://wow.allakhazam.com/dyn/items/itype13.html
-- * Modified spell 1
-- 1.12 spell 18138 (Sends a shadowy bolt at the enemy causing 110 to 141 Shadow damage.)
-- 1.04 spell 21141 (Sends a shadowy bolt at the enemy causing 50 Shadow damage and dealing 10 damage every 3 sec for 30 sec.)
-- DAMAGE CHANGED: Striker's Mark (ilevel 69 entry 17069). 1/3 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=17069
-- Source: http://wow.allakhazam.com/dyn/items/wratio2.html
-- Source: http://thottbot.com/?l=latest
-- SPELLS CHANGED: Striker's Mark (ilevel 69 entry 17069). 3 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=17069
-- Source: http://wow.allakhazam.com/dyn/items/wratio2.html
-- Source: http://thottbot.com/?l=latest
-- * Modified spell 1
-- 1.12 spell 9332 (+22 Attack Power.)
-- 1.04 spell 9331 (+20 Attack Power.)
-- SPELLS REMOVED: Fang of the Mystics (ilevel 70 entry 17070). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/wratio15.html
-- * Modified spell 1
-- 1.12 spell 18384 (Improves your chance to get a critical strike with spells by 1%.)
-- 1.04 spell 0 ()
-- * Modified spell 2
-- 1.12 spell 21362 (Restores 4 mana per 5 sec.)
-- 1.04 spell 0 ()
-- * Modified spell 3
-- 1.12 spell 18056 (Increases damage and healing done by magical spells and effects by up to 40.)
-- 1.04 spell 0 ()
-- STATS REMOVED for item Blastershot Launcher (http://wow.allakhazam.com/item.html?witem=17072) 
-- DAMAGE CHANGED: Blastershot Launcher (ilevel 70 entry 17072). 1/1 versions
-- Source: http://wow.allakhazam.com/item.html?witem=17072
-- DAMAGE CHANGED: Earthshaker (ilevel 66 entry 17073). 1/2 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=17073
-- Source: http://wow.allakhazam.com/dyn/items/wname5.html
-- SPELLS CHANGED: Earthshaker (ilevel 66 entry 17073). 2 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=17073
-- Source: http://wow.allakhazam.com/dyn/items/wname5.html
-- * Modified spell 2
-- 1.12 spell 9332 (+22 Attack Power.)
-- 1.04 spell 0 ()
-- DAMAGE CHANGED: Shadowstrike (ilevel 63 entry 17074). 1/2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname17.html
-- Source: http://wow.allakhazam.com/dyn/items/wname6.html
-- SPELLS REMOVED: Vis'kag the Bloodletter (ilevel 74 entry 17075). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/wname7.html
-- Source: http://wow.allakhazam.com/dyn/items/iminlev13.html
-- * Modified spell 1
-- 1.12 spell 21140 (Delivers a fatal wound for 240 damage.)
-- 1.04 spell 0 ()
-- NOT FOUND: Bonereaver's Edge (ilevel 77 entry 17076)
-- STATS CHANGED: Sapphiron Drape (ilevel 72 entry 17078). 2/2 versions
-- CONFLICT:
-- 2005-03-01 11:52:40 to 2005-03-18 17:18:54 (days delta 17) on for example: http://wow.allakhazam.com/db/item.html?witem=17078
-- 2005-02-23 01:14:34 to 2005-02-24 05:18:14 (days delta 1) on for example: http://wow.allakhazam.com/dyn/items/iminlev16.html
-- SPELLS CHANGED: Sapphiron Drape (ilevel 72 entry 17078). 2 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=17078
-- Source: http://wow.allakhazam.com/dyn/items/iminlev16.html
-- * Modified spell 1
-- 1.12 spell 9343 (Increases damage and healing done by magical spells and effects by up to 14.)
-- 1.04 spell 9397 (Increases damage and healing done by magical spells and effects by up to 7.)
-- SPELLS REMOVED: Shard of the Flame (ilevel 74 entry 17082). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname12.html
-- * Modified spell 1
-- 1.12 spell 23210 (Restores 16 health per 5 sec.)
-- 1.04 spell 0 ()
-- NOT FOUND: Cloak of the Shrouded Mists (ilevel 74 entry 17102)
-- STATS CHANGED: Azuresong Mageblade (ilevel 71 entry 17103). 2/2 versions
-- CONFLICT:
-- 2005-02-18 01:43:14 to 2005-04-01 01:41:30 (days delta 45) on for example: http://wow.allakhazam.com/dyn/items/wminlev7.html
-- 2005-02-24 21:12:00 to 2005-02-25 17:32:46 (days delta 1) on for example: http://wow.allakhazam.com/db/item.html?witem=17103
-- DAMAGE CHANGED: Azuresong Mageblade (ilevel 71 entry 17103). 1/2 versions
-- Source: http://wow.allakhazam.com/dyn/items/wminlev7.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=17103
-- SPELLS CHANGED: Azuresong Mageblade (ilevel 71 entry 17103). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/wminlev7.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=17103
-- * Modified spell 2
-- 1.12 spell 18056 (Increases damage and healing done by magical spells and effects by up to 40.)
-- 1.04 spell 0 ()
-- NOT FOUND: Spinal Reaper (ilevel 76 entry 17104)
-- STATS CHANGED: Aurastone Hammer (ilevel 69 entry 17105). 1/3 versions
-- DAMAGE CHANGED: Aurastone Hammer (ilevel 69 entry 17105). 1/3 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname13.html
-- Source: http://wow.allakhazam.com/dyn/items/wname4.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=17105
-- SPELLS CHANGED: Aurastone Hammer (ilevel 69 entry 17105). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname13.html
-- Source: http://wow.allakhazam.com/dyn/items/wname4.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=17105
-- * Modified spell 1
-- 1.12 spell 21363 (Restores 5 mana per 5 sec.)
-- 1.04 spell 21618 (Restores 4 mana per 5 sec.)
-- * Modified spell 2
-- 1.12 spell 15715 (Increases damage and healing done by magical spells and effects by up to 25.)
-- 1.04 spell 0 ()
-- NOT FOUND: Malistar's Defender (ilevel 75 entry 17106)
-- NOT FOUND: Dragon's Blood Cape (ilevel 73 entry 17107)
-- STATS CHANGED: Choker of Enlightenment (ilevel 65 entry 17109). 1/2 versions
-- SPELLS CHANGED: Choker of Enlightenment (ilevel 65 entry 17109). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname2.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=17109
-- * Modified spell 1
-- 1.12 spell 9346 (Increases damage and healing done by magical spells and effects by up to 18.)
-- 1.04 spell 12854 (Decreases mana cost to all spells by 25.)
-- STATS CHANGED: Seal of the Archmagus (ilevel 70 entry 17110). 2/2 versions
-- CONFLICT:
-- 2005-02-27 20:17:28 to 2005-03-18 17:18:58 (days delta 22) on for example: http://wow.allakhazam.com/db/item.html?witem=17110
-- 2005-02-23 02:20:49 to 2005-02-24 06:05:40 (days delta 1) on for example: http://wow.allakhazam.com/dyn/items/iname11.html
-- SPELLS CHANGED: Seal of the Archmagus (ilevel 70 entry 17110). 2 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=17110
-- Source: http://wow.allakhazam.com/dyn/items/iname11.html
-- * Modified spell 1
-- 1.12 spell 21361 (Restores 3 mana per 5 sec.)
-- 1.04 spell 21623 (Restores 2 mana per 5 sec.)
-- NOT FOUND: Blazefury Medallion (ilevel 68 entry 17111)
-- DAMAGE CHANGED: Amberseal Keeper (ilevel 67 entry 17113). 1/1 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=17113
-- SPELLS CHANGED: Amberseal Keeper (ilevel 67 entry 17113). 1 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=17113
-- * Modified spell 2
-- 1.12 spell 17493 (Increases damage and healing done by magical spells and effects by up to 44.)
-- 1.04 spell 9415 (Increases damage and healing done by magical spells and effects by up to 9.)
-- NOT FOUND: Sulfuras, Hand of Ragnaros (ilevel 80 entry 17182)
-- NOT FOUND: Sulfuron Hammer (ilevel 67 entry 17193)
-- SPELLS REMOVED: Thunderstrike (ilevel 63 entry 17223). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname17.html
-- * Modified spell 1
-- 1.12 spell 21179 (Blasts up to 3 targets for 150 to 251 Nature damage. Each target after the first takes less damage.)
-- 1.04 spell 0 ()
-- * Modified spell 2
-- 1.12 spell 21181 (Transforms Thunderstrike into Shadowstrike.)
-- 1.04 spell 0 ()
-- NOT FOUND: Knight-Lieutenant's Dreadweave Boots (ilevel 63 entry 17562)
-- NOT FOUND: Knight-Lieutenant's Dreadweave Gloves (ilevel 63 entry 17564)
-- NOT FOUND: Lieutenant Commander's Headguard (ilevel 63 entry 17566)
-- NOT FOUND: Knight-Captain's Dreadweave Leggings (ilevel 63 entry 17567)
-- NOT FOUND: Knight-Captain's Dreadweave Robe (ilevel 63 entry 17568)
-- NOT FOUND: Lieutenant Commander's Dreadweave Mantle (ilevel 63 entry 17569)
-- NOT FOUND: Champion's Dreadweave Hood (ilevel 63 entry 17570)
-- NOT FOUND: Legionnaire's Dreadweave Leggings (ilevel 63 entry 17571)
-- NOT FOUND: Legionnaire's Dreadweave Robe (ilevel 63 entry 17572)
-- NOT FOUND: Champion's Dreadweave Shoulders (ilevel 63 entry 17573)
-- NOT FOUND: Blood Guard's Dreadweave Boots (ilevel 63 entry 17576)
-- NOT FOUND: Blood Guard's Dreadweave Gloves (ilevel 63 entry 17577)
-- NOT FOUND: Field Marshal's Coronal (ilevel 74 entry 17578)
-- NOT FOUND: Marshal's Dreadweave Leggings (ilevel 71 entry 17579)
-- NOT FOUND: Field Marshal's Dreadweave Shoulders (ilevel 74 entry 17580)
-- NOT FOUND: Field Marshal's Dreadweave Robe (ilevel 74 entry 17581)
-- NOT FOUND: Marshal's Dreadweave Boots (ilevel 71 entry 17583)
-- NOT FOUND: Marshal's Dreadweave Gloves (ilevel 71 entry 17584)
-- NOT FOUND: General's Dreadweave Boots (ilevel 71 entry 17586)
-- NOT FOUND: General's Dreadweave Gloves (ilevel 71 entry 17588)
-- NOT FOUND: Warlord's Dreadweave Mantle (ilevel 74 entry 17590)
-- NOT FOUND: Warlord's Dreadweave Hood (ilevel 74 entry 17591)
-- NOT FOUND: Warlord's Dreadweave Robe (ilevel 74 entry 17592)
-- NOT FOUND: General's Dreadweave Pants (ilevel 71 entry 17593)
-- NOT FOUND: Knight-Lieutenant's Satin Boots (ilevel 63 entry 17594)
-- NOT FOUND: Knight-Lieutenant's Satin Gloves (ilevel 63 entry 17596)
-- NOT FOUND: Lieutenant Commander's Diadem (ilevel 63 entry 17598)
-- NOT FOUND: Knight-Captain's Satin Leggings (ilevel 63 entry 17599)
-- NOT FOUND: Knight-Captain's Satin Robes (ilevel 63 entry 17600)
-- NOT FOUND: Lieutenant Commander's Satin Amice (ilevel 63 entry 17601)
-- NOT FOUND: Field Marshal's Headdress (ilevel 74 entry 17602)
-- NOT FOUND: Marshal's Satin Pants (ilevel 71 entry 17603)
-- NOT FOUND: Field Marshal's Satin Mantle (ilevel 74 entry 17604)
-- NOT FOUND: Field Marshal's Satin Vestments (ilevel 74 entry 17605)
-- NOT FOUND: Marshal's Satin Sandals (ilevel 71 entry 17607)
-- NOT FOUND: Marshal's Satin Gloves (ilevel 71 entry 17608)
-- NOT FOUND: Champion's Satin Cowl (ilevel 63 entry 17610)
-- NOT FOUND: Legionnaire's Satin Trousers (ilevel 63 entry 17611)
-- NOT FOUND: Legionnaire's Satin Vestments (ilevel 63 entry 17612)
-- NOT FOUND: Champion's Satin Shoulderpads (ilevel 63 entry 17613)
-- NOT FOUND: Blood Guard's Satin Boots (ilevel 63 entry 17616)
-- NOT FOUND: Blood Guard's Satin Gloves (ilevel 63 entry 17617)
-- NOT FOUND: General's Satin Boots (ilevel 71 entry 17618)
-- NOT FOUND: General's Satin Gloves (ilevel 71 entry 17620)
-- NOT FOUND: Warlord's Satin Mantle (ilevel 74 entry 17622)
-- NOT FOUND: Warlord's Satin Cowl (ilevel 74 entry 17623)
-- NOT FOUND: Warlord's Satin Robes (ilevel 74 entry 17624)
-- NOT FOUND: General's Satin Leggings (ilevel 71 entry 17625)
-- NOT FOUND: Frostwolf Insignia Rank 1 (ilevel 60 entry 17690)
-- NOT FOUND: Stormpike Insignia Rank 1 (ilevel 60 entry 17691)
-- SPELLS CHANGED: Gloves of the Greatfather (ilevel 38 entry 17721). 3 versions
-- Source: http://www.thottbot.com/?i=19479 / http://wow.allakhazam.com/db/item.html?witem=17721
-- Source: http://www.thottbot.com/?i=19479
-- Source: http://wow.allakhazam.com/dyn/items/iminlev10.html
-- * Modified spell 1
-- 1.12 spell 9406 (Increases healing done by spells and effects by up to 18.)
-- 1.04 spell 7681 (Increases healing done by spells and effects by up to 15.)
-- * Modified spell 2
-- 1.12 spell 7696 (Increases damage done by Nature spells and effects by up to 10.)
-- 1.04 spell 7694 (Increases damage done by Nature spells and effects by up to 7.)
-- SPELLS CHANGED: Helm of the Mountain (ilevel 53 entry 17734). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname1.html
-- Source: http://www.thottbot.com/?i=Helm%20of%20the%20Mountain
-- Source: http://wow.allakhazam.com/db/item.html?witem=17734
-- * Modified spell 1
-- 1.12 spell 13385 (Increased Defense +7.)
-- 1.04 spell 13390 (Increased Defense +10.)
-- WARNING: NOT FOUND FOR DESC "Restores 8 mana to the player every 5 seconds." (guessed 5694)
-- SPELLS CHANGED: Nature's Embrace (ilevel 51 entry 17741). 3 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname20.html
-- Source: http://www.thottbot.com/?i=Nature%27s%20Embrace
-- Source: http://wow.allakhazam.com/db/item.html?witem=17741
-- Warning: UNSURE DATA
-- * Modified spell 1
-- 1.12 spell 21518 (Increases damage done by Holy spells and effects by up to 29.)
-- 1.04 spell 21513 (Increases damage done by Holy spells and effects by up to 21.)
-- SPELLS CHANGED: Resurgence Rod (ilevel 53 entry 17743). 5 versions
-- Source: http://wow.allakhazam.com/db/quest.html?wquest=7065
-- Source: http://wow.allakhazam.com/dyn/items/wminlev10.html
-- Source: http://www.thottbot.com/?i=19544
-- Source: http://www.thottbot.com/?i=19543
-- Source: http://wow.allakhazam.com/item.html?witem=17743
-- * Modified spell 2
-- 1.12 spell 20969 (Restores 5 health every 5 sec.)
-- 1.04 spell 21345 (Restores 2 health per 5 sec.)
-- DAMAGE CHANGED: Blade of Eternal Darkness (ilevel 54 entry 17780). 1/2 versions
-- Source: http://wow.allakhazam.com/dyn/items/wratio15.html
-- Source: http://wow.allakhazam.com/item.html?witem=17780
-- NOT FOUND: Stormpike Insignia Rank 2 (ilevel 60 entry 17900)
-- NOT FOUND: Stormpike Insignia Rank 3 (ilevel 60 entry 17901)
-- NOT FOUND: Stormpike Insignia Rank 4 (ilevel 60 entry 17902)
-- NOT FOUND: Stormpike Insignia Rank 5 (ilevel 60 entry 17903)
-- NOT FOUND: Stormpike Insignia Rank 6 (ilevel 60 entry 17904)
-- NOT FOUND: Frostwolf Insignia Rank 2 (ilevel 60 entry 17905)
-- NOT FOUND: Frostwolf Insignia Rank 3 (ilevel 60 entry 17906)
-- NOT FOUND: Frostwolf Insignia Rank 4 (ilevel 60 entry 17907)
-- NOT FOUND: Frostwolf Insignia Rank 5 (ilevel 60 entry 17908)
-- NOT FOUND: Frostwolf Insignia Rank 6 (ilevel 60 entry 17909)
-- SPELLS REMOVED: Fist of Stone (ilevel 53 entry 17943). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev21.html
-- * Modified spell 1
-- 1.12 spell 21951 (Restores 50 mana.)
-- 1.04 spell 0 ()
-- NOT FOUND: Ragnaros Core (ilevel 65 entry 17982)
-- NOT FOUND: Royal Seal of Alexis (ilevel 62 entry 18022)
-- STATS CHANGED: Coal Miner Boots (ilevel 57 entry 18043). 1/1 versions
-- QUALITY CHANGED: Coal Miner Boots (ilevel 57 entry 18043)
-- STATS CHANGED: Hurley's Tankard (ilevel 57 entry 18044). 1/1 versions
-- DAMAGE CHANGED: Hurley's Tankard (ilevel 57 entry 18044). 1/1 versions
-- Source: http://wow.allakhazam.com/item.html?witem=18044
-- QUALITY CHANGED: Hurley's Tankard (ilevel 57 entry 18044)
-- STATS CHANGED: Flame Walkers (ilevel 62 entry 18047). 1/1 versions
-- SPELLS REMOVED: Flame Walkers (ilevel 62 entry 18047). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype8.html
-- * Modified spell 1
-- 1.12 spell 13669 (Increases your chance to dodge an attack by 1%.)
-- 1.04 spell 0 ()
-- STATS CHANGED: Mastersmith's Hammer (ilevel 60 entry 18048). 1/2 versions
-- DAMAGE CHANGED: Mastersmith's Hammer (ilevel 60 entry 18048). 1/2 versions
-- Source: http://wow.allakhazam.com/dyn/items/wname4.html
-- Source: http://wow.allakhazam.com/item.html?witem=18048
-- SPELLS CHANGED: Mastersmith's Hammer (ilevel 60 entry 18048). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/wname4.html
-- Source: http://wow.allakhazam.com/item.html?witem=18048
-- * Modified spell 1
-- 1.12 spell 9343 (Increases damage and healing done by magical spells and effects by up to 14.)
-- 1.04 spell 7686 (Increases damage done by Fire spells and effects by up to 6.)
-- QUALITY CHANGED: Mastersmith's Hammer (ilevel 60 entry 18048)
-- SPELLS CHANGED: Zum'rah's Vexing Cane (ilevel 47 entry 18082). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=18082
-- Source: http://wow.allakhazam.com/dyn/items/wminlev10.html
-- * Modified spell 1
-- 1.12 spell 14248 (Increases damage and healing done by magical spells and effects by up to 21.)
-- 1.04 spell 9417 (Increases damage and healing done by magical spells and effects by up to 12.)
-- NOT FOUND: Jumanza Grips (ilevel 47 entry 18083)
-- SPELLS REMOVED: Dragonrider Boots (ilevel 63 entry 18102). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname8.html
-- * Modified spell 1
-- 1.12 spell 9346 (Increases damage and healing done by magical spells and effects by up to 18.)
-- 1.04 spell 0 ()
-- NOT FOUND: Band of Rumination (ilevel 63 entry 18103)
-- NOT FOUND: Feralsurge Girdle (ilevel 63 entry 18104)
-- NOT FOUND: Force Reactive Disk (ilevel 65 entry 18168)
-- NOT FOUND: Eskhandar's Left Claw (ilevel 66 entry 18202)
-- NOT FOUND: Eskhandar's Right Claw (ilevel 66 entry 18203)
-- NOT FOUND: Eskhandar's Pelt (ilevel 66 entry 18204)
-- NOT FOUND: Eskhandar's Collar (ilevel 71 entry 18205)
-- STATS CHANGED: Drape of Benediction (ilevel 67 entry 18208). 1/1 versions
-- SPELLS CHANGED: Drape of Benediction (ilevel 67 entry 18208). 1 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=18208
-- * Modified spell 1
-- 1.12 spell 9317 (Increases healing done by spells and effects by up to 31.)
-- 1.04 spell 9407 (Increases healing done by spells and effects by up to 20.)
-- SPELLS REMOVED: Core Marksman Rifle (ilevel 65 entry 18282). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/wname3.html
-- * Modified spell 1
-- 1.12 spell 21434 (+22 ranged Attack Power.)
-- 1.04 spell 0 ()
-- * Modified spell 2
-- 1.12 spell 15464 (Improves your chance to hit by 1%.)
-- 1.04 spell 0 ()
-- SPELLS CHANGED: Barbed Thorn Necklace (ilevel 56 entry 18289). 1 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=18289
-- * Modified spell 1
-- 1.12 spell 9358 (Increases damage done by Nature spells and effects by up to 17.)
-- 1.04 spell 9409 (Increases damage done by Nature spells and effects by up to 11.)
-- SPELLS CHANGED: Unbridled Leggings (ilevel 56 entry 18298). 1 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=18298
-- * Modified spell 1
-- 1.12 spell 21601 (Restores 7 health per 5 sec.)
-- 1.04 spell 21596 (Restores 5 health per 5 sec.)
-- SPELLS CHANGED: Lethtendris's Wand (ilevel 58 entry 18301). 1 versions
-- Source: http://wow.allakhazam.com/item.html?witem=18301
-- * Modified spell 1
-- 1.12 spell 9415 (Increases damage and healing done by magical spells and effects by up to 9.)
-- 1.04 spell 9395 (Increases damage and healing done by magical spells and effects by up to 5.)
-- NOT FOUND: Band of Vigor (ilevel 58 entry 18302)
-- NOT FOUND: Breakwater Legguards (ilevel 58 entry 18305)
-- NOT FOUND: Gloves of Shadowy Mist (ilevel 58 entry 18306)
-- SPELLS REMOVED: Riptide Shoes (ilevel 58 entry 18307). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev8.html
-- * Modified spell 1
-- 1.12 spell 9306 (Increases damage done by Frost spells and effects by up to 19.)
-- 1.04 spell 0 ()
-- NOT FOUND: Gloves of Restoration (ilevel 59 entry 18309)
-- SPELLS REMOVED: Energized Chestplate (ilevel 59 entry 18312). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev5.html
-- * Modified spell 1
-- 1.12 spell 21363 (Restores 5 mana per 5 sec.)
-- 1.04 spell 0 ()
-- NOT FOUND: Helm of Awareness (ilevel 58 entry 18313)
-- NOT FOUND: Ring of Demonic Potency (ilevel 59 entry 18315)
-- SPELLS REMOVED: Merciful Greaves (ilevel 59 entry 18318). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname8.html
-- * Modified spell 1
-- 1.12 spell 9407 (Increases healing done by spells and effects by up to 20.)
-- 1.04 spell 0 ()
-- SPELLS CHANGED: Energetic Rod (ilevel 59 entry 18321). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev21.html
-- Source: http://wow.allakhazam.com/item.html?witem=18321
-- * Modified spell 1
-- 1.12 spell 9343 (Increases damage and healing done by magical spells and effects by up to 14.)
-- 1.04 spell 25109 (Increases damage and healing done by magical spells and effects by up to 8.)
-- SPELLS CHANGED: Waterspout Boots (ilevel 58 entry 18322). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname8.html
-- * Modified spell 1
-- 1.12 spell 15715 (Increases damage and healing done by magical spells and effects by up to 25.)
-- 1.04 spell 25110 (Increases damage and healing done by magical spells and effects by up to 16.)
-- NOT FOUND: Satyr's Bow (ilevel 58 entry 18323)
-- NOT FOUND: Felhide Cap (ilevel 58 entry 18325)
-- NOT FOUND: Razor Gauntlets (ilevel 59 entry 18326)
-- NOT FOUND: Whipvine Cord (ilevel 59 entry 18327)
-- NOT FOUND: Orphic Bracers (ilevel 59 entry 18337)
-- SPELLS CHANGED: Wand of Arcane Potency (ilevel 59 entry 18338). 1 versions
-- Source: http://wow.allakhazam.com/item.html?witem=18338
-- * Modified spell 1
-- 1.12 spell 13601 (Increases damage done by Arcane spells and effects by up to 16.)
-- 1.04 spell 13597 (Increases damage done by Arcane spells and effects by up to 11.)
-- NOT FOUND: Eidolon Cloak (ilevel 59 entry 18339)
-- NOT FOUND: Eidolon Talisman (ilevel 59 entry 18340)
-- NOT FOUND: Petrified Band (ilevel 59 entry 18343)
-- NOT FOUND: Gauntlets of Accuracy (ilevel 61 entry 18349)
-- NOT FOUND: Amplifying Cloak (ilevel 61 entry 18350)
-- SPELLS REMOVED: Magically Sealed Bracers (ilevel 61 entry 18351). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname9.html
-- * Modified spell 1
-- 1.12 spell 7516 (Increased Defense +3.)
-- 1.04 spell 0 ()
-- NOT FOUND: Petrified Bark Shield (ilevel 61 entry 18352)
-- SPELLS REMOVED: Pimgib's Collar (ilevel 60 entry 18354). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev12.html
-- * Modified spell 1
-- 1.12 spell 22855 (Increases the damage of your Imp's Firebolt spell by 8.)
-- 1.04 spell 0 ()
-- NOT FOUND: Gordok's Gloves (ilevel 60 entry 18368)
-- NOT FOUND: Gordok's Handwraps (ilevel 60 entry 18369)
-- SPELLS REMOVED: Vigilance Charm (ilevel 62 entry 18370). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev12.html
-- * Modified spell 1
-- 1.12 spell 13670 (Increases your chance to dodge an attack by 2%.)
-- 1.04 spell 0 ()
-- NOT FOUND: Mindtap Talisman (ilevel 61 entry 18371)
-- SPELLS REMOVED: Blade of the New Moon (ilevel 62 entry 18372). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/wminlev15.html
-- * Modified spell 1
-- 1.12 spell 9326 (Increases damage done by Shadow spells and effects by up to 19.)
-- 1.04 spell 0 ()
-- NOT FOUND: Chestplate of Tranquility (ilevel 62 entry 18373)
-- NOT FOUND: Flamescarred Shoulders (ilevel 62 entry 18374)
-- SPELLS REMOVED: Bracers of the Eclipse (ilevel 62 entry 18375). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname9.html
-- * Modified spell 1
-- 1.12 spell 14027 (+24 Attack Power.)
-- 1.04 spell 0 ()
-- NOT FOUND: Quickdraw Gloves (ilevel 62 entry 18377)
-- NOT FOUND: Silvermoon Leggings (ilevel 62 entry 18378)
-- SPELLS REMOVED: Odious Greaves (ilevel 62 entry 18379). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype8.html
-- * Modified spell 1
-- 1.12 spell 9332 (+22 Attack Power.)
-- 1.04 spell 0 ()
-- NOT FOUND: Eldritch Reinforced Legplates (ilevel 62 entry 18380)
-- NOT FOUND: Evil Eye Pendant (ilevel 62 entry 18381)
-- NOT FOUND: Force Imbued Gauntlets (ilevel 61 entry 18383)
-- NOT FOUND: Bile-etched Spaulders (ilevel 62 entry 18384)
-- SPELLS CHANGED: Robe of Everlasting Night (ilevel 62 entry 18385). 1 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=18385
-- * Modified spell 1
-- 1.12 spell 14054 (Increases damage and healing done by magical spells and effects by up to 27.)
-- 1.04 spell 14254 (Increases damage and healing done by magical spells and effects by up to 19.)
-- NOT FOUND: Padre's Trousers (ilevel 61 entry 18386)
-- NOT FOUND: Brightspark Gloves (ilevel 60 entry 18387)
-- NOT FOUND: Stoneshatter (ilevel 62 entry 18388)
-- SPELLS CHANGED: Cloak of the Cosmos (ilevel 62 entry 18389). 1 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=18389
-- * Modified spell 1
-- 1.12 spell 9315 (Increases healing done by spells and effects by up to 26.)
-- 1.04 spell 23796 (Increases healing done by spells and effects by up to 24.)
-- SPELLS CHANGED: Eyestalk Cord (ilevel 62 entry 18391). 1 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=18391
-- * Modified spell 1
-- 1.12 spell 18029 (Increases healing done by spells and effects by up to 35.)
-- 1.04 spell 9317 (Increases healing done by spells and effects by up to 31.)
-- NOT FOUND: Warpwood Binding (ilevel 61 entry 18393)
-- SPELLS REMOVED: Demon Howl Wristguards (ilevel 62 entry 18394). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname9.html
-- * Modified spell 1
-- 1.12 spell 9142 (+14 Attack Power.)
-- 1.04 spell 0 ()
-- NOT FOUND: Emerald Flame Ring (ilevel 62 entry 18395)
-- SPELLS CHANGED: Mind Carver (ilevel 62 entry 18396). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/wminlev7.html
-- Source: http://wow.allakhazam.com/item.html?witem=18396
-- * Modified spell 1
-- 1.12 spell 9417 (Increases damage and healing done by magical spells and effects by up to 12.)
-- 1.04 spell 9397 (Increases damage and healing done by magical spells and effects by up to 7.)
-- NOT FOUND: Tidal Loop (ilevel 63 entry 18398)
-- NOT FOUND: Ring of Living Stone (ilevel 57 entry 18400)
-- NOT FOUND: Onyxia Tooth Pendant (ilevel 74 entry 18404)
-- SPELLS REMOVED: Onyxia Blood Talisman (ilevel 74 entry 18406). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname12.html
-- * Modified spell 1
-- 1.12 spell 13665 (Increases your chance to parry an attack by 1%.)
-- 1.04 spell 0 ()
-- * Modified spell 2
-- 1.12 spell 13387 (Increased Defense +8.)
-- 1.04 spell 0 ()
-- * Modified spell 3
-- 1.12 spell 21601 (Restores 7 health per 5 sec.)
-- 1.04 spell 0 ()
-- SPELLS CHANGED: Felcloth Gloves (ilevel 62 entry 18407). 1 versions
-- Source: http://www.thottbot.com/?i=35889
-- * Modified spell 1
-- 1.12 spell 18013 (Increases damage done by Shadow spells and effects by up to 33.)
-- 1.04 spell 18009 (Increases damage done by Shadow spells and effects by up to 27.)
-- SPELLS CHANGED: Inferno Gloves (ilevel 62 entry 18408). 1 versions
-- Source: http://www.thottbot.com/?i=10062
-- * Modified spell 1
-- 1.12 spell 17871 (Increases damage done by Fire spells and effects by up to 33.)
-- 1.04 spell 17868 (Increases damage done by Fire spells and effects by up to 27.)
-- SPELLS REMOVED: Spry Boots (ilevel 57 entry 18411). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype8.html
-- * Modified spell 1
-- 1.12 spell 13669 (Increases your chance to dodge an attack by 1%.)
-- 1.04 spell 0 ()
-- SPELLS CHANGED: Cloak of Warding (ilevel 62 entry 18413). 2 versions
-- Source: http://www.thottbot.com/?i=419 / http://wow.allakhazam.com/db/item.html?witem=18413
-- Source: http://www.thottbot.com/?i=35977
-- * Modified spell 1
-- 1.12 spell 7518 (Increased Defense +5.)
-- 1.04 spell 13386 (Increased Defense +7.)
-- NOT FOUND: Bonecrusher (ilevel 63 entry 18420)
-- NOT FOUND: Backwood Helm (ilevel 63 entry 18421)
-- NOT FOUND: Kreeg's Mug (ilevel 60 entry 18425)
-- NOT FOUND: Sergeant's Cloak (ilevel 35 entry 18427)
-- NOT FOUND: Senior Sergeant's Insignia (ilevel 50 entry 18428)
-- NOT FOUND: First Sergeant's Plate Bracers (ilevel 50 entry 18430)
-- NOT FOUND: First Sergeant's Mail Wristguards (ilevel 50 entry 18432)
-- STATS CHANGED: First Sergeant's Leather Armguards (ilevel 50 entry 18435). 1/1 versions
-- NOT FOUND: First Sergeant's Dragonhide Armguards (ilevel 50 entry 18436)
-- NOT FOUND: First Sergeant's Silk Cuffs (ilevel 50 entry 18437)
-- NOT FOUND: Sergeant Major's Chain Armguards (ilevel 63 entry 18448)
-- NOT FOUND: Robe of Combustion (ilevel 60 entry 18450)
-- NOT FOUND: Hyena Hide Belt (ilevel 60 entry 18451)
-- NOT FOUND: Sergeant Major's Leather Armsplints (ilevel 63 entry 18452)
-- NOT FOUND: Sergeant Major's Dragonhide Armsplints (ilevel 63 entry 18454)
-- STATS CHANGED: Sergeant Major's Silk Cuffs (ilevel 63 entry 18456). 1/1 versions
-- SPELLS REMOVED: Modest Armguards (ilevel 60 entry 18458). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname9.html
-- * Modified spell 1
-- 1.12 spell 9417 (Increases damage and healing done by magical spells and effects by up to 12.)
-- 1.04 spell 0 ()
-- SPELLS REMOVED: Gallant's Wristguards (ilevel 60 entry 18459). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname9.html
-- * Modified spell 1
-- 1.12 spell 9316 (Increases healing done by spells and effects by up to 29.)
-- 1.04 spell 0 ()
-- NOT FOUND: Gordok Nose Ring (ilevel 60 entry 18464)
-- SPELLS CHANGED: Royal Seal of Eldre'Thalas (ilevel 62 entry 18465). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname12.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=18471
-- * Modified spell 1
-- 1.12 spell 15465 (Improves your chance to hit by 2%.)
-- 1.04 spell 9344 (Increases damage and healing done by magical spells and effects by up to 15.)
-- NOT FOUND: Royal Seal of Eldre'Thalas (ilevel 62 entry 18466)
-- SPELLS REMOVED: Royal Seal of Eldre'Thalas (ilevel 62 entry 18467). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname12.html
-- * Modified spell 1
-- 1.12 spell 14047 (Increases damage and healing done by magical spells and effects by up to 23.)
-- 1.04 spell 0 ()
-- NOT FOUND: Royal Seal of Eldre'Thalas (ilevel 62 entry 18468)
-- SPELLS REMOVED: Royal Seal of Eldre'Thalas (ilevel 62 entry 18469). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname12.html
-- * Modified spell 1
-- 1.12 spell 9318 (Increases healing done by spells and effects by up to 33.)
-- 1.04 spell 0 ()
-- * Modified spell 2
-- 1.12 spell 21618 (Restores 4 mana per 5 sec.)
-- 1.04 spell 0 ()
-- NOT FOUND: Royal Seal of Eldre'Thalas (ilevel 62 entry 18470)
-- SPELLS REMOVED: Royal Seal of Eldre'Thalas (ilevel 62 entry 18471). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname12.html
-- * Modified spell 1
-- 1.12 spell 14047 (Increases damage and healing done by magical spells and effects by up to 23.)
-- 1.04 spell 0 ()
-- NOT FOUND: Royal Seal of Eldre'Thalas (ilevel 62 entry 18472)
-- SPELLS REMOVED: Royal Seal of Eldre'Thalas (ilevel 62 entry 18473). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname12.html
-- * Modified spell 1
-- 1.12 spell 21445 (+48 ranged Attack Power.)
-- 1.04 spell 0 ()
-- NOT FOUND: Oddly Magical Belt (ilevel 60 entry 18475)
-- SPELLS CHANGED: Carrion Scorpid Helm (ilevel 60 entry 18479). 1 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=18479
-- * Modified spell 1
-- 1.12 spell 18049 (Increases damage and healing done by magical spells and effects by up to 26.)
-- 1.04 spell 9346 (Increases damage and healing done by magical spells and effects by up to 18.)
-- NOT FOUND: Scarab Plate Helm (ilevel 60 entry 18480)
-- DAMAGE CHANGED: Ogre Toothpick Shooter (ilevel 60 entry 18482). 1/2 versions
-- Source: http://wow.allakhazam.com/dyn/items/wname2.html
-- Source: http://wow.allakhazam.com/db/item.html?witem=18482
-- NOT FOUND: Observer's Shield (ilevel 61 entry 18485)
-- NOT FOUND: Insightful Hood (ilevel 61 entry 18490)
-- NOT FOUND: Bulky Iron Spaulders (ilevel 60 entry 18493)
-- NOT FOUND: Denwatcher's Shoulders (ilevel 60 entry 18494)
-- SPELLS CHANGED: Redoubt Cloak (ilevel 63 entry 18495). 1 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=18495
-- * Modified spell 1
-- 1.12 spell 13385 (Increased Defense +7.)
-- 1.04 spell 13390 (Increased Defense +10.)
-- SPELLS REMOVED: Sublime Wristguards (ilevel 60 entry 18497). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname9.html
-- * Modified spell 1
-- 1.12 spell 9417 (Increases damage and healing done by magical spells and effects by up to 12.)
-- 1.04 spell 0 ()
-- SPELLS CHANGED: Monstrous Glaive (ilevel 62 entry 18502). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=18502
-- Source: http://wow.allakhazam.com/dyn/items/wname6.html
-- * Modified spell 2
-- 1.12 spell 13385 (Increased Defense +7.)
-- 1.04 spell 13390 (Increased Defense +10.)
-- SPELLS REMOVED: Kromcrush's Chestplate (ilevel 62 entry 18503). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iminlev5.html
-- * Modified spell 1
-- 1.12 spell 13390 (Increased Defense +10.)
-- 1.04 spell 0 ()
-- NOT FOUND: Mugger's Belt (ilevel 62 entry 18505)
-- SPELLS REMOVED: Boots of the Full Moon (ilevel 62 entry 18507). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype8.html
-- * Modified spell 1
-- 1.12 spell 9315 (Increases healing done by spells and effects by up to 26.)
-- 1.04 spell 0 ()
-- NOT FOUND: Hide of the Wild (ilevel 62 entry 18510)
-- SPELLS REMOVED: Grimy Metal Boots (ilevel 63 entry 18521). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/itype8.html
-- * Modified spell 1
-- 1.12 spell 13669 (Increases your chance to dodge an attack by 1%.)
-- 1.04 spell 0 ()
-- NOT FOUND: Band of the Ogre King (ilevel 63 entry 18522)
-- SPELLS CHANGED: Brightly Glowing Stone (ilevel 63 entry 18523). 1 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=18523
-- * Modified spell 1
-- 1.12 spell 18030 (Increases healing done by spells and effects by up to 37.)
-- 1.04 spell 9318 (Increases healing done by spells and effects by up to 33.)
-- NOT FOUND: Leggings of Destruction (ilevel 63 entry 18524)
-- SPELLS CHANGED: Bracers of Prosperity (ilevel 63 entry 18525). 1 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname9.html
-- * Modified spell 1
-- 1.12 spell 9408 (Increases healing done by spells and effects by up to 22.)
-- 1.04 spell 9407 (Increases healing done by spells and effects by up to 20.)
-- SPELLS CHANGED: Harmonious Gauntlets (ilevel 63 entry 18527). 1 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=18527
-- * Modified spell 1
-- 1.12 spell 18035 (Increases healing done by spells and effects by up to 51.)
-- 1.04 spell 18033 (Increases healing done by spells and effects by up to 46.)
-- NOT FOUND: Cyclone Spaulders (ilevel 61 entry 18528)
-- SPELLS CHANGED: Unyielding Maul (ilevel 62 entry 18531). 2 versions
-- Source: http://wow.allakhazam.com/dyn/items/iname17.html
-- Source: http://wow.allakhazam.com/dyn/items/wname5.html
-- * Modified spell 1
-- 1.12 spell 13387 (Increased Defense +8.)
-- 1.04 spell 21408 (Increased Defense +12.)
-- SPELLS CHANGED: Rod of the Ogre Magi (ilevel 63 entry 18534). 2 versions
-- Source: http://wow.allakhazam.com/item.html?witem=18534
-- Source: http://wow.allakhazam.com/dyn/items/wminlev10.html
-- * Modified spell 2
-- 1.12 spell 14047 (Increases damage and healing done by magical spells and effects by up to 23.)
-- 1.04 spell 9344 (Increases damage and healing done by magical spells and effects by up to 15.)
-- NOT FOUND: Milli's Shield (ilevel 59 entry 18535)
-- NOT FOUND: Milli's Lexicon (ilevel 59 entry 18536)
-- NOT FOUND: Counterattack Lodestone (ilevel 63 entry 18537)
-- NOT FOUND: Ring of Entropy (ilevel 66 entry 18543)
-- NOT FOUND: Doomhide Gauntlets (ilevel 71 entry 18544)
-- NOT FOUND: Leggings of Arcane Supremacy (ilevel 69 entry 18545)
-- SPELLS CHANGED: Infernal Headcage (ilevel 69 entry 18546). 1 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=18546
-- * Modified spell 1
-- 1.12 spell 9345 (Increases damage and healing done by magical spells and effects by up to 16.)
-- 1.04 spell 9415 (Increases damage and healing done by magical spells and effects by up to 9.)
-- SPELLS CHANGED: Unmelting Ice Girdle (ilevel 71 entry 18547). 1 versions
-- Source: http://wow.allakhazam.com/db/item.html?witem=18547
-- * Modified spell 1
-- 1.12 spell 13387 (Increased Defense +8.)
-- 1.04 spell 21408 (Increased Defense +12.)
-- NOT FOUND: The Twin Blades of Azzinoth (ilevel 100 entry 18582)
-- NOT FOUND: Warglaive of Azzinoth (Right) (ilevel 100 entry 18583)
-- NOT FOUND: Warglaive of Azzinoth (Left) (ilevel 100 entry 18584)
-- NOT FOUND: Tome of Sacrifice (ilevel 60 entry 18602)
-- NOT FOUND: Benediction (ilevel 75 entry 18608)
-- NOT FOUND: Anathema (ilevel 75 entry 18609)
-- NOT FOUND: Keen Machete (ilevel 6 entry 18610)
-- NOT FOUND: Gnarlpine Leggings (ilevel 7 entry 18611)
-- NOT FOUND: Bloody Chain Boots (ilevel 8 entry 18612)
-- NOT FOUND: Gyrofreeze Ice Reflector (ilevel 52 entry 18634)
-- NOT FOUND: Major Recombobulator (ilevel 55 entry 18637)
-- NOT FOUND: Hyper-Radiant Flame Reflector (ilevel 58 entry 18638)
-- NOT FOUND: Ultra-Flash Shadow Reflector (ilevel 60 entry 18639)
-- NOT FOUND: The Eye of Divinity (ilevel 71 entry 18646)
-- NOT FOUND: The Eye of Shadow (ilevel 71 entry 18665)
-- NOT FOUND: Baron Charr's Sceptre (ilevel 59 entry 18671)
-- NOT FOUND: Elemental Ember (ilevel 59 entry 18672)
-- NOT FOUND: Avalanchion's Stony Hide (ilevel 59 entry 18673)
-- NOT FOUND: Hardened Stone Band (ilevel 59 entry 18674)
-- NOT FOUND: Sash of the Windreaver (ilevel 61 entry 18676)
-- NOT FOUND: Zephyr Cloak (ilevel 61 entry 18677)
-- NOT FOUND: Tempestria's Frozen Necklace (ilevel 61 entry 18678)
-- NOT FOUND: Frigid Ring (ilevel 61 entry 18679)
-- NOT FOUND: Ancient Bone Bow (ilevel 61 entry 18680)
-- NOT FOUND: Burial Shawl (ilevel 61 entry 18681)
-- NOT FOUND: Ghoul Skin Leggings (ilevel 61 entry 18682)
-- NOT FOUND: Hammer of the Vesper (ilevel 61 entry 18683)
-- NOT FOUND: Bone Golem Shoulders (ilevel 62 entry 18686)
-- NOT FOUND: Phantasmal Cloak (ilevel 62 entry 18689)
-- NOT FOUND: Wraithplate Leggings (ilevel 62 entry 18690)
-- NOT FOUND: Dark Advisor's Pendant (ilevel 61 entry 18691)
-- NOT FOUND: Death Knight Sabatons (ilevel 59 entry 18692)
-- NOT FOUND: Shivery Handwraps (ilevel 62 entry 18693)
-- NOT FOUND: Shadowy Mail Greaves (ilevel 62 entry 18694)
-- NOT FOUND: Spellbound Tome (ilevel 62 entry 18695)
-- NOT FOUND: Intricately Runed Shield (ilevel 62 entry 18696)
-- NOT FOUND: Coldstone Slippers (ilevel 55 entry 18697)
-- NOT FOUND: Tattered Leather Hood (ilevel 56 entry 18698)
-- NOT FOUND: Icy Tomb Spaulders (ilevel 57 entry 18699)
-- NOT FOUND: Malefic Bracers (ilevel 58 entry 18700)
-- NOT FOUND: Innervating Band (ilevel 59 entry 18701)
-- NOT FOUND: Belt of the Ordained (ilevel 60 entry 18702)
-- NOT FOUND: Arena Wristguards (ilevel 50 entry 18709)
-- NOT FOUND: Arena Bracers (ilevel 50 entry 18710)
-- NOT FOUND: Arena Bands (ilevel 50 entry 18711)
-- NOT FOUND: Arena Vambraces (ilevel 50 entry 18712)
-- NOT FOUND: Rhok'delar, Longbow of the Ancient Keepers (ilevel 75 entry 18713)
-- NOT FOUND: Lok'delar, Stave of the Ancient Keepers (ilevel 75 entry 18715)
-- NOT FOUND: Ash Covered Boots (ilevel 61 entry 18716)
-- NOT FOUND: Hammer of the Grand Crusader (ilevel 63 entry 18717)
-- NOT FOUND: Grand Crusader's Helm (ilevel 63 entry 18718)
-- NOT FOUND: Shroud of the Nathrezim (ilevel 63 entry 18720)
-- NOT FOUND: Barrage Girdle (ilevel 61 entry 18721)
-- NOT FOUND: Death Grips (ilevel 62 entry 18722)
-- NOT FOUND: Animated Chain Necklace (ilevel 62 entry 18723)
-- NOT FOUND: Peacemaker (ilevel 59 entry 18725)
-- NOT FOUND: Magistrate's Cuffs (ilevel 59 entry 18726)
-- NOT FOUND: Crimson Felt Hat (ilevel 59 entry 18727)
-- NOT FOUND: Anastari Heirloom (ilevel 60 entry 18728)
-- NOT FOUND: Screeching Bow (ilevel 60 entry 18729)
-- NOT FOUND: Shadowy Laced Handwraps (ilevel 60 entry 18730)
-- NOT FOUND: Pale Moon Cloak (ilevel 62 entry 18734)
-- NOT FOUND: Maleki's Footwraps (ilevel 62 entry 18735)
-- NOT FOUND: Plaguehound Leggings (ilevel 62 entry 18736)
-- NOT FOUND: Bone Slicing Hatchet (ilevel 62 entry 18737)
-- NOT FOUND: Carapace Spine Crossbow (ilevel 61 entry 18738)
-- NOT FOUND: Chitinous Plate Legguards (ilevel 61 entry 18739)
-- NOT FOUND: Thuzadin Sash (ilevel 61 entry 18740)
-- NOT FOUND: Morlune's Bracer (ilevel 61 entry 18741)
-- NOT FOUND: Stratholme Militia Shoulderguard (ilevel 60 entry 18742)
-- NOT FOUND: Gracious Cape (ilevel 59 entry 18743)
-- NOT FOUND: Plaguebat Fur Gloves (ilevel 58 entry 18744)
-- NOT FOUND: Sacred Cloth Leggings (ilevel 57 entry 18745)
-- NOT FOUND: Fel Hardened Bracers (ilevel 62 entry 18754)
-- NOT FOUND: Xorothian Firestick (ilevel 62 entry 18755)
-- NOT FOUND: Dreadguard's Protector (ilevel 62 entry 18756)
-- NOT FOUND: Diabolic Mantle (ilevel 62 entry 18757)
-- NOT FOUND: Specter's Blade (ilevel 62 entry 18758)
-- NOT FOUND: Malicious Axe (ilevel 62 entry 18759)
-- NOT FOUND: Necromantic Band (ilevel 62 entry 18760)
-- NOT FOUND: Oblivion's Touch (ilevel 62 entry 18761)
-- NOT FOUND: Shard of the Green Flame (ilevel 54 entry 18762)
-- NOT FOUND: Finkle's Lava Dredger (ilevel 70 entry 18803)
-- NOT FOUND: Core Hound Tooth (ilevel 70 entry 18805)
-- NOT FOUND: Core Forged Greaves (ilevel 70 entry 18806)
-- NOT FOUND: Helm of Latent Power (ilevel 62 entry 18807)
-- NOT FOUND: Gloves of the Hypnotic Flame (ilevel 70 entry 18808)
-- NOT FOUND: Sash of Whispered Secrets (ilevel 71 entry 18809)
-- NOT FOUND: Wild Growth Spaulders (ilevel 71 entry 18810)
-- NOT FOUND: Fireproof Cloak (ilevel 71 entry 18811)
-- NOT FOUND: Wristguards of True Flight (ilevel 71 entry 18812)
-- NOT FOUND: Ring of Binding (ilevel 73 entry 18813)
-- NOT FOUND: Choker of the Fire Lord (ilevel 78 entry 18814)
-- NOT FOUND: Essence of the Pure Flame (ilevel 75 entry 18815)
-- NOT FOUND: Perdition's Blade (ilevel 77 entry 18816)
-- NOT FOUND: Crown of Destruction (ilevel 76 entry 18817)
-- NOT FOUND: Talisman of Ephemeral Power (ilevel 66 entry 18820)
-- NOT FOUND: Quick Strike Ring (ilevel 67 entry 18821)
-- NOT FOUND: Obsidian Edged Blade (ilevel 68 entry 18822)
-- NOT FOUND: Aged Core Leather Gloves (ilevel 69 entry 18823)
-- NOT FOUND: Magma Tempered Boots (ilevel 70 entry 18824)
-- NOT FOUND: Grand Marshal's Aegis (ilevel 78 entry 18825)
-- NOT FOUND: High Warlord's Shield Wall (ilevel 78 entry 18826)
-- NOT FOUND: Grand Marshal's Handaxe (ilevel 78 entry 18827)
-- NOT FOUND: High Warlord's Cleaver (ilevel 78 entry 18828)
-- NOT FOUND: Deep Earth Spaulders (ilevel 71 entry 18829)
-- NOT FOUND: Grand Marshal's Sunderer (ilevel 78 entry 18830)
-- NOT FOUND: High Warlord's Battle Axe (ilevel 78 entry 18831)
-- NOT FOUND: Brutality Blade (ilevel 70 entry 18832)
-- NOT FOUND: Grand Marshal's Bullseye (ilevel 78 entry 18833)
-- NOT FOUND: Insignia of the Horde (ilevel 0 entry 18834)
-- NOT FOUND: High Warlord's Recurve (ilevel 78 entry 18835)
-- NOT FOUND: Grand Marshal's Repeater (ilevel 78 entry 18836)
-- NOT FOUND: High Warlord's Crossbow (ilevel 78 entry 18837)
-- NOT FOUND: Grand Marshal's Dirk (ilevel 78 entry 18838)
-- NOT FOUND: High Warlord's Razor (ilevel 78 entry 18840)
-- NOT FOUND: Staff of Dominance (ilevel 70 entry 18842)
-- NOT FOUND: Grand Marshal's Right Hand Blade (ilevel 78 entry 18843)
-- NOT FOUND: High Warlord's Right Claw (ilevel 78 entry 18844)
-- NOT FOUND: Insignia of the Horde (ilevel 0 entry 18845)
-- NOT FOUND: Insignia of the Horde (ilevel 0 entry 18846)
-- NOT FOUND: Grand Marshal's Left Hand Blade (ilevel 78 entry 18847)
-- NOT FOUND: High Warlord's Left Claw (ilevel 78 entry 18848)
-- NOT FOUND: Insignia of the Horde (ilevel 0 entry 18849)
-- NOT FOUND: Insignia of the Horde (ilevel 0 entry 18850)
-- NOT FOUND: Insignia of the Horde (ilevel 0 entry 18851)
-- NOT FOUND: Insignia of the Horde (ilevel 0 entry 18852)
-- NOT FOUND: Insignia of the Horde (ilevel 0 entry 18853)
-- NOT FOUND: Insignia of the Alliance (ilevel 0 entry 18854)
-- NOT FOUND: Grand Marshal's Hand Cannon (ilevel 78 entry 18855)
-- NOT FOUND: Insignia of the Alliance (ilevel 0 entry 18856)
-- NOT FOUND: Insignia of the Alliance (ilevel 0 entry 18857)
-- NOT FOUND: Insignia of the Alliance (ilevel 0 entry 18858)
-- NOT FOUND: Insignia of the Alliance (ilevel 0 entry 18859)
-- NOT FOUND: High Warlord's Street Sweeper (ilevel 78 entry 18860)
-- NOT FOUND: Flamewaker Legplates (ilevel 61 entry 18861)
-- NOT FOUND: Insignia of the Alliance (ilevel 0 entry 18862)
-- NOT FOUND: Insignia of the Alliance (ilevel 0 entry 18863)
-- NOT FOUND: Insignia of the Alliance (ilevel 0 entry 18864)
-- NOT FOUND: Grand Marshal's Punisher (ilevel 78 entry 18865)
-- NOT FOUND: High Warlord's Bludgeon (ilevel 78 entry 18866)
-- NOT FOUND: Grand Marshal's Battle Hammer (ilevel 78 entry 18867)
-- NOT FOUND: High Warlord's Pulverizer (ilevel 78 entry 18868)
-- NOT FOUND: Grand Marshal's Glaive (ilevel 78 entry 18869)
-- NOT FOUND: Helm of the Lifegiver (ilevel 62 entry 18870)
-- NOT FOUND: High Warlord's Pig Sticker (ilevel 78 entry 18871)
-- NOT FOUND: Manastorm Leggings (ilevel 63 entry 18872)
-- NOT FOUND: Grand Marshal's Stave (ilevel 78 entry 18873)
-- NOT FOUND: High Warlord's War Staff (ilevel 78 entry 18874)
-- NOT FOUND: Salamander Scale Pants (ilevel 64 entry 18875)
-- NOT FOUND: Grand Marshal's Claymore (ilevel 78 entry 18876)
-- NOT FOUND: High Warlord's Greatsword (ilevel 78 entry 18877)
-- NOT FOUND: Sorcerous Dagger (ilevel 65 entry 18878)
-- NOT FOUND: Heavy Dark Iron Ring (ilevel 66 entry 18879)
-- NOT FOUND: Barbaric Bracers (ilevel 32 entry 18948)
-- NOT FOUND: Brushwood Blade (ilevel 10 entry 18957)
-- NOT FOUND: Ring of Critical Testing 2 (ilevel 60 entry 18970)
-- NOT FOUND: Dimensional Ripper - Everlook (ilevel 55 entry 18984)
-- NOT FOUND: Ultrasafe Transporter: Gadgetzan (ilevel 52 entry 18986)
-- NOT FOUND: Thunderfury, Blessed Blade of the Windseeker (ilevel 80 entry 19019)
-- NOT FOUND: Nat Pagle's Extreme Angler FC-5000 (ilevel 50 entry 19022)
-- NOT FOUND: Arena Grand Master (ilevel 55 entry 19024)
-- NOT FOUND: Elegant Dress (ilevel 30 entry 19028)
-- NOT FOUND: Frostwolf Battle Tabard (ilevel 20 entry 19031)
-- NOT FOUND: Stormpike Battle Tabard (ilevel 20 entry 19032)
-- NOT FOUND: Emerald Peak Spaulders (ilevel 48 entry 19037)
-- NOT FOUND: Ring of Subtlety (ilevel 48 entry 19038)
-- NOT FOUND: Zorbin's Water Resistant Hat (ilevel 48 entry 19039)
-- NOT FOUND: Zorbin's Mega-Slicer (ilevel 48 entry 19040)
-- NOT FOUND: Pratt's Handcrafted Tunic (ilevel 48 entry 19041)
-- NOT FOUND: Jangdor's Handcrafted Tunic (ilevel 48 entry 19042)
-- NOT FOUND: Heavy Timbermaw Belt (ilevel 58 entry 19043)
-- NOT FOUND: Might of the Timbermaw (ilevel 58 entry 19044)
-- NOT FOUND: Wisdom of the Timbermaw (ilevel 58 entry 19047)
-- NOT FOUND: Heavy Timbermaw Boots (ilevel 64 entry 19048)
-- NOT FOUND: Timbermaw Brawlers (ilevel 64 entry 19049)
-- NOT FOUND: Mantle of the Timbermaw (ilevel 64 entry 19050)
-- NOT FOUND: Girdle of the Dawn (ilevel 58 entry 19051)
-- NOT FOUND: Dawn Treaders (ilevel 58 entry 19052)
-- NOT FOUND: Argent Boots (ilevel 58 entry 19056)
-- NOT FOUND: Gloves of the Dawn (ilevel 64 entry 19057)
-- NOT FOUND: Golden Mantle of the Dawn (ilevel 64 entry 19058)
-- NOT FOUND: Argent Shoulders (ilevel 64 entry 19059)
-- NOT FOUND: Frostwolf Legionnaire's Cloak (ilevel 60 entry 19083)
-- NOT FOUND: Stormpike Soldier's Cloak (ilevel 60 entry 19084)
-- NOT FOUND: Frostwolf Advisor's Cloak (ilevel 60 entry 19085)
-- NOT FOUND: Stormpike Sage's Cloak (ilevel 60 entry 19086)
-- NOT FOUND: Frostwolf Plate Belt (ilevel 60 entry 19087)
-- NOT FOUND: Frostwolf Mail Belt (ilevel 60 entry 19088)
-- NOT FOUND: Frostwolf Leather Belt (ilevel 60 entry 19089)
-- NOT FOUND: Frostwolf Cloth Belt (ilevel 60 entry 19090)
-- NOT FOUND: Stormpike Plate Girdle (ilevel 60 entry 19091)
-- NOT FOUND: Stormpike Mail Girdle (ilevel 60 entry 19092)
-- NOT FOUND: Stormpike Leather Girdle (ilevel 60 entry 19093)
-- NOT FOUND: Stormpike Cloth Girdle (ilevel 60 entry 19094)
-- NOT FOUND: Frostwolf Legionnaire's Pendant (ilevel 60 entry 19095)
-- NOT FOUND: Frostwolf Advisor's Pendant (ilevel 60 entry 19096)
-- NOT FOUND: Stormpike Soldier's Pendant (ilevel 60 entry 19097)
-- NOT FOUND: Stormpike Sage's Pendant (ilevel 60 entry 19098)
-- NOT FOUND: Glacial Blade (ilevel 65 entry 19099)
-- NOT FOUND: Electrified Dagger (ilevel 65 entry 19100)
-- NOT FOUND: Whiteout Staff (ilevel 65 entry 19101)
-- NOT FOUND: Crackling Staff (ilevel 65 entry 19102)
-- NOT FOUND: Frostbite (ilevel 65 entry 19103)
-- NOT FOUND: Stormstrike Hammer (ilevel 65 entry 19104)
-- NOT FOUND: Frost Runed Headdress (ilevel 63 entry 19105)
-- NOT FOUND: Ice Barbed Spear (ilevel 63 entry 19106)
-- NOT FOUND: Bloodseeker (ilevel 63 entry 19107)
-- NOT FOUND: Wand of Biting Cold (ilevel 63 entry 19108)
-- NOT FOUND: Deep Rooted Ring (ilevel 63 entry 19109)
-- NOT FOUND: Cold Forged Blade (ilevel 63 entry 19110)
-- NOT FOUND: Winteraxe Epaulets (ilevel 63 entry 19111)
-- NOT FOUND: Frozen Steel Vambraces (ilevel 63 entry 19112)
-- NOT FOUND: Yeti Hide Bracers (ilevel 63 entry 19113)
-- NOT FOUND: Highland Bow (ilevel 51 entry 19114)
-- NOT FOUND: Flask of Forest Mojo (ilevel 51 entry 19115)
-- NOT FOUND: Greenleaf Handwraps (ilevel 50 entry 19116)
-- NOT FOUND: Laquered Wooden Plate Legplates (ilevel 50 entry 19117)
-- NOT FOUND: Nature's Breath (ilevel 50 entry 19118)
-- NOT FOUND: Owlbeast Hide Gloves (ilevel 50 entry 19119)
-- NOT FOUND: Rune of the Guard Captain (ilevel 51 entry 19120)
-- NOT FOUND: Deep Woodlands Cloak (ilevel 51 entry 19121)
-- NOT FOUND: Everwarm Handwraps (ilevel 48 entry 19123)
-- NOT FOUND: Slagplate Leggings (ilevel 48 entry 19124)
-- NOT FOUND: Seared Mail Girdle (ilevel 49 entry 19125)
-- NOT FOUND: Slagplate Gauntlets (ilevel 49 entry 19126)
-- NOT FOUND: Charred Leather Tunic (ilevel 50 entry 19127)
-- NOT FOUND: Seared Mail Vest (ilevel 50 entry 19128)
-- NOT FOUND: Cold Snap (ilevel 70 entry 19130)
-- NOT FOUND: Snowblind Shoes (ilevel 69 entry 19131)
-- NOT FOUND: Crystal Adorned Crown (ilevel 68 entry 19132)
-- NOT FOUND: Fel Infused Leggings (ilevel 71 entry 19133)
-- NOT FOUND: Flayed Doomguard Belt (ilevel 68 entry 19134)
-- NOT FOUND: Blacklight Bracer (ilevel 66 entry 19135)
-- NOT FOUND: Mana Igniting Cord (ilevel 71 entry 19136)
-- NOT FOUND: Onslaught Girdle (ilevel 78 entry 19137)
-- NOT FOUND: Band of Sulfuras (ilevel 78 entry 19138)
-- NOT FOUND: Fireguard Shoulders (ilevel 71 entry 19139)
-- NOT FOUND: Cauterizing Band (ilevel 71 entry 19140)
-- NOT FOUND: Luffa (ilevel 50 entry 19141)
-- NOT FOUND: Fire Runed Grimoire (ilevel 70 entry 19142)
-- NOT FOUND: Flameguard Gauntlets (ilevel 69 entry 19143)
-- NOT FOUND: Sabatons of the Flamewalker (ilevel 68 entry 19144)
-- NOT FOUND: Robe of Volatile Power (ilevel 66 entry 19145)
-- NOT FOUND: Wristguards of Stability (ilevel 65 entry 19146)
-- NOT FOUND: Ring of Spell Power (ilevel 66 entry 19147)
-- NOT FOUND: Dark Iron Helm (ilevel 66 entry 19148)
-- NOT FOUND: Lava Belt (ilevel 66 entry 19149)
-- NOT FOUND: Flarecore Robe (ilevel 66 entry 19156)
-- NOT FOUND: Chromatic Gauntlets (ilevel 70 entry 19157)
-- NOT FOUND: Woven Ivy Necklace (ilevel 51 entry 19159)
-- NOT FOUND: Contest Winner's Tabard (ilevel 1 entry 19160)
-- NOT FOUND: Corehound Belt (ilevel 70 entry 19162)
-- NOT FOUND: Molten Belt (ilevel 70 entry 19163)
-- NOT FOUND: Dark Iron Gauntlets (ilevel 70 entry 19164)
-- NOT FOUND: Flarecore Leggings (ilevel 70 entry 19165)
-- NOT FOUND: Black Amnesty (ilevel 66 entry 19166)
-- NOT FOUND: Blackfury (ilevel 66 entry 19167)
-- NOT FOUND: Blackguard (ilevel 70 entry 19168)
-- NOT FOUND: Nightfall (ilevel 70 entry 19169)
-- NOT FOUND: Ebon Hand (ilevel 70 entry 19170)
-- NOT FOUND: Darkmoon Card: Heroism (ilevel 66 entry 19287)
-- NOT FOUND: Darkmoon Card: Blue Dragon (ilevel 66 entry 19288)
-- NOT FOUND: Darkmoon Card: Maelstrom (ilevel 66 entry 19289)
-- NOT FOUND: Darkmoon Card: Twisting Nether (ilevel 66 entry 19290)
-- NOT FOUND: Last Month's Mutton (ilevel 34 entry 19292)
-- NOT FOUND: Last Year's Mutton (ilevel 55 entry 19293)
-- NOT FOUND: Darkmoon Flower (ilevel 20 entry 19295)
-- NOT FOUND: Darkmoon Ring (ilevel 55 entry 19302)
-- NOT FOUND: Darkmoon Necklace (ilevel 55 entry 19303)
-- NOT FOUND: Tome of Arcane Domination (ilevel 65 entry 19308)
-- NOT FOUND: Tome of Shadow Force (ilevel 65 entry 19309)
-- NOT FOUND: Tome of the Ice Lord (ilevel 65 entry 19310)
-- NOT FOUND: Tome of Fiery Arcana (ilevel 65 entry 19311)
-- NOT FOUND: Lei of the Lifegiver (ilevel 65 entry 19312)
-- NOT FOUND: Therazane's Touch (ilevel 65 entry 19315)
-- NOT FOUND: The Immovable Object (ilevel 65 entry 19321)
-- NOT FOUND: The Unstoppable Force (ilevel 65 entry 19323)
-- NOT FOUND: The Lobotomizer (ilevel 65 entry 19324)
-- NOT FOUND: Don Julio's Band (ilevel 65 entry 19325)
-- NOT FOUND: The Untamed Blade (ilevel 73 entry 19334)
-- NOT FOUND: Spineshatter (ilevel 73 entry 19335)
-- NOT FOUND: Arcane Infused Gem (ilevel 76 entry 19336)
-- NOT FOUND: The Black Book (ilevel 76 entry 19337)
-- NOT FOUND: Mind Quickening Gem (ilevel 76 entry 19339)
-- NOT FOUND: Rune of Metamorphosis (ilevel 76 entry 19340)
-- NOT FOUND: Lifegiving Gem (ilevel 76 entry 19341)
-- NOT FOUND: Venomous Totem (ilevel 76 entry 19342)
-- NOT FOUND: Scrolls of Blinding Light (ilevel 76 entry 19343)
-- NOT FOUND: Natural Alignment Crystal (ilevel 76 entry 19344)
-- NOT FOUND: Aegis of Preservation (ilevel 76 entry 19345)
-- NOT FOUND: Dragonfang Blade (ilevel 74 entry 19346)
-- NOT FOUND: Claw of Chromaggus (ilevel 77 entry 19347)
-- NOT FOUND: Red Dragonscale Protector (ilevel 74 entry 19348)
-- NOT FOUND: Elementium Reinforced Bulwark (ilevel 77 entry 19349)
-- NOT FOUND: Heartstriker (ilevel 75 entry 19350)
-- NOT FOUND: Maladath, Runed Blade of the Black Flight (ilevel 75 entry 19351)
-- NOT FOUND: Chromatically Tempered Sword (ilevel 77 entry 19352)
-- NOT FOUND: Drake Talon Cleaver (ilevel 75 entry 19353)
-- NOT FOUND: Draconic Avenger (ilevel 71 entry 19354)
-- NOT FOUND: Shadow Wing Focus Staff (ilevel 75 entry 19355)
-- NOT FOUND: Staff of the Shadow Flame (ilevel 81 entry 19356)
-- NOT FOUND: Herald of Woe (ilevel 75 entry 19357)
-- NOT FOUND: Draconic Maul (ilevel 70 entry 19358)
-- NOT FOUND: Lok'amir il Romathis (ilevel 81 entry 19360)
-- NOT FOUND: Ashjre'thul, Crossbow of Smiting (ilevel 77 entry 19361)
-- NOT FOUND: Doom's Edge (ilevel 70 entry 19362)
-- NOT FOUND: Crul'shorukh, Edge of Chaos (ilevel 81 entry 19363)
-- NOT FOUND: Ashkandi, Greatsword of the Brotherhood (ilevel 81 entry 19364)
-- NOT FOUND: Claw of the Black Drake (ilevel 75 entry 19365)
-- NOT FOUND: Master Dragonslayer's Orb (ilevel 83 entry 19366)
-- NOT FOUND: Dragon's Touch (ilevel 75 entry 19367)
-- NOT FOUND: Dragonbreath Hand Cannon (ilevel 75 entry 19368)
-- NOT FOUND: Gloves of Rapid Evolution (ilevel 73 entry 19369)
-- NOT FOUND: Mantle of the Blackwing Cabal (ilevel 73 entry 19370)
-- NOT FOUND: Pendant of the Fallen Dragon (ilevel 74 entry 19371)
-- NOT FOUND: Helm of Endless Rage (ilevel 74 entry 19372)
-- NOT FOUND: Black Brood Pauldrons (ilevel 75 entry 19373)
-- NOT FOUND: Bracers of Arcane Accuracy (ilevel 75 entry 19374)
-- NOT FOUND: Mish'undare, Circlet of the Mind Flayer (ilevel 83 entry 19375)
-- NOT FOUND: Archimtiros' Ring of Reckoning (ilevel 83 entry 19376)
-- NOT FOUND: Prestor's Talisman of Connivery (ilevel 83 entry 19377)
-- NOT FOUND: Cloak of the Brood Lord (ilevel 83 entry 19378)
-- NOT FOUND: Neltharion's Tear (ilevel 83 entry 19379)
-- NOT FOUND: Therazane's Link (ilevel 83 entry 19380)
-- NOT FOUND: Boots of the Shadow Flame (ilevel 83 entry 19381)
-- NOT FOUND: Pure Elementium Band (ilevel 83 entry 19382)
-- NOT FOUND: Master Dragonslayer's Medallion (ilevel 83 entry 19383)
-- NOT FOUND: Master Dragonslayer's Ring (ilevel 83 entry 19384)
-- NOT FOUND: Empowered Leggings (ilevel 77 entry 19385)
-- NOT FOUND: Elementium Threaded Cloak (ilevel 77 entry 19386)
-- NOT FOUND: Chromatic Boots (ilevel 77 entry 19387)
-- NOT FOUND: Angelista's Grasp (ilevel 77 entry 19388)
-- NOT FOUND: Taut Dragonhide Shoulderpads (ilevel 77 entry 19389)
-- NOT FOUND: Taut Dragonhide Gloves (ilevel 77 entry 19390)
-- NOT FOUND: Shimmering Geta (ilevel 77 entry 19391)
-- NOT FOUND: Girdle of the Fallen Crusader (ilevel 77 entry 19392)
-- NOT FOUND: Primalist's Linked Waistguard (ilevel 77 entry 19393)
-- NOT FOUND: Drake Talon Pauldrons (ilevel 75 entry 19394)
-- NOT FOUND: Rejuvenating Gem (ilevel 75 entry 19395)
-- NOT FOUND: Taut Dragonhide Belt (ilevel 75 entry 19396)
-- NOT FOUND: Ring of Blackrock (ilevel 75 entry 19397)
-- NOT FOUND: Cloak of Firemaw (ilevel 75 entry 19398)
-- NOT FOUND: Black Ash Robe (ilevel 75 entry 19399)
-- NOT FOUND: Firemaw's Clutch (ilevel 75 entry 19400)
-- NOT FOUND: Primalist's Linked Legguards (ilevel 75 entry 19401)
-- NOT FOUND: Legguards of the Fallen Crusader (ilevel 75 entry 19402)
-- NOT FOUND: Band of Forced Concentration (ilevel 75 entry 19403)
-- NOT FOUND: Malfurion's Blessed Bulwark (ilevel 75 entry 19405)
-- NOT FOUND: Drake Fang Talisman (ilevel 75 entry 19406)
-- NOT FOUND: Ebony Flame Gloves (ilevel 75 entry 19407)
-- NOT FOUND: Orb of the Darkmoon (ilevel 65 entry 19426)
-- NOT FOUND: Shroud of Pure Thought (ilevel 75 entry 19430)
-- NOT FOUND: Styleen's Impeding Scarab (ilevel 75 entry 19431)
-- NOT FOUND: Circle of Applied Force (ilevel 75 entry 19432)
-- NOT FOUND: Emberweave Leggings (ilevel 75 entry 19433)
-- NOT FOUND: Band of Dark Dominion (ilevel 70 entry 19434)
-- NOT FOUND: Essence Gatherer (ilevel 70 entry 19435)
-- NOT FOUND: Cloak of Draconic Might (ilevel 70 entry 19436)
-- NOT FOUND: Boots of Pure Thought (ilevel 70 entry 19437)
-- NOT FOUND: Ringo's Blizzard Boots (ilevel 71 entry 19438)
-- NOT FOUND: Interlaced Shadow Jerkin (ilevel 71 entry 19439)
-- NOT FOUND: Amulet of the Darkmoon (ilevel 65 entry 19491)
-- NOT FOUND: Warsong Battle Tabard (ilevel 20 entry 19505)
-- NOT FOUND: Silverwing Battle Tabard (ilevel 20 entry 19506)
-- NOT FOUND: Inquisitor's Shawl (ilevel 41 entry 19507)
-- NOT FOUND: Branded Leather Bracers (ilevel 41 entry 19508)
-- NOT FOUND: Dusty Mail Boots (ilevel 41 entry 19509)
-- NOT FOUND: Legionnaire's Band (ilevel 63 entry 19510)
-- NOT FOUND: Legionnaire's Band (ilevel 53 entry 19511)
-- NOT FOUND: Legionnaire's Band (ilevel 43 entry 19512)
-- NOT FOUND: Legionnaire's Band (ilevel 33 entry 19513)
-- NOT FOUND: Protector's Band (ilevel 63 entry 19514)
-- NOT FOUND: Protector's Band (ilevel 43 entry 19515)
-- NOT FOUND: Protector's Band (ilevel 53 entry 19516)
-- NOT FOUND: Protector's Band (ilevel 33 entry 19517)
-- NOT FOUND: Advisor's Ring (ilevel 63 entry 19518)
-- NOT FOUND: Advisor's Ring (ilevel 53 entry 19519)
-- NOT FOUND: Advisor's Ring (ilevel 43 entry 19520)
-- NOT FOUND: Advisor's Ring (ilevel 33 entry 19521)
-- NOT FOUND: Lorekeeper's Ring (ilevel 63 entry 19522)
-- NOT FOUND: Lorekeeper's Ring (ilevel 53 entry 19523)
-- NOT FOUND: Lorekeeper's Ring (ilevel 43 entry 19524)
-- NOT FOUND: Lorekeeper's Ring (ilevel 33 entry 19525)
-- NOT FOUND: Battle Healer's Cloak (ilevel 63 entry 19526)
-- NOT FOUND: Battle Healer's Cloak (ilevel 53 entry 19527)
-- NOT FOUND: Battle Healer's Cloak (ilevel 43 entry 19528)
-- NOT FOUND: Battle Healer's Cloak (ilevel 33 entry 19529)
-- NOT FOUND: Caretaker's Cape (ilevel 63 entry 19530)
-- NOT FOUND: Caretaker's Cape (ilevel 53 entry 19531)
-- NOT FOUND: Caretaker's Cape (ilevel 43 entry 19532)
-- NOT FOUND: Caretaker's Cape (ilevel 33 entry 19533)
-- NOT FOUND: Scout's Medallion (ilevel 63 entry 19534)
-- NOT FOUND: Scout's Medallion (ilevel 53 entry 19535)
-- NOT FOUND: Scout's Medallion (ilevel 43 entry 19536)
-- NOT FOUND: Scout's Medallion (ilevel 33 entry 19537)
-- NOT FOUND: Sentinel's Medallion (ilevel 63 entry 19538)
-- NOT FOUND: Sentinel's Medallion (ilevel 53 entry 19539)
-- NOT FOUND: Sentinel's Medallion (ilevel 43 entry 19540)
-- NOT FOUND: Sentinel's Medallion (ilevel 33 entry 19541)
-- NOT FOUND: Scout's Blade (ilevel 63 entry 19542)
-- NOT FOUND: Scout's Blade (ilevel 53 entry 19543)
-- NOT FOUND: Scout's Blade (ilevel 43 entry 19544)
-- NOT FOUND: Scout's Blade (ilevel 33 entry 19545)
-- NOT FOUND: Sentinel's Blade (ilevel 63 entry 19546)
-- NOT FOUND: Sentinel's Blade (ilevel 53 entry 19547)
-- NOT FOUND: Sentinel's Blade (ilevel 43 entry 19548)
-- NOT FOUND: Sentinel's Blade (ilevel 33 entry 19549)
-- NOT FOUND: Legionnaire's Sword (ilevel 63 entry 19550)
-- NOT FOUND: Legionnaire's Sword (ilevel 53 entry 19551)
-- NOT FOUND: Legionnaire's Sword (ilevel 43 entry 19552)
-- NOT FOUND: Legionnaire's Sword (ilevel 33 entry 19553)
-- NOT FOUND: Protector's Sword (ilevel 63 entry 19554)
-- NOT FOUND: Protector's Sword (ilevel 53 entry 19555)
-- NOT FOUND: Protector's Sword (ilevel 43 entry 19556)
-- NOT FOUND: Protector's Sword (ilevel 33 entry 19557)
-- NOT FOUND: Outrider's Bow (ilevel 63 entry 19558)
-- NOT FOUND: Outrider's Bow (ilevel 53 entry 19559)
-- NOT FOUND: Outrider's Bow (ilevel 43 entry 19560)
-- NOT FOUND: Outrider's Bow (ilevel 33 entry 19561)
-- NOT FOUND: Outrunner's Bow (ilevel 63 entry 19562)
-- NOT FOUND: Outrunner's Bow (ilevel 53 entry 19563)
-- NOT FOUND: Outrunner's Bow (ilevel 43 entry 19564)
-- NOT FOUND: Outrunner's Bow (ilevel 33 entry 19565)
-- NOT FOUND: Advisor's Gnarled Staff (ilevel 63 entry 19566)
-- NOT FOUND: Advisor's Gnarled Staff (ilevel 53 entry 19567)
-- NOT FOUND: Advisor's Gnarled Staff (ilevel 43 entry 19568)
-- NOT FOUND: Advisor's Gnarled Staff (ilevel 33 entry 19569)
-- NOT FOUND: Lorekeeper's Staff (ilevel 63 entry 19570)
-- NOT FOUND: Lorekeeper's Staff (ilevel 53 entry 19571)
-- NOT FOUND: Lorekeeper's Staff (ilevel 43 entry 19572)
-- NOT FOUND: Lorekeeper's Staff (ilevel 33 entry 19573)
-- NOT FOUND: Strength of Mugamba (ilevel 60 entry 19574)
-- NOT FOUND: Strength of Mugamba (ilevel 60 entry 19575)
-- NOT FOUND: Strength of Mugamba (ilevel 68 entry 19576)
-- NOT FOUND: Rage of Mugamba (ilevel 65 entry 19577)
-- NOT FOUND: Berserker Bracers (ilevel 65 entry 19578)
-- NOT FOUND: Heathen's Brand (ilevel 60 entry 19579)
-- NOT FOUND: Berserker Bracers (ilevel 55 entry 19580)
-- NOT FOUND: Berserker Bracers (ilevel 45 entry 19581)
-- NOT FOUND: Windtalker's Wristguards (ilevel 65 entry 19582)
-- NOT FOUND: Windtalker's Wristguards (ilevel 55 entry 19583)
-- NOT FOUND: Windtalker's Wristguards (ilevel 45 entry 19584)
-- NOT FOUND: Heathen's Brand (ilevel 60 entry 19585)
-- NOT FOUND: Heathen's Brand (ilevel 68 entry 19586)
-- NOT FOUND: Forest Stalker's Bracers (ilevel 65 entry 19587)
-- NOT FOUND: Hero's Brand (ilevel 65 entry 19588)
-- NOT FOUND: Forest Stalker's Bracers (ilevel 55 entry 19589)
-- NOT FOUND: Forest Stalker's Bracers (ilevel 45 entry 19590)
-- NOT FOUND: The Eye of Zuldazar (ilevel 60 entry 19591)
-- NOT FOUND: The Eye of Zuldazar (ilevel 60 entry 19592)
-- NOT FOUND: The Eye of Zuldazar (ilevel 68 entry 19593)
-- NOT FOUND: The All-Seeing Eye of Zuldazar (ilevel 65 entry 19594)
-- NOT FOUND: Dryad's Wrist Bindings (ilevel 65 entry 19595)
-- NOT FOUND: Dryad's Wrist Bindings (ilevel 55 entry 19596)
-- NOT FOUND: Dryad's Wrist Bindings (ilevel 45 entry 19597)
-- NOT FOUND: Pebble of Kajaro (ilevel 60 entry 19598)
-- NOT FOUND: Pebble of Kajaro (ilevel 60 entry 19599)
-- NOT FOUND: Pebble of Kajaro (ilevel 68 entry 19600)
-- NOT FOUND: Jewel of Kajaro (ilevel 65 entry 19601)
-- NOT FOUND: Kezan's Taint (ilevel 60 entry 19602)
-- NOT FOUND: Kezan's Taint (ilevel 60 entry 19603)
-- NOT FOUND: Kezan's Taint (ilevel 68 entry 19604)
-- NOT FOUND: Kezan's Unstoppable Taint (ilevel 65 entry 19605)
-- NOT FOUND: Vision of Voodress (ilevel 60 entry 19606)
-- NOT FOUND: Vision of Voodress (ilevel 60 entry 19607)
-- NOT FOUND: Vision of Voodress (ilevel 68 entry 19608)
-- NOT FOUND: Unmarred Vision of Voodress (ilevel 65 entry 19609)
-- NOT FOUND: Enchanted South Seas Kelp (ilevel 60 entry 19610)
-- NOT FOUND: Enchanted South Seas Kelp (ilevel 60 entry 19611)
-- NOT FOUND: Enchanted South Seas Kelp (ilevel 68 entry 19612)
-- NOT FOUND: Pristine Enchanted South Seas Kelp (ilevel 65 entry 19613)
-- NOT FOUND: Zandalarian Shadow Talisman (ilevel 60 entry 19614)
-- NOT FOUND: Zandalarian Shadow Talisman (ilevel 60 entry 19615)
-- NOT FOUND: Zandalarian Shadow Talisman (ilevel 68 entry 19616)
-- NOT FOUND: Zandalarian Shadow Mastery Talisman (ilevel 65 entry 19617)
-- NOT FOUND: Maelstrom's Tendril (ilevel 60 entry 19618)
-- NOT FOUND: Maelstrom's Tendril (ilevel 60 entry 19619)
-- NOT FOUND: Maelstrom's Tendril (ilevel 68 entry 19620)
-- NOT FOUND: Maelstrom's Wrath (ilevel 65 entry 19621)
-- NOT FOUND: Bloodvine Vest (ilevel 65 entry 19682)
-- NOT FOUND: Bloodvine Leggings (ilevel 65 entry 19683)
-- NOT FOUND: Bloodvine Boots (ilevel 65 entry 19684)
-- NOT FOUND: Primal Batskin Jerkin (ilevel 65 entry 19685)
-- NOT FOUND: Primal Batskin Gloves (ilevel 65 entry 19686)
-- NOT FOUND: Primal Batskin Bracers (ilevel 65 entry 19687)
-- NOT FOUND: Blood Tiger Breastplate (ilevel 65 entry 19688)
-- NOT FOUND: Blood Tiger Shoulders (ilevel 65 entry 19689)
-- NOT FOUND: Bloodsoul Breastplate (ilevel 65 entry 19690)
-- NOT FOUND: Bloodsoul Shoulders (ilevel 65 entry 19691)
-- NOT FOUND: Bloodsoul Gauntlets (ilevel 65 entry 19692)
-- NOT FOUND: Darksoul Breastplate (ilevel 65 entry 19693)
-- NOT FOUND: Darksoul Leggings (ilevel 65 entry 19694)
-- NOT FOUND: Darksoul Shoulders (ilevel 65 entry 19695)
-- NOT FOUND: Bounty of the Harvest (ilevel 1 entry 19697)
-- NOT FOUND: Overlord's Embrace (ilevel 71 entry 19760)
-- NOT FOUND: Rockhide Strongfish (ilevel 45 entry 19808)
-- NOT FOUND: Rune of the Dawn (ilevel 61 entry 19812)
-- NOT FOUND: Zandalar Vindicator's Breastplate (ilevel 65 entry 19822)
-- NOT FOUND: Zandalar Vindicator's Belt (ilevel 61 entry 19823)
-- NOT FOUND: Zandalar Vindicator's Armguards (ilevel 61 entry 19824)
-- NOT FOUND: Zandalar Freethinker's Breastplate (ilevel 65 entry 19825)
-- NOT FOUND: Zandalar Freethinker's Belt (ilevel 61 entry 19826)
-- NOT FOUND: Zandalar Freethinker's Armguards (ilevel 61 entry 19827)
-- NOT FOUND: Zandalar Augur's Hauberk (ilevel 65 entry 19828)
-- NOT FOUND: Zandalar Augur's Belt (ilevel 61 entry 19829)
-- NOT FOUND: Zandalar Augur's Bracers (ilevel 61 entry 19830)
-- NOT FOUND: Zandalar Predator's Mantle (ilevel 68 entry 19831)
-- NOT FOUND: Zandalar Predator's Belt (ilevel 61 entry 19832)
-- NOT FOUND: Zandalar Predator's Bracers (ilevel 61 entry 19833)
-- NOT FOUND: Zandalar Madcap's Tunic (ilevel 65 entry 19834)
-- NOT FOUND: Zandalar Madcap's Mantle (ilevel 61 entry 19835)
-- NOT FOUND: Zandalar Madcap's Bracers (ilevel 61 entry 19836)
-- NOT FOUND: Zandalar Haruspex's Tunic (ilevel 65 entry 19838)
-- NOT FOUND: Zandalar Haruspex's Belt (ilevel 61 entry 19839)
-- NOT FOUND: Zandalar Haruspex's Bracers (ilevel 61 entry 19840)
-- NOT FOUND: Zandalar Confessor's Mantle (ilevel 68 entry 19841)
-- NOT FOUND: Zandalar Confessor's Bindings (ilevel 61 entry 19842)
-- NOT FOUND: Zandalar Confessor's Wraps (ilevel 61 entry 19843)
-- NOT FOUND: Zandalar Illusionist's Mantle (ilevel 61 entry 19845)
-- NOT FOUND: Zandalar Illusionist's Wraps (ilevel 61 entry 19846)
-- NOT FOUND: Zandalar Demoniac's Wraps (ilevel 61 entry 19848)
-- NOT FOUND: Zandalar Demoniac's Mantle (ilevel 61 entry 19849)
-- NOT FOUND: Ancient Hakkari Manslayer (ilevel 68 entry 19852)
-- NOT FOUND: Gurubashi Dwarf Destroyer (ilevel 68 entry 19853)
-- NOT FOUND: Zin'rokh, Destroyer of Worlds (ilevel 68 entry 19854)
-- NOT FOUND: Bloodsoaked Legplates (ilevel 68 entry 19855)
-- NOT FOUND: The Eye of Hakkar (ilevel 68 entry 19856)
-- NOT FOUND: Cloak of Consumption (ilevel 68 entry 19857)
-- NOT FOUND: Fang of the Faceless (ilevel 68 entry 19859)
-- NOT FOUND: Touch of Chaos (ilevel 68 entry 19861)
-- NOT FOUND: Aegis of the Blood God (ilevel 68 entry 19862)
-- NOT FOUND: Primalist's Seal (ilevel 71 entry 19863)
-- NOT FOUND: Bloodcaller (ilevel 68 entry 19864)
-- NOT FOUND: Warblade of the Hakkari (ilevel 68 entry 19865)
-- NOT FOUND: Warblade of the Hakkari (ilevel 66 entry 19866)
-- NOT FOUND: Bloodlord's Defender (ilevel 66 entry 19867)
-- NOT FOUND: Blooddrenched Grips (ilevel 71 entry 19869)
-- NOT FOUND: Hakkari Loa Cloak (ilevel 71 entry 19870)
-- NOT FOUND: Talisman of Protection (ilevel 68 entry 19871)
-- NOT FOUND: Overlord's Crimson Band (ilevel 71 entry 19873)
-- NOT FOUND: Halberd of Smiting (ilevel 66 entry 19874)
-- NOT FOUND: Bloodstained Coif (ilevel 71 entry 19875)
-- NOT FOUND: Soul Corrupter's Necklace (ilevel 68 entry 19876)
-- NOT FOUND: Animist's Leggings (ilevel 71 entry 19877)
-- NOT FOUND: Bloodsoaked Pauldrons (ilevel 71 entry 19878)
-- NOT FOUND: Alex's Test Beatdown Staff (ilevel 70 entry 19879)
-- NOT FOUND: Jin'do's Judgement (ilevel 66 entry 19884)
-- NOT FOUND: Jin'do's Evil Eye (ilevel 66 entry 19885)
-- NOT FOUND: The Hexxer's Cover (ilevel 71 entry 19886)
-- NOT FOUND: Bloodstained Legplates (ilevel 71 entry 19887)
-- NOT FOUND: Overlord's Embrace (ilevel 71 entry 19888)
-- NOT FOUND: Blooddrenched Leggings (ilevel 71 entry 19889)
-- NOT FOUND: Jin'do's Hexxer (ilevel 66 entry 19890)
-- NOT FOUND: Jin'do's Bag of Whammies (ilevel 66 entry 19891)
-- NOT FOUND: Animist's Boots (ilevel 71 entry 19892)
-- NOT FOUND: Zanzil's Seal (ilevel 71 entry 19893)
-- NOT FOUND: Bloodsoaked Gauntlets (ilevel 71 entry 19894)
-- NOT FOUND: Bloodtinged Kilt (ilevel 71 entry 19895)
-- NOT FOUND: Thekal's Grasp (ilevel 65 entry 19896)
-- NOT FOUND: Betrayer's Boots (ilevel 65 entry 19897)
-- NOT FOUND: Seal of Jin (ilevel 68 entry 19898)
-- NOT FOUND: Ritualistic Legguards (ilevel 68 entry 19899)
-- NOT FOUND: Zulian Stone Axe (ilevel 68 entry 19900)
-- NOT FOUND: Zulian Slicer (ilevel 68 entry 19901)
-- NOT FOUND: Fang of Venoxis (ilevel 65 entry 19903)
-- NOT FOUND: Runed Bloodstained Hauberk (ilevel 65 entry 19904)
-- NOT FOUND: Zanzil's Band (ilevel 68 entry 19905)
-- NOT FOUND: Blooddrenched Footpads (ilevel 68 entry 19906)
-- NOT FOUND: Zulian Tigerhide Cloak (ilevel 68 entry 19907)
-- NOT FOUND: Sceptre of Smiting (ilevel 65 entry 19908)
-- NOT FOUND: Will of Arlokk (ilevel 65 entry 19909)
-- NOT FOUND: Arlokk's Grasp (ilevel 65 entry 19910)
-- NOT FOUND: Overlord's Onyx Band (ilevel 68 entry 19912)
-- NOT FOUND: Bloodsoaked Greaves (ilevel 68 entry 19913)
-- NOT FOUND: Zulian Defender (ilevel 68 entry 19915)
-- NOT FOUND: Jeklik's Crusher (ilevel 65 entry 19918)
-- NOT FOUND: Bloodstained Greaves (ilevel 68 entry 19919)
-- NOT FOUND: Primalist's Band (ilevel 68 entry 19920)
-- NOT FOUND: Arlokk's Hoodoo Stick (ilevel 68 entry 19922)
-- NOT FOUND: Jeklik's Opaline Talisman (ilevel 68 entry 19923)
-- NOT FOUND: Band of Jin (ilevel 68 entry 19925)
-- NOT FOUND: Mar'li's Touch (ilevel 65 entry 19927)
-- NOT FOUND: Animist's Spaulders (ilevel 68 entry 19928)
-- NOT FOUND: Bloodtinged Gloves (ilevel 71 entry 19929)
-- NOT FOUND: Mar'li's Eye (ilevel 68 entry 19930)
-- NOT FOUND: Nat Pagle's Fish Terminator (ilevel 65 entry 19944)
-- NOT FOUND: Foror's Eyepatch (ilevel 65 entry 19945)
-- NOT FOUND: Tigule's Harpoon (ilevel 68 entry 19946)
-- NOT FOUND: Nat Pagle's Broken Reel (ilevel 68 entry 19947)
-- NOT FOUND: Zandalarian Hero Badge (ilevel 68 entry 19948)
-- NOT FOUND: Zandalarian Hero Medallion (ilevel 68 entry 19949)
-- NOT FOUND: Zandalarian Hero Charm (ilevel 68 entry 19950)
-- NOT FOUND: Gri'lek's Charm of Might (ilevel 65 entry 19951)
-- NOT FOUND: Gri'lek's Charm of Valor (ilevel 65 entry 19952)
-- NOT FOUND: Renataki's Charm of Beasts (ilevel 65 entry 19953)
-- NOT FOUND: Renataki's Charm of Trickery (ilevel 65 entry 19954)
-- NOT FOUND: Wushoolay's Charm of Nature (ilevel 65 entry 19955)
-- NOT FOUND: Wushoolay's Charm of Spirits (ilevel 65 entry 19956)
-- NOT FOUND: Hazza'rah's Charm of Destruction (ilevel 65 entry 19957)
-- NOT FOUND: Hazza'rah's Charm of Healing (ilevel 65 entry 19958)
-- NOT FOUND: Hazza'rah's Charm of Magic (ilevel 65 entry 19959)
-- NOT FOUND: Gri'lek's Grinder (ilevel 68 entry 19961)
-- NOT FOUND: Gri'lek's Carver (ilevel 68 entry 19962)
-- NOT FOUND: Pitchfork of Madness (ilevel 68 entry 19963)
-- NOT FOUND: Renataki's Soul Conduit (ilevel 68 entry 19964)
-- NOT FOUND: Wushoolay's Poker (ilevel 68 entry 19965)
-- NOT FOUND: Thoughtblighter (ilevel 68 entry 19967)
-- NOT FOUND: Fiery Retributer (ilevel 68 entry 19968)
-- NOT FOUND: Nat Pagle's Extreme Anglin' Boots (ilevel 40 entry 19969)
-- NOT FOUND: Arcanite Fishing Pole (ilevel 20 entry 19970)
-- NOT FOUND: Lucky Fishing Hat (ilevel 40 entry 19972)
-- NOT FOUND: Hook of the Master Angler (ilevel 65 entry 19979)
-- NOT FOUND: Duskbat Drape (ilevel 52 entry 19982)
-- NOT FOUND: Ebon Mask (ilevel 52 entry 19984)
-- NOT FOUND: Blessed Prayer Beads (ilevel 52 entry 19990)
-- NOT FOUND: Devilsaur Eye (ilevel 52 entry 19991)
-- NOT FOUND: Devilsaur Tooth (ilevel 52 entry 19992)
-- NOT FOUND: Hoodoo Hunting Bow (ilevel 68 entry 19993)
-- NOT FOUND: Bloodvine Lens (ilevel 65 entry 19998)
-- NOT FOUND: Bloodvine Goggles (ilevel 65 entry 19999)
-- NOT FOUND: Circle of Hope (ilevel 52 entry 20006)
-- NOT FOUND: Flowing Ritual Robes (ilevel 65 entry 20032)
-- NOT FOUND: Zandalar Demoniac's Robe (ilevel 65 entry 20033)
-- NOT FOUND: Zandalar Illusionist's Robe (ilevel 65 entry 20034)
-- NOT FOUND: Glacial Spike (ilevel 52 entry 20035)
-- NOT FOUND: Fire Ruby (ilevel 52 entry 20036)
-- NOT FOUND: Arcane Crystal Pendant (ilevel 52 entry 20037)
-- NOT FOUND: Mandokir's Sting (ilevel 66 entry 20038)
-- NOT FOUND: Highlander's Plate Girdle (ilevel 63 entry 20041)
-- NOT FOUND: Highlander's Lamellar Girdle (ilevel 63 entry 20042)
-- NOT FOUND: Highlander's Chain Girdle (ilevel 63 entry 20043)
-- NOT FOUND: Highlander's Mail Girdle (ilevel 63 entry 20044)
-- NOT FOUND: Highlander's Leather Girdle (ilevel 63 entry 20045)
-- NOT FOUND: Highlander's Lizardhide Girdle (ilevel 63 entry 20046)
-- NOT FOUND: Highlander's Cloth Girdle (ilevel 63 entry 20047)
-- NOT FOUND: Highlander's Plate Greaves (ilevel 63 entry 20048)
-- NOT FOUND: Highlander's Lamellar Greaves (ilevel 63 entry 20049)
-- NOT FOUND: Highlander's Chain Greaves (ilevel 63 entry 20050)
-- NOT FOUND: Highlander's Mail Greaves (ilevel 63 entry 20051)
-- NOT FOUND: Highlander's Leather Boots (ilevel 63 entry 20052)
-- NOT FOUND: Highlander's Lizardhide Boots (ilevel 63 entry 20053)
-- NOT FOUND: Highlander's Cloth Boots (ilevel 63 entry 20054)
-- NOT FOUND: Highlander's Chain Pauldrons (ilevel 65 entry 20055)
-- NOT FOUND: Highlander's Mail Pauldrons (ilevel 65 entry 20056)
-- NOT FOUND: Highlander's Plate Spaulders (ilevel 65 entry 20057)
-- NOT FOUND: Highlander's Lamellar Spaulders (ilevel 65 entry 20058)
-- NOT FOUND: Highlander's Leather Shoulders (ilevel 65 entry 20059)
-- NOT FOUND: Highlander's Lizardhide Shoulders (ilevel 65 entry 20060)
-- NOT FOUND: Highlander's Epaulets (ilevel 65 entry 20061)
-- NOT FOUND: Deathguard's Cloak (ilevel 65 entry 20068)
-- NOT FOUND: Ironbark Staff (ilevel 65 entry 20069)
-- NOT FOUND: Sageclaw (ilevel 65 entry 20070)
-- NOT FOUND: Talisman of Arathor (ilevel 63 entry 20071)
-- NOT FOUND: Defiler's Talisman (ilevel 63 entry 20072)
-- NOT FOUND: Cloak of the Honor Guard (ilevel 65 entry 20073)
-- NOT FOUND: Woestave (ilevel 52 entry 20082)
-- NOT FOUND: Hunting Spear (ilevel 52 entry 20083)
-- NOT FOUND: Dusksteel Throwing Knife (ilevel 52 entry 20086)
-- NOT FOUND: Highlander's Chain Girdle (ilevel 53 entry 20088)
-- NOT FOUND: Highlander's Chain Girdle (ilevel 43 entry 20089)
-- NOT FOUND: Highlander's Chain Girdle (ilevel 33 entry 20090)
-- NOT FOUND: Highlander's Chain Greaves (ilevel 53 entry 20091)
-- NOT FOUND: Highlander's Chain Greaves (ilevel 43 entry 20092)
-- NOT FOUND: Highlander's Chain Greaves (ilevel 33 entry 20093)
-- NOT FOUND: Highlander's Cloth Boots (ilevel 53 entry 20094)
-- NOT FOUND: Highlander's Cloth Boots (ilevel 43 entry 20095)
-- NOT FOUND: Highlander's Cloth Boots (ilevel 33 entry 20096)
-- NOT FOUND: Highlander's Cloth Girdle (ilevel 53 entry 20097)
-- NOT FOUND: Highlander's Cloth Girdle (ilevel 43 entry 20098)
-- NOT FOUND: Highlander's Cloth Girdle (ilevel 33 entry 20099)
-- NOT FOUND: Highlander's Lizardhide Boots (ilevel 53 entry 20100)
-- NOT FOUND: Highlander's Lizardhide Boots (ilevel 43 entry 20101)
-- NOT FOUND: Highlander's Lizardhide Boots (ilevel 33 entry 20102)
-- NOT FOUND: Highlander's Lizardhide Girdle (ilevel 53 entry 20103)
-- NOT FOUND: Highlander's Lizardhide Girdle (ilevel 43 entry 20104)
-- NOT FOUND: Highlander's Lizardhide Girdle (ilevel 33 entry 20105)
-- NOT FOUND: Highlander's Lamellar Girdle (ilevel 53 entry 20106)
-- NOT FOUND: Highlander's Lamellar Girdle (ilevel 43 entry 20107)
-- NOT FOUND: Highlander's Lamellar Girdle (ilevel 33 entry 20108)
-- NOT FOUND: Highlander's Lamellar Greaves (ilevel 53 entry 20109)
-- NOT FOUND: Highlander's Lamellar Greaves (ilevel 43 entry 20110)
-- NOT FOUND: Highlander's Lamellar Greaves (ilevel 33 entry 20111)
-- NOT FOUND: Highlander's Leather Boots (ilevel 53 entry 20112)
-- NOT FOUND: Highlander's Leather Boots (ilevel 43 entry 20113)
-- NOT FOUND: Highlander's Leather Boots (ilevel 33 entry 20114)
-- NOT FOUND: Highlander's Leather Girdle (ilevel 53 entry 20115)
-- NOT FOUND: Highlander's Leather Girdle (ilevel 43 entry 20116)
-- NOT FOUND: Highlander's Leather Girdle (ilevel 33 entry 20117)
-- NOT FOUND: Highlander's Plate Girdle (ilevel 53 entry 20124)
-- NOT FOUND: Highlander's Plate Girdle (ilevel 43 entry 20125)
-- NOT FOUND: Highlander's Plate Girdle (ilevel 33 entry 20126)
-- NOT FOUND: Highlander's Plate Greaves (ilevel 53 entry 20127)
-- NOT FOUND: Highlander's Plate Greaves (ilevel 43 entry 20128)
-- NOT FOUND: Highlander's Plate Greaves (ilevel 33 entry 20129)
-- NOT FOUND: Diamond Flask (ilevel 52 entry 20130)
-- NOT FOUND: Battle Tabard of the Defilers (ilevel 20 entry 20131)
-- NOT FOUND: Arathor Battle Tabard (ilevel 20 entry 20132)
-- NOT FOUND: Skyfury Helm (ilevel 62 entry 20134)
-- NOT FOUND: Defiler's Chain Girdle (ilevel 63 entry 20150)
-- NOT FOUND: Defiler's Chain Girdle (ilevel 53 entry 20151)
-- NOT FOUND: Defiler's Chain Girdle (ilevel 33 entry 20152)
-- NOT FOUND: Defiler's Chain Girdle (ilevel 43 entry 20153)
-- NOT FOUND: Defiler's Chain Greaves (ilevel 63 entry 20154)
-- NOT FOUND: Defiler's Chain Greaves (ilevel 53 entry 20155)
-- NOT FOUND: Defiler's Chain Greaves (ilevel 43 entry 20156)
-- NOT FOUND: Defiler's Chain Greaves (ilevel 33 entry 20157)
-- NOT FOUND: Defiler's Chain Pauldrons (ilevel 65 entry 20158)
-- NOT FOUND: Defiler's Cloth Boots (ilevel 63 entry 20159)
-- NOT FOUND: Defiler's Cloth Boots (ilevel 53 entry 20160)
-- NOT FOUND: Defiler's Cloth Boots (ilevel 43 entry 20161)
-- NOT FOUND: Defiler's Cloth Boots (ilevel 33 entry 20162)
-- NOT FOUND: Defiler's Cloth Girdle (ilevel 63 entry 20163)
-- NOT FOUND: Defiler's Cloth Girdle (ilevel 33 entry 20164)
-- NOT FOUND: Defiler's Cloth Girdle (ilevel 53 entry 20165)
-- NOT FOUND: Defiler's Cloth Girdle (ilevel 43 entry 20166)
-- NOT FOUND: Defiler's Lizardhide Boots (ilevel 63 entry 20167)
-- NOT FOUND: Defiler's Lizardhide Boots (ilevel 43 entry 20168)
-- NOT FOUND: Defiler's Lizardhide Boots (ilevel 33 entry 20169)
-- NOT FOUND: Defiler's Lizardhide Boots (ilevel 53 entry 20170)
-- NOT FOUND: Defiler's Lizardhide Girdle (ilevel 63 entry 20171)
-- NOT FOUND: Defiler's Lizardhide Girdle (ilevel 33 entry 20172)
-- NOT FOUND: Defiler's Lizardhide Girdle (ilevel 43 entry 20173)
-- NOT FOUND: Defiler's Lizardhide Girdle (ilevel 53 entry 20174)
-- NOT FOUND: Defiler's Lizardhide Shoulders (ilevel 65 entry 20175)
-- NOT FOUND: Defiler's Epaulets (ilevel 65 entry 20176)
-- NOT FOUND: Defiler's Lamellar Girdle (ilevel 63 entry 20177)
-- NOT FOUND: Defiler's Lamellar Greaves (ilevel 63 entry 20181)
-- NOT FOUND: Defiler's Lamellar Spaulders (ilevel 65 entry 20184)
-- NOT FOUND: Defiler's Leather Boots (ilevel 63 entry 20186)
-- NOT FOUND: Defiler's Leather Boots (ilevel 43 entry 20187)
-- NOT FOUND: Defiler's Leather Boots (ilevel 33 entry 20188)
-- NOT FOUND: Defiler's Leather Boots (ilevel 53 entry 20189)
-- NOT FOUND: Defiler's Leather Girdle (ilevel 63 entry 20190)
-- NOT FOUND: Defiler's Leather Girdle (ilevel 33 entry 20191)
-- NOT FOUND: Defiler's Leather Girdle (ilevel 43 entry 20192)
-- NOT FOUND: Defiler's Leather Girdle (ilevel 53 entry 20193)
-- NOT FOUND: Defiler's Leather Shoulders (ilevel 65 entry 20194)
-- NOT FOUND: Defiler's Mail Girdle (ilevel 63 entry 20195)
-- NOT FOUND: Defiler's Mail Girdle (ilevel 53 entry 20196)
-- NOT FOUND: Defiler's Mail Girdle (ilevel 33 entry 20197)
-- NOT FOUND: Defiler's Mail Girdle (ilevel 43 entry 20198)
-- NOT FOUND: Defiler's Mail Greaves (ilevel 63 entry 20199)
-- NOT FOUND: Defiler's Mail Greaves (ilevel 43 entry 20200)
-- NOT FOUND: Defiler's Mail Greaves (ilevel 33 entry 20201)
-- NOT FOUND: Defiler's Mail Greaves (ilevel 53 entry 20202)
-- NOT FOUND: Defiler's Mail Pauldrons (ilevel 65 entry 20203)
-- NOT FOUND: Defiler's Plate Girdle (ilevel 63 entry 20204)
-- NOT FOUND: Defiler's Plate Girdle (ilevel 53 entry 20205)
-- NOT FOUND: Defiler's Plate Girdle (ilevel 43 entry 20206)
-- NOT FOUND: Defiler's Plate Girdle (ilevel 33 entry 20207)
-- NOT FOUND: Defiler's Plate Greaves (ilevel 63 entry 20208)
-- NOT FOUND: Defiler's Plate Greaves (ilevel 43 entry 20209)
-- NOT FOUND: Defiler's Plate Greaves (ilevel 33 entry 20210)
-- NOT FOUND: Defiler's Plate Greaves (ilevel 53 entry 20211)
-- NOT FOUND: Defiler's Plate Spaulders (ilevel 65 entry 20212)
-- NOT FOUND: Belt of Shrunken Heads (ilevel 70 entry 20213)
-- NOT FOUND: Mindfang (ilevel 65 entry 20214)
-- NOT FOUND: Belt of Shriveled Heads (ilevel 70 entry 20215)
-- NOT FOUND: Belt of Preserved Heads (ilevel 70 entry 20216)
-- NOT FOUND: Belt of Tiny Heads (ilevel 70 entry 20217)
-- NOT FOUND: Faded Hakkari Cloak (ilevel 59 entry 20218)
-- NOT FOUND: Tattered Hakkari Cape (ilevel 59 entry 20219)
-- NOT FOUND: Ironbark Staff (ilevel 65 entry 20220)
-- NOT FOUND: Whisperwalk Boots (ilevel 52 entry 20255)
-- NOT FOUND: Seafury Gauntlets (ilevel 68 entry 20257)
-- NOT FOUND: Zulian Ceremonial Staff (ilevel 65 entry 20258)
-- NOT FOUND: Shadow Panther Hide Gloves (ilevel 65 entry 20259)
-- NOT FOUND: Seafury Leggings (ilevel 68 entry 20260)
-- NOT FOUND: Shadow Panther Hide Belt (ilevel 65 entry 20261)
-- NOT FOUND: Seafury Boots (ilevel 68 entry 20262)
-- NOT FOUND: Gurubashi Helm (ilevel 65 entry 20263)
-- NOT FOUND: Peacekeeper Gauntlets (ilevel 68 entry 20264)
-- NOT FOUND: Peacekeeper Boots (ilevel 68 entry 20265)
-- NOT FOUND: Peacekeeper Leggings (ilevel 68 entry 20266)
-- NOT FOUND: Blue Dragonscale Leggings (ilevel 60 entry 20295)
-- NOT FOUND: Green Dragonscale Gauntlets (ilevel 56 entry 20296)
-- NOT FOUND: Azurite Fists (ilevel 52 entry 20369)
-- NOT FOUND: Dreamscale Breastplate (ilevel 68 entry 20380)
-- NOT FOUND: Flimsy Male Gnome Mask (ilevel 1 entry 20391)
-- NOT FOUND: Flimsy Female Gnome Mask (ilevel 1 entry 20392)
-- NOT FOUND: Twilight Cultist Mantle (ilevel 60 entry 20406)
-- NOT FOUND: Twilight Cultist Robe (ilevel 60 entry 20407)
-- NOT FOUND: Twilight Cultist Cowl (ilevel 60 entry 20408)
-- NOT FOUND: Advisor's Gnarled Staff (ilevel 23 entry 20425)
-- NOT FOUND: Advisor's Ring (ilevel 23 entry 20426)
-- NOT FOUND: Battle Healer's Cloak (ilevel 23 entry 20427)
-- NOT FOUND: Caretaker's Cape (ilevel 23 entry 20428)
-- NOT FOUND: Legionnaire's Band (ilevel 23 entry 20429)
-- NOT FOUND: Legionnaire's Sword (ilevel 23 entry 20430)
-- NOT FOUND: Lorekeeper's Ring (ilevel 23 entry 20431)
-- NOT FOUND: Lorekeeper's Staff (ilevel 23 entry 20434)
-- NOT FOUND: Outrider's Bow (ilevel 23 entry 20437)
-- NOT FOUND: Outrunner's Bow (ilevel 23 entry 20438)
-- NOT FOUND: Protector's Band (ilevel 23 entry 20439)
-- NOT FOUND: Protector's Sword (ilevel 23 entry 20440)
-- NOT FOUND: Scout's Blade (ilevel 23 entry 20441)
-- NOT FOUND: Scout's Medallion (ilevel 23 entry 20442)
-- NOT FOUND: Sentinel's Blade (ilevel 23 entry 20443)
-- NOT FOUND: Sentinel's Medallion (ilevel 23 entry 20444)
-- NOT FOUND: Sandstalker Bracers (ilevel 62 entry 20476)
-- NOT FOUND: Sandstalker Gauntlets (ilevel 62 entry 20477)
-- NOT FOUND: Sandstalker Breastplate (ilevel 62 entry 20478)
-- NOT FOUND: Spitfire Breastplate (ilevel 62 entry 20479)
-- NOT FOUND: Spitfire Gauntlets (ilevel 62 entry 20480)
-- NOT FOUND: Spitfire Bracers (ilevel 62 entry 20481)
-- NOT FOUND: Lok'delar, Stave of the Ancient Keepers DEP (ilevel 75 entry 20487)
-- NOT FOUND: Rhok'delar, Longbow of the Ancient Keepers DEP (ilevel 75 entry 20488)
-- NOT FOUND: Enamored Water Spirit (ilevel 52 entry 20503)
-- NOT FOUND: Lightforged Blade (ilevel 52 entry 20504)
-- NOT FOUND: Chivalrous Signet (ilevel 52 entry 20505)
-- NOT FOUND: Sanctified Orb (ilevel 52 entry 20512)
-- NOT FOUND: Razorsteel Shoulders (ilevel 52 entry 20517)
-- NOT FOUND: Fury Visor (ilevel 52 entry 20521)
-- NOT FOUND: Robes of Servitude (ilevel 52 entry 20530)
-- NOT FOUND: Abyss Shard (ilevel 52 entry 20534)
-- NOT FOUND: Soul Harvester (ilevel 52 entry 20536)
-- NOT FOUND: Runed Stygian Boots (ilevel 63 entry 20537)
-- NOT FOUND: Runed Stygian Leggings (ilevel 63 entry 20538)
-- NOT FOUND: Runed Stygian Belt (ilevel 63 entry 20539)
-- NOT FOUND: Darkrune Gauntlets (ilevel 63 entry 20549)
-- NOT FOUND: Darkrune Breastplate (ilevel 63 entry 20550)
-- NOT FOUND: Darkrune Helm (ilevel 63 entry 20551)
-- NOT FOUND: Wildstaff (ilevel 52 entry 20556)
-- NOT FOUND: Flimsy Male Dwarf Mask (ilevel 1 entry 20561)
-- NOT FOUND: Flimsy Female Dwarf Mask (ilevel 1 entry 20562)
-- NOT FOUND: Flimsy Female Nightelf Mask (ilevel 1 entry 20563)
-- NOT FOUND: Flimsy Male Nightelf Mask (ilevel 1 entry 20564)
-- NOT FOUND: Flimsy Female Human Mask (ilevel 1 entry 20565)
-- NOT FOUND: Flimsy Male Human Mask (ilevel 1 entry 20566)
-- NOT FOUND: Flimsy Female Troll Mask (ilevel 1 entry 20567)
-- NOT FOUND: Flimsy Male Troll Mask (ilevel 1 entry 20568)
-- NOT FOUND: Flimsy Female Orc Mask (ilevel 1 entry 20569)
-- NOT FOUND: Flimsy Male Orc Mask (ilevel 1 entry 20570)
-- NOT FOUND: Flimsy Female Tauren Mask (ilevel 1 entry 20571)
-- NOT FOUND: Flimsy Male Tauren Mask (ilevel 1 entry 20572)
-- NOT FOUND: Flimsy Male Undead Mask (ilevel 1 entry 20573)
-- NOT FOUND: Flimsy Female Undead Mask (ilevel 1 entry 20574)
-- NOT FOUND: Black Whelp Tunic (ilevel 20 entry 20575)
-- NOT FOUND: Nightmare Blade (ilevel 71 entry 20577)
-- NOT FOUND: Emerald Dragonfang (ilevel 71 entry 20578)
-- NOT FOUND: Green Dragonskin Cloak (ilevel 71 entry 20579)
-- NOT FOUND: Hammer of Bestial Fury (ilevel 71 entry 20580)
-- NOT FOUND: Staff of Rampant Growth (ilevel 71 entry 20581)
-- NOT FOUND: Trance Stone (ilevel 71 entry 20582)
-- NOT FOUND: Polished Ironwood Crossbow (ilevel 71 entry 20599)
-- NOT FOUND: Malfurion's Signet Ring (ilevel 72 entry 20600)
-- NOT FOUND: Dragonspur Wraps (ilevel 71 entry 20615)
-- NOT FOUND: Dragonbone Wristguards (ilevel 71 entry 20616)
-- NOT FOUND: Ancient Corroded Leggings (ilevel 72 entry 20617)
-- NOT FOUND: Gloves of Delusional Power (ilevel 72 entry 20618)
-- NOT FOUND: Acid Inscribed Greaves (ilevel 72 entry 20619)
-- NOT FOUND: Boots of the Endless Moor (ilevel 71 entry 20621)
-- NOT FOUND: Dragonheart Necklace (ilevel 71 entry 20622)
-- NOT FOUND: Circlet of Restless Dreams (ilevel 72 entry 20623)
-- NOT FOUND: Ring of the Unliving (ilevel 72 entry 20624)
-- NOT FOUND: Belt of the Dark Bog (ilevel 71 entry 20625)
-- NOT FOUND: Black Bark Wristbands (ilevel 71 entry 20626)
-- NOT FOUND: Dark Heart Pants (ilevel 71 entry 20627)
-- NOT FOUND: Deviate Growth Cap (ilevel 72 entry 20628)
-- NOT FOUND: Malignant Footguards (ilevel 72 entry 20629)
-- NOT FOUND: Gauntlets of the Shining Light (ilevel 72 entry 20630)
-- NOT FOUND: Mendicant's Slippers (ilevel 71 entry 20631)
-- NOT FOUND: Mindtear Band (ilevel 71 entry 20632)
-- NOT FOUND: Unnatural Leather Spaulders (ilevel 72 entry 20633)
-- NOT FOUND: Boots of Fright (ilevel 72 entry 20634)
-- NOT FOUND: Jade Inlaid Vestments (ilevel 71 entry 20635)
-- NOT FOUND: Hibernation Crystal (ilevel 71 entry 20636)
-- NOT FOUND: Acid Inscribed Pauldrons (ilevel 72 entry 20637)
-- NOT FOUND: Leggings of the Demented Mind (ilevel 72 entry 20638)
-- NOT FOUND: Strangely Glyphed Legplates (ilevel 72 entry 20639)
-- NOT FOUND: Southsea Head Bucket (ilevel 45 entry 20640)
-- NOT FOUND: Southsea Mojo Boots (ilevel 45 entry 20641)
-- NOT FOUND: Antiquated Nobleman's Tunic (ilevel 47 entry 20642)
-- NOT FOUND: Undercity Reservist's Cap (ilevel 47 entry 20643)
-- NOT FOUND: Nature's Whisper (ilevel 60 entry 20645)
-- NOT FOUND: Sandstrider's Mark (ilevel 59 entry 20646)
-- NOT FOUND: Black Crystal Dagger (ilevel 59 entry 20647)
-- NOT FOUND: Cold Forged Hammer (ilevel 63 entry 20648)
-- NOT FOUND: Sunprism Pendant (ilevel 60 entry 20649)
-- NOT FOUND: Desert Wind Gauntlets (ilevel 60 entry 20650)
-- NOT FOUND: Amethyst War Staff (ilevel 60 entry 20654)
-- NOT FOUND: Crystal Tipped Stiletto (ilevel 60 entry 20657)
-- NOT FOUND: Stonecutting Glaive (ilevel 60 entry 20660)
-- NOT FOUND: Deep Strike Bow (ilevel 60 entry 20663)
-- NOT FOUND: Hardened Steel Warhammer (ilevel 62 entry 20666)
-- NOT FOUND: Darkstone Claymore (ilevel 62 entry 20669)
-- NOT FOUND: Sparkling Crystal Wand (ilevel 62 entry 20672)
-- NOT FOUND: Soulrender (ilevel 62 entry 20675)
-- NOT FOUND: Elemental Focus Band (ilevel 65 entry 20682)
-- NOT FOUND: Wavefront Necklace (ilevel 65 entry 20685)
-- NOT FOUND: Earthen Guard (ilevel 65 entry 20688)
-- NOT FOUND: Windshear Cape (ilevel 65 entry 20691)
-- NOT FOUND: Weighted Cloak (ilevel 60 entry 20693)
-- NOT FOUND: Glowing Black Orb (ilevel 60 entry 20694)
-- NOT FOUND: Abyssal War Beads (ilevel 63 entry 20695)
-- NOT FOUND: Crystal Spiked Maul (ilevel 63 entry 20696)
-- NOT FOUND: Crystalline Threaded Cape (ilevel 63 entry 20697)
-- NOT FOUND: Elemental Attuned Blade (ilevel 63 entry 20698)
-- NOT FOUND: Cenarion Reservist's Legplates (ilevel 63 entry 20699)
-- NOT FOUND: Cenarion Reservist's Legplates (ilevel 63 entry 20700)
-- NOT FOUND: Cenarion Reservist's Legguards (ilevel 63 entry 20701)
-- NOT FOUND: Cenarion Reservist's Legguards (ilevel 63 entry 20702)
-- NOT FOUND: Cenarion Reservist's Leggings (ilevel 63 entry 20703)
-- NOT FOUND: Cenarion Reservist's Leggings (ilevel 63 entry 20704)
-- NOT FOUND: Cenarion Reservist's Pants (ilevel 63 entry 20705)
-- NOT FOUND: Cenarion Reservist's Pants (ilevel 63 entry 20706)
-- NOT FOUND: Cenarion Reservist's Pants (ilevel 63 entry 20707)
-- NOT FOUND: Crystal Encrusted Greaves (ilevel 63 entry 20710)
-- NOT FOUND: Crystal Lined Greaves (ilevel 63 entry 20711)
-- NOT FOUND: Wastewalker's Gauntlets (ilevel 63 entry 20712)
-- NOT FOUND: Desertstalkers's Gauntlets (ilevel 63 entry 20713)
-- NOT FOUND: Sandstorm Boots (ilevel 63 entry 20714)
-- NOT FOUND: Dunestalker's Boots (ilevel 63 entry 20715)
-- NOT FOUND: Sandworm Skin Gloves (ilevel 63 entry 20716)
-- NOT FOUND: Desert Bloom Gloves (ilevel 63 entry 20717)
-- NOT FOUND: Dark Whisper Blade (ilevel 65 entry 20720)
-- NOT FOUND: Band of the Cultist (ilevel 65 entry 20721)
-- NOT FOUND: Crystal Slugthrower (ilevel 65 entry 20722)
-- NOT FOUND: Brann's Trusty Pick (ilevel 62 entry 20723)
-- NOT FOUND: Corrupted Blackwood Staff (ilevel 62 entry 20724)
-- NOT FOUND: Narain's Turban (ilevel 1 entry 21039)
-- NOT FOUND: Narain's Robe (ilevel 1 entry 21040)
-- NOT FOUND: Defiler's Talisman (ilevel 53 entry 21115)
-- NOT FOUND: Defiler's Talisman (ilevel 43 entry 21116)
-- NOT FOUND: Talisman of Arathor (ilevel 53 entry 21117)
-- NOT FOUND: Talisman of Arathor (ilevel 43 entry 21118)
-- NOT FOUND: Talisman of Arathor (ilevel 33 entry 21119)
-- NOT FOUND: Defiler's Talisman (ilevel 33 entry 21120)
-- NOT FOUND: Death's Sting (ilevel 84 entry 21126)
-- NOT FOUND: Staff of the Qiraji Prophets (ilevel 75 entry 21128)
-- NOT FOUND: Dark Edge of Insanity (ilevel 84 entry 21134)
-- NOT FOUND: Festival Dress (ilevel 1 entry 21154)
-- NOT FOUND: Festive Green Dress (ilevel 1 entry 21157)
-- NOT FOUND: Gloves of Earthen Power (ilevel 62 entry 21178)
-- NOT FOUND: Band of Earthen Wrath (ilevel 62 entry 21179)
-- NOT FOUND: Earthstrike (ilevel 66 entry 21180)
-- NOT FOUND: Grace of Earth (ilevel 66 entry 21181)
-- NOT FOUND: Band of Earthen Might (ilevel 66 entry 21182)
-- NOT FOUND: Earthpower Vest (ilevel 66 entry 21183)
-- NOT FOUND: Deeprock Bracers (ilevel 62 entry 21184)
-- NOT FOUND: Earthcalm Orb (ilevel 62 entry 21185)
-- NOT FOUND: Rockfury Bracers (ilevel 62 entry 21186)
-- NOT FOUND: Earthweave Cloak (ilevel 62 entry 21187)
-- NOT FOUND: Fist of Cenarius (ilevel 66 entry 21188)
-- NOT FOUND: Might of Cenarius (ilevel 62 entry 21189)
-- NOT FOUND: Wrath of Cenarius (ilevel 66 entry 21190)
-- NOT FOUND: Signet Ring of the Bronze Dragonflight (ilevel 60 entry 21196)
-- NOT FOUND: Signet Ring of the Bronze Dragonflight (ilevel 65 entry 21197)
-- NOT FOUND: Signet Ring of the Bronze Dragonflight (ilevel 70 entry 21198)
-- NOT FOUND: Signet Ring of the Bronze Dragonflight (ilevel 75 entry 21199)
-- NOT FOUND: Signet Ring of the Bronze Dragonflight (ilevel 80 entry 21200)
-- NOT FOUND: Signet Ring of the Bronze Dragonflight (ilevel 60 entry 21201)
-- NOT FOUND: Signet Ring of the Bronze Dragonflight (ilevel 65 entry 21202)
-- NOT FOUND: Signet Ring of the Bronze Dragonflight (ilevel 70 entry 21203)
-- NOT FOUND: Signet Ring of the Bronze Dragonflight (ilevel 75 entry 21204)
-- NOT FOUND: Signet Ring of the Bronze Dragonflight (ilevel 80 entry 21205)
-- NOT FOUND: Signet Ring of the Bronze Dragonflight (ilevel 60 entry 21206)
-- NOT FOUND: Signet Ring of the Bronze Dragonflight (ilevel 65 entry 21207)
-- NOT FOUND: Signet Ring of the Bronze Dragonflight (ilevel 70 entry 21208)
-- NOT FOUND: Signet Ring of the Bronze Dragonflight (ilevel 75 entry 21209)
-- NOT FOUND: Signet Ring of the Bronze Dragonflight (ilevel 80 entry 21210)
-- NOT FOUND: Blessed Qiraji War Axe (ilevel 79 entry 21242)
-- NOT FOUND: Blessed Qiraji Pugio (ilevel 79 entry 21244)
-- NOT FOUND: Blessed Qiraji War Hammer (ilevel 79 entry 21268)
-- NOT FOUND: Blessed Qiraji Bulwark (ilevel 79 entry 21269)
-- NOT FOUND: Blessed Qiraji Musket (ilevel 79 entry 21272)
-- NOT FOUND: Blessed Qiraji Acolyte Staff (ilevel 79 entry 21273)
-- NOT FOUND: Blessed Qiraji Augur Staff (ilevel 79 entry 21275)
-- NOT FOUND: Stormshroud Gloves (ilevel 62 entry 21278)
-- NOT FOUND: Earth Warder's Vest (ilevel 48 entry 21311)
-- NOT FOUND: Belt of the Den Watcher (ilevel 48 entry 21312)
-- NOT FOUND: Leggings of the Ursa (ilevel 55 entry 21316)
-- NOT FOUND: Helm of the Pathfinder (ilevel 55 entry 21317)
-- NOT FOUND: Earth Warder's Gloves (ilevel 58 entry 21318)
-- NOT FOUND: Gloves of the Pathfinder (ilevel 58 entry 21319)
-- NOT FOUND: Vest of the Den Watcher (ilevel 58 entry 21320)
-- NOT FOUND: Ursa's Embrace (ilevel 58 entry 21322)
-- NOT FOUND: Defender of the Timbermaw (ilevel 62 entry 21326)
-- NOT FOUND: Conqueror's Crown (ilevel 81 entry 21329)
-- NOT FOUND: Conqueror's Spaulders (ilevel 78 entry 21330)
-- NOT FOUND: Conqueror's Breastplate (ilevel 88 entry 21331)
-- NOT FOUND: Conqueror's Legguards (ilevel 81 entry 21332)
-- NOT FOUND: Conqueror's Greaves (ilevel 78 entry 21333)
-- NOT FOUND: Doomcaller's Robes (ilevel 88 entry 21334)
-- NOT FOUND: Doomcaller's Mantle (ilevel 78 entry 21335)
-- NOT FOUND: Doomcaller's Trousers (ilevel 81 entry 21336)
-- NOT FOUND: Doomcaller's Circlet (ilevel 81 entry 21337)
-- NOT FOUND: Doomcaller's Footwraps (ilevel 78 entry 21338)
-- NOT FOUND: Enigma Robes (ilevel 88 entry 21343)
-- NOT FOUND: Enigma Boots (ilevel 78 entry 21344)
-- NOT FOUND: Enigma Shoulderpads (ilevel 78 entry 21345)
-- NOT FOUND: Enigma Leggings (ilevel 81 entry 21346)
-- NOT FOUND: Enigma Circlet (ilevel 81 entry 21347)
-- NOT FOUND: Tiara of the Oracle (ilevel 81 entry 21348)
-- NOT FOUND: Footwraps of the Oracle (ilevel 78 entry 21349)
-- NOT FOUND: Mantle of the Oracle (ilevel 78 entry 21350)
-- NOT FOUND: Vestments of the Oracle (ilevel 88 entry 21351)
-- NOT FOUND: Trousers of the Oracle (ilevel 81 entry 21352)
-- NOT FOUND: Genesis Helm (ilevel 81 entry 21353)
-- NOT FOUND: Genesis Shoulderpads (ilevel 78 entry 21354)
-- NOT FOUND: Genesis Boots (ilevel 78 entry 21355)
-- NOT FOUND: Genesis Trousers (ilevel 81 entry 21356)
-- NOT FOUND: Genesis Vest (ilevel 88 entry 21357)
-- NOT FOUND: Deathdealer's Boots (ilevel 78 entry 21359)
-- NOT FOUND: Deathdealer's Helm (ilevel 81 entry 21360)
-- NOT FOUND: Deathdealer's Spaulders (ilevel 78 entry 21361)
-- NOT FOUND: Deathdealer's Leggings (ilevel 81 entry 21362)
-- NOT FOUND: Deathdealer's Vest (ilevel 88 entry 21364)
-- NOT FOUND: Striker's Footguards (ilevel 78 entry 21365)
-- NOT FOUND: Striker's Diadem (ilevel 81 entry 21366)
-- NOT FOUND: Striker's Pauldrons (ilevel 81 entry 21367)
-- NOT FOUND: Striker's Leggings (ilevel 81 entry 21368)
-- NOT FOUND: Striker's Hauberk (ilevel 88 entry 21370)
-- NOT FOUND: Stormcaller's Diadem (ilevel 81 entry 21372)
-- NOT FOUND: Stormcaller's Footguards (ilevel 78 entry 21373)
-- NOT FOUND: Stormcaller's Hauberk (ilevel 88 entry 21374)
-- NOT FOUND: Stormcaller's Leggings (ilevel 81 entry 21375)
-- NOT FOUND: Stormcaller's Pauldrons (ilevel 78 entry 21376)
-- NOT FOUND: Avenger's Crown (ilevel 81 entry 21387)
-- NOT FOUND: Avenger's Greaves (ilevel 78 entry 21388)
-- NOT FOUND: Avenger's Breastplate (ilevel 88 entry 21389)
-- NOT FOUND: Avenger's Legguards (ilevel 81 entry 21390)
-- NOT FOUND: Avenger's Pauldrons (ilevel 78 entry 21391)
-- NOT FOUND: Sickle of Unyielding Strength (ilevel 70 entry 21392)
-- NOT FOUND: Signet of Unyielding Strength (ilevel 65 entry 21393)
-- NOT FOUND: Drape of Unyielding Strength (ilevel 67 entry 21394)
-- NOT FOUND: Blade of Eternal Justice (ilevel 70 entry 21395)
-- NOT FOUND: Ring of Eternal Justice (ilevel 65 entry 21396)
-- NOT FOUND: Cape of Eternal Justice (ilevel 67 entry 21397)
-- NOT FOUND: Hammer of the Gathering Storm (ilevel 70 entry 21398)
-- NOT FOUND: Ring of the Gathering Storm (ilevel 65 entry 21399)
-- NOT FOUND: Cloak of the Gathering Storm (ilevel 67 entry 21400)
-- NOT FOUND: Scythe of the Unseen Path (ilevel 70 entry 21401)
-- NOT FOUND: Signet of the Unseen Path (ilevel 65 entry 21402)
-- NOT FOUND: Cloak of the Unseen Path (ilevel 67 entry 21403)
-- NOT FOUND: Dagger of Veiled Shadows (ilevel 70 entry 21404)
-- NOT FOUND: Band of Veiled Shadows (ilevel 65 entry 21405)
-- NOT FOUND: Cloak of Veiled Shadows (ilevel 67 entry 21406)
-- NOT FOUND: Mace of Unending Life (ilevel 70 entry 21407)
-- NOT FOUND: Band of Unending Life (ilevel 65 entry 21408)
-- NOT FOUND: Cloak of Unending Life (ilevel 67 entry 21409)
-- NOT FOUND: Gavel of Infinite Wisdom (ilevel 70 entry 21410)
-- NOT FOUND: Ring of Infinite Wisdom (ilevel 65 entry 21411)
-- NOT FOUND: Shroud of Infinite Wisdom (ilevel 67 entry 21412)
-- NOT FOUND: Blade of Vaulted Secrets (ilevel 70 entry 21413)
-- NOT FOUND: Band of Vaulted Secrets (ilevel 65 entry 21414)
-- NOT FOUND: Drape of Vaulted Secrets (ilevel 67 entry 21415)
-- NOT FOUND: Kris of Unspoken Names (ilevel 70 entry 21416)
-- NOT FOUND: Ring of Unspoken Names (ilevel 65 entry 21417)
-- NOT FOUND: Shroud of Unspoken Names (ilevel 67 entry 21418)
-- NOT FOUND: Staff of the Ruins (ilevel 72 entry 21452)
-- NOT FOUND: Mantle of the Horusath (ilevel 72 entry 21453)
-- NOT FOUND: Runic Stone Shoulders (ilevel 72 entry 21454)
-- NOT FOUND: Southwind Helm (ilevel 74 entry 21455)
-- NOT FOUND: Sandstorm Cloak (ilevel 72 entry 21456)
-- NOT FOUND: Bracers of Brutality (ilevel 72 entry 21457)
-- NOT FOUND: Gauntlets of New Life (ilevel 72 entry 21458)
-- NOT FOUND: Crossbow of Imminent Doom (ilevel 72 entry 21459)
-- NOT FOUND: Helm of Domination (ilevel 72 entry 21460)
-- NOT FOUND: Leggings of the Black Blizzard (ilevel 72 entry 21461)
-- NOT FOUND: Gloves of Dark Wisdom (ilevel 72 entry 21462)
-- NOT FOUND: Ossirian's Binding (ilevel 72 entry 21463)
-- NOT FOUND: Shackles of the Unscarred (ilevel 72 entry 21464)
-- NOT FOUND: Stinger of Ayamiss (ilevel 69 entry 21466)
-- NOT FOUND: Thick Silithid Chestguard (ilevel 69 entry 21467)
-- NOT FOUND: Mantle of Maz'Nadir (ilevel 74 entry 21468)
-- NOT FOUND: Gauntlets of Southwind (ilevel 74 entry 21469)
-- NOT FOUND: Cloak of the Savior (ilevel 74 entry 21470)
-- NOT FOUND: Talon of Furious Concentration (ilevel 69 entry 21471)
-- NOT FOUND: Dustwind Turban (ilevel 69 entry 21472)
-- NOT FOUND: Eye of Moam (ilevel 74 entry 21473)
-- NOT FOUND: Chitinous Shoulderguards (ilevel 74 entry 21474)
-- NOT FOUND: Legplates of the Destroyer (ilevel 74 entry 21475)
-- NOT FOUND: Obsidian Scaled Leggings (ilevel 74 entry 21476)
-- NOT FOUND: Ring of Fury (ilevel 74 entry 21477)
-- NOT FOUND: Bow of Taut Sinew (ilevel 68 entry 21478)
-- NOT FOUND: Gauntlets of the Immovable (ilevel 68 entry 21479)
-- NOT FOUND: Scaled Silithid Gauntlets (ilevel 73 entry 21480)
-- NOT FOUND: Boots of the Desert Protector (ilevel 73 entry 21481)
-- NOT FOUND: Boots of the Fiery Sands (ilevel 73 entry 21482)
-- NOT FOUND: Ring of the Desert Winds (ilevel 73 entry 21483)
-- NOT FOUND: Helm of Regrowth (ilevel 73 entry 21484)
-- NOT FOUND: Buru's Skull Fragment (ilevel 68 entry 21485)
-- NOT FOUND: Gloves of the Swarm (ilevel 68 entry 21486)
-- NOT FOUND: Slimy Scaled Gauntlets (ilevel 68 entry 21487)
-- NOT FOUND: Fetish of Chitinous Spikes (ilevel 73 entry 21488)
-- NOT FOUND: Quicksand Waders (ilevel 73 entry 21489)
-- NOT FOUND: Slime Kickers (ilevel 73 entry 21490)
-- NOT FOUND: Scaled Bracers of the Gorger (ilevel 73 entry 21491)
-- NOT FOUND: Manslayer of the Qiraji (ilevel 66 entry 21492)
-- NOT FOUND: Boots of the Vanguard (ilevel 66 entry 21493)
-- NOT FOUND: Southwind's Grasp (ilevel 71 entry 21494)
-- NOT FOUND: Legplates of the Qiraji Command (ilevel 71 entry 21495)
-- NOT FOUND: Bracers of Qiraji Command (ilevel 71 entry 21496)
-- NOT FOUND: Boots of the Qiraji General (ilevel 71 entry 21497)
-- NOT FOUND: Qiraji Sacrificial Dagger (ilevel 66 entry 21498)
-- NOT FOUND: Vestments of the Shifting Sands (ilevel 66 entry 21499)
-- NOT FOUND: Belt of the Inquisition (ilevel 71 entry 21500)
-- NOT FOUND: Toughened Silithid Hide Gloves (ilevel 71 entry 21501)
-- NOT FOUND: Sand Reaver Wristguards (ilevel 71 entry 21502)
-- NOT FOUND: Belt of the Sand Reaver (ilevel 71 entry 21503)
-- NOT FOUND: Charm of the Shifting Sands (ilevel 70 entry 21504)
-- NOT FOUND: Choker of the Shifting Sands (ilevel 70 entry 21505)
-- NOT FOUND: Pendant of the Shifting Sands (ilevel 70 entry 21506)
-- NOT FOUND: Amulet of the Shifting Sands (ilevel 70 entry 21507)
-- NOT FOUND: Gnomish Turban of Psychic Might (ilevel 75 entry 21517)
-- NOT FOUND: Ravencrest's Legacy (ilevel 76 entry 21520)
-- NOT FOUND: Runesword of the Red (ilevel 76 entry 21521)
-- NOT FOUND: Shadowsong's Sorrow (ilevel 76 entry 21522)
-- NOT FOUND: Fang of Korialstrasz (ilevel 76 entry 21523)
-- NOT FOUND: Red Winter Hat (ilevel 1 entry 21524)
-- NOT FOUND: Green Winter Hat (ilevel 1 entry 21525)
-- NOT FOUND: Band of Icy Depths (ilevel 77 entry 21526)
-- NOT FOUND: Darkwater Robes (ilevel 77 entry 21527)
-- NOT FOUND: Amulet of Shadow Shielding (ilevel 77 entry 21529)
-- NOT FOUND: Onyx Embedded Leggings (ilevel 77 entry 21530)
-- NOT FOUND: Drake Tooth Necklace (ilevel 77 entry 21531)
-- NOT FOUND: Drudge Boots (ilevel 77 entry 21532)
-- NOT FOUND: Festive Pink Dress (ilevel 1 entry 21538)
-- NOT FOUND: Festive Purple Dress (ilevel 1 entry 21539)
-- NOT FOUND: Festive Black Pant Suit (ilevel 1 entry 21541)
-- NOT FOUND: Festival Suit (ilevel 1 entry 21542)
-- NOT FOUND: Festive Teal Pant Suit (ilevel 1 entry 21543)
-- NOT FOUND: Festive Blue Pant Suit (ilevel 1 entry 21544)
-- NOT FOUND: Don Rodrigo's Band (ilevel 65 entry 21563)
-- NOT FOUND: Rune of Perfection (ilevel 45 entry 21565)
-- NOT FOUND: Rune of Perfection (ilevel 25 entry 21566)
-- NOT FOUND: Rune of Duty (ilevel 45 entry 21567)
-- NOT FOUND: Rune of Duty (ilevel 25 entry 21568)
-- NOT FOUND: Vanquished Tentacle of C'Thun (ilevel 88 entry 21579)
-- NOT FOUND: Gauntlets of Annihilation (ilevel 88 entry 21581)
-- NOT FOUND: Grasp of the Old God (ilevel 88 entry 21582)
-- NOT FOUND: Cloak of Clarity (ilevel 88 entry 21583)
-- NOT FOUND: Dark Storm Gauntlets (ilevel 88 entry 21585)
-- NOT FOUND: Belt of Never-ending Agony (ilevel 88 entry 21586)
-- NOT FOUND: Wristguards of Castigation (ilevel 88 entry 21587)
-- NOT FOUND: Ring of the Godslayer (ilevel 88 entry 21596)
-- NOT FOUND: Royal Scepter of Vek'lor (ilevel 81 entry 21597)
-- NOT FOUND: Royal Qiraji Belt (ilevel 81 entry 21598)
-- NOT FOUND: Vek'lor's Gloves of Devastation (ilevel 81 entry 21599)
-- NOT FOUND: Boots of Epiphany (ilevel 81 entry 21600)
-- NOT FOUND: Ring of Emperor Vek'lor (ilevel 81 entry 21601)
-- NOT FOUND: Qiraji Execution Bracers (ilevel 81 entry 21602)
-- NOT FOUND: Wand of Qiraji Nobility (ilevel 78 entry 21603)
-- NOT FOUND: Bracelets of Royal Redemption (ilevel 81 entry 21604)
-- NOT FOUND: Gloves of the Hidden Temple (ilevel 81 entry 21605)
-- NOT FOUND: Belt of the Fallen Emperor (ilevel 81 entry 21606)
-- NOT FOUND: Grasp of the Fallen Emperor (ilevel 81 entry 21607)
-- NOT FOUND: Amulet of Vek'nilash (ilevel 81 entry 21608)
-- NOT FOUND: Regenerating Belt of Vek'nilash (ilevel 81 entry 21609)
-- NOT FOUND: Wormscale Blocker (ilevel 81 entry 21610)
-- NOT FOUND: Burrower Bracers (ilevel 81 entry 21611)
-- NOT FOUND: Don Rigoberto's Lost Hat (ilevel 81 entry 21615)
-- NOT FOUND: Huhuran's Stinger (ilevel 78 entry 21616)
-- NOT FOUND: Wasphide Gauntlets (ilevel 78 entry 21617)
-- NOT FOUND: Hive Defiler Wristguards (ilevel 78 entry 21618)
-- NOT FOUND: Gloves of the Messiah (ilevel 78 entry 21619)
-- NOT FOUND: Ring of the Martyr (ilevel 78 entry 21620)
-- NOT FOUND: Cloak of the Golden Hive (ilevel 78 entry 21621)
-- NOT FOUND: Sharpened Silithid Femur (ilevel 78 entry 21622)
-- NOT FOUND: Gauntlets of the Righteous Champion (ilevel 78 entry 21623)
-- NOT FOUND: Gauntlets of Kalimdor (ilevel 78 entry 21624)
-- NOT FOUND: Scarab Brooch (ilevel 78 entry 21625)
-- NOT FOUND: Slime-coated Leggings (ilevel 78 entry 21626)
-- NOT FOUND: Cloak of Untold Secrets (ilevel 77 entry 21627)
-- NOT FOUND: Barb of the Sand Reaver (ilevel 77 entry 21635)
-- NOT FOUND: Pauldrons of the Unrelenting (ilevel 77 entry 21639)
-- NOT FOUND: Hive Tunneler's Boots (ilevel 77 entry 21645)
-- NOT FOUND: Fetish of the Sand Reaver (ilevel 77 entry 21647)
-- NOT FOUND: Recomposed Boots (ilevel 76 entry 21648)
-- NOT FOUND: Ancient Qiraji Ripper (ilevel 77 entry 21650)
-- NOT FOUND: Scaled Sand Reaver Leggings (ilevel 77 entry 21651)
-- NOT FOUND: Silithid Carapace Chestguard (ilevel 77 entry 21652)
-- NOT FOUND: Robes of the Guardian Saint (ilevel 77 entry 21663)
-- NOT FOUND: Barbed Choker (ilevel 77 entry 21664)
-- NOT FOUND: Mantle of Wicked Revenge (ilevel 77 entry 21665)
-- NOT FOUND: Sartura's Might (ilevel 76 entry 21666)
-- NOT FOUND: Legplates of Blazing Light (ilevel 76 entry 21667)
-- NOT FOUND: Scaled Leggings of Qiraji Fury (ilevel 76 entry 21668)
-- NOT FOUND: Creeping Vine Helm (ilevel 76 entry 21669)
-- NOT FOUND: Badge of the Swarmguard (ilevel 76 entry 21670)
-- NOT FOUND: Robes of the Battleguard (ilevel 76 entry 21671)
-- NOT FOUND: Gloves of Enforcement (ilevel 76 entry 21672)
-- NOT FOUND: Silithid Claw (ilevel 76 entry 21673)
-- NOT FOUND: Gauntlets of Steadfast Determination (ilevel 76 entry 21674)
-- NOT FOUND: Thick Qirajihide Belt (ilevel 76 entry 21675)
-- NOT FOUND: Leggings of the Festering Swarm (ilevel 76 entry 21676)
-- NOT FOUND: Ring of the Qiraji Fury (ilevel 78 entry 21677)
-- NOT FOUND: Necklace of Purity (ilevel 76 entry 21678)
-- NOT FOUND: Kalimdor's Revenge (ilevel 81 entry 21679)
-- NOT FOUND: Vest of Swift Execution (ilevel 78 entry 21680)
-- NOT FOUND: Ring of the Devoured (ilevel 78 entry 21681)
-- NOT FOUND: Bile-Covered Gauntlets (ilevel 78 entry 21682)
-- NOT FOUND: Mantle of the Desert Crusade (ilevel 76 entry 21683)
-- NOT FOUND: Mantle of the Desert's Fury (ilevel 76 entry 21684)
-- NOT FOUND: Petrified Scarab (ilevel 76 entry 21685)
-- NOT FOUND: Mantle of Phrenic Power (ilevel 76 entry 21686)
-- NOT FOUND: Ukko's Ring of Darkness (ilevel 76 entry 21687)
-- NOT FOUND: Boots of the Fallen Hero (ilevel 75 entry 21688)
-- NOT FOUND: Gloves of Ebru (ilevel 75 entry 21689)
-- NOT FOUND: Angelista's Charm (ilevel 75 entry 21690)
-- NOT FOUND: Ooze-ridden Gauntlets (ilevel 75 entry 21691)
-- NOT FOUND: Triad Girdle (ilevel 75 entry 21692)
-- NOT FOUND: Guise of the Devourer (ilevel 75 entry 21693)
-- NOT FOUND: Ternary Mantle (ilevel 75 entry 21694)
-- NOT FOUND: Angelista's Touch (ilevel 75 entry 21695)
-- NOT FOUND: Robes of the Triumvirate (ilevel 75 entry 21696)
-- NOT FOUND: Cape of the Trinity (ilevel 75 entry 21697)
-- NOT FOUND: Leggings of Immersion (ilevel 73 entry 21698)
-- NOT FOUND: Barrage Shoulders (ilevel 73 entry 21699)
-- NOT FOUND: Pendant of the Qiraji Guardian (ilevel 73 entry 21700)
-- NOT FOUND: Cloak of Concentrated Hatred (ilevel 73 entry 21701)
-- NOT FOUND: Amulet of Foul Warding (ilevel 73 entry 21702)
-- NOT FOUND: Hammer of Ji'zhi (ilevel 73 entry 21703)
-- NOT FOUND: Boots of the Redeemed Prophecy (ilevel 73 entry 21704)
-- NOT FOUND: Boots of the Fallen Prophet (ilevel 73 entry 21705)
-- NOT FOUND: Boots of the Unwavering Will (ilevel 73 entry 21706)
-- NOT FOUND: Ring of Swarming Thought (ilevel 73 entry 21707)
-- NOT FOUND: Beetle Scaled Wristguards (ilevel 73 entry 21708)
-- NOT FOUND: Ring of the Fallen God (ilevel 88 entry 21709)
-- NOT FOUND: Cloak of the Fallen God (ilevel 88 entry 21710)
-- NOT FOUND: Amulet of the Fallen God (ilevel 88 entry 21712)
-- NOT FOUND: Elune's Candle (ilevel 1 entry 21713)
-- NOT FOUND: Sand Polished Hammer (ilevel 72 entry 21715)
-- NOT FOUND: Silithid Husked Launcher (ilevel 68 entry 21800)
-- NOT FOUND: Antenna of Invigoration (ilevel 68 entry 21801)
-- NOT FOUND: The Lost Kris of Zedd (ilevel 68 entry 21802)
-- NOT FOUND: Helm of the Holy Avenger (ilevel 68 entry 21803)
-- NOT FOUND: Coif of Elemental Fury (ilevel 68 entry 21804)
-- NOT FOUND: Polished Obsidian Pauldrons (ilevel 68 entry 21805)
-- NOT FOUND: Gavel of Qiraji Authority (ilevel 71 entry 21806)
-- NOT FOUND: Fury of the Forgotten Swarm (ilevel 71 entry 21809)
-- NOT FOUND: Treads of the Wandering Nomad (ilevel 71 entry 21810)
-- NOT FOUND: Breastplate of Annihilation (ilevel 73 entry 21814)
-- NOT FOUND: Ritssyn's Ring of Chaos (ilevel 71 entry 21836)
-- NOT FOUND: Anubisath Warhammer (ilevel 71 entry 21837)
-- NOT FOUND: Garb of Royal Ascension (ilevel 71 entry 21838)
-- NOT FOUND: Scepter of the False Prophet (ilevel 84 entry 21839)
-- NOT FOUND: Neretzek, The Blood Drinker (ilevel 71 entry 21856)
-- NOT FOUND: Gloves of the Immortal (ilevel 71 entry 21888)
-- NOT FOUND: Gloves of the Redeemed Prophecy (ilevel 75 entry 21889)
-- NOT FOUND: Shard of the Fallen Star (ilevel 75 entry 21891)
-- NOT FOUND: Belt of Heroism (ilevel 65 entry 21994)
-- NOT FOUND: Boots of Heroism (ilevel 60 entry 21995)
-- NOT FOUND: Bracers of Heroism (ilevel 65 entry 21996)
-- NOT FOUND: Breastplate of Heroism (ilevel 60 entry 21997)
-- NOT FOUND: Gauntlets of Heroism (ilevel 55 entry 21998)
-- NOT FOUND: Helm of Heroism (ilevel 60 entry 21999)
-- NOT FOUND: Legplates of Heroism (ilevel 66 entry 22000)
-- NOT FOUND: Spaulders of Heroism (ilevel 65 entry 22001)
-- NOT FOUND: Darkmantle Belt (ilevel 65 entry 22002)
-- NOT FOUND: Darkmantle Boots (ilevel 60 entry 22003)
-- NOT FOUND: Darkmantle Bracers (ilevel 65 entry 22004)
-- NOT FOUND: Darkmantle Cap (ilevel 60 entry 22005)
-- NOT FOUND: Darkmantle Gloves (ilevel 55 entry 22006)
-- NOT FOUND: Darkmantle Pants (ilevel 66 entry 22007)
-- NOT FOUND: Darkmantle Spaulders (ilevel 65 entry 22008)
-- NOT FOUND: Darkmantle Tunic (ilevel 60 entry 22009)
-- NOT FOUND: Beastmaster's Belt (ilevel 65 entry 22010)
-- NOT FOUND: Beastmaster's Bindings (ilevel 65 entry 22011)
-- NOT FOUND: Beastmaster's Cap (ilevel 60 entry 22013)
-- NOT FOUND: Beastmaster's Gloves (ilevel 55 entry 22015)
-- NOT FOUND: Beastmaster's Mantle (ilevel 65 entry 22016)
-- NOT FOUND: Beastmaster's Pants (ilevel 66 entry 22017)
-- NOT FOUND: Beastmaster's Tunic (ilevel 60 entry 22060)
-- NOT FOUND: Beastmaster's Boots (ilevel 60 entry 22061)
-- NOT FOUND: Sorcerer's Belt (ilevel 65 entry 22062)
-- NOT FOUND: Sorcerer's Bindings (ilevel 65 entry 22063)
-- NOT FOUND: Sorcerer's Boots (ilevel 60 entry 22064)
-- NOT FOUND: Sorcerer's Crown (ilevel 60 entry 22065)
-- NOT FOUND: Sorcerer's Gloves (ilevel 55 entry 22066)
-- NOT FOUND: Sorcerer's Leggings (ilevel 66 entry 22067)
-- NOT FOUND: Sorcerer's Mantle (ilevel 65 entry 22068)
-- NOT FOUND: Sorcerer's Robes (ilevel 60 entry 22069)
-- NOT FOUND: Deathmist Belt (ilevel 65 entry 22070)
-- NOT FOUND: Deathmist Bracers (ilevel 65 entry 22071)
-- NOT FOUND: Deathmist Leggings (ilevel 66 entry 22072)
-- NOT FOUND: Deathmist Mantle (ilevel 65 entry 22073)
-- NOT FOUND: Deathmist Mask (ilevel 60 entry 22074)
-- NOT FOUND: Deathmist Robe (ilevel 60 entry 22075)
-- NOT FOUND: Deathmist Sandals (ilevel 60 entry 22076)
-- NOT FOUND: Deathmist Wraps (ilevel 55 entry 22077)
-- NOT FOUND: Virtuous Belt (ilevel 65 entry 22078)
-- NOT FOUND: Virtuous Bracers (ilevel 65 entry 22079)
-- NOT FOUND: Virtuous Crown (ilevel 60 entry 22080)
-- NOT FOUND: Virtuous Gloves (ilevel 55 entry 22081)
-- NOT FOUND: Virtuous Mantle (ilevel 65 entry 22082)
-- NOT FOUND: Virtuous Robe (ilevel 60 entry 22083)
-- NOT FOUND: Virtuous Sandals (ilevel 60 entry 22084)
-- NOT FOUND: Virtuous Skirt (ilevel 66 entry 22085)
-- NOT FOUND: Soulforge Belt (ilevel 65 entry 22086)
-- NOT FOUND: Soulforge Boots (ilevel 60 entry 22087)
-- NOT FOUND: Soulforge Bracers (ilevel 65 entry 22088)
-- NOT FOUND: Soulforge Breastplate (ilevel 60 entry 22089)
-- NOT FOUND: Soulforge Gauntlets (ilevel 55 entry 22090)
-- NOT FOUND: Soulforge Helm (ilevel 60 entry 22091)
-- NOT FOUND: Soulforge Legplates (ilevel 66 entry 22092)
-- NOT FOUND: Soulforge Spaulders (ilevel 65 entry 22093)
-- NOT FOUND: Bindings of The Five Thunders (ilevel 65 entry 22095)
-- NOT FOUND: Boots of The Five Thunders (ilevel 60 entry 22096)
-- NOT FOUND: Coif of The Five Thunders (ilevel 60 entry 22097)
-- NOT FOUND: Cord of The Five Thunders (ilevel 65 entry 22098)
-- NOT FOUND: Gauntlets of The Five Thunders (ilevel 55 entry 22099)
-- NOT FOUND: Kilt of The Five Thunders (ilevel 66 entry 22100)
-- NOT FOUND: Pauldrons of The Five Thunders (ilevel 65 entry 22101)
-- NOT FOUND: Vest of The Five Thunders (ilevel 60 entry 22102)
-- NOT FOUND: Feralheart Belt (ilevel 65 entry 22106)
-- NOT FOUND: Feralheart Boots (ilevel 60 entry 22107)
-- NOT FOUND: Feralheart Bracers (ilevel 65 entry 22108)
-- NOT FOUND: Feralheart Cowl (ilevel 60 entry 22109)
-- NOT FOUND: Feralheart Gloves (ilevel 55 entry 22110)
-- NOT FOUND: Feralheart Kilt (ilevel 66 entry 22111)
-- NOT FOUND: Feralheart Spaulders (ilevel 65 entry 22112)
-- NOT FOUND: Feralheart Vest (ilevel 60 entry 22113)
-- NOT FOUND: Beads of Ogre Mojo (ilevel 63 entry 22149)
-- NOT FOUND: Beads of Ogre Might (ilevel 63 entry 22150)
-- NOT FOUND: Obsidian Mail Tunic (ilevel 72 entry 22191)
-- NOT FOUND: Black Grasp of the Destroyer (ilevel 70 entry 22194)
-- NOT FOUND: Light Obsidian Belt (ilevel 68 entry 22195)
-- NOT FOUND: Thick Obsidian Breastplate (ilevel 72 entry 22196)
-- NOT FOUND: Heavy Obsidian Belt (ilevel 68 entry 22197)
-- NOT FOUND: Jagged Obsidian Shield (ilevel 70 entry 22198)
-- NOT FOUND: Wristguards of Renown (ilevel 60 entry 22204)
-- NOT FOUND: Black Steel Bindings (ilevel 57 entry 22205)
-- NOT FOUND: Bouquet of Red Roses (ilevel 1 entry 22206)
-- NOT FOUND: Sash of the Grand Hunt (ilevel 60 entry 22207)
-- NOT FOUND: Lavastone Hammer (ilevel 58 entry 22208)
-- NOT FOUND: Golem Fitted Pauldrons (ilevel 56 entry 22212)
-- NOT FOUND: Foreman's Head Protector (ilevel 55 entry 22223)
-- NOT FOUND: Kayser's Boots of Precision (ilevel 61 entry 22231)
-- NOT FOUND: Marksman's Girdle (ilevel 61 entry 22232)
-- NOT FOUND: Mantle of Lost Hope (ilevel 53 entry 22234)
-- NOT FOUND: Greaves of Withering Despair (ilevel 53 entry 22240)
-- NOT FOUND: Dark Warder's Pauldrons (ilevel 57 entry 22241)
-- NOT FOUND: Verek's Leash (ilevel 56 entry 22242)
-- NOT FOUND: Soot Encrusted Footwear (ilevel 56 entry 22245)
-- NOT FOUND: Faith Healer's Boots (ilevel 63 entry 22247)
-- NOT FOUND: Tome of the Lost (ilevel 63 entry 22253)
-- NOT FOUND: Wand of Eternal Light (ilevel 57 entry 22254)
-- NOT FOUND: Magma Forged Band (ilevel 57 entry 22255)
-- NOT FOUND: Mana Shaping Handwraps (ilevel 57 entry 22256)
-- NOT FOUND: Bloodclot Band (ilevel 57 entry 22257)
-- NOT FOUND: Flarethorn (ilevel 57 entry 22266)
-- NOT FOUND: Spellweaver's Turban (ilevel 63 entry 22267)
-- NOT FOUND: Draconic Infused Emblem (ilevel 63 entry 22268)
-- NOT FOUND: Shadow Prowler's Cloak (ilevel 63 entry 22269)
-- NOT FOUND: Entrenching Boots (ilevel 55 entry 22270)
-- NOT FOUND: Leggings of Frenzied Magic (ilevel 57 entry 22271)
-- NOT FOUND: Forest's Embrace (ilevel 52 entry 22272)
-- NOT FOUND: Grizzled Pelt (ilevel 52 entry 22274)
-- NOT FOUND: Firemoss Boots (ilevel 57 entry 22275)
-- NOT FOUND: Lovely Red Dress (ilevel 1 entry 22276)
-- NOT FOUND: Red Dinner Suit (ilevel 1 entry 22277)
-- NOT FOUND: Lovely Blue Dress (ilevel 1 entry 22278)
-- NOT FOUND: Lovely Black Dress (ilevel 1 entry 22279)
-- NOT FOUND: Lovely Purple Dress (ilevel 1 entry 22280)
-- NOT FOUND: Blue Dinner Suit (ilevel 1 entry 22281)
-- NOT FOUND: Purple Dinner Suit (ilevel 1 entry 22282)
-- NOT FOUND: Ironweave Robe (ilevel 63 entry 22301)
-- NOT FOUND: Ironweave Cowl (ilevel 63 entry 22302)
-- NOT FOUND: Ironweave Pants (ilevel 62 entry 22303)
-- NOT FOUND: Ironweave Gloves (ilevel 61 entry 22304)
-- NOT FOUND: Ironweave Mantle (ilevel 61 entry 22305)
-- NOT FOUND: Ironweave Belt (ilevel 61 entry 22306)
-- NOT FOUND: Ironweave Boots (ilevel 61 entry 22311)
-- NOT FOUND: Ironweave Bracers (ilevel 61 entry 22313)
-- NOT FOUND: Huntsman's Harpoon (ilevel 61 entry 22314)
-- NOT FOUND: Hammer of Revitalization (ilevel 61 entry 22315)
-- NOT FOUND: Lefty's Brass Knuckle (ilevel 61 entry 22317)
-- NOT FOUND: Malgen's Long Bow (ilevel 61 entry 22318)
-- NOT FOUND: Tome of Divine Right (ilevel 61 entry 22319)
-- NOT FOUND: Heart of Wyrmthalak (ilevel 61 entry 22321)
-- NOT FOUND: The Jaw Breaker (ilevel 61 entry 22322)
-- NOT FOUND: Belt of the Trickster (ilevel 61 entry 22325)
-- NOT FOUND: Amalgam's Band (ilevel 63 entry 22326)
-- NOT FOUND: Amulet of the Redeemed (ilevel 63 entry 22327)
-- NOT FOUND: Legplates of Vigilance (ilevel 63 entry 22328)
-- NOT FOUND: Scepter of Interminable Focus (ilevel 63 entry 22329)
-- NOT FOUND: Shroud of Arcane Mastery (ilevel 61 entry 22330)
-- NOT FOUND: Band of the Steadfast Hero (ilevel 62 entry 22331)
-- NOT FOUND: Blade of Necromancy (ilevel 62 entry 22332)
-- NOT FOUND: Hammer of Divine Might (ilevel 62 entry 22333)
-- NOT FOUND: Band of Mending (ilevel 62 entry 22334)
-- NOT FOUND: Lord Valthalak's Staff of Command (ilevel 63 entry 22335)
-- NOT FOUND: Draconian Aegis of the Legion (ilevel 63 entry 22336)
-- NOT FOUND: Shroud of Domination (ilevel 63 entry 22337)
-- NOT FOUND: Rune Band of Wizardry (ilevel 63 entry 22339)
-- NOT FOUND: Pendant of Celerity (ilevel 63 entry 22340)
-- NOT FOUND: Leggings of Torment (ilevel 63 entry 22342)
-- NOT FOUND: Handguards of Savagery (ilevel 63 entry 22343)
-- NOT FOUND: Totem of Rebirth (ilevel 62 entry 22345)
-- NOT FOUND: Fahrad's Reloading Repeater (ilevel 65 entry 22347)
-- NOT FOUND: Doomulus Prime (ilevel 65 entry 22348)
-- NOT FOUND: The Thunderwood Poker (ilevel 65 entry 22377)
-- NOT FOUND: Ravenholdt Slicer (ilevel 65 entry 22378)
-- NOT FOUND: Shivsprocket's Shiv (ilevel 65 entry 22379)
-- NOT FOUND: Simone's Cultivating Hammer (ilevel 65 entry 22380)
-- NOT FOUND: Sageblade (ilevel 64 entry 22383)
-- NOT FOUND: Persuader (ilevel 63 entry 22384)
-- NOT FOUND: Titanic Leggings (ilevel 60 entry 22385)
-- NOT FOUND: Staff of Metanoia (ilevel 62 entry 22394)
-- NOT FOUND: Totem of Rage (ilevel 57 entry 22395)
-- NOT FOUND: Totem of Life (ilevel 78 entry 22396)
-- NOT FOUND: Idol of Ferocity (ilevel 57 entry 22397)
-- NOT FOUND: Idol of Rejuvenation (ilevel 62 entry 22398)
-- NOT FOUND: Idol of Health (ilevel 78 entry 22399)
-- NOT FOUND: Libram of Truth (ilevel 57 entry 22400)
-- NOT FOUND: Libram of Hope (ilevel 62 entry 22401)
-- NOT FOUND: Libram of Grace (ilevel 78 entry 22402)
-- NOT FOUND: Diana's Pearl Necklace (ilevel 61 entry 22403)
-- NOT FOUND: Willey's Back Scratcher (ilevel 61 entry 22404)
-- NOT FOUND: Mantle of the Scarlet Crusade (ilevel 61 entry 22405)
-- NOT FOUND: Redemption (ilevel 61 entry 22406)
-- NOT FOUND: Helm of the New Moon (ilevel 61 entry 22407)
-- NOT FOUND: Ritssyn's Wand of Bad Mojo (ilevel 63 entry 22408)
-- NOT FOUND: Tunic of the Crescent Moon (ilevel 63 entry 22409)
-- NOT FOUND: Gauntlets of Deftness (ilevel 63 entry 22410)
-- NOT FOUND: Helm of the Executioner (ilevel 63 entry 22411)
-- NOT FOUND: Thuzadin Mantle (ilevel 63 entry 22412)
-- NOT FOUND: Dreadnaught Breastplate (ilevel 92 entry 22416)
-- NOT FOUND: Dreadnaught Legplates (ilevel 88 entry 22417)
-- NOT FOUND: Dreadnaught Helmet (ilevel 88 entry 22418)
-- NOT FOUND: Dreadnaught Pauldrons (ilevel 86 entry 22419)
-- NOT FOUND: Dreadnaught Sabatons (ilevel 86 entry 22420)
-- NOT FOUND: Dreadnaught Gauntlets (ilevel 88 entry 22421)
-- NOT FOUND: Dreadnaught Waistguard (ilevel 88 entry 22422)
-- NOT FOUND: Dreadnaught Bracers (ilevel 88 entry 22423)
-- NOT FOUND: Redemption Wristguards (ilevel 88 entry 22424)
-- NOT FOUND: Redemption Tunic (ilevel 92 entry 22425)
-- NOT FOUND: Redemption Handguards (ilevel 88 entry 22426)
-- NOT FOUND: Redemption Legguards (ilevel 88 entry 22427)
-- NOT FOUND: Redemption Headpiece (ilevel 88 entry 22428)
-- NOT FOUND: Redemption Spaulders (ilevel 86 entry 22429)
-- NOT FOUND: Redemption Boots (ilevel 86 entry 22430)
-- NOT FOUND: Redemption Girdle (ilevel 88 entry 22431)
-- NOT FOUND: Don Mauricio's Band of Domination (ilevel 63 entry 22433)
-- NOT FOUND: Cryptstalker Tunic (ilevel 92 entry 22436)
-- NOT FOUND: Cryptstalker Legguards (ilevel 88 entry 22437)
-- NOT FOUND: Cryptstalker Headpiece (ilevel 88 entry 22438)
-- NOT FOUND: Cryptstalker Spaulders (ilevel 86 entry 22439)
-- NOT FOUND: Cryptstalker Boots (ilevel 86 entry 22440)
-- NOT FOUND: Cryptstalker Handguards (ilevel 88 entry 22441)
-- NOT FOUND: Cryptstalker Girdle (ilevel 88 entry 22442)
-- NOT FOUND: Cryptstalker Wristguards (ilevel 88 entry 22443)
-- NOT FOUND: Moonshadow Stave (ilevel 52 entry 22458)
-- NOT FOUND: Earthshatter Tunic (ilevel 92 entry 22464)
-- NOT FOUND: Earthshatter Legguards (ilevel 88 entry 22465)
-- NOT FOUND: Earthshatter Headpiece (ilevel 88 entry 22466)
-- NOT FOUND: Earthshatter Spaulders (ilevel 86 entry 22467)
-- NOT FOUND: Earthshatter Boots (ilevel 86 entry 22468)
-- NOT FOUND: Earthshatter Handguards (ilevel 88 entry 22469)
-- NOT FOUND: Earthshatter Girdle (ilevel 88 entry 22470)
-- NOT FOUND: Earthshatter Wristguards (ilevel 88 entry 22471)
-- NOT FOUND: Boots of Ferocity (ilevel 61 entry 22472)
-- NOT FOUND: Bonescythe Breastplate (ilevel 92 entry 22476)
-- NOT FOUND: Bonescythe Legplates (ilevel 88 entry 22477)
-- NOT FOUND: Bonescythe Helmet (ilevel 88 entry 22478)
-- NOT FOUND: Bonescythe Pauldrons (ilevel 86 entry 22479)
-- NOT FOUND: Bonescythe Sabatons (ilevel 86 entry 22480)
-- NOT FOUND: Bonescythe Gauntlets (ilevel 88 entry 22481)
-- NOT FOUND: Bonescythe Waistguard (ilevel 88 entry 22482)
-- NOT FOUND: Bonescythe Bracers (ilevel 88 entry 22483)
-- NOT FOUND: Dreamwalker Tunic (ilevel 92 entry 22488)
-- NOT FOUND: Dreamwalker Legguards (ilevel 88 entry 22489)
-- NOT FOUND: Dreamwalker Headpiece (ilevel 88 entry 22490)
-- NOT FOUND: Dreamwalker Spaulders (ilevel 86 entry 22491)
-- NOT FOUND: Dreamwalker Boots (ilevel 86 entry 22492)
-- NOT FOUND: Dreamwalker Handguards (ilevel 88 entry 22493)
-- NOT FOUND: Dreamwalker Girdle (ilevel 88 entry 22494)
-- NOT FOUND: Dreamwalker Wristguards (ilevel 88 entry 22495)
-- NOT FOUND: Frostfire Robe (ilevel 92 entry 22496)
-- NOT FOUND: Frostfire Leggings (ilevel 88 entry 22497)
-- NOT FOUND: Frostfire Circlet (ilevel 88 entry 22498)
-- NOT FOUND: Frostfire Shoulderpads (ilevel 86 entry 22499)
-- NOT FOUND: Frostfire Sandals (ilevel 86 entry 22500)
-- NOT FOUND: Frostfire Gloves (ilevel 88 entry 22501)
-- NOT FOUND: Frostfire Belt (ilevel 88 entry 22502)
-- NOT FOUND: Frostfire Bindings (ilevel 88 entry 22503)
-- NOT FOUND: Plagueheart Robe (ilevel 92 entry 22504)
-- NOT FOUND: Plagueheart Leggings (ilevel 88 entry 22505)
-- NOT FOUND: Plagueheart Circlet (ilevel 88 entry 22506)
-- NOT FOUND: Plagueheart Shoulderpads (ilevel 86 entry 22507)
-- NOT FOUND: Plagueheart Sandals (ilevel 86 entry 22508)
-- NOT FOUND: Plagueheart Gloves (ilevel 88 entry 22509)
-- NOT FOUND: Plagueheart Belt (ilevel 88 entry 22510)
-- NOT FOUND: Plagueheart Bindings (ilevel 88 entry 22511)
-- NOT FOUND: Robe of Faith (ilevel 92 entry 22512)
-- NOT FOUND: Leggings of Faith (ilevel 88 entry 22513)
-- NOT FOUND: Circlet of Faith (ilevel 88 entry 22514)
-- NOT FOUND: Shoulderpads of Faith (ilevel 86 entry 22515)
-- NOT FOUND: Sandals of Faith (ilevel 86 entry 22516)
-- NOT FOUND: Gloves of Faith (ilevel 88 entry 22517)
-- NOT FOUND: Belt of Faith (ilevel 88 entry 22518)
-- NOT FOUND: Bindings of Faith (ilevel 88 entry 22519)
-- NOT FOUND: Atiesh, Greatstaff of the Guardian (ilevel 90 entry 22589)
-- NOT FOUND: Atiesh, Greatstaff of the Guardian (ilevel 90 entry 22630)
-- NOT FOUND: Atiesh, Greatstaff of the Guardian (ilevel 90 entry 22631)
-- NOT FOUND: Atiesh, Greatstaff of the Guardian (ilevel 90 entry 22632)
-- NOT FOUND: Outrider's Plate Legguards (ilevel 65 entry 22651)
-- NOT FOUND: Glacial Vest (ilevel 80 entry 22652)
-- NOT FOUND: Glacial Gloves (ilevel 80 entry 22654)
-- NOT FOUND: Glacial Wrists (ilevel 80 entry 22655)
-- NOT FOUND: The Purifier (ilevel 60 entry 22656)
-- NOT FOUND: Amulet of the Dawn (ilevel 60 entry 22657)
-- NOT FOUND: Glacial Cloak (ilevel 80 entry 22658)
-- NOT FOUND: Medallion of the Dawn (ilevel 60 entry 22659)
-- NOT FOUND: Gaea's Embrace (ilevel 70 entry 22660)
-- NOT FOUND: Polar Tunic (ilevel 80 entry 22661)
-- NOT FOUND: Polar Gloves (ilevel 80 entry 22662)
-- NOT FOUND: Polar Bracers (ilevel 80 entry 22663)
-- NOT FOUND: Icy Scale Breastplate (ilevel 80 entry 22664)
-- NOT FOUND: Icy Scale Bracers (ilevel 80 entry 22665)
-- NOT FOUND: Icy Scale Gauntlets (ilevel 80 entry 22666)
-- NOT FOUND: Bracers of Hope (ilevel 60 entry 22667)
-- NOT FOUND: Bracers of Subterfuge (ilevel 60 entry 22668)
-- NOT FOUND: Icebane Breastplate (ilevel 80 entry 22669)
-- NOT FOUND: Icebane Gauntlets (ilevel 80 entry 22670)
-- NOT FOUND: Icebane Bracers (ilevel 80 entry 22671)
-- NOT FOUND: Sentinel's Plate Legguards (ilevel 65 entry 22672)
-- NOT FOUND: Outrider's Chain Leggings (ilevel 65 entry 22673)
-- NOT FOUND: Outrider's Mail Leggings (ilevel 65 entry 22676)
-- NOT FOUND: Talisman of Ascendance (ilevel 60 entry 22678)
-- NOT FOUND: Band of Resolution (ilevel 66 entry 22680)
-- NOT FOUND: Band of Piety (ilevel 66 entry 22681)
-- NOT FOUND: Verimonde's Last Resort (ilevel 66 entry 22688)
-- NOT FOUND: Sanctified Leather Helm (ilevel 66 entry 22689)
-- NOT FOUND: Leggings of the Plague Hunter (ilevel 66 entry 22690)
-- NOT FOUND: Corrupted Ashbringer (ilevel 86 entry 22691)
-- NOT FOUND: Icebane Leggings (ilevel 80 entry 22699)
-- NOT FOUND: Glacial Leggings (ilevel 80 entry 22700)
-- NOT FOUND: Polar Leggings (ilevel 80 entry 22701)
-- NOT FOUND: Icy Scale Leggings (ilevel 80 entry 22702)
-- NOT FOUND: Ramaladni's Icy Grasp (ilevel 80 entry 22707)
-- NOT FOUND: Cloak of the Hakkari Worshipers (ilevel 68 entry 22711)
-- NOT FOUND: Might of the Tribe (ilevel 68 entry 22712)
-- NOT FOUND: Zulian Scepter of Rites (ilevel 68 entry 22713)
-- NOT FOUND: Sacrificial Gauntlets (ilevel 68 entry 22714)
-- NOT FOUND: Gloves of the Tormented (ilevel 68 entry 22715)
-- NOT FOUND: Belt of Untapped Power (ilevel 68 entry 22716)
-- NOT FOUND: Blooddrenched Mask (ilevel 68 entry 22718)
-- NOT FOUND: Zulian Headdress (ilevel 68 entry 22720)
-- NOT FOUND: Band of Servitude (ilevel 65 entry 22721)
-- NOT FOUND: Seal of the Gurubashi Berserker (ilevel 65 entry 22722)
-- NOT FOUND: Band of Cenarius (ilevel 70 entry 22725)
-- NOT FOUND: Eyestalk Waist Cord (ilevel 88 entry 22730)
-- NOT FOUND: Cloak of the Devoured (ilevel 88 entry 22731)
-- NOT FOUND: Mark of C'Thun (ilevel 88 entry 22732)
-- NOT FOUND: Andonisus, Reaper of Souls (ilevel 100 entry 22736)
-- NOT FOUND: Outrider's Leather Pants (ilevel 65 entry 22740)
-- NOT FOUND: Outrider's Lizardhide Pants (ilevel 65 entry 22741)
-- NOT FOUND: Bloodsail Shirt (ilevel 1 entry 22742)
-- NOT FOUND: Bloodsail Boots (ilevel 1 entry 22744)
-- NOT FOUND: Bloodsail Pants (ilevel 1 entry 22745)
-- NOT FOUND: Outrider's Silk Leggings (ilevel 65 entry 22747)
-- NOT FOUND: Sentinel's Chain Leggings (ilevel 65 entry 22748)
-- NOT FOUND: Sentinel's Leather Pants (ilevel 65 entry 22749)
-- NOT FOUND: Sentinel's Lizardhide Pants (ilevel 65 entry 22750)
-- NOT FOUND: Sentinel's Silk Leggings (ilevel 65 entry 22752)
-- NOT FOUND: Sentinel's Lamellar Legguards (ilevel 65 entry 22753)
-- NOT FOUND: Sylvan Vest (ilevel 70 entry 22756)
-- NOT FOUND: Sylvan Crown (ilevel 70 entry 22757)
-- NOT FOUND: Sylvan Shoulders (ilevel 70 entry 22758)
-- NOT FOUND: Bramblewood Helm (ilevel 70 entry 22759)
-- NOT FOUND: Bramblewood Boots (ilevel 70 entry 22760)
-- NOT FOUND: Bramblewood Belt (ilevel 70 entry 22761)
-- NOT FOUND: Ironvine Breastplate (ilevel 70 entry 22762)
-- NOT FOUND: Ironvine Gloves (ilevel 70 entry 22763)
-- NOT FOUND: Ironvine Belt (ilevel 70 entry 22764)
-- NOT FOUND: Might of Menethil (ilevel 89 entry 22798)
-- NOT FOUND: Soulseeker (ilevel 89 entry 22799)
-- NOT FOUND: Brimstone Staff (ilevel 83 entry 22800)
-- NOT FOUND: Spire of Twilight (ilevel 83 entry 22801)
-- NOT FOUND: Kingsfall (ilevel 89 entry 22802)
-- NOT FOUND: Midnight Haze (ilevel 81 entry 22803)
-- NOT FOUND: Maexxna's Fang (ilevel 83 entry 22804)
-- NOT FOUND: Widow's Remorse (ilevel 81 entry 22806)
-- NOT FOUND: Wraith Blade (ilevel 83 entry 22807)
-- NOT FOUND: The Castigator (ilevel 83 entry 22808)
-- NOT FOUND: Maul of the Redeemed Crusader (ilevel 83 entry 22809)
-- NOT FOUND: Toxin Injector (ilevel 81 entry 22810)
-- NOT FOUND: Soulstring (ilevel 83 entry 22811)
-- NOT FOUND: Nerubian Slavemaker (ilevel 89 entry 22812)
-- NOT FOUND: Claymore of Unholy Might (ilevel 81 entry 22813)
-- NOT FOUND: Severance (ilevel 81 entry 22815)
-- NOT FOUND: Hatchet of Sundered Bone (ilevel 83 entry 22816)
-- NOT FOUND: The Plague Bearer (ilevel 83 entry 22818)
-- NOT FOUND: Shield of Condemnation (ilevel 92 entry 22819)
-- NOT FOUND: Wand of Fates (ilevel 83 entry 22820)
-- NOT FOUND: Doomfinger (ilevel 92 entry 22821)
-- NOT FOUND: Blood Guard's Chain Greaves (ilevel 66 entry 22843)
-- NOT FOUND: Blood Guard's Dragonhide Treads (ilevel 66 entry 22852)
-- NOT FOUND: Blood Guard's Dreadweave Walkers (ilevel 66 entry 22855)
-- NOT FOUND: Blood Guard's Leather Walkers (ilevel 66 entry 22856)
-- NOT FOUND: Blood Guard's Mail Greaves (ilevel 66 entry 22857)
-- NOT FOUND: Blood Guard's Plate Greaves (ilevel 66 entry 22858)
-- NOT FOUND: Blood Guard's Satin Walkers (ilevel 66 entry 22859)
-- NOT FOUND: Blood Guard's Silk Walkers (ilevel 66 entry 22860)
-- NOT FOUND: Blood Guard's Chain Vices (ilevel 66 entry 22862)
-- NOT FOUND: Blood Guard's Dragonhide Grips (ilevel 66 entry 22863)
-- NOT FOUND: Blood Guard's Leather Grips (ilevel 66 entry 22864)
-- NOT FOUND: Blood Guard's Dreadweave Handwraps (ilevel 66 entry 22865)
-- NOT FOUND: Blood Guard's Mail Vices (ilevel 66 entry 22867)
-- NOT FOUND: Blood Guard's Plate Gauntlets (ilevel 66 entry 22868)
-- NOT FOUND: Blood Guard's Satin Handwraps (ilevel 66 entry 22869)
-- NOT FOUND: Blood Guard's Silk Handwraps (ilevel 66 entry 22870)
-- NOT FOUND: Legionnaire's Plate Hauberk (ilevel 68 entry 22872)
-- NOT FOUND: Legionnaire's Plate Leggings (ilevel 68 entry 22873)
-- NOT FOUND: Legionnaire's Chain Hauberk (ilevel 68 entry 22874)
-- NOT FOUND: Legionnaire's Chain Legguards (ilevel 68 entry 22875)
-- NOT FOUND: Legionnaire's Mail Hauberk (ilevel 68 entry 22876)
-- NOT FOUND: Legionnaire's Dragonhide Chestpiece (ilevel 68 entry 22877)
-- NOT FOUND: Legionnaire's Dragonhide Leggings (ilevel 68 entry 22878)
-- NOT FOUND: Legionnaire's Leather Chestpiece (ilevel 68 entry 22879)
-- NOT FOUND: Legionnaire's Leather Legguards (ilevel 68 entry 22880)
-- NOT FOUND: Legionnaire's Dreadweave Legguards (ilevel 68 entry 22881)
-- NOT FOUND: Legionnaire's Satin Legguards (ilevel 68 entry 22882)
-- NOT FOUND: Legionnaire's Silk Legguards (ilevel 68 entry 22883)
-- NOT FOUND: Legionnaire's Dreadweave Tunic (ilevel 68 entry 22884)
-- NOT FOUND: Legionnaire's Satin Tunic (ilevel 68 entry 22885)
-- NOT FOUND: Legionnaire's Silk Tunic (ilevel 68 entry 22886)
-- NOT FOUND: Legionnaire's Mail Legguards (ilevel 68 entry 22887)
-- NOT FOUND: Touch of Frost (ilevel 83 entry 22935)
-- NOT FOUND: Wristguards of Vengeance (ilevel 83 entry 22936)
-- NOT FOUND: Gem of Nerubis (ilevel 83 entry 22937)
-- NOT FOUND: Cryptfiend Silk Cloak (ilevel 83 entry 22938)
-- NOT FOUND: Band of Unanswered Prayers (ilevel 83 entry 22939)
-- NOT FOUND: Icebane Pauldrons (ilevel 83 entry 22940)
-- NOT FOUND: Polar Shoulder Pads (ilevel 83 entry 22941)
-- NOT FOUND: The Widow's Embrace (ilevel 81 entry 22942)
-- NOT FOUND: Malice Stone Pendant (ilevel 83 entry 22943)
-- NOT FOUND: Pendant of Forgotten Names (ilevel 85 entry 22947)
-- NOT FOUND: Kiss of the Spider (ilevel 85 entry 22954)
-- NOT FOUND: Cloak of Suturing (ilevel 83 entry 22960)
-- NOT FOUND: Band of Reanimation (ilevel 83 entry 22961)
-- NOT FOUND: Icy Scale Spaulders (ilevel 83 entry 22967)
-- NOT FOUND: Glacial Mantle (ilevel 83 entry 22968)
-- NOT FOUND: Gluth's Missing Collar (ilevel 83 entry 22981)
-- NOT FOUND: Rime Covered Mantle (ilevel 83 entry 22983)
-- NOT FOUND: The End of Dreams (ilevel 83 entry 22988)
-- NOT FOUND: Digested Hand of Power (ilevel 83 entry 22994)
-- NOT FOUND: Tabard of the Argent Dawn (ilevel 60 entry 22999)
-- NOT FOUND: Plated Abomination Ribcage (ilevel 85 entry 23000)
-- NOT FOUND: Eye of Diminution (ilevel 85 entry 23001)
-- NOT FOUND: Idol of Longevity (ilevel 83 entry 23004)
-- NOT FOUND: Totem of Flowing Water (ilevel 83 entry 23005)
-- NOT FOUND: Libram of Light (ilevel 83 entry 23006)
-- NOT FOUND: Wand of the Whispering Dead (ilevel 83 entry 23009)
-- NOT FOUND: Iblis, Blade of the Fallen Seraph (ilevel 81 entry 23014)
-- NOT FOUND: Veil of Eclipse (ilevel 83 entry 23017)
-- NOT FOUND: Signet of the Fallen Defender (ilevel 83 entry 23018)
-- NOT FOUND: Icebane Helmet (ilevel 83 entry 23019)
-- NOT FOUND: Polar Helmet (ilevel 83 entry 23020)
-- NOT FOUND: The Soul Harvester's Bindings (ilevel 83 entry 23021)
-- NOT FOUND: Sadist's Collar (ilevel 83 entry 23023)
-- NOT FOUND: Seal of the Damned (ilevel 85 entry 23025)
-- NOT FOUND: Warmth of Forgiveness (ilevel 85 entry 23027)
-- NOT FOUND: Hailstone Band (ilevel 83 entry 23028)
-- NOT FOUND: Noth's Frigid Heart (ilevel 83 entry 23029)
-- NOT FOUND: Cloak of the Scourge (ilevel 83 entry 23030)
-- NOT FOUND: Band of the Inevitable (ilevel 83 entry 23031)
-- NOT FOUND: Glacial Headdress (ilevel 83 entry 23032)
-- NOT FOUND: Icy Scale Coif (ilevel 83 entry 23033)
-- NOT FOUND: Preceptor's Hat (ilevel 83 entry 23035)
-- NOT FOUND: Necklace of Necropsy (ilevel 83 entry 23036)
-- NOT FOUND: Ring of Spiritual Fervor (ilevel 85 entry 23037)
-- NOT FOUND: Band of Unnatural Forces (ilevel 85 entry 23038)
-- NOT FOUND: The Eye of Nerub (ilevel 83 entry 23039)
-- NOT FOUND: Glyph of Deflection (ilevel 90 entry 23040)
-- NOT FOUND: Slayer's Crest (ilevel 90 entry 23041)
-- NOT FOUND: Loatheb's Reflection (ilevel 85 entry 23042)
-- NOT FOUND: The Face of Death (ilevel 90 entry 23043)
-- NOT FOUND: Harbinger of Doom (ilevel 83 entry 23044)
-- NOT FOUND: Shroud of Dominion (ilevel 90 entry 23045)
-- NOT FOUND: The Restrained Essence of Sapphiron (ilevel 90 entry 23046)
-- NOT FOUND: Eye of the Dead (ilevel 90 entry 23047)
-- NOT FOUND: Sapphiron's Right Eye (ilevel 90 entry 23048)
-- NOT FOUND: Sapphiron's Left Eye (ilevel 90 entry 23049)
-- NOT FOUND: Cloak of the Necropolis (ilevel 90 entry 23050)
-- NOT FOUND: Glaive of the Defender (ilevel 86 entry 23051)
-- NOT FOUND: Stormrage's Talisman of Seething (ilevel 92 entry 23053)
-- NOT FOUND: Gressil, Dawn of Ruin (ilevel 89 entry 23054)
-- NOT FOUND: Hammer of the Twisting Nether (ilevel 89 entry 23056)
-- NOT FOUND: Gem of Trapped Innocents (ilevel 92 entry 23057)
-- NOT FOUND: Ring of the Dreadnaught (ilevel 92 entry 23059)
-- NOT FOUND: Bonescythe Ring (ilevel 92 entry 23060)
-- NOT FOUND: Ring of Faith (ilevel 92 entry 23061)
-- NOT FOUND: Frostfire Ring (ilevel 92 entry 23062)
-- NOT FOUND: Plagueheart Ring (ilevel 92 entry 23063)
-- NOT FOUND: Ring of The Dreamwalker (ilevel 92 entry 23064)
-- NOT FOUND: Ring of the Earthshatterer (ilevel 92 entry 23065)
-- NOT FOUND: Ring of Redemption (ilevel 92 entry 23066)
-- NOT FOUND: Ring of  the Cryptstalker (ilevel 92 entry 23067)
-- NOT FOUND: Legplates of Carnage (ilevel 83 entry 23068)
-- NOT FOUND: Necro-Knight's Garb (ilevel 85 entry 23069)
-- NOT FOUND: Leggings of Polarity (ilevel 85 entry 23070)
-- NOT FOUND: Leggings of Apocalypse (ilevel 83 entry 23071)
-- NOT FOUND: Boots of Displacement (ilevel 83 entry 23073)
-- NOT FOUND: Death's Bargain (ilevel 83 entry 23075)
-- NOT FOUND: Gauntlets of Undead Slaying (ilevel 63 entry 23078)
-- NOT FOUND: Handwraps of Undead Slaying (ilevel 63 entry 23081)
-- NOT FOUND: Handguards of Undead Slaying (ilevel 63 entry 23082)
-- NOT FOUND: Gloves of Undead Cleansing (ilevel 63 entry 23084)
-- NOT FOUND: Robe of Undead Cleansing (ilevel 63 entry 23085)
-- NOT FOUND: Breastplate of Undead Slaying (ilevel 63 entry 23087)
-- NOT FOUND: Chestguard of Undead Slaying (ilevel 63 entry 23088)
-- NOT FOUND: Tunic of Undead Slaying (ilevel 63 entry 23089)
-- NOT FOUND: Bracers of Undead Slaying (ilevel 63 entry 23090)
-- NOT FOUND: Bracers of Undead Cleansing (ilevel 63 entry 23091)
-- NOT FOUND: Wristguards of Undead Slaying (ilevel 63 entry 23092)
-- NOT FOUND: Wristwraps of Undead Slaying (ilevel 63 entry 23093)
-- NOT FOUND: Staff of Balzaphon (ilevel 60 entry 23124)
-- NOT FOUND: Chains of the Lich (ilevel 60 entry 23125)
-- NOT FOUND: Waistband of Balzaphon (ilevel 60 entry 23126)
-- NOT FOUND: Cloak of Revanchion (ilevel 63 entry 23127)
-- NOT FOUND: The Shadow's Grasp (ilevel 62 entry 23128)
-- NOT FOUND: Bracers of Mending (ilevel 62 entry 23129)
-- NOT FOUND: Lord Blackwood's Blade (ilevel 62 entry 23132)
-- NOT FOUND: Lord Blackwood's Buckler (ilevel 62 entry 23139)
-- NOT FOUND: Blackwood's Thigh (ilevel 62 entry 23156)
-- NOT FOUND: Scorn's Focal Dagger (ilevel 35 entry 23168)
-- NOT FOUND: Scorn's Icy Choker (ilevel 35 entry 23169)
-- NOT FOUND: The Frozen Clutch (ilevel 35 entry 23170)
-- NOT FOUND: The Axe of Severing (ilevel 25 entry 23171)
-- NOT FOUND: Abomination Skin Leggings (ilevel 25 entry 23173)
-- NOT FOUND: Lady Falther'ess' Finger (ilevel 41 entry 23177)
-- NOT FOUND: Mantle of Lady Falther'ess (ilevel 41 entry 23178)
-- NOT FOUND: Idol of the Moon (ilevel 65 entry 23197)
-- NOT FOUND: Idol of Brutality (ilevel 65 entry 23198)
-- NOT FOUND: Totem of the Storm (ilevel 65 entry 23199)
-- NOT FOUND: Totem of Sustaining (ilevel 65 entry 23200)
-- NOT FOUND: Libram of Divinity (ilevel 65 entry 23201)
-- NOT FOUND: Libram of Fervor (ilevel 65 entry 23203)
-- NOT FOUND: Mark of the Champion (ilevel 90 entry 23206)
-- NOT FOUND: Mark of the Champion (ilevel 90 entry 23207)
-- NOT FOUND: Girdle of the Mentor (ilevel 85 entry 23219)
-- NOT FOUND: Crystal Webbed Robe (ilevel 85 entry 23220)
-- NOT FOUND: Misplaced Servo Arm (ilevel 83 entry 23221)
-- NOT FOUND: Ghoul Skin Tunic (ilevel 83 entry 23226)
-- NOT FOUND: Ring of the Eternal Flame (ilevel 83 entry 23237)
-- NOT FOUND: Stygian Buckler (ilevel 83 entry 23238)
-- NOT FOUND: Claw of the Frost Wyrm (ilevel 88 entry 23242)
-- NOT FOUND: Champion's Plate Shoulders (ilevel 71 entry 23243)
-- NOT FOUND: Champion's Plate Helm (ilevel 71 entry 23244)
-- NOT FOUND: Champion's Chain Helm (ilevel 71 entry 23251)
-- NOT FOUND: Champion's Chain Shoulders (ilevel 71 entry 23252)
-- NOT FOUND: Champion's Dragonhide Headguard (ilevel 71 entry 23253)
-- NOT FOUND: Champion's Dragonhide Shoulders (ilevel 71 entry 23254)
-- NOT FOUND: Champion's Dreadweave Cowl (ilevel 71 entry 23255)
-- NOT FOUND: Champion's Dreadweave Spaulders (ilevel 71 entry 23256)
-- NOT FOUND: Champion's Leather Helm (ilevel 71 entry 23257)
-- NOT FOUND: Champion's Leather Shoulders (ilevel 71 entry 23258)
-- NOT FOUND: Champion's Mail Headguard (ilevel 71 entry 23259)
-- NOT FOUND: Champion's Mail Pauldrons (ilevel 71 entry 23260)
-- NOT FOUND: Champion's Satin Hood (ilevel 71 entry 23261)
-- NOT FOUND: Champion's Satin Mantle (ilevel 71 entry 23262)
-- NOT FOUND: Champion's Silk Cowl (ilevel 71 entry 23263)
-- NOT FOUND: Champion's Silk Mantle (ilevel 71 entry 23264)
-- NOT FOUND: Knight-Captain's Lamellar Breastplate (ilevel 68 entry 23272)
-- NOT FOUND: Knight-Captain's Lamellar Leggings (ilevel 68 entry 23273)
-- NOT FOUND: Knight-Lieutenant's Lamellar Gauntlets (ilevel 66 entry 23274)
-- NOT FOUND: Knight-Lieutenant's Lamellar Sabatons (ilevel 66 entry 23275)
-- NOT FOUND: Lieutenant Commander's Lamellar Headguard (ilevel 71 entry 23276)
-- NOT FOUND: Lieutenant Commander's Lamellar Shoulders (ilevel 71 entry 23277)
-- NOT FOUND: Knight-Lieutenant's Chain Greaves (ilevel 66 entry 23278)
-- NOT FOUND: Knight-Lieutenant's Chain Vices (ilevel 66 entry 23279)
-- NOT FOUND: Knight-Lieutenant's Dragonhide Grips (ilevel 66 entry 23280)
-- NOT FOUND: Knight-Lieutenant's Dragonhide Treads (ilevel 66 entry 23281)
-- NOT FOUND: Knight-Lieutenant's Dreadweave Handwraps (ilevel 66 entry 23282)
-- NOT FOUND: Knight-Lieutenant's Dreadweave Walkers (ilevel 66 entry 23283)
-- NOT FOUND: Knight-Lieutenant's Leather Grips (ilevel 66 entry 23284)
-- NOT FOUND: Knight-Lieutenant's Leather Walkers (ilevel 66 entry 23285)
-- NOT FOUND: Knight-Lieutenant's Plate Gauntlets (ilevel 66 entry 23286)
-- NOT FOUND: Knight-Lieutenant's Plate Greaves (ilevel 66 entry 23287)
-- NOT FOUND: Knight-Lieutenant's Satin Handwraps (ilevel 66 entry 23288)
-- NOT FOUND: Knight-Lieutenant's Satin Walkers (ilevel 66 entry 23289)
-- NOT FOUND: Knight-Lieutenant's Silk Handwraps (ilevel 66 entry 23290)
-- NOT FOUND: Knight-Lieutenant's Silk Walkers (ilevel 66 entry 23291)
-- NOT FOUND: Knight-Captain's Chain Hauberk (ilevel 68 entry 23292)
-- NOT FOUND: Knight-Captain's Chain Legguards (ilevel 68 entry 23293)
-- NOT FOUND: Knight-Captain's Dragonhide Chestpiece (ilevel 68 entry 23294)
-- NOT FOUND: Knight-Captain's Dragonhide Leggings (ilevel 68 entry 23295)
-- NOT FOUND: Knight-Captain's Dreadweave Legguards (ilevel 68 entry 23296)
-- NOT FOUND: Knight-Captain's Dreadweave Tunic (ilevel 68 entry 23297)
-- NOT FOUND: Knight-Captain's Leather Chestpiece (ilevel 68 entry 23298)
-- NOT FOUND: Knight-Captain's Leather Legguards (ilevel 68 entry 23299)
-- NOT FOUND: Knight-Captain's Plate Hauberk (ilevel 68 entry 23300)
-- NOT FOUND: Knight-Captain's Plate Leggings (ilevel 68 entry 23301)
-- NOT FOUND: Knight-Captain's Satin Legguards (ilevel 68 entry 23302)
-- NOT FOUND: Knight-Captain's Satin Tunic (ilevel 68 entry 23303)
-- NOT FOUND: Knight-Captain's Silk Legguards (ilevel 68 entry 23304)
-- NOT FOUND: Knight-Captain's Silk Tunic (ilevel 68 entry 23305)
-- NOT FOUND: Lieutenant Commander's Chain Helm (ilevel 71 entry 23306)
-- NOT FOUND: Lieutenant Commander's Chain Shoulders (ilevel 71 entry 23307)
-- NOT FOUND: Lieutenant Commander's Dragonhide Headguard (ilevel 71 entry 23308)
-- NOT FOUND: Lieutenant Commander's Dragonhide Shoulders (ilevel 71 entry 23309)
-- NOT FOUND: Lieutenant Commander's Dreadweave Cowl (ilevel 71 entry 23310)
-- NOT FOUND: Lieutenant Commander's Dreadweave Spaulders (ilevel 71 entry 23311)
-- NOT FOUND: Lieutenant Commander's Leather Helm (ilevel 71 entry 23312)
-- NOT FOUND: Lieutenant Commander's Leather Shoulders (ilevel 71 entry 23313)
-- NOT FOUND: Lieutenant Commander's Plate Helm (ilevel 71 entry 23314)
-- NOT FOUND: Lieutenant Commander's Plate Shoulders (ilevel 71 entry 23315)
-- NOT FOUND: Lieutenant Commander's Satin Hood (ilevel 71 entry 23316)
-- NOT FOUND: Lieutenant Commander's Satin Mantle (ilevel 71 entry 23317)
-- NOT FOUND: Lieutenant Commander's Silk Cowl (ilevel 71 entry 23318)
-- NOT FOUND: Lieutenant Commander's Silk Mantle (ilevel 71 entry 23319)
-- NOT FOUND: Crown of the Fire Festival (ilevel 1 entry 23323)
-- NOT FOUND: Mantle of the Fire Festival (ilevel 1 entry 23324)
-- NOT FOUND: Grand Marshal's Mageblade (ilevel 78 entry 23451)
-- NOT FOUND: Grand Marshal's Tome of Power (ilevel 78 entry 23452)
-- NOT FOUND: Grand Marshal's Tome of Restoration (ilevel 78 entry 23453)
-- NOT FOUND: Grand Marshal's Warhammer (ilevel 78 entry 23454)
-- NOT FOUND: Grand Marshal's Demolisher (ilevel 78 entry 23455)
-- NOT FOUND: Grand Marshal's Swiftblade (ilevel 78 entry 23456)
-- NOT FOUND: High Warlord's Battle Mace (ilevel 78 entry 23464)
-- NOT FOUND: High Warlord's Destroyer (ilevel 78 entry 23465)
-- NOT FOUND: High Warlord's Spellblade (ilevel 78 entry 23466)
-- NOT FOUND: High Warlord's Quickblade (ilevel 78 entry 23467)
-- NOT FOUND: High Warlord's Tome of Destruction (ilevel 78 entry 23468)
-- NOT FOUND: High Warlord's Tome of Mending (ilevel 78 entry 23469)
-- NOT FOUND: Larvae of the Great Worm (ilevel 81 entry 23557)
-- NOT FOUND: The Burrower's Shell (ilevel 81 entry 23558)
-- NOT FOUND: Jom Gabbar (ilevel 81 entry 23570)
-- NOT FOUND: The Hungering Cold (ilevel 89 entry 23577)
-- NOT FOUND: Girdle of Elemental Fury (ilevel 85 entry 23663)
-- NOT FOUND: Pauldrons of Elemental Fury (ilevel 85 entry 23664)
-- NOT FOUND: Leggings of Elemental Fury (ilevel 85 entry 23665)
-- NOT FOUND: Belt of the Grand Crusader (ilevel 85 entry 23666)
-- NOT FOUND: Spaulders of the Grand Crusader (ilevel 85 entry 23667)
-- NOT FOUND: Leggings of the Grand Crusader (ilevel 85 entry 23668)
-- NOT FOUND: The Shadowfoot Stabber (ilevel 57 entry 24222)
-- Total items       : 7169
-- Stats changed     : 327 (55 conflicts, 18 unresolved)
-- Damage changed    : 40 (1163 items with damage data)
-- Quality changed   : 78
-- Spells changed    : 796 (2 need manual validation)
-- Spells removed    : 156
-- Not found         : 2175
UPDATE item_template SET `spellid_1`=13386 WHERE entry=868;
UPDATE item_template SET `spellid_1`=9346 WHERE entry=873;
UPDATE item_template SET `spellid_1`=9393 WHERE entry=892;
UPDATE item_template SET `spellid_1`=9404 WHERE entry=942;
UPDATE item_template SET `spellid_1`=21411 WHERE entry=943;
UPDATE item_template SET `spellid_1`=17870, `spellid_2`=17894 WHERE entry=944;
UPDATE item_template SET `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=1254;
UPDATE item_template SET `spellid_1`=7708 WHERE entry=1484;
UPDATE item_template SET `spellid_1`=9416 WHERE entry=1664;
UPDATE item_template SET `spellid_1`=9343 WHERE entry=1716;
UPDATE item_template SET `spellid_2`=0, `spelltrigger_2`=0, `spellid_1`=21410, `spelltrigger_1`=1 WHERE entry=1717;
UPDATE item_template SET `spellid_1`=7696 WHERE entry=1720;
UPDATE item_template SET `spellid_1`=7709 WHERE entry=1980;
UPDATE item_template SET `spellid_1`=7701, `spellid_2`=7708 WHERE entry=1992;
UPDATE item_template SET `stat_value2`=2 WHERE entry=1996;
UPDATE item_template SET `spellid_1`=9411 WHERE entry=1998;
UPDATE item_template SET `spellid_1`=9294 WHERE entry=2231;
UPDATE item_template SET `spellid_1`=9408 WHERE entry=2271;
UPDATE item_template SET `spellid_1`=7708 WHERE entry=2277;
UPDATE item_template SET `spellid_1`=9414 WHERE entry=2549;
UPDATE item_template SET `spellid_1`=9411 WHERE entry=2564;
UPDATE item_template SET `spellid_1`=7688 WHERE entry=2565;
UPDATE item_template SET `stat_value1`=0, `stat_type3`=3, `stat_value3`=11 WHERE entry=2620;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=2620;
UPDATE item_template SET `spellid_1`=25067 WHERE entry=2721;
UPDATE item_template SET `spellid_1`=7678, `spellid_2`=7706 WHERE entry=2816;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=2824;
UPDATE item_template SET `spellid_1`=7685, `spellid_2`=7699 WHERE entry=2879;
UPDATE item_template SET `stat_value1`=2, `stat_value2`=6, `stat_value3`=0, `stat_value4`=0, `stat_value5`=0 WHERE entry=2933;
UPDATE item_template SET Quality=2 WHERE entry=2933;
UPDATE item_template SET `spellid_1`=7679 WHERE entry=2943;
UPDATE item_template SET `spellid_1`=7708 WHERE entry=2944;
UPDATE item_template SET `spellid_1`=7701 WHERE entry=2950;
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `stat_type3`=6, `stat_value3`=8 WHERE entry=2954;
UPDATE item_template SET `spellid_1`=7688 WHERE entry=3073;
UPDATE item_template SET `spellid_1`=17876 WHERE entry=3075;
UPDATE item_template SET `spellid_1`=7688 WHERE entry=4117;
UPDATE item_template SET `spellid_1`=7687 WHERE entry=4317;
UPDATE item_template SET `spellid_1`=7701 WHERE entry=4319;
UPDATE item_template SET `spellid_1`=7706 WHERE entry=4323;
UPDATE item_template SET `spellid_1`=7699 WHERE entry=4324;
UPDATE item_template SET `spellid_1`=9397 WHERE entry=4329;
UPDATE item_template SET `spellid_1`=7686 WHERE entry=4331;
UPDATE item_template SET `spellid_1`=0 WHERE entry=4381;
UPDATE item_template SET Quality=1 WHERE entry=4381;
UPDATE item_template SET `dmg_type2`=0, `dmg_min2`=0, `dmg_max2`=0 WHERE entry=4446;
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `stat_type3`=6, `stat_value3`=7 WHERE entry=4505;
UPDATE item_template SET `spellid_1`=7685 WHERE entry=5183;
UPDATE item_template SET `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=5522;
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `armor`=40 WHERE entry=5780;
UPDATE item_template SET Quality=1 WHERE entry=5780;
UPDATE item_template SET `stat_value1`=0, `stat_type3`=3, `stat_value3`=4 WHERE entry=6095;
UPDATE item_template SET `spellid_1`=7684, `spellid_2`=7705 WHERE entry=6898;
UPDATE item_template SET `spellid_1`=7701 WHERE entry=7046;
UPDATE item_template SET `spellid_1`=7707 WHERE entry=7047;
UPDATE item_template SET `spellid_1`=7680 WHERE entry=7049;
UPDATE item_template SET `spellid_1`=7701 WHERE entry=7053;
UPDATE item_template SET `spellid_1`=25109 WHERE entry=7054;
UPDATE item_template SET `spellid_1`=7702 WHERE entry=7060;
UPDATE item_template SET `spellid_1`=23480 WHERE entry=7064;
UPDATE item_template SET `spellid_1`=7701 WHERE entry=7377;
UPDATE item_template SET `stat_value1`=2, `stat_type2`=6, `stat_value2`=2, `armor`=28 WHERE entry=7509;
UPDATE item_template SET `stat_value1`=2, `stat_type2`=6, `stat_value2`=2, `armor`=28 WHERE entry=7510;
UPDATE item_template SET `stat_value1`=0, `stat_value2`=2, `stat_value3`=8, `armor`=40 WHERE entry=7511;
UPDATE item_template SET `stat_value1`=0, `stat_value2`=2, `stat_value3`=8, `armor`=40 WHERE entry=7512;
UPDATE item_template SET stat_value1=0, stat_type1=0 WHERE entry=7513;
UPDATE item_template SET `dmg_min1`=32, `dmg_max1`=60 WHERE entry=7513;
UPDATE item_template SET `spellid_1`=7685 WHERE entry=7513;
UPDATE item_template SET Quality=2 WHERE entry=7513;
UPDATE item_template SET stat_value1=0, stat_type1=0 WHERE entry=7514;
UPDATE item_template SET `dmg_min1`=36, `dmg_max1`=68 WHERE entry=7514;
UPDATE item_template SET `spellid_1`=7699 WHERE entry=7514;
UPDATE item_template SET Quality=2 WHERE entry=7514;
UPDATE item_template SET `stat_value1`=2 WHERE entry=7515;
UPDATE item_template SET `spellid_1`=13593, `spellid_2`=7686, `spelltrigger_2`=1, `spellid_3`=7700, `spelltrigger_3`=1 WHERE entry=7515;
UPDATE item_template SET `spellid_1`=9397 WHERE entry=7553;
UPDATE item_template SET `spellid_1`=9397 WHERE entry=7685;
UPDATE item_template SET `spellid_1`=7708 WHERE entry=7709;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=7714;
UPDATE item_template SET `spellid_1`=7680 WHERE entry=7721;
UPDATE item_template SET `spellid_1`=9396 WHERE entry=7749;
UPDATE item_template SET `spellid_1`=13596 WHERE entry=7757;
UPDATE item_template SET `spellid_1`=21411 WHERE entry=9385;
UPDATE item_template SET `spellid_1`=9407 WHERE entry=9393;
UPDATE item_template SET `spellid_1`=0 WHERE entry=9397;
UPDATE item_template SET `armor`=72 WHERE entry=9398;
UPDATE item_template SET Quality=1 WHERE entry=9398;
UPDATE item_template SET `spellid_1`=13383 WHERE entry=9405;
UPDATE item_template SET `spellid_1`=9407 WHERE entry=9431;
UPDATE item_template SET `spellid_1`=9417 WHERE entry=9434;
UPDATE item_template SET `stat_type1`=3, `stat_value1`=7 WHERE entry=9448;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=9448;
UPDATE item_template SET `stat_value2`=7, `stat_type3`=3, `stat_value3`=4 WHERE entry=9454;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=9454;
UPDATE item_template SET `spellid_2`=0, `spelltrigger_2`=0, `spellid_1`=11791, `spelltrigger_1`=2 WHERE entry=9465;
UPDATE item_template SET `spellid_1`=7709 WHERE entry=9470;
UPDATE item_template SET `spellid_1`=17990 WHERE entry=9482;
UPDATE item_template SET `spellid_1`=9344 WHERE entry=9484;
UPDATE item_template SET `stat_value1`=2, `stat_value2`=0, `stat_type3`=6, `stat_value3`=8, `armor`=40 WHERE entry=9515;
UPDATE item_template SET `stat_value1`=2, `stat_value2`=0, `stat_type3`=6, `stat_value3`=8, `armor`=40 WHERE entry=9516;
UPDATE item_template SET `stat_value1`=2 WHERE entry=9517;
UPDATE item_template SET `dmg_min1`=69, `dmg_max1`=104 WHERE entry=9517;
UPDATE item_template SET `spellid_1`=13594, `spellid_2`=7687, `spelltrigger_2`=1, `spellid_3`=7701, `spelltrigger_3`=1 WHERE entry=9517;
UPDATE item_template SET Quality=2 WHERE entry=9517;
UPDATE item_template SET `stat_value1`=5, `stat_value2`=5 WHERE entry=9538;
UPDATE item_template SET Quality=2 WHERE entry=9538;
UPDATE item_template SET `stat_value1`=5, `stat_value2`=5 WHERE entry=9588;
UPDATE item_template SET Quality=2 WHERE entry=9588;
UPDATE item_template SET `spellid_1`=13383 WHERE entry=9607;
UPDATE item_template SET `spellid_2`=0, `spelltrigger_2`=0, `spellid_1`=13386, `spelltrigger_1`=1 WHERE entry=9625;
UPDATE item_template SET `dmg_type2`=0, `dmg_min2`=0, `dmg_max2`=0 WHERE entry=9718;
UPDATE item_template SET `spellid_1`=9414 WHERE entry=10002;
UPDATE item_template SET `spellid_1`=9415 WHERE entry=10003;
UPDATE item_template SET `spellid_1`=9414 WHERE entry=10004;
UPDATE item_template SET `spellid_1`=25109 WHERE entry=10009;
UPDATE item_template SET `spellid_1`=9396 WHERE entry=10018;
UPDATE item_template SET `spellid_1`=7703 WHERE entry=10019;
UPDATE item_template SET `spellid_1`=7703 WHERE entry=10021;
UPDATE item_template SET `spellid_1`=9412 WHERE entry=10023;
UPDATE item_template SET `spellid_1`=9325 WHERE entry=10025;
UPDATE item_template SET `spellid_1`=9412 WHERE entry=10028;
UPDATE item_template SET `spellid_1`=7709 WHERE entry=10031;
UPDATE item_template SET `stat_value2`=6, `armor`=53 WHERE entry=10041;
UPDATE item_template SET `spellid_1`=9415 WHERE entry=10041;
UPDATE item_template SET Quality=2 WHERE entry=10041;
UPDATE item_template SET `spellid_1`=25065 WHERE entry=10042;
UPDATE item_template SET `spellid_1`=23481 WHERE entry=10044;
UPDATE item_template SET `spellid_1`=7705 WHERE entry=10461;
UPDATE item_template SET `spellid_1`=9417 WHERE entry=10502;
UPDATE item_template SET `dmg_type2`=0, `dmg_min2`=0, `dmg_max2`=0 WHERE entry=10567;
UPDATE item_template SET `spellid_1`=7701 WHERE entry=10572;
UPDATE item_template SET `stat_value1`=0, `stat_type4`=4, `stat_value4`=8 WHERE entry=10581;
UPDATE item_template SET `spellid_1`=12732, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=10659;
UPDATE item_template SET `dmg_min1`=41, `dmg_max1`=76 WHERE entry=10823;
UPDATE item_template SET `spellid_1`=9329 WHERE entry=10823;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=10844;
UPDATE item_template SET stat_value1=0, stat_type1=0 WHERE entry=11263;
UPDATE item_template SET `dmg_min1`=34, `dmg_max1`=64 WHERE entry=11263;
UPDATE item_template SET `spellid_1`=13592 WHERE entry=11263;
UPDATE item_template SET Quality=2 WHERE entry=11263;
UPDATE item_template SET `dmg_min1`=6, `dmg_max1`=11 WHERE entry=11287;
UPDATE item_template SET Quality=1 WHERE entry=11287;
UPDATE item_template SET `dmg_min1`=15, `dmg_max1`=28 WHERE entry=11288;
UPDATE item_template SET Quality=1 WHERE entry=11288;
UPDATE item_template SET `dmg_min1`=21, `dmg_max1`=39 WHERE entry=11289;
UPDATE item_template SET Quality=1 WHERE entry=11289;
UPDATE item_template SET `dmg_min1`=38, `dmg_max1`=71 WHERE entry=11290;
UPDATE item_template SET Quality=1 WHERE entry=11290;
UPDATE item_template SET `spellid_1`=23480 WHERE entry=11310;
UPDATE item_template SET `stat_value1`=2, `stat_value3`=10, `armor`=34 WHERE entry=11623;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=11623;
UPDATE item_template SET Quality=2 WHERE entry=11623;
UPDATE item_template SET `stat_value2`=7, `stat_value3`=0, `armor`=51 WHERE entry=11624;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=11624;
UPDATE item_template SET Quality=2 WHERE entry=11624;
UPDATE item_template SET `stat_value1`=5, `stat_value2`=10, `armor`=34 WHERE entry=11626;
UPDATE item_template SET Quality=2 WHERE entry=11626;
UPDATE item_template SET `stat_value1`=15, `stat_value2`=0, `stat_value3`=0, `stat_type4`=6, `stat_value4`=5, `armor`=198 WHERE entry=11627;
UPDATE item_template SET Quality=2 WHERE entry=11627;
UPDATE item_template SET stat_value1=0, stat_type1=0 WHERE entry=11629;
UPDATE item_template SET `stat_value1`=5, `stat_value2`=0, `armor`=1706 WHERE entry=11631;
UPDATE item_template SET Quality=2 WHERE entry=11631;
UPDATE item_template SET `stat_value1`=11, `stat_value2`=0, `stat_value3`=0, `stat_type4`=6, `stat_value4`=11, `armor`=373 WHERE entry=11632;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=11632;
UPDATE item_template SET Quality=2 WHERE entry=11632;
UPDATE item_template SET `stat_value1`=16, `stat_value3`=0, `stat_type4`=3, `stat_value4`=3, `armor`=515 WHERE entry=11633;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=11633;
UPDATE item_template SET Quality=2 WHERE entry=11633;
UPDATE item_template SET `stat_value1`=12, `stat_value2`=11, `armor`=44 WHERE entry=11634;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=11634;
UPDATE item_template SET Quality=2 WHERE entry=11634;
UPDATE item_template SET `stat_value1`=0, `stat_value3`=10, `stat_type4`=4, `stat_value4`=4, `armor`=88 WHERE entry=11665;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=11665;
UPDATE item_template SET Quality=2 WHERE entry=11665;
UPDATE item_template SET `stat_value1`=0, `armor`=0, `holy_res`=10 WHERE entry=11669;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=11669;
UPDATE item_template SET `stat_value1`=4, `stat_value2`=6, `stat_value3`=9, `armor`=99 WHERE entry=11675;
UPDATE item_template SET Quality=2 WHERE entry=11675;
UPDATE item_template SET `stat_value1`=11, `armor`=36 WHERE entry=11677;
UPDATE item_template SET Quality=2 WHERE entry=11677;
UPDATE item_template SET `stat_value1`=11, `stat_value2`=6, `armor`=130 WHERE entry=11679;
UPDATE item_template SET Quality=2 WHERE entry=11679;
UPDATE item_template SET `stat_value1`=12, `stat_value2`=0, `stat_value3`=0, `stat_type4`=6, `stat_value4`=12, `armor`=108 WHERE entry=11685;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=11685;
UPDATE item_template SET Quality=2 WHERE entry=11685;
UPDATE item_template SET `stat_value1`=5, `stat_value3`=5 WHERE entry=11702;
UPDATE item_template SET `dmg_min1`=55, `dmg_max1`=103 WHERE entry=11702;
UPDATE item_template SET Quality=2 WHERE entry=11702;
UPDATE item_template SET `stat_value2`=0, `stat_value3`=0 WHERE entry=11726;
UPDATE item_template SET `spellid_1`=21416, `spelltrigger_1`=1 WHERE entry=11726;
UPDATE item_template SET `stat_value2`=0, `stat_type4`=6, `stat_value4`=18 WHERE entry=11728;
UPDATE item_template SET `stat_value2`=0, `stat_type3`=6, `stat_value3`=12 WHERE entry=11729;
UPDATE item_template SET `stat_value2`=0, `stat_value4`=0, `stat_type5`=6, `stat_value5`=14 WHERE entry=11730;
UPDATE item_template SET `stat_value1`=13, `stat_value2`=13 WHERE entry=11731;
UPDATE item_template SET `stat_value1`=17, `stat_value2`=2, `armor`=334 WHERE entry=11745;
UPDATE item_template SET Quality=2 WHERE entry=11745;
UPDATE item_template SET `spellid_1`=21407 WHERE entry=11746;
UPDATE item_template SET `stat_value1`=25 WHERE entry=11747;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=11747;
UPDATE item_template SET `spellid_1`=7688 WHERE entry=11748;
UPDATE item_template SET `stat_value1`=25, `stat_value2`=10, `stat_value3`=0, `stat_value4`=0 WHERE entry=11749;
UPDATE item_template SET `stat_value1`=25, `stat_value3`=0 WHERE entry=11750;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=11750;
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `frost_res`=10 WHERE entry=11782;
UPDATE item_template SET `spellid_1`=9308 WHERE entry=11782;
UPDATE item_template SET `stat_value1`=6, `stat_value2`=0, `stat_type3`=6, `stat_value3`=10 WHERE entry=11784;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=11784;
UPDATE item_template SET `holy_res`=15, `nature_res`=0, `arcane_res`=0 WHERE entry=11785;
UPDATE item_template SET `stat_value1`=20, `armor`=483 WHERE entry=11802;
UPDATE item_template SET Quality=2 WHERE entry=11802;
UPDATE item_template SET stat_value1=0, stat_type1=0 WHERE entry=11803;
UPDATE item_template SET `dmg_min1`=111, `dmg_max1`=167 WHERE entry=11803;
UPDATE item_template SET Quality=2 WHERE entry=11803;
UPDATE item_template SET `stat_value1`=15, `stat_value3`=0 WHERE entry=11807;
UPDATE item_template SET `spellid_1`=23480 WHERE entry=11807;
UPDATE item_template SET `stat_value1`=0, `stat_type2`=6, `stat_value2`=15 WHERE entry=11808;
UPDATE item_template SET `spellid_2`=13390 WHERE entry=11810;
UPDATE item_template SET `stat_value1`=16, `stat_value2`=5, `fire_res`=7 WHERE entry=11812;
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `stat_value3`=0 WHERE entry=11814;
UPDATE item_template SET `stat_value1`=22, `stat_value2`=7 WHERE entry=11816;
UPDATE item_template SET `dmg_min1`=90, `dmg_max1`=136 WHERE entry=11816;
UPDATE item_template SET Quality=2 WHERE entry=11816;
UPDATE item_template SET `spellid_2`=9407 WHERE entry=11819;
UPDATE item_template SET `stat_value1`=7, `stat_value2`=22, `stat_value3`=0, `armor`=313 WHERE entry=11820;
UPDATE item_template SET Quality=2 WHERE entry=11820;
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `armor`=52 WHERE entry=11822;
UPDATE item_template SET `spellid_1`=9343 WHERE entry=11822;
UPDATE item_template SET Quality=2 WHERE entry=11822;
UPDATE item_template SET `stat_value1`=17, `stat_value2`=17, `stat_value3`=0, `armor`=133 WHERE entry=11823;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=11823;
UPDATE item_template SET Quality=2 WHERE entry=11823;
UPDATE item_template SET `stat_value1`=15, `stat_value3`=4, `stat_value4`=0 WHERE entry=11824;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=11824;
UPDATE item_template SET `spellid_2`=9397 WHERE entry=11832;
UPDATE item_template SET `stat_value1`=20, `stat_value2`=9, `stat_value3`=0, `armor`=62 WHERE entry=11841;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=11841;
UPDATE item_template SET Quality=2 WHERE entry=11841;
UPDATE item_template SET `armor`=223 WHERE entry=11842;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=11842;
UPDATE item_template SET Quality=2 WHERE entry=11842;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=11902;
UPDATE item_template SET `spellid_1`=12854 WHERE entry=11904;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=11906;
UPDATE item_template SET stat_value1=0, stat_type1=0 WHERE entry=11922;
UPDATE item_template SET `dmg_min1`=21, `dmg_max1`=40 WHERE entry=11922;
UPDATE item_template SET `spellid_1`=15695, `spelltrigger_1`=2 WHERE entry=11922;
UPDATE item_template SET `spellid_1`=9316 WHERE entry=11923;
UPDATE item_template SET `stat_value1`=29, `stat_value2`=9, `stat_value3`=5, `stat_type4`=3, `stat_value4`=3 WHERE entry=11924;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=11924;
UPDATE item_template SET `spellid_2`=0, `spelltrigger_2`=0, `spellid_1`=21418, `spelltrigger_1`=1 WHERE entry=11927;
UPDATE item_template SET `stat_value1`=15 WHERE entry=11928;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=11928;
UPDATE item_template SET `stat_value1`=29, `stat_value2`=10 WHERE entry=11932;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=11932;
UPDATE item_template SET `stat_value1`=9, `stat_type4`=3, `stat_value4`=7 WHERE entry=12103;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=12103;
UPDATE item_template SET `spellid_1`=9407 WHERE entry=12110;
UPDATE item_template SET `spellid_1`=9399 WHERE entry=12113;
UPDATE item_template SET `spellid_1`=21408 WHERE entry=12115;
UPDATE item_template SET `spellid_1`=9400 WHERE entry=12256;
UPDATE item_template SET `spellid_1`=7687 WHERE entry=12260;
UPDATE item_template SET `dmg_min1`=104, `dmg_max1`=157 WHERE entry=12400;
UPDATE item_template SET `spellid_1`=16451 WHERE entry=12400;
UPDATE item_template SET `spellid_1`=9415 WHERE entry=12464;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=12528;
UPDATE item_template SET `stat_value1`=0, `stat_type3`=6, `stat_value3`=20 WHERE entry=12532;
UPDATE item_template SET `stat_value1`=0, `stat_value2`=25, `stat_value3`=0, `shadow_res`=10 WHERE entry=12542;
UPDATE item_template SET `spellid_1`=9415 WHERE entry=12543;
UPDATE item_template SET `spellid_1`=9415 WHERE entry=12545;
UPDATE item_template SET `stat_value1`=15, `stat_value2`=0, `stat_value3`=0 WHERE entry=12547;
UPDATE item_template SET `spellid_1`=9407 WHERE entry=12547;
UPDATE item_template SET `spellid_1`=13384 WHERE entry=12550;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=12554;
UPDATE item_template SET `stat_value1`=17, `stat_value2`=10, `stat_value3`=0, `stat_type4`=6, `stat_value4`=9, `armor`=463 WHERE entry=12557;
UPDATE item_template SET `stat_value1`=21 WHERE entry=12589;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=12589;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=12590;
UPDATE item_template SET `dmg_min1`=109, `dmg_max1`=164 WHERE entry=12592;
UPDATE item_template SET `spellid_1`=21411 WHERE entry=12602;
UPDATE item_template SET `stat_value2`=22 WHERE entry=12606;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=12606;
UPDATE item_template SET `stat_value1`=4, `stat_value2`=12, `armor`=38 WHERE entry=12608;
UPDATE item_template SET Quality=2 WHERE entry=12608;
UPDATE item_template SET `armor`=0, `holy_res`=20, `arcane_res`=0 WHERE entry=12609;
UPDATE item_template SET `spellid_1`=17991 WHERE entry=12624;
UPDATE item_template SET `spellid_2`=9411 WHERE entry=12632;
UPDATE item_template SET `spellid_2`=0, `spelltrigger_2`=0, `spellid_1`=9317, `spelltrigger_1`=1 WHERE entry=12633;
UPDATE item_template SET `stat_value2`=0, `stat_type4`=6, `stat_value4`=14 WHERE entry=12637;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=12637;
UPDATE item_template SET `spellid_3`=0, `spelltrigger_3`=0, `spellid_2`=21416, `spelltrigger_2`=1 WHERE entry=12641;
UPDATE item_template SET stat_value1=0, stat_type1=0 WHERE entry=12651;
UPDATE item_template SET `spellid_1`=9415 WHERE entry=12756;
UPDATE item_template SET `stat_value1`=15, `stat_value2`=14, `stat_value3`=5, `armor`=144 WHERE entry=12793;
UPDATE item_template SET Quality=2 WHERE entry=12793;
UPDATE item_template SET `stat_value1`=30, `stat_value2`=20, `fire_res`=0, `nature_res`=0, `frost_res`=0, `shadow_res`=0, `arcane_res`=0 WHERE entry=12903;
UPDATE item_template SET `armor`=39, `fire_res`=15 WHERE entry=12905;
UPDATE item_template SET Quality=2 WHERE entry=12905;
UPDATE item_template SET `spellid_1`=15714 WHERE entry=12930;
UPDATE item_template SET `spellid_1`=13390 WHERE entry=12939;
UPDATE item_template SET `stat_value1`=9, `stat_value2`=30, `stat_value3`=8, `fire_res`=0, `nature_res`=0, `frost_res`=0, `shadow_res`=0, `arcane_res`=0 WHERE entry=12945;
UPDATE item_template SET `stat_value1`=21, `stat_value2`=21, `stat_value3`=10, `stat_type4`=3, `stat_value4`=5 WHERE entry=12965;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=12965;
UPDATE item_template SET `stat_value2`=0, `stat_type3`=6, `stat_value3`=5 WHERE entry=12966;
UPDATE item_template SET `dmg_min1`=142, `dmg_max1`=214 WHERE entry=12969;
UPDATE item_template SET `spellid_1`=13384 WHERE entry=12985;
UPDATE item_template SET `spellid_1`=9393 WHERE entry=12998;
UPDATE item_template SET `spellid_1`=9415 WHERE entry=13001;
UPDATE item_template SET `spellid_1`=23481 WHERE entry=13007;
UPDATE item_template SET `spellid_1`=9396 WHERE entry=13013;
UPDATE item_template SET `spellid_1`=9412 WHERE entry=13029;
UPDATE item_template SET `spellid_1`=7677, `spellid_2`=7706 WHERE entry=13031;
UPDATE item_template SET `spellid_1`=21409 WHERE entry=13041;
UPDATE item_template SET `spellid_1`=21411 WHERE entry=13049;
UPDATE item_template SET `spellid_1`=21411 WHERE entry=13072;
UPDATE item_template SET `spellid_1`=18369 WHERE entry=13074;
UPDATE item_template SET `spellid_1`=21411 WHERE entry=13091;
UPDATE item_template SET `stat_value3`=0, `stat_type4`=4, `stat_value4`=11 WHERE entry=13101;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13101;
UPDATE item_template SET `spellid_1`=18031 WHERE entry=13102;
UPDATE item_template SET `stat_value1`=15, `stat_value2`=0, `stat_type3`=6, `stat_value3`=10 WHERE entry=13141;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13141;
UPDATE item_template SET `stat_type3`=6, `stat_value3`=10 WHERE entry=13142;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13142;
UPDATE item_template SET `stat_value1`=30 WHERE entry=13161;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13161;
UPDATE item_template SET `dmg_min1`=97, `dmg_max1`=147 WHERE entry=13163;
UPDATE item_template SET `stat_value1`=12, `stat_value2`=0, `stat_value3`=0, `stat_type4`=6, `stat_value4`=29 WHERE entry=13168;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13168;
UPDATE item_template SET `stat_value1`=23 WHERE entry=13169;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13169;
UPDATE item_template SET `spellid_1`=14127 WHERE entry=13170;
UPDATE item_template SET `stat_value1`=7 WHERE entry=13177;
UPDATE item_template SET Quality=2 WHERE entry=13177;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=13178;
UPDATE item_template SET `stat_value1`=7, `stat_type3`=6, `stat_value3`=11 WHERE entry=13179;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13179;
UPDATE item_template SET `stat_value1`=8, `stat_value2`=5 WHERE entry=13182;
UPDATE item_template SET `dmg_min1`=47, `dmg_max1`=88 WHERE entry=13182;
UPDATE item_template SET Quality=2 WHERE entry=13182;
UPDATE item_template SET `stat_value1`=22, `stat_value2`=5, `stat_value3`=8 WHERE entry=13184;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13184;
UPDATE item_template SET `stat_type4`=3, `stat_value4`=7 WHERE entry=13185;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13185;
UPDATE item_template SET `armor`=39 WHERE entry=13203;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13203;
UPDATE item_template SET Quality=2 WHERE entry=13203;
UPDATE item_template SET stat_value1=0, stat_type1=0 WHERE entry=13204;
UPDATE item_template SET `dmg_min1`=65, `dmg_max1`=122 WHERE entry=13204;
UPDATE item_template SET Quality=2 WHERE entry=13204;
UPDATE item_template SET `stat_value1`=30 WHERE entry=13206;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13206;
UPDATE item_template SET `stat_type3`=4, `stat_value3`=7 WHERE entry=13208;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13208;
UPDATE item_template SET `spellid_1`=17319 WHERE entry=13209;
UPDATE item_template SET `stat_value1`=7, `stat_value2`=0, `stat_value3`=0, `stat_type4`=4, `stat_value4`=6, `armor`=141 WHERE entry=13211;
UPDATE item_template SET Quality=2 WHERE entry=13211;
UPDATE item_template SET stat_value1=0, stat_type1=0 WHERE entry=13212;
UPDATE item_template SET `spellid_1`=18067 WHERE entry=13212;
UPDATE item_template SET Quality=2 WHERE entry=13212;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13243;
UPDATE item_template SET `stat_value1`=13, `stat_value2`=13, `armor`=201 WHERE entry=13244;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13244;
UPDATE item_template SET Quality=2 WHERE entry=13244;
UPDATE item_template SET `spellid_1`=13384 WHERE entry=13245;
UPDATE item_template SET `stat_value1`=0, `stat_type2`=6, `stat_value2`=8 WHERE entry=13248;
UPDATE item_template SET `spellid_1`=9346 WHERE entry=13253;
UPDATE item_template SET `armor`=198 WHERE entry=13255;
UPDATE item_template SET `spellid_2`=0, `spelltrigger_2`=0, `spellid_3`=0, `spelltrigger_3`=0, `spellid_4`=0, `spelltrigger_4`=0 WHERE entry=13255;
UPDATE item_template SET Quality=2 WHERE entry=13255;
UPDATE item_template SET `stat_value2`=0, `stat_type4`=6, `stat_value4`=12 WHERE entry=13257;
UPDATE item_template SET `stat_value1`=7, `stat_value2`=20, `stat_value3`=0, `stat_type4`=4, `stat_value4`=5 WHERE entry=13282;
UPDATE item_template SET `stat_value1`=9, `stat_value2`=4, `stat_value3`=6 WHERE entry=13283;
UPDATE item_template SET Quality=2 WHERE entry=13283;
UPDATE item_template SET `stat_value1`=5, `stat_value3`=0, `armor`=218 WHERE entry=13284;
UPDATE item_template SET Quality=2 WHERE entry=13284;
UPDATE item_template SET `spellid_1`=9416 WHERE entry=13314;
UPDATE item_template SET `stat_value1`=18 WHERE entry=13344;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13344;
UPDATE item_template SET `spellid_1`=18039 WHERE entry=13346;
UPDATE item_template SET `dmg_min1`=99, `dmg_max1`=149 WHERE entry=13348;
UPDATE item_template SET `shadow_res`=7 WHERE entry=13349;
UPDATE item_template SET `spellid_1`=9325 WHERE entry=13349;
UPDATE item_template SET `spellid_1`=23483 WHERE entry=13369;
UPDATE item_template SET stat_value1=0, stat_type1=0, stat_value2=0, stat_type2=0 WHERE entry=13372;
UPDATE item_template SET `dmg_min1`=139, `dmg_max1`=210 WHERE entry=13372;
UPDATE item_template SET `stat_type2`=6, `stat_value2`=4 WHERE entry=13380;
UPDATE item_template SET `dmg_min1`=52, `dmg_max1`=98 WHERE entry=13380;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13380;
UPDATE item_template SET `stat_value1`=10, `stat_value2`=0, `stat_type3`=6, `stat_value3`=12 WHERE entry=13383;
UPDATE item_template SET `spellid_1`=13670 WHERE entry=13383;
UPDATE item_template SET `stat_value2`=0, `stat_value3`=30, `stat_type4`=3, `stat_value4`=5 WHERE entry=13388;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13388;
UPDATE item_template SET `stat_value1`=0, `stat_type4`=3, `stat_value4`=12 WHERE entry=13389;
UPDATE item_template SET `stat_value1`=30, `stat_value3`=0, `shadow_res`=10 WHERE entry=13390;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13390;
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `stat_value3`=6, `stat_type4`=4, `stat_value4`=6 WHERE entry=13391;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13391;
UPDATE item_template SET `stat_value2`=0, `stat_value3`=6, `stat_type4`=3, `stat_value4`=3 WHERE entry=13392;
UPDATE item_template SET `stat_type3`=6, `stat_value3`=9 WHERE entry=13394;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13394;
UPDATE item_template SET `spellid_1`=7709 WHERE entry=13396;
UPDATE item_template SET `stat_type4`=4, `stat_value4`=10 WHERE entry=13398;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13398;
UPDATE item_template SET `stat_value2`=0, `stat_type3`=6, `stat_value3`=6 WHERE entry=13400;
UPDATE item_template SET `stat_value2`=11, `stat_value3`=0, `stat_type4`=6, `stat_value4`=11 WHERE entry=13402;
UPDATE item_template SET `stat_value2`=8, `stat_type4`=4, `stat_value4`=3 WHERE entry=13403;
UPDATE item_template SET `stat_type3`=6, `stat_value3`=5 WHERE entry=13405;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13405;
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `armor`=785 WHERE entry=13498;
UPDATE item_template SET Quality=2 WHERE entry=13498;
UPDATE item_template SET `dmg_min1`=133, `dmg_max1`=200 WHERE entry=13505;
UPDATE item_template SET `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=13602;
UPDATE item_template SET `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=13603;
UPDATE item_template SET `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=13699;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=13700;
UPDATE item_template SET `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=13701;
UPDATE item_template SET `spellid_1`=9397 WHERE entry=13863;
UPDATE item_template SET `spellid_1`=9305 WHERE entry=13868;
UPDATE item_template SET `spellid_1`=9305 WHERE entry=13869;
UPDATE item_template SET `spellid_1`=9404 WHERE entry=13870;
UPDATE item_template SET `spellid_1`=9305 WHERE entry=13871;
UPDATE item_template SET `spellid_1`=9396 WHERE entry=13938;
UPDATE item_template SET `stat_value1`=4, `stat_type3`=6, `stat_value3`=6 WHERE entry=13944;
UPDATE item_template SET `dmg_type2`=0, `dmg_min2`=0, `dmg_max2`=0 WHERE entry=13952;
UPDATE item_template SET `spellid_1`=9318, `spellid_2`=9358 WHERE entry=13954;
UPDATE item_template SET `spellid_2`=0, `spelltrigger_2`=0, `spellid_1`=13390, `spelltrigger_1`=1 WHERE entry=13955;
UPDATE item_template SET `stat_value1`=0, `stat_value2`=6, `stat_type3`=6, `stat_value3`=6 WHERE entry=13963;
UPDATE item_template SET `spellid_1`=13596, `spellid_2`=7709, `spelltrigger_2`=1 WHERE entry=13964;
UPDATE item_template SET `spellid_2`=0, `spelltrigger_2`=0, `spellid_1`=13669, `spelltrigger_1`=1 WHERE entry=13966;
UPDATE item_template SET `stat_type2`=6, `stat_value2`=7 WHERE entry=13967;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=13967;
UPDATE item_template SET `spellid_1`=25067 WHERE entry=13969;
UPDATE item_template SET `spellid_1`=0 WHERE entry=14023;
UPDATE item_template SET `spellid_1`=23482 WHERE entry=14042;
UPDATE item_template SET `spellid_1`=9399 WHERE entry=14043;
UPDATE item_template SET `spellid_1`=7688 WHERE entry=14044;
UPDATE item_template SET `spellid_1`=23482 WHERE entry=14045;
UPDATE item_template SET `spellid_1`=7701 WHERE entry=14103;
UPDATE item_template SET `spellid_1`=18012 WHERE entry=14106;
UPDATE item_template SET `spellid_1`=9325 WHERE entry=14107;
UPDATE item_template SET `spellid_1`=9399 WHERE entry=14108;
UPDATE item_template SET `spellid_1`=14794 WHERE entry=14111;
UPDATE item_template SET `spellid_1`=9325 WHERE entry=14112;
UPDATE item_template SET `spellid_1`=18016, `spellid_2`=17898 WHERE entry=14136;
UPDATE item_template SET `spellid_1`=14055 WHERE entry=14152;
UPDATE item_template SET `spellid_1`=18023 WHERE entry=14153;
UPDATE item_template SET `spellid_1`=18041 WHERE entry=14154;
UPDATE item_template SET `stat_value1`=0, `frost_res`=15 WHERE entry=14340;
UPDATE item_template SET `spellid_1`=17901 WHERE entry=14340;
UPDATE item_template SET `stat_value1`=12, `stat_value2`=11, `stat_value3`=11, `stat_value4`=12, `stat_value5`=0 WHERE entry=14503;
UPDATE item_template SET `stat_value1`=20, `stat_value2`=0, `stat_type4`=4, `stat_value4`=10 WHERE entry=14522;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=14522;
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `armor`=624, `frost_res`=10 WHERE entry=14525;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=14525;
UPDATE item_template SET `stat_value1`=10, `stat_value2`=10, `stat_value3`=0, `armor`=1890, `shadow_res`=0 WHERE entry=14528;
UPDATE item_template SET Quality=2 WHERE entry=14528;
UPDATE item_template SET `stat_value1`=18, `armor`=404, `shadow_res`=5 WHERE entry=14537;
UPDATE item_template SET Quality=2 WHERE entry=14537;
UPDATE item_template SET `stat_value1`=13, `stat_value2`=6, `armor`=60 WHERE entry=14538;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=14538;
UPDATE item_template SET Quality=2 WHERE entry=14538;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=14541;
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `stat_value3`=0, `armor`=50, `holy_res`=15, `arcane_res`=0 WHERE entry=14543;
UPDATE item_template SET Quality=2 WHERE entry=14543;
UPDATE item_template SET `armor`=138 WHERE entry=14545;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=14545;
UPDATE item_template SET Quality=2 WHERE entry=14545;
UPDATE item_template SET `stat_value1`=14, `stat_value3`=0, `stat_type4`=3, `stat_value4`=5, `armor`=249 WHERE entry=14548;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=14548;
UPDATE item_template SET Quality=2 WHERE entry=14548;
UPDATE item_template SET `spellid_1`=21411 WHERE entry=14552;
UPDATE item_template SET `spellid_1`=18034 WHERE entry=14553;
UPDATE item_template SET `stat_value1`=0, `stat_value2`=6, `stat_value3`=3, `stat_value4`=0, `stat_type5`=6, `stat_value5`=25, `armor`=286 WHERE entry=14612;
UPDATE item_template SET Quality=2 WHERE entry=14612;
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `stat_value3`=11, `stat_value4`=17, `armor`=184 WHERE entry=14614;
UPDATE item_template SET Quality=2 WHERE entry=14614;
UPDATE item_template SET `stat_value1`=0, `stat_value2`=7, `stat_value3`=0, `stat_type4`=6, `stat_value4`=17, `armor`=204 WHERE entry=14615;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=14615;
UPDATE item_template SET Quality=2 WHERE entry=14615;
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `stat_value3`=0, `stat_value4`=0, `stat_type5`=6, `stat_value5`=20, `armor`=225 WHERE entry=14616;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=14616;
UPDATE item_template SET Quality=2 WHERE entry=14616;
UPDATE item_template SET `stat_value1`=8, `stat_type2`=4, `stat_value2`=15, `armor`=326 WHERE entry=14620;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=14620;
UPDATE item_template SET Quality=2 WHERE entry=14620;
UPDATE item_template SET `stat_value1`=12, `stat_type2`=6, `stat_value2`=10, `armor`=398 WHERE entry=14621;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=14621;
UPDATE item_template SET Quality=2 WHERE entry=14621;
UPDATE item_template SET `stat_value1`=8, `stat_type2`=6, `stat_value2`=5, `armor`=362 WHERE entry=14622;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=14622;
UPDATE item_template SET Quality=2 WHERE entry=14622;
UPDATE item_template SET `stat_value1`=0, `stat_type2`=6, `stat_value2`=14, `armor`=507 WHERE entry=14623;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=14623;
UPDATE item_template SET Quality=2 WHERE entry=14623;
UPDATE item_template SET `stat_type2`=6, `stat_value2`=12 WHERE entry=14624;
UPDATE item_template SET `spellid_1`=21423, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=14624;
UPDATE item_template SET `stat_value1`=25 WHERE entry=14626;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=14626;
UPDATE item_template SET `stat_value1`=5, `stat_value2`=13, `stat_value3`=0, `armor`=34 WHERE entry=14629;
UPDATE item_template SET Quality=2 WHERE entry=14629;
UPDATE item_template SET `stat_value1`=16, `stat_value2`=8, `stat_value3`=0, `armor`=54 WHERE entry=14631;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=14631;
UPDATE item_template SET Quality=2 WHERE entry=14631;
UPDATE item_template SET `stat_value2`=5, `stat_value3`=15, `armor`=69 WHERE entry=14632;
UPDATE item_template SET Quality=2 WHERE entry=14632;
UPDATE item_template SET `stat_value1`=14, `stat_value2`=10, `stat_value3`=0, `stat_type4`=3, `stat_value4`=6, `armor`=59 WHERE entry=14633;
UPDATE item_template SET Quality=2 WHERE entry=14633;
UPDATE item_template SET `stat_value1`=10, `stat_type2`=4, `stat_value2`=15, `armor`=88 WHERE entry=14636;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=14636;
UPDATE item_template SET Quality=2 WHERE entry=14636;
UPDATE item_template SET `stat_type2`=4, `stat_value2`=10, `armor`=136 WHERE entry=14638;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=14638;
UPDATE item_template SET Quality=2 WHERE entry=14638;
UPDATE item_template SET `stat_value1`=0, `stat_type2`=6, `stat_value2`=10, `armor`=97 WHERE entry=14640;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=14640;
UPDATE item_template SET Quality=2 WHERE entry=14640;
UPDATE item_template SET `stat_value1`=8, `stat_type2`=3, `stat_value2`=16, `armor`=107 WHERE entry=14641;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=14641;
UPDATE item_template SET Quality=2 WHERE entry=14641;
UPDATE item_template SET `stat_value1`=13, `stat_value2`=5 WHERE entry=14817;
UPDATE item_template SET `stat_value1`=25, `stat_value2`=0 WHERE entry=15045;
UPDATE item_template SET `stat_value1`=26, `stat_value2`=0 WHERE entry=15046;
UPDATE item_template SET `spellid_1`=18038 WHERE entry=15047;
UPDATE item_template SET `stat_value1`=10, `armor`=114 WHERE entry=15058;
UPDATE item_template SET Quality=2 WHERE entry=15058;
UPDATE item_template SET `stat_value2`=0, `nature_res`=10 WHERE entry=15059;
UPDATE item_template SET `spellid_1`=23796 WHERE entry=15059;
UPDATE item_template SET `stat_value2`=0, `nature_res`=8 WHERE entry=15060;
UPDATE item_template SET `spellid_1`=23796 WHERE entry=15060;
UPDATE item_template SET `stat_value2`=0, `nature_res`=8 WHERE entry=15061;
UPDATE item_template SET `spellid_1`=9316 WHERE entry=15061;
UPDATE item_template SET `spellid_1`=9400 WHERE entry=15105;
UPDATE item_template SET `spellid_1`=9413 WHERE entry=15106;
UPDATE item_template SET `spellid_1`=23480 WHERE entry=15107;
UPDATE item_template SET `spellid_1`=7709 WHERE entry=15108;
UPDATE item_template SET `spellid_1`=7707, `spellid_2`=7686 WHERE entry=15109;
UPDATE item_template SET `stat_value1`=4, `stat_type3`=5, `stat_value3`=4 WHERE entry=15200;
UPDATE item_template SET `spellid_1`=21411 WHERE entry=15413;
UPDATE item_template SET `dmg_min1`=20, `dmg_max1`=20 WHERE entry=15808;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=15814;
UPDATE item_template SET `stat_value1`=6, `armor`=300 WHERE entry=15855;
UPDATE item_template SET `spellid_1`=14254 WHERE entry=15999;
UPDATE item_template SET `spellid_1`=0 WHERE entry=16022;
UPDATE item_template SET stat_value1=0, stat_type1=0, stat_value2=0, stat_type2=0 WHERE entry=16058;
UPDATE item_template SET `spellid_1`=9318 WHERE entry=16058;
UPDATE item_template SET `stat_value1`=8, `stat_type2`=6, `stat_value2`=8, `armor`=43 WHERE entry=16342;
UPDATE item_template SET `stat_value3`=6, `stat_type4`=3, `stat_value4`=6 WHERE entry=16684;
UPDATE item_template SET `stat_value2`=9, `stat_value3`=0 WHERE entry=16685;
UPDATE item_template SET `stat_value3`=8, `stat_type4`=3, `stat_value4`=8 WHERE entry=16687;
UPDATE item_template SET `stat_value2`=13, `stat_value3`=0 WHERE entry=16688;
UPDATE item_template SET `stat_value2`=9, `stat_value3`=0 WHERE entry=16689;
UPDATE item_template SET `stat_value3`=7, `stat_type4`=3, `stat_value4`=4 WHERE entry=16692;
UPDATE item_template SET `stat_value3`=8, `stat_type4`=3, `stat_value4`=8 WHERE entry=16694;
UPDATE item_template SET `stat_value3`=12, `stat_type4`=3, `stat_value4`=5 WHERE entry=16699;
UPDATE item_template SET `stat_value3`=9, `stat_type4`=3, `stat_value4`=8 WHERE entry=16705;
UPDATE item_template SET `stat_value1`=0, `stat_type3`=5, `stat_value3`=21 WHERE entry=16711;
UPDATE item_template SET `stat_value1`=10, `stat_value2`=35, `stat_value3`=13, `fire_res`=4, `nature_res`=4, `frost_res`=4 WHERE entry=16795;
UPDATE item_template SET `spellid_1`=18384, `spellid_2`=7685 WHERE entry=16795;
UPDATE item_template SET `stat_value1`=20, `stat_value2`=24, `stat_value3`=12, `stat_type4`=3, `stat_value4`=5, `fire_res`=5, `nature_res`=7, `frost_res`=5, `shadow_res`=13 WHERE entry=16796;
UPDATE item_template SET `spellid_1`=13592, `spellid_2`=23480 WHERE entry=16796;
UPDATE item_template SET `stat_value1`=24, `stat_value2`=9, `stat_value3`=0, `holy_res`=5, `fire_res`=5, `shadow_res`=0 WHERE entry=16797;
UPDATE item_template SET `spellid_1`=13599, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16797;
UPDATE item_template SET `stat_value1`=33, `stat_value2`=16, `stat_value3`=7, `stat_type4`=3, `stat_value4`=7, `fire_res`=0 WHERE entry=16798;
UPDATE item_template SET `spellid_1`=13596, `spellid_2`=23480, `spelltrigger_2`=1, `spellid_3`=7703, `spelltrigger_3`=1 WHERE entry=16798;
UPDATE item_template SET `stat_value1`=20, `stat_value2`=0, `stat_value3`=8, `holy_res`=4, `fire_res`=7, `frost_res`=4 WHERE entry=16799;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16799;
UPDATE item_template SET `stat_value1`=10, `stat_value2`=15, `stat_value3`=17, `stat_type4`=3, `stat_value4`=3, `nature_res`=6, `shadow_res`=3 WHERE entry=16800;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16800;
UPDATE item_template SET `stat_value1`=17, `stat_value2`=18, `stat_value3`=8, `stat_type4`=3, `stat_value4`=8, `holy_res`=7, `fire_res`=0, `frost_res`=3 WHERE entry=16801;
UPDATE item_template SET `spellid_1`=23480, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16801;
UPDATE item_template SET `stat_value1`=26, `stat_value2`=11, `stat_value3`=0, `fire_res`=0 WHERE entry=16802;
UPDATE item_template SET `spellid_1`=18379 WHERE entry=16802;
UPDATE item_template SET `stat_value2`=18, `stat_type3`=6, `stat_value3`=14, `nature_res`=8, `frost_res`=6, `shadow_res`=10 WHERE entry=16803;
UPDATE item_template SET `spellid_1`=7685 WHERE entry=16803;
UPDATE item_template SET `stat_value3`=15 WHERE entry=16804;
UPDATE item_template SET `spellid_1`=21587 WHERE entry=16804;
UPDATE item_template SET `stat_value1`=10, `stat_value2`=17, `stat_value3`=11, `stat_type4`=3, `stat_value4`=7, `fire_res`=0 WHERE entry=16805;
UPDATE item_template SET `spellid_1`=9414, `spellid_2`=23480 WHERE entry=16805;
UPDATE item_template SET `stat_value1`=18, `stat_value2`=10, `stat_value3`=11, `fire_res`=15, `frost_res`=6 WHERE entry=16806;
UPDATE item_template SET `spellid_1`=7709, `spellid_2`=21587, `spelltrigger_2`=1 WHERE entry=16806;
UPDATE item_template SET `stat_value2`=9, `stat_value3`=18, `frost_res`=5, `shadow_res`=0, `arcane_res`=10 WHERE entry=16807;
UPDATE item_template SET `spellid_1`=23480 WHERE entry=16807;
UPDATE item_template SET `stat_value1`=23, `stat_value2`=16, `stat_value3`=20, `stat_type4`=3, `stat_value4`=5, `holy_res`=3, `fire_res`=0, `shadow_res`=10 WHERE entry=16808;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16808;
UPDATE item_template SET `stat_value1`=23, `stat_value2`=24, `stat_type3`=6, `stat_value3`=19, `fire_res`=5, `nature_res`=3 WHERE entry=16809;
UPDATE item_template SET `spellid_1`=7685, `spellid_2`=7706, `spellid_3`=21587, `spelltrigger_3`=1 WHERE entry=16809;
UPDATE item_template SET `stat_value1`=11, `stat_value2`=22, `stat_value3`=17, `stat_type4`=3, `stat_value4`=8, `fire_res`=8, `nature_res`=8, `frost_res`=8, `shadow_res`=8, `arcane_res`=8 WHERE entry=16810;
UPDATE item_template SET `spellid_1`=7709, `spellid_2`=7685, `spelltrigger_2`=1 WHERE entry=16810;
UPDATE item_template SET `stat_value1`=11, `stat_value2`=20, `stat_value3`=9, `stat_type4`=3, `stat_value4`=8, `fire_res`=10, `shadow_res`=0, `arcane_res`=10 WHERE entry=16811;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16811;
UPDATE item_template SET `stat_value1`=10, `stat_value2`=22, `stat_value3`=6, `fire_res`=0, `frost_res`=5, `shadow_res`=5 WHERE entry=16812;
UPDATE item_template SET `spellid_1`=9414, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16812;
UPDATE item_template SET `stat_value1`=23, `stat_value2`=23, `stat_value3`=15, `holy_res`=3, `fire_res`=0 WHERE entry=16813;
UPDATE item_template SET `spellid_1`=9414, `spellid_2`=9407, `spelltrigger_2`=1 WHERE entry=16813;
UPDATE item_template SET `stat_value1`=17, `stat_value2`=27, `stat_value3`=10, `stat_type4`=3, `stat_value4`=10, `fire_res`=5, `nature_res`=5, `shadow_res`=5 WHERE entry=16814;
UPDATE item_template SET `spellid_1`=25067, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16814;
UPDATE item_template SET `stat_value1`=24, `stat_value2`=23, `holy_res`=5, `fire_res`=5, `nature_res`=5, `frost_res`=5, `shadow_res`=5 WHERE entry=16815;
UPDATE item_template SET `spellid_1`=7706 WHERE entry=16815;
UPDATE item_template SET `stat_value3`=10, `stat_type4`=3, `stat_value4`=3, `frost_res`=7, `shadow_res`=0 WHERE entry=16816;
UPDATE item_template SET `spellid_1`=9407 WHERE entry=16816;
UPDATE item_template SET `stat_value2`=15, `stat_value3`=0, `fire_res`=0, `nature_res`=7, `shadow_res`=8 WHERE entry=16817;
UPDATE item_template SET `spellid_1`=9407, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16817;
UPDATE item_template SET `stat_value1`=30, `stat_value3`=0, `fire_res`=13, `shadow_res`=0 WHERE entry=16818;
UPDATE item_template SET `spellid_1`=23480 WHERE entry=16818;
UPDATE item_template SET `stat_value1`=11, `stat_value2`=15, `stat_value3`=3, `fire_res`=5, `shadow_res`=5 WHERE entry=16819;
UPDATE item_template SET `spellid_1`=9407, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16819;
UPDATE item_template SET `stat_value2`=14, `stat_type4`=6, `stat_value4`=7, `frost_res`=10, `arcane_res`=12 WHERE entry=16820;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16820;
UPDATE item_template SET `stat_value2`=15, `stat_value3`=12, `stat_type4`=6, `stat_value4`=5, `fire_res`=0, `nature_res`=4 WHERE entry=16821;
UPDATE item_template SET `stat_value1`=27, `stat_value3`=11, `stat_type4`=6, `stat_value4`=8, `frost_res`=8, `shadow_res`=12 WHERE entry=16822;
UPDATE item_template SET `spellid_1`=13669 WHERE entry=16822;
UPDATE item_template SET `stat_value1`=24, `stat_value2`=5, `stat_type4`=6, `stat_value4`=4, `nature_res`=11 WHERE entry=16823;
UPDATE item_template SET `stat_value1`=23, `stat_value2`=15, `stat_type3`=6, `stat_value3`=7, `nature_res`=9, `shadow_res`=0, `arcane_res`=5 WHERE entry=16824;
UPDATE item_template SET `stat_value1`=16, `stat_value2`=11, `stat_type3`=6, `stat_value3`=8, `fire_res`=8 WHERE entry=16825;
UPDATE item_template SET `stat_value1`=15, `stat_value2`=11, `stat_value3`=13, `stat_type4`=6, `stat_value4`=5, `fire_res`=0, `frost_res`=12, `arcane_res`=12 WHERE entry=16826;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16826;
UPDATE item_template SET `stat_value2`=11, `fire_res`=14, `shadow_res`=10, `arcane_res`=10 WHERE entry=16827;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16827;
UPDATE item_template SET `stat_value1`=20, `stat_value2`=7, `stat_value3`=8, `stat_type4`=4, `stat_value4`=10, `fire_res`=0, `nature_res`=6 WHERE entry=16828;
UPDATE item_template SET `spellid_1`=13599, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16828;
UPDATE item_template SET `stat_value1`=11, `stat_value2`=20, `stat_value3`=12, `stat_type4`=3, `stat_value4`=7, `nature_res`=8, `frost_res`=5, `shadow_res`=0, `arcane_res`=6 WHERE entry=16829;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16829;
UPDATE item_template SET `stat_value1`=11, `stat_value2`=10, `stat_value3`=5, `fire_res`=6 WHERE entry=16830;
UPDATE item_template SET `spellid_1`=25067 WHERE entry=16830;
UPDATE item_template SET `stat_value1`=10, `stat_value2`=22, `stat_value3`=8, `stat_type4`=4, `stat_value4`=10 WHERE entry=16831;
UPDATE item_template SET `spellid_1`=13596 WHERE entry=16831;
UPDATE item_template SET `stat_value1`=30, `stat_value2`=13, `stat_value3`=4, `stat_type4`=6, `stat_value4`=3, `holy_res`=10, `fire_res`=0, `frost_res`=10 WHERE entry=16832;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16832;
UPDATE item_template SET `stat_value1`=23, `stat_value2`=20, `stat_value3`=15, `stat_type4`=4, `stat_value4`=10, `fire_res`=0 WHERE entry=16833;
UPDATE item_template SET `spellid_1`=18031, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16833;
UPDATE item_template SET `stat_value1`=24, `stat_value2`=20, `stat_value3`=14, `holy_res`=3, `fire_res`=8, `shadow_res`=12 WHERE entry=16834;
UPDATE item_template SET `spellid_1`=25067 WHERE entry=16834;
UPDATE item_template SET `stat_value1`=15, `stat_value2`=24, `stat_value3`=11, `stat_type4`=3, `stat_value4`=5, `holy_res`=3, `fire_res`=5, `nature_res`=3, `frost_res`=5, `shadow_res`=0 WHERE entry=16835;
UPDATE item_template SET `spellid_1`=13599, `spellid_2`=9411, `spellid_3`=0, `spelltrigger_3`=0 WHERE entry=16835;
UPDATE item_template SET `stat_value1`=18, `stat_value2`=8, `stat_value3`=11, `stat_type4`=3, `stat_value4`=7, `frost_res`=8, `shadow_res`=8 WHERE entry=16836;
UPDATE item_template SET `spellid_1`=9411, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16836;
UPDATE item_template SET `stat_value1`=0, `stat_value2`=19, `stat_value3`=13, `stat_type4`=3, `stat_value4`=11, `nature_res`=7, `shadow_res`=5, `arcane_res`=3 WHERE entry=16837;
UPDATE item_template SET `spellid_1`=7703 WHERE entry=16837;
UPDATE item_template SET `stat_value1`=18, `stat_value2`=12, `stat_value3`=7, `stat_type4`=4, `stat_value4`=8, `fire_res`=0, `frost_res`=3 WHERE entry=16838;
UPDATE item_template SET `spellid_1`=9407, `spellid_2`=9411 WHERE entry=16838;
UPDATE item_template SET `stat_value1`=8, `stat_value2`=18, `stat_value3`=7, `stat_type4`=4, `stat_value4`=6, `frost_res`=5 WHERE entry=16839;
UPDATE item_template SET `spellid_1`=25067, `spellid_2`=7696 WHERE entry=16839;
UPDATE item_template SET `stat_value1`=10, `stat_value2`=8, `stat_value3`=7, `stat_type4`=4, `stat_value4`=8, `fire_res`=5 WHERE entry=16840;
UPDATE item_template SET `spellid_1`=9407 WHERE entry=16840;
UPDATE item_template SET `stat_value1`=20, `stat_value2`=18, `stat_value3`=15, `stat_type4`=4, `stat_value4`=4, `fire_res`=0, `shadow_res`=3 WHERE entry=16841;
UPDATE item_template SET `spellid_1`=18031, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16841;
UPDATE item_template SET `stat_value2`=12, `stat_value3`=20, `holy_res`=3, `fire_res`=0, `nature_res`=3, `frost_res`=7 WHERE entry=16842;
UPDATE item_template SET `spellid_1`=23481, `spellid_2`=9404 WHERE entry=16842;
UPDATE item_template SET `stat_value1`=14, `stat_value2`=23, `stat_value3`=13, `stat_type4`=4, `stat_value4`=12, `fire_res`=11, `nature_res`=7, `shadow_res`=7 WHERE entry=16843;
UPDATE item_template SET `spellid_1`=9411, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16843;
UPDATE item_template SET `stat_value1`=17, `stat_value2`=9, `stat_value3`=14, `stat_type4`=3, `stat_value4`=4, `holy_res`=9, `fire_res`=9, `shadow_res`=0 WHERE entry=16844;
UPDATE item_template SET `spellid_1`=23480, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16844;
UPDATE item_template SET `stat_value1`=24, `stat_value2`=14, `stat_type4`=4, `stat_value4`=3, `holy_res`=6, `fire_res`=7, `nature_res`=6 WHERE entry=16845;
UPDATE item_template SET `stat_value1`=20, `stat_value2`=16, `stat_value3`=7, `holy_res`=8, `fire_res`=12, `frost_res`=12 WHERE entry=16846;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16846;
UPDATE item_template SET `stat_value1`=27, `stat_value3`=15, `stat_type5`=4, `stat_value5`=8, `holy_res`=8, `frost_res`=8, `shadow_res`=8 WHERE entry=16847;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16847;
UPDATE item_template SET `stat_value1`=22, `stat_value4`=15, `shadow_res`=0 WHERE entry=16848;
UPDATE item_template SET `stat_value1`=22, `stat_value2`=7, `stat_value3`=15, `stat_type4`=4, `stat_value4`=6, `nature_res`=9, `shadow_res`=5 WHERE entry=16849;
UPDATE item_template SET `stat_value1`=15, `stat_value2`=7, `stat_value3`=6, `stat_value4`=8, `fire_res`=8, `frost_res`=7 WHERE entry=16850;
UPDATE item_template SET `stat_value1`=15, `stat_value2`=5, `stat_value3`=12, `stat_value4`=11, `fire_res`=10, `nature_res`=9, `shadow_res`=9 WHERE entry=16851;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16851;
UPDATE item_template SET `stat_value1`=15, `stat_value2`=10, `stat_type3`=6, `stat_value3`=3, `fire_res`=0 WHERE entry=16852;
UPDATE item_template SET `spellid_1`=13670 WHERE entry=16852;
UPDATE item_template SET `stat_value1`=18, `stat_value2`=11, `stat_value3`=24, `stat_value4`=15, `stat_type5`=3, `stat_value5`=4, `fire_res`=0, `nature_res`=9 WHERE entry=16853;
UPDATE item_template SET `spellid_1`=25067 WHERE entry=16853;
UPDATE item_template SET `stat_value1`=14, `stat_value2`=11, `stat_value4`=14, `fire_res`=0, `nature_res`=6, `frost_res`=6 WHERE entry=16854;
UPDATE item_template SET `spellid_1`=7597, `spellid_2`=25067 WHERE entry=16854;
UPDATE item_template SET `stat_value1`=10, `stat_value2`=15, `stat_value3`=15, `stat_value4`=23, `stat_type5`=3, `stat_value5`=5, `fire_res`=12, `shadow_res`=8 WHERE entry=16855;
UPDATE item_template SET `spellid_1`=13669, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16855;
UPDATE item_template SET `stat_value1`=14, `stat_value3`=18, `stat_value4`=11, `stat_type5`=3, `stat_value5`=7, `fire_res`=8, `shadow_res`=8 WHERE entry=16856;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16856;
UPDATE item_template SET `stat_value1`=7, `stat_value2`=12, `stat_type5`=3, `stat_value5`=8 WHERE entry=16857;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16857;
UPDATE item_template SET `stat_value1`=16, `fire_res`=0, `arcane_res`=3 WHERE entry=16858;
UPDATE item_template SET `spellid_1`=9407 WHERE entry=16858;
UPDATE item_template SET `stat_value1`=0, `stat_value2`=11, `stat_value4`=13, `stat_type5`=3, `stat_value5`=4, `shadow_res`=9 WHERE entry=16859;
UPDATE item_template SET `spellid_1`=15464, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16859;
UPDATE item_template SET `stat_value1`=0, `stat_value2`=17, `stat_value3`=11, `stat_value4`=15, `fire_res`=0, `frost_res`=10, `arcane_res`=11 WHERE entry=16860;
UPDATE item_template SET `spellid_1`=13674 WHERE entry=16860;
UPDATE item_template SET `stat_value1`=18, `stat_type3`=3, `stat_value3`=8, `fire_res`=5 WHERE entry=16861;
UPDATE item_template SET `stat_value1`=23, `stat_type3`=6, `stat_value3`=5, `frost_res`=7, `shadow_res`=0 WHERE entry=16862;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16862;
UPDATE item_template SET `stat_value2`=18, `stat_type3`=6, `stat_value3`=11, `shadow_res`=11 WHERE entry=16863;
UPDATE item_template SET `spellid_1`=7597, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16863;
UPDATE item_template SET `stat_value2`=17, `stat_type3`=3, `stat_value3`=5, `fire_res`=11, `nature_res`=8, `frost_res`=9, `arcane_res`=9 WHERE entry=16864;
UPDATE item_template SET `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16864;
UPDATE item_template SET `stat_type3`=6, `stat_value3`=7, `fire_res`=8, `shadow_res`=8 WHERE entry=16865;
UPDATE item_template SET `spellid_1`=13675, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16865;
UPDATE item_template SET `stat_value1`=27, `stat_value2`=17, `stat_type3`=6, `stat_value3`=10, `holy_res`=12, `fire_res`=0, `nature_res`=7 WHERE entry=16866;
UPDATE item_template SET `spellid_1`=15464, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16866;
UPDATE item_template SET `stat_type3`=6, `stat_value3`=7, `shadow_res`=0 WHERE entry=16867;
UPDATE item_template SET `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16867;
UPDATE item_template SET `stat_type3`=3, `stat_value3`=10, `nature_res`=6, `frost_res`=5, `shadow_res`=6 WHERE entry=16868;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16868;
UPDATE item_template SET `stat_value1`=23, `stat_value2`=32, `stat_value3`=16, `stat_type4`=4, `stat_value4`=8, `fire_res`=5, `nature_res`=7, `frost_res`=6 WHERE entry=16897;
UPDATE item_template SET `spellid_1`=13592, `spellid_2`=7692, `spellid_3`=7678, `spelltrigger_3`=1 WHERE entry=16897;
UPDATE item_template SET `stat_value1`=12, `stat_value2`=23, `stat_value3`=14, `stat_type4`=3, `stat_value4`=7, `fire_res`=8, `shadow_res`=6 WHERE entry=16898;
UPDATE item_template SET `spellid_1`=13596, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16898;
UPDATE item_template SET `stat_value1`=13, `stat_value2`=25, `stat_value3`=8, `stat_type4`=4, `stat_value4`=8, `shadow_res`=0 WHERE entry=16899;
UPDATE item_template SET `spellid_1`=7692, `spellid_2`=25067, `spelltrigger_2`=1 WHERE entry=16899;
UPDATE item_template SET `stat_value2`=17, `stat_value3`=15, `holy_res`=9, `frost_res`=0, `shadow_res`=9 WHERE entry=16900;
UPDATE item_template SET `spellid_1`=13604, `spellid_2`=18031 WHERE entry=16900;
UPDATE item_template SET `stat_value1`=17, `stat_value2`=27, `stat_value3`=14, `stat_type4`=4, `stat_value4`=6, `fire_res`=12, `frost_res`=9, `shadow_res`=8, `arcane_res`=0 WHERE entry=16901;
UPDATE item_template SET `spellid_1`=13592, `spellid_2`=9360 WHERE entry=16901;
UPDATE item_template SET `stat_value1`=23, `stat_value2`=13, `stat_value3`=15, `stat_type4`=4, `stat_value4`=4, `fire_res`=6, `nature_res`=14 WHERE entry=16902;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16902;
UPDATE item_template SET `stat_value1`=20, `stat_value2`=13, `stat_value3`=6, `stat_type4`=4, `stat_value4`=10, `frost_res`=3, `shadow_res`=0 WHERE entry=16903;
UPDATE item_template SET `spellid_1`=9360, `spellid_2`=9407 WHERE entry=16903;
UPDATE item_template SET `stat_value1`=12, `stat_value2`=16, `stat_value3`=3, `arcane_res`=9 WHERE entry=16904;
UPDATE item_template SET `spellid_1`=13599 WHERE entry=16904;
UPDATE item_template SET `stat_value1`=40, `stat_value2`=12, `stat_value3`=11, `stat_type4`=6, `stat_value4`=11, `fire_res`=8, `nature_res`=0, `shadow_res`=8 WHERE entry=16905;
UPDATE item_template SET `spellid_1`=13669, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16905;
UPDATE item_template SET `stat_value1`=27, `stat_value2`=16, `stat_value3`=4, `stat_type4`=6, `stat_value4`=8, `fire_res`=0, `nature_res`=13 WHERE entry=16906;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16906;
UPDATE item_template SET `stat_value1`=17, `stat_value2`=13, `stat_value3`=16, `fire_res`=8, `shadow_res`=0 WHERE entry=16907;
UPDATE item_template SET `spellid_1`=15465 WHERE entry=16907;
UPDATE item_template SET `stat_value1`=23, `stat_value2`=17, `stat_value3`=9, `holy_res`=7, `frost_res`=7, `shadow_res`=8 WHERE entry=16908;
UPDATE item_template SET `spellid_1`=20884 WHERE entry=16908;
UPDATE item_template SET `stat_value1`=36, `stat_value2`=18, `stat_type4`=6, `stat_value4`=8, `holy_res`=10, `nature_res`=10, `frost_res`=10, `shadow_res`=10, `arcane_res`=0 WHERE entry=16909;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16909;
UPDATE item_template SET `stat_value1`=17, `stat_value2`=11, `stat_type4`=6, `stat_value4`=5, `fire_res`=11, `nature_res`=3 WHERE entry=16910;
UPDATE item_template SET `stat_type3`=6, `stat_value3`=9 WHERE entry=16911;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16911;
UPDATE item_template SET `stat_value1`=17, `stat_value2`=20, `fire_res`=0, `nature_res`=10 WHERE entry=16912;
UPDATE item_template SET `spellid_1`=13599 WHERE entry=16912;
UPDATE item_template SET `stat_value1`=17, `stat_value2`=23, `stat_value3`=3, `shadow_res`=15 WHERE entry=16913;
UPDATE item_template SET `spellid_1`=23480, `spellid_2`=7699 WHERE entry=16913;
UPDATE item_template SET `stat_value1`=40, `stat_value2`=14, `stat_value3`=8, `fire_res`=3, `frost_res`=0, `shadow_res`=0, `arcane_res`=8 WHERE entry=16914;
UPDATE item_template SET `spellid_1`=13604, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16914;
UPDATE item_template SET `stat_value1`=26, `stat_value2`=27, `stat_value3`=0, `stat_type4`=3, `stat_value4`=8, `fire_res`=0, `nature_res`=3, `frost_res`=17, `arcane_res`=0 WHERE entry=16915;
UPDATE item_template SET `spellid_1`=9307, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16915;
UPDATE item_template SET `stat_value1`=36, `stat_value2`=17, `stat_value3`=8, `fire_res`=9, `nature_res`=3 WHERE entry=16916;
UPDATE item_template SET `spellid_1`=25065, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16916;
UPDATE item_template SET `stat_value1`=27, `stat_value2`=8, `stat_value3`=10, `stat_type4`=3, `stat_value4`=6, `holy_res`=6, `fire_res`=0 WHERE entry=16917;
UPDATE item_template SET `spellid_1`=23481, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16917;
UPDATE item_template SET `stat_value1`=23, `stat_value2`=13 WHERE entry=16918;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16918;
UPDATE item_template SET `stat_value1`=13, `stat_value2`=23, `stat_value3`=15, `stat_type4`=3, `stat_value4`=6, `fire_res`=0 WHERE entry=16919;
UPDATE item_template SET `spellid_1`=9414 WHERE entry=16919;
UPDATE item_template SET `stat_value1`=13, `stat_value2`=25, `stat_value3`=0, `holy_res`=12, `nature_res`=6, `shadow_res`=0 WHERE entry=16920;
UPDATE item_template SET `spellid_1`=25067, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16920;
UPDATE item_template SET `stat_value2`=26, `fire_res`=12, `nature_res`=12, `frost_res`=0, `shadow_res`=12 WHERE entry=16921;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16921;
UPDATE item_template SET `stat_value1`=23, `stat_value2`=31, `stat_value3`=8, `holy_res`=3, `frost_res`=14, `shadow_res`=0, `arcane_res`=0 WHERE entry=16922;
UPDATE item_template SET `spellid_1`=25064, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16922;
UPDATE item_template SET `stat_value2`=27, `fire_res`=0, `nature_res`=0, `shadow_res`=8, `arcane_res`=3 WHERE entry=16923;
UPDATE item_template SET `spellid_1`=18031 WHERE entry=16923;
UPDATE item_template SET `stat_type4`=3, `stat_value4`=4, `fire_res`=5, `nature_res`=3 WHERE entry=16924;
UPDATE item_template SET `spellid_1`=9407, `spellid_2`=7709, `spelltrigger_2`=1 WHERE entry=16924;
UPDATE item_template SET `stat_value1`=25, `stat_value2`=17, `stat_value3`=8, `fire_res`=6, `shadow_res`=8 WHERE entry=16925;
UPDATE item_template SET `spellid_1`=9407 WHERE entry=16925;
UPDATE item_template SET `stat_value2`=23 WHERE entry=16926;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16926;
UPDATE item_template SET `stat_value1`=13, `stat_value2`=17, `fire_res`=0, `nature_res`=3 WHERE entry=16927;
UPDATE item_template SET `spellid_1`=25064 WHERE entry=16927;
UPDATE item_template SET `stat_value1`=11, `stat_value3`=13, `stat_type2`=6, `stat_value2`=20, `holy_res`=3, `nature_res`=12, `shadow_res`=0 WHERE entry=16928;
UPDATE item_template SET `spellid_1`=25065, `spellid_2`=0, `spelltrigger_2`=0, `spellid_3`=0, `spelltrigger_3`=0 WHERE entry=16928;
UPDATE item_template SET `stat_value1`=26, `stat_value2`=11, `stat_value3`=23, `holy_res`=12, `fire_res`=3, `frost_res`=0, `shadow_res`=7 WHERE entry=16929;
UPDATE item_template SET `spellid_1`=18011, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16929;
UPDATE item_template SET `stat_value1`=17, `stat_value2`=23, `stat_value3`=20, `stat_type4`=3, `stat_value4`=9, `fire_res`=7, `frost_res`=3, `arcane_res`=0 WHERE entry=16930;
UPDATE item_template SET `spellid_1`=17869 WHERE entry=16930;
UPDATE item_template SET `stat_value1`=23, `stat_value2`=17, `stat_value3`=27, `stat_type4`=3, `stat_value4`=5, `fire_res`=3, `nature_res`=0, `shadow_res`=9 WHERE entry=16931;
UPDATE item_template SET `spellid_1`=25064, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16931;
UPDATE item_template SET `stat_value1`=17, `stat_value2`=8, `stat_value3`=17, `stat_type4`=3, `stat_value4`=6, `fire_res`=6 WHERE entry=16932;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16932;
UPDATE item_template SET `stat_value1`=20, `stat_value2`=11, `stat_value3`=14, `fire_res`=13, `frost_res`=12, `shadow_res`=13 WHERE entry=16933;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16933;
UPDATE item_template SET `stat_value1`=13, `stat_value2`=9, `stat_value3`=16 WHERE entry=16934;
UPDATE item_template SET `spellid_1`=9414 WHERE entry=16934;
UPDATE item_template SET `stat_value1`=21, `stat_value2`=8, `stat_value4`=9, `holy_res`=9 WHERE entry=16935;
UPDATE item_template SET `stat_value1`=15, `stat_value4`=12, `shadow_res`=0 WHERE entry=16936;
UPDATE item_template SET `spellid_1`=13670 WHERE entry=16936;
UPDATE item_template SET `stat_value2`=14, `stat_value3`=8, `fire_res`=0, `nature_res`=9, `frost_res`=8 WHERE entry=16937;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16937;
UPDATE item_template SET `stat_value1`=33, `stat_value2`=11, `stat_value3`=16, `stat_value4`=23, `stat_type5`=4, `stat_value5`=8, `holy_res`=8, `fire_res`=0, `arcane_res`=0 WHERE entry=16938;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16938;
UPDATE item_template SET `stat_value1`=20, `stat_value2`=21, `stat_value3`=6, `stat_value4`=21, `stat_type5`=4, `stat_value5`=7, `fire_res`=12, `frost_res`=0, `shadow_res`=11 WHERE entry=16939;
UPDATE item_template SET `stat_value1`=17, `stat_value2`=0, `stat_value3`=8, `stat_value4`=20, `stat_type5`=4, `stat_value5`=9, `fire_res`=10, `nature_res`=10, `frost_res`=10, `shadow_res`=3 WHERE entry=16940;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16940;
UPDATE item_template SET `stat_value1`=25, `stat_value2`=0, `stat_value3`=12, `stat_value4`=17, `fire_res`=0, `shadow_res`=10, `arcane_res`=6 WHERE entry=16941;
UPDATE item_template SET `stat_value1`=36, `stat_value2`=16, `stat_value3`=4, `stat_value4`=23, `fire_res`=0, `nature_res`=0, `shadow_res`=3 WHERE entry=16942;
UPDATE item_template SET `spellid_1`=15464 WHERE entry=16942;
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `stat_value3`=0, `armor`=182 WHERE entry=16943;
UPDATE item_template SET `spellid_1`=7696 WHERE entry=16943;
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `stat_value3`=0, `armor`=234, `shadow_res`=0 WHERE entry=16944;
UPDATE item_template SET `spellid_1`=18031, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16944;
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `stat_value3`=0, `armor`=312, `fire_res`=0 WHERE entry=16945;
UPDATE item_template SET `spellid_1`=9407 WHERE entry=16945;
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `stat_value3`=0, `armor`=364, `fire_res`=0, `arcane_res`=0 WHERE entry=16946;
UPDATE item_template SET `spellid_1`=7678, `spellid_2`=23480 WHERE entry=16946;
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `stat_value3`=0, `armor`=338, `frost_res`=0, `shadow_res`=0 WHERE entry=16947;
UPDATE item_template SET `spellid_1`=25065, `spellid_2`=9360, `spellid_3`=0, `spelltrigger_3`=0 WHERE entry=16947;
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `stat_value3`=0, `armor`=260, `shadow_res`=0 WHERE entry=16948;
UPDATE item_template SET `spellid_1`=9407, `spellid_2`=9411, `spellid_3`=0, `spelltrigger_3`=0 WHERE entry=16948;
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `stat_value3`=0, `armor`=286, `fire_res`=0 WHERE entry=16949;
UPDATE item_template SET `spellid_1`=9307 WHERE entry=16949;
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `stat_value3`=0, `armor`=416, `fire_res`=0, `nature_res`=0 WHERE entry=16950;
UPDATE item_template SET `spellid_1`=9407, `spellid_2`=7703, `spelltrigger_2`=1 WHERE entry=16950;
UPDATE item_template SET `stat_value2`=5, `stat_value3`=19, `stat_value4`=11, `holy_res`=6, `nature_res`=6 WHERE entry=16951;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16951;
UPDATE item_template SET `stat_value2`=11, `stat_value3`=13, `stat_value4`=20, `fire_res`=8, `frost_res`=8, `shadow_res`=0 WHERE entry=16952;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16952;
UPDATE item_template SET `stat_value1`=17, `stat_value2`=12, `stat_value3`=25, `fire_res`=0 WHERE entry=16953;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16953;
UPDATE item_template SET `stat_value1`=11, `stat_value2`=17, `stat_value3`=20, `stat_value4`=31, `stat_type5`=3, `stat_value5`=7, `fire_res`=0, `arcane_res`=0 WHERE entry=16954;
UPDATE item_template SET `spellid_1`=25067, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16954;
UPDATE item_template SET `stat_value1`=19, `stat_value2`=4, `stat_value3`=31, `stat_type5`=3, `stat_value5`=4, `holy_res`=7, `fire_res`=8, `frost_res`=0, `shadow_res`=0 WHERE entry=16955;
UPDATE item_template SET `spellid_1`=18031 WHERE entry=16955;
UPDATE item_template SET `stat_value1`=0, `stat_value2`=13, `stat_value4`=19, `stat_type5`=3, `stat_value5`=6, `holy_res`=3, `frost_res`=8, `shadow_res`=5 WHERE entry=16956;
UPDATE item_template SET `spellid_1`=25067, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16956;
UPDATE item_template SET `stat_value1`=0, `stat_value2`=17, `stat_value3`=0, `stat_value4`=15, `stat_type5`=3, `stat_value5`=6, `fire_res`=0, `nature_res`=8, `shadow_res`=5 WHERE entry=16957;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16957;
UPDATE item_template SET `stat_value1`=18, `stat_value2`=16, `stat_value3`=33, `stat_value4`=17, `stat_type5`=3, `stat_value5`=5, `fire_res`=6, `nature_res`=0, `shadow_res`=6 WHERE entry=16958;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16958;
UPDATE item_template SET `stat_value1`=23, `stat_type3`=6, `stat_value3`=6 WHERE entry=16959;
UPDATE item_template SET `stat_value1`=16, `stat_value2`=23, `stat_type3`=6, `stat_value3`=7, `fire_res`=6, `nature_res`=5, `shadow_res`=3, `arcane_res`=6 WHERE entry=16960;
UPDATE item_template SET `spellid_1`=13674, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16960;
UPDATE item_template SET `stat_value1`=30, `stat_value2`=17, `stat_type3`=3, `stat_value3`=8, `holy_res`=6, `fire_res`=0, `shadow_res`=6 WHERE entry=16961;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16961;
UPDATE item_template SET `stat_value1`=23, `stat_value2`=36, `stat_type3`=6, `stat_value3`=8, `fire_res`=7, `arcane_res`=0 WHERE entry=16962;
UPDATE item_template SET `spellid_1`=13669, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16962;
UPDATE item_template SET `stat_value1`=36, `stat_value2`=22, `stat_type3`=6, `stat_value3`=3, `fire_res`=6, `frost_res`=6, `shadow_res`=5 WHERE entry=16963;
UPDATE item_template SET `spellid_1`=7597 WHERE entry=16963;
UPDATE item_template SET `stat_value1`=17, `stat_value2`=23, `stat_type3`=6, `stat_value3`=7, `holy_res`=8, `nature_res`=10, `shadow_res`=8 WHERE entry=16964;
UPDATE item_template SET `spellid_1`=15464, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16964;
UPDATE item_template SET `stat_value2`=16, `stat_type3`=6, `stat_value3`=3, `fire_res`=0, `frost_res`=8 WHERE entry=16965;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=16965;
UPDATE item_template SET `stat_value2`=23, `stat_type3`=6, `stat_value3`=10, `fire_res`=0, `nature_res`=3 WHERE entry=16966;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=16966;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=17064;
UPDATE item_template SET `stat_value1`=10, `stat_value2`=8 WHERE entry=17065;
UPDATE item_template SET `spellid_2`=21408 WHERE entry=17065;
UPDATE item_template SET `armor`=2291, `holy_res`=10 WHERE entry=17066;
UPDATE item_template SET `spellid_3`=0, `spelltrigger_3`=0 WHERE entry=17066;
UPDATE item_template SET `dmg_min1`=94, `dmg_max1`=175 WHERE entry=17068;
UPDATE item_template SET `spellid_1`=21141 WHERE entry=17068;
UPDATE item_template SET `dmg_min1`=49, `dmg_max1`=91 WHERE entry=17069;
UPDATE item_template SET `spellid_1`=9331 WHERE entry=17069;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0, `spellid_3`=0, `spelltrigger_3`=0 WHERE entry=17070;
UPDATE item_template SET stat_value1=0, stat_type1=0 WHERE entry=17072;
UPDATE item_template SET `dmg_min1`=63, `dmg_max1`=118 WHERE entry=17072;
UPDATE item_template SET `dmg_min1`=158, `dmg_max1`=238 WHERE entry=17073;
UPDATE item_template SET `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=17073;
UPDATE item_template SET `dmg_min1`=142, `dmg_max1`=214 WHERE entry=17074;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=17075;
UPDATE item_template SET `stat_value1`=15, `armor`=49, `holy_res`=5, `frost_res`=5, `arcane_res`=0 WHERE entry=17078;
UPDATE item_template SET `spellid_1`=9397 WHERE entry=17078;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=17082;
UPDATE item_template SET `stat_value1`=8, `stat_value2`=5, `arcane_res`=10 WHERE entry=17103;
UPDATE item_template SET `dmg_min1`=74, `dmg_max1`=138 WHERE entry=17103;
UPDATE item_template SET `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=17103;
UPDATE item_template SET `shadow_res`=10 WHERE entry=17105;
UPDATE item_template SET `dmg_min1`=89, `dmg_max1`=166 WHERE entry=17105;
UPDATE item_template SET `spellid_1`=21618, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=17105;
UPDATE item_template SET `stat_value3`=0 WHERE entry=17109;
UPDATE item_template SET `spellid_1`=12854 WHERE entry=17109;
UPDATE item_template SET `stat_value1`=10, `stat_value2`=10, `stat_value3`=10, `holy_res`=5, `fire_res`=5, `nature_res`=5, `frost_res`=5, `shadow_res`=5, `arcane_res`=0 WHERE entry=17110;
UPDATE item_template SET `spellid_1`=21623 WHERE entry=17110;
UPDATE item_template SET `dmg_min1`=168, `dmg_max1`=252 WHERE entry=17113;
UPDATE item_template SET `spellid_2`=9415 WHERE entry=17113;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0 WHERE entry=17223;
UPDATE item_template SET `spellid_1`=7681, `spellid_2`=7694 WHERE entry=17721;
UPDATE item_template SET `spellid_1`=13390 WHERE entry=17734;
UPDATE item_template SET `spellid_1`=21513 WHERE entry=17741;
UPDATE item_template SET `spellid_2`=21345 WHERE entry=17743;
UPDATE item_template SET `dmg_min1`=33, `dmg_max1`=69 WHERE entry=17780;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=17943;
UPDATE item_template SET `stat_value1`=13, `stat_value2`=0, `armor`=102 WHERE entry=18043;
UPDATE item_template SET Quality=2 WHERE entry=18043;
UPDATE item_template SET `stat_value1`=10, `stat_value2`=0 WHERE entry=18044;
UPDATE item_template SET `dmg_min1`=42, `dmg_max1`=80 WHERE entry=18044;
UPDATE item_template SET Quality=2 WHERE entry=18044;
UPDATE item_template SET `stat_value1`=0, `fire_res`=10 WHERE entry=18047;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=18047;
UPDATE item_template SET `stat_value1`=0, `fire_res`=10 WHERE entry=18048;
UPDATE item_template SET `dmg_min1`=62, `dmg_max1`=116 WHERE entry=18048;
UPDATE item_template SET `spellid_1`=7686 WHERE entry=18048;
UPDATE item_template SET Quality=2 WHERE entry=18048;
UPDATE item_template SET `spellid_1`=9417 WHERE entry=18082;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=18102;
UPDATE item_template SET `stat_value1`=10, `stat_value2`=9, `stat_value3`=4 WHERE entry=18208;
UPDATE item_template SET `spellid_1`=9407 WHERE entry=18208;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=18282;
UPDATE item_template SET `spellid_1`=9409 WHERE entry=18289;
UPDATE item_template SET `spellid_1`=21596 WHERE entry=18298;
UPDATE item_template SET `spellid_1`=9395 WHERE entry=18301;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=18307;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=18312;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=18318;
UPDATE item_template SET `spellid_1`=25109 WHERE entry=18321;
UPDATE item_template SET `spellid_1`=25110 WHERE entry=18322;
UPDATE item_template SET `spellid_1`=13597 WHERE entry=18338;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=18351;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=18354;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=18370;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=18372;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=18375;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=18379;
UPDATE item_template SET `spellid_1`=14254 WHERE entry=18385;
UPDATE item_template SET `spellid_1`=23796 WHERE entry=18389;
UPDATE item_template SET `spellid_1`=9317 WHERE entry=18391;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=18394;
UPDATE item_template SET `spellid_1`=9397 WHERE entry=18396;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0, `spellid_3`=0, `spelltrigger_3`=0 WHERE entry=18406;
UPDATE item_template SET `spellid_1`=18009 WHERE entry=18407;
UPDATE item_template SET `spellid_1`=17868 WHERE entry=18408;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=18411;
UPDATE item_template SET `spellid_1`=13386 WHERE entry=18413;
UPDATE item_template SET `stat_value2`=0, `stat_type3`=5, `stat_value3`=6 WHERE entry=18435;
UPDATE item_template SET `stat_value1`=18 WHERE entry=18456;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=18458;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=18459;
UPDATE item_template SET `spellid_1`=9344 WHERE entry=18465;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=18467;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0, `spellid_2`=0, `spelltrigger_2`=0 WHERE entry=18469;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=18471;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=18473;
UPDATE item_template SET `spellid_1`=9346 WHERE entry=18479;
UPDATE item_template SET `dmg_min1`=43, `dmg_max1`=80 WHERE entry=18482;
UPDATE item_template SET `spellid_1`=13390 WHERE entry=18495;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=18497;
UPDATE item_template SET `spellid_2`=13390 WHERE entry=18502;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=18503;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=18507;
UPDATE item_template SET `spellid_1`=0, `spelltrigger_1`=0 WHERE entry=18521;
UPDATE item_template SET `spellid_1`=9318 WHERE entry=18523;
UPDATE item_template SET `spellid_1`=9407 WHERE entry=18525;
UPDATE item_template SET `spellid_1`=18033 WHERE entry=18527;
UPDATE item_template SET `spellid_1`=21408 WHERE entry=18531;
UPDATE item_template SET `spellid_2`=9344 WHERE entry=18534;
UPDATE item_template SET `spellid_1`=9415 WHERE entry=18546;
UPDATE item_template SET `spellid_1`=21408 WHERE entry=18547;
-- UPDATE [Tier 2] stats for patch 1.2 state
UPDATE `item_template` SET `stat_type1` = 5, `stat_VALUE1` = 20, `stat_type2` = 6, `stat_VALUE2` = 13, `stat_type3` = 7, `stat_VALUE3` = 4, `stat_type4` = 4, `stat_VALUE4` = 16, `stat_type5` = 0, `stat_VALUE5` = 0, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 234, `holy_res` = 0, `fire_res` = 0, `nature_res` = 0, `frost_res` = 0, `shadow_res` = 0, `arcane_res` = 0, `spellid_1` = 17371, `spelltrigger_1` = 1, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 0, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16944;
UPDATE `item_template` SET `stat_type1` = 5, `stat_VALUE1` = 11, `stat_type2` = 6, `stat_VALUE2` = 12, `stat_type3` = 7, `stat_VALUE3` = 7, `stat_type4` = 4, `stat_VALUE4` = 9, `stat_type5` = 0, `stat_VALUE5` = 0, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 182, `holy_res` = 0, `fire_res` = 7, `nature_res` = 6, `frost_res` = 6, `shadow_res` = 0, `arcane_res` = 0, `spellid_1` = 9411, `spelltrigger_1` = 1, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 0, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16943;
UPDATE `item_template` SET `stat_type1` = 5, `stat_VALUE1` = 31, `stat_type2` = 6, `stat_VALUE2` = 20, `stat_type3` = 7, `stat_VALUE3` = 17, `stat_type4` = 4, `stat_VALUE4` = 15, `stat_type5` = 0, `stat_VALUE5` = 0, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 416, `holy_res` = 0, `fire_res` = 0, `nature_res` = 0, `frost_res` = 0, `shadow_res` = 3, `arcane_res` = 3, `spellid_1` = 9408, `spelltrigger_1` = 1, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 9404, `spelltrigger_2` = 1, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16950;
UPDATE `item_template` SET `stat_type1` = 5, `stat_VALUE1` = 17, `stat_type2` = 6, `stat_VALUE2` = 10, `stat_type3` = 7, `stat_VALUE3` = 23, `stat_type4` = 0, `stat_VALUE4` = 0, `stat_type5` = 0, `stat_VALUE5` = 0, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 312, `holy_res` = 0, `fire_res` = 0, `nature_res` = 0, `frost_res` = 0, `shadow_res` = 9, `arcane_res` = 9, `spellid_1` = 9408, `spelltrigger_1` = 1, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 0, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16945;
UPDATE `item_template` SET `stat_type1` = 6, `stat_VALUE1` = 23, `stat_type2` = 7, `stat_VALUE2` = 7, `stat_type3` = 4, `stat_VALUE3` = 13, `stat_type4` = 0, `stat_VALUE4` = 0, `stat_type5` = 0, `stat_VALUE5` = 0, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 260, `holy_res` = 0, `fire_res` = 6, `nature_res` = 0, `frost_res` = 6, `shadow_res` = 0, `arcane_res` = 0, `spellid_1` = 9408, `spelltrigger_1` = 1, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 9461, `spelltrigger_2` = 1, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16948;
UPDATE `item_template` SET `stat_type1` = 3, `stat_VALUE1` = 17, `stat_type2` = 6, `stat_VALUE2` = 20, `stat_type3` = 7, `stat_VALUE3` = 13, `stat_type4` = 0, `stat_VALUE4` = 0, `stat_type5` = 0, `stat_VALUE5` = 0, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 286, `holy_res` = 0, `fire_res` = 0, `nature_res` = 0, `frost_res` = 3, `shadow_res` = 0, `arcane_res` = 0, `spellid_1` = 17892, `spelltrigger_1` = 1, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 0, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16949;
UPDATE `item_template` SET `stat_type1` = 5, `stat_VALUE1` = 23, `stat_type2` = 6, `stat_VALUE2` = 17, `stat_type3` = 7, `stat_VALUE3` = 16, `stat_type4` = 0, `stat_VALUE4` = 0, `stat_type5` = 0, `stat_VALUE5` = 0, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 338, `holy_res` = 0, `fire_res` = 8, `nature_res` = 8, `frost_res` = 0, `shadow_res` = 0, `arcane_res` = 0, `spellid_1` = 17868, `spelltrigger_1` = 1, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 17990, `spelltrigger_2` = 1, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16947;
UPDATE `item_template` SET `stat_type1` = 5, `stat_VALUE1` = 12, `stat_type2` = 6, `stat_VALUE2` = 33, `stat_type3` = 7, `stat_VALUE3` = 15, `stat_type4` = 4, `stat_VALUE4` = 16, `stat_type5` = 3, `stat_VALUE5` = 8, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 364, `holy_res` = 0, `fire_res` = 0, `nature_res` = 0, `frost_res` = 0, `shadow_res` = 0, `arcane_res` = 0, `spellid_1` = 7679, `spelltrigger_1` = 1, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 9401, `spelltrigger_2` = 1, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16946;
UPDATE `item_template` SET `stat_type1` = 5, `stat_VALUE1` = 25, `stat_type2` = 6, `stat_VALUE2` = 17, `stat_type3` = 7, `stat_VALUE3` = 8, `stat_type4` = 0, `stat_VALUE4` = 0, `stat_type5` = 0, `stat_VALUE5` = 0, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 65, `holy_res` = 0, `fire_res` = 6, `nature_res` = 0, `frost_res` = 0, `shadow_res` = 8, `arcane_res` = 8, `spellid_1` = 9408, `spelltrigger_1` = 1, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 0, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16925;
UPDATE `item_template` SET `stat_type1` = 5, `stat_VALUE1` = 13, `stat_type2` = 6, `stat_VALUE2` = 23, `stat_type3` = 7, `stat_VALUE3` = 9, `stat_type4` = 0, `stat_VALUE4` = 0, `stat_type5` = 0, `stat_VALUE5` = 0, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 51, `holy_res` = 0, `fire_res` = 0, `nature_res` = 0, `frost_res` = 0, `shadow_res` = 0, `arcane_res` = 0, `spellid_1` = 0, `spelltrigger_1` = 0, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 0, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16926;
UPDATE `item_template` SET `stat_type1` = 5, `stat_VALUE1` = 13, `stat_type2` = 6, `stat_VALUE2` = 23, `stat_type3` = 7, `stat_VALUE3` = 15, `stat_type4` = 3, `stat_VALUE4` = 6, `stat_type5` = 0, `stat_VALUE5` = 0, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 80, `holy_res` = 0, `fire_res` = 0, `nature_res` = 0, `frost_res` = 0, `shadow_res` = 0, `arcane_res` = 0, `spellid_1` = 9328, `spelltrigger_1` = 1, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 0, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16919;
UPDATE `item_template` SET `stat_type1` = 5, `stat_VALUE1` = 27, `stat_type2` = 6, `stat_VALUE2` = 26, `stat_type3` = 7, `stat_VALUE3` = 17, `stat_type4` = 0, `stat_VALUE4` = 0, `stat_type5` = 0, `stat_VALUE5` = 0, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 94, `holy_res` = 0, `fire_res` = 12, `nature_res` = 12, `frost_res` = 0, `shadow_res` = 12, `arcane_res` = 12, `spellid_1` = 0, `spelltrigger_1` = 0, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 0, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16921;
UPDATE `item_template` SET `stat_type1` = 5, `stat_VALUE1` = 13, `stat_type2` = 6, `stat_VALUE2` = 25, `stat_type3` = 7, `stat_VALUE3` = 0, `stat_type4` = 0, `stat_VALUE4` = 0, `stat_type5` = 0, `stat_VALUE5` = 0, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 72, `holy_res` = 0, `fire_res` = 0, `nature_res` = 6, `frost_res` = 0, `shadow_res` = 0, `arcane_res` = 0, `spellid_1` = 9318, `spelltrigger_1` = 1, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 0, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16920;
UPDATE `item_template` SET `stat_type1` = 5, `stat_VALUE1` = 23, `stat_type2` = 6, `stat_VALUE2` = 31, `stat_type3` = 7, `stat_VALUE3` = 8, `stat_type4` = 0, `stat_VALUE4` = 0, `stat_type5` = 0, `stat_VALUE5` = 0, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 101, `holy_res` = 0, `fire_res` = 0, `nature_res` = 0, `frost_res` = 14, `shadow_res` = 0, `arcane_res` = 0, `spellid_1` = 18009, `spelltrigger_1` = 1, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 0, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16922;
UPDATE `item_template` SET `stat_type1` = 5, `stat_VALUE1` = 25, `stat_type2` = 6, `stat_VALUE2` = 13, `stat_type3` = 7, `stat_VALUE3` = 12, `stat_type4` = 3, `stat_VALUE4` = 4, `stat_type5` = 0, `stat_VALUE5` = 0, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 87, `holy_res` = 0, `fire_res` = 5, `nature_res` = 3, `frost_res` = 0, `shadow_res` = 0, `arcane_res` = 0, `spellid_1` = 9408, `spelltrigger_1` = 1, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 9414, `spelltrigger_2` = 1, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16924;
UPDATE `item_template` SET `stat_type1` = 5, `stat_VALUE1` = 27, `stat_type2` = 6, `stat_VALUE2` = 27, `stat_type3` = 7, `stat_VALUE3` = 17, `stat_type4` = 0, `stat_VALUE4` = 0, `stat_type5` = 0, `stat_VALUE5` = 0, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 116, `holy_res` = 0, `fire_res` = 0, `nature_res` = 0, `frost_res` = 0, `shadow_res` = 8, `arcane_res` = 8, `spellid_1` = 17371, `spelltrigger_1` = 1, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 0, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16923;
UPDATE `item_template` SET `stat_type1` = 3, `stat_VALUE1` = 15, `stat_type2` = 5, `stat_VALUE2` = 13, `stat_type3` = 6, `stat_VALUE3` = 11, `stat_type4` = 7, `stat_VALUE4` = 12, `stat_type5` = 0, `stat_VALUE5` = 0, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 271, `holy_res` = 0, `fire_res` = 0, `nature_res` = 0, `frost_res` = 0, `shadow_res` = 0, `arcane_res` = 0, `spellid_1` = 13670, `spelltrigger_1` = 1, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 0, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16936;
UPDATE `item_template` SET `stat_type1` = 3, `stat_VALUE1` = 21, `stat_type2` = 5, `stat_VALUE2` = 8, `stat_type3` = 6, `stat_VALUE3` = 6, `stat_type4` = 7, `stat_VALUE4` = 9, `stat_type5` = 0, `stat_VALUE5` = 0, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 211, `holy_res` = 9, `fire_res` = 0, `nature_res` = 0, `frost_res` = 0, `shadow_res` = 0, `arcane_res` = 0, `spellid_1` = 0, `spelltrigger_1` = 0, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 0, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16935;
UPDATE `item_template` SET `stat_type1` = 3, `stat_VALUE1` = 36, `stat_type2` = 5, `stat_VALUE2` = 16, `stat_type3` = 6, `stat_VALUE3` = 4, `stat_type4` = 7, `stat_VALUE4` = 23, `stat_type5` = 0, `stat_VALUE5` = 0, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 482, `holy_res` = 0, `fire_res` = 0, `nature_res` = 0, `frost_res` = 0, `shadow_res` = 3, `arcane_res` = 3, `spellid_1` = 15464, `spelltrigger_1` = 1, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 0, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16942;
UPDATE `item_template` SET `stat_type1` = 3, `stat_VALUE1` = 17, `stat_type2` = 5, `stat_VALUE2` = 0, `stat_type3` = 6, `stat_VALUE3` = 8, `stat_type4` = 7, `stat_VALUE4` = 20, `stat_type5` = 4, `stat_VALUE5` = 9, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 301, `holy_res` = 0, `fire_res` = 10, `nature_res` = 10, `frost_res` = 10, `shadow_res` = 3, `arcane_res` = 3, `spellid_1` = 0, `spelltrigger_1` = 0, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 0, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16940;
UPDATE `item_template` SET `stat_type1` = 3, `stat_VALUE1` = 25, `stat_type2` = 5, `stat_VALUE2` = 0, `stat_type3` = 6, `stat_VALUE3` = 12, `stat_type4` = 7, `stat_VALUE4` = 17, `stat_type5` = 0, `stat_VALUE5` = 0, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 332, `holy_res` = 0, `fire_res` = 0, `nature_res` = 0, `frost_res` = 0, `shadow_res` = 10, `arcane_res` = 10, `spellid_1` = 0, `spelltrigger_1` = 0, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 0, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16941;
UPDATE `item_template` SET `stat_type1` = 3, `stat_VALUE1` = 20, `stat_type2` = 5, `stat_VALUE2` = 21, `stat_type3` = 6, `stat_VALUE3` = 6, `stat_type4` = 7, `stat_VALUE4` = 21, `stat_type5` = 4, `stat_VALUE5` = 7, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 392, `holy_res` = 0, `fire_res` = 12, `nature_res` = 0, `frost_res` = 0, `shadow_res` = 11, `arcane_res` = 11, `spellid_1` = 7597, `spelltrigger_1` = 1, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 0, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16939;
UPDATE `item_template` SET `stat_type1` = 3, `stat_VALUE1` = 33, `stat_type2` = 5, `stat_VALUE2` = 11, `stat_type3` = 6, `stat_VALUE3` = 16, `stat_type4` = 7, `stat_VALUE4` = 23, `stat_type5` = 4, `stat_VALUE5` = 8, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 422, `holy_res` = 8, `fire_res` = 0, `nature_res` = 0, `frost_res` = 0, `shadow_res` = 0, `arcane_res` = 0, `spellid_1` = 0, `spelltrigger_1` = 0, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 0, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16938;
UPDATE `item_template` SET `stat_type1` = 3, `stat_VALUE1` = 23, `stat_type2` = 5, `stat_VALUE2` = 14, `stat_type3` = 6, `stat_VALUE3` = 8, `stat_type4` = 7, `stat_VALUE4` = 15, `stat_type5` = 0, `stat_VALUE5` = 0, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 362, `holy_res` = 0, `fire_res` = 0, `nature_res` = 9, `frost_res` = 8, `shadow_res` = 0, `arcane_res` = 0, `spellid_1` = 0, `spelltrigger_1` = 0, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 0, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16937;
UPDATE `item_template` SET `stat_type1` = 5, `stat_VALUE1` = 8, `stat_type2` = 6, `stat_VALUE2` = 6, `stat_type3` = 7, `stat_VALUE3` = 18, `stat_type4` = 0, `stat_VALUE4` = 0, `stat_type5` = 0, `stat_VALUE5` = 0, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 65, `holy_res` = 0, `fire_res` = 13, `nature_res` = 0, `frost_res` = 0, `shadow_res` = 10, `arcane_res` = 10, `spellid_1` = 13384, `spelltrigger_1` = 0, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 15715, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16933;
UPDATE `item_template` SET `stat_type1` = 5, `stat_VALUE1` = 13, `stat_type2` = 6, `stat_VALUE2` = 10, `stat_type3` = 7, `stat_VALUE3` = 25, `stat_type4` = 0, `stat_VALUE4` = 0, `stat_type5` = 0, `stat_VALUE5` = 0, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 80, `holy_res` = 0, `fire_res` = 10, `nature_res` = 0, `frost_res` = 0, `shadow_res` = 0, `arcane_res` = 0, `spellid_1` = 9346, `spelltrigger_1` = 1, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 0, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16927;
UPDATE `item_template` SET `stat_type1` = 5, `stat_VALUE1` = 11, `stat_type2` = 6, `stat_VALUE2` = 6, `stat_type3` = 7, `stat_VALUE3` = 21, `stat_type4` = 0, `stat_VALUE4` = 0, `stat_type5` = 0, `stat_VALUE5` = 0, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 51, `holy_res` = 0, `fire_res` = 0, `nature_res` = 0, `frost_res` = 0, `shadow_res` = 0, `arcane_res` = 0, `spellid_1` = 9344, `spelltrigger_1` = 1, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 0, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16934;
UPDATE `item_template` SET `stat_type1` = 5, `stat_VALUE1` = 11, `stat_type2` = 6, `stat_VALUE2` = 20, `stat_type3` = 7, `stat_VALUE3` = 13, `stat_type4` = 0, `stat_VALUE4` = 0, `stat_type5` = 0, `stat_VALUE5` = 0, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 72, `holy_res` = 3, `fire_res` = 0, `nature_res` = 12, `frost_res` = 0, `shadow_res` = 0, `arcane_res` = 0, `spellid_1` = 25065, `spelltrigger_1` = 1, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 0, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16928;
UPDATE `item_template` SET `stat_type1` = 5, `stat_VALUE1` = 11, `stat_type2` = 6, `stat_VALUE2` = 20, `stat_type3` = 7, `stat_VALUE3` = 13, `stat_type4` = 0, `stat_VALUE4` = 0, `stat_type5` = 0, `stat_VALUE5` = 0, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 72, `holy_res` = 3, `fire_res` = 0, `nature_res` = 12, `frost_res` = 0, `shadow_res` = 0, `arcane_res` = 0, `spellid_1` = 17868, `spelltrigger_1` = 1, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 0, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16928;
UPDATE `item_template` SET `stat_type1` = 5, `stat_VALUE1` = 17, `stat_type2` = 6, `stat_VALUE2` = 16, `stat_type3` = 7, `stat_VALUE3` = 27, `stat_type4` = 3, `stat_VALUE4` = 9, `stat_type5` = 0, `stat_VALUE5` = 0, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 101, `holy_res` = 0, `fire_res` = 10, `nature_res` = 0, `frost_res` = 3, `shadow_res` = 0, `arcane_res` = 0, `spellid_1` = 14798, `spelltrigger_1` = 1, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 0, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16930;
UPDATE `item_template` SET `stat_type1` = 5, `stat_VALUE1` = 23, `stat_type2` = 6, `stat_VALUE2` = 17, `stat_type3` = 7, `stat_VALUE3` = 27, `stat_type4` = 3, `stat_VALUE4` = 5, `stat_type5` = 0, `stat_VALUE5` = 0, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 116, `holy_res` = 0, `fire_res` = 3, `nature_res` = 0, `frost_res` = 0, `shadow_res` = 9, `arcane_res` = 9, `spellid_1` = 18009, `spelltrigger_1` = 1, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 0, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16931;
UPDATE `item_template` SET `stat_type1` = 5, `stat_VALUE1` = 18, `stat_type2` = 6, `stat_VALUE2` = 13, `stat_type3` = 7, `stat_VALUE3` = 27, `stat_type4` = 0, `stat_VALUE4` = 0, `stat_type5` = 0, `stat_VALUE5` = 0, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 94, `holy_res` = 0, `fire_res` = 0, `nature_res` = 0, `frost_res` = 10, `shadow_res` = 10, `arcane_res` = 10, `spellid_1` = 21599, `spelltrigger_1` = 1, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 14799, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16929;
UPDATE `item_template` SET `stat_type1` = 5, `stat_VALUE1` = 17, `stat_type2` = 6, `stat_VALUE2` = 8, `stat_type3` = 7, `stat_VALUE3` = 17, `stat_type4` = 3, `stat_VALUE4` = 6, `stat_type5` = 0, `stat_VALUE5` = 0, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 87, `holy_res` = 0, `fire_res` = 6, `nature_res` = 0, `frost_res` = 0, `shadow_res` = 0, `arcane_res` = 0, `spellid_1` = 0, `spelltrigger_1` = 0, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 0, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16932;
-- UPDATE wrong stats on currently existing 1.2 gear:
UPDATE `item_template` SET `stat_type1` = 7, `stat_VALUE1` = 23, `stat_type2` = 4, `stat_VALUE2` = 24, `stat_type3` = 6, `stat_VALUE3` = 7, `stat_type4` = 3, `stat_VALUE4` = 12, `stat_type5` = 0, `stat_VALUE5` = 0, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 655, `holy_res` = 0, `fire_res` = 0, `nature_res` = 0, `frost_res` = 0, `shadow_res` = 0, `arcane_res` = 0, `spellid_1` = 13665, `spelltrigger_1` = 1, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 0, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16867;
UPDATE `item_template` SET `stat_type1` = 7, `stat_VALUE1` = 23, `stat_type2` = 4, `stat_VALUE2` = 15, `stat_type3` = 6, `stat_VALUE3` = 5, `stat_type4` = 3, `stat_VALUE4` = 9, `stat_type5` = 0, `stat_VALUE5` = 0, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 515, `holy_res` = 0, `fire_res` = 0, `nature_res` = 0, `frost_res` = 7, `shadow_res` = 0, `arcane_res` = 0, `spellid_1` = 0, `spelltrigger_1` = 0, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 0, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16862;
UPDATE `item_template` SET `stat_type1` = 7, `stat_VALUE1` = 23, `stat_type2` = 4, `stat_VALUE2` = 15, `stat_type3` = 6, `stat_VALUE3` = 5, `stat_type4` = 3, `stat_VALUE4` = 4, `stat_type5` = 0, `stat_VALUE5` = 0, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 515, `holy_res` = 0, `fire_res` = 0, `nature_res` = 0, `frost_res` = 7, `shadow_res` = 0, `arcane_res` = 0, `spellid_1` = 0, `spelltrigger_1` = 0, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 0, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16862;
UPDATE `item_template` SET `stat_type1` = 3, `stat_VALUE1` = 15, `stat_type2` = 7, `stat_VALUE2` = 10, `stat_type3` = 6, `stat_VALUE3` = 3, `stat_type4` = 4, `stat_VALUE4` = 5, `stat_type5` = 0, `stat_VALUE5` = 0, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 264, `holy_res` = 0, `fire_res` = 0, `nature_res` = 0, `frost_res` = 0, `shadow_res` = 0, `arcane_res` = 0, `spellid_1` = 13670, `spelltrigger_1` = 1, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 0, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16852;
UPDATE `item_template` SET `stat_type1` = 5, `stat_VALUE1` = 10, `stat_type2` = 6, `stat_VALUE2` = 8, `stat_type3` = 7, `stat_VALUE3` = 7, `stat_type4` = 4, `stat_VALUE4` = 8, `stat_type5` = 3, `stat_VALUE5` = 7, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 185, `holy_res` = 0, `fire_res` = 5, `nature_res` = 0, `frost_res` = 0, `shadow_res` = 0, `arcane_res` = 0, `spellid_1` = 9407, `spelltrigger_1` = 1, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 0, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16840;
UPDATE `item_template` SET `stat_type1` = 5, `stat_VALUE1` = 23, `stat_type2` = 6, `stat_VALUE2` = 12, `stat_type3` = 7, `stat_VALUE3` = 20, `stat_type4` = 3, `stat_VALUE4` = 3, `stat_type5` = 0, `stat_VALUE5` = 0, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 343, `holy_res` = 3, `fire_res` = 0, `nature_res` = 3, `frost_res` = 7, `shadow_res` = 0, `arcane_res` = 0, `spellid_1` = 23481, `spelltrigger_1` = 1, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 9404, `spelltrigger_2` = 1, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16842;
UPDATE `item_template` SET `stat_type1` = 5, `stat_VALUE1` = 23, `stat_type2` = 6, `stat_VALUE2` = 20, `stat_type3` = 7, `stat_VALUE3` = 15, `stat_type4` = 4, `stat_VALUE4` = 10, `stat_type5` = 3, `stat_VALUE5` = 3, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 0, `dmg_max1` = 0, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 200, `holy_res` = 0, `fire_res` = 0, `nature_res` = 0, `frost_res` = 0, `shadow_res` = 0, `arcane_res` = 0, `spellid_1` = 18031, `spelltrigger_1` = 1, `spellcharges_1` = 0, `spellppmRate_1` = 0, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 0, `spelltrigger_2` = 0, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 16833;
-- "Thunderfury" stats (should be main hand until 1.12)
UPDATE item_template SET InventoryType = 21 WHERE entry = 19019;
-- Pre 1.4 Green Lens (Clank)
UPDATE item_template SET quality=2,stat_VALUE2=12,spellid_1=0,spelltrigger_1=0,spellid_2=0,spelltrigger_2=0 WHERE entry=11662;
UPDATE item_template SET quality=2,stat_VALUE1=5,armor=455 WHERE entry=11703;
UPDATE item_template SET stat_type1=6,stat_VALUE1=16,stat_type2=3,stat_VALUE2=7,spellid_1=0,spelltrigger_1=0,spellid_2=0,spelltrigger_2=0 WHERE entry=13178;  
-- Pre 1.4 Weapon speed fix
UPDATE item_template SET delay=2700 WHERE entry=13204;
UPDATE item_template SET delay=2900 WHERE entry=12400;
UPDATE item_template SET delay=2300 WHERE entry=12592;
UPDATE item_template SET delay=3300 WHERE entry=12969;
UPDATE item_template SET delay=2300 WHERE entry=13163;
UPDATE item_template SET delay=2300 WHERE entry=13348;
UPDATE item_template SET delay=3400 WHERE entry=13372;
UPDATE item_template SET delay=2400 WHERE entry=13380;
UPDATE item_template SET delay=2800 WHERE entry=13505;
UPDATE item_template SET delay=1900 WHERE entry=17069;
UPDATE item_template SET delay=2500 WHERE entry=17072;
UPDATE item_template SET delay=1800 WHERE entry=18044;
-- Pre 1.4 Mount FIX
UPDATE item_template SET name="Reins of the Ancient Frostsaber" WHERE entry=12302;
-- Pre-1.04 STATS CHANGED: Shadowcraft Boots (ilevel 59 entry 16711).
UPDATE item_template SET `stat_VALUE1`=21, `stat_type3`=0, `stat_VALUE3`=0 WHERE entry=16711;
-- Vis'kag the Bloodletter -- Source: http://web.archive.org/web/20050303064400/http://wow.allakhazam.com/dyn/items/wname7.html
UPDATE item_template SET RequiredLevel=58, dmg_min1=89, dmg_max1=167, delay=2800 WHERE entry=17075;
UPDATE item_template SET bonding=1 WHERE entry IN (14512,14513,14514);
-- Pre-1.4 item_template Fixes
-- 2005-03-23 20:06:16 to 2006-06-27 04:03:58 (days delta 11412) on for example: http://wow.allakhazam.com/db/item.html?witem=18441
-- 2005-03-23 20:06:07 to 2005-08-24 02:07:40 (days delta 156) on for example: http://wow.allakhazam.com/db/item.html?witem=18440
-- 2005-02-07 00:23:15 to 2005-02-17 08:58:41 (days delta 10) on for example: http://wow.allakhazam.com/dyn/items/iname16.html
UPDATE item_template SET `stat_VALUE1`=17, `stat_type2`=0, `stat_VALUE2`=0, `armor`=115 WHERE entry=16342;
-- 2005-03-31 16:24:25 to 2006-03-30 19:19:31 (days delta 11314) on for example: http://www.thottbot.com/?i=17146
-- 2005-02-15 11:03:31 to 2005-03-10 08:25:19 (days delta 26) on for example: http://www.thottbot.com/?i=The%20Postmaster%27s%20Seal
UPDATE item_template SET `stat_VALUE1`=15, `stat_type2`=3, `stat_VALUE2`=6, `stat_VALUE3`=14, `stat_type4`=6, `stat_VALUE4`=6 WHERE entry=13391;
-- STATS CHANGED: Shadowcraft Boots (ilevel 59 entry 16711).
UPDATE item_template SET `stat_VALUE1`=3, `stat_type3`=0, `stat_VALUE3`=0 WHERE entry=16711;
-- T1 gear FIX STATS CHANGED: Felheart Horns (ilevel 66 entry 16808). 1/1 versions
UPDATE item_template SET `stat_VALUE1`=23, `stat_VALUE2`=16, `stat_VALUE3`=20, `stat_type4`=3, `stat_VALUE4`=5, `arcane_res`=3, `fire_res`=0, `shadow_res`=10 WHERE entry=16808;
-- T2 FIX STATS CHANGED: Legplates of Ten Storms (ilevel 76 entry 16946). 3/3 versions
-- 2005-02-22 02:38:41 to 2005-06-08 01:11:28 (days delta 110) on for example: http://wow.allakhazam.com/dyn/items/iname7.html
-- 2005-02-23 12:24:14 to 2005-05-26 05:47:02 (days delta 96) on for example: http://wow.allakhazam.com/db/item.html?witem=16946
-- 2005-02-07 02:36:28 to 2005-02-15 11:03:16 (days delta 8) on for example: http://wow.allakhazam.com/db/itemSET.html?SETid=216
UPDATE item_template SET `stat_VALUE1`=12, `stat_VALUE2`=33, `stat_VALUE3`=15, `stat_type4`=4, `stat_VALUE4`=16, `stat_type5`=3, `stat_VALUE5`=8, `armor`=364, `fire_res`=0, `arcane_res`=6 WHERE entry=16946;
-- STATS CHANGED: Helmet of Ten Storms (ilevel 76 entry 16947). 2/3 versions
-- 2005-02-17 23:21:51 to 2005-05-07 20:56:35 (days delta 83) on for example: http://wow.allakhazam.com/db/item.html?witem=16947
-- 2005-01-16 02:23:48 to 2005-02-15 11:02:56 (days delta 30) on for example: http://wow.allakhazam.com/dyn/items/iname1.html
-- 2005-02-07 02:36:28 to 2005-02-07 02:36:28 (days delta 0) on for example: http://wow.allakhazam.com/db/itemSET.html?SETid=216
UPDATE item_template SET `stat_VALUE1`=23, `stat_VALUE2`=17, `stat_VALUE3`=16, `armor`=338, `fire_res`=8, `frost_res`=0, `shadow_res`=0, `nature_res`=8 WHERE entry=16947;
-- Custom modifications:
-- Source: http://web.archive.org/web/20041013032425/http://wow.allakhazam.com/db/item.html?witem=12554
UPDATE item_template SET armor=88, spellid_1=25067, spelltrigger_1=1, spellcooldown_1=-1, spellcategorycooldown_1=-1 WHERE entry=12554;
-- Source: http://web.archive.org/web/20050206224450/http://wow.allakhazam.com/db/itemSET.html?SETid=124
UPDATE item_template SET stat_type1='4', stat_VALUE1='15', stat_type2='3', stat_VALUE2='14', stat_type3='6', stat_VALUE3='14' WHERE entry='14623';
UPDATE item_template SET stat_type1='4', stat_VALUE1='15', stat_type2='7', stat_VALUE2='8', stat_type3='6', stat_VALUE3='5' WHERE entry='14622';
UPDATE item_template SET stat_type1='4', stat_VALUE1='15', stat_type2='7', stat_VALUE2='8', stat_type3='3', stat_VALUE3='5' WHERE entry='14620';
UPDATE item_template SET stat_type1='7', stat_VALUE1='12', stat_type2='6', stat_VALUE2='10', stat_type3='3', stat_VALUE3='10' WHERE entry='14622';
-- "Bonereaver's Edge" Stats Has Been Corrected
UPDATE `item_template` SET `stat_type1` = 0, `stat_VALUE1` = 0, `stat_type2` = 0, `stat_VALUE2` = 0, `stat_type3` = 0, `stat_VALUE3` = 0, `stat_type4` = 0, `stat_VALUE4` = 0, `stat_type5` = 0, `stat_VALUE5` = 0, `stat_type6` = 0, `stat_VALUE6` = 0, `stat_type7` = 0, `stat_VALUE7` = 0, `stat_type8` = 0, `stat_VALUE8` = 0, `stat_type9` = 0, `stat_VALUE9` = 0, `stat_type10` = 0, `stat_VALUE10` = 0, `dmg_min1` = 206, `dmg_max1` = 310, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 0, `holy_res` = 0, `fire_res` = 0, `nature_res` = 0, `frost_res` = 0, `shadow_res` = 0, `arcane_res` = 0, `spellid_1` = 21153, `spelltrigger_1` = 2, `spellcharges_1` = 0, `spellppmRate_1` = 3, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 7597, `spelltrigger_2` = 1, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 17076;
-- Flarecore Gloves are Soulbound https://github.com/elysium-project/itemization/issues/13
UPDATE `item_template` SET `bonding` = 1 WHERE `entry` = 16979;
-- SETting "Dreamscale Breastplate" to BoP (should be shanged back in patch 1.10)
UPDATE `item_template` SET `bonding` = 1 WHERE `entry` = 20380;
-- Nerfed PvP Weapons
REPLACE INTO `item_template` VALUE (18877,2,8,'High Warlord\'s Greatsword',31998,4,32768,1,301699,60339,17,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,36,4,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,196,295,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3800,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,1,1,0,0,0,120,0,0,0,'',0,0,0,0,0,0,1),(18873,2,10,'Grand Marshal\'s Stave',31764,4,32768,1,297299,59459,17,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,36,5,20,6,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,125,203,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3000,0,0,17493,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,2,2,0,0,0,120,0,0,0,'',0,0,0,0,0,0,1),(18871,2,6,'High Warlord\'s Pig Sticker',31766,4,32768,1,295085,59017,17,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,36,4,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,196,295,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3800,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,1,2,0,0,0,120,0,0,0,'',0,0,0,0,0,0,1),(18869,2,6,'Grand Marshal\'s Glaive',31761,4,32768,1,284969,56993,17,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,36,4,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,196,295,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3800,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,1,2,0,0,0,120,0,0,0,'',0,0,0,0,0,0,1),(18868,2,5,'High Warlord\'s Pulverizer',31750,4,32768,1,313819,62763,17,-1,-1,78,60,0,0,199,18,0,0,0,0,1,0,7,36,4,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,196,295,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3800,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,2,1,0,0,0,120,0,0,0,'',0,0,0,0,0,0,1),(18866,2,4,'High Warlord\'s Bludgeon',31751,4,32768,1,249308,49861,13,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,115,173,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2900,0,0,7597,1,0,0,-1,0,-1,9141,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,2,3,0,0,0,105,0,0,0,'',0,0,0,0,0,0,1),(18860,2,3,'High Warlord\'s Street Sweeper',31747,4,32768,1,183012,36602,26,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,90,135,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2900,3,100,21436,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,-1,1,'',0,0,0,0,0,1,0,0,0,0,90,0,0,0,'',0,0,0,0,0,0,1),(18833,2,2,'Grand Marshal\'s Bullseye',31759,4,32768,1,173657,34731,15,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,55,84,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1800,2,100,21436,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,-1,1,'',0,0,0,0,0,2,0,0,0,0,90,0,0,0,'',0,0,0,0,0,0,1),(18855,2,3,'Grand Marshal\'s Hand Cannon',31758,4,32768,1,179726,35945,26,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,90,135,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2900,3,100,21436,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,-1,1,'',0,0,0,0,0,1,0,0,0,0,90,0,0,0,'',0,0,0,0,0,0,1),(18847,2,13,'Grand Marshal\'s Left Hand Blade',32032,4,32768,1,250218,50043,22,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,115,173,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2900,0,0,7597,1,0,0,-1,0,-1,9141,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,1,7,0,0,0,75,0,0,0,'',0,0,0,0,0,0,1),(18840,2,15,'High Warlord\'s Razor',31381,4,32768,1,244064,48812,13,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,79,120,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2000,0,0,7597,1,0,0,-1,0,-1,9141,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,1,3,0,0,0,75,0,0,0,'',0,0,0,0,0,0,1),(18838,2,15,'Grand Marshal\'s Dirk',31379,4,32768,1,242293,48458,13,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,79,120,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2000,0,0,7597,1,0,0,-1,0,-1,9141,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,1,3,0,0,0,75,0,0,0,'',0,0,0,0,0,0,1),(18837,2,18,'High Warlord\'s Crossbow',31749,4,32768,1,176297,35259,26,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,90,135,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2900,2,100,21436,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,-1,1,'',0,0,0,0,0,2,0,0,0,0,90,0,0,0,'',0,0,0,0,0,0,1),(18836,2,18,'Grand Marshal\'s Repeater',31757,4,32768,1,175650,35130,26,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,90,135,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2900,2,100,21436,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,-1,1,'',0,0,0,0,0,2,0,0,0,0,90,0,0,0,'',0,0,0,0,0,0,1),(18835,2,2,'High Warlord\'s Recurve',31748,4,32768,1,174986,34997,15,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,55,84,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1800,2,100,21436,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,-1,1,'',0,0,0,0,0,2,0,0,0,0,90,0,0,0,'',0,0,0,0,0,0,1),(18848,2,13,'High Warlord\'s Left Claw',31752,4,32768,1,251079,50215,22,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,115,173,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2900,0,0,7597,1,0,0,-1,0,-1,9141,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,1,7,0,0,0,75,0,0,0,'',0,0,0,0,0,0,1),(18831,2,1,'High Warlord\'s Battle Axe',31958,4,32768,1,287244,57448,17,-1,-1,78,60,0,0,197,18,0,0,0,0,1,0,7,36,4,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,196,295,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3800,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,1,1,0,0,0,120,0,0,0,'',0,0,0,0,0,0,1),(18830,2,1,'Grand Marshal\'s Sunderer',31302,4,32768,1,286137,57227,17,-1,-1,78,60,0,0,197,18,0,0,0,0,1,0,7,36,4,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,196,295,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3800,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,1,1,0,0,0,120,0,0,0,'',0,0,0,0,0,0,1),(18828,2,0,'High Warlord\'s Cleaver',31957,4,32768,1,251127,50225,13,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,115,173,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2900,0,0,7597,1,0,0,-1,0,-1,9141,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,1,3,0,0,0,105,0,0,0,'',0,0,0,0,0,0,1),(16345,2,7,'High Warlord\'s Blade',31997,4,32768,1,247416,49483,13,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,115,173,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2900,0,0,7597,1,0,0,-1,0,-1,9141,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,1,3,0,0,0,105,0,0,0,'',0,0,0,0,0,0,1),(18827,2,0,'Grand Marshal\'s Handaxe',31956,4,32768,1,250241,50048,13,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,115,173,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2900,0,0,7597,1,0,0,-1,0,-1,9141,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,1,3,0,0,0,105,0,0,0,'',0,0,0,0,0,0,1),(18843,2,13,'Grand Marshal\'s Right Hand Blade',32033,4,32768,1,246698,49339,21,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,115,173,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2900,0,0,7597,1,0,0,-1,0,-1,9141,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,1,7,0,0,0,75,0,0,0,'',0,0,0,0,0,0,1),(18865,2,4,'Grand Marshal\'s Punisher',31955,4,32768,1,248422,49684,13,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,115,173,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2900,0,0,7597,1,0,0,-1,0,-1,9141,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,2,3,0,0,0,105,0,0,0,'',0,0,0,0,0,0,1),(18867,2,5,'Grand Marshal\'s Battle Hammer',31954,4,32768,1,312712,62542,17,-1,-1,78,60,0,0,199,18,0,0,0,0,1,0,7,36,4,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,196,295,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3800,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,2,1,0,0,0,120,0,0,0,'',0,0,0,0,0,0,1),(18876,2,8,'Grand Marshal\'s Claymore',31996,4,32768,1,300592,60118,17,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,36,4,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,196,295,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3800,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,1,1,0,0,0,120,0,0,0,'',0,0,0,0,0,0,1),(18874,2,10,'High Warlord\'s War Staff',31765,4,32768,1,298407,59681,17,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,36,5,20,6,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,125,203,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3000,0,0,17493,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,2,2,0,0,0,120,0,0,0,'',0,0,0,0,0,0,1),(12584,2,7,'Grand Marshal\'s Longsword',31966,4,32768,1,248182,49636,13,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,115,173,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2900,0,0,7597,1,0,0,-1,0,-1,9141,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,1,3,0,0,0,105,0,0,0,'',0,0,0,0,0,0,1),(18844,2,13,'High Warlord\'s Right Claw',31754,4,32768,1,247584,49516,21,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,115,173,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2900,0,0,7597,1,0,0,-1,0,-1,9141,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,1,7,0,0,0,75,0,0,0,'',0,0,0,0,0,0,1);
-- Nerfed PvP Gear
REPLACE INTO `item_template` VALUE (15197,4,0,'Scout\'s Tabard',31255,1,0,1,10000,2500,19,-1,-1,20,0,0,0,0,5,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(15200,4,0,'Senior Sergeant\'s Insignia',30797,3,32768,1,20000,5000,2,-1,-1,35,30,0,0,0,8,0,0,0,1,1,0,7,4,6,4,5,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(16341,4,1,'Sergeant\'s Cloak',27088,3,32768,1,21425,4285,16,-1,-1,50,45,0,0,0,7,0,0,0,1,1,0,7,14,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,96,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(16342,4,1,'Sergeant\'s Cape',27087,3,32768,1,44154,8830,16,-1,-1,63,58,0,0,0,7,0,0,0,1,1,0,7,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,115,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(16486,4,1,'First Sergeant\'s Silk Cuffs',27255,3,32768,1,28477,5695,9,400,-1,63,58,0,0,0,9,0,0,0,1,1,0,7,17,5,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,39,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,0,30,0,0,0,'',0,0,0,0,0,0,1),(16497,4,2,'First Sergeant\'s Leather Armguards',30801,3,32768,1,34402,6880,9,8,-1,63,58,0,0,0,9,0,0,0,1,1,0,7,17,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,77,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,0,35,0,0,0,'',0,0,0,0,0,0,1),(16532,4,3,'First Sergeant\'s Mail Wristguards',27277,3,32768,1,44802,8960,9,68,-1,63,58,0,0,0,9,0,0,0,1,1,0,7,17,5,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,162,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,0,40,0,0,0,'',0,0,0,0,0,0,1),(18429,4,4,'First Sergeant\'s Plate Bracers',27273,3,32768,1,29447,5889,9,1,-1,63,58,0,0,0,9,0,0,0,1,1,0,7,17,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,287,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,0,45,0,0,0,'',0,0,0,0,0,0,1),(18434,4,2,'First Sergeant\'s Dragonhide Armguards',27262,3,32768,1,37468,7493,9,1024,-1,63,58,0,0,0,9,0,0,0,1,1,0,7,17,5,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,77,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,0,35,0,0,0,'',0,0,0,0,0,0,1),(18435,4,2,'First Sergeant\'s Leather Armguards',30801,3,32768,1,18311,3662,9,8,-1,50,45,0,0,0,9,0,0,0,1,1,0,7,14,3,0,5,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,0,35,0,0,0,'',0,0,0,0,0,0,1),(18440,4,1,'Sergeant\'s Cape',27087,3,32768,1,6443,1288,16,-1,-1,35,30,0,0,0,7,0,0,0,1,1,0,7,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,66,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18441,4,1,'Sergeant\'s Cape',27087,3,32768,1,20891,4178,16,-1,-1,50,45,0,0,0,7,0,0,0,1,1,0,7,14,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,96,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18442,4,0,'Master Sergeant\'s Insignia',30799,3,32768,1,20000,5000,2,-1,-1,35,30,0,0,0,8,0,0,0,1,1,0,7,9,6,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18443,4,0,'Master Sergeant\'s Insignia',30799,3,32768,1,40000,10000,2,-1,-1,63,58,0,0,0,8,0,0,0,1,1,0,7,17,6,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18444,4,0,'Master Sergeant\'s Insignia',30799,3,32768,1,30000,7500,2,-1,-1,50,45,0,0,0,8,0,0,0,1,1,0,7,14,6,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18445,4,4,'Sergeant Major\'s Plate Wristguards',27223,3,32768,1,29021,5804,9,3,-1,63,58,0,0,0,9,0,0,0,1,1,0,7,17,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,287,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,0,45,0,0,0,'',0,0,0,0,0,0,1),(18447,4,4,'Sergeant Major\'s Plate Wristguards',27223,3,32768,1,14235,2847,9,3,-1,50,45,0,0,0,9,0,0,0,1,1,0,7,14,4,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,231,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,0,45,0,0,0,'',0,0,0,0,0,0,1),(18449,4,3,'Sergeant Major\'s Chain Armguards',31248,3,32768,1,21507,4301,9,4,-1,50,45,0,0,0,9,0,0,0,1,1,0,7,14,5,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,131,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,0,40,0,0,0,'',0,0,0,0,0,0,1),(18453,4,2,'Sergeant Major\'s Leather Armsplints',30804,3,32768,1,16890,3378,9,8,-1,50,45,0,0,0,9,0,0,0,1,1,0,7,14,3,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,0,35,0,0,0,'',0,0,0,0,0,0,1),(18455,4,2,'Sergeant Major\'s Dragonhide Armsplints',30805,3,32768,1,17020,3404,9,1024,-1,50,45,0,0,0,9,0,0,0,1,1,0,7,14,5,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,0,35,0,0,0,'',0,0,0,0,0,0,1),(18456,4,1,'Sergeant Major\'s Silk Cuffs',30806,3,32768,1,28065,5613,9,400,-1,63,58,0,0,0,9,0,0,0,1,1,0,7,18,5,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,39,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,0,30,0,0,0,'',0,0,0,0,0,0,1),(18457,4,1,'Sergeant Major\'s Silk Cuffs',30806,3,32768,1,13373,2674,9,400,-1,50,45,0,0,0,9,0,0,0,1,1,0,7,14,5,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,31,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,0,30,0,0,0,'',0,0,0,0,0,0,1),(18461,4,1,'Sergeant\'s Cloak',27088,3,32768,1,42888,8577,16,-1,-1,63,58,0,0,0,7,0,0,0,1,1,0,7,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,115,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(22859,4,1,'Blood Guard\'s Satin Walkers',31027,3,32768,1,47684,9536,8,16,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,17,5,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,9343,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,540,40,0,0,0,'',0,0,0,0,0,0,1),(16496,4,2,'Blood Guard\'s Dragonhide Gauntlets',27265,3,32768,1,34268,6853,10,1024,-1,63,58,0,0,0,11,0,0,0,1,1,0,4,12,3,12,7,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,110,0,0,0,0,0,0,0,0,0,23217,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,382,35,0,0,0,'',0,0,0,0,0,0,1),(23305,4,1,'Knight-Captain\'s Silk Tunic',36024,3,32768,1,76291,15258,20,128,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,18,5,17,6,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,156,0,0,0,0,0,0,0,0,0,18384,1,0,0,-1,0,-1,14248,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,546,80,0,0,0,'',0,0,0,0,0,0,1),(23304,4,1,'Knight-Captain\'s Silk Legguards',36022,3,32768,1,76019,15203,7,128,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,18,5,17,6,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,144,0,0,0,0,0,0,0,0,0,14248,1,0,0,-1,0,-1,18384,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,546,65,0,0,0,'',0,0,0,0,0,0,1),(23317,4,1,'Lieutenant Commander\'s Satin Mantle',36038,3,32768,1,64355,12871,3,16,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,14,5,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,115,0,0,0,0,0,0,0,0,0,9345,1,0,0,-1,0,-1,21626,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,549,50,0,0,0,'',0,0,0,0,0,0,1),(23316,4,1,'Lieutenant Commander\'s Satin Hood',36042,3,32768,1,64119,12823,1,16,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,20,5,18,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,131,0,0,0,0,0,0,0,0,0,14248,1,0,0,-1,0,-1,21626,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,549,50,0,0,0,'',0,0,0,0,0,0,1),(23315,4,4,'Lieutenant Commander\'s Plate Shoulders',35811,3,32768,1,63883,12776,3,1,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,18,4,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,552,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,545,80,0,0,0,'',0,0,0,0,0,0,1),(23314,4,4,'Lieutenant Commander\'s Plate Helm',35810,3,32768,1,63647,12729,1,1,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,24,4,21,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,598,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,545,80,0,0,0,'',0,0,0,0,0,0,1),(23313,4,2,'Lieutenant Commander\'s Leather Shoulders',36044,3,32768,1,79271,15854,3,8,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,196,0,0,0,0,0,0,0,0,0,9332,1,0,0,-1,0,-1,7597,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,548,60,0,0,0,'',0,0,0,0,0,0,1),(23312,4,2,'Lieutenant Commander\'s Leather Helm',36043,3,32768,1,78976,15795,1,8,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,23,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,238,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,14089,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,548,60,0,0,0,'',0,0,0,0,0,0,1),(23311,4,1,'Lieutenant Commander\'s Dreadweave Spaulders',36027,3,32768,1,62945,12589,3,256,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,17,5,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0,0,0,9417,1,0,0,-1,0,-1,18384,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,547,50,0,0,0,'',0,0,0,0,0,0,1),(23310,4,1,'Lieutenant Commander\'s Dreadweave Cowl',36040,3,32768,1,62709,12541,1,256,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,21,5,18,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,81,0,0,0,0,0,0,0,0,0,14248,1,0,0,-1,0,-1,18384,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,547,50,0,0,0,'',0,0,0,0,0,0,1),(23308,4,2,'Lieutenant Commander\'s Dragonhide Headguard',35806,3,32768,1,77804,15560,1,1024,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,16,3,12,4,16,5,16,6,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,198,0,0,0,0,0,0,0,0,0,9346,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,551,60,0,0,0,'',0,0,0,0,0,0,1),(23290,4,1,'Knight-Lieutenant\'s Silk Handwraps',36013,3,32768,1,32762,6552,10,128,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,12,5,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,98,0,0,0,0,0,0,0,0,0,23037,1,0,0,-1,0,-1,9346,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,546,30,0,0,0,'',0,0,0,0,0,0,1),(23303,4,1,'Knight-Captain\'s Satin Tunic',36021,3,32768,1,75747,15149,20,16,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,19,5,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,156,0,0,0,0,0,0,0,0,0,14248,1,0,0,-1,0,-1,21626,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,549,80,0,0,0,'',0,0,0,0,0,0,1),(23302,4,1,'Knight-Captain\'s Satin Legguards',36018,3,32768,1,75483,15096,7,16,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,19,5,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,144,0,0,0,0,0,0,0,0,0,14248,1,0,0,-1,0,-1,21626,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,549,65,0,0,0,'',0,0,0,0,0,0,1),(23301,4,4,'Knight-Captain\'s Plate Leggings',35809,3,32768,1,75211,15042,7,1,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,17,4,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,618,0,0,0,0,0,0,0,0,0,7598,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,545,100,0,0,0,'',0,0,0,0,0,0,1),(23300,4,4,'Knight-Captain\'s Plate Hauberk',31083,3,32768,1,74939,14987,5,1,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,23,4,21,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,706,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,545,135,0,0,0,'',0,0,0,0,0,0,1),(23299,4,2,'Knight-Captain\'s Leather Legguards',36014,3,32768,1,93334,18666,7,8,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,22,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,225,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,15806,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,548,75,0,0,0,'',0,0,0,0,0,0,1),(23298,4,2,'Knight-Captain\'s Leather Chestpiece',36015,3,32768,1,93003,18600,5,8,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,22,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,248,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,15806,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,548,100,0,0,0,'',0,0,0,0,0,0,1),(23297,4,1,'Knight-Captain\'s Dreadweave Tunic',36017,3,32768,1,74130,14826,20,256,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,20,5,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,96,0,0,0,0,0,0,0,0,0,15715,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,547,80,0,0,0,'',0,0,0,0,0,0,1),(23296,4,1,'Knight-Captain\'s Dreadweave Legguards',30385,3,32768,1,73859,14771,7,256,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,21,5,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,84,0,0,0,0,0,0,0,0,0,14127,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,547,65,0,0,0,'',0,0,0,0,0,0,1),(23294,4,2,'Knight-Captain\'s Dragonhide Chestpiece',35805,3,32768,1,91653,18330,5,1024,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,13,4,13,3,12,5,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,218,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,9344,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,551,100,0,0,0,'',0,0,0,0,0,0,1),(23280,4,2,'Knight-Lieutenant\'s Dragonhide Grips',36003,3,32768,1,42486,8497,10,1024,-1,66,60,0,0,0,11,0,0,0,1,1,0,4,13,3,10,7,12,5,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,115,0,0,0,0,0,0,0,0,0,23217,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,551,35,0,0,0,'',0,0,0,0,0,0,1),(23293,4,3,'Knight-Captain\'s Chain Legguards',35800,3,32768,1,109575,21915,7,4,-1,68,60,0,0,0,12,0,0,0,1,1,0,3,16,7,13,5,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,348,0,0,0,0,0,0,0,0,0,7598,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,550,90,0,0,0,'',0,0,0,0,0,0,1),(23292,4,3,'Knight-Captain\'s Chain Hauberk',35799,3,32768,1,109168,21833,5,4,-1,68,60,0,0,0,12,0,0,0,1,1,0,3,16,7,13,5,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,398,0,0,0,0,0,0,0,0,0,7598,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,550,120,0,0,0,'',0,0,0,0,0,0,1),(23319,4,1,'Lieutenant Commander\'s Silk Mantle',27231,3,32768,1,64821,12964,3,128,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,14,5,11,6,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,135,0,0,0,0,0,0,0,0,0,9344,1,0,0,-1,0,-1,18384,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,546,50,0,0,0,'',0,0,0,0,0,0,1),(23318,4,1,'Lieutenant Commander\'s Silk Cowl',36041,3,32768,1,64585,12917,1,128,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,19,5,18,6,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,141,0,0,0,0,0,0,0,0,0,18384,1,0,0,-1,0,-1,14248,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,546,50,0,0,0,'',0,0,0,0,0,0,1),(23289,4,1,'Knight-Lieutenant\'s Satin Walkers',36008,3,32768,1,47634,9526,8,16,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,17,5,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,9343,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,549,40,0,0,0,'',0,0,0,0,0,0,1),(23288,4,1,'Knight-Lieutenant\'s Satin Handwraps',36010,3,32768,1,34969,6993,10,16,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,12,5,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,98,0,0,0,0,0,0,0,0,0,23043,1,0,0,-1,0,-1,14248,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,549,30,0,0,0,'',0,0,0,0,0,0,1),(23287,4,4,'Knight-Lieutenant\'s Plate Greaves',26752,3,32768,1,52274,10454,8,1,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,23,4,10,3,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,472,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,545,65,0,0,0,'',0,0,0,0,0,0,1),(23286,4,4,'Knight-Lieutenant\'s Plate Gauntlets',35808,3,32768,1,34726,6945,10,1,-1,66,60,0,0,0,11,0,0,0,1,1,0,4,17,7,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,429,0,0,0,0,0,0,0,0,0,22778,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,545,45,0,0,0,'',0,0,0,0,0,0,1),(23285,4,2,'Knight-Lieutenant\'s Leather Walkers',31068,3,32768,1,64880,12976,8,8,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,18,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,166,0,0,0,0,0,0,0,0,0,23049,1,0,0,-1,0,-1,9335,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,548,50,0,0,0,'',0,0,0,0,0,0,1),(23284,4,2,'Knight-Lieutenant\'s Leather Grips',31075,3,32768,1,43099,8619,10,8,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,18,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,155,0,0,0,0,0,0,0,0,0,9331,1,0,0,-1,0,-1,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,548,35,0,0,0,'',0,0,0,0,0,0,1),(23283,4,1,'Knight-Lieutenant\'s Dreadweave Walkers',36007,3,32768,1,51539,10307,8,256,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,17,5,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,9346,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,547,40,0,0,0,'',0,0,0,0,0,0,1),(23282,4,1,'Knight-Lieutenant\'s Dreadweave Handwraps',31060,3,32768,1,34236,6847,10,256,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,14,5,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,58,0,0,0,0,0,0,0,0,0,23046,1,0,0,-1,0,-1,14248,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,547,30,0,0,0,'',0,0,0,0,0,0,1),(23295,4,2,'Knight-Captain\'s Dragonhide Leggings',27235,3,32768,1,91983,18396,7,1024,-1,68,60,0,0,0,12,0,0,0,1,1,0,4,12,3,12,7,12,6,5,5,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,215,0,0,0,0,0,0,0,0,0,18384,1,0,0,-1,0,-1,9343,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,551,75,0,0,0,'',0,0,0,0,0,0,1),(23281,4,2,'Knight-Lieutenant\'s Dragonhide Treads',36004,3,32768,1,63961,12792,8,1024,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,13,4,13,5,6,3,6,6,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,126,0,0,0,0,0,0,0,0,0,9343,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,551,50,0,0,0,'',0,0,0,0,0,0,1),(23279,4,3,'Knight-Lieutenant\'s Chain Vices',35798,3,32768,1,50804,10160,10,4,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,16,3,18,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,242,0,0,0,0,0,0,0,0,0,28539,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,550,40,0,0,0,'',0,0,0,0,0,0,1),(23278,4,3,'Knight-Lieutenant\'s Chain Greaves',36006,3,32768,1,76266,15253,8,4,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,19,3,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,266,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,550,60,0,0,0,'',0,0,0,0,0,0,1),(23277,4,4,'Lieutenant Commander\'s Lamellar Shoulders',31085,3,32768,1,64368,12873,3,2,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,14,4,14,5,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,552,0,0,0,0,0,0,0,0,0,14799,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,544,80,0,0,0,'',0,0,0,0,0,0,1),(23276,4,4,'Lieutenant Commander\'s Lamellar Headguard',30316,3,32768,1,64132,12826,1,2,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,19,4,18,5,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,598,0,0,0,0,0,0,0,0,0,18049,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,544,80,0,0,0,'',0,0,0,0,0,0,1),(23274,4,4,'Knight-Lieutenant\'s Lamellar Gauntlets',30321,3,32768,1,33256,6651,10,2,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,13,4,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,429,0,0,0,0,0,0,0,0,0,23300,1,0,0,-1,0,-1,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,544,45,0,0,0,'',0,0,0,0,0,0,1),(23273,4,4,'Knight-Captain\'s Lamellar Leggings',31084,3,32768,1,71110,14222,7,2,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,17,4,18,5,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,618,0,0,0,0,0,0,0,0,0,15715,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,544,100,0,0,0,'',0,0,0,0,0,0,1),(23272,4,4,'Knight-Captain\'s Lamellar Breastplate',30315,3,32768,1,70845,14169,5,2,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,18,4,17,5,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,706,0,0,0,0,0,0,0,0,0,15715,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,544,135,0,0,0,'',0,0,0,0,0,0,1),(23263,4,1,'Champion\'s Silk Cowl',31099,3,0,1,65784,13156,1,128,511,71,60,0,0,0,14,0,0,0,1,1,0,7,19,5,18,6,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,141,0,0,0,0,0,0,0,0,0,18384,1,0,0,-1,0,-1,14248,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,542,50,0,0,0,'',0,0,0,0,0,0,1),(23264,4,1,'Champion\'s Silk Mantle',31100,3,0,1,66020,13204,3,128,511,71,60,0,0,0,14,0,0,0,1,1,0,7,14,5,11,6,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,135,0,0,0,0,0,0,0,0,0,9344,1,0,0,-1,0,-1,18384,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,542,50,0,0,0,'',0,0,0,0,0,0,1),(23262,4,1,'Champion\'s Satin Mantle',31031,3,32768,1,65548,13109,3,16,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,14,5,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,115,0,0,0,0,0,0,0,0,0,9345,1,0,0,-1,0,-1,21626,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,540,50,0,0,0,'',0,0,0,0,0,0,1),(23261,4,1,'Champion\'s Satin Hood',31030,3,32768,1,65312,13062,1,16,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,20,5,18,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,131,0,0,0,0,0,0,0,0,0,14248,1,0,0,-1,0,-1,21626,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,540,50,0,0,0,'',0,0,0,0,0,0,1),(22876,4,3,'Legionnaire\'s Mail Hauberk',31185,3,32768,1,107525,21505,5,64,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,18,5,18,4,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,398,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,538,120,0,0,0,'',0,0,0,0,0,0,1),(22887,4,3,'Legionnaire\'s Mail Legguards',31186,3,32768,1,111979,22395,7,64,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,18,5,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,348,0,0,0,0,0,0,0,0,0,14248,1,0,0,0,0,0,18384,1,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,538,90,0,0,0,'',0,0,0,0,0,0,1),(23258,4,2,'Champion\'s Leather Shoulders',31038,3,32768,1,80763,16152,3,8,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,196,0,0,0,0,0,0,0,0,0,9332,1,0,0,-1,0,-1,7597,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,522,60,0,0,0,'',0,0,0,0,0,0,1),(23257,4,2,'Champion\'s Leather Helm',30358,3,32768,1,78362,15672,1,8,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,23,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,238,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,14089,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,522,60,0,0,0,'',0,0,0,0,0,0,1),(23256,4,1,'Champion\'s Dreadweave Spaulders',30381,3,32768,1,62454,12490,3,256,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,17,5,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0,0,0,9417,1,0,0,-1,0,-1,18384,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,541,50,0,0,0,'',0,0,0,0,0,0,1),(23255,4,1,'Champion\'s Dreadweave Cowl',27258,3,32768,1,62217,12443,1,256,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,21,5,18,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,81,0,0,0,0,0,0,0,0,0,14248,1,0,0,-1,0,-1,18384,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,541,50,0,0,0,'',0,0,0,0,0,0,1),(23254,4,2,'Champion\'s Dragonhide Shoulders',28935,3,32768,1,77477,15495,3,1024,-1,71,60,0,0,0,14,0,0,0,1,1,0,4,12,3,6,7,12,6,6,5,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,206,0,0,0,0,0,0,0,0,0,9343,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,539,60,0,0,0,'',0,0,0,0,0,0,1),(23253,4,2,'Champion\'s Dragonhide Headguard',28106,3,32768,1,77190,15438,1,1024,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,16,3,12,4,16,5,16,6,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,198,0,0,0,0,0,0,0,0,0,9346,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,539,60,0,0,0,'',0,0,0,0,0,0,1),(23252,4,3,'Champion\'s Chain Shoulders',31047,3,32768,1,92684,18536,3,4,-1,71,60,0,0,0,14,0,0,0,1,1,0,3,18,7,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,311,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,543,70,0,0,0,'',0,0,0,0,0,0,1),(23251,4,3,'Champion\'s Chain Helm',31184,3,32768,1,91920,18384,1,4,-1,71,60,0,0,0,14,0,0,0,1,1,0,3,18,7,14,5,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,337,0,0,0,0,0,0,0,0,0,7598,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,543,70,0,0,0,'',0,0,0,0,0,0,1),(23244,4,4,'Champion\'s Plate Helm',30071,3,32768,1,66027,13205,1,1,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,24,4,21,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,598,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,537,80,0,0,0,'',0,0,0,0,0,0,1),(23243,4,4,'Champion\'s Plate Shoulders',31049,3,32768,1,65791,13158,3,1,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,18,4,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,552,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,537,80,0,0,0,'',0,0,0,0,0,0,1),(22886,4,1,'Legionnaire\'s Silk Tunic',31102,3,0,1,74380,14876,20,128,511,68,60,0,0,0,12,0,0,0,1,1,0,7,18,5,17,6,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,156,0,0,0,0,0,0,0,0,0,18384,1,0,0,-1,0,-1,14248,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,542,80,0,0,0,'',0,0,0,0,0,0,1),(22885,4,1,'Legionnaire\'s Satin Tunic',30351,3,32768,1,74108,14821,20,16,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,19,5,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,156,0,0,0,0,0,0,0,0,0,14248,1,0,0,-1,0,-1,21626,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,540,80,0,0,0,'',0,0,0,0,0,0,1),(22884,4,1,'Legionnaire\'s Dreadweave Tunic',27260,3,32768,1,73844,14768,20,256,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,20,5,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,96,0,0,0,0,0,0,0,0,0,15715,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,541,80,0,0,0,'',0,0,0,0,0,0,1),(22870,4,1,'Blood Guard\'s Silk Handwraps',31098,3,0,1,34226,6845,10,128,511,66,60,0,0,0,11,0,0,0,1,1,0,7,12,5,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,98,0,0,0,0,0,0,0,0,0,23037,1,0,0,-1,0,-1,9346,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,542,30,0,0,0,'',0,0,0,0,0,0,1),(22882,4,1,'Legionnaire\'s Satin Legguards',31033,3,32768,1,73300,14660,7,16,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,19,5,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,144,0,0,0,0,0,0,0,0,0,14248,1,0,0,-1,0,-1,21626,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,540,65,0,0,0,'',0,0,0,0,0,0,1),(22881,4,1,'Legionnaire\'s Dreadweave Legguards',31032,3,32768,1,73028,14605,7,256,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,21,5,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,84,0,0,0,0,0,0,0,0,0,14127,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,541,65,0,0,0,'',0,0,0,0,0,0,1),(22880,4,2,'Legionnaire\'s Leather Legguards',31040,3,32768,1,90955,18191,7,8,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,22,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,225,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,15806,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,522,75,0,0,0,'',0,0,0,0,0,0,1),(22879,4,2,'Legionnaire\'s Leather Chestpiece',31039,3,32768,1,90615,18123,5,8,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,22,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,248,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,15806,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,522,100,0,0,0,'',0,0,0,0,0,0,1),(22878,4,2,'Legionnaire\'s Dragonhide Leggings',27267,3,32768,1,90275,18055,7,1024,-1,68,60,0,0,0,12,0,0,0,1,1,0,4,12,3,12,7,12,6,5,5,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,215,0,0,0,0,0,0,0,0,0,18384,1,0,0,-1,0,-1,9343,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,539,75,0,0,0,'',0,0,0,0,0,0,1),(22877,4,2,'Legionnaire\'s Dragonhide Chestpiece',31037,3,32768,1,89935,17987,5,1024,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,13,4,13,3,12,5,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,218,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,9344,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,539,100,0,0,0,'',0,0,0,0,0,0,1),(22867,4,3,'Blood Guard\'s Mail Vices',27279,3,32768,1,50789,10157,10,64,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,15,5,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,242,0,0,0,0,0,0,0,0,0,18384,1,0,0,-1,0,-1,9342,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,538,40,0,0,0,'',0,0,0,0,0,0,1),(22875,4,3,'Legionnaire\'s Chain Legguards',30367,3,32768,1,107117,21423,7,4,-1,68,60,0,0,0,12,0,0,0,1,1,0,3,16,7,13,5,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,348,0,0,0,0,0,0,0,0,0,7598,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,543,90,0,0,0,'',0,0,0,0,0,0,1),(22874,4,3,'Legionnaire\'s Chain Hauberk',31048,3,32768,1,106709,21341,5,4,-1,68,60,0,0,0,12,0,0,0,1,1,0,3,16,7,13,5,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,398,0,0,0,0,0,0,0,0,0,7598,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,543,120,0,0,0,'',0,0,0,0,0,0,1),(22873,4,4,'Legionnaire\'s Plate Leggings',31052,3,32768,1,70875,14175,7,1,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,17,4,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,618,0,0,0,0,0,0,0,0,0,7598,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,537,100,0,0,0,'',0,0,0,0,0,0,1),(22872,4,4,'Legionnaire\'s Plate Hauberk',27274,3,32768,1,70603,14120,5,1,-1,68,60,0,0,0,12,0,0,0,1,1,0,7,23,4,21,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,706,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,537,135,0,0,0,'',0,0,0,0,0,0,1),(22860,4,1,'Blood Guard\'s Silk Walkers',31097,3,0,1,49504,9900,8,128,511,66,60,0,0,0,11,0,0,0,1,1,0,7,15,5,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,104,0,0,0,0,0,0,0,0,0,9344,1,0,0,-1,0,-1,23727,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,542,40,0,0,0,'',0,0,0,0,0,0,1),(22869,4,1,'Blood Guard\'s Satin Handwraps',31028,3,32768,1,34106,6821,10,16,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,12,5,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,98,0,0,0,0,0,0,0,0,0,23043,1,0,0,-1,0,-1,14248,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,540,30,0,0,0,'',0,0,0,0,0,0,1),(22868,4,4,'Blood Guard\'s Plate Gauntlets',31051,3,32768,1,31789,6357,10,1,-1,66,60,0,0,0,11,0,0,0,1,1,0,4,17,7,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,429,0,0,0,0,0,0,0,0,0,22778,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,537,45,0,0,0,'',0,0,0,0,0,0,1),(23259,4,3,'Champion\'s Mail Headguard',30072,3,32768,1,97270,19454,1,64,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,24,5,16,4,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,337,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,18384,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,538,70,0,0,0,'',0,0,0,0,0,0,1),(22865,4,1,'Blood Guard\'s Dreadweave Handwraps',27256,3,32768,1,33616,6723,10,256,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,14,5,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,58,0,0,0,0,0,0,0,0,0,23046,1,0,0,-1,0,-1,14248,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,541,30,0,0,0,'',0,0,0,0,0,0,1),(22858,4,4,'Blood Guard\'s Plate Greaves',31050,3,32768,1,49139,9827,8,1,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,23,4,10,3,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,472,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,537,65,0,0,0,'',0,0,0,0,0,0,1),(23260,4,3,'Champion\'s Mail Pauldrons',30382,3,32768,1,98058,19611,3,64,-1,71,60,0,0,0,14,0,0,0,1,1,0,7,16,5,10,4,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,311,0,0,0,0,0,0,0,0,0,9344,1,0,0,-1,0,-1,18384,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,538,70,0,0,0,'',0,0,0,0,0,0,1),(22856,4,2,'Blood Guard\'s Leather Walkers',31035,3,32768,1,60961,12192,8,8,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,18,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,166,0,0,0,0,0,0,0,0,0,23049,1,0,0,-1,0,-1,9335,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,522,50,0,0,0,'',0,0,0,0,0,0,1),(22855,4,1,'Blood Guard\'s Dreadweave Walkers',31026,3,32768,1,47684,9536,8,256,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,17,5,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,9346,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,541,40,0,0,0,'',0,0,0,0,0,0,1),(22852,4,2,'Blood Guard\'s Dragonhide Treads',27263,3,32768,1,59605,11921,8,1024,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,13,4,13,5,6,3,6,6,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,126,0,0,0,0,0,0,0,0,0,9343,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,539,50,0,0,0,'',0,0,0,0,0,0,1),(18864,4,0,'Insignia of the Alliance',31318,3,32768,1,15000,3750,12,2,77,0,0,0,0,0,6,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,23276,0,0,0,300000,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18863,4,0,'Insignia of the Alliance',31318,3,32768,1,15000,3750,12,1024,77,0,0,0,0,0,6,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,23277,0,0,0,300000,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18862,4,0,'Insignia of the Alliance',31318,3,32768,1,15000,3750,12,16,77,0,0,0,0,0,6,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,23276,0,0,0,300000,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(17584,4,1,'Marshal\'s Dreadweave Gloves',32995,4,32768,1,59280,11856,10,256,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,16,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,63,0,0,0,0,0,0,0,0,0,23046,1,0,0,-1,0,-1,22747,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,392,35,0,0,0,'',0,0,0,0,0,0,1),(18858,4,0,'Insignia of the Alliance',31318,3,32768,1,15000,3750,12,256,77,0,0,0,0,0,6,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,23273,0,0,0,300000,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18857,4,0,'Insignia of the Alliance',31318,3,32768,1,15000,3750,12,8,77,0,0,0,0,0,6,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,23273,0,0,0,300000,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18854,4,0,'Insignia of the Alliance',31318,3,32768,1,15000,3750,12,1,77,0,0,0,0,0,6,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5579,0,0,0,300000,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18853,4,0,'Insignia of the Horde',31306,3,32768,1,15000,3750,12,1024,-1,0,0,0,0,0,6,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,23277,0,0,0,300000,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18852,4,0,'Insignia of the Horde',31306,3,32768,1,15000,3750,12,256,-1,0,0,0,0,0,6,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,23273,0,0,0,300000,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(17590,4,1,'Warlord\'s Dreadweave Mantle',33088,4,0,1,95255,19051,3,256,511,74,60,0,0,0,17,0,0,0,1,1,0,7,22,5,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0,0,0,25110,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,391,60,0,0,0,'',0,0,0,0,0,0,1),(18850,4,0,'Insignia of the Horde',31306,3,32768,1,15000,3750,12,128,-1,0,0,0,0,0,6,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,23274,0,0,0,300000,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18849,4,0,'Insignia of the Horde',31306,3,32768,1,15000,3750,12,8,-1,0,0,0,0,0,6,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,23273,0,0,0,300000,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18856,4,0,'Insignia of the Alliance',31318,3,32768,1,15000,3750,12,4,77,0,0,0,0,0,6,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5579,0,0,0,300000,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18846,4,0,'Insignia of the Horde',31306,3,32768,1,15000,3750,12,4,-1,0,0,0,0,0,6,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5579,0,0,0,300000,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18845,4,0,'Insignia of the Horde',31306,3,32768,1,15000,3750,12,64,-1,0,0,0,0,0,6,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5579,0,0,0,300000,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18851,4,0,'Insignia of the Horde',31306,3,32768,1,15000,3750,12,16,-1,0,0,0,0,0,6,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,23276,0,0,0,300000,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18834,4,0,'Insignia of the Horde',31306,3,32768,1,15000,3750,12,1,-1,0,0,0,0,0,6,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5579,0,0,0,300000,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18859,4,0,'Insignia of the Alliance',31318,3,32768,1,15000,3750,12,128,77,0,0,0,0,0,6,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,23274,0,0,0,300000,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18826,4,6,'High Warlord\'s Shield Wall',31746,4,32768,1,159587,31917,14,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,23,4,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2929,0,0,0,0,0,0,0,0,0,13959,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,1,4,0,55,0,120,0,0,0,'',0,0,0,0,0,0,1),(18825,4,6,'Grand Marshal\'s Aegis',31733,4,32768,1,159036,31807,14,-1,-1,78,60,0,0,0,18,0,0,0,0,1,0,7,18,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2929,0,0,0,0,0,0,0,0,0,13959,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,1,4,0,55,0,120,0,0,0,'',0,0,0,0,0,0,1),(18454,4,2,'Sergeant Major\'s Dragonhide Armsplints',30805,3,32768,1,34815,6963,9,1024,-1,63,58,0,0,0,9,0,0,0,1,1,0,7,17,5,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,77,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,0,35,0,0,0,'',0,0,0,0,0,0,1),(18452,4,2,'Sergeant Major\'s Leather Armsplints',30804,3,32768,1,34553,6910,9,8,-1,63,58,0,0,0,9,0,0,0,1,1,0,7,17,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,77,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,0,35,0,0,0,'',0,0,0,0,0,0,1),(18448,4,3,'Sergeant Major\'s Chain Armguards',31248,3,32768,1,44007,8801,9,4,-1,63,58,0,0,0,9,0,0,0,1,1,0,7,17,5,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,162,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,0,40,0,0,0,'',0,0,0,0,0,0,1),(18437,4,1,'First Sergeant\'s Silk Cuffs',27255,3,32768,1,13721,2744,9,400,-1,50,45,0,0,0,9,0,0,0,1,1,0,7,14,5,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,31,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,0,30,0,0,0,'',0,0,0,0,0,0,1),(18436,4,2,'First Sergeant\'s Dragonhide Armguards',27262,3,32768,1,17086,3417,9,1024,-1,50,45,0,0,0,9,0,0,0,1,1,0,7,14,5,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,0,35,0,0,0,'',0,0,0,0,0,0,1),(18432,4,3,'First Sergeant\'s Mail Wristguards',27277,3,32768,1,21742,4348,9,68,-1,50,45,0,0,0,9,0,0,0,1,1,0,7,14,5,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,131,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,0,40,0,0,0,'',0,0,0,0,0,0,1),(18430,4,4,'First Sergeant\'s Plate Bracers',27273,3,32768,1,14391,2878,9,1,-1,50,45,0,0,0,9,0,0,0,1,1,0,7,14,4,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,231,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,0,45,0,0,0,'',0,0,0,0,0,0,1),(18428,4,0,'Senior Sergeant\'s Insignia',30797,3,32768,1,30000,7500,2,-1,-1,50,45,0,0,0,8,0,0,0,1,1,0,7,14,6,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(18427,4,1,'Sergeant\'s Cloak',27088,3,32768,1,6611,1322,16,-1,-1,35,30,0,0,0,7,0,0,0,1,1,0,7,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,66,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(17617,4,1,'Blood Guard\'s Satin Gloves',31028,3,32768,1,29344,5868,10,16,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,56,0,0,0,0,0,0,0,0,0,23043,1,0,0,-1,0,-1,14248,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,342,30,0,0,0,'',0,0,0,0,0,0,1),(17616,4,1,'Blood Guard\'s Satin Boots',31027,3,32768,1,43860,8772,8,16,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,16,5,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,61,0,0,0,0,0,0,0,0,0,9417,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,342,40,0,0,0,'',0,0,0,0,0,0,1),(17613,4,1,'Champion\'s Satin Shoulderpads',31031,3,32768,1,42236,8447,3,16,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,16,5,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,67,0,0,0,0,0,0,0,0,0,9417,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,342,50,0,0,0,'',0,0,0,0,0,0,1),(17612,4,1,'Legionnaire\'s Satin Vestments',30351,3,32768,1,56108,11221,20,16,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,20,5,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,89,0,0,0,0,0,0,0,0,0,9345,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,342,80,0,0,0,'',0,0,0,0,0,0,1),(17611,4,1,'Legionnaire\'s Satin Trousers',31033,3,32768,1,55895,11179,7,16,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,16,5,13,6,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,78,0,0,0,0,0,0,0,0,0,14254,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,342,65,0,0,0,'',0,0,0,0,0,0,1),(17610,4,1,'Champion\'s Satin Cowl',31030,3,32768,1,41761,8352,1,16,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,20,5,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,73,0,0,0,0,0,0,0,0,0,9345,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,342,50,0,0,0,'',0,0,0,0,0,0,1),(17601,4,1,'Lieutenant Commander\'s Satin Amice',31067,3,32768,1,44659,8931,3,16,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,16,5,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,67,0,0,0,0,0,0,0,0,0,9417,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,344,50,0,0,0,'',0,0,0,0,0,0,1),(17600,4,1,'Knight-Captain\'s Satin Robes',31058,3,32768,1,59333,11866,20,16,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,20,5,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,89,0,0,0,0,0,0,0,0,0,9345,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,344,80,0,0,0,'',0,0,0,0,0,0,1),(17599,4,1,'Knight-Captain\'s Satin Leggings',25198,3,32768,1,57594,11518,7,16,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,16,5,13,6,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,78,0,0,0,0,0,0,0,0,0,14254,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,344,65,0,0,0,'',0,0,0,0,0,0,1),(17598,4,1,'Lieutenant Commander\'s Diadem',31065,3,32768,1,43035,8607,1,16,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,20,5,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,73,0,0,0,0,0,0,0,0,0,9345,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,344,50,0,0,0,'',0,0,0,0,0,0,1),(17596,4,1,'Knight-Lieutenant\'s Satin Gloves',31062,3,32768,1,28480,5696,10,16,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,56,0,0,0,0,0,0,0,0,0,23043,1,0,0,-1,0,-1,14248,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,344,30,0,0,0,'',0,0,0,0,0,0,1),(17594,4,1,'Knight-Lieutenant\'s Satin Boots',31061,3,32768,1,42405,8481,8,16,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,16,5,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,61,0,0,0,0,0,0,0,0,0,9417,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,344,40,0,0,0,'',0,0,0,0,0,0,1),(17577,4,1,'Blood Guard\'s Dreadweave Gloves',27256,3,32768,1,28589,5717,10,256,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,56,0,0,0,0,0,0,0,0,0,23046,1,0,0,-1,0,-1,14248,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,345,30,0,0,0,'',0,0,0,0,0,0,1),(17576,4,1,'Blood Guard\'s Dreadweave Boots',31026,3,32768,1,42724,8544,8,256,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,16,5,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,61,0,0,0,0,0,0,0,0,0,9417,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,345,40,0,0,0,'',0,0,0,0,0,0,1),(17573,4,1,'Champion\'s Dreadweave Shoulders',30381,3,32768,1,42249,8449,3,256,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,16,5,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,67,0,0,0,0,0,0,0,0,0,9417,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,345,50,0,0,0,'',0,0,0,0,0,0,1),(17572,4,1,'Legionnaire\'s Dreadweave Robe',27260,3,32768,1,56119,11223,20,256,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,20,5,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,89,0,0,0,0,0,0,0,0,0,9345,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,345,80,0,0,0,'',0,0,0,0,0,0,1),(17571,4,1,'Legionnaire\'s Dreadweave Leggings',31032,3,32768,1,55912,11182,7,256,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,15,5,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,78,0,0,0,0,0,0,0,0,0,14127,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,345,65,0,0,0,'',0,0,0,0,0,0,1),(17570,4,1,'Champion\'s Dreadweave Hood',27258,3,32768,1,41774,8354,1,256,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,20,5,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,73,0,0,0,0,0,0,0,0,0,9345,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,345,50,0,0,0,'',0,0,0,0,0,0,1),(17569,4,1,'Lieutenant Commander\'s Dreadweave Mantle',31066,3,32768,1,41614,8322,3,256,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,16,5,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,67,0,0,0,0,0,0,0,0,0,9417,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,346,50,0,0,0,'',0,0,0,0,0,0,1),(17568,4,1,'Knight-Captain\'s Dreadweave Robe',31053,3,32768,1,55273,11054,20,256,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,20,5,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,89,0,0,0,0,0,0,0,0,0,9345,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,346,80,0,0,0,'',0,0,0,0,0,0,1),(17567,4,1,'Knight-Captain\'s Dreadweave Leggings',30385,3,32768,1,59304,11860,7,256,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,21,5,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,78,0,0,0,0,0,0,0,0,0,9345,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,346,65,0,0,0,'',0,0,0,0,0,0,1),(16531,4,3,'Blood Guard\'s Chain Boots',31181,3,32768,1,67261,13452,8,4,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,17,3,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255,0,0,0,0,0,0,0,0,0,13669,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,361,60,0,0,0,'',0,0,0,0,0,0,1),(16530,4,3,'Blood Guard\'s Chain Gauntlets',31182,3,32768,1,44482,8896,10,4,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,18,3,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,231,0,0,0,0,0,0,0,0,0,23157,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,361,40,0,0,0,'',0,0,0,0,0,0,1),(16528,4,3,'Champion\'s Chain Pauldrons',31047,3,32768,1,66545,13309,3,4,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,20,3,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,278,0,0,0,0,0,0,0,0,0,9141,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,361,70,0,0,0,'',0,0,0,0,0,0,1),(16498,4,2,'Blood Guard\'s Leather Treads',31035,3,32768,1,51802,10360,8,8,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,18,3,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,121,0,0,0,0,0,0,0,0,0,23049,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,347,50,0,0,0,'',0,0,0,0,0,0,1),(16526,4,3,'Champion\'s Chain Headguard',31184,3,32768,1,65771,13154,1,4,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,24,3,15,5,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,301,0,0,0,0,0,0,0,0,0,9141,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,361,70,0,0,0,'',0,0,0,0,0,0,1),(16524,4,3,'Champion\'s Mail Shoulders',30382,3,32768,1,65588,13117,3,64,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,16,5,15,4,5,3,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,278,0,0,0,0,0,0,0,0,0,9396,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,301,70,0,0,0,'',0,0,0,0,0,0,1),(16513,4,4,'Legionnaire\'s Plate Armor',27274,3,32768,1,59955,11991,5,1,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,25,4,9,3,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,657,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,281,135,0,0,0,'',0,0,0,0,0,0,1),(16504,4,2,'Legionnaire\'s Dragonhide Breastplate',31037,3,32768,1,70653,14130,5,1024,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,14,4,13,3,9,5,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,176,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,9345,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,382,100,0,0,0,'',0,0,0,0,0,0,1),(16436,4,4,'Lieutenant Commander\'s Lamellar Shoulders',31085,3,32768,1,44318,8863,3,2,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,12,4,12,3,12,5,7,6,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,493,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,401,80,0,0,0,'',0,0,0,0,0,0,1),(16435,4,4,'Knight-Captain\'s Lamellar Leggings',31084,3,32768,1,58878,11775,7,2,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,13,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,575,0,0,0,0,0,0,0,0,0,7598,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,401,100,0,0,0,'',0,0,0,0,0,0,1),(16434,4,4,'Lieutenant Commander\'s Lamellar Headguard',30316,3,32768,1,44003,8800,1,2,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,31,4,9,3,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,534,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,401,80,0,0,0,'',0,0,0,0,0,0,1),(16431,4,4,'Knight-Captain\'s Plate Leggings',26659,3,32768,1,58031,11606,7,1,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,13,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,575,0,0,0,0,0,0,0,0,0,7598,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,282,100,0,0,0,'',0,0,0,0,0,0,1),(16430,4,4,'Knight-Captain\'s Plate Chestguard',31083,3,32768,1,57824,11564,5,1,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,25,4,9,3,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,657,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,282,135,0,0,0,'',0,0,0,0,0,0,1),(16429,4,4,'Lieutenant Commander\'s Plate Helm',28934,3,32768,1,43208,8641,1,1,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,31,4,9,3,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,534,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,282,80,0,0,0,'',0,0,0,0,0,0,1),(16428,4,3,'Lieutenant Commander\'s Chain Helmet',31246,3,32768,1,64573,12914,1,4,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,24,3,15,5,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,301,0,0,0,0,0,0,0,0,0,9141,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,362,70,0,0,0,'',0,0,0,0,0,0,1),(16426,4,3,'Knight-Captain\'s Chain Leggings',31242,3,32768,1,83178,16635,7,4,-1,63,58,0,0,0,12,0,0,0,1,1,0,3,18,7,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,324,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,13669,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,362,90,0,0,0,'',0,0,0,0,0,0,1),(16427,4,3,'Lieutenant Commander\'s Chain Pauldrons',31247,3,32768,1,64619,12923,3,4,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,20,3,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,278,0,0,0,0,0,0,0,0,0,9141,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,362,70,0,0,0,'',0,0,0,0,0,0,1),(16425,4,3,'Knight-Captain\'s Chain Hauberk',31241,3,32768,1,82858,16571,5,4,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,18,3,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,370,0,0,0,0,0,0,0,0,0,9334,1,0,0,-1,0,-1,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,362,120,0,0,0,'',0,0,0,0,0,0,1),(16424,4,2,'Lieutenant Commander\'s Dragonhide Shroud',27234,3,32768,1,51586,10317,1,1024,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,16,3,11,4,11,5,11,6,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,143,0,0,0,0,0,0,0,0,0,9329,1,0,0,-1,0,-1,9342,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,381,60,0,0,0,'',0,0,0,0,0,0,1),(16423,4,2,'Lieutenant Commander\'s Dragonhide Epaulets',27236,3,32768,1,51392,10278,3,1024,-1,63,58,0,0,0,14,0,0,0,1,1,0,4,10,3,10,7,10,6,10,5,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,132,0,0,0,0,0,0,0,0,0,9398,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,381,60,0,0,0,'',0,0,0,0,0,0,1),(16422,4,2,'Knight-Captain\'s Dragonhide Leggings',27235,3,32768,1,75461,15092,7,1024,-1,63,58,0,0,0,12,0,0,0,1,1,0,4,12,3,12,7,12,5,9,6,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,154,0,0,0,0,0,0,0,0,0,13669,1,0,0,-1,0,-1,9330,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,381,75,0,0,0,'',0,0,0,0,0,0,1),(16421,4,2,'Knight-Captain\'s Dragonhide Tunic',31074,3,32768,1,75195,15039,5,1024,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,14,4,13,3,9,5,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,176,0,0,0,0,0,0,0,0,0,9345,1,0,0,-1,0,-1,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,381,100,0,0,0,'',0,0,0,0,0,0,1),(16419,4,2,'Knight-Captain\'s Leather Legguards',31073,3,32768,1,74670,14934,7,8,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,13,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,154,0,0,0,0,0,0,0,0,0,7598,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,348,75,0,0,0,'',0,0,0,0,0,0,1),(16396,4,2,'Knight-Lieutenant\'s Leather Gauntlets',31075,3,32768,1,36942,7388,10,8,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,15,3,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,110,0,0,0,0,0,0,0,0,0,15807,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,348,35,0,0,0,'',0,0,0,0,0,0,1),(16420,4,2,'Lieutenant Commander\'s Leather Spaulders',31076,3,32768,1,56197,11239,3,8,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,23,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,132,0,0,0,0,0,0,0,0,0,9141,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,348,60,0,0,0,'',0,0,0,0,0,0,1),(16417,4,2,'Knight-Captain\'s Leather Armor',31072,3,32768,1,74137,14827,5,8,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,25,3,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,176,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,348,100,0,0,0,'',0,0,0,0,0,0,1),(16416,4,1,'Lieutenant Commander\'s Crown',27232,3,32768,1,44322,8864,1,128,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,16,5,16,6,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,73,0,0,0,0,0,0,0,0,0,18384,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,343,50,0,0,0,'',0,0,0,0,0,0,1),(16415,4,1,'Lieutenant Commander\'s Silk Spaulders',27231,3,32768,1,44167,8833,3,128,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,16,5,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,67,0,0,0,0,0,0,0,0,0,9417,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,343,50,0,0,0,'',0,0,0,0,0,0,1),(16414,4,1,'Knight-Captain\'s Silk Leggings',27230,3,32768,1,58676,11735,7,128,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,16,6,16,5,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,78,0,0,0,0,0,0,0,0,0,14254,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,343,65,0,0,0,'',0,0,0,0,0,0,1),(16413,4,1,'Knight-Captain\'s Silk Raiment',31057,3,32768,1,58463,11692,20,128,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,20,5,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,89,0,0,0,0,0,0,0,0,0,18384,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,343,80,0,0,0,'',0,0,0,0,0,0,1),(16410,4,4,'Knight-Lieutenant\'s Lamellar Gauntlets',30321,3,32768,1,28152,5630,10,2,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,16,4,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,410,0,0,0,0,0,0,0,0,0,23300,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,401,45,0,0,0,'',0,0,0,0,0,0,1),(16409,4,4,'Knight-Lieutenant\'s Lamellar Sabatons',31082,3,32768,1,42068,8413,8,2,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,16,4,15,5,7,3,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,452,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,401,65,0,0,0,'',0,0,0,0,0,0,1),(16406,4,4,'Knight-Lieutenant\'s Plate Gauntlets',31086,3,32768,1,27728,5545,10,1,-1,63,58,0,0,0,11,0,0,0,1,1,0,4,16,7,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,410,0,0,0,0,0,0,0,0,0,22778,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,282,45,0,0,0,'',0,0,0,0,0,0,1),(16405,4,4,'Knight-Lieutenant\'s Plate Boots',26752,3,32768,1,41433,8286,8,1,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,23,4,8,3,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,452,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,282,65,0,0,0,'',0,0,0,0,0,0,1),(16403,4,3,'Knight-Lieutenant\'s Chain Gauntlets',31245,3,32768,1,41118,8223,10,4,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,18,3,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,231,0,0,0,0,0,0,0,0,0,23157,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,362,40,0,0,0,'',0,0,0,0,0,0,1),(16401,4,3,'Knight-Lieutenant\'s Chain Boots',31244,3,32768,1,67983,13596,8,4,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,17,3,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255,0,0,0,0,0,0,0,0,0,13669,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,362,60,0,0,0,'',0,0,0,0,0,0,1),(16397,4,2,'Knight-Lieutenant\'s Dragonhide Gloves',31071,3,32768,1,37072,7414,10,1024,-1,63,58,0,0,0,11,0,0,0,1,1,0,4,12,3,12,7,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,110,0,0,0,0,0,0,0,0,0,23217,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,381,35,0,0,0,'',0,0,0,0,0,0,1),(16418,4,2,'Lieutenant Commander\'s Leather Veil',31077,3,32768,1,55802,11160,1,8,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,26,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,143,0,0,0,0,0,0,0,0,0,13669,1,0,0,-1,0,-1,9141,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,348,60,0,0,0,'',0,0,0,0,0,0,1),(16393,4,2,'Knight-Lieutenant\'s Dragonhide Footwraps',31070,3,32768,1,53384,10676,8,1024,-1,63,58,0,0,0,11,0,0,0,1,1,0,4,12,3,5,7,12,5,5,6,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,121,0,0,0,0,0,0,0,0,0,9343,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,381,50,0,0,0,'',0,0,0,0,0,0,1),(16392,4,2,'Knight-Lieutenant\'s Leather Boots',31068,3,32768,1,53190,10638,8,8,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,18,3,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,121,0,0,0,0,0,0,0,0,0,23049,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,348,50,0,0,0,'',0,0,0,0,0,0,1),(16369,4,1,'Knight-Lieutenant\'s Silk Boots',31063,3,32768,1,42081,8416,8,128,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,16,5,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,61,0,0,0,0,0,0,0,0,0,9417,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,343,40,0,0,0,'',0,0,0,0,0,0,1),(16335,4,0,'Senior Sergeant\'s Insignia',30797,3,32768,1,40000,10000,2,-1,-1,63,58,0,0,0,8,0,0,0,1,1,0,7,17,6,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(15199,4,0,'Stone Guard\'s Herald',31252,1,0,1,40000,10000,19,-1,-1,40,0,0,0,0,10,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(15198,4,0,'Knight\'s Colors',31253,1,0,1,40000,10000,19,-1,-1,40,0,0,0,0,10,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(17625,4,1,'General\'s Satin Leggings',26021,4,32768,1,118947,23789,7,16,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,23,5,16,6,19,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,88,0,0,0,0,0,0,0,0,0,14127,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,390,75,0,0,0,'',0,0,0,0,0,0,1),(17624,4,1,'Warlord\'s Satin Robes',33084,4,32768,1,137223,27444,20,16,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,30,5,25,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,100,0,0,0,0,0,0,0,0,0,25110,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,390,100,0,0,0,'',0,0,0,0,0,0,1),(17623,4,1,'Warlord\'s Satin Cowl',33082,4,32768,1,102553,20510,1,16,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,28,5,24,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,81,0,0,0,0,0,0,0,0,0,14799,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,390,60,0,0,0,'',0,0,0,0,0,0,1),(17622,4,1,'Warlord\'s Satin Mantle',33083,4,32768,1,102188,20437,3,16,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,22,5,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0,0,0,25110,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,390,60,0,0,0,'',0,0,0,0,0,0,1),(17620,4,1,'General\'s Satin Gloves',33081,4,32768,1,58435,11687,10,16,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,16,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,63,0,0,0,0,0,0,0,0,0,23043,1,0,0,-1,0,-1,22747,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,390,35,0,0,0,'',0,0,0,0,0,0,1),(17618,4,1,'General\'s Satin Boots',33080,4,32768,1,87023,17404,8,16,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,21,5,21,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,69,0,0,0,0,0,0,0,0,0,9342,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,390,50,0,0,0,'',0,0,0,0,0,0,1),(17604,4,1,'Field Marshal\'s Satin Mantle',33005,4,32768,1,102927,20585,3,16,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,22,5,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0,0,0,25110,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,389,60,0,0,0,'',0,0,0,0,0,0,1),(17605,4,1,'Field Marshal\'s Satin Vestments',32984,4,32768,1,137722,27544,20,16,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,30,5,25,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,100,0,0,0,0,0,0,0,0,0,25110,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,389,100,0,0,0,'',0,0,0,0,0,0,1),(17603,4,1,'Marshal\'s Satin Pants',32991,4,32768,1,118130,23626,7,16,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,23,5,16,6,19,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,88,0,0,0,0,0,0,0,0,0,14127,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,389,75,0,0,0,'',0,0,0,0,0,0,1),(17607,4,1,'Marshal\'s Satin Sandals',32992,4,32768,1,81332,16266,8,16,-1,71,60,0,0,0,16,0,0,0,1,1,0,5,21,7,21,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,69,0,0,0,0,0,0,0,0,0,9342,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,389,50,0,0,0,'',0,0,0,0,0,0,1),(17608,4,1,'Marshal\'s Satin Gloves',32990,4,32768,1,54431,10886,10,16,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,16,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,63,0,0,0,0,0,0,0,0,0,22747,1,0,0,-1,0,-1,23043,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,389,35,0,0,0,'',0,0,0,0,0,0,1),(17592,4,1,'Warlord\'s Dreadweave Robe',33079,4,0,1,127965,25593,20,256,511,74,60,0,0,0,17,0,0,0,1,1,0,7,30,5,25,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,100,0,0,0,0,0,0,0,0,0,25110,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,391,100,0,0,0,'',0,0,0,0,0,0,1),(17593,4,1,'General\'s Dreadweave Pants',30380,4,0,1,110961,22192,7,256,511,71,60,0,0,0,16,0,0,0,1,1,0,7,23,5,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,88,0,0,0,0,0,0,0,0,0,14055,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,391,75,0,0,0,'',0,0,0,0,0,0,1),(17586,4,1,'General\'s Dreadweave Boots',33076,4,0,1,81034,16206,8,256,511,71,60,0,0,0,16,0,0,0,1,1,0,7,21,5,21,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,69,0,0,0,0,0,0,0,0,0,9342,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,391,50,0,0,0,'',0,0,0,0,0,0,1),(17588,4,1,'General\'s Dreadweave Gloves',33077,4,0,1,54437,10887,10,256,511,71,60,0,0,0,16,0,0,0,1,1,0,7,16,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,63,0,0,0,0,0,0,0,0,0,23046,1,0,0,-1,0,-1,22747,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,391,35,0,0,0,'',0,0,0,0,0,0,1),(17591,4,1,'Warlord\'s Dreadweave Hood',33071,4,0,1,95609,19121,1,256,511,74,60,0,0,0,17,0,0,0,1,1,0,7,28,5,24,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,81,0,0,0,0,0,0,0,0,0,14799,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,391,60,0,0,0,'',0,0,0,0,0,0,1),(17583,4,1,'Marshal\'s Dreadweave Boots',33006,4,32768,1,86351,17270,8,256,-1,71,60,0,0,0,16,0,0,0,1,1,0,5,21,7,21,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,69,0,0,0,0,0,0,0,0,0,9342,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,392,50,0,0,0,'',0,0,0,0,0,0,1),(17581,4,1,'Field Marshal\'s Dreadweave Robe',33001,4,32768,1,132325,26465,20,256,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,30,5,25,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,100,0,0,0,0,0,0,0,0,0,25110,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,392,100,0,0,0,'',0,0,0,0,0,0,1),(17579,4,1,'Marshal\'s Dreadweave Leggings',33007,4,32768,1,113479,22695,7,256,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,23,5,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,88,0,0,0,0,0,0,0,0,0,14055,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,392,75,0,0,0,'',0,0,0,0,0,0,1),(17580,4,1,'Field Marshal\'s Dreadweave Shoulders',33002,4,32768,1,98879,19775,3,256,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,22,5,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0,0,0,25110,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,392,60,0,0,0,'',0,0,0,0,0,0,1),(17578,4,1,'Field Marshal\'s Coronal',32979,4,32768,1,98160,19632,1,256,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,28,5,24,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,81,0,0,0,0,0,0,0,0,0,14799,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,392,60,0,0,0,'',0,0,0,0,0,0,1),(16580,4,3,'Warlord\'s Mail Spaulders',32128,4,32768,1,147331,29466,3,64,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,18,5,17,4,11,3,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,312,0,0,0,0,0,0,0,0,0,25109,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,386,85,0,0,0,'',0,0,0,0,0,0,1),(16579,4,3,'General\'s Mail Leggings',32127,4,32768,1,168313,33662,7,64,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,23,5,19,3,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,364,0,0,0,0,0,0,0,0,0,14127,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,386,105,0,0,0,'',0,0,0,0,0,0,1),(16578,4,3,'Warlord\'s Mail Helm',32133,4,32768,1,145586,29117,1,64,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,35,5,11,4,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,338,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,386,85,0,0,0,'',0,0,0,0,0,0,1),(16577,4,3,'Warlord\'s Mail Armor',32103,4,32768,1,193406,38681,5,64,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,35,5,20,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,416,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,386,140,0,0,0,'',0,0,0,0,0,0,1),(16574,4,3,'General\'s Mail Gauntlets',32100,4,32768,1,82591,16518,10,64,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,17,5,15,4,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,260,0,0,0,0,0,0,0,0,0,14248,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,386,50,0,0,0,'',0,0,0,0,0,0,1),(16573,4,3,'General\'s Mail Boots',32126,4,32768,1,123976,24795,8,64,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,18,5,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,286,0,0,0,0,0,0,0,0,0,22801,1,0,0,-1,0,-1,14254,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,386,70,0,0,0,'',0,0,0,0,0,0,1),(16571,4,3,'General\'s Chain Gloves',32119,4,32768,1,81655,16331,10,4,-1,71,60,0,0,0,16,0,0,0,1,1,0,3,17,7,18,5,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,260,0,0,0,0,0,0,0,0,0,23157,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,396,50,0,0,0,'',0,0,0,0,0,0,1),(16568,4,3,'Warlord\'s Chain Shoulders',32125,4,32768,1,151709,30341,3,4,-1,74,60,0,0,0,17,0,0,0,1,1,0,3,15,7,26,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,312,0,0,0,0,0,0,0,0,0,9332,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,396,85,0,0,0,'',0,0,0,0,0,0,1),(16550,4,2,'Warlord\'s Dragonhide Helmet',32134,4,32768,1,126788,25357,1,1024,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,16,3,16,4,15,5,15,6,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,160,0,0,0,0,0,0,0,0,0,9346,1,0,0,-1,0,-1,14027,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,398,70,0,0,0,'',0,0,0,0,0,0,1),(16567,4,3,'General\'s Chain Legguards',32120,4,32768,1,173333,34666,7,4,-1,71,60,0,0,0,16,0,0,0,1,1,0,3,23,7,22,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,364,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,13669,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,396,105,0,0,0,'',0,0,0,0,0,0,1),(16566,4,3,'Warlord\'s Chain Helmet',32135,4,32768,1,149959,29991,1,4,-1,74,60,0,0,0,17,0,0,0,1,1,0,3,19,7,27,5,17,6,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,338,0,0,0,0,0,0,0,0,0,9331,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,396,85,0,0,0,'',0,0,0,0,0,0,1),(16565,4,3,'Warlord\'s Chain Chestpiece',32122,4,32768,1,199217,39843,5,4,-1,74,60,0,0,0,17,0,0,0,1,1,0,3,23,7,24,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,416,0,0,0,0,0,0,0,0,0,14049,1,0,0,-1,0,-1,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,396,140,0,0,0,'',0,0,0,0,0,0,1),(16564,4,2,'General\'s Leather Legguards',32112,4,32768,1,142884,28576,7,8,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,24,3,0,4,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,173,0,0,0,0,0,0,0,0,0,7598,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,393,90,0,0,0,'',0,0,0,0,0,0,1),(16563,4,2,'Warlord\'s Leather Breastplate',32115,4,32768,1,164799,32959,5,8,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,35,3,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,197,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,393,120,0,0,0,'',0,0,0,0,0,0,1),(16562,4,2,'Warlord\'s Leather Spaulders',32131,4,32768,1,123156,24631,3,8,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,26,3,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,148,0,0,0,0,0,0,0,0,0,9332,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,393,70,0,0,0,'',0,0,0,0,0,0,1),(16561,4,2,'Warlord\'s Leather Helm',32132,4,32768,1,122700,24540,1,8,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,35,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,160,0,0,0,0,0,0,0,0,0,9336,1,0,0,-1,0,-1,13669,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,393,70,0,0,0,'',0,0,0,0,0,0,1),(16560,4,2,'General\'s Leather Mitts',32113,4,32768,1,70400,14080,10,8,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,18,3,14,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,123,0,0,0,0,0,0,0,0,0,14049,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,393,40,0,0,0,'',0,0,0,0,0,0,1),(16473,4,4,'Field Marshal\'s Lamellar Chestplate',30315,4,32768,1,133270,26654,5,2,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,35,4,14,5,0,3,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,738,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,402,165,0,0,0,'',0,0,0,0,0,0,1),(16472,4,4,'Marshal\'s Lamellar Boots',30319,4,32768,1,86028,17205,8,2,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,26,4,15,5,8,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,507,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,402,75,0,0,0,'',0,0,0,0,0,0,1),(16554,4,2,'General\'s Dragonhide Boots',32106,4,32768,1,111087,22217,8,1024,-1,71,60,0,0,0,16,0,0,0,1,1,0,4,15,7,14,5,11,3,10,6,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,136,0,0,0,0,0,0,0,0,0,25110,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,398,60,0,0,0,'',0,0,0,0,0,0,1),(16552,4,2,'General\'s Dragonhide Leggings',32108,4,32768,1,147067,29413,7,1024,-1,71,60,0,0,0,16,0,0,0,1,1,0,4,16,3,16,7,15,6,15,5,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,173,0,0,0,0,0,0,0,0,0,13669,1,0,0,-1,0,-1,9332,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,398,90,0,0,0,'',0,0,0,0,0,0,1),(16569,4,3,'General\'s Chain Boots',32124,4,32768,1,131526,26305,8,4,-1,71,60,0,0,0,16,0,0,0,1,1,0,3,14,7,26,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,286,0,0,0,0,0,0,0,0,0,13669,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,396,70,0,0,0,'',0,0,0,0,0,0,1),(16551,4,2,'Warlord\'s Dragonhide Epaulets',32129,4,32768,1,127243,25448,3,1024,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,12,3,12,4,12,6,11,5,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,148,0,0,0,0,0,0,0,0,0,9346,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,398,70,0,0,0,'',0,0,0,0,0,0,1),(16549,4,2,'Warlord\'s Dragonhide Hauberk',32110,4,32768,1,168443,33688,5,1024,-1,74,60,0,0,0,17,0,0,0,1,1,0,4,19,7,18,3,14,5,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,197,0,0,0,0,0,0,0,0,0,14248,1,0,0,-1,0,-1,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,398,120,0,0,0,'',0,0,0,0,0,0,1),(16548,4,4,'General\'s Plate Gauntlets',30371,4,32768,1,57993,11598,10,1,-1,71,60,0,0,0,16,0,0,0,1,1,0,4,18,7,17,3,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,461,0,0,0,0,0,0,0,0,0,22778,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,383,55,0,0,0,'',0,0,0,0,0,0,1),(16545,4,4,'General\'s Plate Boots',30370,4,32768,1,86054,17210,8,1,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,26,4,15,3,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,507,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,383,75,0,0,0,'',0,0,0,0,0,0,1),(16544,4,4,'Warlord\'s Plate Shoulders',30928,4,32768,1,99253,19850,3,1,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,26,4,15,3,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,553,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,383,100,0,0,0,'',0,0,0,0,0,0,1),(16543,4,4,'General\'s Plate Leggings',30375,4,32768,1,113910,22782,7,1,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,20,4,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,646,0,0,0,0,0,0,0,0,0,7598,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,383,120,0,0,0,'',0,0,0,0,0,0,1),(16542,4,4,'Warlord\'s Plate Headpiece',30374,4,32768,1,98535,19707,1,1,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,35,4,19,3,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,599,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,383,100,0,0,0,'',0,0,0,0,0,0,1),(16541,4,4,'Warlord\'s Plate Armor',30373,4,32768,1,130894,26178,5,1,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,35,4,13,3,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,738,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,383,165,0,0,0,'',0,0,0,0,0,0,1),(16540,4,1,'General\'s Silk Handguards',32997,4,32768,1,56325,11265,10,128,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,16,5,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,63,0,0,0,0,0,0,0,0,0,23037,1,0,0,-1,0,-1,22747,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,387,35,0,0,0,'',0,0,0,0,0,0,1),(16558,4,2,'General\'s Leather Treads',32114,4,32768,1,104823,20964,8,8,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,26,3,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,136,0,0,0,0,0,0,0,0,0,23049,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,393,60,0,0,0,'',0,0,0,0,0,0,1),(16555,4,2,'General\'s Dragonhide Gloves',32107,4,32768,1,69095,13819,10,1024,-1,71,60,0,0,0,16,0,0,0,1,1,0,4,18,3,17,7,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,123,0,0,0,0,0,0,0,0,0,23217,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,398,40,0,0,0,'',0,0,0,0,0,0,1),(16535,4,1,'Warlord\'s Silk Raiment',33085,4,32768,1,137669,27533,20,128,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,30,5,25,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,100,0,0,0,0,0,0,0,0,0,18384,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,387,100,0,0,0,'',0,0,0,0,0,0,1),(16534,4,1,'General\'s Silk Trousers',32998,4,32768,1,118504,23700,7,128,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,23,6,19,5,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,88,0,0,0,0,0,0,0,0,0,14127,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,387,75,0,0,0,'',0,0,0,0,0,0,1),(16484,4,4,'Marshal\'s Plate Gauntlets',30321,4,32768,1,55679,11135,10,1,-1,71,60,0,0,0,16,0,0,0,1,1,0,4,18,7,17,3,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,461,0,0,0,0,0,0,0,0,0,22778,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,384,55,0,0,0,'',0,0,0,0,0,0,1),(16533,4,1,'Warlord\'s Silk Cowl',32999,4,32768,1,102523,20504,1,128,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,24,5,24,6,19,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,81,0,0,0,0,0,0,0,0,0,18384,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,387,60,0,0,0,'',0,0,0,0,0,0,1),(16483,4,4,'Marshal\'s Plate Boots',30319,4,32768,1,83212,16642,8,1,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,26,4,15,3,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,507,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,384,75,0,0,0,'',0,0,0,0,0,0,1),(16480,4,4,'Field Marshal\'s Plate Shoulderguards',30318,4,32768,1,95235,19047,3,1,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,26,4,15,3,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,553,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,384,100,0,0,0,'',0,0,0,0,0,0,1),(16479,4,4,'Marshal\'s Plate Legguards',30317,4,32768,1,109282,21856,7,1,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,20,4,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,646,0,0,0,0,0,0,0,0,0,7598,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,384,120,0,0,0,'',0,0,0,0,0,0,1),(16478,4,4,'Field Marshal\'s Plate Helm',30316,4,32768,1,94516,18903,1,1,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,35,4,19,3,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,599,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,384,100,0,0,0,'',0,0,0,0,0,0,1),(16477,4,4,'Field Marshal\'s Plate Armor',30315,4,32768,1,125536,25107,5,1,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,35,4,13,3,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,738,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,384,165,0,0,0,'',0,0,0,0,0,0,1),(16476,4,4,'Field Marshal\'s Lamellar Pauldrons',30318,4,32768,1,93787,18757,3,2,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,18,4,17,5,10,6,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,553,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,402,100,0,0,0,'',0,0,0,0,0,0,1),(16475,4,4,'Marshal\'s Lamellar Legplates',30317,4,32768,1,118969,23793,7,2,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,19,4,15,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,646,0,0,0,0,0,0,0,0,0,15464,1,0,0,-1,0,-1,7598,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,402,120,0,0,0,'',0,0,0,0,0,0,1),(16474,4,4,'Field Marshal\'s Lamellar Faceguard',30316,4,32768,1,100317,20063,1,2,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,35,4,19,5,0,3,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,599,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,402,100,0,0,0,'',0,0,0,0,0,0,1),(16539,4,1,'General\'s Silk Boots',32996,4,32768,1,84182,16836,8,128,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,21,5,21,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,69,0,0,0,0,0,0,0,0,0,9342,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,387,50,0,0,0,'',0,0,0,0,0,0,1),(16536,4,1,'Warlord\'s Silk Amice',33089,4,32768,1,93758,18751,3,128,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,22,5,17,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0,0,0,25110,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,387,60,0,0,0,'',0,0,0,0,0,0,1),(16471,4,4,'Marshal\'s Lamellar Gloves',30321,4,32768,1,57148,11429,10,2,-1,71,60,0,0,0,16,0,0,0,1,1,0,4,20,7,16,5,0,3,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,461,0,0,0,0,0,0,0,0,0,23300,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,402,55,0,0,0,'',0,0,0,0,0,0,1),(16468,4,3,'Field Marshal\'s Chain Spaulders',32092,4,32768,1,147880,29576,3,4,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,26,3,15,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,312,0,0,0,0,0,0,0,0,0,9332,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,395,85,0,0,0,'',0,0,0,0,0,0,1),(16467,4,3,'Marshal\'s Chain Legguards',32097,4,32768,1,168943,33788,7,4,-1,71,60,0,0,0,16,0,0,0,1,1,0,3,23,7,22,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,364,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,13669,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,395,105,0,0,0,'',0,0,0,0,0,0,1),(16466,4,3,'Field Marshal\'s Chain Breastplate',32094,4,32768,1,194844,38968,5,4,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,24,3,23,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,416,0,0,0,0,0,0,0,0,0,14049,1,0,0,-1,0,-1,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,395,140,0,0,0,'',0,0,0,0,0,0,1),(16465,4,3,'Field Marshal\'s Chain Helm',32093,4,32768,1,145586,29117,1,4,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,27,3,19,5,17,6,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,338,0,0,0,0,0,0,0,0,0,9331,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,395,85,0,0,0,'',0,0,0,0,0,0,1),(16463,4,3,'Marshal\'s Chain Grips',32098,4,32768,1,83221,16644,10,4,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,18,3,17,5,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,260,0,0,0,0,0,0,0,0,0,23157,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,395,50,0,0,0,'',0,0,0,0,0,0,1),(16462,4,3,'Marshal\'s Chain Boots',32095,4,32768,1,124912,24982,8,4,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,26,3,14,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,286,0,0,0,0,0,0,0,0,0,13669,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,395,70,0,0,0,'',0,0,0,0,0,0,1),(16459,4,2,'Marshal\'s Dragonhide Boots',30333,4,32768,1,102463,20492,8,1024,-1,71,60,0,0,0,16,0,0,0,1,1,0,4,15,7,14,5,11,6,10,3,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,136,0,0,0,0,0,0,0,0,0,25110,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,397,60,0,0,0,'',0,0,0,0,0,0,1),(16457,4,2,'Field Marshal\'s Leather Epaulets',30328,4,32768,1,126763,25352,3,8,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,26,3,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,148,0,0,0,0,0,0,0,0,0,9332,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,394,70,0,0,0,'',0,0,0,0,0,0,1),(16456,4,2,'Marshal\'s Leather Leggings',30329,4,32768,1,145493,29098,7,8,-1,71,60,0,0,0,16,0,0,0,1,1,0,3,0,7,24,4,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,173,0,0,0,0,0,0,0,0,0,7598,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,394,90,0,0,0,'',0,0,0,0,0,0,1),(16455,4,2,'Field Marshal\'s Leather Mask',30330,4,32768,1,125864,25172,1,8,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,35,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,160,0,0,0,0,0,0,0,0,0,13669,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,9336,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,394,70,0,0,0,'',0,0,0,0,0,0,1),(16454,4,2,'Marshal\'s Leather Handgrips',30334,4,32768,1,72222,14444,10,8,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,18,3,14,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,123,0,0,0,0,0,0,0,0,0,14049,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,394,40,0,0,0,'',0,0,0,0,0,0,1),(16453,4,2,'Field Marshal\'s Leather Chestpiece',30327,4,32768,1,166621,33324,5,8,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,35,3,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,197,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,394,120,0,0,0,'',0,0,0,0,0,0,1),(16452,4,2,'Field Marshal\'s Dragonhide Breastplate',30327,4,32768,1,166014,33202,5,1024,-1,74,60,0,0,0,17,0,0,0,1,1,0,4,19,7,18,3,14,5,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,197,0,0,0,0,0,0,0,0,0,14089,1,0,0,-1,0,-1,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,397,120,0,0,0,'',0,0,0,0,0,0,1),(16451,4,2,'Field Marshal\'s Dragonhide Helmet',30330,4,32768,1,124055,24811,1,1024,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,16,3,16,4,15,5,15,6,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,160,0,0,0,0,0,0,0,0,0,9346,1,0,0,-1,0,-1,14027,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,397,70,0,0,0,'',0,0,0,0,0,0,1),(16450,4,2,'Marshal\'s Dragonhide Legguards',30329,4,32768,1,142360,28472,7,1024,-1,71,60,0,0,0,16,0,0,0,1,1,0,4,16,3,16,7,15,5,13,6,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,173,0,0,0,0,0,0,0,0,0,13669,1,0,0,-1,0,-1,9332,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,397,90,0,0,0,'',0,0,0,0,0,0,1),(16449,4,2,'Field Marshal\'s Dragonhide Spaulders',30328,4,32768,1,123156,24631,3,1024,-1,74,60,0,0,0,17,0,0,0,1,1,0,4,12,3,12,7,12,6,11,5,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,148,0,0,0,0,0,0,0,0,0,9346,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,397,70,0,0,0,'',0,0,0,0,0,0,1),(16446,4,2,'Marshal\'s Leather Footguards',30333,4,32768,1,105206,21041,8,8,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,26,3,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,136,0,0,0,0,0,0,0,0,0,23049,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,394,60,0,0,0,'',0,0,0,0,0,0,1),(16444,4,1,'Field Marshal\'s Silk Spaulders',33004,4,32768,1,96713,19342,3,128,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,22,5,17,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0,0,0,25110,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,388,60,0,0,0,'',0,0,0,0,0,0,1),(16443,4,1,'Field Marshal\'s Silk Vestments',32981,4,32768,1,128464,25692,20,128,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,30,5,25,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,100,0,0,0,0,0,0,0,0,0,18384,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,388,100,0,0,0,'',0,0,0,0,0,0,1),(16442,4,1,'Marshal\'s Silk Leggings',28715,4,32768,1,118901,23780,7,128,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,23,6,19,5,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,88,0,0,0,0,0,0,0,0,0,14127,1,0,0,-1,0,-1,0,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,388,75,0,0,0,'',0,0,0,0,0,0,1),(16441,4,1,'Field Marshal\'s Coronet',32978,4,32768,1,102878,20575,1,128,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,24,5,24,6,19,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,81,0,0,0,0,0,0,0,0,0,18384,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,388,60,0,0,0,'',0,0,0,0,0,0,1),(16440,4,1,'Marshal\'s Silk Gloves',32988,4,32768,1,59036,11807,10,128,-1,71,60,0,0,0,16,0,0,0,1,1,0,7,16,5,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,63,0,0,0,0,0,0,0,0,0,22747,1,0,0,-1,0,-1,23037,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,388,35,0,0,0,'',0,0,0,0,0,0,1),(16494,4,2,'Blood Guard\'s Dragonhide Boots',27263,3,32768,1,56412,11282,8,1024,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,12,4,12,5,5,3,5,6,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,121,0,0,0,0,0,0,0,0,0,9343,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,382,50,0,0,0,'',0,0,0,0,0,0,1),(16492,4,1,'Champion\'s Silk Shoulderpads',31100,3,32768,1,44810,8962,3,128,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,16,5,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,67,0,0,0,0,0,0,0,0,0,9417,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,341,50,0,0,0,'',0,0,0,0,0,0,1),(16491,4,1,'Legionnaire\'s Silk Robes',31102,3,32768,1,59534,11906,20,128,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,20,5,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,89,0,0,0,0,0,0,0,0,0,18384,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,341,80,0,0,0,'',0,0,0,0,0,0,1),(16490,4,1,'Legionnaire\'s Silk Pants',26144,3,32768,1,57801,11560,7,128,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,16,6,16,5,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,78,0,0,0,0,0,0,0,0,0,14254,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,341,65,0,0,0,'',0,0,0,0,0,0,1),(16489,4,1,'Champion\'s Silk Hood',31099,3,32768,1,43191,8638,1,128,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,16,5,16,6,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,73,0,0,0,0,0,0,0,0,0,18384,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,341,50,0,0,0,'',0,0,0,0,0,0,1),(16487,4,1,'Blood Guard\'s Silk Gloves',31098,3,32768,1,28584,5716,10,128,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,56,0,0,0,0,0,0,0,0,0,23037,1,0,0,-1,0,-1,14248,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,341,30,0,0,0,'',0,0,0,0,0,0,1),(16485,4,1,'Blood Guard\'s Silk Footwraps',31097,3,32768,1,42556,8511,8,128,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,16,5,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,61,0,0,0,0,0,0,0,0,0,9417,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,341,40,0,0,0,'',0,0,0,0,0,0,1),(22857,4,3,'Blood Guard\'s Mail Greaves',31183,3,32768,1,73757,14751,8,64,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,14,5,12,4,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,266,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,22801,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,538,60,0,0,0,'',0,0,0,0,0,0,1),(23309,4,2,'Lieutenant Commander\'s Dragonhide Shoulders',35807,3,32768,1,78099,15619,3,1024,-1,71,60,0,0,0,14,0,0,0,1,1,0,4,12,3,6,7,12,6,6,5,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,206,0,0,0,0,0,0,0,0,0,9343,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,551,60,0,0,0,'',0,0,0,0,0,0,1),(23307,4,3,'Lieutenant Commander\'s Chain Shoulders',35802,3,32768,1,93424,18684,3,4,-1,71,60,0,0,0,14,0,0,0,1,1,0,3,18,7,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,311,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,550,70,0,0,0,'',0,0,0,0,0,0,1),(23306,4,3,'Lieutenant Commander\'s Chain Helm',35801,3,32768,1,92666,18533,1,4,-1,71,60,0,0,0,14,0,0,0,1,1,0,3,18,7,14,5,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,337,0,0,0,0,0,0,0,0,0,7598,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,550,70,0,0,0,'',0,0,0,0,0,0,1),(23291,4,1,'Knight-Lieutenant\'s Silk Walkers',31063,3,32768,1,49329,9865,8,128,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,15,5,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,104,0,0,0,0,0,0,0,0,0,9344,1,0,0,-1,0,-1,23727,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,546,40,0,0,0,'',0,0,0,0,0,0,1),(16518,4,3,'Blood Guard\'s Mail Walkers',31183,3,32768,1,62426,12485,8,64,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,14,5,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255,0,0,0,0,0,0,0,0,0,9343,1,0,0,-1,0,-1,22801,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,301,60,0,0,0,'',0,0,0,0,0,0,1),(16501,4,2,'Champion\'s Dragonhide Spaulders',28935,3,32768,1,52396,10479,3,1024,-1,63,58,0,0,0,14,0,0,0,1,1,0,4,10,3,10,7,10,6,10,5,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,132,0,0,0,0,0,0,0,0,0,9398,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,382,60,0,0,0,'',0,0,0,0,0,0,1),(23275,4,4,'Knight-Lieutenant\'s Lamellar Sabatons',31082,3,32768,1,50069,10013,8,2,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,12,4,12,5,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,472,0,0,0,0,0,0,0,0,0,9344,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,544,65,0,0,0,'',0,0,0,0,0,0,1),(22883,4,1,'Legionnaire\'s Silk Legguards',26144,3,0,1,73572,14714,7,128,511,68,60,0,0,0,12,0,0,0,1,1,0,7,18,5,17,6,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,144,0,0,0,0,0,0,0,0,0,14248,1,0,0,-1,0,-1,18384,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,542,65,0,0,0,'',0,0,0,0,0,0,1),(22862,4,3,'Blood Guard\'s Chain Vices',31182,3,32768,1,49869,9973,10,4,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,16,3,18,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,242,0,0,0,0,0,0,0,0,0,28539,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,543,40,0,0,0,'',0,0,0,0,0,0,1),(22863,4,2,'Blood Guard\'s Dragonhide Grips',27265,3,32768,1,39737,7947,10,1024,-1,66,60,0,0,0,11,0,0,0,1,1,0,4,13,3,10,7,12,5,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,115,0,0,0,0,0,0,0,0,0,23217,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,539,35,0,0,0,'',0,0,0,0,0,0,1),(16521,4,3,'Champion\'s Mail Helm',30072,3,32768,1,62862,12572,1,64,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,25,5,9,4,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,301,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,301,70,0,0,0,'',0,0,0,0,0,0,1),(16527,4,3,'Legionnaire\'s Chain Leggings',30367,3,32768,1,88015,17603,7,4,-1,63,58,0,0,0,12,0,0,0,1,1,0,3,18,7,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,324,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,13669,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,361,90,0,0,0,'',0,0,0,0,0,0,1),(16432,4,4,'Lieutenant Commander\'s Plate Pauldrons',26662,3,32768,1,43683,8736,3,1,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,23,4,7,3,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,493,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,282,80,0,0,0,'',0,0,0,0,0,0,1),(16514,4,4,'Champion\'s Plate Headguard',30071,3,32768,1,45121,9024,1,1,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,31,4,9,3,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,534,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,281,80,0,0,0,'',0,0,0,0,0,0,1),(16503,4,2,'Champion\'s Dragonhide Helm',28106,3,32768,1,52790,10558,1,1024,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,16,3,11,4,11,5,11,6,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,143,0,0,0,0,0,0,0,0,0,9329,1,0,0,-1,0,-1,9342,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,382,60,0,0,0,'',0,0,0,0,0,0,1),(16510,4,4,'Blood Guard\'s Plate Gloves',31051,3,32768,1,29657,5931,10,1,-1,63,58,0,0,0,11,0,0,0,1,1,0,4,16,7,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,410,0,0,0,0,0,0,0,0,0,22778,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,281,45,0,0,0,'',0,0,0,0,0,0,1),(16516,4,4,'Champion\'s Plate Pauldrons',31049,3,32768,1,41118,8223,3,1,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,23,4,7,3,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,493,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,281,80,0,0,0,'',0,0,0,0,0,0,1),(17566,4,1,'Lieutenant Commander\'s Headguard',30341,3,32768,1,44318,8863,1,256,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,20,5,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,73,0,0,0,0,0,0,0,0,0,9345,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,346,50,0,0,0,'',0,0,0,0,0,0,1),(16433,4,4,'Knight-Captain\'s Lamellar Breastplate',30315,3,32768,1,58457,11691,5,2,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,25,4,9,3,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,657,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,401,135,0,0,0,'',0,0,0,0,0,0,1),(22843,4,3,'Blood Guard\'s Chain Greaves',31181,3,32768,1,75422,15084,8,4,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,19,3,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,266,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,543,60,0,0,0,'',0,0,0,0,0,0,1),(17564,4,1,'Knight-Lieutenant\'s Dreadweave Gloves',31060,3,32768,1,29332,5866,10,256,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,18,5,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,56,0,0,0,0,0,0,0,0,0,23046,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,346,30,0,0,0,'',0,0,0,0,0,0,1),(17562,4,1,'Knight-Lieutenant\'s Dreadweave Boots',31059,3,32768,1,43683,8736,8,256,-1,63,58,0,0,0,11,0,0,0,1,1,0,5,15,7,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,61,0,0,0,0,0,0,0,0,0,14254,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,346,40,0,0,0,'',0,0,0,0,0,0,1),(16525,4,3,'Legionnaire\'s Chain Breastplate',31048,3,32768,1,87375,17475,5,4,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,18,3,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,370,0,0,0,0,0,0,0,0,0,9334,1,0,0,-1,0,-1,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,361,120,0,0,0,'',0,0,0,0,0,0,1),(16523,4,3,'Legionnaire\'s Mail Leggings',31186,3,32768,1,86745,17349,7,64,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,20,5,11,3,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,324,0,0,0,0,0,0,0,0,0,15715,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,301,90,0,0,0,'',0,0,0,0,0,0,1),(16515,4,4,'Legionnaire\'s Plate Legguards',31052,3,32768,1,60375,12075,7,1,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,13,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,575,0,0,0,0,0,0,0,0,0,7598,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,281,100,0,0,0,'',0,0,0,0,0,0,1),(16522,4,3,'Legionnaire\'s Mail Chestpiece',31185,3,32768,1,84136,16827,5,64,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,20,5,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,370,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,301,120,0,0,0,'',0,0,0,0,0,0,1),(16519,4,3,'Blood Guard\'s Mail Grips',27279,3,32768,1,41593,8318,10,64,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,15,5,7,4,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,231,0,0,0,0,0,0,0,0,0,14254,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,0,301,40,0,0,0,'',0,0,0,0,0,0,1),(17602,4,1,'Field Marshal\'s Headdress',32980,4,32768,1,102198,20439,1,16,-1,74,60,0,0,0,17,0,0,0,1,1,0,7,28,5,24,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,81,0,0,0,0,0,0,0,0,0,14799,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,389,60,0,0,0,'',0,0,0,0,0,0,1),(16505,4,2,'Legionnaire\'s Leather Hauberk',31039,3,32768,1,70920,14184,5,8,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,25,3,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,176,0,0,0,0,0,0,0,0,0,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,347,100,0,0,0,'',0,0,0,0,0,0,1),(16508,4,2,'Legionnaire\'s Leather Leggings',31040,3,32768,1,73619,14723,7,8,-1,63,58,0,0,0,12,0,0,0,1,1,0,7,13,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,154,0,0,0,0,0,0,0,0,0,7598,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,347,75,0,0,0,'',0,0,0,0,0,0,1),(16506,4,2,'Champion\'s Leather Headguard',30358,3,32768,1,53384,10676,1,8,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,26,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,143,0,0,0,0,0,0,0,0,0,13669,1,0,0,-1,0,-1,15464,1,0,0,-1,0,-1,9141,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,347,60,0,0,0,'',0,0,0,0,0,0,1),(16507,4,2,'Champion\'s Leather Mantle',31038,3,32768,1,55014,11002,3,8,-1,63,58,0,0,0,14,0,0,0,1,1,0,7,23,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,132,0,0,0,0,0,0,0,0,0,9141,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,347,60,0,0,0,'',0,0,0,0,0,0,1),(16509,4,4,'Blood Guard\'s Plate Boots',31050,3,32768,1,44331,8866,8,1,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,23,4,8,3,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,452,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,6,0,0,0,281,65,0,0,0,'',0,0,0,0,0,0,1),(16499,4,2,'Blood Guard\'s Leather Vices',31036,3,32768,1,34664,6932,10,8,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,15,3,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,110,0,0,0,0,0,0,0,0,0,15807,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,347,35,0,0,0,'',0,0,0,0,0,0,1),(22864,4,2,'Blood Guard\'s Leather Grips',31036,3,32768,1,41866,8373,10,8,-1,66,60,0,0,0,11,0,0,0,1,1,0,7,18,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,155,0,0,0,0,0,0,0,0,0,9331,1,0,0,-1,0,-1,7597,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,522,35,0,0,0,'',0,0,0,0,0,0,1),(16437,4,1,'Marshal\'s Silk Footwraps',33009,4,32768,1,87619,17523,8,128,-1,71,60,0,0,0,16,0,0,0,1,1,0,5,21,7,21,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,69,0,0,0,0,0,0,0,0,0,9342,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,388,50,0,0,0,'',0,0,0,0,0,0,1),(16502,4,2,'Legionnaire\'s Dragonhide Trousers',27267,3,32768,1,70128,14025,7,1024,-1,63,58,0,0,0,12,0,0,0,1,1,0,4,12,3,12,7,12,6,12,5,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,154,0,0,0,0,0,0,0,0,0,13669,1,0,0,-1,0,-1,9330,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,382,75,0,0,0,'',0,0,0,0,0,0,1),(16448,4,2,'Marshal\'s Dragonhide Gauntlets',30334,4,32768,1,70662,14132,10,1024,-1,71,60,0,0,0,16,0,0,0,1,1,0,4,18,3,17,7,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,123,0,0,0,0,0,0,0,0,0,23217,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,8,0,0,0,397,40,0,0,0,'',0,0,0,0,0,0,1),(15196,4,0,'Private\'s Tabard',31254,1,0,1,10000,2500,19,-1,-1,20,0,0,0,0,5,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1),(16391,4,1,'Knight-Lieutenant\'s Silk Gloves',31064,3,32768,1,28261,5652,10,128,-1,63,58,0,0,0,11,0,0,0,1,1,0,7,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,56,0,0,0,0,0,0,0,0,0,23037,1,0,0,-1,0,-1,14248,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,1,'',0,0,0,0,0,7,0,0,0,343,30,0,0,0,'',0,0,0,0,0,0,1);
-- Magistrate Barthilas loot table changes
UPDATE creature_loot_template SET item=330068,mincountOrRef=-330068 WHERE entry=10435 and item=323240;
REPLACE INTO reference_loot_template VALUE (330068, 13376, 10, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 8283, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 8289, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 8290, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 8296, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 8300, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 8307, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 8308, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 8309, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 8310, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 10105, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 10136, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 10137, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 10140, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 10144, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 10146, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 10147, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 10149, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 10154, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 10155, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 10156, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 10161, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 10210, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 10217, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 10219, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 10226, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 10228, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 10230, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 10249, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 10256, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 10258, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 10267, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 10275, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 10363, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 10373, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 10376, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 10379, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 10380, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 10383, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 10387, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 10391, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 11979, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 12016, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 12046, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 12057, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 14303, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 14306, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 14308, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 14312, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 14317, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 14323, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 14324, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 14325, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 14330, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 14337, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 14458, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 14465, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 14684, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 14688, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 14863, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 14865, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 14868, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 14935, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 14936, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 14966, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 14973, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 14976, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 14977, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 15189, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 15192, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 15194, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 15239, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 15266, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 15278, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 15282, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 15288, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 15325, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 15430, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 15433, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 15434, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 15436, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 15437, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 15660, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 15664, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 15665, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 15667, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 15670, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 15672, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 15674, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 15676, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 15677, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 15679, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 15683, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 15931, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 15943, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 15986, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (330068, 15987, 0, 1, 1, 1, 0);
-- Golemagg
UPDATE creature_loot_template SET ChanceOrQuestChance=30 WHERE mincountOrRef=-326158;
-- Garr
UPDATE creature_loot_template SET ChanceOrQuestChance=30 WHERE mincountOrRef=-326264;
-- Ragnaros
UPDATE creature_loot_template SET maxcount=1,chanceorquestchance=100 WHERE mincountOrRef=-330001;
-- LBRS Gems Pre-1.11
UPDATE creature_loot_template SET ChanceOrQuestChance=1 WHERE item=12219;
UPDATE creature_loot_template SET ChanceOrQuestChance=20 WHERE item=12335;
UPDATE creature_loot_template SET ChanceOrQuestChance=15 WHERE item=12336;
UPDATE creature_loot_template SET ChanceOrQuestChance=25 WHERE item=12337;
-- Baroness Anastari
UPDATE creature_loot_template SET ChanceOrQuestChance=0 WHERE item=323242;
REPLACE INTO reference_loot_template VALUE (323241, 13534, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (323241, 16704, 0, 1, 1, 1, 0);
-- Nerub'enkan
UPDATE creature_loot_template SET ChanceOrQuestChance=0 WHERE item=323244;
REPLACE INTO reference_loot_template VALUE (323243, 13529, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (323243, 16675, 0, 1, 1, 1, 0);
-- Maleki the Pallid
UPDATE creature_loot_template SET ChanceOrQuestChance=0 WHERE item=323246;
REPLACE INTO reference_loot_template VALUE (323245, 13524, 0, 1, 1, 1, 0);
REPLACE INTO reference_loot_template VALUE (323245, 16691, 0, 1, 1, 1, 0);
-- Argent Dawn item, need proper description
UPDATE creature_loot_template set condition_id=70 where item in (22527,22529,22528,22525,22526);
    
-- * VENDORS

-- Pre-1.4 old-fashioned mounts
-- Tauren
DELETE FROM npc_vendor WHERE item in (18793,18794,18795);
REPLACE INTO npc_vendor VALUE (3685,15293,0,0);
REPLACE INTO npc_vendor VALUE (3685,15292,0,0);
-- Orc
DELETE FROM npc_vendor WHERE item in (18796,18797,18798);
REPLACE INTO npc_vendor VALUE (3362,12330,0,0);
REPLACE INTO npc_vendor VALUE (3362,12351,0,0);
-- Troll
DELETE FROM npc_vendor WHERE item in (18788,18789,18790);
REPLACE INTO npc_vendor VALUE (7952,8586,0,0);
REPLACE INTO npc_vendor VALUE (7952,13317,0,0);
-- Undead
DELETE FROM npc_vendor WHERE item in (18791);
-- Human 4885 2357 1460
DELETE FROM npc_vendor WHERE item in (18776,18777,18778);
REPLACE INTO npc_vendor VALUE (384,12353,0,0);
REPLACE INTO npc_vendor VALUE (4885,12353,0,0);
REPLACE INTO npc_vendor VALUE (2357,12353,0,0);
REPLACE INTO npc_vendor VALUE (1460,12353,0,0);
REPLACE INTO npc_vendor VALUE (384,12354,0,0);
REPLACE INTO npc_vendor VALUE (4885,12354,0,0);
REPLACE INTO npc_vendor VALUE (2357,12354,0,0);
REPLACE INTO npc_vendor VALUE (1460,12354,0,0);
-- Dwarf
DELETE FROM npc_vendor WHERE item in (18785,18786,18787);
REPLACE INTO npc_vendor VALUE (1261,13328,0,0);
REPLACE INTO npc_vendor VALUE (1261,13329,0,0);
-- Elf
DELETE FROM npc_vendor WHERE item in (18766,18767,18902);
REPLACE INTO npc_vendor VALUE (4730,12302,0,0);
REPLACE INTO npc_vendor VALUE (4730,12303,0,0);
-- Gnome
DELETE FROM npc_vendor WHERE item in (18772,18773,18774);
REPLACE INTO npc_vendor VALUE (7955,13326,0,0);
REPLACE INTO npc_vendor VALUE (7955,13327,0,0);
-- Delete Post-1.04 mounts
DELETE FROM npc_vendor WHERE item IN (18766,18767,18772,18773,18774,18776,18777,18778,18785,18786,18787,18788,18789,18790,18791,18793,18794,18795,18796,18797,18798,18902,19029);
-- Old PvP Vendors
DELETE FROM npc_vendor WHERE entry in (12785,12795);
INSERT INTO npc_vendor VALUE (12785, 16369, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16391, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16392, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16393, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16396, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16397, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16401, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16403, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16405, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16406, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16409, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16410, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16413, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16414, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16415, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16416, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16417, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16418, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16419, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16420, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16421, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16422, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16423, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16424, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16425, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16426, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16427, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16428, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16429, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16430, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16431, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16432, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16433, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16434, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16435, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16436, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16437, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16440, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16441, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16442, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16443, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16444, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16446, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16448, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16449, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16450, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16451, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16452, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16453, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16454, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16455, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16456, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16457, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16459, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16462, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16463, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16465, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16466, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16467, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16468, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16471, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16472, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16473, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16474, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16475, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16476, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16477, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16478, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16479, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16480, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16483, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 16484, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 17562, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 17564, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 17566, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 17567, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 17568, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 17569, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 17578, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 17579, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 17580, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 17581, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 17583, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 17584, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 17594, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 17596, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 17598, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 17599, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 17600, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 17601, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 17602, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 17603, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 17604, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 17605, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 17607, 0, 0);
INSERT INTO npc_vendor VALUE (12785, 17608, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16485, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16487, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16489, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16490, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16491, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16492, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16494, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16496, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16498, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16499, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16501, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16502, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16503, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16504, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16505, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16506, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16507, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16508, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16509, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16510, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16513, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16514, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16515, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16516, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16518, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16519, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16521, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16522, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16523, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16524, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16525, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16526, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16527, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16528, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16530, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16531, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16533, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16534, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16535, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16536, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16539, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16540, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16541, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16542, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16543, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16544, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16545, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16548, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16549, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16550, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16551, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16552, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16554, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16555, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16558, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16560, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16561, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16562, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16563, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16564, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16565, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16566, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16567, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16568, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16569, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16571, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16573, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16574, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16577, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16578, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16579, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 16580, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 17570, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 17571, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 17572, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 17573, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 17576, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 17577, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 17586, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 17588, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 17590, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 17591, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 17592, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 17593, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 17610, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 17611, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 17612, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 17613, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 17616, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 17617, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 17618, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 17620, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 17622, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 17623, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 17624, 0, 0);
INSERT INTO npc_vendor VALUE (12795, 17625, 0, 0);
		
-- * FORBIDDEN CREATURES

REPLACE INTO forbidden_creatures SELECT entry FROM creature_template WHERE entry IN (
6109,   -- Azuregos
12397,   -- Lord Kazzak
14541,   -- Swift Gray Wolf
14544,   -- Swift Orange Raptor
14547,   -- Swift White Ram
14550,   -- Great Gray Kodo
14553,   -- Swift Green Mechanostrider
14558,   -- Purple Skeletal Warhorse
14559,   -- Swift Palomino
14602,   -- Swift Stormsaber
14722,   -- Clavicus Knavingham
14723,   -- Mistina Steelshield
14724,   -- Bubulo Acerbus
14725,   -- Raedon Duskstriker
14726,   -- Rashona Straglash
14727,   -- Vehena
14728,   -- Rumstag Proudstrider
14729,   -- Ralston Farnsley
14921,   -- Rin'wosho the Trader
15070,   -- Vinchaxa
15181,   -- Commander Mar'alith
15183,   -- Geologist Larksbane
15189,   -- Beetix Ficklespragg
15190,   -- Noggle Ficklespragg
15194,   -- Hermit Ortell
15270   -- Huum Wildmane
);

-- * CREATURES

-- Pre-1.4 Stables
-- Human
UPDATE creature SET modelid=0 WHERE id in (14561,14560,14559);
UPDATE creature SET id=306 WHERE id=14561;
UPDATE creature SET id=305 WHERE id=14560;
-- Dwarf
UPDATE creature SET modelid=0 WHERE id in (14546,14548,14547);
UPDATE creature SET id=4780 WHERE id=14546;
UPDATE creature SET id=4778 WHERE id=14548;
-- Elf
UPDATE creature SET modelid=0 WHERE id in (14556,14555,14602);
UPDATE creature SET id=10322 WHERE id=14556;
UPDATE creature SET id=7322 WHERE id=14555;
-- Gnome
UPDATE creature SET modelid=0 WHERE id in (14551,14552,14553);
UPDATE creature SET id=11150 WHERE id=14551;
UPDATE creature SET id=10179 WHERE id=14552;
-- Tauren
UPDATE creature SET modelid=0 WHERE id in (14542,14549,14550);
UPDATE creature SET id=12148 WHERE id=14542;
UPDATE creature SET id=12151 WHERE id=14549;
-- Orc
UPDATE creature SET modelid=0 WHERE id in (14540,14539,14541);
UPDATE creature SET id=4270 WHERE id=14540;
UPDATE creature SET id=359 WHERE id=14539;
-- Troll
UPDATE creature SET modelid=0 WHERE id in (14545,14543,14544);
UPDATE creature SET id=7704 WHERE id=14545;
UPDATE creature SET id=7706 WHERE id=14543;
-- Pre 1.4 Mount FIX
UPDATE creature_template SET modelid_1=9695 WHERE entry=10322;

-- * FORBIDDEN QUESTS

REPLACE INTO forbidden_quests SELECT entry FROM quest_template WHERE entry IN (
1138,   -- Fruit of the Sea
1318,   -- Unfinished Gordok Business
2561,   -- Druid of the Claw
5213,   -- The Active Agent
5526,   -- Shards of the Felvine
6131,   -- Timbermaw Ally
6163,   -- Ramstein
6241,   -- Winterfall Activity
6845,   -- Uncovering Past Secrets
7003,   -- Zapped Giants
7161,   -- Proving Grounds
7162,   -- Proving Grounds
7163,   -- Rise and Be Recognized
7164,   -- Honored Amongst the Clan
7165,   -- Earned Reverence
7166,   -- Legendary Heroes
7167,   -- The Eye of Command
7168,   -- Rise and Be Recognized
7169,   -- Honored Amongst the Guard
7170,   -- Earned Reverence
7171,   -- Legendary Heroes
7172,   -- The Eye of Command
7181,   -- The Legend of Korrak
7202,   -- Korrak the Bloodrager
7462,   -- The Treasure of the Shen'dralar
7486,   -- A Hero's Reward
7490,   -- Victory for the Horde
7491,   -- For All To See
7495,   -- Victory for the Alliance
7496,   -- Celebrating Good Times
7499,   -- Codex of Defense
7500,   -- The Arcanist's Cookbook
7501,   -- The Light and How To Swing It
7506,   -- The Emerald Dream...
7521,   -- Thunderaan the Windseeker
7562,   -- Mor'zul Bloodbringer
7583,   -- Suppression
7603,   -- Kroshius' Infernal Core
7604,   -- A Binding Contract
7632,   -- The Ancient Leaf
7634,   -- Ancient Sinew Wrapped Lamina
7635,   -- A Proper String
7638,   -- Lord Grayson Shadowbreaker
7701,   -- WANTED: Overseer Maltorius
7703,   -- Unfinished Gordok Business
7721,   -- Fuel for the Zapping
7723,   -- Curse These Fat Fingers
7724,   -- Fiery Menace!
7727,   -- Incendosaurs? Whateverosaur is More Like It
7728,   -- STOLEN: Smithing Tuyere and Lookout's Spyglass
7732,   -- Zukk'ash Report
7733,   -- Improved Quality
7734,   -- Improved Quality
7737,   -- Gaining Acceptance
7782,   -- The Lord of Blackrock
7784,   -- The Lord of Blackrock
7786,   -- Thunderaan the Windseeker
7787,   -- Rise, Thunderfury!
7815,   -- Snapjaws, Mon!
7838,   -- Arena Grandmaster
7843,   -- The Final Message to the Wildhammer
7847,   -- Return to Primal Torntusk
7849,   -- Separation Anxiety
7850,   -- Dark Vessels
7861,   -- Wanted: Vile Priestess Hexx and Her Minions
7862,   -- Job Opening: Guard Captain of Revantusk Village
7877,   -- The Treasure of the Shen'dralar
7881,   -- Carnival Boots
7882,   -- Carnival Jerkins
7883,   -- The World's Largest Gnome!
7884,   -- Crocolisk Boy and the Bearded Murloc
7885,   -- Armor Kits
7889,   -- Coarse Weightstone
7890,   -- Heavy Grinding Stone
7891,   -- Green Iron Bracers
7892,   -- Big Black Mace
7893,   -- Rituals of Strength
7894,   -- Copper Modulator
7895,   -- Whirring Bronze Gizmo
7896,   -- Green Fireworks
7897,   -- Mechanical Repair Kits
7898,   -- Thorium Widget
7899,   -- Small Furry Paws
7900,   -- Torn Bear Pelts
7901,   -- Soft Bushy Tails
7902,   -- Vibrant Plumes
7903,   -- Evil Bat Eyes
7907,   -- Darkmoon Beast Deck
7927,   -- Darkmoon Portals Deck
7928,   -- Darkmoon Warlords Deck
7929,   -- Darkmoon Elementals Deck
7930,   -- 5 Tickets - Darkmoon Flower
7931,   -- 5 Tickets - Minor Darkmoon Prize
7932,   -- 12 Tickets - Lesser Darkmoon Prize
7933,   -- 40 Tickets - Greater Darkmoon Prize
7934,   -- 50 Tickets - Darkmoon Storage Box
7935,   -- 10 Tickets - Last Month's Mutton
7936,   -- 50 Tickets - Last Year's Mutton
7937,   -- Your Fortune Awaits You...
7938,   -- Your Fortune Awaits You...
7939,   -- More Dense Grinding Stones
7940,   -- 1200 Tickets - Orb of the Darkmoon
7941,   -- More Armor Kits
7942,   -- More Thorium Widgets
7943,   -- More Bat Eyes
7944,   -- Your Fortune Awaits You...
7945,   -- Your Fortune Awaits You...
7946,   -- Spawn of Jubjub
7981,   -- 1200 Tickets - Amulet of the Darkmoon
8041,   -- Strength of Mount Mugamba
8042,   -- Strength of Mount Mugamba
8043,   -- Strength of Mount Mugamba
8044,   -- The Rage of Mount Mugamba
8045,   -- The Heathen's Brand
8046,   -- The Heathen's Brand
8047,   -- The Heathen's Brand
8048,   -- The Hero's Brand
8049,   -- The Eye of Zuldazar
8050,   -- The Eye of Zuldazar
8051,   -- The Eye of Zuldazar
8052,   -- The All-Seeing Eye of Zuldazar
8053,   -- Paragons of Power: The Freethinker's Armguards
8054,   -- Paragons of Power: The Freethinker's Belt
8055,   -- Paragons of Power: The Freethinker's Breastplate
8056,   -- Paragons of Power: The Augur's Bracers (Raid)
8057,   -- Paragons of Power: The Haruspex's Bracers
8058,   -- Paragons of Power: The Vindicator's Armguards
8059,   -- Paragons of Power: The Demoniac's Wraps (Raid)
8060,   -- Paragons of Power: The Illusionist's Wraps
8061,   -- Paragons of Power: The Confessor's Wraps
8062,   -- Paragons of Power: The Predator's Bracers
8063,   -- Paragons of Power: The Madcap's Bracers
8064,   -- Paragons of Power: The Haruspex's Belt
8065,   -- Paragons of Power: The Haruspex's Tunic
8066,   -- Paragons of Power: The Predator's Belt
8067,   -- Paragons of Power: The Predator's Mantle
8068,   -- Paragons of Power: The Illusionist's Mantle
8069,   -- Paragons of Power: The Illusionist's Robes
8070,   -- Paragons of Power: The Confessor's Bindings
8071,   -- Paragons of Power: The Confessor's Mantle
8072,   -- Paragons of Power: The Madcap's Mantle
8073,   -- Paragons of Power: The Madcap's Tunic
8074,   -- Paragons of Power: The Augur's Belt
8075,   -- Paragons of Power: The Augur's Hauberk
8076,   -- Paragons of Power: The Demoniac's Mantle (Raid)
8077,   -- Paragons of Power: The Demoniac's Robes (Raid)
8078,   -- Paragons of Power: The Vindicator's Belt
8079,   -- Paragons of Power: The Vindicator's Breastplate
8080,   -- Arathi Basin Mark of Honor!
8101,   -- The Pebble of Kajaro
8102,   -- The Pebble of Kajaro
8103,   -- The Pebble of Kajaro
8104,   -- The Jewel of Kajaro
8105,   -- The Battle for Arathi Basin!
8106,   -- Kezan's Taint
8107,   -- Kezan's Taint
8108,   -- Kezan's Taint
8109,   -- Kezan's Unstoppable Taint
8110,   -- Enchanted South Seas Kelp
8111,   -- Enchanted South Seas Kelp
8112,   -- Enchanted South Seas Kelp
8113,   -- Pristine Enchanted South Seas Kelp
8114,   -- Control Four Bases
8115,   -- Control Five Bases
8116,   -- Vision of Voodress
8117,   -- Vision of Voodress
8118,   -- Vision of Voodress
8119,   -- The Unmarred Vision of Voodress
8120,   -- The Battle for Arathi Basin!
8121,   -- Take Four Bases
8122,   -- Take Five Bases
8123,   -- Cut Arathor Supply Lines
8141,   -- Zandalrian Shadow Talisman
8142,   -- Zandalrian Shadow Talisman
8143,   -- Zandalrian Shadow Talisman
8144,   -- Zandalrian Shadow Mastery Talisman
8145,   -- The Maelstrom's Tendril
8146,   -- The Maelstrom's Tendril
8147,   -- The Maelstrom's Tendril
8148,   -- The Maelstrom's Wrath
8149,   -- Honoring a Hero
8150,   -- Honoring a Hero
8151,   -- The Hunter's Charm
8153,   -- Courser Antlers
8154,   -- Arathi Basin Mark of Honor!
8155,   -- Arathi Basin Mark of Honor!
8156,   -- Arathi Basin Mark of Honor!
8160,   -- Cut Arathor Supply Lines
8161,   -- Cut Arathor Supply Lines
8162,   -- Cut Arathor Supply Lines
8166,   -- The Battle for Arathi Basin!
8167,   -- The Battle for Arathi Basin!
8168,   -- The Battle for Arathi Basin!
8169,   -- The Battle for Arathi Basin!
8170,   -- The Battle for Arathi Basin!
8171,   -- The Battle for Arathi Basin!
8181,   -- Confront Yeh'kinya
8182,   -- The Hand of Rastakhan
8183,   -- The Heart of Hakkar
8184,   -- Presence of Might
8185,   -- Syncretist's Sigil
8186,   -- Death's Embrace
8187,   -- Falcon's Call
8188,   -- Vodouisant's Vigilant Embrace
8189,   -- Presence of Sight
8190,   -- Hoodoo Hex
8191,   -- Prophetic Aura
8192,   -- Animist's Caress
8193,   -- Master Angler
8194,   -- Apprentice Angler
8195,   -- Zulian, Razzashi, and Hakkari Coins
8196,   -- Essence Mangoes
8201,   -- A Collection of Heads
8221,   -- Rare Fish - Keefer's Angelfish
8222,   -- Glowing Scorpid Blood
8223,   -- More Glowing Scorpid Blood
8224,   -- Rare Fish - Dezian Queenfish
8225,   -- Rare Fish - Brownell's Blue Striped Racer
8227,   -- Nat's Measuring Tape
8228,   -- Could I get a Fishing Flier?
8229,   -- Could I get a Fishing Flier?
8231,   -- Wavethrashing
8232,   -- The Green Drake
8233,   -- A Simple Request
8234,   -- Sealed Azure Bag
8235,   -- Encoded Fragments
8236,   -- The Azure Key
8238,   -- Gurubashi, Vilebranch, and Witherbark Coins
8239,   -- Sandfury, Skullsplitter, and Bloodscalp Coins
8240,   -- A Bijou for Zanza
8241,   -- Restoring Fiery Flux Supplies via Iron
8242,   -- Restoring Fiery Flux Supplies via Heavy Leather
8243,   -- Zanza's Potent Potables
8246,   -- Signets of the Zandalar
8249,   -- Junkboxes Needed
8250,   -- Magecraft
8251,   -- Magic Dust
8252,   -- The Siren's Coral
8253,   -- Destroy Morphaz
8254,   -- Cenarion Aid
8255,   -- Of Coursers We Know
8256,   -- The Ichor of Undeath
8257,   -- Blood of Morphaz
8258,   -- The Darkreaver Menace
8260,   -- Arathor Basic Care Package
8261,   -- Arathor Standard Care Package
8262,   -- Arathor Advanced Care Package
8263,   -- Defiler's Basic Care Package
8264,   -- Defiler's Standard Care Package
8265,   -- Defiler's Advanced Care Package
8266,   -- Ribbons of Sacrifice
8267,   -- Ribbons of Sacrifice
8268,   -- Ribbons of Sacrifice
8269,   -- Ribbons of Sacrifice
8271,   -- Hero of the Stormpike
8272,   -- Hero of the Frostwolf
8273,   -- Oran's Gratitude
8283,   -- Wanted - Deathclasp, Terror of the Sands
8306,   -- Into The Maw of Madness
8308,   -- Brann Bronzebeard's Lost Letter
8309,   -- Glyph Chasing
8316,   -- Armaments of War
8321,   -- Vyral the Vile
8341,   -- Lords of the Council
8342,   -- Twilight Ring of Lordship
8366,   -- Southsea Shakedown
8376,   -- Armaments of War
8377,   -- Armaments of War
8378,   -- Armaments of War
8379,   -- Armaments of War
8380,   -- Armaments of War
8381,   -- Armaments of War
8382,   -- Armaments of War
8410,   -- Elemental Mastery
8412,   -- Spirit Totem
8413,   -- Da Voodoo
8414,   -- Dispelling Evil
8415,   -- Chillwind Point
8416,   -- Inert Scourgestones
8417,   -- A Troubled Spirit
8418,   -- Forging the Mightstone
8419,   -- An Imp's Request
8421,   -- The Wrong Stuff
8422,   -- Trolls of a Feather
8423,   -- Warrior Kinship
8424,   -- War on the Shadowsworn
8425,   -- Voodoo Feathers
8447,   -- Waking Legends
8461,   -- Deadwood of the North
8481,   -- The Root of All Evil
8544,   -- Conqueror's Spaulders
8548,   -- Volunteer's Battlegear
8556,   -- Signet of Unyielding Strength
8557,   -- Drape of Unyielding Strength
8558,   -- Sickle of Unyielding Strength
8559,   -- Conqueror's Greaves
8560,   -- Conqueror's Legguards
8561,   -- Conqueror's Crown
8562,   -- Conqueror's Breastplate
8572,   -- Veteran's Battlegear
8573,   -- Champion's Battlegear
8574,   -- Stalwart's Battlegear
8592,   -- Tiara of the Oracle
8593,   -- Trousers of the Oracle
8594,   -- Mantle of the Oracle
8596,   -- Footwraps of the Oracle
8602,   -- Stormcaller's Pauldrons
8603,   -- Vestments of the Oracle
8620,   -- The Only Prescription
8621,   -- Stormcaller's Footguards
8622,   -- Stormcaller's Hauberk
8623,   -- Stormcaller's Diadem
8624,   -- Stormcaller's Leggings
8625,   -- Enigma Shoulderpads
8626,   -- Striker's Footguards
8627,   -- Avenger's Breastplate
8628,   -- Avenger's Crown
8629,   -- Avenger's Legguards
8630,   -- Avenger's Pauldrons
8631,   -- Enigma Leggings
8632,   -- Enigma Circlet
8633,   -- Enigma Robes
8634,   -- Enigma Boots
8637,   -- Deathdealer's Boots
8638,   -- Deathdealer's Vest
8639,   -- Deathdealer's Helm
8640,   -- Deathdealer's Leggings
8641,   -- Deathdealer's Spaulders
8655,   -- Avenger's Greaves
8656,   -- Striker's Hauberk
8657,   -- Striker's Diadem
8658,   -- Striker's Leggings
8659,   -- Striker's Pauldrons
8660,   -- Doomcaller's Footwraps
8661,   -- Doomcaller's Robes
8662,   -- Doomcaller's Circlet
8663,   -- Doomcaller's Trousers
8664,   -- Doomcaller's Mantle
8665,   -- Genesis Boots
8666,   -- Genesis Vest
8667,   -- Genesis Helm
8668,   -- Genesis Trousers
8669,   -- Genesis Shoulderpads
8689,   -- Shroud of Infinite Wisdom
8690,   -- Cloak of the Gathering Storm
8691,   -- Drape of Vaulted Secrets
8692,   -- Cloak of Unending Life
8693,   -- Cloak of Veiled Shadows
8694,   -- Shroud of Unspoken Names
8695,   -- Cape of Eternal Justice
8696,   -- Cloak of the Unseen Path
8697,   -- Ring of Infinite Wisdom
8698,   -- Ring of the Gathering Storm
8699,   -- Band of Vaulted Secrets
8700,   -- Band of Unending Life
8701,   -- Band of Veiled Shadows
8702,   -- Ring of Unspoken Names
8703,   -- Ring of Eternal Justice
8704,   -- Signet of the Unseen Path
8705,   -- Gavel of Infinite Wisdom
8706,   -- Hammer of the Gathering Storm
8707,   -- Blade of Vaulted Secrets
8708,   -- Mace of Unending Life
8709,   -- Dagger of Veiled Shadows
8710,   -- Kris of Unspoken Names
8711,   -- Blade of Eternal Justice
8712,   -- Scythe of the Unseen Path
8729,   -- The Wrath of Neptulon
8730,   -- Nefarius's Corruption
8736,   -- The Nightmare Manifests
8745,   -- Treasure of the Timeless One
8747,   -- The Path of the Protector
8748,   -- The Path of the Protector
8749,   -- The Path of the Protector
8750,   -- The Path of the Protector
8751,   -- The Protector of Kalimdor
8752,   -- The Path of the Conqueror
8753,   -- The Path of the Conqueror
8754,   -- The Path of the Conqueror
8755,   -- The Path of the Conqueror
8756,   -- The Qiraji Conqueror
8757,   -- The Path of the Invoker
8758,   -- The Path of the Invoker
8759,   -- The Path of the Invoker
8760,   -- The Path of the Invoker
8761,   -- The Grand Invoker
8764,   -- The Changing of Paths - Protector No More
8765,   -- The Changing of Paths - Invoker No More
8766,   -- The Changing of Paths - Conqueror No More
8789,   -- Imperial Qiraji Armaments
8790,   -- Imperial Qiraji Regalia
8791,   -- The Fall of Ossirian
8802,   -- The Savior of Kalimdor
8829,   -- The Ultimate Deception
8862,   -- Elune's Candle
8864,   -- Festive Lunar Dresses
8865,   -- Festive Lunar Pant Suits
8878,   -- Festive Recipes
8905,   -- An Earnest Proposition
8906,   -- An Earnest Proposition
8907,   -- An Earnest Proposition
8908,   -- An Earnest Proposition
8909,   -- An Earnest Proposition
8910,   -- An Earnest Proposition
8911,   -- An Earnest Proposition
8912,   -- An Earnest Proposition
8913,   -- An Earnest Proposition
8914,   -- An Earnest Proposition
8915,   -- An Earnest Proposition
8916,   -- An Earnest Proposition
8917,   -- An Earnest Proposition
8918,   -- An Earnest Proposition
8919,   -- An Earnest Proposition
8920,   -- An Earnest Proposition
8926,   -- Just Compensation
8927,   -- Just Compensation
8931,   -- Just Compensation
8932,   -- Just Compensation
8933,   -- Just Compensation
8934,   -- Just Compensation
8935,   -- Just Compensation
8936,   -- Just Compensation
8937,   -- Just Compensation
8938,   -- Just Compensation
8939,   -- Just Compensation
8940,   -- Just Compensation
8941,   -- Just Compensation
8942,   -- Just Compensation
8943,   -- Just Compensation
8944,   -- Just Compensation
8949,   -- Falrin's Vendetta
8951,   -- Anthion's Parting Words
8952,   -- Anthion's Parting Words
8953,   -- Anthion's Parting Words
8954,   -- Anthion's Parting Words
8955,   -- Anthion's Parting Words
8956,   -- Anthion's Parting Words
8957,   -- Anthion's Parting Words
8958,   -- Anthion's Parting Words
8959,   -- Anthion's Parting Words
8966,   -- The Left Piece of Lord Valthalak's Amulet
8967,   -- The Left Piece of Lord Valthalak's Amulet
8968,   -- The Left Piece of Lord Valthalak's Amulet
8969,   -- The Left Piece of Lord Valthalak's Amulet
8989,   -- The Right Piece of Lord Valthalak's Amulet
8990,   -- The Right Piece of Lord Valthalak's Amulet
8991,   -- The Right Piece of Lord Valthalak's Amulet
8992,   -- The Right Piece of Lord Valthalak's Amulet
8996,   -- Return to Bodley
8999,   -- Saving the Best for Last
9000,   -- Saving the Best for Last
9001,   -- Saving the Best for Last
9002,   -- Saving the Best for Last
9003,   -- Saving the Best for Last
9004,   -- Saving the Best for Last
9005,   -- Saving the Best for Last
9006,   -- Saving the Best for Last
9007,   -- Saving the Best for Last
9008,   -- Saving the Best for Last
9009,   -- Saving the Best for Last
9010,   -- Saving the Best for Last
9011,   -- Saving the Best for Last
9012,   -- Saving the Best for Last
9013,   -- Saving the Best for Last
9014,   -- Saving the Best for Last
9016,   -- Anthion's Parting Words
9017,   -- Anthion's Parting Words
9018,   -- Anthion's Parting Words
9019,   -- Anthion's Parting Words
9020,   -- Anthion's Parting Words
9021,   -- Anthion's Parting Words
9022,   -- Anthion's Parting Words
9023,   -- The Perfect Poison
9029,   -- A Bubbling Cauldron
9034,   -- Dreadnaught Breastplate
9036,   -- Dreadnaught Legplates
9037,   -- Dreadnaught Helmet
9038,   -- Dreadnaught Pauldrons
9039,   -- Dreadnaught Sabatons
9040,   -- Dreadnaught Gauntlets
9041,   -- Dreadnaught Waistguard
9042,   -- Dreadnaught Bracers
9043,   -- Redemption Tunic
9044,   -- Redemption Legguards
9045,   -- Redemption Headpiece
9046,   -- Redemption Spaulders
9047,   -- Redemption Boots
9048,   -- Redemption Handguards
9049,   -- Redemption Girdle
9050,   -- Redemption Wristguards
9053,   -- A Better Ingredient
9054,   -- Cryptstalker Tunic
9055,   -- Cryptstalker Legguards
9056,   -- Cryptstalker Headpiece
9057,   -- Cryptstalker Spaulders
9058,   -- Cryptstalker Boots
9059,   -- Cryptstalker Handguards
9060,   -- Cryptstalker Girdle
9061,   -- Cryptstalker Wristguards
9068,   -- Earthshatter Tunic
9069,   -- Earthshatter Legguards
9070,   -- Earthshatter Headpiece
9071,   -- Earthshatter Spaulders
9072,   -- Earthshatter Boots
9073,   -- Earthshatter Handguards
9074,   -- Earthshatter Girdle
9075,   -- Earthshatter Wristguards
9077,   -- Bonescythe Breastplate
9078,   -- Bonescythe Legplates
9079,   -- Bonescythe Helmet
9080,   -- Bonescythe Pauldrons
9081,   -- Bonescythe Sabatons
9082,   -- Bonescythe Gauntlets
9083,   -- Bonescythe Waistguard
9084,   -- Bonescythe Bracers
9086,   -- Dreamwalker Tunic
9087,   -- Dreamwalker Legguards
9088,   -- Dreamwalker Headpiece
9089,   -- Dreamwalker Spaulders
9090,   -- Dreamwalker Boots
9091,   -- Dreamwalker Handguards
9092,   -- Dreamwalker Girdle
9093,   -- Dreamwalker Wristguards
9094,   -- Argent Dawn Gloves
9095,   -- Frostfire Robe
9096,   -- Frostfire Leggings
9097,   -- Frostfire Circlet
9098,   -- Frostfire Shoulderpads
9099,   -- Frostfire Sandals
9100,   -- Frostfire Gloves
9101,   -- Frostfire Belt
9102,   -- Frostfire Bindings
9103,   -- Plagueheart Robe
9104,   -- Plagueheart Leggings
9105,   -- Plagueheart Circlet
9106,   -- Plagueheart Shoulderpads
9107,   -- Plagueheart Sandals
9108,   -- Plagueheart Gloves
9109,   -- Plagueheart Belt
9110,   -- Plagueheart Bindings
9111,   -- Robe of Faith
9112,   -- Leggings of Faith
9113,   -- Circlet of Faith
9114,   -- Shoulderpads of Faith
9115,   -- Sandals of Faith
9116,   -- Gloves of Faith
9117,   -- Belt of Faith
9118,   -- Bindings of Faith
9120,   -- The Fall of Kel'Thuzad
9179,   -- Craftsman's Writ - Imperial Plate Chest
9221,   -- Superior Armaments of Battle - Friend of the Dawn
9222,   -- Epic Armaments of Battle - Friend of the Dawn
9223,   -- Superior Armaments of Battle - Honored Amongst the Dawn
9224,   -- Epic Armaments of Battle - Honored Amongst the Dawn
9225,   -- Epic Armaments of Battle - Revered Amongst the Dawn
9226,   -- Superior Armaments of Battle - Revered Amongst the Dawn
9227,   -- Superior Armaments of Battle - Exalted Amongst the Dawn
9228,   -- Epic Armaments of Battle - Exalted Amongst the Dawn
9230,   -- Ramaladni's Icy Grasp
9232,   -- The Only Song I Know...
9234,   -- Icebane Gauntlets
9235,   -- Icebane Bracers
9236,   -- Icebane Breastplate
9237,   -- Glacial Cloak
9238,   -- Glacial Wrists
9239,   -- Glacial Gloves
9240,   -- Glacial Vest
9241,   -- Polar Bracers
9242,   -- Polar Gloves
9243,   -- Polar Tunic
9244,   -- Icy Scale Bracers
9245,   -- Icy Scale Gauntlets
9246,   -- Icy Scale Breastplate
9248,   -- A Humble Offering
9269,   -- Atiesh, Greatstaff of the Guardian
9270,   -- Atiesh, Greatstaff of the Guardian
9271,   -- Atiesh, Greatstaff of the Guardian
9323,   -- Wild Fires in the Eastern Kingdoms
9339,   -- A Thief's Reward
9341,   -- Tabard of the Argent Dawn
9365,   -- A Thief's Reward
55101,   -- Retour au pays
55111,   -- Retour au pays
55121,   -- Retour au pays
55131,   -- Retour au pays
55141,   -- Retour au pays
55151,   -- Retour au pays
55161,   -- Retour au pays
55171   -- Retour au pays
);

-- * QUESTS	

-- Fix Alterac Valley Kazzak quest: non-existant reward removed.
UPDATE quest_template SET RewChoiceItemId4 = 0 WHERE entry IN (7202, 7181);
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
UPDATE quest_template SET ReqItemId1 = 0, ReqItemCount1 = 0 WHERE entry IN (8184, 8185, 8186, 8187, 8188, 8189, 8190, 8191, 8192);
		
-- * PROFESSIONS 

-- Pre-1.4 [item_enchantment_template]
UPDATE item_enchantment_template SET chance = 4.53 * 100 / (100 - 16.6) WHERE entry=454;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 17.36) WHERE entry=455;
UPDATE item_enchantment_template SET chance = 1.48 * 100 / (100 - 18.46) WHERE entry=456;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 17.18) WHERE entry=457;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 17.42) WHERE entry=458;
UPDATE item_enchantment_template SET chance = 4.62 * 100 / (100 - 16.22) WHERE entry=459;
UPDATE item_enchantment_template SET chance = 4.72 * 100 / (100 - 14.96) WHERE entry=460;
UPDATE item_enchantment_template SET chance = 4.8 * 100 / (100 - 15.38) WHERE entry=461;
UPDATE item_enchantment_template SET chance = 0.74 * 100 / (100 - 14.24) WHERE entry=462;
UPDATE item_enchantment_template SET chance = 3.64 * 100 / (100 - 14.02) WHERE entry=463;
UPDATE item_enchantment_template SET chance = 3.51 * 100 / (100 - 19.7) WHERE entry=464;
UPDATE item_enchantment_template SET chance = 3.49 * 100 / (100 - 15.56) WHERE entry=465;
UPDATE item_enchantment_template SET chance = 3.7 * 100 / (100 - 15.98) WHERE entry=466;
UPDATE item_enchantment_template SET chance = 3.62 * 100 / (100 - 16.08) WHERE entry=467;
UPDATE item_enchantment_template SET chance = 3.24 * 100 / (100 - 24.26) WHERE entry=468;
UPDATE item_enchantment_template SET chance = 2.88 * 100 / (100 - 24.5) WHERE entry=469;
UPDATE item_enchantment_template SET chance = 2.92 * 100 / (100 - 28.37) WHERE entry=470;
UPDATE item_enchantment_template SET chance = 3.21 * 100 / (100 - 29.3) WHERE entry=471;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 28.91) WHERE entry=472;
UPDATE item_enchantment_template SET chance = 3.8 * 100 / (100 - 2.6) WHERE entry=475;
UPDATE item_enchantment_template SET chance = 4.55 * 100 / (100 - 2.76) WHERE entry=476;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 3) WHERE entry=477;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 3.48) WHERE entry=478;
UPDATE item_enchantment_template SET chance = 4.02 * 100 / (100 - 3.3) WHERE entry=479;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 3.6) WHERE entry=480;
UPDATE item_enchantment_template SET chance = 4.28 * 100 / (100 - 3.26) WHERE entry=481;
UPDATE item_enchantment_template SET chance = 3.08 * 100 / (100 - 3.44) WHERE entry=482;
UPDATE item_enchantment_template SET chance = 3.03 * 100 / (100 - 3.6) WHERE entry=483;
UPDATE item_enchantment_template SET chance = 3.25 * 100 / (100 - 3.26) WHERE entry=484;
UPDATE item_enchantment_template SET chance = 5.47 * 100 / (100 - 3) WHERE entry=485;
UPDATE item_enchantment_template SET chance = 5.63 * 100 / (100 - 3.24) WHERE entry=486;
UPDATE item_enchantment_template SET chance = 5.73 * 100 / (100 - 3.26) WHERE entry=487;
UPDATE item_enchantment_template SET chance = 6 * 100 / (100 - 3.5) WHERE entry=488;
UPDATE item_enchantment_template SET chance = 5.08 * 100 / (100 - 7.64) WHERE entry=489;
UPDATE item_enchantment_template SET chance = 4.67 * 100 / (100 - 6.54) WHERE entry=490;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 6.06) WHERE entry=491;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 6.94) WHERE entry=492;
UPDATE item_enchantment_template SET chance = 4.1 * 100 / (100 - 5.96) WHERE entry=493;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 0.1) WHERE entry=497;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 0.1) WHERE entry=502;
UPDATE item_enchantment_template SET chance = 2.77 * 100 / (100 - 3.3) WHERE entry=506;
UPDATE item_enchantment_template SET chance = 3.05 * 100 / (100 - 3.96) WHERE entry=507;
UPDATE item_enchantment_template SET chance = 3.13 * 100 / (100 - 3.56) WHERE entry=508;
UPDATE item_enchantment_template SET chance = 3.38 * 100 / (100 - 3.7) WHERE entry=509;
UPDATE item_enchantment_template SET chance = 2.77 * 100 / (100 - 7.46) WHERE entry=510;
UPDATE item_enchantment_template SET chance = 2.77 * 100 / (100 - 7.04) WHERE entry=511;
UPDATE item_enchantment_template SET chance = 2.5 * 100 / (100 - 5.5) WHERE entry=512;
UPDATE item_enchantment_template SET chance = 2.8 * 100 / (100 - 5.74) WHERE entry=513;
UPDATE item_enchantment_template SET chance = 2.2 * 100 / (100 - 6.39) WHERE entry=514;
UPDATE item_enchantment_template SET chance = 4.73 * 100 / (100 - 0.1) WHERE entry=531;
UPDATE item_enchantment_template SET chance = 4.05 * 100 / (100 - 0.2) WHERE entry=534;
UPDATE item_enchantment_template SET chance = 4.03 * 100 / (100 - 14) WHERE entry=538;
UPDATE item_enchantment_template SET chance = 2.38 * 100 / (100 - 14.37) WHERE entry=539;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 13.66) WHERE entry=540;
UPDATE item_enchantment_template SET chance = 6.25 * 100 / (100 - 14.9) WHERE entry=541;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 15.32) WHERE entry=542;
UPDATE item_enchantment_template SET chance = 7 * 100 / (100 - 16.06) WHERE entry=543;
UPDATE item_enchantment_template SET chance = 6.7 * 100 / (100 - 14.3) WHERE entry=544;
UPDATE item_enchantment_template SET chance = 6.45 * 100 / (100 - 13.74) WHERE entry=545;
UPDATE item_enchantment_template SET chance = 6.58 * 100 / (100 - 13.4) WHERE entry=546;
UPDATE item_enchantment_template SET chance = 6.85 * 100 / (100 - 12.36) WHERE entry=547;
UPDATE item_enchantment_template SET chance = 6.4 * 100 / (100 - 12.86) WHERE entry=548;
UPDATE item_enchantment_template SET chance = 6.72 * 100 / (100 - 13.64) WHERE entry=549;
UPDATE item_enchantment_template SET chance = 6.58 * 100 / (100 - 15.48) WHERE entry=550;
UPDATE item_enchantment_template SET chance = 5.93 * 100 / (100 - 15.06) WHERE entry=551;
UPDATE item_enchantment_template SET chance = 5.05 * 100 / (100 - 23.02) WHERE entry=552;
UPDATE item_enchantment_template SET chance = 4.3 * 100 / (100 - 24.4) WHERE entry=553;
UPDATE item_enchantment_template SET chance = 4.3 * 100 / (100 - 26.35) WHERE entry=554;
UPDATE item_enchantment_template SET chance = 0.4 * 100 / (100 - 24.74) WHERE entry=555;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 23.2) WHERE entry=556;
UPDATE item_enchantment_template SET chance = 4.33 * 100 / (100 - 4.4) WHERE entry=559;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 5.44) WHERE entry=560;
UPDATE item_enchantment_template SET chance = 5.35 * 100 / (100 - 3.8) WHERE entry=561;
UPDATE item_enchantment_template SET chance = 3.95 * 100 / (100 - 4.76) WHERE entry=562;
UPDATE item_enchantment_template SET chance = 4.72 * 100 / (100 - 5.25) WHERE entry=563;
UPDATE item_enchantment_template SET chance = 3.6 * 100 / (100 - 4.6) WHERE entry=564;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 5.26) WHERE entry=565;
UPDATE item_enchantment_template SET chance = 3.63 * 100 / (100 - 4.4) WHERE entry=566;
UPDATE item_enchantment_template SET chance = 3.65 * 100 / (100 - 4.14) WHERE entry=567;
UPDATE item_enchantment_template SET chance = 3.95 * 100 / (100 - 4.06) WHERE entry=568;
UPDATE item_enchantment_template SET chance = 3.8 * 100 / (100 - 4) WHERE entry=569;
UPDATE item_enchantment_template SET chance = 4.25 * 100 / (100 - 3.64) WHERE entry=570;
UPDATE item_enchantment_template SET chance = 4.3 * 100 / (100 - 3.26) WHERE entry=571;
UPDATE item_enchantment_template SET chance = 3.64 * 100 / (100 - 4.06) WHERE entry=572;
UPDATE item_enchantment_template SET chance = 3.68 * 100 / (100 - 5.91) WHERE entry=573;
UPDATE item_enchantment_template SET chance = 3.75 * 100 / (100 - 5.64) WHERE entry=574;
UPDATE item_enchantment_template SET chance = 3.45 * 100 / (100 - 4.94) WHERE entry=575;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 5.64) WHERE entry=576;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 5) WHERE entry=577;
UPDATE item_enchantment_template SET chance = 4.13 * 100 / (100 - 0.66) WHERE entry=580;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 1.04) WHERE entry=581;
UPDATE item_enchantment_template SET chance = 1.78 * 100 / (100 - 0.94) WHERE entry=582;
UPDATE item_enchantment_template SET chance = 4.9 * 100 / (100 - 0.8) WHERE entry=583;
UPDATE item_enchantment_template SET chance = 5.1 * 100 / (100 - 0.84) WHERE entry=584;
UPDATE item_enchantment_template SET chance = 5.22 * 100 / (100 - 0.76) WHERE entry=585;
UPDATE item_enchantment_template SET chance = 5.17 * 100 / (100 - 0.7) WHERE entry=586;
UPDATE item_enchantment_template SET chance = 5.15 * 100 / (100 - 0.86) WHERE entry=587;
UPDATE item_enchantment_template SET chance = 5.5 * 100 / (100 - 0.56) WHERE entry=588;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 0.84) WHERE entry=589;
UPDATE item_enchantment_template SET chance = 2.9 * 100 / (100 - 4.26) WHERE entry=590;
UPDATE item_enchantment_template SET chance = 2.65 * 100 / (100 - 5) WHERE entry=591;
UPDATE item_enchantment_template SET chance = 2.6 * 100 / (100 - 5.02) WHERE entry=592;
UPDATE item_enchantment_template SET chance = 2.28 * 100 / (100 - 4.46) WHERE entry=593;
UPDATE item_enchantment_template SET chance = 2.13 * 100 / (100 - 6.76) WHERE entry=594;
UPDATE item_enchantment_template SET chance = 2.65 * 100 / (100 - 6.82) WHERE entry=595;
UPDATE item_enchantment_template SET chance = 3.2 * 100 / (100 - 6.16) WHERE entry=596;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 6.14) WHERE entry=597;
UPDATE item_enchantment_template SET chance = 3.2 * 100 / (100 - 5.2) WHERE entry=598;
UPDATE item_enchantment_template SET chance = 6.05 * 100 / (100 - 1) WHERE entry=611;
UPDATE item_enchantment_template SET chance = 5.73 * 100 / (100 - 0.94) WHERE entry=612;
UPDATE item_enchantment_template SET chance = 5.63 * 100 / (100 - 0.84) WHERE entry=613;
UPDATE item_enchantment_template SET chance = 5.78 * 100 / (100 - 0.9) WHERE entry=614;
UPDATE item_enchantment_template SET chance = 4.93 * 100 / (100 - 1.8) WHERE entry=615;
UPDATE item_enchantment_template SET chance = 4.2 * 100 / (100 - 1.56) WHERE entry=616;
UPDATE item_enchantment_template SET chance = 4.75 * 100 / (100 - 1.7) WHERE entry=617;
UPDATE item_enchantment_template SET chance = 4.27 * 100 / (100 - 1.6) WHERE entry=618;
UPDATE item_enchantment_template SET chance = 4.1 * 100 / (100 - 1.6) WHERE entry=619;
UPDATE item_enchantment_template SET chance = 4.04 * 100 / (100 - 31.38) WHERE entry=629;
UPDATE item_enchantment_template SET chance = 3.64 * 100 / (100 - 27.52) WHERE entry=630;
UPDATE item_enchantment_template SET chance = 3 * 100 / (100 - 25.8) WHERE entry=631;
UPDATE item_enchantment_template SET chance = 3.26 * 100 / (100 - 26.7) WHERE entry=632;
UPDATE item_enchantment_template SET chance = 3.08 * 100 / (100 - 24.5) WHERE entry=633;
UPDATE item_enchantment_template SET chance = 2.67 * 100 / (100 - 25.76) WHERE entry=634;
UPDATE item_enchantment_template SET chance = 2.73 * 100 / (100 - 26.02) WHERE entry=635;
UPDATE item_enchantment_template SET chance = 3 * 100 / (100 - 20.8) WHERE entry=636;
UPDATE item_enchantment_template SET chance = 3 * 100 / (100 - 23.46) WHERE entry=637;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 25.43) WHERE entry=638;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 27.53) WHERE entry=639;
UPDATE item_enchantment_template SET chance = 1.85 * 100 / (100 - 33.2) WHERE entry=640;
UPDATE item_enchantment_template SET chance = 3.28 * 100 / (100 - 6.24) WHERE entry=650;
UPDATE item_enchantment_template SET chance = 3.98 * 100 / (100 - 7.16) WHERE entry=651;
UPDATE item_enchantment_template SET chance = 3.83 * 100 / (100 - 6.24) WHERE entry=652;
UPDATE item_enchantment_template SET chance = 4.68 * 100 / (100 - 4.74) WHERE entry=653;
UPDATE item_enchantment_template SET chance = 4.9 * 100 / (100 - 4.88) WHERE entry=654;
UPDATE item_enchantment_template SET chance = 4.97 * 100 / (100 - 4.74) WHERE entry=655;
UPDATE item_enchantment_template SET chance = 4.92 * 100 / (100 - 4.7) WHERE entry=656;
UPDATE item_enchantment_template SET chance = 4.95 * 100 / (100 - 5.4) WHERE entry=657;
UPDATE item_enchantment_template SET chance = 4.27 * 100 / (100 - 5.2) WHERE entry=658;
UPDATE item_enchantment_template SET chance = 3.85 * 100 / (100 - 4.19) WHERE entry=659;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 5.56) WHERE entry=660;
UPDATE item_enchantment_template SET chance = 4.45 * 100 / (100 - 3.1) WHERE entry=661;
UPDATE item_enchantment_template SET chance = 4.25 * 100 / (100 - 0.56) WHERE entry=671;
UPDATE item_enchantment_template SET chance = 5.13 * 100 / (100 - 0.5) WHERE entry=672;
UPDATE item_enchantment_template SET chance = 5.48 * 100 / (100 - 0.36) WHERE entry=673;
UPDATE item_enchantment_template SET chance = 2.76 * 100 / (100 - 5.72) WHERE entry=674;
UPDATE item_enchantment_template SET chance = 2.8 * 100 / (100 - 6.76) WHERE entry=675;
UPDATE item_enchantment_template SET chance = 2.97 * 100 / (100 - 5.7) WHERE entry=676;
UPDATE item_enchantment_template SET chance = 2.93 * 100 / (100 - 5.7) WHERE entry=677;
UPDATE item_enchantment_template SET chance = 2.63 * 100 / (100 - 7.6) WHERE entry=678;
UPDATE item_enchantment_template SET chance = 2.4 * 100 / (100 - 6.82) WHERE entry=679;
UPDATE item_enchantment_template SET chance = 3 * 100 / (100 - 5.06) WHERE entry=680;
UPDATE item_enchantment_template SET chance = 2.43 * 100 / (100 - 5.2) WHERE entry=681;
UPDATE item_enchantment_template SET chance = 3.7 * 100 / (100 - 3) WHERE entry=682;
UPDATE item_enchantment_template SET chance = 4.75 * 100 / (100 - 0.76) WHERE entry=695;
UPDATE item_enchantment_template SET chance = 5.25 * 100 / (100 - 0.66) WHERE entry=696;
UPDATE item_enchantment_template SET chance = 5.25 * 100 / (100 - 0.5) WHERE entry=697;
UPDATE item_enchantment_template SET chance = 5.02 * 100 / (100 - 0.46) WHERE entry=698;
UPDATE item_enchantment_template SET chance = 4.43 * 100 / (100 - 0.84) WHERE entry=699;
UPDATE item_enchantment_template SET chance = 4.8 * 100 / (100 - 0.84) WHERE entry=700;
UPDATE item_enchantment_template SET chance = 4.37 * 100 / (100 - 0.96) WHERE entry=701;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 1.37) WHERE entry=702;
UPDATE item_enchantment_template SET chance = 2.7 * 100 / (100 - 1.2) WHERE entry=703;
UPDATE item_enchantment_template SET chance = 5.05 * 100 / (100 - 15.6) WHERE entry=708;
UPDATE item_enchantment_template SET chance = 5.45 * 100 / (100 - 13.94) WHERE entry=709;
UPDATE item_enchantment_template SET chance = 6.13 * 100 / (100 - 15.46) WHERE entry=710;
UPDATE item_enchantment_template SET chance = 6.53 * 100 / (100 - 15.36) WHERE entry=711;
UPDATE item_enchantment_template SET chance = 12.3 * 100 / (100 - 14.93) WHERE entry=712;
UPDATE item_enchantment_template SET chance = 12.8 * 100 / (100 - 13.2) WHERE entry=713;
UPDATE item_enchantment_template SET chance = 6.35 * 100 / (100 - 13.62) WHERE entry=714;
UPDATE item_enchantment_template SET chance = 5.97 * 100 / (100 - 13.9) WHERE entry=715;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 14.78) WHERE entry=716;
UPDATE item_enchantment_template SET chance = 5.13 * 100 / (100 - 13.74) WHERE entry=717;
UPDATE item_enchantment_template SET chance = 4.9 * 100 / (100 - 14.9) WHERE entry=718;
UPDATE item_enchantment_template SET chance = 3.76 * 100 / (100 - 14.54) WHERE entry=719;
UPDATE item_enchantment_template SET chance = 6.9 * 100 / (100 - 21.9) WHERE entry=720;
UPDATE item_enchantment_template SET chance = 6.35 * 100 / (100 - 23.9) WHERE entry=721;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 22.66) WHERE entry=722;
UPDATE item_enchantment_template SET chance = 0.4 * 100 / (100 - 27.65) WHERE entry=723;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 5.5) WHERE entry=729;
UPDATE item_enchantment_template SET chance = 3.15 * 100 / (100 - 4.1) WHERE entry=730;
UPDATE item_enchantment_template SET chance = 3.4 * 100 / (100 - 4.96) WHERE entry=731;
UPDATE item_enchantment_template SET chance = 6.4 * 100 / (100 - 3.96) WHERE entry=732;
UPDATE item_enchantment_template SET chance = 7.97 * 100 / (100 - 3.9) WHERE entry=733;
UPDATE item_enchantment_template SET chance = 7.9 * 100 / (100 - 3.7) WHERE entry=734;
UPDATE item_enchantment_template SET chance = 3.97 * 100 / (100 - 3.64) WHERE entry=735;
UPDATE item_enchantment_template SET chance = 3.9 * 100 / (100 - 3.64) WHERE entry=736;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 3.84) WHERE entry=737;
UPDATE item_enchantment_template SET chance = 3.27 * 100 / (100 - 3.04) WHERE entry=738;
UPDATE item_enchantment_template SET chance = 2.92 * 100 / (100 - 2.94) WHERE entry=739;
UPDATE item_enchantment_template SET chance = 2.87 * 100 / (100 - 2.9) WHERE entry=740;
UPDATE item_enchantment_template SET chance = 5.3 * 100 / (100 - 4.7) WHERE entry=741;
UPDATE item_enchantment_template SET chance = 4.5 * 100 / (100 - 5) WHERE entry=742;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 5.18) WHERE entry=743;
UPDATE item_enchantment_template SET chance = 2.25 * 100 / (100 - 6.04) WHERE entry=744;
UPDATE item_enchantment_template SET chance = 0.8 * 100 / (100 - 10.7) WHERE entry=745;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 1) WHERE entry=749;
UPDATE item_enchantment_template SET chance = 2.2 * 100 / (100 - 0.9) WHERE entry=750;
UPDATE item_enchantment_template SET chance = 4.93 * 100 / (100 - 0.86) WHERE entry=751;
UPDATE item_enchantment_template SET chance = 5.5 * 100 / (100 - 0.9) WHERE entry=752;
UPDATE item_enchantment_template SET chance = 5.13 * 100 / (100 - 0.86) WHERE entry=753;
UPDATE item_enchantment_template SET chance = 10.85 * 100 / (100 - 0.8) WHERE entry=754;
UPDATE item_enchantment_template SET chance = 11.17 * 100 / (100 - 0.7) WHERE entry=755;
UPDATE item_enchantment_template SET chance = 5.57 * 100 / (100 - 0.64) WHERE entry=756;
UPDATE item_enchantment_template SET chance = 5.43 * 100 / (100 - 0.64) WHERE entry=757;
UPDATE item_enchantment_template SET chance = 2.97 * 100 / (100 - 3.84) WHERE entry=758;
UPDATE item_enchantment_template SET chance = 3.55 * 100 / (100 - 3.8) WHERE entry=759;
UPDATE item_enchantment_template SET chance = 3.07 * 100 / (100 - 3.74) WHERE entry=760;
UPDATE item_enchantment_template SET chance = 3.25 * 100 / (100 - 4.1) WHERE entry=761;
UPDATE item_enchantment_template SET chance = 5.23 * 100 / (100 - 6.03) WHERE entry=762;
UPDATE item_enchantment_template SET chance = 4.15 * 100 / (100 - 4.85) WHERE entry=763;
UPDATE item_enchantment_template SET chance = 2.08 * 100 / (100 - 5.36) WHERE entry=764;
UPDATE item_enchantment_template SET chance = 1.57 * 100 / (100 - 5.68) WHERE entry=765;
UPDATE item_enchantment_template SET chance = 5.37 * 100 / (100 - 0.56) WHERE entry=779;
UPDATE item_enchantment_template SET chance = 5.7 * 100 / (100 - 0.76) WHERE entry=780;
UPDATE item_enchantment_template SET chance = 5.5 * 100 / (100 - 0.46) WHERE entry=781;
UPDATE item_enchantment_template SET chance = 5.22 * 100 / (100 - 0.54) WHERE entry=782;
UPDATE item_enchantment_template SET chance = 9.53 * 100 / (100 - 1.8) WHERE entry=783;
UPDATE item_enchantment_template SET chance = 9.57 * 100 / (100 - 2.53) WHERE entry=784;
UPDATE item_enchantment_template SET chance = 4.92 * 100 / (100 - 1.69) WHERE entry=785;
UPDATE item_enchantment_template SET chance = 4.2 * 100 / (100 - 1.64) WHERE entry=786;
UPDATE item_enchantment_template SET chance = 3.2 * 100 / (100 - 16.3) WHERE entry=791;
UPDATE item_enchantment_template SET chance = 2.3 * 100 / (100 - 15.3) WHERE entry=792;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 14.56) WHERE entry=793;
UPDATE item_enchantment_template SET chance = 6.13 * 100 / (100 - 16) WHERE entry=794;
UPDATE item_enchantment_template SET chance = 5.63 * 100 / (100 - 15.2) WHERE entry=795;
UPDATE item_enchantment_template SET chance = 11.8 * 100 / (100 - 15.4) WHERE entry=796;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 14.6) WHERE entry=797;
UPDATE item_enchantment_template SET chance = 5.67 * 100 / (100 - 13.7) WHERE entry=798;
UPDATE item_enchantment_template SET chance = 5.82 * 100 / (100 - 13.68) WHERE entry=799;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 14.18) WHERE entry=800;
UPDATE item_enchantment_template SET chance = 5.63 * 100 / (100 - 14.26) WHERE entry=801;
UPDATE item_enchantment_template SET chance = 5 * 100 / (100 - 14.4) WHERE entry=802;
UPDATE item_enchantment_template SET chance = 3.67 * 100 / (100 - 16.92) WHERE entry=803;
UPDATE item_enchantment_template SET chance = 6.55 * 100 / (100 - 22) WHERE entry=804;
UPDATE item_enchantment_template SET chance = 6.4 * 100 / (100 - 23.2) WHERE entry=805;
UPDATE item_enchantment_template SET chance = 3.23 * 100 / (100 - 23.78) WHERE entry=806;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 23.36) WHERE entry=807;
UPDATE item_enchantment_template SET chance = 4.68 * 100 / (100 - 2.94) WHERE entry=813;
UPDATE item_enchantment_template SET chance = 4.32 * 100 / (100 - 2.8) WHERE entry=814;
UPDATE item_enchantment_template SET chance = 4.15 * 100 / (100 - 3.5) WHERE entry=815;
UPDATE item_enchantment_template SET chance = 3.9 * 100 / (100 - 3.66) WHERE entry=816;
UPDATE item_enchantment_template SET chance = 6.77 * 100 / (100 - 3.47) WHERE entry=817;
UPDATE item_enchantment_template SET chance = 7.37 * 100 / (100 - 2.97) WHERE entry=818;
UPDATE item_enchantment_template SET chance = 3.87 * 100 / (100 - 2.9) WHERE entry=819;
UPDATE item_enchantment_template SET chance = 4 * 100 / (100 - 2.46) WHERE entry=820;
UPDATE item_enchantment_template SET chance = 4.08 * 100 / (100 - 2.76) WHERE entry=821;
UPDATE item_enchantment_template SET chance = 4.25 * 100 / (100 - 2.16) WHERE entry=822;
UPDATE item_enchantment_template SET chance = 4.6 * 100 / (100 - 1.9) WHERE entry=823;
UPDATE item_enchantment_template SET chance = 4.36 * 100 / (100 - 2.52) WHERE entry=824;
UPDATE item_enchantment_template SET chance = 9.8 * 100 / (100 - 5.4) WHERE entry=825;
UPDATE item_enchantment_template SET chance = 9.45 * 100 / (100 - 4.85) WHERE entry=826;
UPDATE item_enchantment_template SET chance = 4.43 * 100 / (100 - 4.84) WHERE entry=827;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 4.36) WHERE entry=828;
UPDATE item_enchantment_template SET chance = 4.28 * 100 / (100 - 0.1) WHERE entry=834;
UPDATE item_enchantment_template SET chance = 3.93 * 100 / (100 - 0.2) WHERE entry=835;
UPDATE item_enchantment_template SET chance = 10.7 * 100 / (100 - 0.1) WHERE entry=838;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 3.36) WHERE entry=842;
UPDATE item_enchantment_template SET chance = 0.44 * 100 / (100 - 3.26) WHERE entry=843;
UPDATE item_enchantment_template SET chance = 2.48 * 100 / (100 - 3.44) WHERE entry=844;
UPDATE item_enchantment_template SET chance = 2.9 * 100 / (100 - 3.2) WHERE entry=845;
UPDATE item_enchantment_template SET chance = 5.65 * 100 / (100 - 6.2) WHERE entry=846;
UPDATE item_enchantment_template SET chance = 4.8 * 100 / (100 - 6.4) WHERE entry=847;
UPDATE item_enchantment_template SET chance = 2.82 * 100 / (100 - 7.71) WHERE entry=848;
UPDATE item_enchantment_template SET chance = 1.88 * 100 / (100 - 5.5) WHERE entry=849;
UPDATE item_enchantment_template SET chance = 4.05 * 100 / (100 - 15.4) WHERE entry=875;
UPDATE item_enchantment_template SET chance = 5.05 * 100 / (100 - 14.6) WHERE entry=876;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 13.1) WHERE entry=877;
UPDATE item_enchantment_template SET chance = 4.8 * 100 / (100 - 13.22) WHERE entry=878;
UPDATE item_enchantment_template SET chance = 4.9 * 100 / (100 - 12.38) WHERE entry=879;
UPDATE item_enchantment_template SET chance = 10 * 100 / (100 - 11.94) WHERE entry=880;
UPDATE item_enchantment_template SET chance = 10.3 * 100 / (100 - 11.27) WHERE entry=881;
UPDATE item_enchantment_template SET chance = 5.03 * 100 / (100 - 10.44) WHERE entry=882;
UPDATE item_enchantment_template SET chance = 4.98 * 100 / (100 - 12.24) WHERE entry=883;
UPDATE item_enchantment_template SET chance = 4.27 * 100 / (100 - 13.8) WHERE entry=884;
UPDATE item_enchantment_template SET chance = 3.77 * 100 / (100 - 13.26) WHERE entry=885;
UPDATE item_enchantment_template SET chance = 4.02 * 100 / (100 - 14.5) WHERE entry=886;
UPDATE item_enchantment_template SET chance = 4.35 * 100 / (100 - 14.3) WHERE entry=887;
UPDATE item_enchantment_template SET chance = 8.1 * 100 / (100 - 22.2) WHERE entry=888;
UPDATE item_enchantment_template SET chance = 8.3 * 100 / (100 - 23.6) WHERE entry=889;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 28.96) WHERE entry=890;
UPDATE item_enchantment_template SET chance = 4.4 * 100 / (100 - 26.04) WHERE entry=891;
UPDATE item_enchantment_template SET chance = 3.4 * 100 / (100 - 5.51) WHERE entry=896;
UPDATE item_enchantment_template SET chance = 3.95 * 100 / (100 - 4.7) WHERE entry=897;
UPDATE item_enchantment_template SET chance = 2.87 * 100 / (100 - 4.76) WHERE entry=898;
UPDATE item_enchantment_template SET chance = 3.05 * 100 / (100 - 3.8) WHERE entry=899;
UPDATE item_enchantment_template SET chance = 6.17 * 100 / (100 - 4.28) WHERE entry=900;
UPDATE item_enchantment_template SET chance = 8.4 * 100 / (100 - 4.15) WHERE entry=901;
UPDATE item_enchantment_template SET chance = 8.43 * 100 / (100 - 3.9) WHERE entry=902;
UPDATE item_enchantment_template SET chance = 3.78 * 100 / (100 - 3.64) WHERE entry=903;
UPDATE item_enchantment_template SET chance = 3.58 * 100 / (100 - 3.8) WHERE entry=904;
UPDATE item_enchantment_template SET chance = 3.25 * 100 / (100 - 3.64) WHERE entry=905;
UPDATE item_enchantment_template SET chance = 3.25 * 100 / (100 - 3.74) WHERE entry=906;
UPDATE item_enchantment_template SET chance = 3.23 * 100 / (100 - 3.12) WHERE entry=907;
UPDATE item_enchantment_template SET chance = 3.65 * 100 / (100 - 3.5) WHERE entry=908;
UPDATE item_enchantment_template SET chance = 6.4 * 100 / (100 - 4.91) WHERE entry=909;
UPDATE item_enchantment_template SET chance = 5.8 * 100 / (100 - 4.8) WHERE entry=910;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 4.6) WHERE entry=911;
UPDATE item_enchantment_template SET chance = 2.55 * 100 / (100 - 4.84) WHERE entry=912;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 0.69) WHERE entry=917;
UPDATE item_enchantment_template SET chance = 4.55 * 100 / (100 - 0.92) WHERE entry=918;
UPDATE item_enchantment_template SET chance = 5.05 * 100 / (100 - 0.86) WHERE entry=919;
UPDATE item_enchantment_template SET chance = 5.23 * 100 / (100 - 0.9) WHERE entry=920;
UPDATE item_enchantment_template SET chance = 5.33 * 100 / (100 - 1) WHERE entry=921;
UPDATE item_enchantment_template SET chance = 10.9 * 100 / (100 - 0.75) WHERE entry=922;
UPDATE item_enchantment_template SET chance = 11.1 * 100 / (100 - 0.85) WHERE entry=923;
UPDATE item_enchantment_template SET chance = 5.3 * 100 / (100 - 0.66) WHERE entry=924;
UPDATE item_enchantment_template SET chance = 5.57 * 100 / (100 - 0.6) WHERE entry=925;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 4.12) WHERE entry=926;
UPDATE item_enchantment_template SET chance = 2.65 * 100 / (100 - 5.2) WHERE entry=927;
UPDATE item_enchantment_template SET chance = 2.82 * 100 / (100 - 4.26) WHERE entry=928;
UPDATE item_enchantment_template SET chance = 2.68 * 100 / (100 - 4.36) WHERE entry=929;
UPDATE item_enchantment_template SET chance = 4.95 * 100 / (100 - 6.2) WHERE entry=930;
UPDATE item_enchantment_template SET chance = 5.13 * 100 / (100 - 7.17) WHERE entry=931;
UPDATE item_enchantment_template SET chance = 2.77 * 100 / (100 - 5.6) WHERE entry=932;
UPDATE item_enchantment_template SET chance = 2.03 * 100 / (100 - 5) WHERE entry=933;
UPDATE item_enchantment_template SET chance = 5.48 * 100 / (100 - 0.64) WHERE entry=947;
UPDATE item_enchantment_template SET chance = 5.63 * 100 / (100 - 0.84) WHERE entry=948;
UPDATE item_enchantment_template SET chance = 5.82 * 100 / (100 - 0.94) WHERE entry=949;
UPDATE item_enchantment_template SET chance = 5.38 * 100 / (100 - 0.64) WHERE entry=950;
UPDATE item_enchantment_template SET chance = 9.67 * 100 / (100 - 1.83) WHERE entry=951;
UPDATE item_enchantment_template SET chance = 8.83 * 100 / (100 - 1.63) WHERE entry=952;
UPDATE item_enchantment_template SET chance = 4.1 * 100 / (100 - 2.13) WHERE entry=953;
UPDATE item_enchantment_template SET chance = 3.85 * 100 / (100 - 1.3) WHERE entry=954;
UPDATE item_enchantment_template SET chance = 1.97 * 100 / (100 - 35) WHERE entry=959;
UPDATE item_enchantment_template SET chance = 2.57 * 100 / (100 - 30.44) WHERE entry=960;
UPDATE item_enchantment_template SET chance = 2.72 * 100 / (100 - 28.72) WHERE entry=961;
UPDATE item_enchantment_template SET chance = 3.15 * 100 / (100 - 28.5) WHERE entry=962;
UPDATE item_enchantment_template SET chance = 6.65 * 100 / (100 - 29.85) WHERE entry=963;
UPDATE item_enchantment_template SET chance = 6.2 * 100 / (100 - 31.06) WHERE entry=964;
UPDATE item_enchantment_template SET chance = 3.18 * 100 / (100 - 27.4) WHERE entry=965;
UPDATE item_enchantment_template SET chance = 3.37 * 100 / (100 - 27.42) WHERE entry=966;
UPDATE item_enchantment_template SET chance = 3.17 * 100 / (100 - 25.84) WHERE entry=967;
UPDATE item_enchantment_template SET chance = 2.93 * 100 / (100 - 29.2) WHERE entry=968;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 30.41) WHERE entry=969;
UPDATE item_enchantment_template SET chance = 6.3 * 100 / (100 - 28.55) WHERE entry=970;
UPDATE item_enchantment_template SET chance = 5.55 * 100 / (100 - 30.25) WHERE entry=971;
UPDATE item_enchantment_template SET chance = 3.3 * 100 / (100 - 23.88) WHERE entry=972;
UPDATE item_enchantment_template SET chance = 3.35 * 100 / (100 - 27.66) WHERE entry=973;
UPDATE item_enchantment_template SET chance = 3.52 * 100 / (100 - 27.62) WHERE entry=974;
UPDATE item_enchantment_template SET chance = 5.75 * 100 / (100 - 27.9) WHERE entry=975;
UPDATE item_enchantment_template SET chance = 2.85 * 100 / (100 - 7.3) WHERE entry=980;
UPDATE item_enchantment_template SET chance = 4.2 * 100 / (100 - 5.3) WHERE entry=981;
UPDATE item_enchantment_template SET chance = 4.2 * 100 / (100 - 6.42) WHERE entry=982;
UPDATE item_enchantment_template SET chance = 4.65 * 100 / (100 - 6.5) WHERE entry=983;
UPDATE item_enchantment_template SET chance = 9 * 100 / (100 - 6.5) WHERE entry=984;
UPDATE item_enchantment_template SET chance = 8.95 * 100 / (100 - 6.5) WHERE entry=985;
UPDATE item_enchantment_template SET chance = 9.37 * 100 / (100 - 7.16) WHERE entry=986;
UPDATE item_enchantment_template SET chance = 3.53 * 100 / (100 - 5.86) WHERE entry=987;
UPDATE item_enchantment_template SET chance = 3.38 * 100 / (100 - 6.76) WHERE entry=988;
UPDATE item_enchantment_template SET chance = 3.83 * 100 / (100 - 6.68) WHERE entry=989;
UPDATE item_enchantment_template SET chance = 7.2 * 100 / (100 - 7.47) WHERE entry=990;
UPDATE item_enchantment_template SET chance = 7.35 * 100 / (100 - 8.35) WHERE entry=991;
UPDATE item_enchantment_template SET chance = 7.08 * 100 / (100 - 7.56) WHERE entry=992;
UPDATE item_enchantment_template SET chance = 3.5 * 100 / (100 - 8.86) WHERE entry=993;
UPDATE item_enchantment_template SET chance = 4.15 * 100 / (100 - 8.9) WHERE entry=994;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 7.68) WHERE entry=995;
UPDATE item_enchantment_template SET chance = 9.3 * 100 / (100 - 6.2) WHERE entry=996;
UPDATE item_enchantment_template SET chance = 3.6 * 100 / (100 - 1.2) WHERE entry=1002;
UPDATE item_enchantment_template SET chance = 4.15 * 100 / (100 - 1) WHERE entry=1003;
UPDATE item_enchantment_template SET chance = 5.55 * 100 / (100 - 1.3) WHERE entry=1004;
UPDATE item_enchantment_template SET chance = 10.2 * 100 / (100 - 1.1) WHERE entry=1005;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 1.15) WHERE entry=1006;
UPDATE item_enchantment_template SET chance = 11.87 * 100 / (100 - 1.26) WHERE entry=1007;
UPDATE item_enchantment_template SET chance = 4.58 * 100 / (100 - 1.16) WHERE entry=1008;
UPDATE item_enchantment_template SET chance = 4.87 * 100 / (100 - 1) WHERE entry=1009;
UPDATE item_enchantment_template SET chance = 2.88 * 100 / (100 - 3.1) WHERE entry=1010;
UPDATE item_enchantment_template SET chance = 5.82 * 100 / (100 - 3.32) WHERE entry=1011;
UPDATE item_enchantment_template SET chance = 5.45 * 100 / (100 - 3.35) WHERE entry=1012;
UPDATE item_enchantment_template SET chance = 5.7 * 100 / (100 - 3) WHERE entry=1013;
UPDATE item_enchantment_template SET chance = 2.73 * 100 / (100 - 3.8) WHERE entry=1014;
UPDATE item_enchantment_template SET chance = 3.25 * 100 / (100 - 3.8) WHERE entry=1015;
UPDATE item_enchantment_template SET chance = 3.77 * 100 / (100 - 3.3) WHERE entry=1016;
UPDATE item_enchantment_template SET chance = 8.8 * 100 / (100 - 3.7) WHERE entry=1017;
UPDATE item_enchantment_template SET chance = 3.55 * 100 / (100 - 32.3) WHERE entry=1043;
UPDATE item_enchantment_template SET chance = 3.05 * 100 / (100 - 28.9) WHERE entry=1044;
UPDATE item_enchantment_template SET chance = 2.81 * 100 / (100 - 34.64) WHERE entry=1045;
UPDATE item_enchantment_template SET chance = 6.7 * 100 / (100 - 32.25) WHERE entry=1047;
UPDATE item_enchantment_template SET chance = 7.05 * 100 / (100 - 29.33) WHERE entry=1048;
UPDATE item_enchantment_template SET chance = 4 * 100 / (100 - 29.76) WHERE entry=1049;
UPDATE item_enchantment_template SET chance = 4.1 * 100 / (100 - 26.4) WHERE entry=1050;
UPDATE item_enchantment_template SET chance = 4.33 * 100 / (100 - 26.87) WHERE entry=1051;
UPDATE item_enchantment_template SET chance = 4.38 * 100 / (100 - 26.18) WHERE entry=1052;
UPDATE item_enchantment_template SET chance = 7.67 * 100 / (100 - 26.57) WHERE entry=1053;
UPDATE item_enchantment_template SET chance = 7.15 * 100 / (100 - 26.95) WHERE entry=1054;
UPDATE item_enchantment_template SET chance = 7.27 * 100 / (100 - 27.56) WHERE entry=1055;
UPDATE item_enchantment_template SET chance = 3.5 * 100 / (100 - 23.84) WHERE entry=1056;
UPDATE item_enchantment_template SET chance = 3.33 * 100 / (100 - 25.74) WHERE entry=1057;
UPDATE item_enchantment_template SET chance = 3.9 * 100 / (100 - 25.5) WHERE entry=1058;
UPDATE item_enchantment_template SET chance = 5.7 * 100 / (100 - 28.99) WHERE entry=1059;
UPDATE item_enchantment_template SET chance = 3.7 * 100 / (100 - 7.6) WHERE entry=1064;
UPDATE item_enchantment_template SET chance = 3.45 * 100 / (100 - 8) WHERE entry=1065;
UPDATE item_enchantment_template SET chance = 3.5 * 100 / (100 - 7.66) WHERE entry=1066;
UPDATE item_enchantment_template SET chance = 3.1 * 100 / (100 - 8.1) WHERE entry=1067;
UPDATE item_enchantment_template SET chance = 7.05 * 100 / (100 - 7.52) WHERE entry=1068;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 9.43) WHERE entry=1069;
UPDATE item_enchantment_template SET chance = 3.63 * 100 / (100 - 7.06) WHERE entry=1070;
UPDATE item_enchantment_template SET chance = 4.75 * 100 / (100 - 5.2) WHERE entry=1071;
UPDATE item_enchantment_template SET chance = 4.12 * 100 / (100 - 7.16) WHERE entry=1072;
UPDATE item_enchantment_template SET chance = 3.75 * 100 / (100 - 6.02) WHERE entry=1073;
UPDATE item_enchantment_template SET chance = 6.67 * 100 / (100 - 6.07) WHERE entry=1074;
UPDATE item_enchantment_template SET chance = 6.7 * 100 / (100 - 5.93) WHERE entry=1075;
UPDATE item_enchantment_template SET chance = 8 * 100 / (100 - 5.4) WHERE entry=1076;
UPDATE item_enchantment_template SET chance = 4.33 * 100 / (100 - 5.54) WHERE entry=1077;
UPDATE item_enchantment_template SET chance = 4.92 * 100 / (100 - 5.96) WHERE entry=1078;
UPDATE item_enchantment_template SET chance = 5.07 * 100 / (100 - 5.87) WHERE entry=1079;
UPDATE item_enchantment_template SET chance = 9 * 100 / (100 - 5.8) WHERE entry=1080;
UPDATE item_enchantment_template SET chance = 4.2 * 100 / (100 - 1.06) WHERE entry=1085;
UPDATE item_enchantment_template SET chance = 3.23 * 100 / (100 - 0.8) WHERE entry=1086;
UPDATE item_enchantment_template SET chance = 4.9 * 100 / (100 - 0.7) WHERE entry=1087;
UPDATE item_enchantment_template SET chance = 4.45 * 100 / (100 - 0.86) WHERE entry=1088;
UPDATE item_enchantment_template SET chance = 9.83 * 100 / (100 - 0.5) WHERE entry=1089;
UPDATE item_enchantment_template SET chance = 10.67 * 100 / (100 - 0.43) WHERE entry=1090;
UPDATE item_enchantment_template SET chance = 5.47 * 100 / (100 - 0.56) WHERE entry=1091;
UPDATE item_enchantment_template SET chance = 5.19 * 100 / (100 - 0.46) WHERE entry=1092;
UPDATE item_enchantment_template SET chance = 5.83 * 100 / (100 - 0.5) WHERE entry=1093;
UPDATE item_enchantment_template SET chance = 2.76 * 100 / (100 - 5.9) WHERE entry=1094;
UPDATE item_enchantment_template SET chance = 4.7 * 100 / (100 - 6.55) WHERE entry=1095;
UPDATE item_enchantment_template SET chance = 5.5 * 100 / (100 - 5.95) WHERE entry=1096;
UPDATE item_enchantment_template SET chance = 4.88 * 100 / (100 - 6.05) WHERE entry=1097;
UPDATE item_enchantment_template SET chance = 2.3 * 100 / (100 - 6.1) WHERE entry=1098;
UPDATE item_enchantment_template SET chance = 2.85 * 100 / (100 - 6.6) WHERE entry=1099;
UPDATE item_enchantment_template SET chance = 3.1 * 100 / (100 - 5.52) WHERE entry=1100;
UPDATE item_enchantment_template SET chance = 6.8 * 100 / (100 - 5.13) WHERE entry=1101;
UPDATE item_enchantment_template SET chance = 4.93 * 100 / (100 - 0.56) WHERE entry=1115;
UPDATE item_enchantment_template SET chance = 10.17 * 100 / (100 - 0.67) WHERE entry=1116;
UPDATE item_enchantment_template SET chance = 9.4 * 100 / (100 - 0.45) WHERE entry=1117;
UPDATE item_enchantment_template SET chance = 10.35 * 100 / (100 - 0.63) WHERE entry=1118;
UPDATE item_enchantment_template SET chance = 4.1 * 100 / (100 - 0.7) WHERE entry=1119;
UPDATE item_enchantment_template SET chance = 4.42 * 100 / (100 - 0.46) WHERE entry=1120;
UPDATE item_enchantment_template SET chance = 3.85 * 100 / (100 - 0.76) WHERE entry=1121;
UPDATE item_enchantment_template SET chance = 8.5 * 100 / (100 - 0.6) WHERE entry=1122;
UPDATE item_enchantment_template SET chance = 4.63 * 100 / (100 - 15.84) WHERE entry=1131;
UPDATE item_enchantment_template SET chance = 9.23 * 100 / (100 - 15.07) WHERE entry=1132;
UPDATE item_enchantment_template SET chance = 11.1 * 100 / (100 - 12.45) WHERE entry=1133;
UPDATE item_enchantment_template SET chance = 5.57 * 100 / (100 - 11.6) WHERE entry=1134;
UPDATE item_enchantment_template SET chance = 4.25 * 100 / (100 - 12.36) WHERE entry=1135;
UPDATE item_enchantment_template SET chance = 4.07 * 100 / (100 - 14.4) WHERE entry=1136;
UPDATE item_enchantment_template SET chance = 3.82 * 100 / (100 - 13.3) WHERE entry=1137;
UPDATE item_enchantment_template SET chance = 3.58 * 100 / (100 - 15.3) WHERE entry=1138;
UPDATE item_enchantment_template SET chance = 3.58 * 100 / (100 - 16.15) WHERE entry=1139;
UPDATE item_enchantment_template SET chance = 6.3 * 100 / (100 - 25.8) WHERE entry=1140;
UPDATE item_enchantment_template SET chance = 6 * 100 / (100 - 27.3) WHERE entry=1141;
UPDATE item_enchantment_template SET chance = 3.48 * 100 / (100 - 26.44) WHERE entry=1142;
UPDATE item_enchantment_template SET chance = 2.4 * 100 / (100 - 25.91) WHERE entry=1143;
UPDATE item_enchantment_template SET chance = 5.05 * 100 / (100 - 3) WHERE entry=1152;
UPDATE item_enchantment_template SET chance = 6.77 * 100 / (100 - 3.73) WHERE entry=1153;
UPDATE item_enchantment_template SET chance = 6.37 * 100 / (100 - 3.2) WHERE entry=1154;
UPDATE item_enchantment_template SET chance = 3.43 * 100 / (100 - 2.86) WHERE entry=1155;
UPDATE item_enchantment_template SET chance = 2.98 * 100 / (100 - 2.9) WHERE entry=1156;
UPDATE item_enchantment_template SET chance = 3.64 * 100 / (100 - 2.64) WHERE entry=1157;
UPDATE item_enchantment_template SET chance = 3.1 * 100 / (100 - 2.56) WHERE entry=1158;
UPDATE item_enchantment_template SET chance = 2.68 * 100 / (100 - 3.1) WHERE entry=1159;
UPDATE item_enchantment_template SET chance = 3 * 100 / (100 - 2.66) WHERE entry=1160;
UPDATE item_enchantment_template SET chance = 8.65 * 100 / (100 - 6.75) WHERE entry=1161;
UPDATE item_enchantment_template SET chance = 9.2 * 100 / (100 - 5.95) WHERE entry=1162;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 5.56) WHERE entry=1163;
UPDATE item_enchantment_template SET chance = 3.82 * 100 / (100 - 4.8) WHERE entry=1164;
UPDATE item_enchantment_template SET chance = 2.68 * 100 / (100 - 3.1) WHERE entry=1178;
UPDATE item_enchantment_template SET chance = 2.03 * 100 / (100 - 3.44) WHERE entry=1179;
UPDATE item_enchantment_template SET chance = 1.9 * 100 / (100 - 3.2) WHERE entry=1180;
UPDATE item_enchantment_template SET chance = 1.73 * 100 / (100 - 3.64) WHERE entry=1181;
UPDATE item_enchantment_template SET chance = 5.17 * 100 / (100 - 8.23) WHERE entry=1182;
UPDATE item_enchantment_template SET chance = 4.3 * 100 / (100 - 8) WHERE entry=1183;
UPDATE item_enchantment_template SET chance = 2.43 * 100 / (100 - 8) WHERE entry=1184;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 5.5) WHERE entry=1185;
UPDATE item_enchantment_template SET chance = 3.85 * 100 / (100 - 24.8) WHERE entry=1996;
UPDATE item_enchantment_template SET chance = 5.3 * 100 / (100 - 0.1) WHERE entry=1998;
UPDATE item_enchantment_template SET chance = 3.65 * 100 / (100 - 21.9) WHERE entry=2002;
UPDATE item_enchantment_template SET chance = 3.82 * 100 / (100 - 21.38) WHERE entry=2008;
UPDATE item_enchantment_template SET chance = 7.47 * 100 / (100 - 21.27) WHERE entry=2014;
UPDATE item_enchantment_template SET chance = 7.52 * 100 / (100 - 20.83) WHERE entry=2020;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 0.1) WHERE entry=2022;
UPDATE item_enchantment_template SET chance = 3.63 * 100 / (100 - 21.83) WHERE entry=2026;
UPDATE item_enchantment_template SET chance = 3.63 * 100 / (100 - 20.04) WHERE entry=2032;
UPDATE item_enchantment_template SET chance = 3.55 * 100 / (100 - 20.88) WHERE entry=2038;
UPDATE item_enchantment_template SET chance = 3.59 * 100 / (100 - 20.6) WHERE entry=2044;
UPDATE item_enchantment_template SET chance = 6.73 * 100 / (100 - 20.7) WHERE entry=2050;
UPDATE item_enchantment_template SET chance = 7.04 * 100 / (100 - 19.8) WHERE entry=2056;
UPDATE item_enchantment_template SET chance = 6.87 * 100 / (100 - 20.14) WHERE entry=2062;
UPDATE item_enchantment_template SET chance = 9.98 * 100 / (100 - 0.1) WHERE entry=2064;
UPDATE item_enchantment_template SET chance = 3.58 * 100 / (100 - 18.52) WHERE entry=2068;
UPDATE item_enchantment_template SET chance = 3.75 * 100 / (100 - 20.52) WHERE entry=2074;
UPDATE item_enchantment_template SET chance = 3.65 * 100 / (100 - 19.83) WHERE entry=2080;
UPDATE item_enchantment_template SET chance = 3.55 * 100 / (100 - 0.3) WHERE entry=2084;
UPDATE item_enchantment_template SET chance = 7.88 * 100 / (100 - 27.1) WHERE entry=2086;
UPDATE item_enchantment_template SET chance = 7.1 * 100 / (100 - 0.2) WHERE entry=2090;
UPDATE item_enchantment_template SET chance = 7.73 * 100 / (100 - 27.46) WHERE entry=2092;
UPDATE item_enchantment_template SET chance = 6.55 * 100 / (100 - 0.4) WHERE entry=2094;
UPDATE item_enchantment_template SET chance = 6.05 * 100 / (100 - 0.2) WHERE entry=2134;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 0.2) WHERE entry=3255;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 0.3) WHERE entry=3272;
UPDATE item_enchantment_template SET chance = 3.2 * 100 / (100 - 0.1) WHERE entry=3281;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 0.1) WHERE entry=3289;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 0.2) WHERE entry=3309;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 0.3) WHERE entry=3310;
UPDATE item_enchantment_template SET chance = 3.65 * 100 / (100 - 0.2) WHERE entry=3461;
UPDATE item_enchantment_template SET chance = 1.25 * 100 / (100 - 0.4) WHERE entry=3462;
UPDATE item_enchantment_template SET chance = 5.75 * 100 / (100 - 0.1) WHERE entry=3548;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 0.7) WHERE entry=5168;
UPDATE item_enchantment_template SET chance = 28.3 * 100 / (100 - 0.4) WHERE entry=5169;
UPDATE item_enchantment_template SET chance = 15.4 * 100 / (100 - 34.09) WHERE entry=5170;
UPDATE item_enchantment_template SET chance = 9.33 * 100 / (100 - 36.13) WHERE entry=5171;
UPDATE item_enchantment_template SET chance = 1.48 * 100 / (100 - 0.2) WHERE entry=5173;
UPDATE item_enchantment_template SET chance = 3.05 * 100 / (100 - 0.3) WHERE entry=5174;
UPDATE item_enchantment_template SET chance = 3.08 * 100 / (100 - 0.1) WHERE entry=5175;
UPDATE item_enchantment_template SET chance = 2.2 * 100 / (100 - 24.2) WHERE entry=5176;
UPDATE item_enchantment_template SET chance = 29.32 * 100 / (100 - 0.3) WHERE entry=5177;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 32.5) WHERE entry=5179;
UPDATE item_enchantment_template SET chance = 10.4 * 100 / (100 - 33.6) WHERE entry=5180;
UPDATE item_enchantment_template SET chance = 1.22 * 100 / (100 - 0.3) WHERE entry=5183;
UPDATE item_enchantment_template SET chance = 9.35 * 100 / (100 - 31.87) WHERE entry=5188;
UPDATE item_enchantment_template SET chance = 4.45 * 100 / (100 - 36.37) WHERE entry=5189;
UPDATE item_enchantment_template SET chance = 1.45 * 100 / (100 - 23.94) WHERE entry=5194;
UPDATE item_enchantment_template SET chance = 2.9 * 100 / (100 - 0.5) WHERE entry=5196;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 15.53) WHERE entry=5197;
UPDATE item_enchantment_template SET chance = 2.7 * 100 / (100 - 0.2) WHERE entry=5201;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 16.1) WHERE entry=5206;
UPDATE item_enchantment_template SET chance = 3.2 * 100 / (100 - 22) WHERE entry=5207;
UPDATE item_enchantment_template SET chance = 3.8 * 100 / (100 - 0.1) WHERE entry=5211;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 21.57) WHERE entry=5212;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 22.65) WHERE entry=5216;
UPDATE item_enchantment_template SET chance = 2.35 * 100 / (100 - 0.1) WHERE entry=5218;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 0.2) WHERE entry=5219;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 22.84) WHERE entry=5221;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 15.09) WHERE entry=5224;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 0.52) WHERE entry=5232;
UPDATE item_enchantment_template SET chance = 1.7 * 100 / (100 - 17.92) WHERE entry=5234;
UPDATE item_enchantment_template SET chance = 2.35 * 100 / (100 - 0.2) WHERE entry=5236;
UPDATE item_enchantment_template SET chance = 0.03 * 100 / (100 - 0.47) WHERE entry=5238;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 22.44) WHERE entry=5239;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 0.6) WHERE entry=5240;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 0.52) WHERE entry=5241;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 15.58) WHERE entry=5242;
UPDATE item_enchantment_template SET chance = 4.5 * 100 / (100 - 16.12) WHERE entry=5251;
UPDATE item_enchantment_template SET chance = 3.5 * 100 / (100 - 19.01) WHERE entry=5252;
UPDATE item_enchantment_template SET chance = 3.8 * 100 / (100 - 17.02) WHERE entry=5253;
UPDATE item_enchantment_template SET chance = 2.3 * 100 / (100 - 0.38) WHERE entry=5254;
UPDATE item_enchantment_template SET chance = 1.7 * 100 / (100 - 0.3) WHERE entry=5255;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 23.86) WHERE entry=5257;
UPDATE item_enchantment_template SET chance = 1.7 * 100 / (100 - 18.5) WHERE entry=5261;
UPDATE item_enchantment_template SET chance = 3.8 * 100 / (100 - 16.9) WHERE entry=5262;
UPDATE item_enchantment_template SET chance = 1.53 * 100 / (100 - 23.1) WHERE entry=5266;
UPDATE item_enchantment_template SET chance = 4.23 * 100 / (100 - 0.1) WHERE entry=5268;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 14.8) WHERE entry=5269;
UPDATE item_enchantment_template SET chance = 3.5 * 100 / (100 - 18.5) WHERE entry=5270;
UPDATE item_enchantment_template SET chance = 3.05 * 100 / (100 - 0.3) WHERE entry=5274;
UPDATE item_enchantment_template SET chance = 4.7 * 100 / (100 - 14.3) WHERE entry=5278;
UPDATE item_enchantment_template SET chance = 3.3 * 100 / (100 - 18.2) WHERE entry=5279;
UPDATE item_enchantment_template SET chance = 2.1 * 100 / (100 - 16.45) WHERE entry=5280;
UPDATE item_enchantment_template SET chance = 3.45 * 100 / (100 - 0.1) WHERE entry=5282;
UPDATE item_enchantment_template SET chance = 2.3 * 100 / (100 - 31.1) WHERE entry=5287;
UPDATE item_enchantment_template SET chance = 4.1 * 100 / (100 - 16.69) WHERE entry=5289;
UPDATE item_enchantment_template SET chance = 2.32 * 100 / (100 - 24.85) WHERE entry=5293;
UPDATE item_enchantment_template SET chance = 4.8 * 100 / (100 - 15.72) WHERE entry=5296;
UPDATE item_enchantment_template SET chance = 2.75 * 100 / (100 - 18.56) WHERE entry=5298;
UPDATE item_enchantment_template SET chance = 3.15 * 100 / (100 - 0.1) WHERE entry=5301;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 0.1) WHERE entry=5303;
UPDATE item_enchantment_template SET chance = 4.8 * 100 / (100 - 20) WHERE entry=5307;
UPDATE item_enchantment_template SET chance = 3.2 * 100 / (100 - 0.1) WHERE entry=5309;
UPDATE item_enchantment_template SET chance = 2.18 * 100 / (100 - 25.82) WHERE entry=5311;
UPDATE item_enchantment_template SET chance = 2.6 * 100 / (100 - 0.2) WHERE entry=5312;
UPDATE item_enchantment_template SET chance = 3 * 100 / (100 - 0.1) WHERE entry=5313;
UPDATE item_enchantment_template SET chance = 2.55 * 100 / (100 - 17.18) WHERE entry=5315;
UPDATE item_enchantment_template SET chance = 3.55 * 100 / (100 - 0.1) WHERE entry=5317;
UPDATE item_enchantment_template SET chance = 3.02 * 100 / (100 - 0.2) WHERE entry=5319;
UPDATE item_enchantment_template SET chance = 3.7 * 100 / (100 - 13.8) WHERE entry=5324;
UPDATE item_enchantment_template SET chance = 5.7 * 100 / (100 - 20.5) WHERE entry=5850;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 0.1) WHERE entry=5852;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 0.12) WHERE entry=5853;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 0.1) WHERE entry=5859;
UPDATE item_enchantment_template SET chance = 3.58 * 100 / (100 - 23.14) WHERE entry=6272;
UPDATE item_enchantment_template SET chance = 7.8 * 100 / (100 - 26.55) WHERE entry=6273;
UPDATE item_enchantment_template SET chance = 9.1 * 100 / (100 - 0.1) WHERE entry=6278;
UPDATE item_enchantment_template SET chance = 4.7 * 100 / (100 - 0.1) WHERE entry=6279;
-- TODO: We need `Disabled` field here, as well:
DELETE FROM item_enchantment_template WHERE ench IN (1799, 1800, 1801, 1802, 1803, 1804, 1805, 1806, 1807, 1808, 1809, 1810, 1811, 1812, 1813, 1814, 1815, 1816, 1817, 1818, 1819, 1820, 1821, 1822, 1823, 1824, 1825, 1826, 1827, 1828, 1829, 1830, 1831, 1832, 1833, 1834, 1835, 1836, 1837, 1838, 1839, 1840, 1841, 1842, 1843, 1844, 1845, 1846, 1847, 1848, 1849, 1850, 1851, 1852, 1853, 1854, 1855, 1856, 1857, 1858, 1859, 1860, 1861, 1862, 1863, 1864, 1865, 1866, 1867, 1868, 1869, 1870, 1871, 1872, 1873, 1874, 1875, 1876, 1877, 1878, 1879, 1880, 1881, 1882, 1883, 1884, 1885, 1886, 1887, 1888, 1889, 1890, 1891, 1892, 1893, 1894, 1895, 1896, 1897, 1898, 1899, 1900, 1901, 1902, 1903, 1904, 1905, 1906, 1907, 1908, 1909, 1910, 1911, 1912, 1913, 1914, 1915, 1916, 1917, 1918, 1919, 1920, 1921, 1922, 1923, 1924, 1925, 1926, 1927, 1928, 1929, 1930, 1931, 1932, 1933, 1934, 1935, 1936, 1937, 1938, 1939, 1940, 1941, 1942, 1943, 1944, 1945, 1946, 1947, 1948, 1949, 1950, 1951, 1952, 1953, 1954, 1955, 1956, 1957, 1958, 1959, 1960, 1961, 1962, 1963, 1964, 1965, 1966, 1967, 1968, 1969, 1970, 1971, 1972, 1973, 1974, 1975, 1976, 1977, 1978, 1979, 1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025, 2026, 2027, 2028, 2029, 2030, 2031, 2032, 2033, 2034, 2035, 2036, 2037, 2038, 2039, 2040, 2041, 2042, 2043, 2044, 2045, 2046, 2047, 2048, 2049, 2050, 2051, 2052, 2053, 2054, 2055, 2056, 2057, 2058, 2059, 2060, 2061, 2062, 2063, 2064, 39, 40, 41, 42, 43, 44, 45, 46, 47, 52, 53, 54, 56, 57, 58, 59, 60, 63, 66, 67, 68, 69, 70, 71, 72, 73, 75, 81, 82, 83, 84, 85, 86, 87, 88, 90, 100, 101, 102, 103, 104, 105, 106, 107, 109, 120, 121, 122, 123, 124, 125, 126, 127, 129, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148) AND entry NOT IN (8652);
-- Pre-1.04 Green Lens (Clank)
DELETE FROM item_enchantment_template WHERE entry=8652;
INSERT INTO item_enchantment_template VALUE (8652, 341, 10);
INSERT INTO item_enchantment_template VALUE (8652, 342, 10);
INSERT INTO item_enchantment_template VALUE (8652, 392, 10);
INSERT INTO item_enchantment_template VALUE (8652, 393, 10);
INSERT INTO item_enchantment_template VALUE (8652, 798, 10);
INSERT INTO item_enchantment_template VALUE (8652, 799, 10);
INSERT INTO item_enchantment_template VALUE (8652, 881, 10);
INSERT INTO item_enchantment_template VALUE (8652, 882, 10);
INSERT INTO item_enchantment_template VALUE (8652, 1052, 10);
INSERT INTO item_enchantment_template VALUE (8652, 1053, 10);
			
-- * SPELLS		 	

-- Zanza's Potent Potables
REPLACE INTO `spell_mod` (`Id`, `AttributesEx3`, `Comment`) VALUE 
(24382, 1048576, 'Spirit of Zanza - persist through death (before 1.12)'),
(24417, 1048576, 'Sheen of Zanza - persist through death (before 1.12)'),
(24383, 1048576, 'Swiftness of Zanza - persist through death (before 1.12)');
-- Disable recipes + resulting food spells, 1.9 oils & [Rumsey Rum] spell
REPLACE INTO `spell_disabled` VALUE (24800);
REPLACE INTO `spell_disabled` VALUE (24801);
REPLACE INTO `spell_disabled` VALUE (25117);
REPLACE INTO `spell_disabled` VALUE (25118);
REPLACE INTO `spell_disabled` VALUE (25119);
REPLACE INTO `spell_disabled` VALUE (25120);
REPLACE INTO `spell_disabled` VALUE (25123);
REPLACE INTO `spell_disabled` VALUE (25122);
REPLACE INTO `spell_disabled` VALUE (25121);
REPLACE INTO `spell_disabled` VALUE (25660);
REPLACE INTO `spell_disabled` VALUE (25704);
REPLACE INTO `spell_disabled` VALUE (25722);
REPLACE INTO `spell_disabled` VALUE (25804);
REPLACE INTO `spell_disabled` VALUE (25691);
REPLACE INTO `spell_disabled` VALUE (26276);
REPLACE INTO `spell_disabled` VALUE (26278);
REPLACE INTO `spell_disabled` VALUE (26277);
-- Paladin Charger
REPLACE INTO `spell_disabled` VALUE (23214); 
-- Warlock Dreadsteed
REPLACE INTO `spell_disabled` VALUE (23161); 

-- * GAMEOBJECTS

-- GO "Sothos and Jarien's Heirlooms" Has Been Removed
-- Need to SET ModelID to somethin invisible instead but not delete.
DELETE FROM `gameobject` WHERE `id` = 181083;

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

-- TODO: Would be nice to have something like `DropDisable` field aka LootMode of TrinityCore to avoid any deletions from *loot_templates: A special parameter used for separating conditional loot, such as Hard Mode loot. A lootmode of 0 will effectively disable a loot entry (its roll will always fail). This column is a bitmask, so you shouldn't duplicate loot across lootmodes. The active lootmode(s) can be changed at any time by the core. This column should only be used if required, in most cases it should be left as 1. Valid lootmodes include: 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 16384, 32768.
-- https://trinitycore.atlassian.net/wiki/display/tc/loot_template#loot_template-ChanceOrQuestChance
