
-- !!! BULLSHIT TO BE FIXED ASAP! Pre-1.04 Old Mounts (to be reviewed, not sure it's right at all)

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

-- Dwarf
update creature set modelid=0 where id in (14546,14548,14547);
update creature set id=4780 where id=14546;
update creature set id=4778 where id=14548;

-- Elf
update creature set modelid=0 where id in (14556,14555,14602);
update creature set id=10322 where id=14556;
update creature set id=7322 where id=14555;

-- Gnome
update creature set modelid=0 where id in (14551,14552,14553);
update creature set id=11150 where id=14551;
update creature set id=10179 where id=14552;

-- Tauren
update creature set modelid=0 where id in (14542,14549,14550);
update creature set id=12148 where id=14542;
update creature set id=12151 where id=14549;

-- Orc
update creature set modelid=0 where id in (14540,14539,14541);
update creature set id=4270 where id=14540;
update creature set id=359 where id=14539;

-- Troll
update creature set modelid=0 where id in (14545,14543,14544);
update creature set id=7704 where id=14545;
update creature set id=7706 where id=14543;

-- Undead
 -- Pre 1.4 Mount FIX
update creature_template set modelid_1=9695 where entry=10322;
update item_template set name="Reins of the Ancient Frostsaber" where entry=12302;

-- Remove NPCs
UPDATE creature SET spawnFlags = spawnFlags | 2 WHERE id IN (14559, 14547, 14602, 14553, 14550, 14541, 14544, 14558);

-- Delete Post-1.04 mounts
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