-- 1.9 → 1.10 | Strom of Azeroth

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

-- * NEW EVENTS 	

REPLACE INTO new_events SELECT entry FROM game_event WHERE entry IN (
167,   -- Patch 1.10
);

-- * NEW ITEMS 	

REPLACE INTO new_items SELECT entry FROM item_template WHERE entry IN (
12471, -- Desertwalker Cane | 1.10 loot table revamp
17061, -- Juno's Shadow | 1.10 Loot table update
21278, -- Stormshroud Gloves | Patch notes: There is now a fourth item in the Stormshroud Armor set: Stormshroud Gloves.
21547, -- Recipe: Elixir of Greater Firepower | Allakhazam comment dates
21548, -- Pattern: Stormshroud Gloves | Patch notes: There is now a fourth item in the Stormshroud Armor set: Stormshroud Gloves.
21994, -- Belt of Heroism | Tier 0.5 questline
21995, -- Boots of Heroism | Tier 0.5 questline
21996, -- Bracers of Heroism | Tier 0.5 questline
21997, -- Breastplate of Heroism | Tier 0.5 questline
21998, -- Gauntlets of Heroism | Tier 0.5 questline
21999, -- Helm of Heroism | Tier 0.5 questline
22000, -- Legplates of Heroism | Tier 0.5 questline
22001, -- Spaulders of Heroism | Tier 0.5 questline
22002, -- Darkmantle Belt | Tier 0.5 questline
22003, -- Darkmantle Boots | Tier 0.5 questline
22004, -- Darkmantle Bracers | Tier 0.5 questline
22005, -- Darkmantle Cap | Tier 0.5 questline
22006, -- Darkmantle Gloves | Tier 0.5 questline
22007, -- Darkmantle Pants | Tier 0.5 questline
22008, -- Darkmantle Spaulders | Tier 0.5 questline
22009, -- Darkmantle Tunic | Tier 0.5 questline
22010, -- Beastmaster's Belt | Tier 0.5 questline
22011, -- Beastmaster's Bindings | Tier 0.5 questline
22013, -- Beastmaster's Cap | Tier 0.5 questline
22015, -- Beastmaster's Gloves | Tier 0.5 questline
22016, -- Beastmaster's Mantle | Tier 0.5 questline
22017, -- Beastmaster's Pants | Tier 0.5 questline
22049, -- Brazier of Beckoning | Tier 0.5 questline
22050, -- Brazier of Beckoning | Tier 0.5 questline
22051, -- Brazier of Beckoning | Tier 0.5 questline
22052, -- Brazier of Beckoning | Tier 0.5 questline
22056, -- Brazier of Beckoning | Tier 0.5 questline
22060, -- Beastmaster's Tunic | Tier 0.5 questline
22061, -- Beastmaster's Boots | Tier 0.5 questline
22062, -- Sorcerer's Belt | Tier 0.5 questline
22063, -- Sorcerer's Bindings | Tier 0.5 questline
22064, -- Sorcerer's Boots | Tier 0.5 questline
22065, -- Sorcerer's Crown | Tier 0.5 questline
22066, -- Sorcerer's Gloves | Tier 0.5 questline
22067, -- Sorcerer's Leggings | Tier 0.5 questline
22068, -- Sorcerer's Mantle | Tier 0.5 questline
22069, -- Sorcerer's Robes | Tier 0.5 questline
22070, -- Deathmist Belt | Tier 0.5 questline
22071, -- Deathmist Bracers | Tier 0.5 questline
22072, -- Deathmist Leggings | Tier 0.5 questline
22073, -- Deathmist Mantle | Tier 0.5 questline
22074, -- Deathmist Mask | Tier 0.5 questline
22075, -- Deathmist Robe | Tier 0.5 questline
22076, -- Deathmist Sandals | Tier 0.5 questline
22077, -- Deathmist Wraps | Tier 0.5 questline
22078, -- Virtuous Belt | Tier 0.5 questline
22079, -- Virtuous Bracers | Tier 0.5 questline
22080, -- Virtuous Crown | Tier 0.5 questline
22081, -- Virtuous Gloves | Tier 0.5 questline
22082, -- Virtuous Mantle | Tier 0.5 questline
22083, -- Virtuous Robe | Tier 0.5 questline
22084, -- Virtuous Sandals | Tier 0.5 questline
22085, -- Virtuous Skirt | Tier 0.5 questline
22086, -- Soulforge Belt | Tier 0.5 questline
22087, -- Soulforge Boots | Tier 0.5 questline
22088, -- Soulforge Bracers | Tier 0.5 questline
22089, -- Soulforge Breastplate | Tier 0.5 questline
22090, -- Soulforge Gauntlets | Tier 0.5 questline
22091, -- Soulforge Helm | Tier 0.5 questline
22092, -- Soulforge Legplates | Tier 0.5 questline
22093, -- Soulforge Spaulders | Tier 0.5 questline
22095, -- Bindings of The Five Thunders | Tier 0.5 questline
22096, -- Boots of The Five Thunders | Tier 0.5 questline
22097, -- Coif of The Five Thunders | Tier 0.5 questline
22098, -- Cord of The Five Thunders | Tier 0.5 questline
22099, -- Gauntlets of The Five Thunders | Tier 0.5 questline
22100, -- Kilt of The Five Thunders | Tier 0.5 questline
22101, -- Pauldrons of The Five Thunders | Tier 0.5 questline
22102, -- Vest of The Five Thunders | Tier 0.5 questline
22106, -- Feralheart Belt | Tier 0.5 questline
22107, -- Feralheart Boots | Tier 0.5 questline
22108, -- Feralheart Bracers | Tier 0.5 questline
22109, -- Feralheart Cowl | Tier 0.5 questline
22110, -- Feralheart Gloves | Tier 0.5 questline
22111, -- Feralheart Kilt | Tier 0.5 questline
22112, -- Feralheart Spaulders | Tier 0.5 questline
22113, -- Feralheart Vest | Tier 0.5 questline
22149, -- Beads of Ogre Mojo | Tier 0.5 questline
22150, -- Beads of Ogre Might | Tier 0.5 questline
22191, -- Obsidian Mail Tunic | Patch notes (new blacksmithing patterns added)
22194, -- Black Grasp of the Destroyer | Patch notes (new blacksmithing patterns added)
22195, -- Light Obsidian Belt | Patch notes (new blacksmithing patterns added)
22196, -- Thick Obsidian Breastplate | Patch notes (new blacksmithing patterns added)
22197, -- Heavy Obsidian Belt | Patch notes (new blacksmithing patterns added)
22198, -- Jagged Obsidian Shield | Patch notes (new blacksmithing patterns added)
22204, -- Wristguards of Renown | Major loot table update
22205, -- Black Steel Bindings | Major loot table update
22207, -- Sash of the Grand Hunt | Major loot table update
22208, -- Lavastone Hammer | Major loot table update
22209, -- Plans: Heavy Obsidian Belt | Patch notes (new blacksmithing patterns added)
22212, -- Golem Fitted Pauldrons | Major loot table update
22214, -- Plans: Light Obsidian Belt | Patch notes (new blacksmithing patterns added)
22219, -- Plans: Jagged Obsidian Shield | Patch notes (new blacksmithing patterns added)
22220, -- Plans: Black Grasp of the Destroyer | Patch notes (new blacksmithing patterns added)
22221, -- Plans: Obsidian Mail Tunic | Patch notes (new blacksmithing patterns added)
22222, -- Plans: Thick Obsidian Breastplate | Patch notes (new blacksmithing patterns added)
22223, -- Foreman's Head Protector | Major loot table update
22225, -- Dragonskin Cowl | Major loot table update
22231, -- Kayser's Boots of Precision | Major loot table update
22232, -- Marksman's Girdle | Major loot table update
22234, -- Mantle of Lost Hope | Major loot table update
22240, -- Greaves of Withering Despair | Major loot table update
22241, -- Dark Warder's Pauldrons | Major loot table update
22242, -- Verek's Leash | Major loot table update
22245, -- Soot Encrusted Footwear | Major loot table update
22247, -- Faith Healer's Boots | Major loot table update
22253, -- Tome of the Lost | Major loot table update
22254, -- Wand of Eternal Light | Major loot table update
22255, -- Magma Forged Band | Major loot table update
22256, -- Mana Shaping Handwraps | Major loot table update
22257, -- Bloodclot Band | Major loot table update
22266, -- Flarethorn | Major loot table update
22267, -- Spellweaver's Turban | Major loot table update
22268, -- Draconic Infused Emblem | Major loot table update
22269, -- Shadow Prowler's Cloak | Major loot table update
22270, -- Entrenching Boots | Major loot table update
22271, -- Leggings of Frenzied Magic | Major loot table update
22272, -- Forest's Embrace | LVL 50 class quest (druid), see retail 1.10 patch notes
22274, -- Grizzled Pelt | LVL 50 class quest (druid), see retail 1.10 patch notes
22275, -- Firemoss Boots | Major loot table update
22276, -- Lovely Red Dress | Note: Valentine's Day event added with patch 1.10, but wasn't available until the next year
22277, -- Red Dinner Suit | Note: Valentine's Day event added with patch 1.10, but wasn't available until the next year
22278, -- Lovely Blue Dress | Note: Valentine's Day event added with patch 1.10, but wasn't available until the next year
22279, -- Lovely Black Dress | Note: Valentine's Day event added with patch 1.10, but wasn't available until the next year
22280, -- Lovely Purple Dress | Note: Valentine's Day event added with patch 1.10, but wasn't available until the next year
22281, -- Blue Dinner Suit | Note: Valentine's Day event added with patch 1.10, but wasn't available until the next year
22282, -- Purple Dinner Suit | Note: Valentine's Day event added with patch 1.10, but wasn't available until the next year
22301, -- Ironweave Robe | Tier 0.5 boss loot
22302, -- Ironweave Cowl | Tier 0.5 boss loot
22303, -- Ironweave Pants | Tier 0.5 boss loot
22304, -- Ironweave Gloves | Tier 0.5 boss loot
22305, -- Ironweave Mantle | Tier 0.5 boss loot
22306, -- Ironweave Belt | Tier 0.5 boss loot
22311, -- Ironweave Boots | Tier 0.5 boss loot
22313, -- Ironweave Bracers | Tier 0.5 boss loot
22314, -- Huntsman's Harpoon | Tier 0.5 boss loot
22315, -- Hammer of Revitalization | Tier 0.5 boss loot
22317, -- Lefty's Brass Knuckle | Tier 0.5 boss loot
22318, -- Malgen's Long Bow | Tier 0.5 boss loot
22319, -- Tome of Divine Right | Tier 0.5 boss loot
22321, -- Heart of Wyrmthalak | Major loot table update
22322, -- The Jaw Breaker | Tier 0.5 boss loot
22325, -- Belt of the Trickster | Tier 0.5 boss loot
22326, -- Amalgam's Band | Tier 0.5 boss loot
22327, -- Amulet of the Redeemed | Tier 0.5 boss loot
22328, -- Legplates of Vigilance | Tier 0.5 boss loot
22329, -- Scepter of Interminable Focus | Tier 0.5 boss loot
22330, -- Shroud of Arcane Mastery | Tier 0.5 boss loot
22331, -- Band of the Steadfast Hero | Tier 0.5 boss loot
22332, -- Blade of Necromancy | Tier 0.5 boss loot
22333, -- Hammer of Divine Might | Tier 0.5 boss loot
22334, -- Band of Mending | Tier 0.5 boss loot
22335, -- Lord Valthalak's Staff of Command | Tier 0.5 boss loot
22336, -- Draconian Aegis of the Legion | Tier 0.5 boss loot
22337, -- Shroud of Domination | Tier 0.5 boss loot
22339, -- Rune Band of Wizardry | Tier 0.5 boss loot
22340, -- Pendant of Celerity | Tier 0.5 boss loot
22342, -- Leggings of Torment | Tier 0.5 boss loot
22343, -- Handguards of Savagery | Tier 0.5 boss loot
22345, -- Totem of Rebirth | Tier 0.5 boss loot
22347, -- Fahrad's Reloading Repeater | The Perfect Poison quest added (Allakhazam comment dates)
22348, -- Doomulus Prime | The Perfect Poison quest added (Allakhazam comment dates)
22377, -- The Thunderwood Poker | The Perfect Poison quest added (Allakhazam comment dates)
22378, -- Ravenholdt Slicer | The Perfect Poison quest added (Allakhazam comment dates)
22379, -- Shivsprocket's Shiv | The Perfect Poison quest added (Allakhazam comment dates)
22380, -- Simone's Cultivating Hammer | The Perfect Poison quest added (Allakhazam comment dates)
22383, -- Sageblade | Major loot table update (Allakhazam comment dates)
22384, -- Persuader | Major loot table update (Allakhazam comment dates)
22385, -- Titanic Leggings | Major loot table update
22388, -- Plans: Titanic Leggings | Major loot table update
22389, -- Plans: Sageblade | Major loot table update (Allakhazam comment dates)
22390, -- Plans: Persuader | Major loot table update (Allakhazam comment dates)
22392, -- Formula: Enchant 2H Weapon - Agility | New Timbermaw Rep Rewards
22394, -- Staff of Metanoia | Major loot table update
22395, -- Totem of Rage | Major loot table update
22396, -- Totem of Life | Major loot table update
22397, -- Idol of Ferocity | Major loot table update
22398, -- Idol of Rejuvenation | Major loot table update
22399, -- Idol of Health | Major loot table update
22400, -- Libram of Truth | Major loot table update
22401, -- Libram of Hope | Major loot table update
22402, -- Libram of Grace | Major loot table update
22403, -- Diana's Pearl Necklace | Major loot table update
22404, -- Willey's Back Scratcher | Major loot table update
22405, -- Mantle of the Scarlet Crusade | Major loot table update
22406, -- Redemption | Major loot table update
22407, -- Helm of the New Moon | Major loot table update
22408, -- Ritssyn's Wand of Bad Mojo | Major loot table update
22409, -- Tunic of the Crescent Moon | Major loot table update
22410, -- Gauntlets of Deftness | Major loot table update
22411, -- Helm of the Executioner | Major loot table update
22412, -- Thuzadin Mantle | Major loot table update
22433, -- Don Mauricio's Band of Domination | Major loot table update (Allakhazam comment dates)
22458, -- Moonshadow Stave | LVL 50 class quest (druid), see retail 1.10 patch notes
22472; -- Boots of Ferocity | Tier 0.5 boss loot
);
 
-- * ITEM STATS | Items changed: 

-- * NEW CREATURES

REPLACE INTO new_creatures SELECT entry FROM creature_template WHERE entry IN (
);
	
-- * NEW QUESTS	

REPLACE INTO new_quests SELECT entry FROM quest_template WHERE entry IN (
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