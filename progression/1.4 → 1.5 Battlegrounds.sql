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
19325 -- Don Julio's Band | AV Rep Rewards
);
 
-- * NEW CREATURES

REPLACE INTO new_creatures SELECT entry FROM creature_template WHERE entry IN (
);
	
-- * NEW QUESTS	

REPLACE INTO new_quests SELECT entry FROM quest_template WHERE entry IN (
5892, -- Irondeep Supplies | AV Quest (duplicate?)
5893, -- Coldtooth Supplies | AV Quest (duplicate?)
6741, -- More Booty! | AV Quest
6781, -- More Armor Scraps | AV Quest
6801, -- Lokholar the Ice Lord | AV Quest
6825, -- Call of Air - Guse's Fleet | AV Quest
6826, -- Call of Air - Jeztor's Fleet | AV Quest
6827, -- Call of Air - Mulverick's Fleet | AV Quest
6846, -- Begin the Attack! | AV Quest
6847, -- Master Ryson's All Seeing Eye | AV Quest
6848, -- Master Ryson's All Seeing Eye | AV Quest
6861, -- Zinfizzlex's Portable Shredder Unit | AV Quest
6862, -- Zinfizzlex's Portable Shredder Unit | AV Quest
6881, -- Ivus the Forest Lord | AV Quest
6901, -- Launch the Attack! | AV Quest
6941, -- Call of Air - Vipore's Fleet | AV Quest
6942, -- Call of Air - Slidore's Fleet | AV Quest
6943, -- Call of Air - Ichman's Fleet | AV Quest
6982, -- Coldtooth Supplies | AV Quest
6985, -- Irondeep Supplies | AV Quest
7001, -- Empty Stables | AV Quest
7002, -- Ram Hide Harnesses | AV Quest
7003, -- Zapped Giants | Quests added to Feralas (1.5 patch notes)
7026, -- Ram Riding Harnesses | AV Quest
7027, -- Empty Stables | AV Quest
7081, -- Alterac Valley Graveyards | AV Quest
7082, -- The Graveyards of Alterac | AV Quest
7101, -- Towers and Bunkers | AV Quest
7102, -- Towers and Bunkers | AV Quest
7121, -- The Quartermaster | AV Quest
7122, -- Capture a Mine | AV Quest
7123, -- Speak with our Quartermaster | AV Quest
7124, -- Capture a Mine | AV Quest
7141, -- The Battle of Alterac | AV Quest
7142, -- The Battle for Alterac | AV Quest
7161, -- Proving Grounds | AV Quest
7162, -- Proving Grounds | AV Quest
7163, -- Rise and Be Recognized | AV Quest
7164, -- Honored Amongst the Clan | AV Quest
7165, -- Earned Reverence | AV Quest
7166, -- Legendary Heroes | AV Quest
7167, -- The Eye of Command | AV Quest
7168, -- Rise and Be Recognized | AV Quest
7169, -- Honored Amongst the Guard | AV Quest
7170, -- Earned Reverence | AV Quest
7171, -- Legendary Heroes | AV Quest
7172, -- The Eye of Command | AV Quest
7181, -- The Legend of Korrak | AV Quest
7202, -- Korrak the Bloodrager | AV Quest
7223, -- Armor Scraps | AV Quest
7224, -- Enemy Booty | AV Quest
7241, -- In Defense of Frostwolf | AV Quest
7261, -- The Sovereign Imperative | AV Quest
7281, -- Brotherly Love | AV Quest
7282, -- Brotherly Love | AV Quest
7301, -- Fallen Sky Lords | AV Quest
7302, -- Fallen Sky Lords | AV Quest
7361, -- Favor Amongst the Darkspear | AV Quest
7362, -- Ally of the Tauren | AV Quest
7363, -- The Human Condition | AV Quest
7364, -- Gnomeregan Bounty | AV Quest
7365, -- Staghelm's Requiem | AV Quest
7366, -- The Archbishop's Mercy | AV Quest
7367, -- Defusing the Threat | AV Quest
7368, -- Defusing the Threat | AV Quest
7381, -- The Return of Korrak | AV Quest
7382, -- Korrak the Everliving | AV Quest
7385, -- A Gallon of Blood | AV Quest
7386, -- Crystal Cluster | AV Quest
7401, -- Wanted: DWARVES! | AV Quest
7402, -- Wanted: ORCS! | AV Quest
7421, -- Darkspear Defense | AV Quest
7422, -- Tuft it Out | AV Quest
7423, -- I've Got A Fever For More Bone Chips | AV Quest
7424, -- What the Hoof? | AV Quest
7425, -- Staghelm's Mojo Jamboree | AV Quest
7426, -- One Man's Love | AV Quest
7427, -- Wanted: MORE DWARVES! | AV Quest
7428, -- Wanted: MORE ORCS! | AV Quest
7701, -- WANTED: Overseer Maltorius | Quests added to Thorium Point (See retail patch notes)
7721, -- Fuel for the Zapping | Quests added to Feralas (1.5 patch notes)
7722, -- What the Flux? | Quests added to Thorium Point (See retail patch notes)
7723, -- Curse These Fat Fingers | Quests added to Thorium Point (See retail patch notes)
7724, -- Fiery Menace! | Quests added to Thorium Point (See retail patch notes)
7725, -- Again With the Zapped Giants | Quests added to Feralas (1.5 patch notes)
7726, -- Refuel for the Zapping | Quests added to Feralas (1.5 patch notes)
7727, -- Incendosaurs? Whateverosaur is More Like It | Quests added to Thorium Point (See retail patch notes)
7728, -- STOLEN: Smithing Tuyere and Lookout's Spyglass | Quests added to Thorium Point (See retail patch notes)
7729, -- JOB OPPORTUNITY: Culling the Competition | Quests added to Thorium Point (See retail patch notes)
7730, -- Zukk'ash Infestation | Quests added to Feralas (1.5 patch notes)
7731, -- Stinglasher | Quests added to Feralas (1.5 patch notes)
7732, -- Zukk'ash Report | Quests added to Feralas (1.5 patch notes)
7733, -- Improved Quality | "Quest ""Improved Quality"" added in 1.5 (allakhazam dating and inference from item/quest ID)"
7734, -- Improved Quality | "Quest ""Improved Quality"" added in 1.5 (allakhazam dating and inference from item/quest ID)"
7735, -- Pristine Yeti Hide | Quests added to Feralas (1.5 patch notes)
7736, -- Restoring Fiery Flux Supplies via Kingsblood | Quests added to Thorium Point (See retail patch notes)
7737, -- Gaining Acceptance | Quests added to Thorium Point (See retail patch notes)
7738, -- Perfect Yeti Hide | Quests added to Feralas (1.5 patch notes)
7788, -- Vanquish the Invaders! | Deprecated WSG quest for Silverwing/Warsong talismans
7789, -- Quell the Silverwing Usurpers | Deprecated WSG quest for Silverwing/Warsong talismans
7791, -- A Donation of Wool | Cloth quartermasters added (see 1.5 patch notes)
7793, -- A Donation of Silk | Cloth quartermasters added (see 1.5 patch notes)
7794, -- A Donation of Mageweave | Cloth quartermasters added (see 1.5 patch notes)
7795, -- A Donation of Runecloth | Cloth quartermasters added (see 1.5 patch notes)
7796, -- Additional Runecloth | Cloth quartermasters added (see 1.5 patch notes)
7797, -- A Donation of Wool | Cloth quartermasters added (see 1.5 patch notes)
7798, -- A Donation of Silk | Cloth quartermasters added (see 1.5 patch notes)
7799, -- A Donation of Mageweave | Cloth quartermasters added (see 1.5 patch notes)
7800, -- A Donation of Runecloth | Cloth quartermasters added (see 1.5 patch notes)
7801, -- Additional Runecloth | Cloth quartermasters added (see 1.5 patch notes)
7802, -- A Donation of Wool | Cloth quartermasters added (see 1.5 patch notes)
7803, -- A Donation of Silk | Cloth quartermasters added (see 1.5 patch notes)
7804, -- A Donation of Mageweave | Cloth quartermasters added (see 1.5 patch notes)
7805, -- A Donation of Runecloth | Cloth quartermasters added (see 1.5 patch notes)
7806, -- Additional Runecloth | Cloth quartermasters added (see 1.5 patch notes)
7807, -- A Donation of Wool | Cloth quartermasters added (see 1.5 patch notes)
7808, -- A Donation of Silk | Cloth quartermasters added (see 1.5 patch notes)
7809, -- A Donation of Mageweave | Cloth quartermasters added (see 1.5 patch notes)
7811, -- A Donation of Runecloth | Cloth quartermasters added (see 1.5 patch notes)
7812, -- Additional Runecloth | Cloth quartermasters added (see 1.5 patch notes)
7813, -- A Donation of Wool | Cloth quartermasters added (see 1.5 patch notes)
7814, -- A Donation of Silk | Cloth quartermasters added (see 1.5 patch notes)
7815, -- Snapjaws, Mon! | Quests added to Revantusk Village (See retail patch notes)
7816, -- Gammerita, Mon! | Quests added to Revantusk Village (See retail patch notes)
7817, -- A Donation of Mageweave | Cloth quartermasters added (see 1.5 patch notes)
7818, -- A Donation of Runecloth | Cloth quartermasters added (see 1.5 patch notes)
7819, -- Additional Runecloth | Cloth quartermasters added (see 1.5 patch notes)
7820, -- A Donation of Wool | Cloth quartermasters added (see 1.5 patch notes)
7821, -- A Donation of Silk | Cloth quartermasters added (see 1.5 patch notes)
7822, -- A Donation of Mageweave | Cloth quartermasters added (see 1.5 patch notes)
7823, -- A Donation of Runecloth | Cloth quartermasters added (see 1.5 patch notes)
7824, -- A Donation of Runecloth | Cloth quartermasters added (see 1.5 patch notes)
7825, -- Additional Runecloth | Cloth quartermasters added (see 1.5 patch notes)
7826, -- A Donation of Wool | Cloth quartermasters added (see 1.5 patch notes)
7827, -- A Donation of Silk | Cloth quartermasters added (see 1.5 patch notes)
7828, -- Stalking the Stalkers | Quests added to Revantusk Village (See retail patch notes)
7829, -- Hunt the Savages | Quests added to Revantusk Village (See retail patch notes)
7830, -- Avenging the Fallen | Quests added to Revantusk Village (See retail patch notes)
7831, -- A Donation of Mageweave | Cloth quartermasters added (see 1.5 patch notes)
7832, -- Additional Runecloth | Cloth quartermasters added (see 1.5 patch notes)
7833, -- A Donation of Wool | Cloth quartermasters added (see 1.5 patch notes)
7834, -- A Donation of Silk | Cloth quartermasters added (see 1.5 patch notes)
7835, -- A Donation of Mageweave | Cloth quartermasters added (see 1.5 patch notes)
7836, -- A Donation of Runecloth | Cloth quartermasters added (see 1.5 patch notes)
7837, -- Additional Runecloth | Cloth quartermasters added (see 1.5 patch notes)
7839, -- Vilebranch Hooligans | Quests added to Revantusk Village (See retail patch notes)
7840, -- Lard Lost His Lunch | Quests added to Revantusk Village (See retail patch notes)
7841, -- Message to the Wildhammer | Quests added to Revantusk Village (See retail patch notes)
7842, -- Another Message to the Wildhammer | Quests added to Revantusk Village (See retail patch notes)
7843, -- The Final Message to the Wildhammer | Quests added to Revantusk Village (See retail patch notes)
7844, -- Cannibalistic Cousins | Quests added to Revantusk Village (See retail patch notes)
7845, -- Kidnapped Elder Torntusk! | Quests added to Revantusk Village (See retail patch notes)
7846, -- Recover the Key! | Quests added to Revantusk Village (See retail patch notes)
7847, -- Return to Primal Torntusk | Quests added to Revantusk Village (See retail patch notes)
7848, -- Attunement to the Core | NOTE: This replaces 7487 to allow Dwarf priests to complete it
7849, -- Separation Anxiety | Quests added to Revantusk Village (See retail patch notes)
7850, -- Dark Vessels | Quests added to Revantusk Village (See retail patch notes)
7861, -- Wanted: Vile Priestess Hexx and Her Minions | Quests added to Revantusk Village (See retail patch notes)
7862, -- Job Opening: Guard Captain of Revantusk Village | Quests added to Revantusk Village (See retail patch notes)
7863, -- Sentinel Basic Care Package | WSG quest available on release (Allakhazam dating)
7864, -- Sentinel Standard Care Package | WSG quest available on release (Allakhazam dating)
7865, -- Sentinel Advanced Care Package | WSG quest available on release (Allakhazam dating)
7866, -- Outrider Basic Care Package | WSG quest available on release (Allakhazam dating)
7867, -- Outrider Standard Care Package | WSG quest available on release (Allakhazam dating)
7868, -- Outrider Advanced Care Package | WSG quest available on release (Allakhazam dating)
7871, -- Vanquish the Invaders! | Deprecated WSG quest for Silverwing/Warsong talismans
7872, -- Vanquish the Invaders! | Deprecated WSG quest for Silverwing/Warsong talismans
7873, -- Vanquish the Invaders! | Deprecated WSG quest for Silverwing/Warsong talismans
7874, -- Quell the Silverwing Usurpers | Deprecated WSG quest for Silverwing/Warsong talismans
7875, -- Quell the Silverwing Usurpers | Deprecated WSG quest for Silverwing/Warsong talismans
7876  -- Quell the Silverwing Usurpers | Deprecated WSG quest for Silverwing/Warsong talismans
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
