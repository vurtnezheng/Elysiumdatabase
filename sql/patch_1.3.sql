-- Patch 1.3 World DB Itemization Changes. 
-- To be applied on QA first for testing.

-- Zanza's Potent Potables
REPLACE INTO `spell_mod` (`Id`, `AttributesEx3`, `Comment`) VALUES 
(24382, 1048576, 'Spirit of Zanza - persist through death (before 1.12)'),
(24417, 1048576, 'Sheen of Zanza - persist through death (before 1.12)'),
(24383, 1048576, 'Swiftness of Zanza - persist through death (before 1.12)');
DELETE FROM `spell_disabled` WHERE `entry` = 24417;

-- spawn of Azuregos, Kazzak 1.3
UPDATE `creature` SET `spawnFlags` = 0 WHERE id IN (6109, 12397);

-- disable unavailable game events
UPDATE `game_event` SET `disabled` = 1 WHERE `entry` IN
(
4, 5, 100, 101, 	-- DarkMoon Faire 1.6
13,					-- Elemental Invasion 1.5
16, 38, 39,			-- Gurubashi Arena 1.5
14, 15, 40,			-- Stranglethorn Fishing Extravaganza 1.7
66,					-- Dragons of Nightmare 1.8
18,					-- Call to arms: Alterac Valley 1.5
154,		-- Silithus @ 1.9 (unchecked)
155,		-- Argent dawn @ 1.11 (unchecked)
158,		-- 1.10 Patch : Recipes (unchecked)
160,		-- 1.10 Patch : t0.5 Quest Chain (unchecked)
162,		-- Patch 1.4 | 1.5
163,		-- Patch 1.6
164,		-- Patch 1.7
165,		-- Patch 1.8
166,		-- Patch 1.9
167,		-- Patch 1.10
168 		-- Patch 1.11 ? 1.12
);

-- enable available game events
UPDATE `game_event` SET `disabled` = 0 WHERE `entry` IN
(
156, 159,			-- Dire Maul extra content(unchecked) 1.3
35, 36, 37,
42, 43, 44,			-- The Maul 1.3
161					-- Patch 1.3
);

-- disable Alterac Valley 1.5
UPDATE `battleground_template` SET `MinLvl` = 61, `MaxLvl` = 61 WHERE `id` = 1;

-- "Thunderfury" Stats Have Been Corrected (main hand untill 1.12)
UPDATE item_template SET InventoryType = 21 WHERE entry = 19019;

-- disable unavailable instances
UPDATE `areatrigger_teleport` SET `required_level` = 61 WHERE `target_map` IN 
(
533,    -- Naxxramas 1.12
531,    -- AQ40 (Temple of AQ) 1.9
509,    -- AQ20 (Ruins of AQ) 1.9
309,    -- Zul'Gurub 1.7
469     -- Blackwing Lair 1.6
);

-- enable available instances
UPDATE `areatrigger_teleport` SET `required_level` = 45 WHERE `target_map` = 429;    -- Dire Maul 1.3

