-- GO "Sothos and Jarien's Heirlooms" Has Been Removed
UPDATE `gameobject` SET `spawnFlags` =`spawnFlags` | 2 WHERE `id` = 181083;

-- Remove Unused DM GO

UPDATE `gameobject` SET `spawnFlags` =`spawnFlags` | 2 WHERE `id` IN (179674, 179673, 179672);

UPDATE `gameobject` SET `spawnFlags` =`spawnFlags` | 2 WHERE `id` IN (179517);
-- Add involvedrelation for Treasure of Shen'dralar
REPLACE INTO `gameobject_involvedrelation` (`id`, `quest`) VALUES
(179517,    7877);