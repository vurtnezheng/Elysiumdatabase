
-- Zanza's Potent Potables

REPLACE INTO `spell_mod` (`Id`, `AttributesEx3`, `Comment`) VALUES 
(24382, 1048576, 'Spirit of Zanza - persist through death (before 1.12)'),
(24417, 1048576, 'Sheen of Zanza - persist through death (before 1.12)'),
(24383, 1048576, 'Swiftness of Zanza - persist through death (before 1.12)');
DELETE FROM `spell_disabled` WHERE `entry` = 24417;

-- Disable not in the game recipe + resulting food spell

INSERT INTO spell_disabled VALUES (24800);
INSERT INTO spell_disabled VALUES (24801);

-- Disabling Spell "Savage Guard"

DELETE FROM `spell_disabled` WHERE `entry` = 28161;
INSERT INTO `spell_disabled` VALUES (28161);

-- Disable 1.9 Oils & Rumsey Rum Spell

INSERT INTO `spell_disabled` VALUES 
(25117),
(25118),
(25119),
(25120),
(25123),
(25122),
(25121),
(25660),
(25704),
(25722),
(25804),
(25691),
(26276),
(26278),
(26277);