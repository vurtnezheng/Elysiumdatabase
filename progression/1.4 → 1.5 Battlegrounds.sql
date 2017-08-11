-- 1.4 → 1.5 | Battlegrounds

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

UPDATE `battleground_template` SET `MinLvl` = 51, `MaxLvl` = 60 WHERE `id` = 1; -- Alterac Valley (Patch 1.5)
UPDATE `battleground_template` SET `MinLvl` = 10, `MaxLvl` = 60 WHERE `id` = 1; -- Warsong Gulch (Patch 1.5)

-- * NEW EVENTS 	

REPLACE INTO new_events SELECT entry FROM game_event WHERE entry IN (
);

-- * NEW ITEMS 	

REPLACE INTO new_items SELECT entry FROM item_template WHERE entry IN (
17690, -- Frostwolf Insignia Rank 1 | AV Rewards
17691, -- Stormpike Insignia Rank 1 | AV Rewards
17900, -- Stormpike Insignia Rank 2 | AV Rewards
17901, -- Stormpike Insignia Rank 3 | AV Rewards
17902, -- Stormpike Insignia Rank 4 | AV Rewards
17903, -- Stormpike Insignia Rank 5 | AV Rewards
17904, -- Stormpike Insignia Rank 6 | AV Rewards
17905, -- Frostwolf Insignia Rank 2 | AV Rewards
17906, -- Frostwolf Insignia Rank 3 | AV Rewards
17907, -- Frostwolf Insignia Rank 4 | AV Rewards
17908, -- Frostwolf Insignia Rank 5 | AV Rewards
17909, -- Frostwolf Insignia Rank 6 | AV Rewards
19029, -- Horn of the Frostwolf Howler | AV Rep reward
18945, -- Dark Iron Residue | Thorium Brotherhood quests added with 1.5 (see retail patch notes)
18948, -- Barbaric Bracers | See 1.5 retail patch notes
18949, -- Pattern: Barbaric Bracers | See 1.5 retail patch notes
18957, -- Brushwood Blade | Quest reward from 2561 changed from 9602 (2h) to 18957 (1h) sword to reflect night elf starting proficiencies
18970, -- Ring of Critical Testing 2 | Test item, not in game
18984, -- Dimensional Ripper - Everlook | See 1.5 retail patch notes
18986, -- Ultrasafe Transporter: Gadgetzan | See 1.5 retail patch notes
19022, -- Nat Pagle's Extreme Angler FC-5000 | Quests added to Revantusk Village (See retail patch notes)
19028, -- Elegant Dress | Replaces easter dress
19031, -- Frostwolf Battle Tabard | AV Rep Rewards
19032, -- Stormpike Battle Tabard | AV Rep Rewards
19037, -- Emerald Peak Spaulders | Quests added to Feralas (1.5 patch notes)
19038, -- Ring of Subtlety | Quests added to Feralas (1.5 patch notes)
19039, -- Zorbin's Water Resistant Hat | Quests added to Feralas (1.5 patch notes)
19040, -- Zorbin's Mega-Slicer | Quests added to Feralas (1.5 patch notes)
19041, -- Pratt's Handcrafted Tunic | "Quest ""Improved Quality"" added in 1.5 (allakhazam dating and inference from item/quest ID)"
19042, -- Jangdor's Handcrafted Tunic | "Quest ""Improved Quality"" added in 1.5 (allakhazam dating and inference from item/quest ID)"
19083, -- Frostwolf Legionnaire's Cloak | AV Rep Rewards
19084, -- Stormpike Soldier's Cloak | AV Rep Rewards
19085, -- Frostwolf Advisor's Cloak | AV Rep Rewards
19086, -- Stormpike Sage's Cloak | AV Rep Rewards
19087, -- Frostwolf Plate Belt | AV Rep Rewards
19088, -- Frostwolf Mail Belt | AV Rep Rewards
19089, -- Frostwolf Leather Belt | AV Rep Rewards
19090, -- Frostwolf Cloth Belt | AV Rep Rewards
19091, -- Stormpike Plate Girdle | AV Rep Rewards
19092, -- Stormpike Mail Girdle | AV Rep Rewards
19093, -- Stormpike Leather Girdle | AV Rep Rewards
19094, -- Stormpike Cloth Girdle | AV Rep Rewards
19095, -- Frostwolf Legionnaire's Pendant | AV Rep Rewards
19096, -- Frostwolf Advisor's Pendant | AV Rep Rewards
19097, -- Stormpike Soldier's Pendant | AV Rep Rewards
19098, -- Stormpike Sage's Pendant | AV Rep Rewards
19099, -- Glacial Blade | AV Rep rewards
19100, -- Electrified Dagger | AV Rep Rewards
19101, -- Whiteout Staff | AV Rep rewards
19102, -- Crackling Staff | AV Rep Rewards
19103, -- Frostbite | AV Rep rewards
19104, -- Stormstrike Hammer | AV Rep rewards
19105, -- Frost Runed Headdress | Note: Blizzard removed this in patch 1.6 with the AV overhaul (we have AV in pre-nerf state though)
19106, -- Ice Barbed Spear | AV Quest Rewards
19107, -- Bloodseeker | AV Quest Rewards
19108, -- Wand of Biting Cold | AV Quest Rewards
19109, -- Deep Rooted Ring | Note: Blizzard removed this in patch 1.6 with the AV overhaul (we have AV in pre-nerf state though)
19110, -- Cold Forged Blade | Note: Blizzard removed this in patch 1.6 with the AV overhaul (we have AV in pre-nerf state though)
19111, -- Winteraxe Epaulets | Note: Blizzard removed this in patch 1.6 with the AV overhaul (we have AV in pre-nerf state though)
19112, -- Frozen Steel Vambraces | Note: Blizzard removed this in patch 1.6 with the AV overhaul (we have AV in pre-nerf state though)
19113, -- Yeti Hide Bracers | Note: Blizzard removed this in patch 1.6 with the AV overhaul (we have AV in pre-nerf state though)
19114, -- Highland Bow | Quests added to Revantusk Village (See retail patch notes)
19115, -- Flask of Forest Mojo | Quests added to Revantusk Village (See retail patch notes)
19116, -- Greenleaf Handwraps | Quests added to Revantusk Village (See retail patch notes)
19117, -- Laquered Wooden Plate Legplates | Quests added to Revantusk Village (See retail patch notes)
19118, -- Nature's Breath | Quests added to Revantusk Village (See retail patch notes)
19119, -- Owlbeast Hide Gloves | Quests added to Revantusk Village (See retail patch notes)
19120, -- Rune of the Guard Captain | Quests added to Revantusk Village (See retail patch notes)
19121, -- Deep Woodlands Cloak | Quests added to Revantusk Village (See retail patch notes)
19123, -- Everwarm Handwraps | Quests added to Thorium Point (See retail patch notes)
19124, -- Slagplate Leggings | Quests added to Thorium Point (See retail patch notes)
19125, -- Seared Mail Girdle | Quests added to Thorium Point (See retail patch notes)
19126, -- Slagplate Gauntlets | Quests added to Thorium Point (See retail patch notes)
19127, -- Charred Leather Tunic | Quests added to Thorium Point (See retail patch notes)
19128, -- Seared Mail Vest | Quests added to Thorium Point (See retail patch notes)
19130, -- Cold Snap | New loot added to Azuregos (1.5 retail patch notes)
19131, -- Snowblind Shoes | New loot added to Azuregos (1.5 retail patch notes)
19132, -- Crystal Adorned Crown | New loot added to Azuregos (1.5 retail patch notes)
19133, -- Fel Infused Leggings | New loot added to Kazzak (1.5 retail patch notes)
19134, -- Flayed Doomguard Belt | New loot added to Kazzak (1.5 retail patch notes)
19135, -- Blacklight Bracer | New loot added to Kazzak (1.5 retail patch notes)
19136, -- Mana Igniting Cord | New loot added to Molten Core bosses (1.5 retail patch notes)
19137, -- Onslaught Girdle | New loot added to Molten Core bosses (1.5 retail patch notes)
19138, -- Band of Sulfuras | New loot added to Molten Core bosses (1.5 retail patch notes)
19139, -- Fireguard Shoulders | New loot added to Molten Core bosses (1.5 retail patch notes)
19140, -- Cauterizing Band | New loot added to Molten Core bosses (1.5 retail patch notes)
19141, -- Luffa | Quests added to Thorium Point (See retail patch notes)
19142, -- Fire Runed Grimoire | New loot added to Molten Core bosses (1.5 retail patch notes)
19143, -- Flameguard Gauntlets | New loot added to Molten Core bosses (1.5 retail patch notes)
19144, -- Sabatons of the Flamewalker | New loot added to Molten Core bosses (1.5 retail patch notes)
19145, -- Robe of Volatile Power | New loot added to Molten Core bosses (1.5 retail patch notes)
19146, -- Wristguards of Stability | New loot added to Molten Core bosses (1.5 retail patch notes)
19147, -- Ring of Spell Power | New loot added to Molten Core bosses (1.5 retail patch notes)
19159, -- Woven Ivy Necklace | Quests added to Revantusk Village (See retail patch notes)
19308, -- Tome of Arcane Domination | AV Rep Rewards
19309, -- Tome of Shadow Force | AV Rep Rewards
19310, -- Tome of the Ice Lord | AV Rep Rewards
19311, -- Tome of Fiery Arcana | AV Rep Rewards
19312, -- Lei of the Lifegiver | AV Rep Rewards
19315, -- Therazane's Touch | AV Rep Rewards
19321, -- The Immovable Object | AV Rep Rewards
19323, -- The Unstoppable Force | AV Rep Rewards
19324, -- The Lobotomizer | AV Rep Rewards
19325; -- Don Julio's Band | AV Rep Rewards
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