-- Pre 1.4 Enchants 
UPDATE item_enchantment_template SET chance = 4.53 * 100 / (100 - 16.6) WHERE entry=454;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 17.36) WHERE entry=455;
UPDATE item_enchantment_template SET chance = 1.48 * 100 / (100 - 18.46) WHERE entry=456;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 17.18) WHERE entry=457;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 17.42) WHERE entry=458;
UPDATE item_enchantment_template SET chance = 4.62 * 100 / (100 - 16.22) WHERE entry=459;
UPDATE item_enchantment_template SET chance = 4.72 * 100 / (100 - 14.96) WHERE entry=460;
UPDATE item_enchantment_template SET chance = 4.8 * 100 / (100 - 15.38) WHERE entry=461;
UPDATE item_enchantment_template SET chance = 0.74 * 100 / (100 - 14.24) WHERE entry=462;
UPDATE item_enchantment_template SET chance = 3.64 * 100 / (100 - 14.02) WHERE entry=463;
UPDATE item_enchantment_template SET chance = 3.51 * 100 / (100 - 19.7) WHERE entry=464;
UPDATE item_enchantment_template SET chance = 3.49 * 100 / (100 - 15.56) WHERE entry=465;
UPDATE item_enchantment_template SET chance = 3.7 * 100 / (100 - 15.98) WHERE entry=466;
UPDATE item_enchantment_template SET chance = 3.62 * 100 / (100 - 16.08) WHERE entry=467;
UPDATE item_enchantment_template SET chance = 3.24 * 100 / (100 - 24.26) WHERE entry=468;
UPDATE item_enchantment_template SET chance = 2.88 * 100 / (100 - 24.5) WHERE entry=469;
UPDATE item_enchantment_template SET chance = 2.92 * 100 / (100 - 28.37) WHERE entry=470;
UPDATE item_enchantment_template SET chance = 3.21 * 100 / (100 - 29.3) WHERE entry=471;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 28.91) WHERE entry=472;
UPDATE item_enchantment_template SET chance = 3.8 * 100 / (100 - 2.6) WHERE entry=475;
UPDATE item_enchantment_template SET chance = 4.55 * 100 / (100 - 2.76) WHERE entry=476;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 3) WHERE entry=477;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 3.48) WHERE entry=478;
UPDATE item_enchantment_template SET chance = 4.02 * 100 / (100 - 3.3) WHERE entry=479;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 3.6) WHERE entry=480;
UPDATE item_enchantment_template SET chance = 4.28 * 100 / (100 - 3.26) WHERE entry=481;
UPDATE item_enchantment_template SET chance = 3.08 * 100 / (100 - 3.44) WHERE entry=482;
UPDATE item_enchantment_template SET chance = 3.03 * 100 / (100 - 3.6) WHERE entry=483;
UPDATE item_enchantment_template SET chance = 3.25 * 100 / (100 - 3.26) WHERE entry=484;
UPDATE item_enchantment_template SET chance = 5.47 * 100 / (100 - 3) WHERE entry=485;
UPDATE item_enchantment_template SET chance = 5.63 * 100 / (100 - 3.24) WHERE entry=486;
UPDATE item_enchantment_template SET chance = 5.73 * 100 / (100 - 3.26) WHERE entry=487;
UPDATE item_enchantment_template SET chance = 6 * 100 / (100 - 3.5) WHERE entry=488;
UPDATE item_enchantment_template SET chance = 5.08 * 100 / (100 - 7.64) WHERE entry=489;
UPDATE item_enchantment_template SET chance = 4.67 * 100 / (100 - 6.54) WHERE entry=490;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 6.06) WHERE entry=491;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 6.94) WHERE entry=492;
UPDATE item_enchantment_template SET chance = 4.1 * 100 / (100 - 5.96) WHERE entry=493;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 0.1) WHERE entry=497;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 0.1) WHERE entry=502;
UPDATE item_enchantment_template SET chance = 2.77 * 100 / (100 - 3.3) WHERE entry=506;
UPDATE item_enchantment_template SET chance = 3.05 * 100 / (100 - 3.96) WHERE entry=507;
UPDATE item_enchantment_template SET chance = 3.13 * 100 / (100 - 3.56) WHERE entry=508;
UPDATE item_enchantment_template SET chance = 3.38 * 100 / (100 - 3.7) WHERE entry=509;
UPDATE item_enchantment_template SET chance = 2.77 * 100 / (100 - 7.46) WHERE entry=510;
UPDATE item_enchantment_template SET chance = 2.77 * 100 / (100 - 7.04) WHERE entry=511;
UPDATE item_enchantment_template SET chance = 2.5 * 100 / (100 - 5.5) WHERE entry=512;
UPDATE item_enchantment_template SET chance = 2.8 * 100 / (100 - 5.74) WHERE entry=513;
UPDATE item_enchantment_template SET chance = 2.2 * 100 / (100 - 6.39) WHERE entry=514;
UPDATE item_enchantment_template SET chance = 4.73 * 100 / (100 - 0.1) WHERE entry=531;
UPDATE item_enchantment_template SET chance = 4.05 * 100 / (100 - 0.2) WHERE entry=534;
UPDATE item_enchantment_template SET chance = 4.03 * 100 / (100 - 14) WHERE entry=538;
UPDATE item_enchantment_template SET chance = 2.38 * 100 / (100 - 14.37) WHERE entry=539;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 13.66) WHERE entry=540;
UPDATE item_enchantment_template SET chance = 6.25 * 100 / (100 - 14.9) WHERE entry=541;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 15.32) WHERE entry=542;
UPDATE item_enchantment_template SET chance = 7 * 100 / (100 - 16.06) WHERE entry=543;
UPDATE item_enchantment_template SET chance = 6.7 * 100 / (100 - 14.3) WHERE entry=544;
UPDATE item_enchantment_template SET chance = 6.45 * 100 / (100 - 13.74) WHERE entry=545;
UPDATE item_enchantment_template SET chance = 6.58 * 100 / (100 - 13.4) WHERE entry=546;
UPDATE item_enchantment_template SET chance = 6.85 * 100 / (100 - 12.36) WHERE entry=547;
UPDATE item_enchantment_template SET chance = 6.4 * 100 / (100 - 12.86) WHERE entry=548;
UPDATE item_enchantment_template SET chance = 6.72 * 100 / (100 - 13.64) WHERE entry=549;
UPDATE item_enchantment_template SET chance = 6.58 * 100 / (100 - 15.48) WHERE entry=550;
UPDATE item_enchantment_template SET chance = 5.93 * 100 / (100 - 15.06) WHERE entry=551;
UPDATE item_enchantment_template SET chance = 5.05 * 100 / (100 - 23.02) WHERE entry=552;
UPDATE item_enchantment_template SET chance = 4.3 * 100 / (100 - 24.4) WHERE entry=553;
UPDATE item_enchantment_template SET chance = 4.3 * 100 / (100 - 26.35) WHERE entry=554;
UPDATE item_enchantment_template SET chance = 0.4 * 100 / (100 - 24.74) WHERE entry=555;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 23.2) WHERE entry=556;
UPDATE item_enchantment_template SET chance = 4.33 * 100 / (100 - 4.4) WHERE entry=559;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 5.44) WHERE entry=560;
UPDATE item_enchantment_template SET chance = 5.35 * 100 / (100 - 3.8) WHERE entry=561;
UPDATE item_enchantment_template SET chance = 3.95 * 100 / (100 - 4.76) WHERE entry=562;
UPDATE item_enchantment_template SET chance = 4.72 * 100 / (100 - 5.25) WHERE entry=563;
UPDATE item_enchantment_template SET chance = 3.6 * 100 / (100 - 4.6) WHERE entry=564;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 5.26) WHERE entry=565;
UPDATE item_enchantment_template SET chance = 3.63 * 100 / (100 - 4.4) WHERE entry=566;
UPDATE item_enchantment_template SET chance = 3.65 * 100 / (100 - 4.14) WHERE entry=567;
UPDATE item_enchantment_template SET chance = 3.95 * 100 / (100 - 4.06) WHERE entry=568;
UPDATE item_enchantment_template SET chance = 3.8 * 100 / (100 - 4) WHERE entry=569;
UPDATE item_enchantment_template SET chance = 4.25 * 100 / (100 - 3.64) WHERE entry=570;
UPDATE item_enchantment_template SET chance = 4.3 * 100 / (100 - 3.26) WHERE entry=571;
UPDATE item_enchantment_template SET chance = 3.64 * 100 / (100 - 4.06) WHERE entry=572;
UPDATE item_enchantment_template SET chance = 3.68 * 100 / (100 - 5.91) WHERE entry=573;
UPDATE item_enchantment_template SET chance = 3.75 * 100 / (100 - 5.64) WHERE entry=574;
UPDATE item_enchantment_template SET chance = 3.45 * 100 / (100 - 4.94) WHERE entry=575;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 5.64) WHERE entry=576;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 5) WHERE entry=577;
UPDATE item_enchantment_template SET chance = 4.13 * 100 / (100 - 0.66) WHERE entry=580;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 1.04) WHERE entry=581;
UPDATE item_enchantment_template SET chance = 1.78 * 100 / (100 - 0.94) WHERE entry=582;
UPDATE item_enchantment_template SET chance = 4.9 * 100 / (100 - 0.8) WHERE entry=583;
UPDATE item_enchantment_template SET chance = 5.1 * 100 / (100 - 0.84) WHERE entry=584;
UPDATE item_enchantment_template SET chance = 5.22 * 100 / (100 - 0.76) WHERE entry=585;
UPDATE item_enchantment_template SET chance = 5.17 * 100 / (100 - 0.7) WHERE entry=586;
UPDATE item_enchantment_template SET chance = 5.15 * 100 / (100 - 0.86) WHERE entry=587;
UPDATE item_enchantment_template SET chance = 5.5 * 100 / (100 - 0.56) WHERE entry=588;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 0.84) WHERE entry=589;
UPDATE item_enchantment_template SET chance = 2.9 * 100 / (100 - 4.26) WHERE entry=590;
UPDATE item_enchantment_template SET chance = 2.65 * 100 / (100 - 5) WHERE entry=591;
UPDATE item_enchantment_template SET chance = 2.6 * 100 / (100 - 5.02) WHERE entry=592;
UPDATE item_enchantment_template SET chance = 2.28 * 100 / (100 - 4.46) WHERE entry=593;
UPDATE item_enchantment_template SET chance = 2.13 * 100 / (100 - 6.76) WHERE entry=594;
UPDATE item_enchantment_template SET chance = 2.65 * 100 / (100 - 6.82) WHERE entry=595;
UPDATE item_enchantment_template SET chance = 3.2 * 100 / (100 - 6.16) WHERE entry=596;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 6.14) WHERE entry=597;
UPDATE item_enchantment_template SET chance = 3.2 * 100 / (100 - 5.2) WHERE entry=598;
UPDATE item_enchantment_template SET chance = 6.05 * 100 / (100 - 1) WHERE entry=611;
UPDATE item_enchantment_template SET chance = 5.73 * 100 / (100 - 0.94) WHERE entry=612;
UPDATE item_enchantment_template SET chance = 5.63 * 100 / (100 - 0.84) WHERE entry=613;
UPDATE item_enchantment_template SET chance = 5.78 * 100 / (100 - 0.9) WHERE entry=614;
UPDATE item_enchantment_template SET chance = 4.93 * 100 / (100 - 1.8) WHERE entry=615;
UPDATE item_enchantment_template SET chance = 4.2 * 100 / (100 - 1.56) WHERE entry=616;
UPDATE item_enchantment_template SET chance = 4.75 * 100 / (100 - 1.7) WHERE entry=617;
UPDATE item_enchantment_template SET chance = 4.27 * 100 / (100 - 1.6) WHERE entry=618;
UPDATE item_enchantment_template SET chance = 4.1 * 100 / (100 - 1.6) WHERE entry=619;
UPDATE item_enchantment_template SET chance = 4.04 * 100 / (100 - 31.38) WHERE entry=629;
UPDATE item_enchantment_template SET chance = 3.64 * 100 / (100 - 27.52) WHERE entry=630;
UPDATE item_enchantment_template SET chance = 3 * 100 / (100 - 25.8) WHERE entry=631;
UPDATE item_enchantment_template SET chance = 3.26 * 100 / (100 - 26.7) WHERE entry=632;
UPDATE item_enchantment_template SET chance = 3.08 * 100 / (100 - 24.5) WHERE entry=633;
UPDATE item_enchantment_template SET chance = 2.67 * 100 / (100 - 25.76) WHERE entry=634;
UPDATE item_enchantment_template SET chance = 2.73 * 100 / (100 - 26.02) WHERE entry=635;
UPDATE item_enchantment_template SET chance = 3 * 100 / (100 - 20.8) WHERE entry=636;
UPDATE item_enchantment_template SET chance = 3 * 100 / (100 - 23.46) WHERE entry=637;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 25.43) WHERE entry=638;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 27.53) WHERE entry=639;
UPDATE item_enchantment_template SET chance = 1.85 * 100 / (100 - 33.2) WHERE entry=640;
UPDATE item_enchantment_template SET chance = 3.28 * 100 / (100 - 6.24) WHERE entry=650;
UPDATE item_enchantment_template SET chance = 3.98 * 100 / (100 - 7.16) WHERE entry=651;
UPDATE item_enchantment_template SET chance = 3.83 * 100 / (100 - 6.24) WHERE entry=652;
UPDATE item_enchantment_template SET chance = 4.68 * 100 / (100 - 4.74) WHERE entry=653;
UPDATE item_enchantment_template SET chance = 4.9 * 100 / (100 - 4.88) WHERE entry=654;
UPDATE item_enchantment_template SET chance = 4.97 * 100 / (100 - 4.74) WHERE entry=655;
UPDATE item_enchantment_template SET chance = 4.92 * 100 / (100 - 4.7) WHERE entry=656;
UPDATE item_enchantment_template SET chance = 4.95 * 100 / (100 - 5.4) WHERE entry=657;
UPDATE item_enchantment_template SET chance = 4.27 * 100 / (100 - 5.2) WHERE entry=658;
UPDATE item_enchantment_template SET chance = 3.85 * 100 / (100 - 4.19) WHERE entry=659;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 5.56) WHERE entry=660;
UPDATE item_enchantment_template SET chance = 4.45 * 100 / (100 - 3.1) WHERE entry=661;
UPDATE item_enchantment_template SET chance = 4.25 * 100 / (100 - 0.56) WHERE entry=671;
UPDATE item_enchantment_template SET chance = 5.13 * 100 / (100 - 0.5) WHERE entry=672;
UPDATE item_enchantment_template SET chance = 5.48 * 100 / (100 - 0.36) WHERE entry=673;
UPDATE item_enchantment_template SET chance = 2.76 * 100 / (100 - 5.72) WHERE entry=674;
UPDATE item_enchantment_template SET chance = 2.8 * 100 / (100 - 6.76) WHERE entry=675;
UPDATE item_enchantment_template SET chance = 2.97 * 100 / (100 - 5.7) WHERE entry=676;
UPDATE item_enchantment_template SET chance = 2.93 * 100 / (100 - 5.7) WHERE entry=677;
UPDATE item_enchantment_template SET chance = 2.63 * 100 / (100 - 7.6) WHERE entry=678;
UPDATE item_enchantment_template SET chance = 2.4 * 100 / (100 - 6.82) WHERE entry=679;
UPDATE item_enchantment_template SET chance = 3 * 100 / (100 - 5.06) WHERE entry=680;
UPDATE item_enchantment_template SET chance = 2.43 * 100 / (100 - 5.2) WHERE entry=681;
UPDATE item_enchantment_template SET chance = 3.7 * 100 / (100 - 3) WHERE entry=682;
UPDATE item_enchantment_template SET chance = 4.75 * 100 / (100 - 0.76) WHERE entry=695;
UPDATE item_enchantment_template SET chance = 5.25 * 100 / (100 - 0.66) WHERE entry=696;
UPDATE item_enchantment_template SET chance = 5.25 * 100 / (100 - 0.5) WHERE entry=697;
UPDATE item_enchantment_template SET chance = 5.02 * 100 / (100 - 0.46) WHERE entry=698;
UPDATE item_enchantment_template SET chance = 4.43 * 100 / (100 - 0.84) WHERE entry=699;
UPDATE item_enchantment_template SET chance = 4.8 * 100 / (100 - 0.84) WHERE entry=700;
UPDATE item_enchantment_template SET chance = 4.37 * 100 / (100 - 0.96) WHERE entry=701;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 1.37) WHERE entry=702;
UPDATE item_enchantment_template SET chance = 2.7 * 100 / (100 - 1.2) WHERE entry=703;
UPDATE item_enchantment_template SET chance = 5.05 * 100 / (100 - 15.6) WHERE entry=708;
UPDATE item_enchantment_template SET chance = 5.45 * 100 / (100 - 13.94) WHERE entry=709;
UPDATE item_enchantment_template SET chance = 6.13 * 100 / (100 - 15.46) WHERE entry=710;
UPDATE item_enchantment_template SET chance = 6.53 * 100 / (100 - 15.36) WHERE entry=711;
UPDATE item_enchantment_template SET chance = 12.3 * 100 / (100 - 14.93) WHERE entry=712;
UPDATE item_enchantment_template SET chance = 12.8 * 100 / (100 - 13.2) WHERE entry=713;
UPDATE item_enchantment_template SET chance = 6.35 * 100 / (100 - 13.62) WHERE entry=714;
UPDATE item_enchantment_template SET chance = 5.97 * 100 / (100 - 13.9) WHERE entry=715;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 14.78) WHERE entry=716;
UPDATE item_enchantment_template SET chance = 5.13 * 100 / (100 - 13.74) WHERE entry=717;
UPDATE item_enchantment_template SET chance = 4.9 * 100 / (100 - 14.9) WHERE entry=718;
UPDATE item_enchantment_template SET chance = 3.76 * 100 / (100 - 14.54) WHERE entry=719;
UPDATE item_enchantment_template SET chance = 6.9 * 100 / (100 - 21.9) WHERE entry=720;
UPDATE item_enchantment_template SET chance = 6.35 * 100 / (100 - 23.9) WHERE entry=721;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 22.66) WHERE entry=722;
UPDATE item_enchantment_template SET chance = 0.4 * 100 / (100 - 27.65) WHERE entry=723;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 5.5) WHERE entry=729;
UPDATE item_enchantment_template SET chance = 3.15 * 100 / (100 - 4.1) WHERE entry=730;
UPDATE item_enchantment_template SET chance = 3.4 * 100 / (100 - 4.96) WHERE entry=731;
UPDATE item_enchantment_template SET chance = 6.4 * 100 / (100 - 3.96) WHERE entry=732;
UPDATE item_enchantment_template SET chance = 7.97 * 100 / (100 - 3.9) WHERE entry=733;
UPDATE item_enchantment_template SET chance = 7.9 * 100 / (100 - 3.7) WHERE entry=734;
UPDATE item_enchantment_template SET chance = 3.97 * 100 / (100 - 3.64) WHERE entry=735;
UPDATE item_enchantment_template SET chance = 3.9 * 100 / (100 - 3.64) WHERE entry=736;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 3.84) WHERE entry=737;
UPDATE item_enchantment_template SET chance = 3.27 * 100 / (100 - 3.04) WHERE entry=738;
UPDATE item_enchantment_template SET chance = 2.92 * 100 / (100 - 2.94) WHERE entry=739;
UPDATE item_enchantment_template SET chance = 2.87 * 100 / (100 - 2.9) WHERE entry=740;
UPDATE item_enchantment_template SET chance = 5.3 * 100 / (100 - 4.7) WHERE entry=741;
UPDATE item_enchantment_template SET chance = 4.5 * 100 / (100 - 5) WHERE entry=742;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 5.18) WHERE entry=743;
UPDATE item_enchantment_template SET chance = 2.25 * 100 / (100 - 6.04) WHERE entry=744;
UPDATE item_enchantment_template SET chance = 0.8 * 100 / (100 - 10.7) WHERE entry=745;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 1) WHERE entry=749;
UPDATE item_enchantment_template SET chance = 2.2 * 100 / (100 - 0.9) WHERE entry=750;
UPDATE item_enchantment_template SET chance = 4.93 * 100 / (100 - 0.86) WHERE entry=751;
UPDATE item_enchantment_template SET chance = 5.5 * 100 / (100 - 0.9) WHERE entry=752;
UPDATE item_enchantment_template SET chance = 5.13 * 100 / (100 - 0.86) WHERE entry=753;
UPDATE item_enchantment_template SET chance = 10.85 * 100 / (100 - 0.8) WHERE entry=754;
UPDATE item_enchantment_template SET chance = 11.17 * 100 / (100 - 0.7) WHERE entry=755;
UPDATE item_enchantment_template SET chance = 5.57 * 100 / (100 - 0.64) WHERE entry=756;
UPDATE item_enchantment_template SET chance = 5.43 * 100 / (100 - 0.64) WHERE entry=757;
UPDATE item_enchantment_template SET chance = 2.97 * 100 / (100 - 3.84) WHERE entry=758;
UPDATE item_enchantment_template SET chance = 3.55 * 100 / (100 - 3.8) WHERE entry=759;
UPDATE item_enchantment_template SET chance = 3.07 * 100 / (100 - 3.74) WHERE entry=760;
UPDATE item_enchantment_template SET chance = 3.25 * 100 / (100 - 4.1) WHERE entry=761;
UPDATE item_enchantment_template SET chance = 5.23 * 100 / (100 - 6.03) WHERE entry=762;
UPDATE item_enchantment_template SET chance = 4.15 * 100 / (100 - 4.85) WHERE entry=763;
UPDATE item_enchantment_template SET chance = 2.08 * 100 / (100 - 5.36) WHERE entry=764;
UPDATE item_enchantment_template SET chance = 1.57 * 100 / (100 - 5.68) WHERE entry=765;
UPDATE item_enchantment_template SET chance = 5.37 * 100 / (100 - 0.56) WHERE entry=779;
UPDATE item_enchantment_template SET chance = 5.7 * 100 / (100 - 0.76) WHERE entry=780;
UPDATE item_enchantment_template SET chance = 5.5 * 100 / (100 - 0.46) WHERE entry=781;
UPDATE item_enchantment_template SET chance = 5.22 * 100 / (100 - 0.54) WHERE entry=782;
UPDATE item_enchantment_template SET chance = 9.53 * 100 / (100 - 1.8) WHERE entry=783;
UPDATE item_enchantment_template SET chance = 9.57 * 100 / (100 - 2.53) WHERE entry=784;
UPDATE item_enchantment_template SET chance = 4.92 * 100 / (100 - 1.69) WHERE entry=785;
UPDATE item_enchantment_template SET chance = 4.2 * 100 / (100 - 1.64) WHERE entry=786;
UPDATE item_enchantment_template SET chance = 3.2 * 100 / (100 - 16.3) WHERE entry=791;
UPDATE item_enchantment_template SET chance = 2.3 * 100 / (100 - 15.3) WHERE entry=792;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 14.56) WHERE entry=793;
UPDATE item_enchantment_template SET chance = 6.13 * 100 / (100 - 16) WHERE entry=794;
UPDATE item_enchantment_template SET chance = 5.63 * 100 / (100 - 15.2) WHERE entry=795;
UPDATE item_enchantment_template SET chance = 11.8 * 100 / (100 - 15.4) WHERE entry=796;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 14.6) WHERE entry=797;
UPDATE item_enchantment_template SET chance = 5.67 * 100 / (100 - 13.7) WHERE entry=798;
UPDATE item_enchantment_template SET chance = 5.82 * 100 / (100 - 13.68) WHERE entry=799;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 14.18) WHERE entry=800;
UPDATE item_enchantment_template SET chance = 5.63 * 100 / (100 - 14.26) WHERE entry=801;
UPDATE item_enchantment_template SET chance = 5 * 100 / (100 - 14.4) WHERE entry=802;
UPDATE item_enchantment_template SET chance = 3.67 * 100 / (100 - 16.92) WHERE entry=803;
UPDATE item_enchantment_template SET chance = 6.55 * 100 / (100 - 22) WHERE entry=804;
UPDATE item_enchantment_template SET chance = 6.4 * 100 / (100 - 23.2) WHERE entry=805;
UPDATE item_enchantment_template SET chance = 3.23 * 100 / (100 - 23.78) WHERE entry=806;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 23.36) WHERE entry=807;
UPDATE item_enchantment_template SET chance = 4.68 * 100 / (100 - 2.94) WHERE entry=813;
UPDATE item_enchantment_template SET chance = 4.32 * 100 / (100 - 2.8) WHERE entry=814;
UPDATE item_enchantment_template SET chance = 4.15 * 100 / (100 - 3.5) WHERE entry=815;
UPDATE item_enchantment_template SET chance = 3.9 * 100 / (100 - 3.66) WHERE entry=816;
UPDATE item_enchantment_template SET chance = 6.77 * 100 / (100 - 3.47) WHERE entry=817;
UPDATE item_enchantment_template SET chance = 7.37 * 100 / (100 - 2.97) WHERE entry=818;
UPDATE item_enchantment_template SET chance = 3.87 * 100 / (100 - 2.9) WHERE entry=819;
UPDATE item_enchantment_template SET chance = 4 * 100 / (100 - 2.46) WHERE entry=820;
UPDATE item_enchantment_template SET chance = 4.08 * 100 / (100 - 2.76) WHERE entry=821;
UPDATE item_enchantment_template SET chance = 4.25 * 100 / (100 - 2.16) WHERE entry=822;
UPDATE item_enchantment_template SET chance = 4.6 * 100 / (100 - 1.9) WHERE entry=823;
UPDATE item_enchantment_template SET chance = 4.36 * 100 / (100 - 2.52) WHERE entry=824;
UPDATE item_enchantment_template SET chance = 9.8 * 100 / (100 - 5.4) WHERE entry=825;
UPDATE item_enchantment_template SET chance = 9.45 * 100 / (100 - 4.85) WHERE entry=826;
UPDATE item_enchantment_template SET chance = 4.43 * 100 / (100 - 4.84) WHERE entry=827;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 4.36) WHERE entry=828;
UPDATE item_enchantment_template SET chance = 4.28 * 100 / (100 - 0.1) WHERE entry=834;
UPDATE item_enchantment_template SET chance = 3.93 * 100 / (100 - 0.2) WHERE entry=835;
UPDATE item_enchantment_template SET chance = 10.7 * 100 / (100 - 0.1) WHERE entry=838;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 3.36) WHERE entry=842;
UPDATE item_enchantment_template SET chance = 0.44 * 100 / (100 - 3.26) WHERE entry=843;
UPDATE item_enchantment_template SET chance = 2.48 * 100 / (100 - 3.44) WHERE entry=844;
UPDATE item_enchantment_template SET chance = 2.9 * 100 / (100 - 3.2) WHERE entry=845;
UPDATE item_enchantment_template SET chance = 5.65 * 100 / (100 - 6.2) WHERE entry=846;
UPDATE item_enchantment_template SET chance = 4.8 * 100 / (100 - 6.4) WHERE entry=847;
UPDATE item_enchantment_template SET chance = 2.82 * 100 / (100 - 7.71) WHERE entry=848;
UPDATE item_enchantment_template SET chance = 1.88 * 100 / (100 - 5.5) WHERE entry=849;
UPDATE item_enchantment_template SET chance = 4.05 * 100 / (100 - 15.4) WHERE entry=875;
UPDATE item_enchantment_template SET chance = 5.05 * 100 / (100 - 14.6) WHERE entry=876;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 13.1) WHERE entry=877;
UPDATE item_enchantment_template SET chance = 4.8 * 100 / (100 - 13.22) WHERE entry=878;
UPDATE item_enchantment_template SET chance = 4.9 * 100 / (100 - 12.38) WHERE entry=879;
UPDATE item_enchantment_template SET chance = 10 * 100 / (100 - 11.94) WHERE entry=880;
UPDATE item_enchantment_template SET chance = 10.3 * 100 / (100 - 11.27) WHERE entry=881;
UPDATE item_enchantment_template SET chance = 5.03 * 100 / (100 - 10.44) WHERE entry=882;
UPDATE item_enchantment_template SET chance = 4.98 * 100 / (100 - 12.24) WHERE entry=883;
UPDATE item_enchantment_template SET chance = 4.27 * 100 / (100 - 13.8) WHERE entry=884;
UPDATE item_enchantment_template SET chance = 3.77 * 100 / (100 - 13.26) WHERE entry=885;
UPDATE item_enchantment_template SET chance = 4.02 * 100 / (100 - 14.5) WHERE entry=886;
UPDATE item_enchantment_template SET chance = 4.35 * 100 / (100 - 14.3) WHERE entry=887;
UPDATE item_enchantment_template SET chance = 8.1 * 100 / (100 - 22.2) WHERE entry=888;
UPDATE item_enchantment_template SET chance = 8.3 * 100 / (100 - 23.6) WHERE entry=889;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 28.96) WHERE entry=890;
UPDATE item_enchantment_template SET chance = 4.4 * 100 / (100 - 26.04) WHERE entry=891;
UPDATE item_enchantment_template SET chance = 3.4 * 100 / (100 - 5.51) WHERE entry=896;
UPDATE item_enchantment_template SET chance = 3.95 * 100 / (100 - 4.7) WHERE entry=897;
UPDATE item_enchantment_template SET chance = 2.87 * 100 / (100 - 4.76) WHERE entry=898;
UPDATE item_enchantment_template SET chance = 3.05 * 100 / (100 - 3.8) WHERE entry=899;
UPDATE item_enchantment_template SET chance = 6.17 * 100 / (100 - 4.28) WHERE entry=900;
UPDATE item_enchantment_template SET chance = 8.4 * 100 / (100 - 4.15) WHERE entry=901;
UPDATE item_enchantment_template SET chance = 8.43 * 100 / (100 - 3.9) WHERE entry=902;
UPDATE item_enchantment_template SET chance = 3.78 * 100 / (100 - 3.64) WHERE entry=903;
UPDATE item_enchantment_template SET chance = 3.58 * 100 / (100 - 3.8) WHERE entry=904;
UPDATE item_enchantment_template SET chance = 3.25 * 100 / (100 - 3.64) WHERE entry=905;
UPDATE item_enchantment_template SET chance = 3.25 * 100 / (100 - 3.74) WHERE entry=906;
UPDATE item_enchantment_template SET chance = 3.23 * 100 / (100 - 3.12) WHERE entry=907;
UPDATE item_enchantment_template SET chance = 3.65 * 100 / (100 - 3.5) WHERE entry=908;
UPDATE item_enchantment_template SET chance = 6.4 * 100 / (100 - 4.91) WHERE entry=909;
UPDATE item_enchantment_template SET chance = 5.8 * 100 / (100 - 4.8) WHERE entry=910;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 4.6) WHERE entry=911;
UPDATE item_enchantment_template SET chance = 2.55 * 100 / (100 - 4.84) WHERE entry=912;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 0.69) WHERE entry=917;
UPDATE item_enchantment_template SET chance = 4.55 * 100 / (100 - 0.92) WHERE entry=918;
UPDATE item_enchantment_template SET chance = 5.05 * 100 / (100 - 0.86) WHERE entry=919;
UPDATE item_enchantment_template SET chance = 5.23 * 100 / (100 - 0.9) WHERE entry=920;
UPDATE item_enchantment_template SET chance = 5.33 * 100 / (100 - 1) WHERE entry=921;
UPDATE item_enchantment_template SET chance = 10.9 * 100 / (100 - 0.75) WHERE entry=922;
UPDATE item_enchantment_template SET chance = 11.1 * 100 / (100 - 0.85) WHERE entry=923;
UPDATE item_enchantment_template SET chance = 5.3 * 100 / (100 - 0.66) WHERE entry=924;
UPDATE item_enchantment_template SET chance = 5.57 * 100 / (100 - 0.6) WHERE entry=925;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 4.12) WHERE entry=926;
UPDATE item_enchantment_template SET chance = 2.65 * 100 / (100 - 5.2) WHERE entry=927;
UPDATE item_enchantment_template SET chance = 2.82 * 100 / (100 - 4.26) WHERE entry=928;
UPDATE item_enchantment_template SET chance = 2.68 * 100 / (100 - 4.36) WHERE entry=929;
UPDATE item_enchantment_template SET chance = 4.95 * 100 / (100 - 6.2) WHERE entry=930;
UPDATE item_enchantment_template SET chance = 5.13 * 100 / (100 - 7.17) WHERE entry=931;
UPDATE item_enchantment_template SET chance = 2.77 * 100 / (100 - 5.6) WHERE entry=932;
UPDATE item_enchantment_template SET chance = 2.03 * 100 / (100 - 5) WHERE entry=933;
UPDATE item_enchantment_template SET chance = 5.48 * 100 / (100 - 0.64) WHERE entry=947;
UPDATE item_enchantment_template SET chance = 5.63 * 100 / (100 - 0.84) WHERE entry=948;
UPDATE item_enchantment_template SET chance = 5.82 * 100 / (100 - 0.94) WHERE entry=949;
UPDATE item_enchantment_template SET chance = 5.38 * 100 / (100 - 0.64) WHERE entry=950;
UPDATE item_enchantment_template SET chance = 9.67 * 100 / (100 - 1.83) WHERE entry=951;
UPDATE item_enchantment_template SET chance = 8.83 * 100 / (100 - 1.63) WHERE entry=952;
UPDATE item_enchantment_template SET chance = 4.1 * 100 / (100 - 2.13) WHERE entry=953;
UPDATE item_enchantment_template SET chance = 3.85 * 100 / (100 - 1.3) WHERE entry=954;
UPDATE item_enchantment_template SET chance = 1.97 * 100 / (100 - 35) WHERE entry=959;
UPDATE item_enchantment_template SET chance = 2.57 * 100 / (100 - 30.44) WHERE entry=960;
UPDATE item_enchantment_template SET chance = 2.72 * 100 / (100 - 28.72) WHERE entry=961;
UPDATE item_enchantment_template SET chance = 3.15 * 100 / (100 - 28.5) WHERE entry=962;
UPDATE item_enchantment_template SET chance = 6.65 * 100 / (100 - 29.85) WHERE entry=963;
UPDATE item_enchantment_template SET chance = 6.2 * 100 / (100 - 31.06) WHERE entry=964;
UPDATE item_enchantment_template SET chance = 3.18 * 100 / (100 - 27.4) WHERE entry=965;
UPDATE item_enchantment_template SET chance = 3.37 * 100 / (100 - 27.42) WHERE entry=966;
UPDATE item_enchantment_template SET chance = 3.17 * 100 / (100 - 25.84) WHERE entry=967;
UPDATE item_enchantment_template SET chance = 2.93 * 100 / (100 - 29.2) WHERE entry=968;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 30.41) WHERE entry=969;
UPDATE item_enchantment_template SET chance = 6.3 * 100 / (100 - 28.55) WHERE entry=970;
UPDATE item_enchantment_template SET chance = 5.55 * 100 / (100 - 30.25) WHERE entry=971;
UPDATE item_enchantment_template SET chance = 3.3 * 100 / (100 - 23.88) WHERE entry=972;
UPDATE item_enchantment_template SET chance = 3.35 * 100 / (100 - 27.66) WHERE entry=973;
UPDATE item_enchantment_template SET chance = 3.52 * 100 / (100 - 27.62) WHERE entry=974;
UPDATE item_enchantment_template SET chance = 5.75 * 100 / (100 - 27.9) WHERE entry=975;
UPDATE item_enchantment_template SET chance = 2.85 * 100 / (100 - 7.3) WHERE entry=980;
UPDATE item_enchantment_template SET chance = 4.2 * 100 / (100 - 5.3) WHERE entry=981;
UPDATE item_enchantment_template SET chance = 4.2 * 100 / (100 - 6.42) WHERE entry=982;
UPDATE item_enchantment_template SET chance = 4.65 * 100 / (100 - 6.5) WHERE entry=983;
UPDATE item_enchantment_template SET chance = 9 * 100 / (100 - 6.5) WHERE entry=984;
UPDATE item_enchantment_template SET chance = 8.95 * 100 / (100 - 6.5) WHERE entry=985;
UPDATE item_enchantment_template SET chance = 9.37 * 100 / (100 - 7.16) WHERE entry=986;
UPDATE item_enchantment_template SET chance = 3.53 * 100 / (100 - 5.86) WHERE entry=987;
UPDATE item_enchantment_template SET chance = 3.38 * 100 / (100 - 6.76) WHERE entry=988;
UPDATE item_enchantment_template SET chance = 3.83 * 100 / (100 - 6.68) WHERE entry=989;
UPDATE item_enchantment_template SET chance = 7.2 * 100 / (100 - 7.47) WHERE entry=990;
UPDATE item_enchantment_template SET chance = 7.35 * 100 / (100 - 8.35) WHERE entry=991;
UPDATE item_enchantment_template SET chance = 7.08 * 100 / (100 - 7.56) WHERE entry=992;
UPDATE item_enchantment_template SET chance = 3.5 * 100 / (100 - 8.86) WHERE entry=993;
UPDATE item_enchantment_template SET chance = 4.15 * 100 / (100 - 8.9) WHERE entry=994;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 7.68) WHERE entry=995;
UPDATE item_enchantment_template SET chance = 9.3 * 100 / (100 - 6.2) WHERE entry=996;
UPDATE item_enchantment_template SET chance = 3.6 * 100 / (100 - 1.2) WHERE entry=1002;
UPDATE item_enchantment_template SET chance = 4.15 * 100 / (100 - 1) WHERE entry=1003;
UPDATE item_enchantment_template SET chance = 5.55 * 100 / (100 - 1.3) WHERE entry=1004;
UPDATE item_enchantment_template SET chance = 10.2 * 100 / (100 - 1.1) WHERE entry=1005;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 1.15) WHERE entry=1006;
UPDATE item_enchantment_template SET chance = 11.87 * 100 / (100 - 1.26) WHERE entry=1007;
UPDATE item_enchantment_template SET chance = 4.58 * 100 / (100 - 1.16) WHERE entry=1008;
UPDATE item_enchantment_template SET chance = 4.87 * 100 / (100 - 1) WHERE entry=1009;
UPDATE item_enchantment_template SET chance = 2.88 * 100 / (100 - 3.1) WHERE entry=1010;
UPDATE item_enchantment_template SET chance = 5.82 * 100 / (100 - 3.32) WHERE entry=1011;
UPDATE item_enchantment_template SET chance = 5.45 * 100 / (100 - 3.35) WHERE entry=1012;
UPDATE item_enchantment_template SET chance = 5.7 * 100 / (100 - 3) WHERE entry=1013;
UPDATE item_enchantment_template SET chance = 2.73 * 100 / (100 - 3.8) WHERE entry=1014;
UPDATE item_enchantment_template SET chance = 3.25 * 100 / (100 - 3.8) WHERE entry=1015;
UPDATE item_enchantment_template SET chance = 3.77 * 100 / (100 - 3.3) WHERE entry=1016;
UPDATE item_enchantment_template SET chance = 8.8 * 100 / (100 - 3.7) WHERE entry=1017;
UPDATE item_enchantment_template SET chance = 3.55 * 100 / (100 - 32.3) WHERE entry=1043;
UPDATE item_enchantment_template SET chance = 3.05 * 100 / (100 - 28.9) WHERE entry=1044;
UPDATE item_enchantment_template SET chance = 2.81 * 100 / (100 - 34.64) WHERE entry=1045;
UPDATE item_enchantment_template SET chance = 6.7 * 100 / (100 - 32.25) WHERE entry=1047;
UPDATE item_enchantment_template SET chance = 7.05 * 100 / (100 - 29.33) WHERE entry=1048;
UPDATE item_enchantment_template SET chance = 4 * 100 / (100 - 29.76) WHERE entry=1049;
UPDATE item_enchantment_template SET chance = 4.1 * 100 / (100 - 26.4) WHERE entry=1050;
UPDATE item_enchantment_template SET chance = 4.33 * 100 / (100 - 26.87) WHERE entry=1051;
UPDATE item_enchantment_template SET chance = 4.38 * 100 / (100 - 26.18) WHERE entry=1052;
UPDATE item_enchantment_template SET chance = 7.67 * 100 / (100 - 26.57) WHERE entry=1053;
UPDATE item_enchantment_template SET chance = 7.15 * 100 / (100 - 26.95) WHERE entry=1054;
UPDATE item_enchantment_template SET chance = 7.27 * 100 / (100 - 27.56) WHERE entry=1055;
UPDATE item_enchantment_template SET chance = 3.5 * 100 / (100 - 23.84) WHERE entry=1056;
UPDATE item_enchantment_template SET chance = 3.33 * 100 / (100 - 25.74) WHERE entry=1057;
UPDATE item_enchantment_template SET chance = 3.9 * 100 / (100 - 25.5) WHERE entry=1058;
UPDATE item_enchantment_template SET chance = 5.7 * 100 / (100 - 28.99) WHERE entry=1059;
UPDATE item_enchantment_template SET chance = 3.7 * 100 / (100 - 7.6) WHERE entry=1064;
UPDATE item_enchantment_template SET chance = 3.45 * 100 / (100 - 8) WHERE entry=1065;
UPDATE item_enchantment_template SET chance = 3.5 * 100 / (100 - 7.66) WHERE entry=1066;
UPDATE item_enchantment_template SET chance = 3.1 * 100 / (100 - 8.1) WHERE entry=1067;
UPDATE item_enchantment_template SET chance = 7.05 * 100 / (100 - 7.52) WHERE entry=1068;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 9.43) WHERE entry=1069;
UPDATE item_enchantment_template SET chance = 3.63 * 100 / (100 - 7.06) WHERE entry=1070;
UPDATE item_enchantment_template SET chance = 4.75 * 100 / (100 - 5.2) WHERE entry=1071;
UPDATE item_enchantment_template SET chance = 4.12 * 100 / (100 - 7.16) WHERE entry=1072;
UPDATE item_enchantment_template SET chance = 3.75 * 100 / (100 - 6.02) WHERE entry=1073;
UPDATE item_enchantment_template SET chance = 6.67 * 100 / (100 - 6.07) WHERE entry=1074;
UPDATE item_enchantment_template SET chance = 6.7 * 100 / (100 - 5.93) WHERE entry=1075;
UPDATE item_enchantment_template SET chance = 8 * 100 / (100 - 5.4) WHERE entry=1076;
UPDATE item_enchantment_template SET chance = 4.33 * 100 / (100 - 5.54) WHERE entry=1077;
UPDATE item_enchantment_template SET chance = 4.92 * 100 / (100 - 5.96) WHERE entry=1078;
UPDATE item_enchantment_template SET chance = 5.07 * 100 / (100 - 5.87) WHERE entry=1079;
UPDATE item_enchantment_template SET chance = 9 * 100 / (100 - 5.8) WHERE entry=1080;
UPDATE item_enchantment_template SET chance = 4.2 * 100 / (100 - 1.06) WHERE entry=1085;
UPDATE item_enchantment_template SET chance = 3.23 * 100 / (100 - 0.8) WHERE entry=1086;
UPDATE item_enchantment_template SET chance = 4.9 * 100 / (100 - 0.7) WHERE entry=1087;
UPDATE item_enchantment_template SET chance = 4.45 * 100 / (100 - 0.86) WHERE entry=1088;
UPDATE item_enchantment_template SET chance = 9.83 * 100 / (100 - 0.5) WHERE entry=1089;
UPDATE item_enchantment_template SET chance = 10.67 * 100 / (100 - 0.43) WHERE entry=1090;
UPDATE item_enchantment_template SET chance = 5.47 * 100 / (100 - 0.56) WHERE entry=1091;
UPDATE item_enchantment_template SET chance = 5.19 * 100 / (100 - 0.46) WHERE entry=1092;
UPDATE item_enchantment_template SET chance = 5.83 * 100 / (100 - 0.5) WHERE entry=1093;
UPDATE item_enchantment_template SET chance = 2.76 * 100 / (100 - 5.9) WHERE entry=1094;
UPDATE item_enchantment_template SET chance = 4.7 * 100 / (100 - 6.55) WHERE entry=1095;
UPDATE item_enchantment_template SET chance = 5.5 * 100 / (100 - 5.95) WHERE entry=1096;
UPDATE item_enchantment_template SET chance = 4.88 * 100 / (100 - 6.05) WHERE entry=1097;
UPDATE item_enchantment_template SET chance = 2.3 * 100 / (100 - 6.1) WHERE entry=1098;
UPDATE item_enchantment_template SET chance = 2.85 * 100 / (100 - 6.6) WHERE entry=1099;
UPDATE item_enchantment_template SET chance = 3.1 * 100 / (100 - 5.52) WHERE entry=1100;
UPDATE item_enchantment_template SET chance = 6.8 * 100 / (100 - 5.13) WHERE entry=1101;
UPDATE item_enchantment_template SET chance = 4.93 * 100 / (100 - 0.56) WHERE entry=1115;
UPDATE item_enchantment_template SET chance = 10.17 * 100 / (100 - 0.67) WHERE entry=1116;
UPDATE item_enchantment_template SET chance = 9.4 * 100 / (100 - 0.45) WHERE entry=1117;
UPDATE item_enchantment_template SET chance = 10.35 * 100 / (100 - 0.63) WHERE entry=1118;
UPDATE item_enchantment_template SET chance = 4.1 * 100 / (100 - 0.7) WHERE entry=1119;
UPDATE item_enchantment_template SET chance = 4.42 * 100 / (100 - 0.46) WHERE entry=1120;
UPDATE item_enchantment_template SET chance = 3.85 * 100 / (100 - 0.76) WHERE entry=1121;
UPDATE item_enchantment_template SET chance = 8.5 * 100 / (100 - 0.6) WHERE entry=1122;
UPDATE item_enchantment_template SET chance = 4.63 * 100 / (100 - 15.84) WHERE entry=1131;
UPDATE item_enchantment_template SET chance = 9.23 * 100 / (100 - 15.07) WHERE entry=1132;
UPDATE item_enchantment_template SET chance = 11.1 * 100 / (100 - 12.45) WHERE entry=1133;
UPDATE item_enchantment_template SET chance = 5.57 * 100 / (100 - 11.6) WHERE entry=1134;
UPDATE item_enchantment_template SET chance = 4.25 * 100 / (100 - 12.36) WHERE entry=1135;
UPDATE item_enchantment_template SET chance = 4.07 * 100 / (100 - 14.4) WHERE entry=1136;
UPDATE item_enchantment_template SET chance = 3.82 * 100 / (100 - 13.3) WHERE entry=1137;
UPDATE item_enchantment_template SET chance = 3.58 * 100 / (100 - 15.3) WHERE entry=1138;
UPDATE item_enchantment_template SET chance = 3.58 * 100 / (100 - 16.15) WHERE entry=1139;
UPDATE item_enchantment_template SET chance = 6.3 * 100 / (100 - 25.8) WHERE entry=1140;
UPDATE item_enchantment_template SET chance = 6 * 100 / (100 - 27.3) WHERE entry=1141;
UPDATE item_enchantment_template SET chance = 3.48 * 100 / (100 - 26.44) WHERE entry=1142;
UPDATE item_enchantment_template SET chance = 2.4 * 100 / (100 - 25.91) WHERE entry=1143;
UPDATE item_enchantment_template SET chance = 5.05 * 100 / (100 - 3) WHERE entry=1152;
UPDATE item_enchantment_template SET chance = 6.77 * 100 / (100 - 3.73) WHERE entry=1153;
UPDATE item_enchantment_template SET chance = 6.37 * 100 / (100 - 3.2) WHERE entry=1154;
UPDATE item_enchantment_template SET chance = 3.43 * 100 / (100 - 2.86) WHERE entry=1155;
UPDATE item_enchantment_template SET chance = 2.98 * 100 / (100 - 2.9) WHERE entry=1156;
UPDATE item_enchantment_template SET chance = 3.64 * 100 / (100 - 2.64) WHERE entry=1157;
UPDATE item_enchantment_template SET chance = 3.1 * 100 / (100 - 2.56) WHERE entry=1158;
UPDATE item_enchantment_template SET chance = 2.68 * 100 / (100 - 3.1) WHERE entry=1159;
UPDATE item_enchantment_template SET chance = 3 * 100 / (100 - 2.66) WHERE entry=1160;
UPDATE item_enchantment_template SET chance = 8.65 * 100 / (100 - 6.75) WHERE entry=1161;
UPDATE item_enchantment_template SET chance = 9.2 * 100 / (100 - 5.95) WHERE entry=1162;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 5.56) WHERE entry=1163;
UPDATE item_enchantment_template SET chance = 3.82 * 100 / (100 - 4.8) WHERE entry=1164;
UPDATE item_enchantment_template SET chance = 2.68 * 100 / (100 - 3.1) WHERE entry=1178;
UPDATE item_enchantment_template SET chance = 2.03 * 100 / (100 - 3.44) WHERE entry=1179;
UPDATE item_enchantment_template SET chance = 1.9 * 100 / (100 - 3.2) WHERE entry=1180;
UPDATE item_enchantment_template SET chance = 1.73 * 100 / (100 - 3.64) WHERE entry=1181;
UPDATE item_enchantment_template SET chance = 5.17 * 100 / (100 - 8.23) WHERE entry=1182;
UPDATE item_enchantment_template SET chance = 4.3 * 100 / (100 - 8) WHERE entry=1183;
UPDATE item_enchantment_template SET chance = 2.43 * 100 / (100 - 8) WHERE entry=1184;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 5.5) WHERE entry=1185;
UPDATE item_enchantment_template SET chance = 3.85 * 100 / (100 - 24.8) WHERE entry=1996;
UPDATE item_enchantment_template SET chance = 5.3 * 100 / (100 - 0.1) WHERE entry=1998;
UPDATE item_enchantment_template SET chance = 3.65 * 100 / (100 - 21.9) WHERE entry=2002;
UPDATE item_enchantment_template SET chance = 3.82 * 100 / (100 - 21.38) WHERE entry=2008;
UPDATE item_enchantment_template SET chance = 7.47 * 100 / (100 - 21.27) WHERE entry=2014;
UPDATE item_enchantment_template SET chance = 7.52 * 100 / (100 - 20.83) WHERE entry=2020;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 0.1) WHERE entry=2022;
UPDATE item_enchantment_template SET chance = 3.63 * 100 / (100 - 21.83) WHERE entry=2026;
UPDATE item_enchantment_template SET chance = 3.63 * 100 / (100 - 20.04) WHERE entry=2032;
UPDATE item_enchantment_template SET chance = 3.55 * 100 / (100 - 20.88) WHERE entry=2038;
UPDATE item_enchantment_template SET chance = 3.59 * 100 / (100 - 20.6) WHERE entry=2044;
UPDATE item_enchantment_template SET chance = 6.73 * 100 / (100 - 20.7) WHERE entry=2050;
UPDATE item_enchantment_template SET chance = 7.04 * 100 / (100 - 19.8) WHERE entry=2056;
UPDATE item_enchantment_template SET chance = 6.87 * 100 / (100 - 20.14) WHERE entry=2062;
UPDATE item_enchantment_template SET chance = 9.98 * 100 / (100 - 0.1) WHERE entry=2064;
UPDATE item_enchantment_template SET chance = 3.58 * 100 / (100 - 18.52) WHERE entry=2068;
UPDATE item_enchantment_template SET chance = 3.75 * 100 / (100 - 20.52) WHERE entry=2074;
UPDATE item_enchantment_template SET chance = 3.65 * 100 / (100 - 19.83) WHERE entry=2080;
UPDATE item_enchantment_template SET chance = 3.55 * 100 / (100 - 0.3) WHERE entry=2084;
UPDATE item_enchantment_template SET chance = 7.88 * 100 / (100 - 27.1) WHERE entry=2086;
UPDATE item_enchantment_template SET chance = 7.1 * 100 / (100 - 0.2) WHERE entry=2090;
UPDATE item_enchantment_template SET chance = 7.73 * 100 / (100 - 27.46) WHERE entry=2092;
UPDATE item_enchantment_template SET chance = 6.55 * 100 / (100 - 0.4) WHERE entry=2094;
UPDATE item_enchantment_template SET chance = 6.05 * 100 / (100 - 0.2) WHERE entry=2134;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 0.2) WHERE entry=3255;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 0.3) WHERE entry=3272;
UPDATE item_enchantment_template SET chance = 3.2 * 100 / (100 - 0.1) WHERE entry=3281;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 0.1) WHERE entry=3289;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 0.2) WHERE entry=3309;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 0.3) WHERE entry=3310;
UPDATE item_enchantment_template SET chance = 3.65 * 100 / (100 - 0.2) WHERE entry=3461;
UPDATE item_enchantment_template SET chance = 1.25 * 100 / (100 - 0.4) WHERE entry=3462;
UPDATE item_enchantment_template SET chance = 5.75 * 100 / (100 - 0.1) WHERE entry=3548;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 0.7) WHERE entry=5168;
UPDATE item_enchantment_template SET chance = 28.3 * 100 / (100 - 0.4) WHERE entry=5169;
UPDATE item_enchantment_template SET chance = 15.4 * 100 / (100 - 34.09) WHERE entry=5170;
UPDATE item_enchantment_template SET chance = 9.33 * 100 / (100 - 36.13) WHERE entry=5171;
UPDATE item_enchantment_template SET chance = 1.48 * 100 / (100 - 0.2) WHERE entry=5173;
UPDATE item_enchantment_template SET chance = 3.05 * 100 / (100 - 0.3) WHERE entry=5174;
UPDATE item_enchantment_template SET chance = 3.08 * 100 / (100 - 0.1) WHERE entry=5175;
UPDATE item_enchantment_template SET chance = 2.2 * 100 / (100 - 24.2) WHERE entry=5176;
UPDATE item_enchantment_template SET chance = 29.32 * 100 / (100 - 0.3) WHERE entry=5177;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 32.5) WHERE entry=5179;
UPDATE item_enchantment_template SET chance = 10.4 * 100 / (100 - 33.6) WHERE entry=5180;
UPDATE item_enchantment_template SET chance = 1.22 * 100 / (100 - 0.3) WHERE entry=5183;
UPDATE item_enchantment_template SET chance = 9.35 * 100 / (100 - 31.87) WHERE entry=5188;
UPDATE item_enchantment_template SET chance = 4.45 * 100 / (100 - 36.37) WHERE entry=5189;
UPDATE item_enchantment_template SET chance = 1.45 * 100 / (100 - 23.94) WHERE entry=5194;
UPDATE item_enchantment_template SET chance = 2.9 * 100 / (100 - 0.5) WHERE entry=5196;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 15.53) WHERE entry=5197;
UPDATE item_enchantment_template SET chance = 2.7 * 100 / (100 - 0.2) WHERE entry=5201;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 16.1) WHERE entry=5206;
UPDATE item_enchantment_template SET chance = 3.2 * 100 / (100 - 22) WHERE entry=5207;
UPDATE item_enchantment_template SET chance = 3.8 * 100 / (100 - 0.1) WHERE entry=5211;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 21.57) WHERE entry=5212;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 22.65) WHERE entry=5216;
UPDATE item_enchantment_template SET chance = 2.35 * 100 / (100 - 0.1) WHERE entry=5218;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 0.2) WHERE entry=5219;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 22.84) WHERE entry=5221;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 15.09) WHERE entry=5224;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 0.52) WHERE entry=5232;
UPDATE item_enchantment_template SET chance = 1.7 * 100 / (100 - 17.92) WHERE entry=5234;
UPDATE item_enchantment_template SET chance = 2.35 * 100 / (100 - 0.2) WHERE entry=5236;
UPDATE item_enchantment_template SET chance = 0.03 * 100 / (100 - 0.47) WHERE entry=5238;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 22.44) WHERE entry=5239;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 0.6) WHERE entry=5240;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 0.52) WHERE entry=5241;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 15.58) WHERE entry=5242;
UPDATE item_enchantment_template SET chance = 4.5 * 100 / (100 - 16.12) WHERE entry=5251;
UPDATE item_enchantment_template SET chance = 3.5 * 100 / (100 - 19.01) WHERE entry=5252;
UPDATE item_enchantment_template SET chance = 3.8 * 100 / (100 - 17.02) WHERE entry=5253;
UPDATE item_enchantment_template SET chance = 2.3 * 100 / (100 - 0.38) WHERE entry=5254;
UPDATE item_enchantment_template SET chance = 1.7 * 100 / (100 - 0.3) WHERE entry=5255;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 23.86) WHERE entry=5257;
UPDATE item_enchantment_template SET chance = 1.7 * 100 / (100 - 18.5) WHERE entry=5261;
UPDATE item_enchantment_template SET chance = 3.8 * 100 / (100 - 16.9) WHERE entry=5262;
UPDATE item_enchantment_template SET chance = 1.53 * 100 / (100 - 23.1) WHERE entry=5266;
UPDATE item_enchantment_template SET chance = 4.23 * 100 / (100 - 0.1) WHERE entry=5268;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 14.8) WHERE entry=5269;
UPDATE item_enchantment_template SET chance = 3.5 * 100 / (100 - 18.5) WHERE entry=5270;
UPDATE item_enchantment_template SET chance = 3.05 * 100 / (100 - 0.3) WHERE entry=5274;
UPDATE item_enchantment_template SET chance = 4.7 * 100 / (100 - 14.3) WHERE entry=5278;
UPDATE item_enchantment_template SET chance = 3.3 * 100 / (100 - 18.2) WHERE entry=5279;
UPDATE item_enchantment_template SET chance = 2.1 * 100 / (100 - 16.45) WHERE entry=5280;
UPDATE item_enchantment_template SET chance = 3.45 * 100 / (100 - 0.1) WHERE entry=5282;
UPDATE item_enchantment_template SET chance = 2.3 * 100 / (100 - 31.1) WHERE entry=5287;
UPDATE item_enchantment_template SET chance = 4.1 * 100 / (100 - 16.69) WHERE entry=5289;
UPDATE item_enchantment_template SET chance = 2.32 * 100 / (100 - 24.85) WHERE entry=5293;
UPDATE item_enchantment_template SET chance = 4.8 * 100 / (100 - 15.72) WHERE entry=5296;
UPDATE item_enchantment_template SET chance = 2.75 * 100 / (100 - 18.56) WHERE entry=5298;
UPDATE item_enchantment_template SET chance = 3.15 * 100 / (100 - 0.1) WHERE entry=5301;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 0.1) WHERE entry=5303;
UPDATE item_enchantment_template SET chance = 4.8 * 100 / (100 - 20) WHERE entry=5307;
UPDATE item_enchantment_template SET chance = 3.2 * 100 / (100 - 0.1) WHERE entry=5309;
UPDATE item_enchantment_template SET chance = 2.18 * 100 / (100 - 25.82) WHERE entry=5311;
UPDATE item_enchantment_template SET chance = 2.6 * 100 / (100 - 0.2) WHERE entry=5312;
UPDATE item_enchantment_template SET chance = 3 * 100 / (100 - 0.1) WHERE entry=5313;
UPDATE item_enchantment_template SET chance = 2.55 * 100 / (100 - 17.18) WHERE entry=5315;
UPDATE item_enchantment_template SET chance = 3.55 * 100 / (100 - 0.1) WHERE entry=5317;
UPDATE item_enchantment_template SET chance = 3.02 * 100 / (100 - 0.2) WHERE entry=5319;
UPDATE item_enchantment_template SET chance = 3.7 * 100 / (100 - 13.8) WHERE entry=5324;
UPDATE item_enchantment_template SET chance = 5.7 * 100 / (100 - 20.5) WHERE entry=5850;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 0.1) WHERE entry=5852;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 0.12) WHERE entry=5853;
UPDATE item_enchantment_template SET chance = 0.1 * 100 / (100 - 0.1) WHERE entry=5859;
UPDATE item_enchantment_template SET chance = 3.58 * 100 / (100 - 23.14) WHERE entry=6272;
UPDATE item_enchantment_template SET chance = 7.8 * 100 / (100 - 26.55) WHERE entry=6273;
UPDATE item_enchantment_template SET chance = 9.1 * 100 / (100 - 0.1) WHERE entry=6278;
UPDATE item_enchantment_template SET chance = 4.7 * 100 / (100 - 0.1) WHERE entry=6279;
DELETE FROM item_enchantment_template WHERE ench IN (1799, 1800, 1801, 1802, 1803, 1804, 1805, 1806, 1807, 1808, 1809, 1810, 1811, 1812, 1813, 1814, 1815, 1816, 1817, 1818, 1819, 1820, 1821, 1822, 1823, 1824, 1825, 1826, 1827, 1828, 1829, 1830, 1831, 1832, 1833, 1834, 1835, 1836, 1837, 1838, 1839, 1840, 1841, 1842, 1843, 1844, 1845, 1846, 1847, 1848, 1849, 1850, 1851, 1852, 1853, 1854, 1855, 1856, 1857, 1858, 1859, 1860, 1861, 1862, 1863, 1864, 1865, 1866, 1867, 1868, 1869, 1870, 1871, 1872, 1873, 1874, 1875, 1876, 1877, 1878, 1879, 1880, 1881, 1882, 1883, 1884, 1885, 1886, 1887, 1888, 1889, 1890, 1891, 1892, 1893, 1894, 1895, 1896, 1897, 1898, 1899, 1900, 1901, 1902, 1903, 1904, 1905, 1906, 1907, 1908, 1909, 1910, 1911, 1912, 1913, 1914, 1915, 1916, 1917, 1918, 1919, 1920, 1921, 1922, 1923, 1924, 1925, 1926, 1927, 1928, 1929, 1930, 1931, 1932, 1933, 1934, 1935, 1936, 1937, 1938, 1939, 1940, 1941, 1942, 1943, 1944, 1945, 1946, 1947, 1948, 1949, 1950, 1951, 1952, 1953, 1954, 1955, 1956, 1957, 1958, 1959, 1960, 1961, 1962, 1963, 1964, 1965, 1966, 1967, 1968, 1969, 1970, 1971, 1972, 1973, 1974, 1975, 1976, 1977, 1978, 1979, 1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025, 2026, 2027, 2028, 2029, 2030, 2031, 2032, 2033, 2034, 2035, 2036, 2037, 2038, 2039, 2040, 2041, 2042, 2043, 2044, 2045, 2046, 2047, 2048, 2049, 2050, 2051, 2052, 2053, 2054, 2055, 2056, 2057, 2058, 2059, 2060, 2061, 2062, 2063, 2064, 39, 40, 41, 42, 43, 44, 45, 46, 47, 52, 53, 54, 56, 57, 58, 59, 60, 63, 66, 67, 68, 69, 70, 71, 72, 73, 75, 81, 82, 83, 84, 85, 86, 87, 88, 90, 100, 101, 102, 103, 104, 105, 106, 107, 109, 120, 121, 122, 123, 124, 125, 126, 127, 129, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148) AND entry NOT IN (8652);
-- Pre 1.4 Green Lens (Clank)
delete from item_enchantment_template where entry=8652;
insert into item_enchantment_template value (8652, 341, 10);
insert into item_enchantment_template value (8652, 342, 10);
insert into item_enchantment_template value (8652, 392, 10);
insert into item_enchantment_template value (8652, 393, 10);
insert into item_enchantment_template value (8652, 798, 10);
insert into item_enchantment_template value (8652, 799, 10);
insert into item_enchantment_template value (8652, 881, 10);
insert into item_enchantment_template value (8652, 882, 10);
insert into item_enchantment_template value (8652, 1052, 10);
insert into item_enchantment_template value (8652, 1053, 10);

