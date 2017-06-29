
-- Removing Items From NPCs "Illiyana Moonblaze" (14753) & "Kelm Hargunth" (14754)

DELETE FROM `npc_vendor` WHERE `entry` = 14753 AND `item` IN (22748, 22753, 22749, 22750, 22672, 22752);
DELETE FROM `npc_vendor` WHERE `entry` = 14754 AND `item` IN (22673, 22740, 22741, 22676, 22651, 22747);