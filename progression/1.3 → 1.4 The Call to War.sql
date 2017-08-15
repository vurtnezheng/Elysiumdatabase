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
12422, -- Imperial Plate Chest | Added April 2005 with patch
12424, -- Imperial Plate Belt | Added April 2005 with patch
12425, -- Imperial Plate Bracers | Added April 2005 with patch
12426, -- Imperial Plate Boots | Added April 2005 with patch
12427, -- Imperial Plate Helm | Added April 2005 with patch
12428, -- Imperial Plate Shoulders | Added April 2005 with patch
12429, -- Imperial Plate Leggings | Added April 2005 with patch
12584, -- Grand Marshal's Longsword | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
12618, -- Enchanted Thorium Breastplate | Added April 2005 with patch
12619, -- Enchanted Thorium Leggings | Added April 2005 with patch
12620, -- Enchanted Thorium Helm | Added April 2005 with patch
15196, -- Private's Tabard | Added with PvP Honor System (Originally patch 1.4)
15198, -- Knight's Colors | Added with PvP Honor System (Originally patch 1.4)
15199, -- Stone Guard's Herald | Added with PvP Honor System (Originally patch 1.4)
16335, -- Senior Sergeant's Insignia | Added with PvP Honor System (Originally patch 1.4)
16345, -- High Warlord's Blade | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16369, -- Knight-Lieutenant's Silk Boots | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16391, -- Knight-Lieutenant's Silk Gloves | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16392, -- Knight-Lieutenant's Leather Boots | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16393, -- Knight-Lieutenant's Dragonhide Footwraps | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16396, -- Knight-Lieutenant's Leather Gauntlets | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16397, -- Knight-Lieutenant's Dragonhide Gloves | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16401, -- Knight-Lieutenant's Chain Boots | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16403, -- Knight-Lieutenant's Chain Gauntlets | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16405, -- Knight-Lieutenant's Plate Boots | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16406, -- Knight-Lieutenant's Plate Gauntlets | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16409, -- Knight-Lieutenant's Lamellar Sabatons | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16410, -- Knight-Lieutenant's Lamellar Gauntlets | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16413, -- Knight-Captain's Silk Raiment | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16414, -- Knight-Captain's Silk Leggings | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16415, -- Lieutenant Commander's Silk Spaulders | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16416, -- Lieutenant Commander's Crown | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16417, -- Knight-Captain's Leather Armor | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16418, -- Lieutenant Commander's Leather Veil | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16419, -- Knight-Captain's Leather Legguards | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16420, -- Lieutenant Commander's Leather Spaulders | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16421, -- Knight-Captain's Dragonhide Tunic | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16422, -- Knight-Captain's Dragonhide Leggings | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16423, -- Lieutenant Commander's Dragonhide Epaulets | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16424, -- Lieutenant Commander's Dragonhide Shroud | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16425, -- Knight-Captain's Chain Hauberk | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16426, -- Knight-Captain's Chain Leggings | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16427, -- Lieutenant Commander's Chain Pauldrons | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16428, -- Lieutenant Commander's Chain Helmet | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16429, -- Lieutenant Commander's Plate Helm | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16430, -- Knight-Captain's Plate Chestguard | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16431, -- Knight-Captain's Plate Leggings | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16432, -- Lieutenant Commander's Plate Pauldrons | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16433, -- Knight-Captain's Lamellar Breastplate | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16434, -- Lieutenant Commander's Lamellar Headguard | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16435, -- Knight-Captain's Lamellar Leggings | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16436, -- Lieutenant Commander's Lamellar Shoulders | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16437, -- Marshal's Silk Footwraps | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16440, -- Marshal's Silk Gloves | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16441, -- Field Marshal's Coronet | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16442, -- Marshal's Silk Leggings | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16443, -- Field Marshal's Silk Vestments | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16444, -- Field Marshal's Silk Spaulders | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16446, -- Marshal's Leather Footguards | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16448, -- Marshal's Dragonhide Gauntlets | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16449, -- Field Marshal's Dragonhide Spaulders | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16450, -- Marshal's Dragonhide Legguards | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16451, -- Field Marshal's Dragonhide Helmet | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16452, -- Field Marshal's Dragonhide Breastplate | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16453, -- Field Marshal's Leather Chestpiece | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16454, -- Marshal's Leather Handgrips | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16455, -- Field Marshal's Leather Mask | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16456, -- Marshal's Leather Leggings | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16457, -- Field Marshal's Leather Epaulets | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16459, -- Marshal's Dragonhide Boots | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16462, -- Marshal's Chain Boots | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16463, -- Marshal's Chain Grips | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16465, -- Field Marshal's Chain Helm | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16466, -- Field Marshal's Chain Breastplate | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16467, -- Marshal's Chain Legguards | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16468, -- Field Marshal's Chain Spaulders | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16471, -- Marshal's Lamellar Gloves | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16472, -- Marshal's Lamellar Boots | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16473, -- Field Marshal's Lamellar Chestplate | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16474, -- Field Marshal's Lamellar Faceguard | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16475, -- Marshal's Lamellar Legplates | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16476, -- Field Marshal's Lamellar Pauldrons | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16477, -- Field Marshal's Plate Armor | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16478, -- Field Marshal's Plate Helm | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16479, -- Marshal's Plate Legguards | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16480, -- Field Marshal's Plate Shoulderguards | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16483, -- Marshal's Plate Boots | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16484, -- Marshal's Plate Gauntlets | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16485, -- Blood Guard's Silk Footwraps | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16487, -- Blood Guard's Silk Gloves | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16489, -- Champion's Silk Hood | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16490, -- Legionnaire's Silk Pants | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16491, -- Legionnaire's Silk Robes | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16492, -- Champion's Silk Shoulderpads | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16494, -- Blood Guard's Dragonhide Boots | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16496, -- Blood Guard's Dragonhide Gauntlets | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16498, -- Blood Guard's Leather Treads | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16499, -- Blood Guard's Leather Vices | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16501, -- Champion's Dragonhide Spaulders | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16502, -- Legionnaire's Dragonhide Trousers | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16503, -- Champion's Dragonhide Helm | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16504, -- Legionnaire's Dragonhide Breastplate | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16505, -- Legionnaire's Leather Hauberk | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16506, -- Champion's Leather Headguard | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16507, -- Champion's Leather Mantle | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16508, -- Legionnaire's Leather Leggings | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16509, -- Blood Guard's Plate Boots | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16510, -- Blood Guard's Plate Gloves | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16513, -- Legionnaire's Plate Armor | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16514, -- Champion's Plate Headguard | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16515, -- Legionnaire's Plate Legguards | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16516, -- Champion's Plate Pauldrons | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16518, -- Blood Guard's Mail Walkers | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16519, -- Blood Guard's Mail Grips | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16521, -- Champion's Mail Helm | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16522, -- Legionnaire's Mail Chestpiece | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16523, -- Legionnaire's Mail Leggings | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16524, -- Champion's Mail Shoulders | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16525, -- Legionnaire's Chain Breastplate | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16526, -- Champion's Chain Headguard | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16527, -- Legionnaire's Chain Leggings | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16528, -- Champion's Chain Pauldrons | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16530, -- Blood Guard's Chain Gauntlets | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16531, -- Blood Guard's Chain Boots | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
16533, -- Warlord's Silk Cowl | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16534, -- General's Silk Trousers | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16535, -- Warlord's Silk Raiment | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16536, -- Warlord's Silk Amice | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16539, -- General's Silk Boots | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16540, -- General's Silk Handguards | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16541, -- Warlord's Plate Armor | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16542, -- Warlord's Plate Headpiece | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16543, -- General's Plate Leggings | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16544, -- Warlord's Plate Shoulders | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16545, -- General's Plate Boots | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16548, -- General's Plate Gauntlets | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16549, -- Warlord's Dragonhide Hauberk | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16550, -- Warlord's Dragonhide Helmet | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16551, -- Warlord's Dragonhide Epaulets | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16552, -- General's Dragonhide Leggings | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16554, -- General's Dragonhide Boots | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16555, -- General's Dragonhide Gloves | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16558, -- General's Leather Treads | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16560, -- General's Leather Mitts | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16561, -- Warlord's Leather Helm | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16562, -- Warlord's Leather Spaulders | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16563, -- Warlord's Leather Breastplate | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16564, -- General's Leather Legguards | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16565, -- Warlord's Chain Chestpiece | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16566, -- Warlord's Chain Helmet | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16567, -- General's Chain Legguards | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16568, -- Warlord's Chain Shoulders | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16569, -- General's Chain Boots | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16571, -- General's Chain Gloves | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16573, -- General's Mail Boots | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16574, -- General's Mail Gauntlets | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16577, -- Warlord's Mail Armor | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16578, -- Warlord's Mail Helm | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16579, -- General's Mail Leggings | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
16580, -- Warlord's Mail Spaulders | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
17063, -- Band of Accuria | 1.4 Molten Core loot update
17067, -- Ancient Cornerstone Grimoire | 1.4 Molten Core loot update
17076, -- Bonereaver's Edge | Note: Proc changed and +16 stamina added in 1.10
17102, -- Cloak of the Shrouded Mists | 1.4 Molten Core loot update
17104, -- Spinal Reaper | 1.4 Molten Core loot update
17106, -- Malistar's Defender | 1.4 Molten Core loot update
17107, -- Dragon's Blood Cape | 1.4 Molten Core loot update
17182, -- Sulfuras, Hand of Ragnaros | 1.4 Molten Core loot update
17193, -- Sulfuron Hammer | 1.4 Molten Core loot update
17203, -- Sulfuron Ingot | 1.4 Molten Core loot update
17204, -- Eye of Sulfuras | 1.4 Molten Core loot update
17562, -- Knight-Lieutenant's Dreadweave Boots | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
17564, -- Knight-Lieutenant's Dreadweave Gloves | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
17566, -- Lieutenant Commander's Headguard | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
17567, -- Knight-Captain's Dreadweave Leggings | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
17568, -- Knight-Captain's Dreadweave Robe | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
17569, -- Lieutenant Commander's Dreadweave Mantle | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
17570, -- Champion's Dreadweave Hood | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
17571, -- Legionnaire's Dreadweave Leggings | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
17572, -- Legionnaire's Dreadweave Robe | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
17573, -- Champion's Dreadweave Shoulders | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
17576, -- Blood Guard's Dreadweave Boots | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
17577, -- Blood Guard's Dreadweave Gloves | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
17578, -- Field Marshal's Coronal | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
17579, -- Marshal's Dreadweave Leggings | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
17580, -- Field Marshal's Dreadweave Shoulders | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
17581, -- Field Marshal's Dreadweave Robe | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
17583, -- Marshal's Dreadweave Boots | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
17584, -- Marshal's Dreadweave Gloves | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
17586, -- General's Dreadweave Boots | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
17588, -- General's Dreadweave Gloves | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
17590, -- Warlord's Dreadweave Mantle | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
17591, -- Warlord's Dreadweave Hood | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
17592, -- Warlord's Dreadweave Robe | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
17593, -- General's Dreadweave Pants | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
17594, -- Knight-Lieutenant's Satin Boots | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
17596, -- Knight-Lieutenant's Satin Gloves | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
17598, -- Lieutenant Commander's Diadem | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
17599, -- Knight-Captain's Satin Leggings | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
17600, -- Knight-Captain's Satin Robes | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
17601, -- Lieutenant Commander's Satin Amice | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
17602, -- Field Marshal's Headdress | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
17603, -- Marshal's Satin Pants | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
17604, -- Field Marshal's Satin Mantle | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
17605, -- Field Marshal's Satin Vestments | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
17607, -- Marshal's Satin Sandals | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
17608, -- Marshal's Satin Gloves | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
17610, -- Champion's Satin Cowl | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
17611, -- Legionnaire's Satin Trousers | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
17612, -- Legionnaire's Satin Vestments | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
17613, -- Champion's Satin Shoulderpads | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
17616, -- Blood Guard's Satin Boots | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
17617, -- Blood Guard's Satin Gloves | "Added with PvP Honor System (NOTE: Originally patch 1.4, changed to level 60 pvp set in 1.11
17618, -- General's Satin Boots | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
17620, -- General's Satin Gloves | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
17622, -- Warlord's Satin Mantle | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
17623, -- Warlord's Satin Cowl | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
17624, -- Warlord's Satin Robes | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
17625, -- General's Satin Leggings | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
18083, -- Jumanza Grips | wowwiki and allakhazam dates
18103, -- Band of Rumination | wowwiki and allakhazam dates
18104, -- Feralsurge Girdle | wowwiki and allakhazam dates
18168, -- Force Reactive Disk | 1.4 Molten Core loot update
18202, -- Eskhandar's Left Claw | 1.4 Molten Core loot update
18203, -- Eskhandar's Right Claw | 1.4 Molten Core loot update
18204, -- Eskhandar's Pelt | 1.4 Molten Core loot update
18205, -- Eskhandar's Collar | 1.4 Molten Core loot update
18252, -- Pattern: Core Armor Kit | 1.4 Molten Core loot update
18257, -- Recipe: Major Rejuvenation Potion | 1.4 Molten Core loot update
18259, -- Formula: Enchant Weapon - Spell Power | 1.4 Molten Core loot update
18260, -- Formula: Enchant Weapon - Healing Power | 1.4 Molten Core loot update
18263, -- Flarecore Wraps | 1.4 Molten Core loot update
18264, -- Plans: Elemental Sharpening Stone | 1.4 Molten Core loot update
18265, -- Pattern: Flarecore Wraps | 1.4 Molten Core loot update
18290, -- Schematic: Biznicks 247x128 Accurascope | 1.4 Molten Core loot update
18291, -- Schematic: Force Reactive Disk | 1.4 Molten Core loot update
18292, -- Schematic: Core Marksman Rifle | 1.4 Molten Core loot update
18427, -- Sergeant's Cloak | Added with PvP Honor System (Originally patch 1.4)
18428, -- Senior Sergeant's Insignia | Added with PvP Honor System (Originally patch 1.4)
18430, -- First Sergeant's Plate Bracers | Added with PvP Honor System (Originally patch 1.4)
18432, -- First Sergeant's Mail Wristguards | Added with PvP Honor System (Originally patch 1.4)
18436, -- First Sergeant's Dragonhide Armguards | Added with PvP Honor System (Originally patch 1.4)
18437, -- First Sergeant's Silk Cuffs | Added with PvP Honor System (Originally patch 1.4)
18448, -- Sergeant Major's Chain Armguards | Added with PvP Honor System (Originally patch 1.4)
18452, -- Sergeant Major's Leather Armsplints | Added with PvP Honor System (Originally patch 1.4)
18454, -- Sergeant Major's Dragonhide Armsplints | Added with PvP Honor System (Originally patch 1.4)
18563, -- Bindings of the Windseeker | 1.4 Raid loot table update (Allakhazam dates, not patch 1.6 like crappy wowwiki says)
18564, -- Bindings of the Windseeker | 1.4 Raid loot table update (Allakhazam dates, not patch 1.6 like crappy wowwiki says)
18592, -- Plans: Sulfuron Hammer | 1.4 Raid loot table update
18602, -- Tome of Sacrifice | Added in 1.4 with doomguard summon spell (allakhazam dates)
18608, -- Benediction | 1.4 Raid loot table update
18609, -- Anathema | 1.4 Raid loot table update
18610, -- Keen Machete | Possibly added in patch 1.4 along with the rare spawn NPC (Threggil) according to Allakhazam dating
18611, -- Gnarlpine Leggings | Possibly added in patch 1.4 along with the rare spawn NPC (Urson) according to Allakhazam dating
18612, -- Bloody Chain Boots | Possibly added in patch 1.4 along with the rare spawn NPC (Fury Shelda) according to Allakhazam dating
18634, -- Gyrofreeze Ice Reflector | See 1.4 retail patch notes
18637, -- Major Recombobulator | See 1.4 retail patch notes
18638, -- Hyper-Radiant Flame Reflector | See 1.4 retail patch notes
18639, -- Ultra-Flash Shadow Reflector | See 1.4 retail patch notes
18646, -- The Eye of Divinity | 1.4 Raid loot table update
18652, -- Schematic: Gyrofreeze Ice Reflector | See 1.4 retail patch notes
18655, -- Schematic: Major Recombobulator | See 1.4 retail patch notes
18657, -- Schematic: Hyper-Radiant Flame Reflector | See 1.4 retail patch notes
18658, -- Schematic: Ultra-Flash Shadow Reflector | See 1.4 retail patch notes
18665, -- The Eye of Shadow | 1.4 Raid loot table update
18671, -- Baron Charr's Sceptre | Patch 1.4 elemental invasions (see retail patch notes)
18672, -- Elemental Ember | Patch 1.4 elemental invasions (see retail patch notes)
18673, -- Avalanchion's Stony Hide | Patch 1.4 elemental invasions (see retail patch notes)
18674, -- Hardened Stone Band | Patch 1.4 elemental invasions (see retail patch notes)
18676, -- Sash of the Windreaver | Patch 1.4 elemental invasions (see retail patch notes)
18677, -- Zephyr Cloak | Patch 1.4 elemental invasions (see retail patch notes)
18678, -- Tempestria's Frozen Necklace | Patch 1.4 elemental invasions (see retail patch notes)
18679, -- Frigid Ring | Patch 1.4 elemental invasions (see retail patch notes)
18680, -- Ancient Bone Bow | 1.4 Dungeon Loot table update (see retail patch notes)
18681, -- Burial Shawl | 1.4 Dungeon Loot table update (see retail patch notes)
18682, -- Ghoul Skin Leggings | 1.4 Dungeon loot table update (see retail patch notes)
18683, -- Hammer of the Vesper | 1.4 Dungeon Loot table update (see retail patch notes)
18686, -- Bone Golem Shoulders | 1.4 Dungeon Loot table update (see retail patch notes)
18689, -- Phantasmal Cloak | 1.4 Dungeon Loot table update (see retail patch notes)
18690, -- Wraithplate Leggings | 1.4 Dungeon Loot table update (see retail patch notes)
18691, -- Dark Advisor's Pendant | 1.4 Dungeon Loot table update (see retail patch notes)
18692, -- Death Knight Sabatons | 1.4 Dungeon Loot table update (see retail patch notes)
18693, -- Shivery Handwraps | 1.4 Dungeon loot table update (see retail patch notes)
18694, -- Shadowy Mail Greaves | 1.4 Dungeon Loot table update (see retail patch notes)
18695, -- Spellbound Tome | 1.4 Dungeon Loot table update (see retail patch notes)
18696, -- Intricately Runed Shield | 1.4 Dungeon Loot table update (see retail patch notes)
18697, -- Coldstone Slippers | 1.4 Dungeon Loot table update (see retail patch notes)
18698, -- Tattered Leather Hood | 1.4 Dungeon Loot table update (see retail patch notes)
18699, -- Icy Tomb Spaulders | 1.4 Dungeon Loot table update (see retail patch notes)
18700, -- Malefic Bracers | 1.4 Dungeon Loot table update (see retail patch notes)
18701, -- Innervating Band | 1.4 Dungeon Loot table update (see retail patch notes)
18702, -- Belt of the Ordained | 1.4 Dungeon Loot table update (see retail patch notes)
18703, -- Ancient Petrified Leaf | 1.4 Raid loot table update
18704, -- Mature Blue Dragon Sinew | 1.4 Raid loot table update
18705, -- Mature Black Dragon Sinew | 1.4 Raid loot table update
18709, -- Arena Wristguards | 1.4 Gurubashi arena event (see patch notes)
18710, -- Arena Bracers | 1.4 Gurubashi arena event (see patch notes)
18711, -- Arena Bands | 1.4 Gurubashi arena event (see patch notes)
18712, -- Arena Vambraces | 1.4 Gurubashi arena event (see patch notes)
18713, -- Rhok'delar, Longbow of the Ancient Keepers | 1.4 Raid loot table update
18715, -- Lok'delar, Stave of the Ancient Keepers | 1.4 Raid loot table update
18716, -- Ash Covered Boots | 1.4 Dungeon loot table update (see retail patch notes)
18717, -- Hammer of the Grand Crusader | 1.4 Dungeon loot table update (see retail patch notes)
18718, -- Grand Crusader's Helm | 1.4 Dungeon loot table update (see retail patch notes)
18720, -- Shroud of the Nathrezim | 1.4 Dungeon loot table update (see retail patch notes)
18721, -- Barrage Girdle | 1.4 Dungeon loot table update (see retail patch notes)
18722, -- Death Grips | 1.4 Dungeon loot table update (see retail patch notes)
18723, -- Animated Chain Necklace | 1.4 Dungeon loot table update (see retail patch notes)
18725, -- Peacemaker | 1.4 Dungeon loot table update (see retail patch notes)
18726, -- Magistrate's Cuffs | 1.4 Dungeon loot table update (see retail patch notes)
18727, -- Crimson Felt Hat | 1.4 Dungeon loot table update (see retail patch notes)
18728, -- Anastari Heirloom | 1.4 Dungeon loot table update (see retail patch notes)
18729, -- Screeching Bow | 1.4 Dungeon loot table update (see retail patch notes)
18730, -- Shadowy Laced Handwraps | 1.4 Dungeon loot table update (see retail patch notes)
18734, -- Pale Moon Cloak | 1.4 Dungeon loot table update (see retail patch notes)
18735, -- Maleki's Footwraps | 1.4 Dungeon loot table update (see retail patch notes)
18736, -- Plaguehound Leggings | 1.4 Dungeon loot table update (see retail patch notes)
18737, -- Bone Slicing Hatchet | 1.4 Dungeon loot table update (see retail patch notes)
18738, -- Carapace Spine Crossbow | 1.4 Dungeon loot table update (see retail patch notes)
18739, -- Chitinous Plate Legguards | 1.4 Dungeon loot table update (see retail patch notes)
18740, -- Thuzadin Sash | 1.4 Dungeon loot table update (see retail patch notes)
18741, -- Morlune's Bracer | 1.4 Dungeon loot table update (see retail patch notes)
18742, -- Stratholme Militia Shoulderguard | 1.4 Dungeon loot table update (see retail patch notes)
18743, -- Gracious Cape | 1.4 Dungeon loot table update (see retail patch notes)
18744, -- Plaguebat Fur Gloves | 1.4 Dungeon loot table update (see retail patch notes)
18745, -- Sacred Cloth Leggings | 1.4 Dungeon loot table update (see retail patch notes)
18754, -- Fel Hardened Bracers | 1.4 Warlock mount quest summon
18755, -- Xorothian Firestick | 1.4 Warlock mount quest summon
18756, -- Dreadguard's Protector | 1.4 Warlock mount quest summon
18757, -- Diabolic Mantle | 1.4 Warlock mount quest summon
18758, -- Specter's Blade | 1.4 Paladin mount quest summon
18759, -- Malicious Axe | 1.4 Paladin mount quest summon
18760, -- Necromantic Band | 1.4 Paladin mount quest summon
18761, -- Oblivion's Touch | 1.4 Paladin mount quest summon
18762, -- Shard of the Green Flame | 1.4 Warlock mount quest chain
18766, -- Reins of the Swift Frostsaber | 1.4 Mount model update
18767, -- Reins of the Swift Mistsaber | 1.4 Mount model update
18772, -- Swift Green Mechanostrider | 1.4 Mount model update
18773, -- Swift White Mechanostrider | 1.4 Mount model update
18774, -- Swift Yellow Mechanostrider | 1.4 Mount model update
18776, -- Swift Palomino | 1.4 Mount model update
18777, -- Swift Brown Steed | 1.4 Mount model update
18778, -- Swift White Steed | 1.4 Mount model update
18785, -- Swift White Ram | 1.4 Mount model update
18786, -- Swift Brown Ram | 1.4 Mount model update
18787, -- Swift Gray Ram | 1.4 Mount model update
18788, -- Swift Blue Raptor | 1.4 Mount model update
18789, -- Swift Olive Raptor | 1.4 Mount model update
18790, -- Swift Orange Raptor | 1.4 Mount model update
18791, -- Purple Skeletal Warhorse | 1.4 Mount model update
18793, -- Great White Kodo | 1.4 Mount model update
18794, -- Great Brown Kodo | 1.4 Mount model update
18795, -- Great Gray Kodo | 1.4 Mount model update
18796, -- Horn of the Swift Brown Wolf | 1.4 Mount model update
18797, -- Horn of the Swift Timber Wolf | 1.4 Mount model update
18798, -- Horn of the Swift Gray Wolf | 1.4 Mount model update
18902, -- Reins of the Swift Stormsaber | 1.4 Mount model update
18803, -- Finkle's Lava Dredger | 1.4 Raid loot table update
18805, -- Core Hound Tooth | 1.4 Raid loot table update
18806, -- Core Forged Greaves | 1.4 Raid loot table update
18807, -- Helm of Latent Power | 1.4 Paladin mount quest
18808, -- Gloves of the Hypnotic Flame | 1.4 Raid loot table update
18809, -- Sash of Whispered Secrets | 1.4 Raid loot table update
18810, -- Wild Growth Spaulders | 1.4 Raid loot table update
18811, -- Fireproof Cloak | 1.4 Raid loot table update
18812, -- Wristguards of True Flight | 1.4 Raid loot table update
18813, -- Ring of Binding | 1.4 Raid loot table update
18814, -- Choker of the Fire Lord | 1.4 Raid loot table update
18815, -- Essence of the Pure Flame | 1.4 Raid loot table update
18816, -- Perdition's Blade | 1.4 Raid loot table update
18817, -- Crown of Destruction | 1.4 Raid loot table update
18820, -- Talisman of Ephemeral Power | 1.4 Raid loot table update
18821, -- Quick Strike Ring | 1.4 Raid loot table update
18822, -- Obsidian Edged Blade | 1.4 Raid loot table update
18823, -- Aged Core Leather Gloves | 1.4 Raid loot table update
18824, -- Magma Tempered Boots | 1.4 Raid loot table update
18825, -- Grand Marshal's Aegis | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
18826, -- High Warlord's Shield Wall | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
18827, -- Grand Marshal's Handaxe | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
18828, -- High Warlord's Cleaver | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
18829, -- Deep Earth Spaulders | 1.4 Raid loot table update
18830, -- Grand Marshal's Sunderer | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
18831, -- High Warlord's Battle Axe | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
18832, -- Brutality Blade | 1.4 Raid loot table update
18833, -- Grand Marshal's Bullseye | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
18834, -- Insignia of the Horde | Added with PvP Honor System (NOTE: Originally patch 1.4)
18835, -- High Warlord's Recurve | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
18836, -- Grand Marshal's Repeater | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
18837, -- High Warlord's Crossbow | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
18838, -- Grand Marshal's Dirk | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
18840, -- High Warlord's Razor | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
18842, -- Staff of Dominance | 1.4 Raid loot table update
18843, -- Grand Marshal's Right Hand Blade | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
18844, -- High Warlord's Right Claw | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
18845, -- Insignia of the Horde | Added with PvP Honor System (NOTE: Originally patch 1.4)
18846, -- Insignia of the Horde | Added with PvP Honor System (NOTE: Originally patch 1.4)
18847, -- Grand Marshal's Left Hand Blade | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
18848, -- High Warlord's Left Claw | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
18849, -- Insignia of the Horde | Added with PvP Honor System (NOTE: Originally patch 1.4)
18850, -- Insignia of the Horde | Added with PvP Honor System (NOTE: Originally patch 1.4)
18851, -- Insignia of the Horde | Added with PvP Honor System (NOTE: Originally patch 1.4)
18852, -- Insignia of the Horde | Added with PvP Honor System (NOTE: Originally patch 1.4)
18853, -- Insignia of the Horde | Added with PvP Honor System (NOTE: Originally patch 1.4)
18854, -- Insignia of the Alliance | Added with PvP Honor System (NOTE: Originally patch 1.4)
18855, -- Grand Marshal's Hand Cannon | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
18856, -- Insignia of the Alliance | Added with PvP Honor System (NOTE: Originally patch 1.4)
18857, -- Insignia of the Alliance | Added with PvP Honor System (NOTE: Originally patch 1.4)
18858, -- Insignia of the Alliance | Added with PvP Honor System (NOTE: Originally patch 1.4)
18859, -- Insignia of the Alliance | Added with PvP Honor System (NOTE: Originally patch 1.4)
18860, -- High Warlord's Street Sweeper | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
18861, -- Flamewaker Legplates | 1.4 Raid loot table update
18862, -- Insignia of the Alliance | Added with PvP Honor System (NOTE: Originally patch 1.4)
18863, -- Insignia of the Alliance | Added with PvP Honor System (NOTE: Originally patch 1.4)
18864, -- Insignia of the Alliance | Added with PvP Honor System (NOTE: Originally patch 1.4)
18865, -- Grand Marshal's Punisher | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
18866, -- High Warlord's Bludgeon | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
18867, -- Grand Marshal's Battle Hammer | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
18868, -- High Warlord's Pulverizer | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
18869, -- Grand Marshal's Glaive | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
18870, -- Helm of the Lifegiver | 1.4 Raid loot table update
18871, -- High Warlord's Pig Sticker | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
18872, -- Manastorm Leggings | 1.4 Raid loot table update
18873, -- Grand Marshal's Stave | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
18874, -- High Warlord's War Staff | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
18875, -- Salamander Scale Pants | 1.4 Raid loot table update
18876, -- Grand Marshal's Claymore | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
18877, -- High Warlord's Greatsword | "Added with PvP Honor System (NOTE: Originally patch 1.4, stats updated in 1.11
18878, -- Sorcerous Dagger | 1.4 Raid loot table update
18879, -- Heavy Dark Iron Ring | 1.4 Raid loot table update
19024, -- Arena Grand Master | 1.4 Gurubashi arena event (see patch notes)
19160 -- Contest Winner's Tabard | May 24th 2005 PvP contest prize (http://web.archive.org/web/20080512214719/http://www.worldofwarcraft.com/contests/05-04-19-honorsystem/)
);
 
