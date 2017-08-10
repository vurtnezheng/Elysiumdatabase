-- 1.2 → 1.3 | Ruins of the Dire Maul 

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
-- - 9.  ITEM STATS CHANGES
-- - 10. ADDITIONAL FIXES    

-- * NEW ENCOUNTER	

UPDATE `areatrigger_teleport` SET `required_level` = 45 WHERE `target_map` = 429; -- Dire Maul 1.3

-- * NEW EVENTS 	

REPLACE INTO new_events SELECT entry FROM game_event WHERE entry IN (
35,   -- The Maul: Mushgog
36,   -- The Maul: Skarr the Unbreakable
37,   -- The Maul: Razza
42,   -- The Maul, Grininlix /yell Mushgog
43,   -- The Maul, Grininlix /yell Skarr the Unbreakable
44,   -- The Maul, Grininlix /yell The Razza
156,  -- DM release : Recipes and misc item
159,  -- DM Release : Cloth turning NPC
161,  -- Patch 1.3
);

-- * NEW ITEMS 	

REPLACE INTO new_items SELECT entry FROM item_template WHERE entry IN (
6833,    -- White Tuxedo Shirt
18309,   -- Gloves of Restoration | Dire Maul Loot
18315,   -- Ring of Demonic Potency | Dire Maul Loot
18323,   -- Satyr's Bow | Dire Maul Loot
18325,   -- Felhide Cap | Dire Maul Loot
18327,   -- Whipvine Cord | Dire Maul Loot
18339,   -- Eidolon Cloak | Dire Maul Loot
18340,   -- Eidolon Talisman | Dire Maul Loot
18368,   -- Gordok's Gloves | Dire Maul Loot
18369,   -- Gordok's Handwraps | Dire Maul Loot
18371,   -- Mindtap Talisman | Dire Maul Loot
18380,   -- Eldritch Reinforced Legplates | Dire Maul Loot
18386,   -- Padre's Trousers | Dire Maul Loot
18393,   -- Warpwood Binding | Dire Maul Loot
18395,   -- Emerald Flame Ring | Dire Maul Loot
18464,   -- Gordok Nose Ring | Dire Maul Loot
18466,   -- Royal Seal of Eldre'Thalas | Dire Maul Loot
18468,   -- Royal Seal of Eldre'Thalas | Dire Maul Loot
18470,   -- Royal Seal of Eldre'Thalas | Dire Maul Loot
18472,   -- Royal Seal of Eldre'Thalas | Dire Maul Loot
18475,   -- Oddly Magical Belt | Dire Maul Loot
18485,   -- Observer's Shield | Dire Maul Loot
18490,   -- Insightful Hood | Dire Maul Loot
18494,   -- Denwatcher's Shoulders | Dire Maul Loot
18505,   -- Mugger's Belt | Dire Maul Loot
18510,   -- Hide of the Wild | Dire Maul Loot
18518,   -- Pattern: Hide of the Wild | Dire Maul Loot
18522,   -- Band of the Ogre King | Dire Maul Loot
18524,   -- Leggings of Destruction | Dire Maul Loot
18528,   -- Cyclone Spaulders | Dire Maul Loot
18535,   -- Milli's Shield | Dire Maul Loot
18536,   -- Milli's Lexicon | Dire Maul Loot
18537,   -- Counterattack Lodestone | Dire Maul Loot
18302,   -- Band of Vigor | Dire Maul Loot
18305,   -- Breakwater Legguards | Dire Maul Loot
18306,   -- Gloves of Shadowy Mist | Dire Maul Loot
18313,   -- Helm of Awareness | Dire Maul Loot
18326,   -- Razor Gauntlets | Dire Maul Loot
18337,   -- Orphic Bracers | Dire Maul Loot (Random drop off 11480, 14399, 11483, and 11484 only)
18343,   -- Petrified Band | Dire Maul Loot (Random drop off 11459, 14303, and 11458 only)
18349,   -- Gauntlets of Accuracy | Dire Maul Loot
18350,   -- Amplifying Cloak | Dire Maul Loot
18352,   -- Petrified Bark Shield | Dire Maul Loot
18373,   -- Chestplate of Tranquility | Dire Maul Loot
18374,   -- Flamescarred Shoulders | Dire Maul Loot
18377,   -- Quickdraw Gloves | Dire Maul Loot
18378,   -- Silvermoon Leggings | Dire Maul Loot
18381,   -- Evil Eye Pendant | Dire Maul Loot
18383,   -- Force Imbued Gauntlets | Dire Maul Loot
18384,   -- Bile-etched Spaulders | Dire Maul Loot
18387,   -- Brightspark Gloves | Dire Maul Loot
18388,   -- Stoneshatter | Dire Maul Loot
);

-- * NEW CREATURES

REPLACE INTO new_creatures SELECT entry FROM creature_template WHERE entry IN (
6109,    -- Azuregos
12397,   -- Lord Kazzak
);

-- * NEW QUESTS	

REPLACE INTO new_quests SELECT entry FROM quest_template WHERE entry IN (
5526,   -- Shards of the Felvine
7877,   -- The Treasure of the Shen'dralar	
7499,   -- Codex of Defense
7500,   -- The Arcanist's Cookbook
7501,   -- The Light and How To Swing It
7506,   -- The Emerald Dream...
);

-- * NEW SPELLS	

DELETE FROM spell_disabled WHERE entry IN (1000);

-- * NEW GAMEOBJECTS	

REPLACE INTO `gameobject_involvedrelation` (`id`, `quest`) VALUES (179517, 7877);   -- Add involvedrelation for Treasure of Shen'dralar

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

UPDATE `creature` SET `spawnFlags` = (`spawnFlags` | 1) WHERE id IN (SELECT entry FROM new_creatures);

UPDATE `game_event` SET `disabled` = (`disabled` | 0) WHERE entry IN (SELECT entry FROM new_events);
 
-- * ITEM STATS | Items changed: 

-- * ADDITIONAL FIXES			