-- Molten Core Loot Table Fixes Pre-1.4
-- Golemagg
update creature_loot_template set ChanceOrQuestChance=30 where mincountOrRef=-326158;
-- Magmadar
update creature_loot_template set ChanceOrQuestChance=30 where mincountOrRef=-326152;
-- Shazzrah
delete from reference_loot_template where item=17077 and entry in (326586,326299,326276);
-- Majordomo
delete from gameobject_loot_template where item=18703 and entry=16719;
-- Ragnaros
update creature_loot_template set ChanceOrQuestChance=15 where mincountOrRef=-330001;
-- Onyxia
replace into item_template value (17067, 4, 0, "Ancient Cornerstone Grimoire", 29717, 4, 0, 1, 301810, 75452, 23, -1, -1, 76, 60, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 6, 11, 5, 15, 7, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17490, 0, 0, 0, 900000, 94, 60000, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, "", 0, 0, 0, 0, 0, 3, 7, 0, 0, 0, 0, 0, 0, 0, "", 65, 0, 0, 0, 0, 0, 1);
replace into reference_loot_template value (322538, 17067, 0, 3, 1, 1, 0);
update creature_loot_template set ChanceOrQuestChance=0 where mincountOrRef=-322539;
update creature_loot_template set ChanceOrQuestChance=25 where mincountOrRef=-322538;
 
