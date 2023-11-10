--[[
	Guild Quest System by Billy.
	questMaker controls creation of quests.
	MinReward/MaxReward are per mob, not total.
	Eg, count = 5, reward = 10, means quest is worth 50 exp  on completion.
	Quests do not need to be manually completed.

	todo:
		Different quests per level (min/max levels per quest)
		Weighted quests - good quests should be rarer.
		Weighted rewards - low/high should be rarer than medium
]]



lastGuildQuestSave = lastGuildQuestSave or 0
guildQuestSaveInterval = 300 -- 5 minutes
activeGuildQuest = activeGuildQuest or {}

guildDataFile = guildDataFile or DataFile:Init(GetResPath('../lua/plugin/guildData/quest.dat'),"activeGuildQuest")
local indexes = 0
for i,v in pairs(activeGuildQuest) do
	indexes = indexes + 1
end
if indexes == 0 then
	guildDataFile:Load()
end


questMaker ={
	--low lv argent/shai/ici mobs
	{MobID = 031, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 039, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 069, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 070, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 071, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 075, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 103, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 104, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 119, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 094, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 125, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 126, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 139, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 184, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 185, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 189, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 213, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 206, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 214, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 224, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 227, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 237, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 252, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 258, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 264, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 292, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 295, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	
	{MobID = 43, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 45, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 48, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 49, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 62, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 95, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 96, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 100, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 101, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 131, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 203, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 294, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 843, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 65, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 68, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 102, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 129, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 134, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 200, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 210, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 218, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 241, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 247, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 251, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 294, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 847, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	
	{MobID = 849, MinCount = 1, MaxCount = 5, MinReward = 12, MaxReward = 30,MaxLv = 3},
	{MobID = 290, MinCount = 1, MaxCount = 5, MinReward = 12, MaxReward = 30,MaxLv = 3},
	{MobID = 106, MinCount = 1, MaxCount = 5, MinReward = 12, MaxReward = 30,MaxLv = 3},
	
	{MobID = 232, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 216, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 222, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 233, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 234, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 235, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 238, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 239, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 240, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 32, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 34, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 46, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 51, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 79, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 83, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 130, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 137, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 138, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 142, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 143, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 193, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 214, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 228, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 255, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 256, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 265, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 266, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 281, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 293, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 842, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 844, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	{MobID = 845, MinCount = 50, MaxCount = 99, MinReward = 0.1, MaxReward = 1,MaxLv = 3},
	
	
	{MobID = 289, MinCount = 1, MaxCount = 4, MinReward = 30, MaxReward = 60,MaxLv = 7},
	
	--abandoned mine mobs
	{MobID = 253, MinCount = 50, MaxCount = 99, MinReward = 0.5, MaxReward = 3,MaxLv = 5},
	{MobID = 243, MinCount = 50, MaxCount = 99, MinReward = 0.5, MaxReward = 3,MaxLv = 5},
	{MobID = 88, MinCount = 50, MaxCount = 99, MinReward = 0.5, MaxReward = 3,MaxLv = 5},
	{MobID = 82, MinCount = 50, MaxCount = 99, MinReward = 0.5, MaxReward = 3,MaxLv = 5},
	{MobID = 37, MinCount = 50, MaxCount = 99, MinReward = 0.5, MaxReward = 3,MaxLv = 5},
	{MobID = 99, MinCount = 1, MaxCount = 1, MinReward = 10, MaxReward = 300,MaxLv = 5},
	
	--midlv arg mobs
	{MobID = 076, MinCount = 50, MaxCount = 99, MinReward = 0.5, MaxReward = 3,MinLv = 4,MaxLv = 11},
	{MobID = 085, MinCount = 50, MaxCount = 99, MinReward = 0.5, MaxReward = 3,MinLv = 4,MaxLv = 11},
	{MobID = 107, MinCount = 50, MaxCount = 99, MinReward = 0.5, MaxReward = 3,MinLv = 4,MaxLv = 11},
	{MobID = 225, MinCount = 50, MaxCount = 99, MinReward = 0.5, MaxReward = 3,MinLv = 4,MaxLv = 11},
	{MobID = 298, MinCount = 50, MaxCount = 99, MinReward = 0.5, MaxReward = 3,MinLv = 4,MaxLv = 11},
	{MobID = 299, MinCount = 50, MaxCount = 99, MinReward = 0.5, MaxReward = 3,MinLv = 4,MaxLv = 11},
	{MobID = 064, MinCount = 50, MaxCount = 99, MinReward = 0.5, MaxReward = 3,MinLv = 4,MaxLv = 11},
	{MobID = 080, MinCount = 50, MaxCount = 99, MinReward = 0.5, MaxReward = 3,MinLv = 4,MaxLv = 11},
	{MobID = 086, MinCount = 50, MaxCount = 99, MinReward = 0.5, MaxReward = 3,MinLv = 4,MaxLv = 11},
	{MobID = 093, MinCount = 50, MaxCount = 99, MinReward = 0.5, MaxReward = 3,MinLv = 4,MaxLv = 11},
	{MobID = 127, MinCount = 50, MaxCount = 99, MinReward = 0.5, MaxReward = 3,MinLv = 4,MaxLv = 11},
	{MobID = 128, MinCount = 50, MaxCount = 99, MinReward = 0.5, MaxReward = 3,MinLv = 4,MaxLv = 11},
	{MobID = 135, MinCount = 50, MaxCount = 99, MinReward = 0.5, MaxReward = 3,MinLv = 4,MaxLv = 11},
	{MobID = 136, MinCount = 50, MaxCount = 99, MinReward = 0.5, MaxReward = 3,MinLv = 4,MaxLv = 11},
	{MobID = 139, MinCount = 50, MaxCount = 99, MinReward = 0.5, MaxReward = 3,MinLv = 4,MaxLv = 11},
	{MobID = 140, MinCount = 50, MaxCount = 99, MinReward = 0.5, MaxReward = 3,MinLv = 4,MaxLv = 11},
	{MobID = 204, MinCount = 50, MaxCount = 99, MinReward = 0.5, MaxReward = 3,MinLv = 4,MaxLv = 11},
	{MobID = 248, MinCount = 50, MaxCount = 99, MinReward = 0.5, MaxReward = 3,MinLv = 4,MaxLv = 11},
	{MobID = 249, MinCount = 50, MaxCount = 99, MinReward = 0.5, MaxReward = 3,MinLv = 4,MaxLv = 11},
	{MobID = 271, MinCount = 50, MaxCount = 99, MinReward = 0.5, MaxReward = 3,MinLv = 4,MaxLv = 11},
	{MobID = 277, MinCount = 50, MaxCount = 99, MinReward = 0.5, MaxReward = 3,MinLv = 4,MaxLv = 11},
	{MobID = 299, MinCount = 50, MaxCount = 99, MinReward = 0.5, MaxReward = 3,MinLv = 4,MaxLv = 11},
	{MobID = 500, MinCount = 50, MaxCount = 99, MinReward = 0.5, MaxReward = 3,MinLv = 4,MaxLv = 11},
	
	--50+ arg mobs
	{MobID = 205, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 055, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 066, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 067, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 197, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 212, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 245, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 518, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 519, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 520, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 543, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 547, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 566, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 567, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 568, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 038, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 041, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 042, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 052, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 086, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 201, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 202, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 205, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 248, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 249, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 250, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 261, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 267, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 284, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 503, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 505, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 508, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 511, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 513, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 514, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 515, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 521, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 522, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 541, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 546, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 549, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 565, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	{MobID = 666, MinCount = 50, MaxCount = 99, MinReward = 1, MaxReward = 4,MinLv = 7, MaxLv = 15},
	
	--higher lv ici mobs (30-40ish)
	{MobID = 296, MinCount = 30, MaxCount = 99, MinReward = 2, MaxReward = 5,MinLv = 3, MaxLv = 7},
	{MobID = 259, MinCount = 30, MaxCount = 99, MinReward = 2, MaxReward = 5,MinLv = 3, MaxLv = 7},
	{MobID = 257, MinCount = 30, MaxCount = 99, MinReward = 2, MaxReward = 5,MinLv = 3, MaxLv = 7},
	{MobID = 296, MinCount = 30, MaxCount = 99, MinReward = 2, MaxReward = 5,MinLv = 3, MaxLv = 7},
	{MobID = 198, MinCount = 30, MaxCount = 99, MinReward = 2, MaxReward = 5,MinLv = 3, MaxLv = 7},
	{MobID = 098, MinCount = 30, MaxCount = 99, MinReward = 2, MaxReward = 5,MinLv = 3, MaxLv = 7},
	{MobID = 132, MinCount = 30, MaxCount = 99, MinReward = 2, MaxReward = 5,MinLv = 3, MaxLv = 7},
	{MobID = 133, MinCount = 30, MaxCount = 99, MinReward = 2, MaxReward = 5,MinLv = 3, MaxLv = 7},
	{MobID = 137, MinCount = 30, MaxCount = 99, MinReward = 2, MaxReward = 5,MinLv = 3, MaxLv = 7},
	{MobID = 141, MinCount = 30, MaxCount = 99, MinReward = 2, MaxReward = 5,MinLv = 3, MaxLv = 7},
	{MobID = 142, MinCount = 30, MaxCount = 99, MinReward = 2, MaxReward = 5,MinLv = 3, MaxLv = 7},
	{MobID = 144, MinCount = 30, MaxCount = 99, MinReward = 2, MaxReward = 5,MinLv = 3, MaxLv = 7},
	{MobID = 194, MinCount = 30, MaxCount = 99, MinReward = 2, MaxReward = 5,MinLv = 3, MaxLv = 7},
	{MobID = 195, MinCount = 30, MaxCount = 99, MinReward = 2, MaxReward = 5,MinLv = 3, MaxLv = 7},
	{MobID = 268, MinCount = 30, MaxCount = 99, MinReward = 2, MaxReward = 5,MinLv = 3, MaxLv = 7},
	{MobID = 269, MinCount = 30, MaxCount = 99, MinReward = 2, MaxReward = 5,MinLv = 3, MaxLv = 7},
	{MobID = 270, MinCount = 30, MaxCount = 99, MinReward = 2, MaxReward = 5,MinLv = 3, MaxLv = 7},
	{MobID = 271, MinCount = 30, MaxCount = 99, MinReward = 2, MaxReward = 5,MinLv = 3, MaxLv = 7},
	{MobID = 272, MinCount = 30, MaxCount = 99, MinReward = 2, MaxReward = 5,MinLv = 3, MaxLv = 7},
	{MobID = 297, MinCount = 30, MaxCount = 99, MinReward = 2, MaxReward = 5,MinLv = 3, MaxLv = 7},
	{MobID = 500, MinCount = 30, MaxCount = 99, MinReward = 2, MaxReward = 5,MinLv = 3, MaxLv = 7},
	{MobID = 501, MinCount = 30, MaxCount = 99, MinReward = 2, MaxReward = 5,MinLv = 3, MaxLv = 7},
	{MobID = 502, MinCount = 30, MaxCount = 99, MinReward = 2, MaxReward = 5,MinLv = 3, MaxLv = 7},
	{MobID = 504, MinCount = 30, MaxCount = 99, MinReward = 2, MaxReward = 5,MinLv = 3, MaxLv = 7},
	{MobID = 516, MinCount = 30, MaxCount = 99, MinReward = 2, MaxReward = 5,MinLv = 3, MaxLv = 7},
	{MobID = 517, MinCount = 30, MaxCount = 99, MinReward = 2, MaxReward = 5,MinLv = 3, MaxLv = 7},
	{MobID = 530, MinCount = 30, MaxCount = 99, MinReward = 2, MaxReward = 5,MinLv = 3, MaxLv = 7},

	--50+ ici mobs
	{MobID = 196, MinCount = 30, MaxCount = 99, MinReward = 2, MaxReward = 5,MinLv = 5, MaxLv = 20},
	{MobID = 244, MinCount = 30, MaxCount = 99, MinReward = 2, MaxReward = 5,MinLv = 5, MaxLv = 20},
	{MobID = 272, MinCount = 30, MaxCount = 99, MinReward = 2, MaxReward = 5,MinLv = 5, MaxLv = 20},
	{MobID = 506, MinCount = 30, MaxCount = 99, MinReward = 2, MaxReward = 5,MinLv = 5, MaxLv = 20},
	{MobID = 511, MinCount = 30, MaxCount = 99, MinReward = 2, MaxReward = 5,MinLv = 5, MaxLv = 20},
	{MobID = 544, MinCount = 30, MaxCount = 99, MinReward = 2, MaxReward = 5,MinLv = 5, MaxLv = 20},

	--summer mobs
	{MobID = 528, MinCount = 10, MaxCount = 99, MinReward = 7, MaxReward = 20,MinLv = 15},
	{MobID = 548, MinCount = 10, MaxCount = 99, MinReward = 7, MaxReward = 20,MinLv = 15},
	{MobID = 551, MinCount = 10, MaxCount = 99, MinReward = 7, MaxReward = 20,MinLv = 15},
	{MobID = 552, MinCount = 10, MaxCount = 99, MinReward = 7, MaxReward = 20,MinLv = 15},
	{MobID = 787, MinCount = 10, MaxCount = 99, MinReward = 7, MaxReward = 20,MinLv = 15},
	
	--autumn mobs
	{MobID = 734, MinCount = 10, MaxCount = 99, MinReward = 5, MaxReward = 17,MinLv = 13},
	{MobID = 735, MinCount = 10, MaxCount = 99, MinReward = 5, MaxReward = 17,MinLv = 13},
	{MobID = 736, MinCount = 10, MaxCount = 99, MinReward = 5, MaxReward = 17,MinLv = 13},
	
	--spring mobs
	{MobID = 748, MinCount = 10, MaxCount = 99, MinReward = 3, MaxReward = 12,MinLv = 11},
	{MobID = 761, MinCount = 10, MaxCount = 99, MinReward = 3, MaxReward = 12,MinLv = 11},
	{MobID = 736, MinCount = 10, MaxCount = 99, MinReward = 3, MaxReward = 12,MinLv = 11},
	
	--DW mobs
	{MobID = 669, MinCount = 30, MaxCount = 99, MinReward = 1, MaxReward = 8,MinLv = 10},
	{MobID = 670, MinCount = 30, MaxCount = 99, MinReward = 1, MaxReward = 8,MinLv = 10},
	{MobID = 671, MinCount = 30, MaxCount = 99, MinReward = 1, MaxReward = 8,MinLv = 10},
	{MobID = 672, MinCount = 30, MaxCount = 99, MinReward = 1, MaxReward = 8,MinLv = 10},
	{MobID = 678, MinCount = 30, MaxCount = 99, MinReward = 1, MaxReward = 8,MinLv = 10},
	{MobID = 725, MinCount = 30, MaxCount = 99, MinReward = 1, MaxReward = 8,MinLv = 10},
	{MobID = 726, MinCount = 30, MaxCount = 99, MinReward = 1, MaxReward = 8,MinLv = 10},
	
	--bd mobs quest (low)
	{MobID = 883, MinCount = 1, MaxCount = 10, MinReward = 45, MaxReward = 150,MinLv = 11},
	{MobID = 884, MinCount = 1, MaxCount = 10, MinReward = 45, MaxReward = 150,MinLv = 11},
	{MobID = 885, MinCount = 1, MaxCount = 10, MinReward = 45, MaxReward = 150,MinLv = 11},
	{MobID = 886, MinCount = 1, MaxCount = 10, MinReward = 45, MaxReward = 150,MinLv = 11},
	
	--dw boss
	{MobID = 679, MinCount = 1, MaxCount = 5, MinReward = 100, MaxReward = 600,MinLv = 10},
	{MobID = 678, MinCount = 1, MaxCount = 5, MinReward = 100, MaxReward = 600,MinLv = 10},
	
}

questStrings = {
	"A &adj &nou",
	"The &adj &nou",
	"A Very &adj &nou",
	"The Very &adj &nou",
	"The Most &adj &nou",
	"A Most &adj &nou",
	"&nou of the &adj",
	"&nou of  &adj",
	"&adj &nou",
	"&nou &adj",
	"The &nou of &adj",
	"A &nou of &adj",
}

questNouns = {
	"Quest",
	"Challenge",
	"Trial",
	"Tribulation",
	"Conquest",
	"Battle",
	"War",
	"Pilgrimage",
	"Hunt",
	"Mission",
	"Journey",
	"Enterprise",
	"Crusade",
	"Chase",
	"Expedition",
	"Voyage",
	"Pursuit",
	"Delving",
	"Inquisition",
	"Pursual",
	"Raid",
	"Exploration",
	"Prosecution",
	"Execution",
	"Rampage",
	"Game",
	"Reconnaissance",
	"Snooping",
	"Struggle",
}

questAdjectives = {
	"Hard",
	"Easy",
	"Challenging",
	"Boring",
	"Confusing",
	"Tedious",
	"Very Hard",
	"Lonely",
	"Glorious",
	"Mythical",
	"Deathly",
	"Sacred",
	"Noble",
	"Painless",
	"Painful",
	"Effortless",
	"Obvious",
	"Complicated",
	"Complex",
	"Simple",
	"Apparent",
	"Basic",
	"Elementary",
	"Little",
	"Manageable",
	"Plain",
	"Royal",
	"Difficult",
	"Ambitious",
	"Burdensome",
	"Crucial",
	"Demanding",
	"Onerous",
	"Honorable",
	"Immense",
	"Titanic",
	"Lifeless",
	"Stale",
	"Stodgy",
	"Stuffy",
	"Stupid",
	"Dumb",
	"Tame",
	"Tiresome",
	"Tiring",
	"Uninteresting",
	"Legend",
	
}


if not Lua_All then
	function Lua_All(cmd,role)
		local packet = GetPacket()
		WriteCmd( packet, 4015 )
		WriteDword( packet, 0 )
		WriteString(packet,cmd)
		SendPacket( role, packet )
	end
end


function SaveGuildQuests(role,forceSave)
	if forceSave or lastGuildQuestSave + guildQuestSaveInterval <= os.time() then
		local cmd = [[lastGuildQuestSave = os.time()]]
		Lua_All(cmd,role)
		guildDataFile:Save()
	end
end

function GenerateQuestTitle()
	local title = questStrings[math.random(1,#questStrings)]
	title = title:gsub("&nou",questNouns[math.random(1,#questNouns)])
	title = title:gsub("&adj",questAdjectives[math.random(1,#questAdjectives)])
	return title
end

function GetNewQuestID(guildID)
	local tab = {}
	local lv = GetGuildLevel(guildID)
	for i,v in pairs(questMaker) do
		if(not v.MaxLv or v.MaxLv>= lv ) and (not v.MinLv or v.MinLv<= lv ) then
			tab[#tab+1] = v
			tab[#tab].index = i
		end
	end

	return tab[math.random(1,#tab)].index
end

function NewGuildQuest(role,index)
	local guildID = GetChaGuildID(role)
	if not activeGuildQuest[guildID] then
		activeGuildQuest[guildID] = {}
	end
	local quest = GetNewQuestID(guildID)
	local count = math.random(questMaker[quest].MinCount,questMaker[quest].MaxCount)
	local reward = math.random(math.ceil(questMaker[quest].MinReward*1000),math.ceil(questMaker[quest].MaxReward*1000))/1000
	local rewardTotal = math.ceil(reward*count)
	local title = GenerateQuestTitle()
	local cmd = string.format([[
		SyncNewGuildQuest(%d,%d,%d,%d,%d,"%s")
	]],guildID,index,questMaker[quest].MobID,count,rewardTotal,title)
	
	Lua_All(cmd,role)
	SyncNewGuildQuest(guildID,index,questMaker[quest].MobID,count,rewardTotal,title)
	SaveGuildQuests(role,true)
end

function SyncNewGuildQuest(guildID,index,mob,count,reward,title)
	if not activeGuildQuest[guildID] then
		activeGuildQuest[guildID] = {}
	end
	activeGuildQuest[guildID][index] = {
		Mob = mob,
		Required = count,
		Current = 0,
		RewardExp = reward,
		Title = title,
	}
	DealAllInGuild(guildID,"SyncGuildQuests")
end

function InitGuildQuests(role)
	for i = 1,3 do 
		NewGuildQuest(role,i)
	end
end

function SyncGuildQuests(role)
	local guildID = GetChaGuildID(role)
	if guildID == 0 then
		return
	end
	
	if not activeGuildQuest[guildID] then
		InitGuildQuests(role)
		return
	end
	
	local pkt = GetPacket()
	WriteCmd(pkt,894) 
	
	for i = 1,3 do
		if activeGuildQuest[guildID][i] then
			WriteDword(pkt,activeGuildQuest[guildID][i].Mob)
			WriteDword(pkt,activeGuildQuest[guildID][i].Required)
			WriteDword(pkt,activeGuildQuest[guildID][i].Current)
			WriteDword(pkt,activeGuildQuest[guildID][i].RewardExp)
			WriteString(pkt,activeGuildQuest[guildID][i].Title)
		else
			return
		end
	end
	
	SendPacket( role, pkt )
end


function CompleteGuildQuest(role, index)
	local guildID = GetChaGuildID(role)
	AddGuildExp(role,activeGuildQuest[guildID][index].RewardExp)
	
	local cmd = string.format([[DealAllInGuild(%d,"BickerNotice","Guild Quest - [%s] Completed! Guild gained [%d] EXP!")]],guildID,activeGuildQuest[guildID][index].Title,activeGuildQuest[guildID][index].RewardExp)
	Lua_All(cmd,role)
	
	NewGuildQuest(role,index)
	
end

function CompleteGuildQuestNotice(role,index)
	local index = tonumber(index)
	local guildID = GetChaGuildID(role)
	BickerNotice(role,string.format("Guild Quest - [%s] Completed! Guild gained [%d] EXP!",activeGuildQuest[guildID][index].Title,activeGuildQuest[guildID][index].RewardExp))
end

function IncrementGuildQuestCurrent(role,index)
	local guildID = GetChaGuildID(role)
	local cmd = string.format([[
		activeGuildQuest[%d][%d].Current = activeGuildQuest[%d][%d].Current + 1
		DealAllInGuild(%d,"SyncGuildQuests")
	]],guildID,index,guildID,index,guildID)
	Lua_All(cmd,role)
	SaveGuildQuests(role)
end

function CheckGuildQuests(role,mobID)
	local guildID = GetChaGuildID(role)
	if not activeGuildQuest[guildID] then
		return
	end
	for i,v in ipairs(activeGuildQuest[guildID]) do
		if v.Mob == mobID then
			if v.Current+1 >= v.Required then
				CompleteGuildQuest(role,i)
			else
				IncrementGuildQuestCurrent(role,i)
			end
		end
	end
end

function ReloadGuildQuest(role)
	role = role or GetPlayerByName("pppp")
	NewGuildQuest(role,1)
	NewGuildQuest(role,2)
	NewGuildQuest(role,3)
end
