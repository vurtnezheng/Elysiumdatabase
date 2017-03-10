-- Patch 1.6 World DB Itemization Changes.
-- To be applied on QA first for testing.

-- Zanza's Potent Potables
REPLACE INTO `spell_mod` (`Id`, `AttributesEx3`, `Comment`) VALUES
(24382, 1048576, 'Spirit of Zanza - persist through death (before 1.12)'),
(24417, 1048576, 'Sheen of Zanza - persist through death (before 1.12)'),
(24383, 1048576, 'Swiftness of Zanza - persist through death (before 1.12)');

--Enable - http://www.wowhead.com/spell=24417/sheen-of-zanza
DELETE FROM `spell_disabled` WHERE `entry` = 24417;


-- Disable not in the game recipe + resulting food spell.
INSERT INTO spell_disabled SET entry=24800;
INSERT INTO spell_disabled SET entry=24801;
