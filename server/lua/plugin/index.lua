ext = {}
ext.rootDir = GetResPath('../lua/plugin/')
ext.files =
{
	-- util / helper / initial files / handler
	'vars.lua',
	'chathandler.lua',
	'util.lua',
	'createitem.lua',
	'gsmod.lua',
	'packet.lua',
	'timer.lua',
	'timerfunc.lua',
	'helper.lua',
	'itempre.lua',
	'extNpc.lua',
	'StateHandler.lua',
	
	-- fixes
	'npcexploit.lua',
	'IGS.lua',
	
	-- system files
	'fairy.lua',
	'pet.lua',
	'gem.lua',
	--'combine.lua',
	'strengthen.lua',
	'skill.lua',
	'socket.lua',
	'exp.lua',
	'itemupgrade.lua',
	'cloakupgrade.lua',
	'follower.lua',
	'equips.lua',
	
	-- items
	'itemuse.lua',
	'nss.lua',
	'amplifier.lua', -- TODO
	'tickets.lua',
	'starunity.lua',
	'wings.lua',
	'goldstore.lua',
	'bagOfHolding.lua',
	
	-- pve / pvp
	'pve.lua',
	'make.lua',
	
	-- guild
	'guildvars.lua',
	'guildAttr.lua',
	'guildQuest.lua',
	'guildHouse.lua',
}

ext.unpack = function()
	for i = 1, table.getn(ext.files) do
		dofile(ext.rootDir..ext.files[i])
	end
end

-- &lua_all ext.unpack()
ext.unpack()