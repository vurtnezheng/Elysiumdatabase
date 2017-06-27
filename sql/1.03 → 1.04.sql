
-- Temporary transition patch [1.3 → 1.4*1.5] 

-- Enable Alterac Valley 

UPDATE `battleground_template` SET `MinLvl` = 51, `MaxLvl` = 60 WHERE `id` = 1; 

-- Upgrade T1/T2 sets to 1.5 stats

INSERT INTO item_template(entry, stat_type1, stat_value1, stat_type2, stat_value2, stat_type3, stat_value3, stat_type4, stat_value4, stat_type5, stat_value5, stat_type6, stat_value6, armor, fire_res, nature_res, frost_res, shadow_res, arcane_res, spellid_1, spelltrigger_1, spellid_2, spelltrigger_2, spellid_3, spelltrigger_3) VALUES
('16811','5','18','6','15','7','17','0','0','0','0','0','0','70','0','0','0','7','0','9406','1','0','0','0','0'),
('16812','5','15','6','15','7','10','0','0','0','0','0','0','63','7','0','0','0','0','21626','1','9406','1','0','0'),
('16813','5','27','6','20','7','17','0','0','0','0','0','0','83','10','0','0','0','0','9417','1','9408','1','0','0'),
('16814','5','24','6','20','7','18','0','0','0','0','0','0','89','0','0','0','10','0','21626','1','9408','1','0','0'),
('16815','5','27','6','17','7','20','0','0','0','0','0','0','102','10','0','0','0','0','9408','1','0','0','0','0'),
('16816','5','23','6','10','7','13','0','0','0','0','0','0','76','0','0','0','7','0','9415','1','0','0','0','0'),
('16817','5','22','6','10','7','10','0','0','0','0','0','0','57','7','0','0','0','0','21618','1','9415','1','0','0'),
('16819','7','8','5','12','6','7','0','0','0','0','0','0','44','0','0','0','0','0','21624','1','9407','1','0','0'),
('16820','3','29','7','20','4','10','0','0','0','0','0','0','200','10','0','0','0','0','7597','1','0','0','0','0'),
('16821','3','20','7','19','4','6','0','0','0','0','0','0','163','10','0','0','0','0','7598','1','0','0','0','0'),
('16822','3','33','7','15','4','10','0','0','0','0','0','0','175','0','0','0','10','0','7597','1','0','0','0','0'),
('16823','3','26','7','12','4','3','0','0','0','0','0','0','150','0','0','0','7','0','15464','1','0','0','0','0'),
('16824','3','26','7','18','0','0','0','0','0','0','0','0','138','0','0','0','7','0','0','0','0','0','0','0'),
('16825','3','20','7','15','0','0','0','0','0','0','0','0','88','0','0','0','0','0','0','0','0','0','0','0'),
('16826','3','18','7','17','4','12','0','0','0','0','0','0','125','7','0','0','0','0','15464','1','0','0','0','0'),
('16827','3','17','7','18','4','9','0','0','0','0','0','0','113','7','0','0','0','0','7597','1','0','0','0','0'),
('16828','5','22','6','10','7','10','0','0','0','0','0','0','113','7','0','0','0','0','21618','1','9415','1','0','0'),
('16829','5','13','6','15','7','16','0','0','0','0','0','0','138','0','0','0','7','0','21625','1','9406','1','0','0'),
('16830','5','14','6','13','7','13','0','0','0','0','0','0','88','0','0','0','0','0','9396','1','0','0','0','0'),
('16831','5','18','6','15','7','17','0','0','0','0','0','0','125','7','0','0','0','0','9406','1','0','0','0','0'),
('16832','3','25','7','17','4','6','0','0','0','0','0','0','169','10','0','0','0','0','13669','1','0','0','0','0'),
('16833','5','24','6','16','7','23','0','0','0','0','0','0','200','10','0','0','0','0','21625','1','9408','1','0','0'),
('16834','5','28','6','13','7','26','0','0','0','0','0','0','163','10','0','0','0','0','9417','1','0','0','0','0'),
('16835','5','19','6','20','7','18','0','0','0','0','0','0','175','0','0','0','10','0','18384','1','21362','1','9408','1'),
('16836','5','20','6','10','7','13','0','0','0','0','0','0','150','0','0','0','7','0','21618','1','9406','1','0','0'),
('16837','5','10','6','22','7','15','0','0','0','0','0','0','290','0','0','0','7','0','9406','1','0','0','0','0'),
('16838','5','21','6','7','7','12','0','0','0','0','0','0','237','7','0','0','0','0','21618','1','9406','1','0','0'),
('16839','5','13','6','15','7','14','0','0','0','0','0','0','264','7','0','0','0','0','18384','1','9415','1','0','0'),
('16840','5','17','6','11','7','10','0','0','0','0','0','0','185','0','0','0','0','0','9396','1','0','0','0','0'),
('16841','5','27','6','13','7','17','0','0','0','0','0','0','422','10','0','0','0','0','18384','1','9408','1','0','0'),
('16842','5','23','6','13','7','24','0','0','0','0','0','0','343','10','0','0','0','0','21626','1','9408','1','0','0'),
('16843','5','19','6','21','7','18','0','0','0','0','0','0','369','0','0','0','10','0','21627','1','9417','1','0','0'),
('16844','5','18','6','10','7','17','0','0','0','0','0','0','317','0','0','0','7','0','21618','1','9406','1','0','0'),
('16845','3','26','5','11','7','23','0','0','0','0','0','0','422','10','0','0','0','0','7597','1','0','0','0','0'),
('16846','3','23','5','15','6','8','7','23','0','0','0','0','343','10','0','0','0','0','7597','1','0','0','0','0'),
('16847','3','32','5','6','6','8','7','15','0','0','0','0','369','0','0','0','10','0','7597','1','0','0','0','0'),
('16848','3','24','5','5','6','9','7','14','0','0','0','0','317','0','0','0','7','0','15464','1','0','0','0','0'),
('16849','3','28','6','6','7','14','0','0','0','0','0','0','290','0','0','0','7','0','0','0','0','0','0','0'),
('16850','3','20','5','6','6','5','7','11','0','0','0','0','185','0','0','0','0','0','0','0','0','0','0','0'),
('16851','3','18','5','9','6','4','7','16','0','0','0','0','237','7','0','0','0','0','7597','1','0','0','0','0'),
('16852','3','18','7','12','0','0','0','0','0','0','0','0','264','7','0','0','0','0','15465','1','0','0','0','0'),
('16853','5','21','6','13','7','26','4','8','0','0','0','0','749','10','0','0','0','0','9408','1','0','0','0','0'),
('16854','5','24','6','10','7','20','4','9','0','0','0','0','608','10','0','0','0','0','21619','1','9408','1','0','0'),
('16855','5','18','6','18','7','24','4','7','0','0','0','0','655','0','0','0','10','0','21625','1','9408','1','0','0'),
('16856','5','15','6','8','7','22','4','10','0','0','0','0','562','0','0','0','7','0','9406','1','0','0','0','0'),
('16857','5','8','6','11','7','11','4','10','0','0','0','0','328','0','0','0','0','0','21618','1','0','0','0','0'),
('16858','5','20','6','8','7','15','4','13','0','0','0','0','421','7','0','0','0','0','9406','1','0','0','0','0'),
('16859','5','13','6','10','7','20','4','7','0','0','0','0','515','0','0','0','7','0','21624','1','9406','1','0','0'),
('16860','5','15','6','14','7','15','4','10','0','0','0','0','468','7','0','0','0','0','9406','1','0','0','0','0'),
('16861','7','23','4','11','0','0','0','0','0','0','0','0','328','0','0','0','0','0','0','0','0','0','0','0'),
('16862','7','26','4','15','0','0','0','0','0','0','0','0','515','0','0','0','7','0','13383','1','0','0','0','0'),
('16863','7','17','4','22','0','0','0','0','0','0','0','0','468','7','0','0','0','0','15464','1','13383','1','0','0'),
('16864','7','15','4','21','0','0','0','0','0','0','0','0','421','7','0','0','0','0','13669','1','13383','1','0','0'),
('16865','7','28','4','20','0','0','0','0','0','0','0','0','749','10','0','0','0','0','13676','1','13386','1','0','0'),
('16866','7','35','4','15','0','0','0','0','0','0','0','0','608','10','0','0','0','0','13669','1','13386','1','0','0'),
('16867','7','23','4','24','0','0','0','0','0','0','0','0','655','0','0','0','10','0','13665','1','13386','1','0','0'),
('16868','7','22','4','15','0','0','0','0','0','0','0','0','562','0','0','0','7','0','13675','1','13383','1','0','0'),
('16897','5','25','6','17','7','20','0','0','0','0','0','0','225','10','10','0','0','0','18384','1','18032','1','0','0'),
('16898','5','17','6','11','7','15','0','0','0','0','0','0','154','10','0','0','0','0','18384','1','9315','1','0','0'),
('16899','5','19','6','15','7','13','0','0','0','0','0','0','140','0','0','0','10','0','18032','1','0','0','0','0'),
('16900','5','31','6','12','7','20','0','0','0','0','0','0','183','0','0','10','10','0','21626','1','9316','1','0','0'),
('16901','5','26','6','23','7','17','0','0','0','0','0','0','197','10','0','0','0','10','18034','1','0','1','0','0'),
('16902','5','23','6','12','7','15','0','0','0','0','0','0','169','10','0','0','0','0','9316','1','0','1','0','0'),
('16903','5','25','6','12','7','13','0','0','0','0','0','0','126','0','0','0','10','0','9315','1','0','1','0','0'),
('16904','5','15','6','12','7','11','0','0','0','0','0','0','98','0','0','0','0','0','9318','1','0','0','0','0'),
('16905','3','26','7','17','4','12','0','0','0','0','0','0','225','10','10','0','0','0','7597','1','15465','1','0','0'),
('16906','3','25','7','17','4','6','0','0','0','0','0','0','154','10','0','0','0','0','13669','1','0','0','0','0'),
('16907','3','20','7','20','4','19','0','0','0','0','0','0','140','0','0','0','10','0','7219','1','0','0','0','0'),
('16908','3','27','7','25','4','19','0','0','0','0','0','0','183','0','0','10','10','0','7597','1','0','0','0','0'),
('16909','3','37','7','17','4','11','0','0','0','0','0','0','197','10','0','0','0','10','7597','1','0','0','0','0'),
('16910','3','20','7','15','4','13','0','0','0','0','0','0','126','0','0','0','10','0','7597','1','0','0','0','0'),
('16911','3','23','7','13','0','0','0','0','0','0','0','0','98','0','0','0','0','0','15464','1','0','0','0','0'),
('16919','5','17','6','17','7','17','0','0','0','0','0','0','80','10','0','0','0','0','18029','1','0','0','0','0'),
('16920','5','20','6','13','7','12','0','0','0','0','0','0','72','0','0','0','10','0','18384','1','9316','1','0','0'),
('16921','5','27','6','22','7','17','0','0','0','0','0','0','94','10','0','10','0','0','18034','1','0','0','0','0'),
('16922','5','21','6','21','7','16','0','0','0','0','0','0','101','0','0','0','10','10','18033','1','0','0','0','0'),
('16923','5','27','6','16','7','17','0','0','0','0','0','0','116','10','10','0','0','0','18037','1','0','0','0','0'),
('16924','5','25','6','13','7','12','0','0','0','0','0','0','87','5','3','0','0','0','9315','1','0','0','0','0'),
('16925','5','26','6','9','7','14','0','0','0','0','0','0','65','0','0','0','10','0','9315','1','0','0','0','0'),
('16926','5','13','6','16','7','9','0','0','0','0','0','0','51','0','0','0','0','0','9318','1','0','0','0','0'),
('16935','3','23','5','6','6','6','7','13','0','0','0','0','211','0','0','0','0','0','0','0','0','0','0','0'),
('16936','3','20','5','13','6','11','7','15','0','0','0','0','271','0','0','0','10','0','7597','1','0','0','0','0'),
('16937','3','23','5','13','6','6','7','15','0','0','0','0','362','10','0','0','0','0','15464','1','0','0','0','0'),
('16938','3','31','5','15','6','8','7','16','0','0','0','0','422','10','0','0','0','10','15464','1','7597','1','0','0'),
('16939','3','27','5','16','6','8','7','26','0','0','0','0','392','0','0','10','10','0','7597','1','0','0','0','0'),
('16940','3','20','5','13','6','6','7','17','0','0','0','0','301','0','0','0','10','0','7597','1','0','0','0','0'),
('16941','3','30','5','6','6','6','7','15','0','0','0','0','332','10','0','0','0','0','0','0','0','0','0','0'),
('16942','3','34','5','14','6','6','7','17','0','0','0','0','482','10','10','0','0','0','7597','1','0','0','0','0'),
('16943','5','16','6','9','7','13','0','0','0','0','0','0','211','0','0','0','0','0','18379','1','0','0','0','0'),
('16944','5','18','6','11','7','13','0','0','0','0','0','0','271','0','0','0','10','0','18384','1','9315','1','0','0'),
('16945','5','17','6','8','7','23','0','0','0','0','0','0','362','10','0','0','0','0','9317','1','0','0','0','0'),
('16946','5','18','6','20','7','16','0','0','0','0','0','0','422','10','0','0','0','10','18384','1','13881','1','0','0'),
('16947','5','24','6','12','7','20','0','0','0','0','0','0','392','0','0','10','10','0','18384','1','18029','1','0','0'),
('16948','5','17','6','13','7','15','0','0','0','0','0','0','301','0','0','0','10','0','21626','1','9317','1','0','0'),
('16949','5','16','6','16','7','17','0','0','0','0','0','0','332','10','0','0','0','0','14799','1','0','0','0','0'),
('16950','5','31','6','16','7','17','0','0','0','0','0','0','482','10','10','0','0','0','17371','1','0','0','0','0'),
('16951','5','13','6','9','7','23','4','0','0','0','0','0','375','0','0','0','0','0','0','0','0','0','0','0'),
('16952','5','23','6','8','7','15','4','0','0','0','0','0','482','0','0','0','10','0','18029','1','0','0','0','0'),
('16953','5','17','6','8','7','20','4','0','0','0','0','0','642','10','0','0','0','0','21363','1','9408','1','0','0'),
('16954','5','27','6','17','7','26','4','0','0','0','0','0','749','0','0','0','0','0','18029','1','0','0','0','0'),
('16955','5','29','6','17','7','21','4','0','0','0','0','0','696','0','0','10','10','0','18033','1','0','0','0','0'),
('16956','5','20','6','10','7','17','4','0','0','0','0','0','535','0','0','0','10','0','21626','1','23796','1','0','0'),
('16957','5','15','6','12','7','23','4','0','0','0','0','0','589','10','0','0','0','0','9316','1','0','0','0','0'),
('16958','5','21','6','12','7','23','4','0','0','0','0','0','857','10','10','0','0','10','18379','1','18030','1','0','0'),
('16959','7','27','4','13','0','0','0','0','0','0','0','0','375','0','0','0','0','0','0','0','0','0','0','0'),
('16960','7','20','4','20','0','0','0','0','0','0','0','0','482','0','0','0','10','0','13676','1','13386','1','0','0'),
('16961','7','27','4','13','0','0','0','0','0','0','0','0','642','10','0','0','0','0','23516','1','13386','1','0','0'),
('16962','7','27','4','19','0','0','0','0','0','0','0','0','749','10','0','0','0','10','13670','1','21407','1','0','0'),
('16963','7','40','4','17','0','0','0','0','0','0','0','0','696','0','0','10','10','0','21407','1','0','0','0','0'),
('16964','7','20','4','15','0','0','0','0','0','0','0','0','535','0','0','0','10','0','13665','1','13386','1','0','0'),
('16965','7','30','4','13','0','0','0','0','0','0','0','0','589','10','0','0','0','0','23515','1','13386','1','0','0'),
('16966','7','40','4','17','0','0','0','0','0','0','0','0','857','10','10','0','0','0','21407','1','0','0','0','0'),
-- Arcanist (1.5)
('16795','7','14','5','35','6','8','0','0','0','0','0','0','83','10','0','0','0','0','9344','1','0','0','0','0'),
('16796','5','24','6','13','7','23','0','0','0','0','0','0','89','0','0','0','10','10','18384','1','9404','1','0','0'),
('16797','5','24','6','9','7','10','0','0','0','0','0','0','76','5','0','0','0','0','13605','1','0','0','0','0'),
('16798','5','33','6','16','7','7','3','7','0','0','0','0','102','0','0','0','0','0','13599','1','9401','0','9404','0'),
('16799','5','20','7','6','6','8','0','0','0','0','0','0','44','7','0','4','0','0','9396','1','21624','1','0','0'),
('16800','7','13','5','15','6','14','0','0','0','0','0','0','70','0','0','0','10','10','18384','1','9402','1','0','0'),
('16801','5','18','6','10','7','17','0','0','0','0','0','0','63','7','0','0','0','0','21618','1','0','0','0','0'),
('16802','5','26','6','10','7','10','0','0','0','0','0','0','57','7','0','0','0','0','9415','1','0','0','0','0'),
	-- Felheart (1.5)