-- * NEW CREATURES

REPLACE INTO new_creatures SELECT entry FROM creature_template WHERE entry IN (
);
	
-- * NEW QUESTS	

REPLACE INTO new_quests SELECT entry FROM quest_template WHERE entry IN (
171,  -- A Warden of the Alliance | Childrens Week added (1.4 patch notes)
172,  -- Children's Week | Childrens Week added (1.4 patch notes)
7487, -- Attunement to the Core | Molten core discovery quest changed to attunement (1.4 patch notes)
7541, -- Service to the Horde | Minor questline added
7562, -- Mor'zul Bloodbringer | 1.4 Warlock mount quest
7563, -- Rage of Blood | 1.4 Warlock mount quest
7564, -- Wildeyes | 1.4 Warlock mount quest
7581, -- The Prison's Bindings | 1.4 Warlock mount quest
7582, -- The Prison's Casing | 1.4 Warlock mount quest
7583, -- Suppression | 1.4 Warlock mount quest
7601, -- What Niby Commands | 1.4 Warlock mount quest
7602, -- Flawless Fel Essence | 1.4 Warlock mount quest
7603, -- Kroshius' Infernal Core | 1.4 Warlock mount quest
7604, -- A Binding Contract | 1.4 Raid loot table update (Sulfuras)
7621, -- A Warning | 1.4 Raid loot table update (Benediction)
7622, -- The Balance of Light and Shadow | 1.4 Raid loot table update (Benediction)
7623, -- Lord Banehollow | 1.4 Warlock mount quest
7624, -- Ulathek the Traitor | 1.4 Warlock mount quest
7625, -- Xorothian Stardust | 1.4 Warlock mount quest
7626, -- Bell of Dethmoora | 1.4 Warlock mount quest
7627, -- Wheel of the Black March | 1.4 Warlock mount quest
7628, -- Doomsday Candle | 1.4 Warlock mount quest
7629, -- Imp Delivery | 1.4 Warlock mount quest
7630, -- Arcanite | 1.4 Warlock mount quest
7631, -- Dreadsteed of Xoroth | 1.4 Warlock mount quest
7632, -- The Ancient Leaf | 1.4 Raid loot table update (hunter leaf quest)
7633, -- An Introduction | 1.4 Raid loot table update (hunter leaf quest)
7634, -- Ancient Sinew Wrapped Lamina | 1.4 Raid loot table update (hunter leaf quest)
7635, -- A Proper String | 1.4 Raid loot table update (hunter leaf quest)
7636, -- Stave of the Ancients | 1.4 Raid loot table update (hunter leaf quest)
7637, -- Emphasis on Sacrifice | 1.4 Paladin mount quest
7638, -- Lord Grayson Shadowbreaker | 1.4 Paladin mount quest
7639, -- To Show Due Judgment | 1.4 Paladin mount quest
7640, -- Exorcising Terrordale | 1.4 Paladin mount quest
7641, -- The Work of Grimand Elmore | 1.4 Paladin mount quest
7642, -- Collection of Goods | 1.4 Paladin mount quest
7643, -- Ancient Equine Spirit | 1.4 Paladin mount quest
7644, -- Blessed Arcanite Barding | 1.4 Paladin mount quest
7645, -- Manna-Enriched Horse Feed | 1.4 Paladin mount quest
7646, -- The Divination Scryer | 1.4 Paladin mount quest
7647, -- Judgment and Redemption | 1.4 Paladin mount quest
7648, -- Grimand's Finest Work | 1.4 Paladin mount quest
7649, -- Enchanted Thorium Platemail: Volume I | Added April 2005 with patch
7650, -- Enchanted Thorium Platemail: Volume II | Added April 2005 with patch
7651, -- Enchanted Thorium Platemail: Volume III | Added April 2005 with patch
7652, -- A Blue Light Bargain | Added April 2005 with patch
7653, -- Imperial Plate Belt | Added April 2005 with patch
7654, -- Imperial Plate Boots | Added April 2005 with patch
7655, -- Imperial Plate Bracer | Added April 2005 with patch
7656, -- Imperial Plate Chest | Added April 2005 with patch
7657, -- Imperial Plate Helm | Added April 2005 with patch
7658, -- Imperial Plate Leggings | Added April 2005 with patch
7659, -- Imperial Plate Shoulders | Added April 2005 with patch
7660, -- Wolf Swapping - Arctic Wolf | New mount models (1.4 patch notes)
7661, -- Wolf Swapping - Red Wolf | New mount models (1.4 patch notes)
7662, -- New Kodo - Teal | New mount models (1.4 patch notes)
7663, -- New Kodo - Green | New mount models (1.4 patch notes)
7664, -- Ivory Raptor Replacement | New mount models (1.4 patch notes)
7665, -- Red Raptor Replacement | New mount models (1.4 patch notes)
7666, -- Again Into the Great Ossuary | 1.4 Paladin mount quest
7671, -- Frostsaber Replacement | New mount models (1.4 patch notes)
7672, -- Nightsaber Replacement | New mount models (1.4 patch notes)
7673, -- Frost Ram Exchange | New mount models (1.4 patch notes)
7674, -- Black Ram Exchange | New mount models (1.4 patch notes)
7675, -- Icy Blue Mechanostrider Replacement | New mount models (1.4 patch notes)
7676, -- White Mechanostrider Replacement | New mount models (1.4 patch notes)
7677, -- White Stallion Exchange | New mount models (1.4 patch notes)
7678, -- Palomino Exchange | New mount models (1.4 patch notes)
7810, -- Arena Master | 1.4 Gurubashi arena event (see patch notes)
7838  -- Arena Grandmaster | 1.4 Gurubashi arena event (see patch notes)
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