-- Pre 1.4 Weapon speed fix
update item_template set delay=2700 where entry=13204;
update item_template set delay=2900 where entry=12400;
update item_template set delay=2300 where entry=12592;
update item_template set delay=3300 where entry=12969;
update item_template set delay=2300 where entry=13163;
update item_template set delay=2300 where entry=13348;
update item_template set delay=3400 where entry=13372;
update item_template set delay=2400 where entry=13380;
update item_template set delay=2800 where entry=13505;
update item_template set delay=1900 where entry=17069;
update item_template set delay=2500 where entry=17072;
update item_template set delay=1800 where entry=18044;

-- Thorium brotherhood pattern pre 1.4
delete from item_template where entry in (19206,19207,20039,20040,18945,18263,18265,19219,19220,19330,19331,19332,19333);

-- Pre1.4 STATS CHANGED: Shadowcraft Boots (ilevel 59 entry 16711).
UPDATE item_template SET `stat_value1`=21, `stat_type3`=0, `stat_value3`=0 WHERE entry=16711;

-- Vis'kag the Bloodletter
-- Source: http://web.archive.org/web/20050303064400/http://wow.allakhazam.com/dyn/items/wname7.html
UPDATE item_template SET RequiredLevel=58, dmg_min1=89, dmg_max1=167, delay=2800 WHERE entry=17075;

