
-- Spawn of Azuregos, Kazzak (1.03)

UPDATE `creature` SET `spawnFlags` = 0 WHERE id IN (6109, 12397);

-- Changing War Effort NPCs Model Sizes

UPDATE `creature_template` SET `scale` = '1.35' WHERE `entry` IN (15535, 15528, 15532, 15739, 15477);
