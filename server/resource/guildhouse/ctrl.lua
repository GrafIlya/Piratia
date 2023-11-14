
function config(map)
    MapCanSavePos(map, 0) --dont save, since save doesnt let you save which copy they are in.
	MapCanPK(map, 0)
    MapCopyNum(map, 200)
    MapCanTeam( map, 1 )
    MapType( map , 3 )
    --MapCopyStartType( map , 3 )
	
end

function init_entry(map)
	SetMapEntryTime(map, "2005/8/30/13/0", "0/0/0", "0/0/0", "0/0/0")
end

function map_copy_run_guildhouse(map_copy) 

end

function after_enter_guildhouse ( role , map_copy )
	showGuildObjects(role , map_copy)
end

function map_run_guildhouse()

end

function before_leave_guildhouse(role)
	if afterLeaveGuildHouse then
		afterLeaveGuildHouse(role)
	end
end

function map_copy_run_special_guildhouse()

end