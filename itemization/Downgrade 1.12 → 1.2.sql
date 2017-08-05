
-- This is supposed to be an initial downgrading patch from 1.12 to 1.2 DB for use with future upgrading transition patches.
-- Apply it on the clean 1.12 DB only, with all latest migrations from /server/sql/migrations

DROP TABLE IF EXISTS `forbidden_items`;
DROP TABLE IF EXISTS `forbidden_events`;
DROP TABLE IF EXISTS `forbidden_quests`;
DROP TABLE IF EXISTS `forbidden_creatures`;
DROP TABLE IF EXISTS `forbidden_instances`;

CREATE TABLE IF NOT EXISTS `forbidden_quests` (entry mediumint PRIMARY KEY);
CREATE TABLE IF NOT EXISTS `forbidden_items` (entry mediumint PRIMARY KEY);
CREATE TABLE IF NOT EXISTS `forbidden_events` (entry mediumint PRIMARY KEY);
CREATE TABLE IF NOT EXISTS `forbidden_creatures` (entry mediumint PRIMARY KEY);
CREATE TABLE IF NOT EXISTS `forbidden_instances` (entry mediumint PRIMARY KEY);

-- * INDEX
-- - 1.  FORBIDDEN ENCOUNTER				 
-- - 2.  FORBIDDEN EVENTS 					          
-- - 3.  FORBIDDEN ITEMS 		  
-- - 4.  ITEMS AND LOOT		 	      
-- - 5.  VENDORS 
-- - 6.  FORBIDDEN CREATURES			
-- - 7.  CREATURES	
-- - 8.  FORBIDDEN QUESTS			
-- - 9.  QUESTS					
-- - 10. PROFESSIONS
-- - 11. FORBIDDEN SPELLS				
-- - 12. SPELLS			 		
-- - 13. GAMEOBJECTS	
-- - 14. CLEANUP TOOLS	

-- * FORBIDDEN ENCOUNTER

REPLACE INTO forbidden_instances SELECT entry FROM areatrigger_teleport WHERE target_map IN (
533,   -- Naxxramas 1.12
531,   -- AQ40 (Temple of AQ) 1.9
509,   -- AQ20 (Ruins of AQ) 1.9
429,   -- Dire Maul 1.3
309,   -- Zul'Gurub 1.7
469    -- Blackwing Lair 1.6
);
UPDATE `battleground_template` SET `MinLvl` = 61, `MaxLvl` = 61 WHERE `id` = 1; -- Alterac Valley (Patch 1.5)

-- * FORBIDDEN EVENTS 

REPLACE INTO forbidden_events SELECT entry FROM game_event WHERE entry IN (
4,    -- Darkmoon Faire (Elwynn)
5,    -- Darkmoon Faire (Mulgore)
13,   -- Elemental Invasion
14,   -- Stranglethorn Fishing Extravaganza: Announce
16,   -- Pirate Chest of Gurubashi I
15,   -- Stranglethorn Fishing Extravaganza: Tournament
100,  -- Darkmoon Faire Building (Elwynn) (TODO)
35,   -- The Maul: Mushgog
36,   -- The Maul: Skarr the Unbreakable
37,   -- The Maul: Razza
38,   -- Pirate Chest of Gurubashi II
39,   -- Arene Gurubashi Short John Mithril
40,   -- Stranglethorn Fishing Extravaganza: The Crew
42,   -- The Maul, Grininlix /yell Mushgog
43,   -- The Maul, Grininlix /yell Skarr the Unbreakable
44,   -- The Maul, Grininlix /yell The Razza
54,   -- AQ War Troop Silithus (GO & PNJ) DAY 1
18,   -- Call to arms: Alterac Valley
101,   -- Darkmoon Faire Building (Mulgore) (TODO)
160,   -- 1.10 Patch : t0.5 Quest Chain
159,   -- DM Release : Cloth turning NPC
158,   -- 1.10 Patch : Recipes
156,   -- DM release : Recipes and misc item
155,   -- Argent dawn @ 1.11
66,    -- Dragons of Nightmare Spawn
161,   -- Patch 1.3
162,   -- Patch 1.4 | 1.5
163,   -- Patch 1.6
164,   -- Patch 1.7
165,   -- Patch 1.8
166,   -- Patch 1.9
167,   -- Patch 1.10
168    -- Patch 1.11
);

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

-- Stats changed: 327 | Damage changed: 40 |  Quality changed: 78  | Spells changed: 796 | Spells removed: 156

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
			
-- * FORBIDDEN SPELLS		 	