-- Snowblind Shoes: Azuregos loot added in 1.5
-- Source: http://wowwiki.wikia.com/Snowblind_Shoes
DELETE FROM item_template WHERE entry=19131;

UPDATE item_template SET bonding=1 WHERE entry IN (14512,14513,14514);

-- Pre-1.4 item_template Fixes
-- 2005-03-23 20:06:16 to 2006-06-27 04:03:58 (days delta 11412) on for example: http://wow.allakhazam.com/db/item.html?witem=18441
-- 2005-03-23 20:06:07 to 2005-08-24 02:07:40 (days delta 156) on for example: http://wow.allakhazam.com/db/item.html?witem=18440
-- 2005-02-07 00:23:15 to 2005-02-17 08:58:41 (days delta 10) on for example: http://wow.allakhazam.com/dyn/items/iname16.html
UPDATE item_template SET `stat_value1`=17, `stat_type2`=0, `stat_value2`=0, `armor`=115 WHERE entry=16342;

-- 2005-03-31 16:24:25 to 2006-03-30 19:19:31 (days delta 11314) on for example: http://www.thottbot.com/?i=17146
-- 2005-02-15 11:03:31 to 2005-03-10 08:25:19 (days delta 26) on for example: http://www.thottbot.com/?i=The%20Postmaster%27s%20Seal
UPDATE item_template SET `stat_value1`=15, `stat_type2`=3, `stat_value2`=6, `stat_value3`=14, `stat_type4`=6, `stat_value4`=6 WHERE entry=13391;

