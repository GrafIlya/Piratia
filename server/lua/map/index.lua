local ext = {}
ext.rootDir = GetResPath('../lua/map/')
ext.files =
{
	--'birth.lua',
	'ChaosArgent.lua',
	'monster.lua',
}

ext.unpack = function()
	for i = 1, table.getn(ext.files) do
		dofile(ext.rootDir..ext.files[i])
	end
end

function MapUtil()
	local t = getmaplist()
	for i,v in pairs(t) do
		if _G["after_enter_"..v] == nil then
			_G["after_enter_"..v] = function(role, map_copy) end
		end
		if _G["before_leave_"..v] == nil then
			_G["before_leave_"..v] = function(role) end
		end
		if _G["map_run_"..v] == nil then
			_G["map_run_"..v] = function(map_copy) end
		end
		if _G["map_copy_run_"..v] == nil then
			_G["map_copy_run_"..v] = function(map_copy) end
		end
		if _G["map_copy_run_special_"..v] == nil then
			_G["map_copy_run_special_"..v] = function (map_copy) end
		end
		if _G["get_map_entry_pos_"..v] == nil then
			_G["get_map_entry_pos_"..v] = function() end
		end
	end
end
MapUtil()

ext.unpack()

--dofile(GetResPath('../lua/plugin/antidupe.lua'))