REPLACE INTO `spell_disabled` VALUE 
(24800),    -- [Food] / Restores 2148 health over 30 sec. Must remain seated while eating. If you spend at least 10 seconds eating you will become well fed and gain 20 Strength for 15 min. 
(24801),    -- [Smoked Desert Dumplings] / Effect #1(24) Create Item: 3 sec cast | Reagents: Sandworm Meat, Soothing Spices
(25117),    -- [Minor Wizard Oil] / Effect #1(54) Enchant Item Temporary (2623): 3 sec cast | While applied to target weapon it increases spell damage by up to 8. Lasts for 30 minutes.
(25118),    -- [Minor Mana Oil] / Effect #1(54) Enchant Item Temporary (2624): 3 sec cast | While applied to target weapon it restores 4 mana to the caster every 5 seconds. Lasts for 30 minutes.
(25119),    -- [Lesser Wizard Oil] / Effect #1(54) Enchant Item Temporary (2626): 3 sec cast | While applied to target weapon it increases spell damage by up to 16. Lasts for 30 minutes.
(25120),    -- [Lesser Mana Oil} / Effect #1(54) Enchant Item Temporary (2625): 3 sec cast | While applied to target weapon it restores 8 mana to the caster every 5 seconds. Lasts for 30 minutes.
(25123),    -- [Brilliant Mana Oil] / Effect #1(54) Enchant Item Temporary (2629): 3 sec cast | While applied to target weapon it restores 12 mana to the caster every 5 seconds and increases the effect of healing spells by up to 25. Lasts for 30 minutes.
(25122),    -- [Brilliant Wizard Oil] / Effect #1(54) Enchant Item Temporary (2628): 3 sec cast | While applied to target weapon it increases spell damage by up to 36 and increases Spell Critical chance by 1% . Lasts for 30 minutes.
(25121),    -- [Wizard Oil] / Effect #1(54) Enchant Item Temporary (2627): 3 sec cast | While applied to target weapon it increases spell damage by up to 24. Lasts for 30 minutes
(25660),    -- [Food] / Restores 2550 health over 30 sec. Must remain seated while eating. If you spend at least 10 seconds eating you will become well fed and gain 25 Stamina for 15 min.
(25704),    -- [Smoked Sagefish] / Effect #1(24) Create Item: 3 sec cast | Reagents: Raw Sagefish, Mild Spices
(25722),    -- [Rumsey Rum Dark] / Effect #1(6) Apply Aura #29: Mod Stat (2): 1 sec cast | Increases Stamina by 10 for 15 min and gets you drunk to boot!
(25804),    -- [Rumsey Rum Black Label] / Effect #1(6) Apply Aura #29: Mod Stat (2): 1 sec cast| Increases Stamina by 15 for 15 min and gets you drunk to boot!
(25691),    -- [Brain Food] / Restores 0 health and 0 mana over 21 sec. Must remain seated while eating. If you spend at least 10 seconds eating you will become well fed and gain 6 Mana every 5 seconds for 15 min.
(26276),    -- [Greater Firepower] / Effect #1(6) Apply Aura #13: Mod Damage Done (4): Instant | Increases spell fire damage by up to 40 for 30 min.
(26278),    -- [Recipe: Elixir of Greater Firepower] / Effect #1(36) Learn Spell: 100 yd range | 3 sec cast | Teaches you how to make an Elixir of Greater Firepower.
(26277),    -- [Elixir of Greater Firepower] / Effect #1(24) Create Item: 3 sec cast | Reagents: Fire Oil (3), Firebloom (3), Crystal Vial
(23214),    -- [Summon Charger] / Effect #1(6) Apply Aura #78: Mounted (14565) | 3 sec cast | Summons a Charger, which serves as a mount. Speed is increased by 100%.
(23161);    -- [Summon Dreadsteed] / Effect #1(6) Apply Aura #78: Mounted (14505) | 3 sec cast | Summons a Dreadsteed, which serves as a mount for the caster. Speed is increased by 100%.

-- * SPELLS

-- Zanza's Potent Potables
REPLACE INTO `spell_mod` (`Id`, `AttributesEx3`, `Comment`) VALUE 
(24382, 1048576, 'Spirit of Zanza - persist through death (before 1.12)'),
(24417, 1048576, 'Sheen of Zanza - persist through death (before 1.12)'),
(24383, 1048576, 'Swiftness of Zanza - persist through death (before 1.12)');

-- * GAMEOBJECTS

-- GO "Sothos and Jarien's Heirlooms" Has Been Removed / Need to SET ModelID to somethin invisible instead but not delete.
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

UPDATE `areatrigger_teleport` SET `required_level` = 61 WHERE `target_map` IN (SELECT * FROM forbidden_instances);

UPDATE `game_event` SET `disabled` = (`disabled` | 1) WHERE id IN (SELECT * FROM forbidden_events);

-- TODO: Would be nice to have something like `DropDisable` field aka LootMode of TrinityCore to avoid any deletions from *loot_templates: A special parameter used for separating conditional loot, such as Hard Mode loot. A lootmode of 0 will effectively disable a loot entry (its roll will always fail). This column is a bitmask, so you shouldn't duplicate loot across lootmodes. The active lootmode(s) can be changed at any time by the core. This column should only be used if required, in most cases it should be left as 1. Valid lootmodes include: 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 16384, 32768.
-- https://trinitycore.atlassian.net/wiki/display/tc/loot_template#loot_template-ChanceOrQuestChance