-- STATS CHANGED: Shadowcraft Boots (ilevel 59 entry 16711).
UPDATE item_template SET `stat_value1`=3, `stat_type3`=0, `stat_value3`=0 WHERE entry=16711;

-- T1 gear FIX STATS CHANGED: Felheart Horns (ilevel 66 entry 16808). 1/1 versions
UPDATE item_template SET `stat_value1`=23, `stat_value2`=16, `stat_value3`=20, `stat_type4`=3, `stat_value4`=5, `arcane_res`=3, `fire_res`=0, `shadow_res`=10 WHERE entry=16808;

-- T2 FIX STATS CHANGED: Legplates of Ten Storms (ilevel 76 entry 16946). 3/3 versions
-- 2005-02-22 02:38:41 to 2005-06-08 01:11:28 (days delta 110) on for example: http://wow.allakhazam.com/dyn/items/iname7.html
-- 2005-02-23 12:24:14 to 2005-05-26 05:47:02 (days delta 96) on for example: http://wow.allakhazam.com/db/item.html?witem=16946
-- 2005-02-07 02:36:28 to 2005-02-15 11:03:16 (days delta 8) on for example: http://wow.allakhazam.com/db/itemset.html?setid=216
UPDATE item_template SET `stat_value1`=12, `stat_value2`=33, `stat_value3`=15, `stat_type4`=4, `stat_value4`=16, `stat_type5`=3, `stat_value5`=8, `armor`=364, `fire_res`=0, `arcane_res`=6 WHERE entry=16946;

-- STATS CHANGED: Helmet of Ten Storms (ilevel 76 entry 16947). 2/3 versions
-- 2005-02-17 23:21:51 to 2005-05-07 20:56:35 (days delta 83) on for example: http://wow.allakhazam.com/db/item.html?witem=16947
-- 2005-01-16 02:23:48 to 2005-02-15 11:02:56 (days delta 30) on for example: http://wow.allakhazam.com/dyn/items/iname1.html
-- 2005-02-07 02:36:28 to 2005-02-07 02:36:28 (days delta 0) on for example: http://wow.allakhazam.com/db/itemset.html?setid=216
UPDATE item_template SET `stat_value1`=23, `stat_value2`=17, `stat_value3`=16, `armor`=338, `fire_res`=8, `frost_res`=0, `shadow_res`=0, `nature_res`=8 WHERE entry=16947;

-- Custom modifications:
-- Source: http://web.archive.org/web/20041013032425/http://wow.allakhazam.com/db/item.html?witem=12554
UPDATE item_template SET armor=88, spellid_1=25067, spelltrigger_1=1, spellcooldown_1=-1, spellcategorycooldown_1=-1 WHERE entry=12554;

-- Source: http://web.archive.org/web/20050206224450/http://wow.allakhazam.com/db/itemset.html?setid=124
UPDATE item_template SET stat_type1='4', stat_value1='15', stat_type2='3', stat_value2='14', stat_type3='6', stat_value3='14' WHERE entry='14623';
UPDATE item_template SET stat_type1='4', stat_value1='15', stat_type2='7', stat_value2='8', stat_type3='6', stat_value3='5' WHERE entry='14622';
UPDATE item_template SET stat_type1='4', stat_value1='15', stat_type2='7', stat_value2='8', stat_type3='3', stat_value3='5' WHERE entry='14620';
UPDATE item_template SET stat_type1='7', stat_value1='12', stat_type2='6', stat_value2='10', stat_type3='3', stat_value3='10' WHERE entry='14622';

DELETE FROM item_template WHERE entry IN (18252,18290,18292,18291,18260,18259,18265,18257,18264,17203,17204,18705,18704,18703,18646,18665,18422,18423,15410);
-- Disable Gurubashi Chest event pre-1.4
update game_event set start_time="2016-08-04 03:00:00" where entry=16;
update game_event set start_time="2016-08-04 06:00:00" where entry=38;
update game_event set start_time="2016-08-04 05:55:00" where entry=39;

-- Stratholme loot table pre-1.4 FIX
-- Baroness Anastari
update creature_loot_template set ChanceOrQuestChance=0 where item=323242;
replace into reference_loot_template value (323241, 13534, 0, 1, 1, 1, 0);
replace into reference_loot_template value (323241, 16704, 0, 1, 1, 1, 0);
-- Nerub'enkan
update creature_loot_template set ChanceOrQuestChance=0 where item=323244;
replace into reference_loot_template value (323243, 13529, 0, 1, 1, 1, 0);
replace into reference_loot_template value (323243, 16675, 0, 1, 1, 1, 0);
-- Maleki the Pallid
update creature_loot_template set ChanceOrQuestChance=0 where item=323246;
replace into reference_loot_template value (323245, 13524, 0, 1, 1, 1, 0);
replace into reference_loot_template value (323245, 16691, 0, 1, 1, 1, 0);
-- Magistrate Barthilas
update creature_loot_template set item=330068,mincountOrRef=-330068 where entry=10435 and item=323240;
replace into reference_loot_template value (330068, 13376, 10, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 8283, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 8289, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 8290, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 8296, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 8300, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 8307, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 8308, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 8309, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 8310, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 10105, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 10136, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 10137, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 10140, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 10144, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 10146, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 10147, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 10149, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 10154, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 10155, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 10156, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 10161, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 10210, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 10217, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 10219, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 10226, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 10228, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 10230, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 10249, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 10256, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 10258, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 10267, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 10275, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 10363, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 10373, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 10376, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 10379, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 10380, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 10383, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 10387, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 10391, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 11979, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 12016, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 12046, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 12057, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 14303, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 14306, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 14308, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 14312, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 14317, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 14323, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 14324, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 14325, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 14330, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 14337, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 14458, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 14465, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 14684, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 14688, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 14863, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 14865, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 14868, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 14935, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 14936, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 14966, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 14973, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 14976, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 14977, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 15189, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 15192, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 15194, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 15239, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 15266, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 15278, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 15282, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 15288, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 15325, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 15430, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 15433, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 15434, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 15436, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 15437, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 15660, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 15664, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 15665, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 15667, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 15670, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 15672, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 15674, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 15676, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 15677, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 15679, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 15683, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 15931, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 15943, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 15986, 0, 1, 1, 1, 0);
replace into reference_loot_template value (330068, 15987, 0, 1, 1, 1, 0);

-- Remove recipes that teach how to craft inexistant items
-- Recipes to delete :
delete from item_template where spellid_1 in (21164,22760,22798,22933,23007,23089,23091,23093,23094,23400,23490,23491,23630,23631,23634,23635,23640,23641,23651,23654,23655,23656,23657,23668,23669,23670,23671,23672,23673,23711,23712,23713,23714,23715,23716,23717,23718,24094,24095,24096,24126,24127,24128,24129,24130,24142,24143,24144,24145,24146,24147,24358,24359,24400,24656,24657,24704,24855,24856,24859,24860,24861,24862,24908,24909,24911,24915,24916,24917,24941,26280,26411,26413,27591,27592,27593,27594,27595,27596,27833,27834,27835,28211,28212,28213,28214,28215,28228,28229,28230,28231,28232,28233,28245,28248,28249,28251,28252,28253,28254,28255,28256,28257,28258,28259,28260,28261,28262,28263,28464,28465,28466,28475,28476,28477,28483,28484,28485);

-- Pre1.4 MC Loot Table
-- Garr
update creature_loot_template set ChanceOrQuestChance=30 where mincountOrRef=-326264;
-- Ragnaros
update creature_loot_template set maxcount=1,chanceorquestchance=100 where mincountOrRef=-330001;
INSERT IGNORE INTO item_template SELECT * FROM item_template_112 WHERE entry in (17063,17076,17102,17104,17106,17107);
  
-- Onyxia loot table
update creature_loot_template set ChanceOrQuestChance=100 where mincountOrRef=-322538 and entry=10184;
 
-- Zul'farrak pre 1.4 fix
update creature_loot_template set ChanceOrQuestChance=0 where mincountOrRef=-318124;
replace into creature_loot_template value (7271,319573,100,4,-319573,1,0);

-- Remove some class spell books
DELETE FROM item_template WHERE entry IN (22890,22891,24102,24101,23320);

-- Cloth turning NPC (reput ... => mount)
delete from game_event where entry=159;
replace into game_event value (159, "2025-03-30 00:00:00", "2030-03-30 00:00:00", 1, 2, 0, "DM Release : Cloth turning NPC", 0);
delete from game_event_creature where event=159;
replace into game_event_creature value (79821,159);
replace into game_event_creature value (1819,159);
replace into game_event_creature value (37,159);
replace into game_event_creature value (46559,159);
replace into game_event_creature value (3421,159);
replace into game_event_creature value (3422,159);
replace into game_event_creature value (24867,159);
replace into game_event_creature value (31903,159);

-- Onyxia head removed
delete from item_template where entry in (18422,18423);

-- Molten Core Loot Tables (Magmadar)
delete from reference_loot_template where entry = 326150 and item in (16835, 16867, 16847, 16855);
update reference_loot_template set condition_id = 0 where entry = 326150 and item in (16814, 16810, 16796, 16822);
delete from reference_loot_template
where entry = 326151 and item in (16814, 16810, 16796, 16822);
update reference_loot_template set condition_id = 0 where entry = 326151 and item in (16835, 16867, 16847);
replace into reference_loot_template values (326151, 16855, 0, 3, 1, 1, 3);

-- Remove unused reference templates
delete from creature_loot_template where entry = 11982 and item = 330009;
delete from creature_loot_template where entry = 11982 and item = 330010;
delete from reference_loot_template where entry = 330009;
delete from reference_loot_template
where entry = 330010;

-- Garr Loot Tables
delete from reference_loot_template
where entry = 326262 and item in (16813, 16795, 16808, 16821);
update reference_loot_template set condition_id = 0 where entry = 326262 and item != 16854;
replace into reference_loot_template values (326262, 16842, 0, 2, 1, 1, 2);
delete from reference_loot_template where entry = 326263 and item in (16866, 16834, 16846, 16854);
update reference_loot_template set condition_id = 0 where entry = 326263;

