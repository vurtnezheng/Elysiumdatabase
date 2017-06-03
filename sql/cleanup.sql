-- Cleanup
-- Run query to remove unsing triggers from DB
CREATE TEMPORARY TABLE active_quests (entry mediumint);
INSERT INTO active_quests (SELECT entry FROM quest_template WHERE !(Method & 1));

DELETE FROM areatrigger_involvedrelation WHERE quest NOT IN (SELECT * from active_quests);
DELETE FROM creature_involvedrelation WHERE quest NOT IN (SELECT * from active_quests);
DELETE FROM creature_questrelation WHERE quest NOT IN (SELECT * from active_quests);
DELETE FROM gameobject_involvedrelation WHERE quest NOT IN (SELECT * from active_quests);
DELETE FROM gameobject_questrelation WHERE quest NOT IN (SELECT * from active_quests);
-- Optional DELETE FROM quest_template WHERE quest NOT IN (SELECT * from active_quests);