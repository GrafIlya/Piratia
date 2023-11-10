print('Loading monster.lua')

function SummonMonster(id, x, y)
	local r = math.random(0,360)
	CreateCha(id, x*100, y*100, r, 60)
end

local m = SetCurMap("garner")
if m == 1 then
	SummonMonster(75, 2149, 2758)
	SummonMonster(75, 2152, 2761)
	SummonMonster(75, 2150, 2745)
	SummonMonster(75, 2130, 2762)
end