('16803','5','10','6','8','7','27','0','0','0','0','0','0','70','0','0','0','7','7','9412','1','0','0','0','0'),
('16804','5','11','6','8','7','18','0','0','0','0','0','0','44','0','0','0','0','0','21346','1','7708','1','0','0'),
('16805','5','15','6','8','7','18','0','0','0','0','0','0','63','7','0','0','0','0','18384','1','9415','1','0','0'),
('16806','5','14','6','13','7','14','0','0','0','0','0','0','57','7','0','0','0','0','21348','1','9412','0','0','0'),
('16807','5','17','6','7','7','25','0','0','0','0','0','0','76','0','0','0','7','7','9415','1','0','0','0','0'),
('16808','5','20','6','12','7','27','0','0','0','0','0','0','83','10','0','0','0','0','21595','1','9414','1','0','0'),
('16809','5','20','7','31','0','0','0','0','0','0','0','0','102','10','0','0','0','0','9342','1','23727','1','0','0'),
('16810','5','19','6','10','7','20','0','0','0','0','0','0','89','0','0','0','10','10','14798','1','0','0','0','0'),
	-- Netherwind (1.5)
('16818', '5', '25', '6', '13', '7', '12', '0', '0', '0', '0', '0', '0', '65', '0', '0', '0', '10', '0', '9343', '1', '0', '0', '0', '0'),
('16912', '5', '17', '6', '20', '7', '13', '0', '0', '0', '0', '0', '0', '80', '0', '10', '0', '0', '0', '13605', '1', '0', '0', '0', '0'),
('16913', '5', '17', '6', '14', '7', '15', '0', '0', '0', '0', '0', '0', '72', '0', '0', '0', '10', '0', '18384', '1', '9344', '1', '0', '0'),
('16914', '5', '32', '6', '12', '7', '14', '0', '0', '0', '0', '0', '0', '94', '0', '0', '10', '10', '0', '18049', '1', '0', '0', '0', '0'),
('16915', '5', '27', '6', '17', '7', '16', '0', '0', '0', '0', '0', '0', '101', '10', '0', '0', '0', '10', '14798', '1', '0', '0', '0', '0'),
('16916', '5', '36', '6', '17', '7', '8', '0', '0', '0', '0', '0', '0', '116', '9', '3', '0', '0', '0', '17868', '1', '0', '0', '0', '0'),
('16917', '5', '18', '6', '13', '7', '16', '0', '0', '0', '0', '0', '0', '87', '10', '0', '0', '0', '0', '21619', '1', '9343', '1', '0', '0'),
('16918', '5', '23', '6', '13', '7', '9', '0', '0', '0', '0', '0', '0', '51', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	-- Nemesis (1.5)
('16927', '5', '13', '6', '17', '7', '20', '0', '0', '0', '0', '0', '0', '80', '0', '3', '0', '0', '0', '18009', '1', '0', '0', '0', '0'),
('16928', '5', '16', '6', '7', '7', '17', '0', '0', '0', '0', '0', '0', '72', '0', '0', '0', '10', '0', '20885', '1', '9343', '1', '0', '0'),
('16929', '5', '18', '6', '13', '7', '27', '0', '0', '0', '0', '0', '0', '94', '0', '0', '10', '10', '0', '21599', '1', '14799', '1', '0', '0'),
('16930', '5', '17', '6', '16', '7', '27', '0', '0', '0', '0', '0', '0', '101', '10', '0', '0', '0', '10', '14798', '1', '0', '0', '0', '0'),
('16931', '3', '5', '5', '23', '6', '17', '7', '27', '0', '0', '0', '0', '116', '3', '0', '0', '9', '0', '18009', '1', '0', '0', '0', '0'),
('16932', '5', '13', '6', '10', '7', '20', '0', '0', '0', '0', '0', '0', '87', '10', '0', '0', '0', '0', '21598', '1', '9346', '1', '0', '0'),
('16933', '5', '20', '6', '11', '7', '14', '0', '0', '0', '0', '0', '0', '65', '13', '0', '12', '13', '0', '0', '0', '0', '0', '0', '0'),
('16934', '5', '13', '6', '9', '7', '21', '0', '0', '0', '0', '0', '0', '51', '0', '0', '0', '0', '0', '9397', '1', '0', '0', '0', '0')
ON DUPLICATE KEY UPDATE
stat_type1 = VALUES(stat_type1), stat_value1 = VALUES(stat_value1), stat_type2 = VALUES(stat_type2), stat_value2 = VALUES(stat_value2),
stat_type3 = VALUES(stat_type3), stat_value3 = VALUES(stat_value3), stat_type4 = VALUES(stat_type4), stat_value4 = VALUES(stat_value4),
stat_type5 = VALUES(stat_type5), stat_value5 = VALUES(stat_value5), stat_type6 = VALUES(stat_type6), stat_value6 = VALUES(stat_value6),
armor = VALUES(armor),
fire_res = VALUES(fire_res), nature_res = VALUES(nature_res), frost_res = VALUES(frost_res), shadow_res = VALUES(shadow_res), arcane_res = VALUES(arcane_res),
spellid_1 = VALUES(spellid_1), spelltrigger_1 = VALUES(spelltrigger_1), spellid_2 = VALUES(spellid_2), spelltrigger_2 = VALUES(spelltrigger_2),
spellid_3 = VALUES(spellid_3), spelltrigger_3 = VALUES(spelltrigger_3);

-- Update available items stats

	-- STATS CHANGED: Murloc Scale Belt (ilevel 18 entry 5780). 1/2 versions
UPDATE item_template SET `stat_value1`=0, `stat_value2`=0, `armor`=40 WHERE entry=5780; 
	-- QUALITY CHANGED: Murloc Scale Belt (ilevel 18 entry 5780)
UPDATE item_template SET Quality=1 WHERE entry=5780;
	-- Flarecore Gloves are Soulbound till Patch 1.7
UPDATE `item_template` SET `bonding` = 1 WHERE `entry` = 17018;
	-- Fang of the Mystics (not quite sure)
UPDATE item_template SET `dmg_min1`='54', `dmg_max1`='101', `spellid_3`=0, `spelltrigger_3`=0 WHERE entry=17070;


-- Enable available quests 

	-- Enable Warlock Epic Mount Quest Chain
UPDATE `quest_template` SET `Method` = `Method` & 6 WHERE `entry` = 7562;
	-- Enable Paladin Epic Mount Quest Chain
UPDATE `quest_template` SET `Method` = `Method` & 6 WHERE `entry` = 7638;
	-- Add Mounts Quests (Transforms pre 1.4-mounts to post-1.4)
REPLACE INTO creature_questrelation value    (3685,7663);
REPLACE INTO creature_involvedrelation value (3685,7663);
REPLACE INTO creature_questrelation value    (3685,7662);
REPLACE INTO creature_involvedrelation value (3685,7662);
REPLACE INTO creature_questrelation value    (3362,7660);
REPLACE INTO creature_involvedrelation value (3362,7660);
REPLACE INTO creature_questrelation value    (3362,7661);
REPLACE INTO creature_involvedrelation value (3362,7661);
REPLACE INTO creature_questrelation value    (7952,7664);
REPLACE INTO creature_involvedrelation value (7952,7664);
REPLACE INTO creature_questrelation value    (7952,7665);
REPLACE INTO creature_involvedrelation value (7952,7665);
REPLACE INTO creature_questrelation value    ( 384,7677);
REPLACE INTO creature_involvedrelation value ( 384,7677);
REPLACE INTO creature_questrelation value    ( 384,7678);
REPLACE INTO creature_involvedrelation value ( 384,7678);
REPLACE INTO creature_questrelation value    (4885,7677);
REPLACE INTO creature_involvedrelation value (4885,7677);
REPLACE INTO creature_questrelation value    (4885,7678);
REPLACE INTO creature_involvedrelation value (4885,7678);
REPLACE INTO creature_questrelation value    (2357,7677);
REPLACE INTO creature_involvedrelation value (2357,7677);
REPLACE INTO creature_questrelation value    (2357,7678);
REPLACE INTO creature_involvedrelation value (2357,7678);
REPLACE INTO creature_questrelation value    (1460,7677);
REPLACE INTO creature_involvedrelation value (1460,7677);
REPLACE INTO creature_questrelation value    (1460,7678);
REPLACE INTO creature_involvedrelation value (1460,7678);
REPLACE INTO creature_questrelation value    (1261,7673);
REPLACE INTO creature_involvedrelation value (1261,7673);
REPLACE INTO creature_questrelation value    (1261,7674);
REPLACE INTO creature_involvedrelation value (1261,7674);
REPLACE INTO creature_questrelation value    (4730,7671);
REPLACE INTO creature_involvedrelation value (4730,7671);
REPLACE INTO creature_questrelation value    (4730,7672);
REPLACE INTO creature_involvedrelation value (4730,7672);
REPLACE INTO creature_questrelation value    (7955,7675);
REPLACE INTO creature_involvedrelation value (7955,7675);
REPLACE INTO creature_questrelation value    (7955,7676);
REPLACE INTO creature_involvedrelation value (7955,7676);


-- Enable available loot

	/* -- Malekis FootWrap Add To Loot Table
SET @refTable = -1;
SELECT * FROM creature_loot_template WHERE entry = 10438;
SELECT @refTable := -mincountOrRef FROM creature_loot_template WHERE entry = 10438 and mincountOrRef < 0 and groupid = 1;
INSERT INTO reference_loot_template VALUES(@refTable,18735,0,1,1,1,0);
	-- Onslaught Gridle Add To Loot Table
SET @refTable = -1;
SELECT * FROM creature_loot_template WHERE entry = 11502;
SELECT @refTable := -mincountOrRef FROM creature_loot_template WHERE entry = 11502 and mincountOrRef < 0 and groupid = 10;
INSERT INTO reference_loot_template VALUES(@refTable,19137,0,10,1,1,0);
	-- Crystal Adorned Crown Add To Loot Table
SET @refTable = -1;
SELECT * FROM creature_loot_template WHERE entry = 6109;
SELECT @refTable := -mincountOrRef FROM creature_loot_template WHERE entry = 6109 and mincountOrRef < 0 and groupid = 10;
INSERT INTO reference_loot_template VALUES(@refTable,19132,0,10,1,1,0);
	-- Animated Chain Necklace Add To Loot Table
SET @refTable = -1;
SELECT * FROM creature_loot_template WHERE entry = 10439;
SELECT @refTable := -mincountOrRef FROM creature_loot_template WHERE entry = 10439 and mincountOrRef < 0 and groupid = 2;
INSERT INTO reference_loot_template VALUES(@refTable,18723,0,2,1,1,0);
*/
	-- Golemagg Loot Drop Rates & Faction Drop
update reference_loot_template set ChanceOrQuestChance = 20 where entry = 326158 and item in (18842, 17103, 17072);
update reference_loot_template set condition_id = 3 where entry = 326158 and item = 18824;
update reference_loot_template set condition_id = 2 where entry = 326158 and item = 18829;
-- Eirs 1.3—1.5 loot fixes
-- Double loot fixes
-- DM Alzzin the Wildshaper loot
DELETE FROM `creature_loot_template` WHERE `entry` = 11492;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES
(11492, 8948,   5.9524, 0,  2,  4,  0),
(11492, 14047,  16.7659,    0,  2,  4,  0),
(11492, 324906, 2,  1,  -324906,    1,  0),
(11492, 324907, 2,  2,  -324907,    1,  0),
(11492, 324908, 100,    3,  -324908,    1,  0),
(11492, 324909, 100,    4,  -324909,    1,  0);
-- Fix his reference loot templates
DELETE FROM `reference_loot_template` WHERE `entry` = 324909;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES
(324909,    18309,  0,  4,  1,  1,  0),
(324909,    18310,  0,  4,  1,  1,  0),
(324909,    18312,  0,  4,  1,  1,  0),
(324909,    18314,  0,  4,  1,  1,  0),
(324909,    18315,  0,  4,  1,  1,  0),
(324909,    18318,  0,  4,  1,  1,  0),
(324909,    18321,  0,  4,  1,  1,  0),
(324909,    18326,  0,  4,  1,  1,  0),
(324909,    18327,  0,  4,  1,  1,  0),
(324909,    18328,  0,  4,  1,  1,  0);
DELETE FROM `reference_loot_template` WHERE `entry` = 324908;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES
(324908,    18309,  0,  3,  1,  1,  0),
(324908,    18310,  0,  3,  1,  1,  0),
(324908,    18312,  0,  3,  1,  1,  0),
(324908,    18314,  0,  3,  1,  1,  0),
(324908,    18315,  0,  3,  1,  1,  0),
(324908,    18318,  0,  3,  1,  1,  0),
(324908,    18321,  0,  3,  1,  1,  0),
(324908,    18326,  0,  3,  1,  1,  0),
(324908,    18327,  0,  3,  1,  1,  0),
(324908,    18328,  0,  3,  1,  1,  0);
-- Fix Warpwood table
DELETE FROM `creature_loot_template` WHERE `entry` = 11489;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES
(11489, 10286,  5,  0,  1,  1,  0),
(11489, 22529,  43, 0,  2,  4,  70),
(11489, 324898, 2,  2,  -324898,    1,  0),
(11489, 324899, 6,  3,  -324899,    1,  0),
(11489, 324900, 100,    4,  -324900,    1,  0);
-- Fix his boss loot reference table
DELETE FROM `reference_loot_template` WHERE `entry` = 324900;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES
(324900,    18352,  0,  4,  1,  1,  0),
(324900,    18353,  0,  4,  1,  1,  0),
(324900,    18390,  0,  4,  1,  1,  0),
(324900,    18393,  0,  4,  1,  1,  0);
-- Fix Magister Kalendris' table
DELETE FROM `creature_loot_template` WHERE `entry` = 11487;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES
(11487, 14047,  19, 0,  2,  4,  0),
(11487, 22309,  15, 0,  1,  1,  0),
(11487, 324890, 2,  2,  -324911,    1,  0),
(11487, 324891, 6,  3,  -324899,    1,  0),
(11487, 324892, 100,    4,  -324892,    1,  0);
-- Fix his unique boss loot
DELETE FROM `reference_loot_template` WHERE `entry` = 324892;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES
(324892,    18350,  0,  4,  1,  1,  0),
(324892,    18351,  0,  4,  1,  1,  0),
(324892,    18371,  0,  4,  1,  1,  0),
(324892,    18374,  0,  4,  1,  1,  0),
(324892,    18397,  0,  4,  1,  1,  0);
-- Fix Illyana Ravenoak table
DELETE FROM `creature_loot_template` WHERE `entry` = 11488;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES
(11488, 14047,  16, 0,  2,  4,  0),
(11488, 324894, 2,  2,  -324911,    1,  0),
(11488, 324895, 6,  3,  -324899,    1,  0),
(11488, 324896, 100,    4,  -324896,    1,  0);
-- Add her unique loot
DELETE FROM `reference_loot_template` WHERE `entry` = 324896;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES
(324896,    18347,  0,  4,  1,  1,  0),
(324896,    18349,  0,  4,  1,  1,  0),
(324896,    18383,  0,  4,  1,  1,  0),
(324896,    18386,  0,  4,  1,  1,  0);
-- END Double Loot Fixes
-- Update Guard Mol'Dar loot
--     Runecloth x2-4
UPDATE `creature_loot_template` SET `maxcount` = 4 WHERE `item` = 14047 AND `entry` = 14326;
--     No evidence of him dropping Warbeads
DELETE FROM `creature_loot_template` WHERE `item` = 21982 AND `entry` = 14326;
--     Repair his boss loot table
DELETE FROM `reference_loot_template` WHERE `entry` = 328276;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES
(328276,    18450,  0,  1,  1,  1,  0),
(328276,    18451,  0,  1,  1,  1,  0),
(328276,    18458,  0,  1,  1,  1,  0),
(328276,    18459,  0,  1,  1,  1,  0),
(328276,    18460,  0,  1,  1,  1,  0),
(328276,    18462,  0,  1,  1,  1,  0),
(328276,    18463,  0,  1,  1,  1,  0),
(328276,    18464,  0,  1,  1,  1,  0),
(328276,    18493,  0,  1,  1,  1,  0),
(328276,    18494,  0,  1,  1,  1,  0),
(328276,    18496,  0,  1,  1,  1,  0),
(328276,    18497,  0,  1,  1,  1,  0),
(328276,    18498,  0,  1,  1,  1,  0);
-- Update Guard Slip'Kik loot
--     No evidence of him dropping Warbeads
DELETE FROM `creature_loot_template` WHERE `item` = 21982 AND `entry` = 14323;
--     Runecloth x2-4
UPDATE `creature_loot_template` SET `maxcount` = 4 WHERE `item` = 14047 AND `entry` = 14323;
-- Update Guard Fengus loot
--     Delete odd entries
DELETE FROM `creature_loot_template` WHERE `condition_id` = 738 AND `entry` = 14321;
--     Runecloth x2-4
UPDATE `creature_loot_template` SET `maxcount` = 4 WHERE `item` = 14047 AND `entry` = 14321;
--     Remove double Libram loot
DELETE FROM `creature_loot_template` WHERE `item` = 328259 AND `entry` = 14321;
--     Repair boss loot table
DELETE FROM `reference_loot_template` WHERE `entry` = 328262;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES
(328262,    18450,  0,  4,  1,  1,  0),
(328262,    18451,  0,  4,  1,  1,  0),
(328262,    18458,  0,  4,  1,  1,  0),
(328262,    18459,  0,  4,  1,  1,  0),
(328262,    18460,  0,  4,  1,  1,  0),
(328262,    18462,  0,  4,  1,  1,  0),
(328262,    18463,  0,  4,  1,  1,  0),
(328262,    18464,  0,  4,  1,  1,  0);
-- Update Captain Kromcrush
-- Just replace everything, too much junk
DELETE FROM `creature_loot_template` WHERE `entry` = 14325;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES
(14325, 14047,  25, 0,  2,  4,  0),
(14325, 18250,  13, 0,  1,  1,  0),
(14325, 18640,  2,  0,  1,  1,  0),
(14325, 328273, 2,  2,  -328273,    1,  0),
(14325, 328274, 6,  3,  -328274,    1,  0),
(14325, 328275, 100,    4,  -328275,    1,  0);
-- Add His Missing Boss Loot
DELETE FROM `reference_loot_template` WHERE `entry` = 328275;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES
(328275,    18502,  0,  4,  1,  1,  0),
(328275,    18503,  0,  4,  1,  1,  0),
(328275,    18505,  0,  4,  1,  1,  0),
(328275,    18507,  0,  4,  1,  1,  0);
-- Update King Gordok
DELETE FROM `creature_loot_template` WHERE `entry` = 11501;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES
(11501, 14047,  13, 0,  2,  5,  0),
(11501, 18640,  2,  0,  1,  1,  0),
(11501, 18780,  9,  0,  1,  1,  0),
(11501, 19258,  7,  0,  1,  1,  0),
(11501, 21982,  -50,    0,  1,  1,  0),
(11501, 324918, 2,  2,  -324918,    1,  0),
(11501, 324919, 100,    3,  -324919,    2,  0),
(11501, 324921, 6,  5,  -324921,    1,  0);
-- Repair unique loot table
DELETE FROM `reference_loot_template` WHERE `entry` = 324919;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES
(324919,    18520,  0,  3,  1,  1,  0),
(324919,    18521,  0,  3,  1,  1,  0),
(324919,    18522,  0,  3,  1,  1,  0),
(324919,    18523,  0,  3,  1,  1,  0),
(324919,    18524,  0,  3,  1,  1,  0),
(324919,    18525,  0,  3,  1,  1,  0),
(324919,    18526,  0,  3,  1,  1,  0),
(324919,    18527,  0,  3,  1,  1,  0);
-- Update Immol'Thar
DELETE FROM `creature_loot_template` WHERE `entry` =  11496;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES
(11496, 324913, 2,  2,  -324913,    1,  0),
(11496, 324914, 100,    3,  -324914,    2,  0),
(11496, 324916, 6,  5,  -324916,    1,  0);
-- Repair Unique Loot Table
DELETE FROM `reference_loot_template` WHERE `entry` = 324914;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES
(324914,    18370,  0,  3,  1,  1,  0),
(324914,    18372,  0,  3,  1,  1,  0),
(324914,    18377,  0,  3,  1,  1,  0),
(324914,    18379,  0,  3,  1,  1,  0),
(324914,    18381,  0,  3,  1,  1,  0),
(324914,    18384,  0,  3,  1,  1,  0),
(324914,    18385,  0,  3,  1,  1,  0),
(324914,    18389,  0,  3,  1,  1,  0),
(324914,    18391,  0,  3,  1,  1,  0),
(324914,    18394,  0,  3,  1,  1,  0);
-- Update Prince Tortheldrin
DELETE FROM `creature_loot_template` WHERE `entry` = 11486;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES
(11486, 14047,  11, 0,  2,  5,  0),
(11486, 21525,  100,    4,  1,  1,  110),
(11486, 324886, 100,    1,  -324886,    2,  0),
(11486, 324888, 6,  3,  -324888,    1,  0);
-- Repair Unique Boss Loot
DELETE FROM `reference_loot_template` WHERE `entry` = 324886;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES
(324886,    18373,  0,  1,  1,  1,  0),
(324886,    18375,  0,  1,  1,  1,  0),
(324886,    18376,  0,  1,  1,  1,  0),
(324886,    18378,  0,  1,  1,  1,  0),
(324886,    18380,  0,  1,  1,  1,  0),
(324886,    18382,  0,  1,  1,  1,  0),
(324886,    18388,  0,  1,  1,  1,  0),
(324886,    18392,  0,  1,  1,  1,  0),
(324886,    18395,  0,  1,  1,  1,  0),
(324886,    18396,  0,  1,  1,  1,  0);
-- Update Knot Thimblejack's Cache loot
DELETE FROM `gameobject_loot_template` WHERE `entry` = 16591;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES
(16591, 12006,  100,    1,  -12006, 2,  0),
(16591, 18240,  35, 0,  1,  2,  0),
(16591, 18414,  2,  1,  1,  1,  0),
(16591, 18415,  0,  1,  1,  1,  0),
(16591, 18416,  0,  1,  1,  1,  0),
(16591, 18417,  0,  1,  1,  1,  0),
(16591, 18418,  0,  1,  1,  1,  0),
(16591, 18514,  0,  1,  1,  1,  0),
(16591, 18515,  0,  1,  1,  1,  0),
(16591, 18516,  0,  1,  1,  1,  0),
(16591, 18517,  2,  1,  1,  1,  0),
(16591, 18518,  2,  1,  1,  1,  0),
(16591, 18519,  2,  1,  1,  1,  0);
-- Update Gordok Tribute loot
DELETE FROM `gameobject_loot_template` WHERE `entry` = 16577;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES
(16577, 8766,   100,    0,  15, 20, 0),
(16577, 8952,   100,    0,  15, 20, 0),
(16577, 12008,  100,    1,  -12008, 2,  0),
(16577, 12015,  100,    2,  -12015, 1,  0),
(16577, 12016,  100,    3,  -12016, 1,  0),
(16577, 12017,  100,    4,  -12017, 1,  0);
-- Update green loot reference
DELETE FROM `reference_loot_template` WHERE `entry` = 12008;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES
(12008, 13444,  0,  1,  2,  5,  0),
(12008, 13446,  0,  1,  2,  5,  0),
(12008, 18475,  0,  1,  1,  1,  0),
(12008, 18476,  0,  1,  1,  1,  0),
(12008, 18477,  0,  1,  1,  1,  0),
(12008, 18478,  0,  1,  1,  1,  0),
(12008, 18479,  0,  1,  1,  1,  0),
(12008, 18480,  0,  1,  1,  1,  0),
(12008, 18481,  0,  1,  1,  1,  0),
(12008, 18482,  0,  1,  1,  1,  0),
(12008, 18655,  0,  1,  1,  1,  0);
-- Tribute templates
-- Unsure whether loot is correctly removed if some bosses killed
-- Tribute run template 1
DELETE FROM `reference_loot_template` WHERE `entry` = 12015;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES
(12015, 18500,  0,  2,  1,  1,  0),
(12015, 18528,  0,  2,  1,  1,  0),
(12015, 18529,  0,  2,  1,  1,  0);
-- Tribute run template 2
DELETE FROM `reference_loot_template` WHERE `entry` = 12016;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES
(12016, 18499,  0,  3,  1,  1,  0),
(12016, 18530,  0,  3,  1,  1,  0),
(12016, 18531,  0,  3,  1,  1,  0),
(12016, 18532,  0,  3,  1,  1,  0);
-- Tribute run template 3
DELETE FROM `reference_loot_template` WHERE `entry` = 12017;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES
(12017, 18495,  0,  4,  1,  1,  0),
(12017, 18533,  0,  4,  1,  1,  0),
(12017, 18534,  0,  4,  1,  1,  0),
(12017, 18537,  0,  4,  1,  1,  0),
(12017, 18538,  1,  4,  1,  1,  0);
-- New Onyxia Loot Table
DELETE FROM `creature_loot_template` WHERE `entry` = 10184;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (10184, 17966, 100, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (10184, 18422, 100, 0, 1, 1, 2);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (10184, 18423, 100, 0, 1, 1, 3);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (10184, 18705, 40, 0, 1, 1, 72);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (10184, 21108, 100, 0, 1, 1, 9);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (10184, 34000, 100, 14, -34000, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (10184, 322536, 100, 1, -322536, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (10184, 322537, 100, 13, -322537, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (10184, 322538, 100, 3, -322538, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (10184, 322539, 100, 4, -322539, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (10184, 322540, 100, 5, -322540, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (10184, 322541, 100, 6, -322541, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (10184, 322542, 0, 7, -322542, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (10184, 322543, 0, 8, -322543, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (10184, 322544, 100, 9, -322544, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (10184, 322545, 100, 10, -322545, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (10184, 322546, 100, 11, -322546, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (10184, 330005, 100, 12, -330005, 1, 0);
-- New WB Loot Table
DELETE FROM creature_loot_template WHERE entry = 12397;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 1529, 2.4096, 0, 1, 2, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 3864, 1.2048, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 7909, 2.4096, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 7910, 2.4096, 0, 1, 2, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 7971, 1.2048, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 7976, 1.02, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 7991, 0.24, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 8028, 1.58, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 9297, 1.24, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 10605, 1.2, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 10608, 1.16, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 11224, 0.28, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 11226, 0.14, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 12361, 0.02, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 12364, 1.2048, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 12397, 100, 1, -12397, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 12398, 100, 1, -12398, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 12662, 62.6506, 0, 5, 8, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 12682, 1.9, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 12683, 3.94, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 12684, 2.4, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 12685, 0.92, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 12689, 3.1, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 12691, 3.06, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 12692, 1.8, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 12693, 1.2, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 12694, 0.7, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 12695, 0.78, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 12697, 0.6, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 12702, 0.18, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 12703, 0.14, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 12704, 1.08, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 12711, 0.29, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 12713, 3.7, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 12716, 0.39, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 12717, 0.14, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 12720, 0.32, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 12728, 0.28, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 13486, 1.34, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 13487, 0.09, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 13488, 0.56, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 13489, 1.1, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 13490, 2.86, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 13492, 1.52, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 13493, 0.05, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 13518, 0.42, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 14256, 34.9398, 0, 5, 8, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 14466, 2.32, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 14467, 3.2, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 14470, 2.12, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 14474, 3.46, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 14478, 2.5, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 14479, 4.02, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 14484, 2.92, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 14489, 3.28, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 14491, 1.98, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 14492, 0.78, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 14494, 1.66, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 14496, 1.38, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 14497, 0.23, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 14498, 2.58, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 14499, 0.78, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 14501, 0.56, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 14504, 2.4, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 14506, 1.72, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 14507, 0.39, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 14508, 3.6, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 14509, 0.11, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 14510, 0.15, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 14511, 0.29, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 15731, 1.2, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 15737, 1.94, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 15743, 1.52, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 15745, 2.46, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 15746, 1.38, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 15755, 1.2, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 15757, 1.58, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 15765, 1.9, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 16043, 3.38, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 16044, 0.42, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 16051, 2.18, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 16055, 0.14, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 16215, 1.66, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 16218, 1.52, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 16220, 1.66, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 16245, 3, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 16251, 1.3, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 16253, 0.04, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 17413, 2.36, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 17414, 2.18, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 17682, 5.92, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 17683, 4.12, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 17962, 8.4337, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 17963, 12.0482, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 17964, 15.6627, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 17965, 1.2048, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 17969, 13.253, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 18600, 3.98, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 18665, 100, 0, 1, 1, 72);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 22393, 0.14, 0, 1, 1, 0);
DELETE FROM `reference_loot_template` WHERE `entry` = 12397;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 17112, 0, 1, 1, 1, 0);
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 18204, 0, 1, 1, 1, 0);
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 18543, 0, 1, 1, 1, 0);
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 18546, 0, 1, 1, 1, 0);
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12397, 19133, 0, 1, 1, 1, 0);
DELETE FROM `creature_loot_template` WHERE `entry` = 6109;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (6109, 18704, 100, 0, 1, 1, 72);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (6109, 315709, 100, 1, -315709, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (6109, 315710, 100, 2, -315710, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (6109, 315715, 100, 7, -315715, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (6109, 315716, 100, 8, -315716, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (6109, 315717, 100, 9, -315717, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (6109, 315718, 100, 10, -315718, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (6109, 315719, 100, 11, -315719, 1, 0);
-- Molten Core Loot
DELETE FROM `creature_loot_template` WHERE `entry` IN (12118, 11982, 12259, 12057, 12264, 12056, 11988, 12098, 12018, 11502);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (11502, 7078, 40, 0, 1, 9, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (11502, 17204, 3, 0, 1, 1, 72);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (11502, 19017, -100, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (11502, 21110, 100, 0, 1, 1, 9);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (11502, 324922, 0, 1, -324922, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (11502, 324923, 100, 2, -324923, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (11502, 324924, 0, 3, -324924, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (11502, 324925, 100, 4, -324925, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (11502, 324926, 0, 5, -324926, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (11502, 324927, 0, 6, -324927, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (11502, 330000, 100, 7, -330000, 2, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (11502, 330001, 100, 8, -330001, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (11502, 330096, 100, 9, -330096, 2, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (11502, 936302, 100, 10, -936302, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (11502, 936303, 100, 11, -936303, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (11982, 34011, 1, 1, -34011, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (11982, 326150, 100, 2, -326150, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (11982, 326151, 100, 3, -326151, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (11982, 326152, 100, 4, -326152, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (11988, 7075, 30, 0, 1, 3, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (11988, 7076, 40, 0, 1, 2, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (11988, 7077, 30, 0, 1, 3, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (11988, 7078, 40, 0, 1, 2, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (11988, 17011, 14, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (11988, 17203, 20, 0, 1, 1, 72);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (11988, 34011, 1, 1, -34011, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (11988, 326156, 100, 2, -326156, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (11988, 326157, 100, 3, -326157, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (11988, 326158, 100, 4, -326158, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12056, 4787, 40, 0, 1, 5, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12056, 7068, 30, 0, 1, 6, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12056, 7077, 30, 0, 1, 3, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12056, 7078, 50, 0, 1, 2, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12056, 17010, 14, 0, 1, 1, 0);
-- Bindings of the Windseeker (1.6) INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12056, 18563, 3, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12056, 34011, 1, 1, -34011, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12056, 326259, 100, 2, -326259, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12056, 326260, 100, 3, -326260, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12056, 326261, 100, 4, -326261, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12057, 7075, 30, 0, 1, 3, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12057, 7076, 40, 0, 1, 2, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12057, 8150, 30, 0, 1, 12, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12057, 17011, 14, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12057, 17782, 0, 0, 1, 1, 74);
-- Bindings of the Windseeker (1.6) INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12057, 18564, 3, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12057, 34011, 1, 1, -34011, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12057, 326262, 100, 2, -326262, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12057, 326263, 100, 3, -326263, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12057, 326264, 100, 4, -326264, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12098, 7068, 30, 0, 1, 6, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12098, 7077, 30, 0, 1, 3, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12098, 7078, 40, 0, 1, 2, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12098, 17330, -100, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12098, 326276, 100, 1, -326276, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12098, 326277, 100, 2, -326277, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12118, 7068, 30, 0, 1, 6, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12118, 7077, 30, 0, 1, 3, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12118, 7078, 40, 0, 1, 2, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12118, 16665, 100, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12118, 17329, -100, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12118, 34011, 1, 1, -34011, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12118, 326299, 100, 2, -326299, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12118, 330007, 100, 3, -330007, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12259, 7068, 30, 0, 1, 6, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12259, 7077, 30, 0, 1, 3, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12259, 7078, 40, 0, 1, 2, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12259, 17331, -100, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12259, 34011, 1, 1, -34011, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12259, 326586, 100, 2, -326586, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12259, 326587, 100, 3, -326587, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12264, 7068, 30, 0, 1, 6, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12264, 7077, 30, 0, 1, 3, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12264, 7078, 40, 0, 1, 2, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12264, 17332, -100, 0, 1, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12264, 34011, 1, 1, -34011, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12264, 326605, 100, 2, -326605, 1, 0);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (12264, 326606, 100, 3, -326606, 1, 0);

-- Add new available items 

	-- Molten Core / Sholomance / Stratholme Items
DELETE FROM `item_template` WHERE `entry` IN (19145, 19146, 19136, 19144, 19143, 19142, 19019, 18713, 18715, 18806, 18812, 18809, 19137, 18716, 18735, 18726, 18723, 18692);
INSERT INTO item_template VALUES
('18692', '4', '4', 'Death Knight Sabatons', '31133', '3', '0', '1', '71877', '14375', '8', '-1', '-1', '59', '54', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '4', '11', '7', '11', '5', '11', '6', '9', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '424', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '65', '0', '0', '0', '', '48', '0', '0', '0', '0', '0', '1'),
('18713', '2', '2', 'Rhok\'delar, Longbow of the Ancient Keepers', '31338', '4', '32768', '1', '0', '0', '15', '4', '-1', '75', '60', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '89', '166', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2900', '2', '100', '7597', '1', '0', '0', '-1', '0', '-1', '21432', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '-1', '1', '', '0', '0', '0', '0', '0', '2', '0', '0', '0', '0', '90', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '1'),
('18715', '2', '10', 'Lok\'delar, Stave of the Ancient Keepers', '31163', '4', '32768', '1', '0', '0', '17', '4', '-1', '75', '60', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '7', '26', '5', '15', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '187', '282', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '10', '0', '0', '0', '3200', '0', '0', '7598', '1', '0', '0', '-1', '0', '-1', '14097', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0', '120', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '1'),
('18716', '4', '2', 'Ash Covered Boots', '31166', '3', '0', '1', '93277', '18655', '8', '-1', '-1', '61', '56', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '3', '13', '7', '13', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '118', '0', '0', '0', '0', '0', '0', '0', '0', '0', '13669', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '8', '0', '0', '0', '0', '50', '0', '0', '0', '', '49', '0', '0', '0', '0', '0', '1'),
('18723', '4', '0', 'Animated Chain Necklace', '6539', '3', '0', '1', '167814', '41953', '2', '-1', '-1', '62', '57', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '7', '7', '6', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '9318', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '49', '0', '0', '0', '0', '0', '1'),
('18726', '4', '2', 'Magistrate\'s Cuffs', '31175', '3', '0', '1', '56480', '11296', '9', '-1', '-1', '59', '54', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '7', '15', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '73', '0', '0', '0', '0', '0', '0', '0', '0', '0', '21362', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '8', '0', '0', '0', '0', '35', '0', '0', '0', '', '48', '0', '0', '0', '0', '0', '1'),
('18735', '4', '1', 'Maleki\'s Footwraps', '31188', '3', '0', '1', '86266', '17253', '8', '-1', '-1', '62', '57', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '7', '9', '5', '9', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '60', '0', '0', '0', '0', '0', '0', '0', '0', '0', '18009', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '40', '0', '0', '0', '', '49', '0', '0', '0', '0', '0', '1'),
('18806', '4', '4', 'Core Forged Greaves', '31271', '4', '0', '1', '168806', '33761', '8', '-1', '-1', '70', '60', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '7', '28', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '634', '0', '12', '0', '0', '8', '0', '0', '0', '0', '7517', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '75', '0', '0', '0', '', '65', '0', '0', '0', '0', '0', '1'),
('18809', '4', '1', 'Sash of Whispered Secrets', '31278', '4', '0', '1', '108057', '21611', '6', '-1', '-1', '71', '60', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '7', '20', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '61', '0', '0', '0', '0', '0', '0', '0', '0', '0', '18013', '1', '0', '0', '-1', '0', '-1', '21599', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '35', '0', '0', '0', '', '65', '0', '0', '0', '0', '0', '1'),
('18812', '4', '3', 'Wristguards of True Flight', '31280', '4', '0', '1', '162290', '32458', '9', '-1', '-1', '71', '60', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '3', '19', '7', '11', '5', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '198', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15464', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '5', '0', '0', '0', '0', '50', '0', '0', '0', '', '65', '0', '0', '0', '0', '0', '1'),
('19019', '2', '7', 'Thunderfury, Blessed Blade of the Windseeker', '30606', '5', '0', '1', '615704', '123140', '13', '-1', '-1', '80', '60', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '3', '5', '7', '8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '44', '115', '0', '16', '30', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '8', '9', '0', '0', '0', '1900', '0', '0', '21992', '2', '0', '5.52', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '125', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '1'),
('19136', '4', '1', 'Mana Igniting Cord', '31653', '4', '0', '1', '111403', '22280', '6', '-1', '-1', '71', '60', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '5', '16', '7', '12', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '61', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15715', '1', '0', '0', '-1', '0', '-1', '18384', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '35', '0', '0', '0', '', '65', '0', '0', '0', '0', '0', '1'),
('19137', '4', '4', 'Onslaught Girdle', '31654', '4', '0', '1', '157346', '31469', '6', '-1', '-1', '78', '60', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '4', '31', '7', '11', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '494', '0', '0', '0', '0', '0', '0', '0', '0', '0', '7597', '1', '0', '0', '-1', '0', '-1', '15464', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '55', '0', '0', '0', '', '65', '0', '0', '0', '0', '0', '1'),
('19142', '4', '0', 'Fire Runed Grimoire', '23321', '4', '0', '1', '75615', '18903', '23', '-1', '-1', '70', '60', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '5', '21', '7', '12', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '9416', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '8', '0', '0', '0', '0', '0', '0', '0', '0', '', '65', '0', '0', '0', '0', '0', '1'),
('19143', '4', '4', 'Flameguard Gauntlets', '31660', '4', '0', '1', '106417', '21283', '10', '-1', '-1', '69', '60', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '7', '13', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '488', '0', '0', '0', '0', '0', '0', '0', '0', '0', '7597', '1', '0', '0', '-1', '0', '-1', '15813', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '55', '0', '0', '0', '', '65', '0', '0', '0', '0', '0', '1'),
('19144', '4', '3', 'Sabatons of the Flamewalker', '31662', '4', '0', '1', '229869', '45973', '8', '-1', '-1', '68', '60', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '7', '27', '5', '11', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '298', '0', '0', '0', '0', '0', '0', '0', '0', '0', '9336', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '5', '0', '0', '0', '0', '70', '0', '0', '0', '', '65', '0', '0', '0', '0', '0', '1'),
('19145', '4', '1', 'Robe of Volatile Power', '31663', '4', '0', '1', '185169', '37033', '20', '-1', '-1', '66', '60', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '5', '15', '7', '10', '6', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '102', '0', '0', '0', '0', '0', '0', '0', '0', '0', '18382', '1', '0', '0', '-1', '0', '-1', '14047', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '100', '0', '0', '0', '', '65', '0', '0', '0', '0', '0', '1'),
('19146', '4', '2', 'Wristguards of Stability', '6763', '4', '0', '1', '100919', '20183', '9', '-1', '-1', '65', '60', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '4', '24', '7', '8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '86', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0', '0', '0', '8', '0', '0', '0', '0', '40', '0', '0', '0', '', '65', '0', '0', '0', '0', '0', '1');
	
-- Enable / Update new available vendors	

	-- Replace Pre-1.4 Mounts, I guess...
delete from npc_vendor where entry IN (4731, 3685, 3362, 7952, 384, 4885, 2357, 1460, 1261, 4730, 7955);
delete from npc_vendor where item IN (15293, 15292, 12330, 12351, 8586, 13317, 12353, 12353, 12354, 13328, 13329, 12302, 12303, 13326, 13327);
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('384','2411','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('384','2414','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('384','5655','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('384','5656','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('384','18776','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('384','18777','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('384','18778','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('1261','5864','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('1261','5872','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('1261','5873','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('1261','18785','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('1261','18786','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('1261','18787','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('1460','2411','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('1460','2414','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('1460','5655','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('1460','5656','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('1460','18776','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('1460','18777','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('1460','18778','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('2357','2414','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('2357','5655','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('2357','5656','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('2357','18776','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('2357','18777','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('2357','18778','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('3362','1132','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('3362','5665','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('3362','5668','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('3362','18796','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('3362','18797','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('3362','18798','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('3685','15277','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('3685','15290','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('3685','18793','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('3685','18794','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('3685','18795','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('4730','8629','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('4730','8631','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('4730','8632','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('4730','18766','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('4730','18767','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('4730','18902','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('4885','2414','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('4885','5655','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('4885','5656','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('4885','18776','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('4885','18777','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('4885','18778','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('7952','8588','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('7952','8591','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('7952','8592','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('7952','18788','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('7952','18789','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('7952','18790','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('7955','8563','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('7955','8595','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('7955','13321','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('7955','13322','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('7955','18772','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('7955','18773','0','0');
insert into `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) values('7955','18774','0','0');

-- Enable available game events 

UPDATE `game_event` SET `disabled` = 0 WHERE `entry` IN
(
13,					-- Elemental Invasion 1.5
16, 38, 39,			-- Gurubashi Arena 1.5
18,					-- Call to arms: Alterac Valley 1.5
162					-- Patch 1.4 | 1.5
);

-- Enable available spells
	-- Enable Warlock Dreadsteed & Paladin Charger spells
DELETE FROM `spell_disabled` WHERE `entry` IN (23214, 23161);


-- Forbidden Items (temp)

CREATE TEMPORARY TABLE forbidden_items (entry mediumint);
	-- Dark Iron Boots, 1.8 Specific Recipes
REPLACE INTO forbidden_items SELECT entry FROM item_template WHERE entry IN (20040, 20382, 20509, 20511, 20508, 20507, 20510, 20506);

-- *_loot_template final cleanup

DELETE FROM creature_loot_template WHERE item IN (SELECT * FROM forbidden_items);
DELETE FROM reference_loot_template WHERE item IN (SELECT * FROM forbidden_items);
DELETE FROM disenchant_loot_template WHERE item IN (SELECT * FROM forbidden_items);
DELETE FROM fishing_loot_template WHERE item IN (SELECT * FROM forbidden_items);
DELETE FROM gameobject_loot_template WHERE item IN (SELECT * FROM forbidden_items);
DELETE FROM item_loot_template WHERE item IN (SELECT * FROM forbidden_items);
DELETE FROM mail_loot_template WHERE item IN (SELECT * FROM forbidden_items);
DELETE FROM pickpocketing_loot_template WHERE item IN (SELECT * FROM forbidden_items);
DELETE FROM skinning_loot_template WHERE item IN (SELECT * FROM forbidden_items);
DELETE FROM npc_vendor WHERE item IN (SELECT * FROM forbidden_items);

