-- 1.3 → 1.4 | The Call to War

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

-- * NEW EVENTS 	

REPLACE INTO new_events SELECT entry FROM game_event WHERE entry IN (
);

-- * NEW ITEMS 	

REPLACE INTO new_items SELECT entry FROM item_template WHERE entry IN (
12422,   -- Imperial Plate Chest | Added April 2005 with patch
12424,   -- Imperial Plate Belt | Added April 2005 with patch
12425,   -- Imperial Plate Bracers | Added April 2005 with patch
12426,   -- Imperial Plate Boots | Added April 2005 with patch
12427,   -- Imperial Plate Helm | Added April 2005 with patch
12428,   -- Imperial Plate Shoulders | Added April 2005 with patch
12429,   -- Imperial Plate Leggings | Added April 2005 with patch
12584,   -- Grand Marshal's Longsword | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
12618,   -- Enchanted Thorium Breastplate | Added April 2005 with patch
12619,   -- Enchanted Thorium Leggings | Added April 2005 with patch
12620,   -- Enchanted Thorium Helm | Added April 2005 with patch												
15196,   -- Private's Tabard | Added with PvP Honor System (Originally patch 1.4)
15198,   -- Knight's Colors | Added with PvP Honor System (Originally patch 1.4)
15199,   -- Stone Guard's Herald | Added with PvP Honor System (Originally patch 1.4)
16335,   -- Senior Sergeant's Insignia | Added with PvP Honor System (Originally patch 1.4)
16345,   -- High Warlord's Blade | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16369,   -- Knight-Lieutenant's Silk Boots | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16391,   -- Knight-Lieutenant's Silk Gloves | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16392,   -- Knight-Lieutenant's Leather Boots | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16393,   -- Knight-Lieutenant's Dragonhide Footwraps | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16396,   -- Knight-Lieutenant's Leather Gauntlets | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16397,   -- Knight-Lieutenant's Dragonhide Gloves | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16401,   -- Knight-Lieutenant's Chain Boots | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16403,   -- Knight-Lieutenant's Chain Gauntlets | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16405,   -- Knight-Lieutenant's Plate Boots | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16406,   -- Knight-Lieutenant's Plate Gauntlets | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16409,   -- Knight-Lieutenant's Lamellar Sabatons | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16410,   -- Knight-Lieutenant's Lamellar Gauntlets | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16413,   -- Knight-Captain's Silk Raiment | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16414,   -- Knight-Captain's Silk Leggings | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16415,   -- Lieutenant Commander's Silk Spaulders | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16416,   -- Lieutenant Commander's Crown | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16417,   -- Knight-Captain's Leather Armor | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16418,   -- Lieutenant Commander's Leather Veil | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16419,   -- Knight-Captain's Leather Legguards | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16420,   -- Lieutenant Commander's Leather Spaulders | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16421,   -- Knight-Captain's Dragonhide Tunic | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16422,   -- Knight-Captain's Dragonhide Leggings | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16423,   -- Lieutenant Commander's Dragonhide Epaulets | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16424,   -- Lieutenant Commander's Dragonhide Shroud | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16425,   -- Knight-Captain's Chain Hauberk | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16426,   -- Knight-Captain's Chain Leggings | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16427,   -- Lieutenant Commander's Chain Pauldrons | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16428,   -- Lieutenant Commander's Chain Helmet | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16429,   -- Lieutenant Commander's Plate Helm | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16430,   -- Knight-Captain's Plate Chestguard | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16431,   -- Knight-Captain's Plate Leggings | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16432,   -- Lieutenant Commander's Plate Pauldrons | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16433,   -- Knight-Captain's Lamellar Breastplate | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16434,   -- Lieutenant Commander's Lamellar Headguard | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16435,   -- Knight-Captain's Lamellar Leggings | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16436,   -- Lieutenant Commander's Lamellar Shoulders | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16437,   -- Marshal's Silk Footwraps | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16440,   -- Marshal's Silk Gloves | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16441,   -- Field Marshal's Coronet | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16442,   -- Marshal's Silk Leggings | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16443,   -- Field Marshal's Silk Vestments | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16444,   -- Field Marshal's Silk Spaulders | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16446,   -- Marshal's Leather Footguards | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16448,   -- Marshal's Dragonhide Gauntlets | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16449,   -- Field Marshal's Dragonhide Spaulders | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16450,   -- Marshal's Dragonhide Legguards | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16451,   -- Field Marshal's Dragonhide Helmet | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16452,   -- Field Marshal's Dragonhide Breastplate | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16453,   -- Field Marshal's Leather Chestpiece | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16454,   -- Marshal's Leather Handgrips | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16455,   -- Field Marshal's Leather Mask | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16456,   -- Marshal's Leather Leggings | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16457,   -- Field Marshal's Leather Epaulets | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16459,   -- Marshal's Dragonhide Boots | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16462,   -- Marshal's Chain Boots | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16463,   -- Marshal's Chain Grips | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16465,   -- Field Marshal's Chain Helm | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16466,   -- Field Marshal's Chain Breastplate | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16467,   -- Marshal's Chain Legguards | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16468,   -- Field Marshal's Chain Spaulders | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16471,   -- Marshal's Lamellar Gloves | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16472,   -- Marshal's Lamellar Boots | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16473,   -- Field Marshal's Lamellar Chestplate | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16474,   -- Field Marshal's Lamellar Faceguard | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16475,   -- Marshal's Lamellar Legplates | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16476,   -- Field Marshal's Lamellar Pauldrons | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16477,   -- Field Marshal's Plate Armor | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16478,   -- Field Marshal's Plate Helm | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16479,   -- Marshal's Plate Legguards | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16480,   -- Field Marshal's Plate Shoulderguards | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16483,   -- Marshal's Plate Boots | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16484,   -- Marshal's Plate Gauntlets | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16485,   -- Blood Guard's Silk Footwraps | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16487,   -- Blood Guard's Silk Gloves | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16489,   -- Champion's Silk Hood | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16490,   -- Legionnaire's Silk Pants | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16491,   -- Legionnaire's Silk Robes | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16492,   -- Champion's Silk Shoulderpads | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16494,   -- Blood Guard's Dragonhide Boots | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16496,   -- Blood Guard's Dragonhide Gauntlets | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16498,   -- Blood Guard's Leather Treads | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16499,   -- Blood Guard's Leather Vices | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16501,   -- Champion's Dragonhide Spaulders | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16502,   -- Legionnaire's Dragonhide Trousers | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16503,   -- Champion's Dragonhide Helm | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16504,   -- Legionnaire's Dragonhide Breastplate | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16505,   -- Legionnaire's Leather Hauberk | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16506,   -- Champion's Leather Headguard | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16507,   -- Champion's Leather Mantle | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16508,   -- Legionnaire's Leather Leggings | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16509,   -- Blood Guard's Plate Boots | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16510,   -- Blood Guard's Plate Gloves | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16513,   -- Legionnaire's Plate Armor | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16514,   -- Champion's Plate Headguard | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16515,   -- Legionnaire's Plate Legguards | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16516,   -- Champion's Plate Pauldrons | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16518,   -- Blood Guard's Mail Walkers | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16519,   -- Blood Guard's Mail Grips | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16521,   -- Champion's Mail Helm | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16522,   -- Legionnaire's Mail Chestpiece | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16523,   -- Legionnaire's Mail Leggings | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16524,   -- Champion's Mail Shoulders | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16525,   -- Legionnaire's Chain Breastplate | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16526,   -- Champion's Chain Headguard | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16527,   -- Legionnaire's Chain Leggings | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16528,   -- Champion's Chain Pauldrons | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16530,   -- Blood Guard's Chain Gauntlets | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16531,   -- Blood Guard's Chain Boots | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
16533,   -- Warlord's Silk Cowl | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16534,   -- General's Silk Trousers | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16535,   -- Warlord's Silk Raiment | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16536,   -- Warlord's Silk Amice | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16539,   -- General's Silk Boots | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16540,   -- General's Silk Handguards | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16541,   -- Warlord's Plate Armor | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16542,   -- Warlord's Plate Headpiece | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16543,   -- General's Plate Leggings | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16544,   -- Warlord's Plate Shoulders | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16545,   -- General's Plate Boots | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16548,   -- General's Plate Gauntlets | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16549,   -- Warlord's Dragonhide Hauberk | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16550,   -- Warlord's Dragonhide Helmet | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16551,   -- Warlord's Dragonhide Epaulets | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16552,   -- General's Dragonhide Leggings | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16554,   -- General's Dragonhide Boots | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16555,   -- General's Dragonhide Gloves | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16558,   -- General's Leather Treads | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16560,   -- General's Leather Mitts | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16561,   -- Warlord's Leather Helm | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16562,   -- Warlord's Leather Spaulders | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16563,   -- Warlord's Leather Breastplate | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16564,   -- General's Leather Legguards | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16565,   -- Warlord's Chain Chestpiece | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16566,   -- Warlord's Chain Helmet | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16567,   -- General's Chain Legguards | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16568,   -- Warlord's Chain Shoulders | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16569,   -- General's Chain Boots | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16571,   -- General's Chain Gloves | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16573,   -- General's Mail Boots | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16574,   -- General's Mail Gauntlets | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16577,   -- Warlord's Mail Armor | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16578,   -- Warlord's Mail Helm | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16579,   -- General's Mail Leggings | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
16580,   -- Warlord's Mail Spaulders | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
17063,   -- Band of Accuria | Molten Core loot update
17067,   -- Ancient Cornerstone Grimoire | Molten Core loot update
17076,   -- Bonereaver's Edge | Note: Proc changed and +16 stamina added in 1.10
17102,   -- Cloak of the Shrouded Mists | Molten Core loot update
17104,   -- Spinal Reaper | Molten Core loot update
17106,   -- Malistar's Defender | Molten Core loot update
17107,   -- Dragon's Blood Cape | Molten Core loot update
17182,   -- Sulfuras, Hand of Ragnaros | Molten Core loot update
17193,   -- Sulfuron Hammer | Molten Core loot update
17203,   -- Sulfuron Ingot | Molten Core loot update
17204,   -- Eye of Sulfuras | Molten Core loot update
17562,   -- Knight-Lieutenant's Dreadweave Boots | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
17564,   -- Knight-Lieutenant's Dreadweave Gloves | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
17566,   -- Lieutenant Commander's Headguard | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
17567,   -- Knight-Captain's Dreadweave Leggings | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
17568,   -- Knight-Captain's Dreadweave Robe | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
17569,   -- Lieutenant Commander's Dreadweave Mantle | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
17570,   -- Champion's Dreadweave Hood | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
17571,   -- Legionnaire's Dreadweave Leggings | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
17572,   -- Legionnaire's Dreadweave Robe | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
17573,   -- Champion's Dreadweave Shoulders | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
17576,   -- Blood Guard's Dreadweave Boots | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
17577,   -- Blood Guard's Dreadweave Gloves | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
17578,   -- Field Marshal's Coronal | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
17579,   -- Marshal's Dreadweave Leggings | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
17580,   -- Field Marshal's Dreadweave Shoulders | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
17581,   -- Field Marshal's Dreadweave Robe | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
17583,   -- Marshal's Dreadweave Boots | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
17584,   -- Marshal's Dreadweave Gloves | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
17586,   -- General's Dreadweave Boots | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
17588,   -- General's Dreadweave Gloves | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
17590,   -- Warlord's Dreadweave Mantle | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
17591,   -- Warlord's Dreadweave Hood | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
17592,   -- Warlord's Dreadweave Robe | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
17593,   -- General's Dreadweave Pants | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
17594,   -- Knight-Lieutenant's Satin Boots | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
17596,   -- Knight-Lieutenant's Satin Gloves | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
17598,   -- Lieutenant Commander's Diadem | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
17599,   -- Knight-Captain's Satin Leggings | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
17600,   -- Knight-Captain's Satin Robes | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
17601,   -- Lieutenant Commander's Satin Amice | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
17602,   -- Field Marshal's Headdress | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
17603,   -- Marshal's Satin Pants | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
17604,   -- Field Marshal's Satin Mantle | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
17605,   -- Field Marshal's Satin Vestments | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
17607,   -- Marshal's Satin Sandals | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
17608,   -- Marshal's Satin Gloves | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
17610,   -- Champion's Satin Cowl | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
17611,   -- Legionnaire's Satin Trousers | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
17612,   -- Legionnaire's Satin Vestments | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
17613,   -- Champion's Satin Shoulderpads | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
17616,   -- Blood Guard's Satin Boots | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
17617,   -- Blood Guard's Satin Gloves | Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11; different item IDs)
17618,   -- General's Satin Boots | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
17620,   -- General's Satin Gloves | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
17622,   -- Warlord's Satin Mantle | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
17623,   -- Warlord's Satin Cowl | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
17624,   -- Warlord's Satin Robes | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
17625,   -- General's Satin Leggings | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
18083,   -- Jumanza Grips | wowwiki and allakhazam dates
18103,   -- Band of Rumination | wowwiki and allakhazam dates
18104,   -- Feralsurge Girdle | wowwiki and allakhazam dates
18168,   -- Force Reactive Disk | 1.4 Molten Core loot update
18202,   -- Eskhandar's Left Claw | 1.4 Molten Core loot update
18203,   -- Eskhandar's Right Claw | 1.4 Molten Core loot update
18204,   -- Eskhandar's Pelt | 1.4 Molten Core loot update
18205,   -- Eskhandar's Collar | 1.4 Molten Core loot update
18252,   -- Pattern: Core Armor Kit | 1.4 Molten Core loot update
18257,   -- Recipe: Major Rejuvenation Potion | 1.4 Molten Core loot update
18259,   -- Formula: Enchant Weapon - Spell Power | 1.4 Molten Core loot update
18260,   -- Formula: Enchant Weapon - Healing Power | 1.4 Molten Core loot update
18263,   -- Flarecore Wraps | 1.4 Molten Core loot update
18264,   -- Plans: Elemental Sharpening Stone | 1.4 Molten Core loot update
18265,   -- Pattern: Flarecore Wraps | 1.4 Molten Core loot update
18290,   -- Schematic: Biznicks 247x128 Accurascope | 1.4 Molten Core loot update
18291,   -- Schematic: Force Reactive Disk | 1.4 Molten Core loot update
18292,   -- Schematic: Core Marksman Rifle | 1.4 Molten Core loot update
18427,   -- Sergeant's Cloak | Added with PvP Honor System (Originally patch 1.4)
18428,   -- Senior Sergeant's Insignia | Added with PvP Honor System (Originally patch 1.4)
18430,   -- First Sergeant's Plate Bracers | Added with PvP Honor System (Originally patch 1.4)
18432,   -- First Sergeant's Mail Wristguards | Added with PvP Honor System (Originally patch 1.4)
18436,   -- First Sergeant's Dragonhide Armguards | Added with PvP Honor System (Originally patch 1.4)
18437,   -- First Sergeant's Silk Cuffs | Added with PvP Honor System (Originally patch 1.4)
18448,   -- Sergeant Major's Chain Armguards | Added with PvP Honor System (Originally patch 1.4)
18452,   -- Sergeant Major's Leather Armsplints | Added with PvP Honor System (Originally patch 1.4)
18454,   -- Sergeant Major's Dragonhide Armsplints | Added with PvP Honor System (Originally patch 1.4)
18825,   -- Grand Marshal's Aegis | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
18826,   -- High Warlord's Shield Wall | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
18827,   -- Grand Marshal's Handaxe | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
18828,   -- High Warlord's Cleaver | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
18830,   -- Grand Marshal's Sunderer | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
18831,   -- High Warlord's Battle Axe | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
18833,   -- Grand Marshal's Bullseye | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
18834,   -- Insignia of the Horde | Added with PvP Honor System (NOTE: Originally patch 1.4)
18835,   -- High Warlord's Recurve | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
18836,   -- Grand Marshal's Repeater | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
18837,   -- High Warlord's Crossbow | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
18838,   -- Grand Marshal's Dirk | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
18840,   -- High Warlord's Razor | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
18843,   -- Grand Marshal's Right Hand Blade | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
18844,   -- High Warlord's Right Claw | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
18845,   -- Insignia of the Horde | Added with PvP Honor System (NOTE: Originally patch 1.4)
18846,   -- Insignia of the Horde | Added with PvP Honor System (NOTE: Originally patch 1.4)
18847,   -- Grand Marshal's Left Hand Blade | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
18848,   -- High Warlord's Left Claw | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
18849,   -- Insignia of the Horde | Added with PvP Honor System (NOTE: Originally patch 1.4)
18850,   -- Insignia of the Horde | Added with PvP Honor System (NOTE: Originally patch 1.4)
18851,   -- Insignia of the Horde | Added with PvP Honor System (NOTE: Originally patch 1.4)
18852,   -- Insignia of the Horde | Added with PvP Honor System (NOTE: Originally patch 1.4)
18853,   -- Insignia of the Horde | Added with PvP Honor System (NOTE: Originally patch 1.4)
18854,   -- Insignia of the Alliance | Added with PvP Honor System (NOTE: Originally patch 1.4)
18855,   -- Grand Marshal's Hand Cannon | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
18856,   -- Insignia of the Alliance | Added with PvP Honor System (NOTE: Originally patch 1.4)
18857,   -- Insignia of the Alliance | Added with PvP Honor System (NOTE: Originally patch 1.4)
18858,   -- Insignia of the Alliance | Added with PvP Honor System (NOTE: Originally patch 1.4)
18859,   -- Insignia of the Alliance | Added with PvP Honor System (NOTE: Originally patch 1.4)
18860,   -- High Warlord's Street Sweeper | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
18862,   -- Insignia of the Alliance | Added with PvP Honor System (NOTE: Originally patch 1.4)
18863,   -- Insignia of the Alliance | Added with PvP Honor System (NOTE: Originally patch 1.4)
18864,   -- Insignia of the Alliance | Added with PvP Honor System (NOTE: Originally patch 1.4)
18865,   -- Grand Marshal's Punisher | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
18866,   -- High Warlord's Bludgeon | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
18867,   -- Grand Marshal's Battle Hammer | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
18868,   -- High Warlord's Pulverizer | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
18869,   -- Grand Marshal's Glaive | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
18871,   -- High Warlord's Pig Sticker | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
18873,   -- Grand Marshal's Stave | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
18874,   -- High Warlord's War Staff | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
18876,   -- Grand Marshal's Claymore | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
18877,   -- High Warlord's Greatsword | Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11; same item ID)
18766,   -- Reins of the Swift Frostsaber | 1.4 Mount model update
18767,   -- Reins of the Swift Mistsaber | 1.4 Mount model update
18772,   -- Swift Green Mechanostrider | 1.4 Mount model update
18773,   -- Swift White Mechanostrider | 1.4 Mount model update
18774,   -- Swift Yellow Mechanostrider | 1.4 Mount model update
18776,   -- Swift Palomino | 1.4 Mount model update
18777,   -- Swift Brown Steed | 1.4 Mount model update
18778,   -- Swift White Steed | 1.4 Mount model update
18785,   -- Swift White Ram | 1.4 Mount model update
18786,   -- Swift Brown Ram | 1.4 Mount model update
18787,   -- Swift Gray Ram | 1.4 Mount model update
18788,   -- Swift Blue Raptor | 1.4 Mount model update
18789,   -- Swift Olive Raptor | 1.4 Mount model update
18790,   -- Swift Orange Raptor | 1.4 Mount model update
18791,   -- Purple Skeletal Warhorse | 1.4 Mount model update
18793,   -- Great White Kodo | 1.4 Mount model update
18794,   -- Great Brown Kodo | 1.4 Mount model update
18795,   -- Great Gray Kodo | 1.4 Mount model update
18796,   -- Horn of the Swift Brown Wolf | 1.4 Mount model update
18797,   -- Horn of the Swift Timber Wolf | 1.4 Mount model update
18798,   -- Horn of the Swift Gray Wolf | 1.4 Mount model update
18902,   -- Reins of the Swift Stormsaber | 1.4 Mount model update
18803,   -- Finkle's Lava Dredger | 1.4 Raid loot table update
18805,   -- Core Hound Tooth | 1.4 Raid loot table update
18806,   -- Core Forged Greaves | 1.4 Raid loot table update
18807,   -- Helm of Latent Power | 1.4 Paladin mount quest
18808,   -- Gloves of the Hypnotic Flame | 1.4 Raid loot table update
18809,   -- Sash of Whispered Secrets | 1.4 Raid loot table update
18810,   -- Wild Growth Spaulders | 1.4 Raid loot table update
18811,   -- Fireproof Cloak | 1.4 Raid loot table update
18812,   -- Wristguards of True Flight | 1.4 Raid loot table update
18813,   -- Ring of Binding | 1.4 Raid loot table update
18814,   -- Choker of the Fire Lord | 1.4 Raid loot table update
18815,   -- Essence of the Pure Flame | 1.4 Raid loot table update
18816,   -- Perdition's Blade | 1.4 Raid loot table update
18817,   -- Crown of Destruction | 1.4 Raid loot table update
18820,   -- Talisman of Ephemeral Power | 1.4 Raid loot table update
18821,   -- Quick Strike Ring | 1.4 Raid loot table update
18822,   -- Obsidian Edged Blade | 1.4 Raid loot table update
18823,   -- Aged Core Leather Gloves | 1.4 Raid loot table update
18824,   -- Magma Tempered Boots | 1.4 Raid loot table update
18563,   -- Bindings of the Windseeker | Raid loot table update (Allakhazam dates, not patch 1.6 like crappy wowwiki says)
18564,   -- Bindings of the Windseeker | Raid loot table update (Allakhazam dates, not patch 1.6 like crappy wowwiki says)
18592,   -- Plans: Sulfuron Hammer | Raid loot table update
18602,   -- Tome of Sacrifice | Added in 1.4 with doomguard summon spell (allakhazam dates)
18608,   -- Benediction | Raid loot table update
18609,   -- Anathema | Raid loot table update
18610,   -- Keen Machete | Possibly added in patch 1.4 along with the rare spawn NPC (Threggil) according to Allakhazam dating
18611,   -- Gnarlpine Leggings | Possibly added in patch 1.4 along with the rare spawn NPC (Urson) according to Allakhazam dating
18612,   -- Bloody Chain Boots | Possibly added in patch 1.4 along with the rare spawn NPC (Fury Shelda) according to Allakhazam dating
18634,   -- Gyrofreeze Ice Reflector | See 1.4 retail patch notes
18637,   -- Major Recombobulator | See 1.4 retail patch notes
18638,   -- Hyper-Radiant Flame Reflector | See 1.4 retail patch notes
18639,   -- Ultra-Flash Shadow Reflector | See 1.4 retail patch notes
18646,   -- The Eye of Divinity | Raid loot table update
18652,   -- Schematic: Gyrofreeze Ice Reflector | See 1.4 retail patch notes
18655,   -- Schematic: Major Recombobulator | See 1.4 retail patch notes
18657,   -- Schematic: Hyper-Radiant Flame Reflector | See 1.4 retail patch notes
18658,   -- Schematic: Ultra-Flash Shadow Reflector | See 1.4 retail patch notes
18665,   -- The Eye of Shadow | Raid loot table update
18682,   -- Ghoul Skin Leggings | Dungeon loot table update (see retail patch notes)
18693,   -- Shivery Handwraps | Dungeon loot table update (see retail patch notes)
18703,   -- Ancient Petrified Leaf | Raid loot table update
18704,   -- Mature Blue Dragon Sinew | Raid loot table update
18705,   -- Mature Black Dragon Sinew | Raid loot table update
18713,   -- Rhok'delar, Longbow of the Ancient Keepers | Raid loot table update
18715,   -- Lok'delar, Stave of the Ancient Keepers | Raid loot table update
18716,   -- Ash Covered Boots | Dungeon loot table update (see retail patch notes)
18717,   -- Hammer of the Grand Crusader | Dungeon loot table update (see retail patch notes)
18718,   -- Grand Crusader's Helm | Dungeon loot table update (see retail patch notes)
18720,   -- Shroud of the Nathrezim | Dungeon loot table update (see retail patch notes)
18721,   -- Barrage Girdle | Dungeon loot table update (see retail patch notes)
18722,   -- Death Grips | Dungeon loot table update (see retail patch notes)
18723,   -- Animated Chain Necklace | Dungeon loot table update (see retail patch notes)
18725,   -- Peacemaker | Dungeon loot table update (see retail patch notes)
18726,   -- Magistrate's Cuffs | Dungeon loot table update (see retail patch notes)
18727,   -- Crimson Felt Hat | Dungeon loot table update (see retail patch notes)
18728,   -- Anastari Heirloom | Dungeon loot table update (see retail patch notes)
18730,   -- Shadowy Laced Handwraps | Dungeon loot table update (see retail patch notes)
18734,   -- Pale Moon Cloak | Dungeon loot table update (see retail patch notes)
18735,   -- Maleki's Footwraps | Dungeon loot table update (see retail patch notes)
18738,   -- Carapace Spine Crossbow | Dungeon loot table update (see retail patch notes)
18740,   -- Thuzadin Sash | Dungeon loot table update (see retail patch notes)
18741,   -- Morlune's Bracer | Dungeon loot table update (see retail patch notes)
18742,   -- Stratholme Militia Shoulderguard | Dungeon loot table update (see retail patch notes)
18743,   -- Gracious Cape | Dungeon loot table update (see retail patch notes)
18744,   -- Plaguebat Fur Gloves | Dungeon loot table update (see retail patch notes)
18829,   -- Deep Earth Spaulders | Raid loot table update
18832,   -- Brutality Blade | Raid loot table update
18842,   -- Staff of Dominance | Raid loot table update
18861,   -- Flamewaker Legplates | Raid loot table update
18870,   -- Helm of the Lifegiver | Raid loot table update
18872,   -- Manastorm Leggings | Raid loot table update
18875,   -- Salamander Scale Pants | Raid loot table update
18878,   -- Sorcerous Dagger | Raid loot table update
18879,   -- Heavy Dark Iron Ring | Raid loot table update
18671,   -- Baron Charr's Sceptre | Patch 1.4 elemental invasions (see retail patch notes)
18672,   -- Elemental Ember | Patch 1.4 elemental invasions (see retail patch notes)
18673,   -- Avalanchion's Stony Hide | Patch 1.4 elemental invasions (see retail patch notes)
18674,   -- Hardened Stone Band | Patch 1.4 elemental invasions (see retail patch notes)
18676,   -- Sash of the Windreaver | Patch 1.4 elemental invasions (see retail patch notes)
18677,   -- Zephyr Cloak | Patch 1.4 elemental invasions (see retail patch notes)
18678,   -- Tempestria's Frozen Necklace | Patch 1.4 elemental invasions (see retail patch notes)
18679,   -- Frigid Ring | Patch 1.4 elemental invasions (see retail patch notes)
18680,   -- Ancient Bone Bow | Dungeon Loot table update (see retail patch notes)
18681,   -- Burial Shawl | Dungeon Loot table update (see retail patch notes)
18683,   -- Hammer of the Vesper | Dungeon Loot table update (see retail patch notes)
18686,   -- Bone Golem Shoulders | Dungeon Loot table update (see retail patch notes)
18689,   -- Phantasmal Cloak | Dungeon Loot table update (see retail patch notes)
18690,   -- Wraithplate Leggings | Dungeon Loot table update (see retail patch notes)
18691,   -- Dark Advisor's Pendant | Dungeon Loot table update (see retail patch notes)
18692,   -- Death Knight Sabatons | Dungeon Loot table update (see retail patch notes)
18694,   -- Shadowy Mail Greaves | Dungeon Loot table update (see retail patch notes)
18695,   -- Spellbound Tome | Dungeon Loot table update (see retail patch notes)
18696,   -- Intricately Runed Shield | Dungeon Loot table update (see retail patch notes)
18697,   -- Coldstone Slippers | Dungeon Loot table update (see retail patch notes)
18698,   -- Tattered Leather Hood | Dungeon Loot table update (see retail patch notes)
18699,   -- Icy Tomb Spaulders | Dungeon Loot table update (see retail patch notes)
18700,   -- Malefic Bracers | Dungeon Loot table update (see retail patch notes)
18701,   -- Innervating Band | Dungeon Loot table update (see retail patch notes)
18702,   -- Belt of the Ordained | Dungeon Loot table update (see retail patch notes)
18709,   -- Arena Wristguards | Gurubashi arena event (see patch notes)
18710,   -- Arena Bracers | Gurubashi arena event (see patch notes)
18711,   -- Arena Bands | Gurubashi arena event (see patch notes)
18712,   -- Arena Vambraces | Gurubashi arena event (see patch notes)
18729,   -- Screeching Bow | Dungeon loot table update (see retail patch notes)
18736,   -- Plaguehound Leggings | Dungeon loot table update (see retail patch notes)
18737,   -- Bone Slicing Hatchet | Dungeon loot table update (see retail patch notes)
18739,   -- Chitinous Plate Legguards | Dungeon loot table update (see retail patch notes)
18745,   -- Sacred Cloth Leggings | Dungeon loot table update (see retail patch notes)
18754,   -- Fel Hardened Bracers | Warlock mount quest summon
18755,   -- Xorothian Firestick | Warlock mount quest summon
18756,   -- Dreadguard's Protector | Warlock mount quest summon
18757,   -- Diabolic Mantle | Warlock mount quest summon
18758,   -- Specter's Blade | Paladin mount quest summon
18759,   -- Malicious Axe | Paladin mount quest summon
18760,   -- Necromantic Band | Paladin mount quest summon
18761,   -- Oblivion's Touch | Paladin mount quest summon
18762,   -- Shard of the Green Flame | Warlock mount quest chain
);
 
-- * NEW CREATURES

REPLACE INTO new_creatures SELECT entry FROM creature_template WHERE entry IN (
);
	
-- * NEW QUESTS	

REPLACE INTO new_quests SELECT entry FROM quest_template WHERE entry IN (
1318,   -- Unfinished Gordok Business
7562,   -- Mor'zul Bloodbringer
7638,   -- Lord Grayson Shadowbreaker
);

-- * NEW SPELLS	

DELETE FROM spell_disabled WHERE entry IN (
);
			
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