-- Clean-up
delete from creature_loot_template where entry = 12057 and item = 330070;
delete from creature_loot_template where entry = 12057 and item = 330071;
delete from reference_loot_template where entry = 330070;
delete from reference_loot_template where entry = 330071;

-- Pre 1.6-BWL Access Fix
update creature_loot_template set ChanceOrQuestChance=0 where item=18987 and entry=9046;
update creature set spawntimesecs=108000 where id=9046;
update creature_loot_template set ChanceOrQuestChance=100 where item=330067 and entry=9046;

-- Thunderfury bindings
DELETE FROM creature_loot_template WHERE item IN (18563, 18564);

DELETE FROM quest_template WHERE entry IN (
19212  -- http://wowwiki.wikia.com/Plans:_Nightfall
);

-- Darkmoon faire quests
DELETE FROM creature_involvedrelation WHERE quest IN (
7928, -- http://wowwiki.wikia.com/wiki/Quest:Darkmoon_Warlords_Deck
7927, -- http://wowwiki.wikia.com/wiki/Quest:Darkmoon_Portals_Deck
7929, -- http://wowwiki.wikia.com/wiki/Quest:Darkmoon_Elementals_Deck
7907, -- http://wowwiki.wikia.com/wiki/Quest:Darkmoon_Beast_Deck
7935, -- 10 Tickets - Last Month's Mutton
7932, -- 12 Tickets - Lesser Darkmoon Prize
7981, -- 1200 Tickets - Amulet of the Darkmoon
7940, -- 1200 Tickets - Orb of the Darkmoon
7933, -- 40 Tickets - Greater Darkmoon Prize
7930, -- 5 Tickets - Darkmoon Flower
7931, -- 5 Tickets - Minor Darkmoon Prize
7934, -- 50 Tickets - Darkmoon Storage Box
7936, -- 50 Tickets - Last Year's Mutton
7885, -- Armor Kits
7892, -- Big Black Mace
7881, -- Carnival Boots
7882, -- Carnival Jerkins
7889, -- Coarse Weightstone
7894, -- Copper Modulator
7884, -- Crocolisk Boy and the Bearded Murloc
7903, -- Evil Bat Eyes
8222, -- Glowing Scorpid Blood
7896, -- Green Fireworks
7891, -- Green Iron Bracers
7890, -- Heavy Grinding Stone
7897, -- Mechanical Repair Kits
7941, -- More Armor Kits
7943, -- More Bat Eyes
7939, -- More Dense Grinding Stones
8223, -- More Glowing Scorpid Blood
7942, -- More Thorium Widgets
7893, -- Rituals of Strength
7899, -- Small Furry Paws
7901, -- Soft Bushy Tails
7946, -- Spawn of Jubjub
7883, -- The World's Largest Gnome!
7898, -- Thorium Widget
7900, -- Torn Bear Pelts
7902, -- Vibrant Plumes
7895, -- Whirring Bronze Gizmo
7937, -- Your Fortune Awaits You...
7938, -- Your Fortune Awaits You...
7944, -- Your Fortune Awaits You...
7945 -- Your Fortune Awaits You...
);

DELETE FROM creature_questrelation WHERE quest IN (
7928, -- http://wowwiki.wikia.com/wiki/Quest:Darkmoon_Warlords_Deck
7927, -- http://wowwiki.wikia.com/wiki/Quest:Darkmoon_Portals_Deck
7929, -- http://wowwiki.wikia.com/wiki/Quest:Darkmoon_Elementals_Deck
7907, -- http://wowwiki.wikia.com/wiki/Quest:Darkmoon_Beast_Deck
7935, -- 10 Tickets - Last Month's Mutton
7932, -- 12 Tickets - Lesser Darkmoon Prize
7981, -- 1200 Tickets - Amulet of the Darkmoon
7940, -- 1200 Tickets - Orb of the Darkmoon
7933, -- 40 Tickets - Greater Darkmoon Prize
7930, -- 5 Tickets - Darkmoon Flower
7931, -- 5 Tickets - Minor Darkmoon Prize
7934, -- 50 Tickets - Darkmoon Storage Box
7936, -- 50 Tickets - Last Year's Mutton
7885, -- Armor Kits
7892, -- Big Black Mace
7881, -- Carnival Boots
7882, -- Carnival Jerkins
7889, -- Coarse Weightstone
7894, -- Copper Modulator
7884, -- Crocolisk Boy and the Bearded Murloc
7903, -- Evil Bat Eyes
8222, -- Glowing Scorpid Blood
7896, -- Green Fireworks
7891, -- Green Iron Bracers
7890, -- Heavy Grinding Stone
7897, -- Mechanical Repair Kits
7941, -- More Armor Kits
7943, -- More Bat Eyes
7939, -- More Dense Grinding Stones
8223, -- More Glowing Scorpid Blood
7942, -- More Thorium Widgets
7893, -- Rituals of Strength
7899, -- Small Furry Paws
7901, -- Soft Bushy Tails
7946, -- Spawn of Jubjub
7883, -- The World's Largest Gnome!
7898, -- Thorium Widget
7900, -- Torn Bear Pelts
7902, -- Vibrant Plumes
7895, -- Whirring Bronze Gizmo
7937, -- Your Fortune Awaits You...
7938, -- Your Fortune Awaits You...
7944, -- Your Fortune Awaits You...
7945 -- Your Fortune Awaits You...
);

-- 1.6 Items (recipes, patterns, plans)
DELETE FROM item_template WHERE entry IN (19447, 19446, 19442, 19216, 19217, 19328, 19329, 19203, 19205, 19204, 19202, 19215, 19327, 19326, 19218, 19445, 22392, 19449, 19448, 19444, 19331, 19332, 19220, 19219, 19330, 19333, 19208, 19211, 19209, 19207, 19206, 19210, 19212, 20761);

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

-- Fix Alterac Valley Kazzak quest: non existant reward removed.
UPDATE quest_template SET RewChoiceItemId4 = 0 WHERE entry IN (7202, 7181);

-- Twilight Cultist Ring of Lordship
DELETE FROM item_template WHERE entry=20451;

-- Delete 1.8 Specific Recipes
DELETE FROM item_template WHERE entry IN (20382, 20509, 20511, 20508, 20507, 20510, 20506);

-- Sunken Temple Level 50 Quests 
DELETE FROM quest_template WHERE entry IN (8418, 8413, 8422, 8425);

-- Disable not in the game recipe + resulting food spell.
INSERT INTO spell_disabled SET entry=24800;
INSERT INTO spell_disabled SET entry=24801;
-- Disable loot:
update creature_loot_template set ChanceOrQuestChance=0 where item=20424;

-- Pre-1.4 Old Mounts!
-- Tauren
delete from npc_vendor where item in (18793,18794,18795);
replace into npc_vendor value (3685,15293,0,0);
replace into npc_vendor value (3685,15292,0,0);
-- Orc
delete from npc_vendor where item in (18796,18797,18798);
replace into npc_vendor value (3362,12330,0,0);
replace into npc_vendor value (3362,12351,0,0);
-- Troll
delete from npc_vendor where item in (18788,18789,18790);
replace into npc_vendor value (7952,8586,0,0);
replace into npc_vendor value (7952,13317,0,0);
-- Undead
delete from npc_vendor where item in (18791);
-- Human 4885 2357 1460
delete from npc_vendor where item in (18776,18777,18778);
replace into npc_vendor value (384,12353,0,0);
replace into npc_vendor value (4885,12353,0,0);
replace into npc_vendor value (2357,12353,0,0);
replace into npc_vendor value (1460,12353,0,0);
replace into npc_vendor value (384,12354,0,0);
replace into npc_vendor value (4885,12354,0,0);
replace into npc_vendor value (2357,12354,0,0);
replace into npc_vendor value (1460,12354,0,0);
-- Dwarf
delete from npc_vendor where item in (18785,18786,18787);
replace into npc_vendor value (1261,13328,0,0);
replace into npc_vendor value (1261,13329,0,0);
-- Elf
delete from npc_vendor where item in (18766,18767,18902);
replace into npc_vendor value (4730,12302,0,0);
replace into npc_vendor value (4730,12303,0,0);
-- Gnome
delete from npc_vendor where item in (18772,18773,18774);
replace into npc_vendor value (7955,13326,0,0);
replace into npc_vendor value (7955,13327,0,0);
-- Stables
-- Human
update creature set modelid=0 where id in (14561,14560,14559);
update creature set id=306 where id=14561;
update creature set id=305 where id=14560;
delete from creature where id=14559;
-- Dwarf
update creature set modelid=0 where id in (14546,14548,14547);
update creature set id=4780 where id=14546;
update creature set id=4778 where id=14548; 	
delete from creature where id=14547;
-- Elf
update creature set modelid=0 where id in (14556,14555,14602);
update creature set id=10322 where id=14556;
update creature set id=7322 where id=14555;
delete from creature where id=14602;
-- Gnome
update creature set modelid=0 where id in (14551,14552,14553);
update creature set id=11150 where id=14551;
update creature set id=10179 where id=14552;
delete from creature where id=14553;
-- Tauren
update creature set modelid=0 where id in (14542,14549,14550);
update creature set id=12148 where id=14542;
update creature set id=12151 where id=14549;
delete from creature where id=14550;
-- Orc
update creature set modelid=0 where id in (14540,14539,14541);
update creature set id=4270 where id=14540;
update creature set id=359 where id=14539;
delete from creature where id=14541;
-- Troll
update creature set modelid=0 where id in (14545,14543,14544);
update creature set id=7704 where id=14545;
update creature set id=7706 where id=14543;
delete from creature where id=14544;
-- Undead
delete from creature where id=14558;
 -- Pre 1.4 Mount FIX
update creature_template set modelid_1=9695 where entry=10322;
update item_template set name="Reins of the Ancient Frostsaber" where entry=12302;

-- Delete Post-1.4 mounts
DELETE FROM npc_vendor WHERE item IN (
18766,
18767,
18772,
18773,
18774,
18776,
18777,
18778,
18785,
18786,
18787,
18788,
18789,
18790,
18791,
18793,
18794,
18795,
18796,
18797,
18798,
18902,
19029
);

-- LBRS Gems Pre-1.11
update creature_loot_template set ChanceOrQuestChance=1 where item=12219;
update creature_loot_template set ChanceOrQuestChance=20 where item=12335;
update creature_loot_template set ChanceOrQuestChance=15 where item=12336;
update creature_loot_template set ChanceOrQuestChance=25 where item=12337;

-- Argent Dawn @ Pre-1.11
delete from game_event where entry=155;
insert into game_event value (155, "2025-03-30 00:00:00", "2030-03-30 00:00:00", 1, 2, 0, "Argent dawn @ 1.11", 0);
delete from game_event_creature where event=155;
insert into game_event_creature value (54765,155);
insert into game_event_creature value (54163,155);
insert into game_event_creature value (54120,155);
insert into game_event_creature value (54190,155);
insert into game_event_creature value (54807,155);
insert into game_event_creature value (54766,155);
insert into game_event_creature value (54192,155);
insert into game_event_creature value (54193,155);
insert into game_event_creature value (54805,155);
insert into game_event_creature value (54768,155);
insert into game_event_creature value (54164,155);
insert into game_event_creature value (54186,155);
insert into game_event_creature value (54145,155);
insert into game_event_creature value (52674,155);
insert into game_event_creature value (52675,155);
insert into game_event_creature value (52676,155);
-- Argent Dawn item
delete from conditions where condition_entry=70;
insert into conditions value (70,12,155,0);
update creature_loot_template set condition_id=70 where item in (22527,22529,22528,22525,22526);

