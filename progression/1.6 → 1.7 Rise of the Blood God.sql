-- 1.2 → 1.3 | Rise of the Blood God

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

UPDATE `areatrigger_teleport` SET `required_level` = 61 WHERE `target_map` = 309; -- Zul'Gurub 1.7

-- * NEW EVENTS 	

REPLACE INTO new_events SELECT entry FROM game_event WHERE entry IN (14, 15, 40, 164
14,   -- Stranglethorn Fishing Extravaganza: Announce
15,   -- Stranglethorn Fishing Extravaganza: Tournament
40,   -- Stranglethorn Fishing Extravaganza: The Crew
164,   -- Patch 1.7
);

-- * NEW ITEMS 	

REPLACE INTO new_items SELECT entry FROM item_template WHERE entry IN (
19574, -- Strength of Mugamba | ZG Rep Reward
19575, -- Strength of Mugamba | ZG Rep Reward
19576, -- Strength of Mugamba | ZG Rep Reward
19577, -- Rage of Mugamba | ZG Rep Reward
19579, -- Heathen's Brand | ZG Rep Reward
19585, -- Heathen's Brand | ZG Rep Reward
19586, -- Heathen's Brand | ZG Rep Reward
19588, -- Hero's Brand | ZG Rep Reward
19591, -- The Eye of Zuldazar | ZG Rep Reward
19592, -- The Eye of Zuldazar | ZG Rep Reward
19593, -- The Eye of Zuldazar | ZG Rep Reward
19594, -- The All-Seeing Eye of Zuldazar | ZG Rep Reward
19598, -- Pebble of Kajaro | ZG Rep Reward
19599, -- Pebble of Kajaro | ZG Rep Reward
19600, -- Pebble of Kajaro | ZG Rep Reward
19601, -- Jewel of Kajaro | ZG Rep Reward
19602, -- Kezan's Taint | ZG Rep Reward
19603, -- Kezan's Taint | ZG Rep Reward
19604, -- Kezan's Taint | ZG Rep Reward
19605, -- Kezan's Unstoppable Taint | ZG Rep Reward
19606, -- Vision of Voodress | ZG Rep Reward
19607, -- Vision of Voodress | ZG Rep Reward
19608, -- Vision of Voodress | ZG Rep Reward
19609, -- Unmarred Vision of Voodress | ZG Rep Reward
19610, -- Enchanted South Seas Kelp | ZG Rep Reward
19611, -- Enchanted South Seas Kelp | ZG Rep Reward
19612, -- Enchanted South Seas Kelp | ZG Rep Reward
19613, -- Pristine Enchanted South Seas Kelp | ZG Rep Reward
19614, -- Zandalarian Shadow Talisman | ZG Rep Reward
19615, -- Zandalarian Shadow Talisman | ZG Rep Reward
19616, -- Zandalarian Shadow Talisman | ZG Rep Reward
19617, -- Zandalarian Shadow Mastery Talisman | ZG Rep Reward
19618, -- Maelstrom's Tendril | ZG Rep Reward
19619, -- Maelstrom's Tendril | ZG Rep Reward
19620, -- Maelstrom's Tendril | ZG Rep Reward
19621, -- Maelstrom's Wrath | ZG Rep Reward
19682, -- Bloodvine Vest | ZG Rep Reward
19683, -- Bloodvine Leggings | ZG Rep Reward
19684, -- Bloodvine Boots | ZG Rep Reward
19685, -- Primal Batskin Jerkin | ZG Rep Reward
19686, -- Primal Batskin Gloves | ZG Rep Reward
19687, -- Primal Batskin Bracers | ZG Rep Reward
19688, -- Blood Tiger Breastplate | ZG Rep Reward
19689, -- Blood Tiger Shoulders | ZG Rep Reward
19690, -- Bloodsoul Breastplate | ZG Rep Reward
19691, -- Bloodsoul Shoulders | ZG Rep Reward
19692, -- Bloodsoul Gauntlets | ZG Rep Reward
19693, -- Darksoul Breastplate | ZG Rep Reward
19694, -- Darksoul Leggings | ZG Rep Reward
19695, -- Darksoul Shoulders | ZG Rep Reward
19697, -- Bounty of the Harvest | Horde ONLY reward by mail for completing quest 8150 (Allakhazam dating)
19760, -- Overlord's Embrace | ZG Loot
19764, -- Pattern: Bloodvine Vest | ZG Rep Reward
19765, -- Pattern: Bloodvine Leggings | ZG Rep Reward
19766, -- Pattern: Bloodvine Boots | ZG Rep Reward
19769, -- Pattern: Primal Batskin Jerkin | ZG Rep Reward
19770, -- Pattern: Primal Batskin Gloves | ZG Rep Reward
19771, -- Pattern: Primal Batskin Bracers | ZG Rep Reward
19772, -- Pattern: Blood Tiger Breastplate | ZG Rep Reward
19773, -- Pattern: Blood Tiger Shoulders | ZG Rep Reward
19776, -- Plans: Bloodsoul Breastplate | ZG Rep Reward
19777, -- Plans: Bloodsoul Shoulders | ZG Rep Reward
19778, -- Plans: Bloodsoul Gauntlets | ZG Rep Reward
19779, -- Plans: Darksoul Breastplate | ZG Rep Reward
19780, -- Plans: Darksoul Leggings | ZG Rep Reward
19781, -- Plans: Darksoul Shoulders | ZG Rep Reward
19808, -- Rockhide Strongfish | Fishing contest event
19812, -- Rune of the Dawn | New AD trinket reward, 1.7 retail patch notes
19822, -- Zandalar Vindicator's Breastplate | ZG Loot
19823, -- Zandalar Vindicator's Belt | ZG Loot
19824, -- Zandalar Vindicator's Armguards | ZG Loot
19825, -- Zandalar Freethinker's Breastplate | ZG Loot
19826, -- Zandalar Freethinker's Belt | ZG Loot
19827, -- Zandalar Freethinker's Armguards | ZG Loot
19828, -- Zandalar Augur's Hauberk | ZG Loot
19829, -- Zandalar Augur's Belt | ZG Loot
19830, -- Zandalar Augur's Bracers | ZG Loot
19831, -- Zandalar Predator's Mantle | ZG Loot
19832, -- Zandalar Predator's Belt | ZG Loot
19833, -- Zandalar Predator's Bracers | ZG Loot
19834, -- Zandalar Madcap's Tunic | ZG Loot
19835, -- Zandalar Madcap's Mantle | ZG Loot
19836, -- Zandalar Madcap's Bracers | ZG Loot
19838, -- Zandalar Haruspex's Tunic | ZG Loot
19839, -- Zandalar Haruspex's Belt | ZG Loot
19840, -- Zandalar Haruspex's Bracers | ZG Loot
19841, -- Zandalar Confessor's Mantle | ZG Loot
19842, -- Zandalar Confessor's Bindings | ZG Loot
19843, -- Zandalar Confessor's Wraps | ZG Loot
19845, -- Zandalar Illusionist's Mantle | ZG Loot
19846, -- Zandalar Illusionist's Wraps | ZG Loot
19848, -- Zandalar Demoniac's Wraps | ZG Loot
19849, -- Zandalar Demoniac's Mantle | ZG Loot
19852, -- Ancient Hakkari Manslayer | ZG Loot
19853, -- Gurubashi Dwarf Destroyer | ZG Loot
19854, -- Zin'rokh, Destroyer of Worlds | ZG Loot
19855, -- Bloodsoaked Legplates | ZG Loot
19856, -- The Eye of Hakkar | ZG Loot
19857, -- Cloak of Consumption | ZG Loot
19859, -- Fang of the Faceless | ZG Loot
19861, -- Touch of Chaos | ZG Loot
19862, -- Aegis of the Blood God | ZG Loot
19863, -- Primalist's Seal | ZG Loot
19864, -- Bloodcaller | ZG Loot
19865, -- Warblade of the Hakkari | ZG Loot
19866, -- Warblade of the Hakkari | ZG Loot
19867, -- Bloodlord's Defender | ZG Loot
19869, -- Blooddrenched Grips | ZG Loot
19870, -- Hakkari Loa Cloak | ZG Loot
19871, -- Talisman of Protection | ZG Loot
19873, -- Overlord's Crimson Band | ZG Loot
19874, -- Halberd of Smiting | ZG Loot
19875, -- Bloodstained Coif | ZG Loot
19876, -- Soul Corrupter's Necklace | ZG Loot
19877, -- Animist's Leggings | ZG Loot
19878, -- Bloodsoaked Pauldrons | ZG Loot
19884, -- Jin'do's Judgement | ZG Loot
19885, -- Jin'do's Evil Eye | ZG Loot
19886, -- The Hexxer's Cover | ZG Loot
19887, -- Bloodstained Legplates | ZG Loot
19888, -- Overlord's Embrace | ZG Loot
19889, -- Blooddrenched Leggings | ZG Loot
19890, -- Jin'do's Hexxer | ZG Loot
19891, -- Jin'do's Bag of Whammies | ZG Loot
19892, -- Animist's Boots | ZG Loot
19893, -- Zanzil's Seal | ZG Loot
19894, -- Bloodsoaked Gauntlets | ZG Loot
19895, -- Bloodtinged Kilt | ZG Loot
19896, -- Thekal's Grasp | ZG Loot
19897, -- Betrayer's Boots | ZG Loot
19898, -- Seal of Jin | ZG Loot
19899, -- Ritualistic Legguards | ZG Loot
19900, -- Zulian Stone Axe | ZG Loot
19901, -- Zulian Slicer | ZG Loot
19903, -- Fang of Venoxis | ZG Loot
19904, -- Runed Bloodstained Hauberk | ZG Loot
19905, -- Zanzil's Band | ZG Loot
19906, -- Blooddrenched Footpads | ZG Loot
19907, -- Zulian Tigerhide Cloak | ZG Loot
19908, -- Sceptre of Smiting | ZG Loot
19909, -- Will of Arlokk | ZG Loot
19910, -- Arlokk's Grasp | ZG Loot
19912, -- Overlord's Onyx Band | ZG Loot
19913, -- Bloodsoaked Greaves | ZG Loot
19915, -- Zulian Defender | ZG Loot
19918, -- Jeklik's Crusher | ZG Loot
19919, -- Bloodstained Greaves | ZG Loot
19920, -- Primalist's Band | ZG Loot
19922, -- Arlokk's Hoodoo Stick | ZG Loot
19923, -- Jeklik's Opaline Talisman | ZG Loot
19925, -- Band of Jin | ZG Loot
19927, -- Mar'li's Touch | ZG Loot
19928, -- Animist's Spaulders | ZG Loot
19929, -- Bloodtinged Gloves | ZG Loot
19930, -- Mar'li's Eye | ZG Loot
19944, -- Nat Pagle's Fish Terminator | ZG Loot
19945, -- Foror's Eyepatch | ZG Loot
19946, -- Tigule's Harpoon | ZG Loot
19947, -- Nat Pagle's Broken Reel | ZG Loot
19948, -- Zandalarian Hero Badge | ZG Loot
19949, -- Zandalarian Hero Medallion | ZG Loot
19950, -- Zandalarian Hero Charm | ZG Loot
19951, -- Gri'lek's Charm of Might | ZG Loot
19952, -- Gri'lek's Charm of Valor | ZG Loot
19953, -- Renataki's Charm of Beasts | ZG Loot
19954, -- Renataki's Charm of Trickery | ZG Loot
19955, -- Wushoolay's Charm of Nature | ZG Loot
19956, -- Wushoolay's Charm of Spirits | ZG Loot
19957, -- Hazza'rah's Charm of Destruction | ZG Loot
19958, -- Hazza'rah's Charm of Healing | ZG Loot
19959, -- Hazza'rah's Charm of Magic | ZG Loot
19961, -- Gri'lek's Grinder | ZG Loot
19962, -- Gri'lek's Carver | ZG Loot
19963, -- Pitchfork of Madness | ZG Loot
19964, -- Renataki's Soul Conduit | ZG Loot
19965, -- Wushoolay's Poker | ZG Loot
19967, -- Thoughtblighter | ZG Loot
19968, -- Fiery Retributer | ZG Loot
19969, -- Nat Pagle's Extreme Anglin' Boots | Fishing contest reward
19970, -- Arcanite Fishing Pole | Fishing contest reward
19972, -- Lucky Fishing Hat | Fishing contest reward
19979, -- Hook of the Master Angler | Fishing contest reward
19982, -- Duskbat Drape | LVL 50 class quest (rogue), see retail 1.7 patch notes
19984, -- Ebon Mask | LVL 50 class quest (rogue), see retail 1.7 patch notes
19990, -- Blessed Prayer Beads | LVL 50 class quest (priest), see retail 1.7 patch notes
19991, -- Devilsaur Eye | LVL 50 class quest (hunter), see retail 1.7 patch notes
19992, -- Devilsaur Tooth | LVL 50 class quest (hunter), see retail 1.7 patch notes
19993, -- Hoodoo Hunting Bow | ZG Loot
19998, -- Bloodvine Lens | ZG Rep Reward
19999, -- Bloodvine Goggles | ZG Rep Reward
20000, -- Schematic: Bloodvine Goggles | ZG Rep Reward
20001, -- Schematic: Bloodvine Lens | ZG Rep Reward
20006, -- Circle of Hope | LVL 50 class quest (priest), see retail 1.7 patch notes
20032, -- Flowing Ritual Robes | ZG Loot
20033, -- Zandalar Demoniac's Robe | ZG Loot
20034, -- Zandalar Illusionist's Robe | ZG Loot
20035, -- Glacial Spike | LVL 50 class quest (mage), see retail 1.7 patch notes
20036, -- Fire Ruby | LVL 50 class quest (mage), see retail 1.7 patch notes
20037, -- Arcane Crystal Pendant | LVL 50 class quest (mage), see retail 1.7 patch notes
20038, -- Mandokir's Sting | ZG Loot
20039, -- Dark Iron Boots | New Thorium Brotherhood Reward (wowwiki, github)
20040, -- Plans: Dark Iron Boots | New Thorium Brotherhood Reward (wowwiki, github)
20041, -- Highlander's Plate Girdle | AB rep rewards (originally patch 1.7)
20042, -- Highlander's Lamellar Girdle | AB rep rewards (originally patch 1.7)
20043, -- Highlander's Chain Girdle | AB rep rewards (originally patch 1.7)
20044, -- Highlander's Mail Girdle | AB rep rewards (originally patch 1.7)
20045, -- Highlander's Leather Girdle | AB rep rewards (originally patch 1.7)
20046, -- Highlander's Lizardhide Girdle | AB rep rewards (originally patch 1.7)
20047, -- Highlander's Cloth Girdle | AB rep rewards (originally patch 1.7)
20048, -- Highlander's Plate Greaves | AB rep rewards (originally patch 1.7)
20049, -- Highlander's Lamellar Greaves | AB rep rewards (originally patch 1.7)
20050, -- Highlander's Chain Greaves | AB rep rewards (originally patch 1.7)
20051, -- Highlander's Mail Greaves | AB rep rewards (originally patch 1.7)
20052, -- Highlander's Leather Boots | AB rep rewards (originally patch 1.7)
20053, -- Highlander's Lizardhide Boots | AB rep rewards (originally patch 1.7)
20054, -- Highlander's Cloth Boots | AB rep rewards (originally patch 1.7)
20055, -- Highlander's Chain Pauldrons | AB rep rewards (originally patch 1.7)
20056, -- Highlander's Mail Pauldrons | AB rep rewards (originally patch 1.7)
20057, -- Highlander's Plate Spaulders | AB rep rewards (originally patch 1.7)
20058, -- Highlander's Lamellar Spaulders | AB rep rewards (originally patch 1.7)
20059, -- Highlander's Leather Shoulders | AB rep rewards (originally patch 1.7)
20060, -- Highlander's Lizardhide Shoulders | AB rep rewards (originally patch 1.7)
20061, -- Highlander's Epaulets | AB rep rewards (originally patch 1.7)
20068, -- Deathguard's Cloak | AB rep rewards (originally patch 1.7)
20069, -- Ironbark Staff | AB rep rewards (originally patch 1.7)
20070, -- Sageclaw | AB rep rewards (originally patch 1.7)
20071, -- Talisman of Arathor | AB rep rewards (originally patch 1.7)
20072, -- Defiler's Talisman | AB rep rewards (originally patch 1.7)
20073, -- Cloak of the Honor Guard | AB rep rewards (originally patch 1.7)
20082, -- Woestave | LVL 50 class quest (priest), see retail 1.7 patch notes
20083, -- Hunting Spear | LVL 50 class quest (hunter), see retail 1.7 patch notes
20086, -- Dusksteel Throwing Knife | Ravenholdt repeatable quest added (Allakhazam dating)
20088, -- Highlander's Chain Girdle | AB rep rewards (originally patch 1.7)
20089, -- Highlander's Chain Girdle | AB rep rewards (originally patch 1.7)
20090, -- Highlander's Chain Girdle | AB rep rewards (originally patch 1.7)
20091, -- Highlander's Chain Greaves | AB rep rewards (originally patch 1.7)
20092, -- Highlander's Chain Greaves | AB rep rewards (originally patch 1.7)
20093, -- Highlander's Chain Greaves | AB rep rewards (originally patch 1.7)
20094, -- Highlander's Cloth Boots | AB rep rewards (originally patch 1.7)
20095, -- Highlander's Cloth Boots | AB rep rewards (originally patch 1.7)
20096, -- Highlander's Cloth Boots | AB rep rewards (originally patch 1.7)
20097, -- Highlander's Cloth Girdle | AB rep rewards (originally patch 1.7)
20098, -- Highlander's Cloth Girdle | AB rep rewards (originally patch 1.7)
20099, -- Highlander's Cloth Girdle | AB rep rewards (originally patch 1.7)
20100, -- Highlander's Lizardhide Boots | AB rep rewards (originally patch 1.7)
20101, -- Highlander's Lizardhide Boots | AB rep rewards (originally patch 1.7)
20102, -- Highlander's Lizardhide Boots | AB rep rewards (originally patch 1.7)
20103, -- Highlander's Lizardhide Girdle | AB rep rewards (originally patch 1.7)
20104, -- Highlander's Lizardhide Girdle | AB rep rewards (originally patch 1.7)
20105, -- Highlander's Lizardhide Girdle | AB rep rewards (originally patch 1.7)
20106, -- Highlander's Lamellar Girdle | AB rep rewards (originally patch 1.7)
20107, -- Highlander's Lamellar Girdle | AB rep rewards (originally patch 1.7)
20108, -- Highlander's Lamellar Girdle | AB rep rewards (originally patch 1.7)
20109, -- Highlander's Lamellar Greaves | AB rep rewards (originally patch 1.7)
20110, -- Highlander's Lamellar Greaves | AB rep rewards (originally patch 1.7)
20111, -- Highlander's Lamellar Greaves | AB rep rewards (originally patch 1.7)
20112, -- Highlander's Leather Boots | AB rep rewards (originally patch 1.7)
20113, -- Highlander's Leather Boots | AB rep rewards (originally patch 1.7)
20114, -- Highlander's Leather Boots | AB rep rewards (originally patch 1.7)
20115, -- Highlander's Leather Girdle | AB rep rewards (originally patch 1.7)
20116, -- Highlander's Leather Girdle | AB rep rewards (originally patch 1.7)
20117, -- Highlander's Leather Girdle | AB rep rewards (originally patch 1.7)
20124, -- Highlander's Plate Girdle | AB rep rewards (originally patch 1.7)
20125, -- Highlander's Plate Girdle | AB rep rewards (originally patch 1.7)
20126, -- Highlander's Plate Girdle | AB rep rewards (originally patch 1.7)
20127, -- Highlander's Plate Greaves | AB rep rewards (originally patch 1.7)
20128, -- Highlander's Plate Greaves | AB rep rewards (originally patch 1.7)
20129, -- Highlander's Plate Greaves | AB rep rewards (originally patch 1.7)
20131, -- Battle Tabard of the Defilers | AB rep rewards (originally patch 1.7)
20132, -- Arathor Battle Tabard | AB rep rewards (originally patch 1.7)
20134, -- Skyfury Helm | Quest added for Scholomance (horde) (allakhazam dating)
20150, -- Defiler's Chain Girdle | AB rep rewards (originally patch 1.7)
20151, -- Defiler's Chain Girdle | AB rep rewards (originally patch 1.7)
20152, -- Defiler's Chain Girdle | AB rep rewards (originally patch 1.7)
20153, -- Defiler's Chain Girdle | AB rep rewards (originally patch 1.7)
20154, -- Defiler's Chain Greaves | AB rep rewards (originally patch 1.7)
20155, -- Defiler's Chain Greaves | AB rep rewards (originally patch 1.7)
20156, -- Defiler's Chain Greaves | AB rep rewards (originally patch 1.7)
20157, -- Defiler's Chain Greaves | AB rep rewards (originally patch 1.7)
20158, -- Defiler's Chain Pauldrons | AB rep rewards (originally patch 1.7)
20159, -- Defiler's Cloth Boots | AB rep rewards (originally patch 1.7)
20160, -- Defiler's Cloth Boots | AB rep rewards (originally patch 1.7)
20161, -- Defiler's Cloth Boots | AB rep rewards (originally patch 1.7)
20162, -- Defiler's Cloth Boots | AB rep rewards (originally patch 1.7)
20163, -- Defiler's Cloth Girdle | AB rep rewards (originally patch 1.7)
20164, -- Defiler's Cloth Girdle | AB rep rewards (originally patch 1.7)
20165, -- Defiler's Cloth Girdle | AB rep rewards (originally patch 1.7)
20166, -- Defiler's Cloth Girdle | AB rep rewards (originally patch 1.7)
20167, -- Defiler's Lizardhide Boots | AB rep rewards (originally patch 1.7)
20168, -- Defiler's Lizardhide Boots | AB rep rewards (originally patch 1.7)
20169, -- Defiler's Lizardhide Boots | AB rep rewards (originally patch 1.7)
20170, -- Defiler's Lizardhide Boots | AB rep rewards (originally patch 1.7)
20171, -- Defiler's Lizardhide Girdle | AB rep rewards (originally patch 1.7)
20172, -- Defiler's Lizardhide Girdle | AB rep rewards (originally patch 1.7)
20173, -- Defiler's Lizardhide Girdle | AB rep rewards (originally patch 1.7)
20174, -- Defiler's Lizardhide Girdle | AB rep rewards (originally patch 1.7)
20175, -- Defiler's Lizardhide Shoulders | AB rep rewards (originally patch 1.7)
20176, -- Defiler's Epaulets | AB rep rewards (originally patch 1.7)
20177, -- Defiler's Lamellar Girdle | AB rep rewards (originally patch 1.7)
20181, -- Defiler's Lamellar Greaves | AB rep rewards (originally patch 1.7)
20184, -- Defiler's Lamellar Spaulders | AB rep rewards (originally patch 1.7)
20186, -- Defiler's Leather Boots | AB rep rewards (originally patch 1.7)
20187, -- Defiler's Leather Boots | AB rep rewards (originally patch 1.7)
20188, -- Defiler's Leather Boots | AB rep rewards (originally patch 1.7)
20189, -- Defiler's Leather Boots | AB rep rewards (originally patch 1.7)
20190, -- Defiler's Leather Girdle | AB rep rewards (originally patch 1.7)
20191, -- Defiler's Leather Girdle | AB rep rewards (originally patch 1.7)
20192, -- Defiler's Leather Girdle | AB rep rewards (originally patch 1.7)
20193, -- Defiler's Leather Girdle | AB rep rewards (originally patch 1.7)
20194, -- Defiler's Leather Shoulders | AB rep rewards (originally patch 1.7)
20195, -- Defiler's Mail Girdle | AB rep rewards (originally patch 1.7)
20196, -- Defiler's Mail Girdle | AB rep rewards (originally patch 1.7)
20197, -- Defiler's Mail Girdle | AB rep rewards (originally patch 1.7)
20198, -- Defiler's Mail Girdle | AB rep rewards (originally patch 1.7)
20199, -- Defiler's Mail Greaves | AB rep rewards (originally patch 1.7)
20200, -- Defiler's Mail Greaves | AB rep rewards (originally patch 1.7)
20201, -- Defiler's Mail Greaves | AB rep rewards (originally patch 1.7)
20202, -- Defiler's Mail Greaves | AB rep rewards (originally patch 1.7)
20203, -- Defiler's Mail Pauldrons | AB rep rewards (originally patch 1.7)
20204, -- Defiler's Plate Girdle | AB rep rewards (originally patch 1.7)
20205, -- Defiler's Plate Girdle | AB rep rewards (originally patch 1.7)
20206, -- Defiler's Plate Girdle | AB rep rewards (originally patch 1.7)
20207, -- Defiler's Plate Girdle | AB rep rewards (originally patch 1.7)
20208, -- Defiler's Plate Greaves | AB rep rewards (originally patch 1.7)
20209, -- Defiler's Plate Greaves | AB rep rewards (originally patch 1.7)
20210, -- Defiler's Plate Greaves | AB rep rewards (originally patch 1.7)
20211, -- Defiler's Plate Greaves | AB rep rewards (originally patch 1.7)
20212, -- Defiler's Plate Spaulders | AB rep rewards (originally patch 1.7)
20213, -- Belt of Shrunken Heads | ZG Quest
20214, -- Mindfang | AB rep rewards (originally patch 1.7)
20215, -- Belt of Shriveled Heads | ZG Quest
20216, -- Belt of Preserved Heads | ZG Quest
20217, -- Belt of Tiny Heads | ZG Quest
20218, -- Faded Hakkari Cloak | ZG RP quest added
20219, -- Tattered Hakkari Cape | ZG RP quest added
20220, -- Ironbark Staff | AB rep rewards (originally patch 1.7)
20255, -- Whisperwalk Boots | LVL 50 class quest (rogue), see retail 1.7 patch notes
20257, -- Seafury Gauntlets | ZG Loot
20258, -- Zulian Ceremonial Staff | ZG Loot
20259, -- Shadow Panther Hide Gloves | ZG Loot
20260, -- Seafury Leggings | ZG Loot
20261, -- Shadow Panther Hide Belt | ZG Loot
20262, -- Seafury Boots | ZG Loot
20263, -- Gurubashi Helm | ZG Loot
20264, -- Peacekeeper Gauntlets | ZG Loot
20265, -- Peacekeeper Boots | ZG Loot
20266; -- Peacekeeper Leggings | ZG Loot
);
	
-- * NEW CREATURES

REPLACE INTO new_creatures SELECT entry FROM creature_template WHERE entry IN (1000
);
		
-- * NEW QUESTS	

REPLACE INTO new_quests SELECT entry FROM quest_template WHERE entry IN (
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
);

-- * NEW SPELLS	

DELETE FROM spell_disabled WHERE entry IN (1000);
			
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
