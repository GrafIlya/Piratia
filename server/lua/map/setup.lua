-- ready the hooks to load map files at the end
local ext = {}
ext.rootDir = GetResPath('../lua/map/')
MAP_SETUP = MAP_SETUP or false

if not MAP_SETUP then
	--[[AddHelpNPCX = AddHelpNPC

	function AddHelpNPC(str)
		AddHelpNPCX(str)
		if str == "Drunkyard - Anthony" then
			dofile(ext.rootDir..'/index.lua')
		end
	end]]
	printx = print

	function print(...)
		arg = {...}
		printx(unpack(arg))
		if arg[1] == "Loading AddHelpNPC.lua" then
			dofile(ext.rootDir..'/index.lua')
		end
	end
	
	MAP_SETUP = true
end

local ext = {}
ext.rootDir = GetResPath('../lua/map/')
ext.files =
{
	'birth.lua',
}

ext.unpack = function()
	for i = 1, table.getn(ext.files) do
		dofile(ext.rootDir..ext.files[i])
	end
end

ext.unpack()