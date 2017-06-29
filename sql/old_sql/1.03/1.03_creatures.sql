
-- Enable spawn of Azuregos & Kazzak (1.3)

UPDATE `creature` SET `spawnFlags` = `spawnFlags` | 2 WHERE id IN (6109, 12397);

-- Remove Warlock Epic Mount QUest Trigger

UPDATE `creature` SET `spawnFlags` = `spawnFlags` | 2 WHERE `id` = 1000001;