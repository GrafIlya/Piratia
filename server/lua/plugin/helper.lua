print('Loading helper.lua')

_G["0"] = function () end

function getmaplist()
	local t = {}
	local fp = assert(io.open(GetResPath("/mapinfo.txt")))
	for line in fp:lines() do
		local position = string.find(line, "[ \t]*//")
		if (position ~= 1) then
			local data = split(line,"\t")
			t[tostring(data[3])] = tostring(data[2])
		end
	end
	return t
end