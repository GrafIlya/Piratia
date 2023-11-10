bintable = {}
bintable.dir = GetResPath('../lua/tools/bin/')

function filetotable(file)
	local fp = assert(io.open(file))
	local t = {}
	for line in fp:lines() do
		table.insert(t, split(line, '\t'))
	end
	return t
end

iteminfo = {}

iteminfo.insertcolumn = function(input, val, output)
	local t = filetotable(input)
	local outfile = io.open(output, 'a')
	for i = 1, table.getn(t) do
		a = t[i]
		a[table.getn(a)] = val
		outfile:write(table.concat(a, '\t')..'\t\n')
	end
	outfile:close()
end

iteminfo.editcolumn = function(input, column, val, output, oldval)
	oldval = oldval or nil
	local t = filetotable(input)
	local outfile = io.open(output, 'a')
	for i = 1, table.getn(t) do
		a = t[i]
		if oldval then
			if a[column] == oldval then
				a[column] = val
			end
		else
			a[column] = val
		end
		outfile:write(table.concat(a, '\t')..'\t\n')
	end
	outfile:close()
end

iteminfo.editcell = function(input, itemid, column, output)
end

----------------------------------------------------------
-- set default all items to 1 second cooldown
----------------------------------------------------------
--iteminfo.insertcolumn(bintable.dir..'/iteminfo.txt', 1, bintable.dir..'/iteminfo2.txt')

----------------------------------------------------------
-- set default all items to -1 (set effects). 
-- Format: equipslot,itemid;equipslot,itemid
-- where ';' is delimitor
----------------------------------------------------------
--iteminfo.insertcolumn(bintable.dir..'/iteminfo2.txt', -1, bintable.dir..'/iteminfo3.txt')

----------------------------------------------------------
-- update all apparels to 2.x format
----------------------------------------------------------
--iteminfo.editcolumn(bintable.dir..'/iteminfo4.txt', 77, '25000,25000', bintable.dir..'/iteminfo5.txt', '20000,20000')

targetcolumn = 29

apptype = {} -- map type to slot if dura is 25000
-- sword
apptype[enumItemTypeSword] = enumEQUIP_SWORD1APP..','..enumEQUIP_SWORD2APP
-- hammer
apptype[enumItemTypeGlave] = enumEQUIP_GREATSWORDAPP
-- bow
apptype[enumItemTypeBow] = enumEQUIP_BOWAPP
-- gun
apptype[enumItemTypeHarquebus] = enumEQUIP_GUNAPP
-- dagger
apptype[enumItemTypeStylet] = enumEQUIP_DAGGERAPP
-- staff
apptype[enumItemTypeCosh] = enumEQUIP_STAFFAPP
-- cap
apptype[enumItemTypeHair] = enumEQUIP_HEADAPP
-- armor
apptype[enumItemTypeClothing] = enumEQUIP_BODYAPP
-- glove
apptype[enumItemTypeGlove] = enumEQUIP_GLOVEAPP
-- boot
apptype[enumItemTypeBoot] = enumEQUIP_SHOESAPP

--[[@inputfile the iteminfo the will be read
	@editcolumn the column that will be edited
	@checkcolumn the column that will be checked
	@checkvalue the value of checked column to match with
	@outputfile save to file

	checkcolumn - 77 is durability
	checkvalue - 25000,25000
]]
iteminfo.updateapp = function(inputfile, editcolumn, checkcolumn, checkvalue, outputfile)
	local t = filetotable(inputfile)
	local outfile = io.open(outputfile, 'a')
	for i = 1, table.getn(t) do
		a = t[i]
		-- if column 77 is 25000,25000
		if a[checkcolumn] == checkvalue then
			-- check if the itemtype is an entry in apptype array
			local itemtype = tonumber(a[18])
			if apptype[itemtype] ~= nil then
				-- change the targeted column
				a[editcolumn] = apptype[itemtype]
				-- column 30 should be -1?
				a[30] = -1
			end
		end
		--outfile:write(table.concat(a, '\t')..'\t\n')
	end
	outfile:close()
end

iteminfo.updateapp(bintable.dir..'/iteminfo7.txt', 29, 77, '25000,25000', 'iteminfo.o')






