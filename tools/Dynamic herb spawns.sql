UPDATE `gameobject`
   SET `spawnFlags` = `spawnFlags` | 0x08 -- SPAWN_FLAG_DYNAMIC_RESPAWN_TIME
 WHERE `map` != 30 AND                    -- Skip Alterac Valley
       `id` IN (142144,                   -- Ghost Mushroom
                142145, 176637,           -- Gromsblood
                176584, 176639, 180168,   -- Dreamfoil
                176586, 176640, 180166,   -- Mountain Silversage
                176587, 176641,           -- Plaguebloom
                176588,                   -- Icecap
                176589);                  -- Black Lotus

UPDATE `pool_template`
   SET `flags` = `flags` | 0x02 -- POOL_FLAG_MAXLIMIT_SCALING_LINEAR
 WHERE `entry` IN (1001,        -- Earthroots in Teldrassil 26 objects total
                   1002,        -- Peaceblooms in Teldrassil 42 objects total
                   1003,        -- Silverleafs in Teldrassil 44 objects total
                   1004,        -- Mageroyals in Teldrassil 12 objects total
                   1005,        -- Earthroots in Tirisfal 32 objects total
                   1006,        -- Peaceblooms in Tirisfal 51 objects total
                   1007,        -- Silverleafs in Tirisfal 69 objects total
                   1011,        -- Earthroots in Elwynn Forest 17 objects total
                   1012,        -- Peaceblooms in Elwynn Forest 34 objects total
                   1013,        -- Silverleafs in Elwynn Forest 59 objects total
                   1016,        -- Earthroots in Dun Morogh 31 objects total
                   1017,        -- Peaceblooms in Dun Morogh 41 objects total
                   1018,        -- Silverleafs in Dun Morogh 54 objects total
                   1020,        -- Peaceblooms in Durotar 53 objects total
                   1021,        -- Earthroots in Durotar 33 objects total
                   1022,        -- Silverleafs in Durotar 137 objects total
                   1023,        -- Mageroyals in Durotar 14 objects total
                   1025,        -- Earthroots in Mulgore 31 objects total
                   1026,        -- Peaceblooms in Mulgore 56 objects total
                   1027,        -- Silverleafs in Mulgore 73 objects total
                   1029,        -- Earthroots in Barrens 127 objects total
                   1030,        -- Peaceblooms in Barrens 86 objects total
                   1031,        -- Silverleafs in Barrens 100 objects total
                   1032,        -- Mageroyals in Barrens 227 objects total
                   1036,        -- Bruiseweed in Barrens 95 objects total
                   1037,        -- Briarthorn in Barrens 77 objects total
                   1038,        -- Kingsblood in Barrens 33 objects total
                   1039,        -- Kingsblood in Dustwallow Marsh 5 objects total
                   1040,        -- Earthroots in Silverpine Forest 13 objects total
                   1041,        -- Peaceblooms in Silverpine Forest 34 objects total
                   1042,        -- Silverleafs in Silverpine Forest 55 objects total
                   1043,        -- Mageroyals in Silverpine Forest 32 objects total
                   1046,        -- Briarthorn in Silverpine Forest 28 objects total
                   1047,        -- Bruiseweed in Silverpine Forest 76 objects total
                   1048,        -- Bruiseweed in Hillsbrad 102 objects total
                   1049,        -- Mageroyals in Hillsbrad 12 objects total
                   1050,        -- Briarthorn in Hillsbrad 29 objects total
                   1051,        -- Kingsblood in Hillsbrad 38 objects total
                   1056,        -- Bruiseweed in Alterac 25 objects total
                   1057,        -- Kingsblood in Alterac 6 objects total
                   1058,        -- Goldthorn in Alterac 81 objects total
                   1059,        -- Khadgars Whisker in Alterac 26 objects total
                   1060,        -- Grave Moss in Alterac 7 objects total
                   1061,        -- Wild Steelblooms in Alterac 16 objects total
                   1062,        -- Wintersbite in Alterac 34 objects total
                   1063,        -- Liferoots in Alterac 36 objects total
                   1064,        -- Stranglekelp in Barrens 52 objects total
                   1065,        -- Stranglekelp in Silverpine Forest 16 objects total
                   1071,        -- Fadeleafs in Alterac 33 objects total
                   1072,        -- Bruiseweed in Ashenvale 137 objects total
                   1073,        -- Briarthorn in Ashenvale 62 objects total
                   1076,        -- Stranglekelp in Ashenvale 107 objects total
                   1077,        -- Mageroyals in Ashenvale 63 objects total
                   1078,        -- Kingsblood in Ashenvale 27 objects total
                   1081,        -- Wild Steelblooms in Ashenvale 57 objects total
                   1082,        -- Various Herbs in Stonetalon (and Barrens) 28 objects total
                   1083,        -- Gravemoss in Barrens 5 objects total
                   1085,        -- Wild Steelblooms in Stonetalon 92 objects total
                   1086,        -- Bruiseweed in Stonetalon 169 objects total
                   1087,        -- Briarthorn in Stonetalon 31 objects total
                   1088,        -- Kingsblood in Stonetalon 26 objects total
                   1094,        -- Earthroots in Darkshore 20 objects total
                   1095,        -- Silverleafs in Darkshore 64 objects total
                   1096,        -- Peaceblooms in Darkshore 18 objects total
                   1097,        -- Mageroyals in Darkshore 61 objects total
                   1100,        -- Briarthorn in Darkshore 50 objects total
                   1101,        -- Bruiseweed in Darkshore 39 objects total
                   1102,        -- Khadgars Whisker in Dustwallow Marsh 9 objects total
                   1103,        -- Goldthorn in Dustwallow Marsh 9 objects total
                   1104,        -- Liferoots in Dustwallow Marsh 10 objects total
                   1105,        -- Earthroots in Westfall 25 objects total
                   1106,        -- Silverleafs in Westfall 23 objects total
                   1107,        -- Peaceblooms in Westfall 15 objects total
                   1108,        -- Mageroyals in Westfall 45 objects total
                   1109,        -- Briarthorn in Westfall 37 objects total
                   1110,        -- Bruiseweed in Westfall 76 objects total
                   1113,        -- Briarthorn in Duskwood 98 objects total
                   1114,        -- Wildsteel Blooms in Duskwood 10 objects total
                   1115,        -- Bruiseweed in Duskwood 85 objects total
                   1116,        -- Mageroyals in Duskwood 17 objects total
                   1117,        -- Kingsblood in Duskwood 19 objects total
                   1122,        -- Stranglekelp in Westfall 20 objects total
                   1123,        -- Stranglekelp in Hillsbrad 24 objects total
                   1124,        -- Earthroots in Redridge 24 objects total
                   1125,        -- Peaceblooms in Redridge 8 objects total
                   1127,        -- Briarthorn in Redridge 28 objects total
                   1133,        -- Bruiseweed in Thousand Needles 59 objects total
                   1134,        -- Wild Steelblooms in Thousand Needles 42 objects total
                   1136,        -- Kingsblood in Thousand Needles 15 objects total
                   1137,        -- Bruiseweed in Desolace 50 objects total
                   1138,        -- Kingsblood in Desolace 13 objects total
                   1142,        -- Wild Steelblooms in Desolace 10 objects total
                   1143,        -- Gromsblood in Desolace 12 objects total
                   1144,        -- Liferoots in Desolace 11 objects total
                   1145,        -- Stranglekelp in Desolace 24 objects total
                   1148,        -- Grave Moss in Wetlands 15 objects total
                   1149,        -- Stranglekelp in Wetlands 41 objects total
                   1150,        -- Bruiseweed in Wetlands 97 objects total
                   1151,        -- Briarthorn in Wetlands 27 objects total
                   1152,        -- Wild Steelblooms in Wetlands 47 objects total
                   1153,        -- Liferoots in Wetlands 51 objects total
                   1154,        -- Mageroyals in Wetlands 16 objects total
                   1155,        -- Kingsblood in Wetlands 26 objects total
                   1160,        -- Earthroots in Loch Modan 9 objects total
                   1161,        -- Peaceblooms in Loch Modan 19 objects total
                   1162,        -- Silverleafs in Loch Modan 77 objects total
                   1163,        -- Mageroyals in Loch Modan 20 objects total
                   1164,        -- Bruiseweed in Loch Modan 61 objects total
                   1165,        -- Briarthorn in Loch Modan 17 objects total
                   1168,        -- Wild Steelblooms in Barrens 29 objects total
                   1169,        -- Wild Steelblooms in Stranglethorn 41 objects total
                   1170,        -- Kingsblood in Stranglethorn 53 objects total
                   1171,        -- Stranglekelp in Stranglethorn 57 objects total
                   1172,        -- Fadeleaf in Stranglethorn 34 objects total
                   1173,        -- Khadgars Whisker in Stranglethorn 179 objects total
                   1174,        -- Goldthorn in Stranglethorn 184 objects total
                   1179,        -- Liferoots in Stranglethorn 52 objects total
                   1180,        -- Kingsblood in Arathi 25 objects total
                   1181,        -- Goldthorn in Arathi 120 objects total
                   1182,        -- Khadgars Whisker in Arathi 71 objects total
                   1183,        -- Fadeleafs in Arathi 55 objects total
                   1184,        -- Liferoots in Arathi 47 objects total
                   1185,        -- Wild Steelblooms in Arathi 127 objects total
                   1189,        -- Khadgars Whisker in Feralas 14 objects total
                   1190,        -- Stranglekelp in Feralas 28 objects total
                   1191,        -- Goldthorn in Feralas 26 objects total
                   1192,        -- Sungrass in Feralas 20 objects total
                   1193,        -- Liferoots in Feralas 19 objects total
                   1194,        -- Golden Sansam in Feralas 17 objects total
                   1199,        -- Purple Lotus in Stranglethorn 15 objects total
                   1205,        -- Purple Lotus in Tanaris 32 objects total
                   1206,        -- Golden Sansam in Tanaris 12 objects total
                   1207,        -- Dreamfoil in Tanaris 13 objects total
                   1208,        -- Fireblooms in Tanaris 62 objects total
                   1212,        -- Dreamfoil in Ungoro 83 objects total
                   1214,        -- Golden Sansam in Ungoro 94 objects total
                   1215,        -- Sungrass in Ungoro 22 objects total
                   1216,        -- Blindweed in Ungoro 16 objects total
                   1218,        -- Mountain Silversage in Ungoro 70 objects total
                   1221,        -- Dreamfoil in Silithus 22 objects total
                   1222,        -- Mountain Silversage in Silithus 6 objects total
                   1224,        -- Golden Sansam in Silithus 26 objects total
                   1225,        -- Gromsblood in Felwood 56 objects total
                   1226,        -- Arthas Tears in Felwood 23 objects total
                   1227,        -- Plagueblooms in Felwood 63 objects total
                   1228,        -- Dreamfoil in Felwood 54 objects total
                   1229,        -- Sungrass in Felwood 15 objects total
                   1230,        -- Golden Sansam in Felwood 30 objects total
                   1236,        -- Icecaps in Winterspring 153 objects total
                   1237,        -- Mountain Silversage in Winterspring 85 objects total
                   1239,        -- Purple Lotus in Azshara 114 objects total
                   1240,        -- Sungrass in Azshara 93 objects total
                   1241,        -- Golden Sansam in Azshara 87 objects total
                   1242,        -- Dreamfoil in Azshara 122 objects total
                   1243,        -- Mountain Silversage in Azshara 52 objects total
                   1247,        -- Ghost Mushrooms in Hinterlands 30 objects total
                   1248,        -- Khadgars Whisker in Hinterlands 28 objects total
                   1249,        -- Goldthron in Hinterlands 50 objects total
                   1250,        -- Sungrass in Hinterlands 77 objects total
                   1251,        -- Liferoots in Hinterlands 17 objects total
                   1252,        -- Fadeleafs in Hinterlands 29 objects total
                   1253,        -- Golden Sansam in Hinterlands 25 objects total
                   1254,        -- Purple Lotus in Hinterlands 29 objects total
                   1258,        -- Plagueblooms in Western Plaguelands 74 objects total
                   1259,        -- Arthas Tears in Western Plaguelands 46 objects total
                   1260,        -- Dreamfoil in Western Plaguelands 33 objects total
                   1261,        -- Sungrass in Western Plaguelands 9 objects total
                   1265,        -- Plagueblooms in Eastern Plaguelands 144 objects total
                   1266,        -- Arthas Tears in Eastern Plaguelands 144 objects total
                   1267,        -- Dreamfoil in Eastern Plaguelands 71 objects total
                   1268,        -- Golden Sansam in Eastern Plaguelands 45 objects total
                   1269,        -- Mountain Silversage in Eastern Plaguelands 11 objects total
                   1275,        -- Gromsblood in Blasted Lands 26 objects total
                   1276,        -- Fireblooms in Blasted Lands 44 objects total
                   1277,        -- Sungrass in Blasted Lands 37 objects total
                   1281,        -- Fireblooms in Badlands 22 objects total
                   1282,        -- Khadgars Whisker in Badlands 26 objects total
                   1283,        -- Goldthorn in Badlands 41 objects total
                   1284,        -- Kingsblood in Badlands 21 objects total
                   1285,        -- Fadeleafs in Badlands 28 objects total
                   1286,        -- Purple Lotus in Badlands 7 objects total
                   1291,        -- Fireblooms in Searing Gorge 49 objects total
                   1300,        -- Golden Sansam in Burning Steppes 32 objects total
                   1301,        -- Dream Foil in Burning Steppes 57 objects total
                   1302,        -- Mountain Silversage in Burning Steppes 29 objects total
                   1303,        -- Sungrass in Burning Steppes 20 objects total
                   1305,        -- Purple Lotus in Ashenvale 14 objects total
                   1306,        -- Mageroyals in Redridge 24 objects total
                   1307,        -- Blindweed in Swamp of Sorrows (1) 61 objects total
                   1308,        -- Goldthorn in Swamp of Sorrows (1) 34 objects total
                   1309,        -- Khadgars Whisker in Swamp of Sorrows (1) 26 objects total
                   1310,        -- Khadgars Whisker in Swamp of Sorrows (2) 25 objects total
                   1311,        -- Fadeleafs in Swamp of Sorrows (2) 50 objects total
                   1312,        -- Blindweed in Swamp of Sorrows (2) 64 objects total
                   1313,        -- Goldthorn in Swamp of Sorrows (2) 56 objects total
                   1317,        -- Liferoots in Swamp of Sorrows (1) 6 objects total
                   300,         -- Black Lotus spawns - Silithus
                   301,         -- Black Lotus spawns - Eastern Plaguelands
                   302,         -- Black Lotus spawns - Winterspring
                   303,         -- Black Lotus spawns - Burning Steppes
                   1126,        -- Bruiseweed in Redridge 98 objects total
                   1320,        -- Sungrass in Eastern Plaguelands 35 objects total
                   1321,        -- Stranglekelp in Azshara 12 objects total
                   1322,        -- Stranglekelp in Darkshore 95 objects total
                   1323,        -- Stranglekelp in Durotar 8 objects total
                   1324,        -- Purple Lotus in Feralas 15 objects total
                   1325,        -- Liferoot in Ashenvale 10 objects total
                   1326,        -- Kingsblood in Swamp of Sorrows 6 objects total
                   1327,        -- Gromsblood in Ashenvale 8 objects total
                   1328);       -- Fadeleaf in Dustwallow Marsh 7 objects total
