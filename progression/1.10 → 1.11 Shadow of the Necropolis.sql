-- 1.10 → 1.11 | Shadow of the Necropolis

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

UPDATE `areatrigger_teleport` SET `required_level` = 61 WHERE `target_map` = 533;  -- Naxxramas 1.12

-- * NEW EVENTS 	

REPLACE INTO new_events SELECT entry FROM game_event WHERE entry IN (
);

-- * NEW ITEMS 	

REPLACE INTO new_items SELECT entry FROM item_template WHERE entry IN (
22416, -- Dreadnaught Breastplate | Naxx loot
22417, -- Dreadnaught Legplates | Naxx loot
22418, -- Dreadnaught Helmet | Naxx loot
22419, -- Dreadnaught Pauldrons | Naxx loot
22420, -- Dreadnaught Sabatons | Naxx loot
22421, -- Dreadnaught Gauntlets | Naxx loot
22422, -- Dreadnaught Waistguard | Naxx loot
22423, -- Dreadnaught Bracers | Naxx loot
22424, -- Redemption Wristguards | Naxx loot
22425, -- Redemption Tunic | Naxx loot
22426, -- Redemption Handguards | Naxx loot
22427, -- Redemption Legguards | Naxx loot
22428, -- Redemption Headpiece | Naxx loot
22429, -- Redemption Spaulders | Naxx loot
22430, -- Redemption Boots | Naxx loot
22431, -- Redemption Girdle | Naxx loot
22436, -- Cryptstalker Tunic | Naxx loot
22437, -- Cryptstalker Legguards | Naxx loot
22438, -- Cryptstalker Headpiece | Naxx loot
22439, -- Cryptstalker Spaulders | Naxx loot
22440, -- Cryptstalker Boots | Naxx loot
22441, -- Cryptstalker Handguards | Naxx loot
22442, -- Cryptstalker Girdle | Naxx loot
22443, -- Cryptstalker Wristguards | Naxx loot
22464, -- Earthshatter Tunic | Naxx loot
22465, -- Earthshatter Legguards | Naxx loot
22466, -- Earthshatter Headpiece | Naxx loot
22467, -- Earthshatter Spaulders | Naxx loot
22468, -- Earthshatter Boots | Naxx loot
22469, -- Earthshatter Handguards | Naxx loot
22470, -- Earthshatter Girdle | Naxx loot
22471, -- Earthshatter Wristguards | Naxx loot
22476, -- Bonescythe Breastplate | Naxx loot
22477, -- Bonescythe Legplates | Naxx loot
22478, -- Bonescythe Helmet | Naxx loot
22479, -- Bonescythe Pauldrons | Naxx loot
22480, -- Bonescythe Sabatons | Naxx loot
22481, -- Bonescythe Gauntlets | Naxx loot
22482, -- Bonescythe Waistguard | Naxx loot
22483, -- Bonescythe Bracers | Naxx loot
22488, -- Dreamwalker Tunic | Naxx loot
22489, -- Dreamwalker Legguards | Naxx loot
22490, -- Dreamwalker Headpiece | Naxx loot
22491, -- Dreamwalker Spaulders | Naxx loot
22492, -- Dreamwalker Boots | Naxx loot
22493, -- Dreamwalker Handguards | Naxx loot
22494, -- Dreamwalker Girdle | Naxx loot
22495, -- Dreamwalker Wristguards | Naxx loot
22496, -- Frostfire Robe | Naxx loot
22497, -- Frostfire Leggings | Naxx loot
22498, -- Frostfire Circlet | Naxx loot
22499, -- Frostfire Shoulderpads | Naxx loot
22500, -- Frostfire Sandals | Naxx loot
22501, -- Frostfire Gloves | Naxx loot
22502, -- Frostfire Belt | Naxx loot
22503, -- Frostfire Bindings | Naxx loot
22504, -- Plagueheart Robe | Naxx loot
22505, -- Plagueheart Leggings | Naxx loot
22506, -- Plagueheart Circlet | Naxx loot
22507, -- Plagueheart Shoulderpads | Naxx loot
22508, -- Plagueheart Sandals | Naxx loot
22509, -- Plagueheart Gloves | Naxx loot
22510, -- Plagueheart Belt | Naxx loot
22511, -- Plagueheart Bindings | Naxx loot
22512, -- Robe of Faith | Naxx loot
22513, -- Leggings of Faith | Naxx loot
22514, -- Circlet of Faith | Naxx loot
22515, -- Shoulderpads of Faith | Naxx loot
22516, -- Sandals of Faith | Naxx loot
22517, -- Gloves of Faith | Naxx loot
22518, -- Belt of Faith | Naxx loot
22519, -- Bindings of Faith | Naxx loot
22589, -- Atiesh, Greatstaff of the Guardian | Naxx loot
22630, -- Atiesh, Greatstaff of the Guardian | Naxx loot
22631, -- Atiesh, Greatstaff of the Guardian | Naxx loot
22632, -- Atiesh, Greatstaff of the Guardian | Naxx loot
22637, -- Primal Hakkari Idol | ZG enchant change
22651, -- Outrider's Plate Legguards | WSG rewards added
22652, -- Glacial Vest | Naxx loot
22654, -- Glacial Gloves | Naxx loot
22655, -- Glacial Wrists | Naxx loot
22656, -- The Purifier | AD badge quests added (1.11 patch notes)
22657, -- Amulet of the Dawn | AD badge quests added (1.11 patch notes)
22658, -- Glacial Cloak | Naxx loot
22659, -- Medallion of the Dawn | AD badge quests added (1.11 patch notes)
22660, -- Gaea's Embrace | New CC Nature resist rep rewards added (1.11 patch notes)
22661, -- Polar Tunic | Naxx loot
22662, -- Polar Gloves | Naxx loot
22663, -- Polar Bracers | Naxx loot
22664, -- Icy Scale Breastplate | Naxx loot
22665, -- Icy Scale Bracers | Naxx loot
22666, -- Icy Scale Gauntlets | Naxx loot
22667, -- Bracers of Hope | AD badge quests added (1.11 patch notes)
22668, -- Bracers of Subterfuge | AD badge quests added (1.11 patch notes)
22669, -- Icebane Breastplate | Naxx loot
22670, -- Icebane Gauntlets | Naxx loot
22671, -- Icebane Bracers | Naxx loot
22672, -- Sentinel's Plate Legguards | WSG rewards added
22673, -- Outrider's Chain Leggings | WSG rewards added
22676, -- Outrider's Mail Leggings | WSG rewards added
22678, -- Talisman of Ascendance | AD badge quests added (1.11 patch notes)
22680, -- Band of Resolution | AD badge quests added (1.11 patch notes)
22681, -- Band of Piety | AD badge quests added (1.11 patch notes)
22683, -- Pattern: Gaea's Embrace | New CC Nature resist rep rewards added (1.11 patch notes)
22688, -- Verimonde's Last Resort | AD badge quests added (1.11 patch notes)
22689, -- Sanctified Leather Helm | AD badge quests added (1.11 patch notes)
22690, -- Leggings of the Plague Hunter | AD badge quests added (1.11 patch notes)
22691, -- Corrupted Ashbringer | Naxx loot
22699, -- Icebane Leggings | Naxx loot
22700, -- Glacial Leggings | Naxx loot
22701, -- Polar Leggings | Naxx loot
22702, -- Icy Scale Leggings | Naxx loot
22707, -- Ramaladni's Icy Grasp | Naxx loot
22711, -- Cloak of the Hakkari Worshipers | ZG Loot update
22712, -- Might of the Tribe | ZG Loot update
22713, -- Zulian Scepter of Rites | ZG Loot update
22714, -- Sacrificial Gauntlets | ZG Loot update
22715, -- Gloves of the Tormented | ZG Loot update
22716, -- Belt of Untapped Power | ZG Loot update
22718, -- Blooddrenched Mask | Major loot table update
22720, -- Zulian Headdress | Major loot table update
22721, -- Band of Servitude | Major loot table update
22722, -- Seal of the Gurubashi Berserker | ZG Loot update
22725, -- Band of Cenarius | New cenarion hold quest added (Allakhazam comment dates)
22736, -- Andonisus, Reaper of Souls | Atiesh quest summoned weapon
22740, -- Outrider's Leather Pants | WSG rewards added
22741, -- Outrider's Lizardhide Pants | WSG rewards added
22742, -- Bloodsail Shirt | https://web.archive.org/web/20071210200745/http://wow.allakhazam.com:80/db/item.html?witem=22742
22744, -- Bloodsail Boots | https://web.archive.org/web/20071210200745/http://wow.allakhazam.com:80/db/item.html?witem=22742
22745, -- Bloodsail Pants | https://web.archive.org/web/20071210200745/http://wow.allakhazam.com:80/db/item.html?witem=22742
22747, -- Outrider's Silk Leggings | WSG rewards added
22748, -- Sentinel's Chain Leggings | WSG rewards added
22749, -- Sentinel's Leather Pants | WSG rewards added
22750, -- Sentinel's Lizardhide Pants | WSG rewards added
22752, -- Sentinel's Silk Leggings | WSG rewards added
22753, -- Sentinel's Lamellar Legguards | WSG rewards added
22756, -- Sylvan Vest | Cenarion circle rewards added
22757, -- Sylvan Crown | Cenarion circle rewards added
22758, -- Sylvan Shoulders | Cenarion circle rewards added
22759, -- Bramblewood Helm | Cenarion circle rewards added
22760, -- Bramblewood Boots | Cenarion circle rewards added
22761, -- Bramblewood Belt | Cenarion circle rewards added
22762, -- Ironvine Breastplate | Cenarion circle rewards added
22763, -- Ironvine Gloves | Cenarion circle rewards added
22764, -- Ironvine Belt | Cenarion circle rewards added
22766, -- Plans: Ironvine Breastplate | Cenarion circle rewards added
22767, -- Plans: Ironvine Gloves | Cenarion circle rewards added
22768, -- Plans: Ironvine Belt | Cenarion circle rewards added
22769, -- Pattern: Bramblewood Belt | Cenarion circle rewards added
22770, -- Pattern: Bramblewood Boots | Cenarion circle rewards added
22771, -- Pattern: Bramblewood Helm | Cenarion circle rewards added
22772, -- Pattern: Sylvan Shoulders | Cenarion circle rewards added
22773, -- Pattern: Sylvan Crown | Cenarion circle rewards added
22774, -- Pattern: Sylvan Vest | Cenarion circle rewards added
22798, -- Might of Menethil | Naxx loot
22799, -- Soulseeker | Naxx loot
22800, -- Brimstone Staff | Naxx loot
22801, -- Spire of Twilight | Naxx loot
22802, -- Kingsfall | Naxx loot
22803, -- Midnight Haze | Naxx loot
22804, -- Maexxna's Fang | Naxx loot
22806, -- Widow's Remorse | Naxx loot
22807, -- Wraith Blade | Naxx loot
22808, -- The Castigator | Naxx loot
22809, -- Maul of the Redeemed Crusader | Naxx loot
22810, -- Toxin Injector | Naxx loot
22811, -- Soulstring | Naxx loot
22812, -- Nerubian Slavemaker | Naxx loot
22813, -- Claymore of Unholy Might | Naxx loot
22815, -- Severance | Naxx loot
22816, -- Hatchet of Sundered Bone | Naxx loot
22818, -- The Plague Bearer | Naxx loot
22819, -- Shield of Condemnation | Naxx loot
22820, -- Wand of Fates | Naxx loot
22821, -- Doomfinger | Naxx loot
22843, -- Blood Guard's Chain Greaves | 1.11 PvP Item update
22852, -- Blood Guard's Dragonhide Treads | 1.11 PvP Item update
22855, -- Blood Guard's Dreadweave Walkers | 1.11 PvP Item update
22856, -- Blood Guard's Leather Walkers | 1.11 PvP Item update
22857, -- Blood Guard's Mail Greaves | 1.11 PvP Item update
22858, -- Blood Guard's Plate Greaves | 1.11 PvP Item update
22859, -- Blood Guard's Satin Walkers | 1.11 PvP Item update
22860, -- Blood Guard's Silk Walkers | 1.11 PvP Item update
22862, -- Blood Guard's Chain Vices | 1.11 PvP Item update
22863, -- Blood Guard's Dragonhide Grips | 1.11 PvP Item update
22864, -- Blood Guard's Leather Grips | 1.11 PvP Item update
22865, -- Blood Guard's Dreadweave Handwraps | 1.11 PvP Item update
22867, -- Blood Guard's Mail Vices | 1.11 PvP Item update
22868, -- Blood Guard's Plate Gauntlets | 1.11 PvP Item update
22869, -- Blood Guard's Satin Handwraps | 1.11 PvP Item update
22870, -- Blood Guard's Silk Handwraps | 1.11 PvP Item update
22872, -- Legionnaire's Plate Hauberk | 1.11 PvP Item update
22873, -- Legionnaire's Plate Leggings | 1.11 PvP Item update
22874, -- Legionnaire's Chain Hauberk | 1.11 PvP Item update
22875, -- Legionnaire's Chain Legguards | 1.11 PvP Item update
22876, -- Legionnaire's Mail Hauberk | 1.11 PvP Item update
22877, -- Legionnaire's Dragonhide Chestpiece | 1.11 PvP Item update
22878, -- Legionnaire's Dragonhide Leggings | 1.11 PvP Item update
22879, -- Legionnaire's Leather Chestpiece | 1.11 PvP Item update
22880, -- Legionnaire's Leather Legguards | 1.11 PvP Item update
22881, -- Legionnaire's Dreadweave Legguards | 1.11 PvP Item update
22882, -- Legionnaire's Satin Legguards | 1.11 PvP Item update
22883, -- Legionnaire's Silk Legguards | 1.11 PvP Item update
22884, -- Legionnaire's Dreadweave Tunic | 1.11 PvP Item update
22885, -- Legionnaire's Satin Tunic | 1.11 PvP Item update
22886, -- Legionnaire's Silk Tunic | 1.11 PvP Item update
22887, -- Legionnaire's Mail Legguards | 1.11 PvP Item update
22890, -- Tome of Frost Ward V | Allakhazam comment dates
22891, -- Grimoire of Shadow Ward IV | Allakhazam comment dates
22935, -- Touch of Frost | Naxx loot
22936, -- Wristguards of Vengeance | Naxx loot
22937, -- Gem of Nerubis | Naxx loot
22938, -- Cryptfiend Silk Cloak | Naxx loot
22939, -- Band of Unanswered Prayers | Naxx loot
22940, -- Icebane Pauldrons | Naxx loot
22941, -- Polar Shoulder Pads | Naxx loot
22942, -- The Widow's Embrace | Naxx loot
22943, -- Malice Stone Pendant | Naxx loot
22947, -- Pendant of Forgotten Names | Naxx loot
22954, -- Kiss of the Spider | Naxx loot
22960, -- Cloak of Suturing | Naxx loot
22961, -- Band of Reanimation | Naxx loot
22967, -- Icy Scale Spaulders | Naxx loot
22968, -- Glacial Mantle | Naxx loot
22981, -- Gluth's Missing Collar | Naxx loot
22983, -- Rime Covered Mantle | Naxx loot
22988, -- The End of Dreams | Naxx loot
22994, -- Digested Hand of Power | Naxx loot
22999, -- Tabard of the Argent Dawn | Naxx loot
23000, -- Plated Abomination Ribcage | Naxx loot
23001, -- Eye of Diminution | Naxx loot
23004, -- Idol of Longevity | Naxx loot
23005, -- Totem of Flowing Water | Naxx loot
23006, -- Libram of Light | Naxx loot
23009, -- Wand of the Whispering Dead | Naxx loot
23014, -- Iblis, Blade of the Fallen Seraph | Naxx loot
23017, -- Veil of Eclipse | Naxx loot
23018, -- Signet of the Fallen Defender | Naxx loot
23019, -- Icebane Helmet | Naxx loot
23020, -- Polar Helmet | Naxx loot
23021, -- The Soul Harvester's Bindings | Naxx loot
23023, -- Sadist's Collar | Naxx loot
23025, -- Seal of the Damned | Naxx loot
23027, -- Warmth of Forgiveness | Naxx loot
23028, -- Hailstone Band | Naxx loot
23029, -- Noth's Frigid Heart | Naxx loot
23030, -- Cloak of the Scourge | Naxx loot
23031, -- Band of the Inevitable | Naxx loot
23032, -- Glacial Headdress | Naxx loot
23033, -- Icy Scale Coif | Naxx loot
23035, -- Preceptor's Hat | Naxx loot
23036, -- Necklace of Necropsy | Naxx loot
23037, -- Ring of Spiritual Fervor | Naxx loot
23038, -- Band of Unnatural Forces | Naxx loot
23039, -- The Eye of Nerub | Naxx loot
23040, -- Glyph of Deflection | Naxx loot
23041, -- Slayer's Crest | Naxx loot
23042, -- Loatheb's Reflection | Naxx loot
23043, -- The Face of Death | Naxx loot
23044, -- Harbinger of Doom | Naxx loot
23045, -- Shroud of Dominion | Naxx loot
23046, -- The Restrained Essence of Sapphiron | Naxx loot
23047, -- Eye of the Dead | Naxx loot
23048, -- Sapphiron's Right Eye | Naxx loot
23049, -- Sapphiron's Left Eye | Naxx loot
23050, -- Cloak of the Necropolis | Naxx loot
23051, -- Glaive of the Defender | Naxx loot
23053, -- Stormrage's Talisman of Seething | Naxx loot
23054, -- Gressil, Dawn of Ruin | Naxx loot
23056, -- Hammer of the Twisting Nether | Naxx loot
23057, -- Gem of Trapped Innocents | Naxx loot
23059, -- Ring of the Dreadnaught | Naxx loot
23060, -- Bonescythe Ring | Naxx loot
23061, -- Ring of Faith | Naxx loot
23062, -- Frostfire Ring | Naxx loot
23063, -- Plagueheart Ring | Naxx loot
23064, -- Ring of The Dreamwalker | Naxx loot
23065, -- Ring of the Earthshatterer | Naxx loot
23066, -- Ring of Redemption | Naxx loot
23067, -- Ring of the Cryptstalker | Naxx loot
23068, -- Legplates of Carnage | Naxx loot
23069, -- Necro-Knight's Garb | Naxx loot
23070, -- Leggings of Polarity | Naxx loot
23071, -- Leggings of Apocalypse | Naxx loot
23073, -- Boots of Displacement | Naxx loot
23075, -- Death's Bargain | Naxx loot
23078, -- Gauntlets of Undead Slaying | Pre-naxx world event reward
23081, -- Handwraps of Undead Slaying | Pre-naxx world event reward
23082, -- Handguards of Undead Slaying | Pre-naxx world event reward
23084, -- Gloves of Undead Cleansing | Pre-naxx world event reward
23085, -- Robe of Undead Cleansing | Pre-naxx world event reward
23087, -- Breastplate of Undead Slaying | Pre-naxx world event reward
23088, -- Chestguard of Undead Slaying | Pre-naxx world event reward
23089, -- Tunic of Undead Slaying | Pre-naxx world event reward
23090, -- Bracers of Undead Slaying | Pre-naxx world event reward
23091, -- Bracers of Undead Cleansing | Pre-naxx world event reward
23092, -- Wristguards of Undead Slaying | Pre-naxx world event reward
23093, -- Wristwraps of Undead Slaying | Pre-naxx world event reward
23124, -- Staff of Balzaphon | Pre-naxx world event drop
23125, -- Chains of the Lich | Pre-naxx world event drop
23126, -- Waistband of Balzaphon | Pre-naxx world event drop
23127, -- Cloak of Revanchion | Pre-naxx world event drop
23128, -- The Shadow's Grasp | Pre-naxx world event drop
23129, -- Bracers of Mending | Pre-naxx world event drop
23132, -- Lord Blackwood's Blade | Pre-naxx world event drop
23139, -- Lord Blackwood's Buckler | Pre-naxx world event drop
23156, -- Blackwood's Thigh | Pre-naxx world event drop
23168, -- Scorn's Focal Dagger | Pre-naxx world event drop
23169, -- Scorn's Icy Choker | Pre-naxx world event drop
23170, -- The Frozen Clutch | Pre-naxx world event drop
23171, -- The Axe of Severing | Pre-naxx world event drop
23173, -- Abomination Skin Leggings | Pre-naxx world event drop
23177, -- Lady Falther'ess' Finger | Pre-naxx world event drop
23178, -- Mantle of Lady Falther'ess | Pre-naxx world event drop
23197, -- Idol of the Moon | Major loot table update
23198, -- Idol of Brutality | Major loot table update
23199, -- Totem of the Storm | Major loot table update
23200, -- Totem of Sustaining | Major loot table update
23201, -- Libram of Divinity | Major loot table update
23203, -- Libram of Fervor | Major loot table update
23206, -- Mark of the Champion | Naxx Loot
23207, -- Mark of the Champion | Naxx Loot
23219, -- Girdle of the Mentor | Naxx Loot
23220, -- Crystal Webbed Robe | Naxx Loot
23221, -- Misplaced Servo Arm | Naxx Loot
23226, -- Ghoul Skin Tunic | Naxx Loot
23237, -- Ring of the Eternal Flame | Naxx Loot
23238, -- Stygian Buckler | Naxx Loot
23242, -- Claw of the Frost Wyrm | Naxx Loot
23243, -- Champion's Plate Shoulders | 1.11 PvP Item update
23244, -- Champion's Plate Helm | 1.11 PvP Item update
23251, -- Champion's Chain Helm | 1.11 PvP Item update
23252, -- Champion's Chain Shoulders | 1.11 PvP Item update
23253, -- Champion's Dragonhide Headguard | 1.11 PvP Item update
23254, -- Champion's Dragonhide Shoulders | 1.11 PvP Item update
23255, -- Champion's Dreadweave Cowl | 1.11 PvP Item update
23256, -- Champion's Dreadweave Spaulders | 1.11 PvP Item update
23257, -- Champion's Leather Helm | 1.11 PvP Item update
23258, -- Champion's Leather Shoulders | 1.11 PvP Item update
23259, -- Champion's Mail Headguard | 1.11 PvP Item update
23260, -- Champion's Mail Pauldrons | 1.11 PvP Item update
23261, -- Champion's Satin Hood | 1.11 PvP Item update
23262, -- Champion's Satin Mantle | 1.11 PvP Item update
23263, -- Champion's Silk Cowl | 1.11 PvP Item update
23264, -- Champion's Silk Mantle | 1.11 PvP Item update
23272, -- Knight-Captain's Lamellar Breastplate | 1.11 PvP Item update
23273, -- Knight-Captain's Lamellar Leggings | 1.11 PvP Item update
23274, -- Knight-Lieutenant's Lamellar Gauntlets | 1.11 PvP Item update
23275, -- Knight-Lieutenant's Lamellar Sabatons | 1.11 PvP Item update
23276, -- Lieutenant Commander's Lamellar Headguard | 1.11 PvP Item update
23277, -- Lieutenant Commander's Lamellar Shoulders | 1.11 PvP Item update
23278, -- Knight-Lieutenant's Chain Greaves | 1.11 PvP Item update
23279, -- Knight-Lieutenant's Chain Vices | 1.11 PvP Item update
23280, -- Knight-Lieutenant's Dragonhide Grips | 1.11 PvP Item update
23281, -- Knight-Lieutenant's Dragonhide Treads | 1.11 PvP Item update
23282, -- Knight-Lieutenant's Dreadweave Handwraps | 1.11 PvP Item update
23283, -- Knight-Lieutenant's Dreadweave Walkers | 1.11 PvP Item update
23284, -- Knight-Lieutenant's Leather Grips | 1.11 PvP Item update
23285, -- Knight-Lieutenant's Leather Walkers | 1.11 PvP Item update
23286, -- Knight-Lieutenant's Plate Gauntlets | 1.11 PvP Item update
23287, -- Knight-Lieutenant's Plate Greaves | 1.11 PvP Item update
23288, -- Knight-Lieutenant's Satin Handwraps | 1.11 PvP Item update
23289, -- Knight-Lieutenant's Satin Walkers | 1.11 PvP Item update
23290, -- Knight-Lieutenant's Silk Handwraps | 1.11 PvP Item update
23291, -- Knight-Lieutenant's Silk Walkers | 1.11 PvP Item update
23292, -- Knight-Captain's Chain Hauberk | 1.11 PvP Item update
23293, -- Knight-Captain's Chain Legguards | 1.11 PvP Item update
23294, -- Knight-Captain's Dragonhide Chestpiece | 1.11 PvP Item update
23295, -- Knight-Captain's Dragonhide Leggings | 1.11 PvP Item update
23296, -- Knight-Captain's Dreadweave Legguards | 1.11 PvP Item update
23297, -- Knight-Captain's Dreadweave Tunic | 1.11 PvP Item update
23298, -- Knight-Captain's Leather Chestpiece | 1.11 PvP Item update
23299, -- Knight-Captain's Leather Legguards | 1.11 PvP Item update
23300, -- Knight-Captain's Plate Hauberk | 1.11 PvP Item update
23301, -- Knight-Captain's Plate Leggings | 1.11 PvP Item update
23302, -- Knight-Captain's Satin Legguards | 1.11 PvP Item update
23303, -- Knight-Captain's Satin Tunic | 1.11 PvP Item update
23304, -- Knight-Captain's Silk Legguards | 1.11 PvP Item update
23305, -- Knight-Captain's Silk Tunic | 1.11 PvP Item update
23306, -- Lieutenant Commander's Chain Helm | 1.11 PvP Item update
23307, -- Lieutenant Commander's Chain Shoulders | 1.11 PvP Item update
23308, -- Lieutenant Commander's Dragonhide Headguard | 1.11 PvP Item update
23309, -- Lieutenant Commander's Dragonhide Shoulders | 1.11 PvP Item update
23310, -- Lieutenant Commander's Dreadweave Cowl | 1.11 PvP Item update
23311, -- Lieutenant Commander's Dreadweave Spaulders | 1.11 PvP Item update
23312, -- Lieutenant Commander's Leather Helm | 1.11 PvP Item update
23313, -- Lieutenant Commander's Leather Shoulders | 1.11 PvP Item update
23314, -- Lieutenant Commander's Plate Helm | 1.11 PvP Item update
23315, -- Lieutenant Commander's Plate Shoulders | 1.11 PvP Item update
23316, -- Lieutenant Commander's Satin Hood | 1.11 PvP Item update
23317, -- Lieutenant Commander's Satin Mantle | 1.11 PvP Item update
23318, -- Lieutenant Commander's Silk Cowl | 1.11 PvP Item update
23319, -- Lieutenant Commander's Silk Mantle | 1.11 PvP Item update
23320, -- Tablet of Flame Shock VI | Allakhazam comment dates
23323, -- Crown of the Fire Festival | Midsummer fire festival introduced with patch 1.11
23324, -- Mantle of the Fire Festival | Midsummer fire festival introduced with patch 1.11
23451, -- Grand Marshal's Mageblade | 1.11 PvP Item update
23452, -- Grand Marshal's Tome of Power | 1.11 PvP Item update
23453, -- Grand Marshal's Tome of Restoration | 1.11 PvP Item update
23454, -- Grand Marshal's Warhammer | 1.11 PvP Item update
23455, -- Grand Marshal's Demolisher | 1.11 PvP Item update
23456, -- Grand Marshal's Swiftblade | 1.11 PvP Item update
23464, -- High Warlord's Battle Mace | 1.11 PvP Item update
23465, -- High Warlord's Destroyer | 1.11 PvP Item update
23466, -- High Warlord's Spellblade | 1.11 PvP Item update
23467, -- High Warlord's Quickblade | 1.11 PvP Item update
23468, -- High Warlord's Tome of Destruction | 1.11 PvP Item update
23469, -- High Warlord's Tome of Mending | 1.11 PvP Item update
23557, -- Larvae of the Great Worm | 1.11 patch notes: new items for Ouro
23558, -- The Burrower's Shell | 1.11 patch notes: new items for Ouro
23570, -- Jom Gabbar | 1.11 patch notes: new items for Ouro
23577, -- The Hungering Cold | Naxx Loot
23663, -- Girdle of Elemental Fury | Naxx Loot
23664, -- Pauldrons of Elemental Fury | Naxx Loot
23665, -- Leggings of Elemental Fury | Naxx Loot
23666, -- Belt of the Grand Crusader | Naxx Loot
23667, -- Spaulders of the Grand Crusader | Naxx Loot
23668; -- Leggings of the Grand Crusader | Naxx Loot
);
 
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