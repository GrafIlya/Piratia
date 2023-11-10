
function config(map)
  MapCanSavePos(map, chaospk.conf['saveSpawn']);
  MapCanPK(map, chaospk.conf['canPk']);
  MapCanTeam(map, chaospk.conf['canTeam']);
  MapType(map, chaospk.conf['mapType']);
  MapCopyNum(map, chaospk.conf['mapCopy']);
  SingleMapCopyPlyNum(map, chaospk.conf['chaAllow']);
  MapCanStall(map, chaospk.conf['canStall']);
end

function init_entry(map)
  SetMapEntryMapName(map, chaospk.pos['map'])
  SetMapEntryTime(map,
    '2013/07/12/0/0',
    '0/'..chaospk.entry['hoursOpen']..'/0',
    '0/0/'..chaospk.entry['closeTime'],
    '0/0/'..chaospk.entry['shutdown']
  )
end