-- Old PvP set Patch Vendor Pre-1.11
-- Delete 1.11 PvP Items
delete from item_template where entry in (22843,22852,22855,22856,22857,22858,22859,22860,22862,22863,22864,22865,22867,22868,22869,22870,22872,22873,22874,22875,22876,22877,22878,22879,22880,22881,22882,22883,22884,22885,22886,22887,23243,23244,23251,23252,23253,23254,23255,23256,23257,23258,23259,23260,23261,23262,23263,23264,23272,23273,23274,23275,23276,23277,23278,23279,23280,23281,23282,23283,23284,23285,23286,23287,23288,23289,23290,23291,23292,23293,23294,23295,23296,23297,23298,23299,23300,23301,23302,23303,23304,23305,23306,23307,23308,23309,23310,23311,23312,23313,23314,23315,23316,23317,23318,23319,23451,23452,23453,23454,23455,23456,23464,23465,23466,23467,23468,23469);
-- Vendor Pre 1.11 PvP items
delete from npc_vendor where entry in (12785,12795);
insert into npc_vendor value (12785, 16369, 0, 0);
insert into npc_vendor value (12785, 16391, 0, 0);
insert into npc_vendor value (12785, 16392, 0, 0);
insert into npc_vendor value (12785, 16393, 0, 0);
insert into npc_vendor value (12785, 16396, 0, 0);
insert into npc_vendor value (12785, 16397, 0, 0);
insert into npc_vendor value (12785, 16401, 0, 0);
insert into npc_vendor value (12785, 16403, 0, 0);
insert into npc_vendor value (12785, 16405, 0, 0);
insert into npc_vendor value (12785, 16406, 0, 0);
insert into npc_vendor value (12785, 16409, 0, 0);
insert into npc_vendor value (12785, 16410, 0, 0);
insert into npc_vendor value (12785, 16413, 0, 0);
insert into npc_vendor value (12785, 16414, 0, 0);
insert into npc_vendor value (12785, 16415, 0, 0);
insert into npc_vendor value (12785, 16416, 0, 0);
insert into npc_vendor value (12785, 16417, 0, 0);
insert into npc_vendor value (12785, 16418, 0, 0);
insert into npc_vendor value (12785, 16419, 0, 0);
insert into npc_vendor value (12785, 16420, 0, 0);
insert into npc_vendor value (12785, 16421, 0, 0);
insert into npc_vendor value (12785, 16422, 0, 0);
insert into npc_vendor value (12785, 16423, 0, 0);
insert into npc_vendor value (12785, 16424, 0, 0);
insert into npc_vendor value (12785, 16425, 0, 0);
insert into npc_vendor value (12785, 16426, 0, 0);
insert into npc_vendor value (12785, 16427, 0, 0);
insert into npc_vendor value (12785, 16428, 0, 0);
insert into npc_vendor value (12785, 16429, 0, 0);
insert into npc_vendor value (12785, 16430, 0, 0);
insert into npc_vendor value (12785, 16431, 0, 0);
insert into npc_vendor value (12785, 16432, 0, 0);
insert into npc_vendor value (12785, 16433, 0, 0);
insert into npc_vendor value (12785, 16434, 0, 0);
insert into npc_vendor value (12785, 16435, 0, 0);
insert into npc_vendor value (12785, 16436, 0, 0);
insert into npc_vendor value (12785, 16437, 0, 0);
insert into npc_vendor value (12785, 16440, 0, 0);
insert into npc_vendor value (12785, 16441, 0, 0);
insert into npc_vendor value (12785, 16442, 0, 0);
insert into npc_vendor value (12785, 16443, 0, 0);
insert into npc_vendor value (12785, 16444, 0, 0);
insert into npc_vendor value (12785, 16446, 0, 0);
insert into npc_vendor value (12785, 16448, 0, 0);
insert into npc_vendor value (12785, 16449, 0, 0);
insert into npc_vendor value (12785, 16450, 0, 0);
insert into npc_vendor value (12785, 16451, 0, 0);
insert into npc_vendor value (12785, 16452, 0, 0);
insert into npc_vendor value (12785, 16453, 0, 0);
insert into npc_vendor value (12785, 16454, 0, 0);
insert into npc_vendor value (12785, 16455, 0, 0);
insert into npc_vendor value (12785, 16456, 0, 0);
insert into npc_vendor value (12785, 16457, 0, 0);
insert into npc_vendor value (12785, 16459, 0, 0);
insert into npc_vendor value (12785, 16462, 0, 0);
insert into npc_vendor value (12785, 16463, 0, 0);
insert into npc_vendor value (12785, 16465, 0, 0);
insert into npc_vendor value (12785, 16466, 0, 0);
insert into npc_vendor value (12785, 16467, 0, 0);
insert into npc_vendor value (12785, 16468, 0, 0);
insert into npc_vendor value (12785, 16471, 0, 0);
insert into npc_vendor value (12785, 16472, 0, 0);
insert into npc_vendor value (12785, 16473, 0, 0);
insert into npc_vendor value (12785, 16474, 0, 0);
insert into npc_vendor value (12785, 16475, 0, 0);
insert into npc_vendor value (12785, 16476, 0, 0);
insert into npc_vendor value (12785, 16477, 0, 0);
insert into npc_vendor value (12785, 16478, 0, 0);
insert into npc_vendor value (12785, 16479, 0, 0);
insert into npc_vendor value (12785, 16480, 0, 0);
insert into npc_vendor value (12785, 16483, 0, 0);
insert into npc_vendor value (12785, 16484, 0, 0);
insert into npc_vendor value (12785, 17562, 0, 0);
insert into npc_vendor value (12785, 17564, 0, 0);
insert into npc_vendor value (12785, 17566, 0, 0);
insert into npc_vendor value (12785, 17567, 0, 0);
insert into npc_vendor value (12785, 17568, 0, 0);
insert into npc_vendor value (12785, 17569, 0, 0);
insert into npc_vendor value (12785, 17578, 0, 0);
insert into npc_vendor value (12785, 17579, 0, 0);
insert into npc_vendor value (12785, 17580, 0, 0);
insert into npc_vendor value (12785, 17581, 0, 0);
insert into npc_vendor value (12785, 17583, 0, 0);
insert into npc_vendor value (12785, 17584, 0, 0);
insert into npc_vendor value (12785, 17594, 0, 0);
insert into npc_vendor value (12785, 17596, 0, 0);
insert into npc_vendor value (12785, 17598, 0, 0);
insert into npc_vendor value (12785, 17599, 0, 0);
insert into npc_vendor value (12785, 17600, 0, 0);
insert into npc_vendor value (12785, 17601, 0, 0);
insert into npc_vendor value (12785, 17602, 0, 0);
insert into npc_vendor value (12785, 17603, 0, 0);
insert into npc_vendor value (12785, 17604, 0, 0);
insert into npc_vendor value (12785, 17605, 0, 0);
insert into npc_vendor value (12785, 17607, 0, 0);
insert into npc_vendor value (12785, 17608, 0, 0);
insert into npc_vendor value (12795, 16485, 0, 0);
insert into npc_vendor value (12795, 16487, 0, 0);
insert into npc_vendor value (12795, 16489, 0, 0);
insert into npc_vendor value (12795, 16490, 0, 0);
insert into npc_vendor value (12795, 16491, 0, 0);
insert into npc_vendor value (12795, 16492, 0, 0);
insert into npc_vendor value (12795, 16494, 0, 0);
insert into npc_vendor value (12795, 16496, 0, 0);
insert into npc_vendor value (12795, 16498, 0, 0);
insert into npc_vendor value (12795, 16499, 0, 0);
insert into npc_vendor value (12795, 16501, 0, 0);
insert into npc_vendor value (12795, 16502, 0, 0);
insert into npc_vendor value (12795, 16503, 0, 0);
insert into npc_vendor value (12795, 16504, 0, 0);
insert into npc_vendor value (12795, 16505, 0, 0);
insert into npc_vendor value (12795, 16506, 0, 0);
insert into npc_vendor value (12795, 16507, 0, 0);
insert into npc_vendor value (12795, 16508, 0, 0);
insert into npc_vendor value (12795, 16509, 0, 0);
insert into npc_vendor value (12795, 16510, 0, 0);
insert into npc_vendor value (12795, 16513, 0, 0);
insert into npc_vendor value (12795, 16514, 0, 0);
insert into npc_vendor value (12795, 16515, 0, 0);
insert into npc_vendor value (12795, 16516, 0, 0);
insert into npc_vendor value (12795, 16518, 0, 0);
insert into npc_vendor value (12795, 16519, 0, 0);
insert into npc_vendor value (12795, 16521, 0, 0);
insert into npc_vendor value (12795, 16522, 0, 0);
insert into npc_vendor value (12795, 16523, 0, 0);
insert into npc_vendor value (12795, 16524, 0, 0);
insert into npc_vendor value (12795, 16525, 0, 0);
insert into npc_vendor value (12795, 16526, 0, 0);
insert into npc_vendor value (12795, 16527, 0, 0);
insert into npc_vendor value (12795, 16528, 0, 0);
insert into npc_vendor value (12795, 16530, 0, 0);
insert into npc_vendor value (12795, 16531, 0, 0);
insert into npc_vendor value (12795, 16533, 0, 0);
insert into npc_vendor value (12795, 16534, 0, 0);
insert into npc_vendor value (12795, 16535, 0, 0);
insert into npc_vendor value (12795, 16536, 0, 0);
insert into npc_vendor value (12795, 16539, 0, 0);
insert into npc_vendor value (12795, 16540, 0, 0);
insert into npc_vendor value (12795, 16541, 0, 0);
insert into npc_vendor value (12795, 16542, 0, 0);
insert into npc_vendor value (12795, 16543, 0, 0);
insert into npc_vendor value (12795, 16544, 0, 0);
insert into npc_vendor value (12795, 16545, 0, 0);
insert into npc_vendor value (12795, 16548, 0, 0);
insert into npc_vendor value (12795, 16549, 0, 0);
insert into npc_vendor value (12795, 16550, 0, 0);
insert into npc_vendor value (12795, 16551, 0, 0);
insert into npc_vendor value (12795, 16552, 0, 0);
insert into npc_vendor value (12795, 16554, 0, 0);
insert into npc_vendor value (12795, 16555, 0, 0);
insert into npc_vendor value (12795, 16558, 0, 0);
insert into npc_vendor value (12795, 16560, 0, 0);
insert into npc_vendor value (12795, 16561, 0, 0);
insert into npc_vendor value (12795, 16562, 0, 0);
insert into npc_vendor value (12795, 16563, 0, 0);
insert into npc_vendor value (12795, 16564, 0, 0);
insert into npc_vendor value (12795, 16565, 0, 0);
insert into npc_vendor value (12795, 16566, 0, 0);
insert into npc_vendor value (12795, 16567, 0, 0);
insert into npc_vendor value (12795, 16568, 0, 0);
insert into npc_vendor value (12795, 16569, 0, 0);
insert into npc_vendor value (12795, 16571, 0, 0);
insert into npc_vendor value (12795, 16573, 0, 0);
insert into npc_vendor value (12795, 16574, 0, 0);
insert into npc_vendor value (12795, 16577, 0, 0);
insert into npc_vendor value (12795, 16578, 0, 0);
insert into npc_vendor value (12795, 16579, 0, 0);
insert into npc_vendor value (12795, 16580, 0, 0);
insert into npc_vendor value (12795, 17570, 0, 0);
insert into npc_vendor value (12795, 17571, 0, 0);
insert into npc_vendor value (12795, 17572, 0, 0);
insert into npc_vendor value (12795, 17573, 0, 0);
insert into npc_vendor value (12795, 17576, 0, 0);
insert into npc_vendor value (12795, 17577, 0, 0);
insert into npc_vendor value (12795, 17586, 0, 0);
insert into npc_vendor value (12795, 17588, 0, 0);
insert into npc_vendor value (12795, 17590, 0, 0);
insert into npc_vendor value (12795, 17591, 0, 0);
insert into npc_vendor value (12795, 17592, 0, 0);
insert into npc_vendor value (12795, 17593, 0, 0);
insert into npc_vendor value (12795, 17610, 0, 0);
insert into npc_vendor value (12795, 17611, 0, 0);
insert into npc_vendor value (12795, 17612, 0, 0);
insert into npc_vendor value (12795, 17613, 0, 0);
insert into npc_vendor value (12795, 17616, 0, 0);
insert into npc_vendor value (12795, 17617, 0, 0);
insert into npc_vendor value (12795, 17618, 0, 0);
insert into npc_vendor value (12795, 17620, 0, 0);
insert into npc_vendor value (12795, 17622, 0, 0);
insert into npc_vendor value (12795, 17623, 0, 0);
insert into npc_vendor value (12795, 17624, 0, 0);
insert into npc_vendor value (12795, 17625, 0, 0);

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
DELETE FROM item_template WHERE entry=22637;
UPDATE quest_template SET ReqItemId1 = 0, ReqItemCount1 = 0 WHERE entry IN (8184, 8185, 8186, 8187, 8188, 8189, 8190, 8191, 8192);

-- "Bonereaver's Edge" Stats Has Been Corrected
UPDATE `item_template` SET `stat_type1` = 0, `stat_value1` = 0, `stat_type2` = 0, `stat_value2` = 0, `stat_type3` = 0, `stat_value3` = 0, `stat_type4` = 0, `stat_value4` = 0, `stat_type5` = 0, `stat_value5` = 0, `stat_type6` = 0, `stat_value6` = 0, `stat_type7` = 0, `stat_value7` = 0, `stat_type8` = 0, `stat_value8` = 0, `stat_type9` = 0, `stat_value9` = 0, `stat_type10` = 0, `stat_value10` = 0, `dmg_min1` = 206, `dmg_max1` = 310, `dmg_type1` = 0, `dmg_min2` = 0, `dmg_max2` = 0, `dmg_type2` = 0, `dmg_min3` = 0, `dmg_max3` = 0, `dmg_type3` = 0, `dmg_min4` = 0, `dmg_max4` = 0, `dmg_type4` = 0, `dmg_min5` = 0, `dmg_max5` = 0, `dmg_type5` = 0, `armor` = 0, `holy_res` = 0, `fire_res` = 0, `nature_res` = 0, `frost_res` = 0, `shadow_res` = 0, `arcane_res` = 0, `spellid_1` = 21153, `spelltrigger_1` = 2, `spellcharges_1` = 0, `spellppmRate_1` = 3, `spellcooldown_1` = -1, `spellcategory_1` = 0, `spellcategorycooldown_1` = -1, `spellid_2` = 7597, `spelltrigger_2` = 1, `spellcharges_2` = 0, `spellppmRate_2` = 0, `spellcooldown_2` = -1, `spellcategory_2` = 0, `spellcategorycooldown_2` = -1, `spellid_3` = 0, `spelltrigger_3` = 0, `spellcharges_3` = 0, `spellppmRate_3` = 0, `spellcooldown_3` = -1, `spellcategory_3` = 0, `spellcategorycooldown_3` = -1, `spellid_4` = 0, `spelltrigger_4` = 0, `spellcharges_4` = 0, `spellppmRate_4` = 0, `spellcooldown_4` = -1, `spellcategory_4` = 0, `spellcategorycooldown_4` = -1, `spellid_5` = 0, `spelltrigger_5` = 0, `spellcharges_5` = 0, `spellppmRate_5` = 0, `spellcooldown_5` = 0, `spellcategory_5` = 0, `spellcategorycooldown_5` = 0 WHERE `entry` = 17076;
