-- Disable NPCs
UPDATE `creature` SET `spawnFlags` = (`spawnFlags` | 2) WHERE `id` IN (
15189, 15190, 15181, 15183, 15270, 15194, 15070, 14921, -- Quest NPCs
6109, -- Azuregos
12397 -- Kazzak
);
