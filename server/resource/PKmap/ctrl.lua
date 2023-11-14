--print('Loading PKmap Ctrl.lua')

function config(map)
	MapCanSavePos(map, 0)
	MapCanPK(map, 1)
	MapCopyNum(map, 1)
	SingleMapCopyPlyNum(map, 80)
	MapCanTeam(map, 1)
	MapType(map, 4)
end
