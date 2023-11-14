_G['0'] = function () end

file_exists = file_exists or function(name)
	local f = io.open(name,"r")
	if(f ~= nil)then
		io.close(f)
		return true
	else
		return false
	end
end

if package ~= nil then
	local path = ";.\\lua\\luarock\\?.lua;.\\lua\\luarock\\?\\?.lua"
	local cpath = ";.\\lua\\luarock\\?.dll;.\\lua\\luarock\\?\\?.dll"
	if string.find(package.path,path) == nil then
		package.path = package.path .. path
	end
	if string.find(package.cpath,cpath) == nil then
		package.cpath = package.cpath .. cpath
	end
end

table.getn = function (t)
	if t.n then
		return t.n
	else
		local n = 0
		for i in pairs(t) do
			if type(i) == "number" then
				n = math.max(n, i)
			end
		end
		return n
	end
end

function start_debug()
	local status, err = pcall(require, "mobdebug")
	if package.loaded.mobdebug then 
		package.loaded.mobdebug.start()
	end
end

function error_catch(err)
	local traceback = debug.traceback()
	print(err)
	LG("lua_err", err)
	print(traceback)
	LG("lua_err", traceback)
end
	
function safe_call(f, ...)
	local arg = {...}
	local ret = { xpcall(f, error_catch, unpack(arg)) }
	local status = ret[1]
	if status == true then
		table.remove(ret, 1)
		return unpack(ret)
	end
	return nil
end

function safe_wrap(f_name)
	local fct = _G[f_name]
	if fct ~= nil then
		_G[f_name] = function (...)
			local arg = {...}
			return safe_call(fct, unpack(arg))
		end
	end
end