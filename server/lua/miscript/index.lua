local ext = {}
ext.rootDir = GetResPath('../lua/miscript/')
ext.files =
{
	'npc.lua',
	--'betanpc.lua',
	'guildNpc.lua',
}

ext.unpack = function()
	for i = 1, table.getn(ext.files) do
		dofile(ext.rootDir..ext.files[i])
	end
end

-- &lua_all ext.unpack()
ext.unpack()