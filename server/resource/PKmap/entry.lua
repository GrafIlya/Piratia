function config_entry(entry) 
	SetMapEntryEntiID(entry, 193,1)
end

function after_create_entry(entry) 
	local copy_mgr = GetMapEntryCopyObj(entry, 0)
	local EntryName = "Arena Island"
	SetMapEntryEventName( entry, EntryName )
	map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry)
	Notice("Announcement: Map for Mass player kill has been opened!")
end