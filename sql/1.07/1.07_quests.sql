
-- Remove Class Quests for the Warrior, Shaman, Paladin, and Warlock

DELETE FROM quest_template WHERE entry IN (

-- Warrior:
8417, -- http://wowwiki.wikia.com/Quest:A_Troubled_Spirit 
8423, -- http://wowwiki.wikia.com/Quest:Warrior_Kinship 
8424, -- http://wowwiki.wikia.com/Quest:War_on_the_Shadowsworn 
8425, -- http://wowwiki.wikia.com/Quest:Voodoo_Feathers 
-- Warlock:
8419, -- http://wowwiki.wikia.com/Quest:An_Imp%27s_Request 
8421, -- http://wowwiki.wikia.com/Quest:The_Wrong_Stuff 
8422, -- http://wowwiki.wikia.com/Quest:Trolls_of_a_Feather 
-- Shaman:
8410, -- http://wowwiki.wikia.com/Quest:Elemental_Mastery 
8412, -- http://wowwiki.wikia.com/Quest:Spirit_Totem 
8413, -- http://wowwiki.wikia.com/Quest:Da_Voodoo 
-- Paladin:
8415, -- http://wowwiki.wikia.com/Quest:Chillwind_Camp 
8414, -- http://wowwiki.wikia.com/Quest:Dispelling_Evil 
8416, -- http://wowwiki.wikia.com/Quest:Inert_Scourgestones 
8418  -- http://wowwiki.wikia.com/Quest:Forging_the_Mightstone
);

-- [Glyph Chasing]

DELETE from quest_template WHERE entry=8309;

-- Fix Alterac Valley Kazzak quest: non existant reward removed

UPDATE quest_template SET RewChoiceItemId4 = 0 WHERE entry IN (7202, 7181);

-- Sunken Temple Level 50 Quests 

DELETE FROM quest_template WHERE entry IN (8418, 8413, 8422, 8425);

UPDATE quest_template SET ReqItemId1 = 0, ReqItemCount1 = 0 WHERE entry IN (8184, 8185, 8186, 8187, 8188, 8189, 8190, 8191, 8192);

UPDATE quest_template SET MinLevel = 61 WHERE entry IN (9416, 9422, 9665, 9664, 9248);

-- Disabling AQ Opening Quest Chain

UPDATE quest_template SET MinLevel = 61 WHERE entry IN (8286, 8288, 8301, 8302, 8303, 8305, 8519, 8742, 8745, 8743, 8730, 8576, 8733);

-- EPL & Tier 0.5 Quests Have Been Disabled

UPDATE quest_template SET MinLevel = 61 WHERE entry IN (8977, 8922, 8921, 8924, 8925, 8928, 8977, 8926, 8929, 8945, 8946, 8947, 8948, 8949, 8950, 9015, 8951, 8960, 8961, 8952, 8960, 8961, 8923, 8913, 8914, 8915, 8916, 8917, 8918, 8919, 8930, 8927, 8938, 8939, 8941, 9014, 9013, 9012, 9011, 9010, 9009, 9008, 8944, 8943, 8942, 8978, 9228, 9222, 9224, 9225, 9227, 9221, 9223, 9226);

-- Disabling Post-War-Effort Quests

UPDATE quest_template SET MinLevel = 61 WHERE entry IN (8800, 8573, 8574, 8572, 8548, 8507, 8731, 8732, 8508, 9338);

-- Disabling 1.11 Enchantment Quests

UPDATE quest_template SET MinLevel = 61 WHERE entry IN (9210, 9208, 9209);

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
