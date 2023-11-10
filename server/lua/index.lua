print( "Loading Extension Files:" )
print( "------------------------------------" )

local ext = {}
ext.rootDir = GetResPath('../lua/')
ext.files =
{
	--'config.lua',
	'hook.lua',
	'datafile.lua',
	'serialize.lua',
	'plugin/index.lua',
	'tools/index.lua',
	'miscript/index.lua',
	'map/setup.lua', -- just for hook
	--'tools/index.lua',
};

ext.unpack = function(thisDir)
	for i = 1, table.getn(ext.files) do
		dofile(ext.rootDir..ext.files[i])
	end
end

ext.unpack()