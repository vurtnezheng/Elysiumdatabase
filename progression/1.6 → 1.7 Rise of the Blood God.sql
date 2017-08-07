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
-- - 4.  ITEM STATS	
-- - 5.  LOOT TABLES	 	      
-- - 6.  VENDORS 
-- - 7.  NEW CREATURES			
-- - 8.  CREATURES	
-- - 9.  NEW QUESTS			
-- - 10. QUEST CHANGES					
-- - 11. PROFESSIONS
-- - 12. NEW SPELLS				
-- - 15. NEW GAMEOBJECTS	

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
);
 
-- * ITEM STATS | Items changed: 

	
-- * LOOT TABLES


-- * VENDORS 


-- * NEW CREATURES

REPLACE INTO new_creatures SELECT entry FROM creature_template WHERE entry IN (1000

);
		
-- * CREATURES

	
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

-- * QUEST CHANGES	


-- * PROFESSIONS


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
