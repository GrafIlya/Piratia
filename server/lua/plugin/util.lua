print('Loading util.lua')

function file_exists(name)
	local f = io.open(name, 'r')
	if(f ~= nil)then io.close(f) return true
	else return false
	end
end

function wrap(str, j, space)
	j,space = j or 40,space or '_'
	local h,s = 1,''
	local line = {}
	string.gsub(str, '(%s*)()(%S+)()',
	function(sp, st, word, fi)
		if (fi - h) > j then
			h = st
			table.insert(line, s)
			s = word
		else
			s = s..sp..word
		end
	end)
	if s ~= '' then table.insert(line, s) end
	local z = ''
	for i,v in pairs(line) do
		if i ~= table.getn(line) then v = v..space else v = v end
		z = z..v
	end
	return z
end

function split(str, delim, maxNb)
	if string.find(str, delim) == nil then return { str }; end
	if maxNb == nil or maxNb < 1 then maxNb = 0; end
	local result = {}
	local pat = "(.-)" .. delim .. "()"
	local nb = 0
	local lastPos
	for part, pos in string.gfind(str, pat) do
		nb = nb + 1
		result[nb] = part
		lastPos = pos
		if nb == maxNb then break end
	end
	if nb ~= maxNb then result[nb + 1] = string.sub(str, lastPos); end
	return result;
end

function filetoarray(file)
	if not file_exists(file) then
		local f = io.open(file, 'a')
		f:close();
	end
	local f = io.open(file, "r")
	local arr = {}
	for line in f:lines() do
		table.insert(arr, line)
	end
	return arr
end

function readall(file)
	local f = io.open(file, "rb")
	local content = f:read("*all")
	f:close()
	return content
end

function explode(separator, str)
	local pos, arr = 0, {}
	for st, sp in function() return string.find(str, separator, pos, true) end do
		table.insert(arr, string.sub(str, pos, st-1))
		pos = sp + 1
	end
	table.insert(arr, string.sub(str, pos))
	return arr
end

function round(val, idp)
	local calc = 10^(idp or 0)
	return math.floor(val * calc + 0.5) / calc
end

function paste(file, str)
	local index = filetoarray(file);
	local r = 0
	for i = 1, table.getn(index) do
		if index[i] ~= tostring(str) then
			r = r + 1;
		end
	end
	if r == table.getn(index) then 
		local f = io.open(file, 'a');
		f:write('\n');
		f:write(tostring(str));
		f:close();
	end
end

function tgetcount(tab)
	local count = 0
	for i,v in pairs(tab) do
		count = count + 1
	end
	return count
end

function create_dir(dirname)
	os.execute("mkdir "..dirname);
end

function unpack(t, i)
	i = i or 1
	if t[i] ~= nil then
		return t[i], unpack(t, i+1)
	end
end

function toclock(sec)
	local num = tonumber(sec)
	if(num == 0)then
		return "00:00:00"
	else
		now_hour = string.format("%02.f",math.floor(num / 3600 ))
		now_minute = string.format("%02.f",math.floor(num / 60 - (now_hour*60)))
		now_second = string.format("%02.f",math.floor(num - now_hour*3600 - now_minute*60))
		return now_hour..":"..now_minute..":"..now_second
	end
end

function loadctrl(map)
	local a = Every_5_minute
	Notice('Reloading...'..map..'/ctrl.lua')
	dofile(GetResPath(map..'/ctrl.lua'))
	if map == 'garner2' then
		Every_5_minute = a
	end
end

function loadentry(map)
	Notice('Reloading...'..map..'/entry.lua')
	dofile(GetResPath(map..'/entry.lua'))
end
