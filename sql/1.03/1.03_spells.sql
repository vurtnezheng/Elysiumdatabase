
-- Zanza's Potent Potables

REPLACE INTO `spell_mod` (`Id`, `AttributesEx3`, `Comment`) VALUES 
(24382, 1048576, 'Spirit of Zanza - persist through death (before 1.12)'),
(24417, 1048576, 'Sheen of Zanza - persist through death (before 1.12)'),
(24383, 1048576, 'Swiftness of Zanza - persist through death (before 1.12)');

-- Disable not in the game recipe + resulting food spell

INSERT INTO spell_disabled SET entry=24800;
INSERT INTO spell_disabled SET entry=24801;
