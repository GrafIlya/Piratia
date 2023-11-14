
function config_entry(entry)
  SetMapEntryEntiID(entry, 2492, 1)
end 

function after_create_entry(entry) 
  local copy_mgr = GetMapEntryCopyObj(entry, 0)
  local EntryName = chaospk.entry['mapName']
  SetMapEntryEventName(entry, EntryName)
  map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --
  Notice("Announcement: According to reports, lower Icicle Castle at ["..posx..","..posy.."] appears a portal to "..EntryName..". Please check it out.")
end