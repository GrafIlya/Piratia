--[[
	Mall loot boxes.
	May also be used as event rewards.
	(ALL APPARELS = ALL RACE, but if no model then display normal equip)
	Players can buy the apparel etc they want but it will be exspensive.
		Some exceptions.
	Loot boxes give random item in a catagory, but is much cheaper.
	Will be weighted, so less likely to get the most wanted items (will be subtle)
	Will have a small chance for bonus items.

	Try to avoid items with stats in these, so no gem lootboxes (NO GEMS IN MALL EVER.)
		However, gem could be a bonus item, at very low rates.

	Example boxes:
		Fairy Apparel box (gives a random fairy apparel, with a chance of giving rats/fog/levelup fruits)
		Fairy box (gives a random 2nd gen fairy, with a chance of giving rats/fog/levelup fruits)
		helm/glove/armour/boot box (random apparel, chance of getting a second roll)
		"Classic" apparel box (gives an apparel that looks like regular equip, eg newbie vest, striking sword)
		Face Loot Box : Gives random face, not available else where.		
		Mystery Box Box (gives 5 random loot boxes, but costs the price of 2, chance for bonus gear or boxes)
			Could have duplicates.

		"Rare" apparels not available in mall will only be in boxes, eg
			Death apparel
			Kylin apparel
			uns95/85 apparel
		These will have low drop rates in the armour/weapon chests.

		Glow apparel will ONLY be in loot boxes
			(essentially information bank style item from top)

]]

lootBoxTable = {
	[15450] = {--sword apparel box
		Main = {
			Items = {
				{Value = {ID = 5001,Quantity = 1}, Rate = 1},--azure flame
				{Value = {ID = 5002,Quantity = 1}, Rate = 10},--crimson thunder
				{Value = {ID = 5007,Quantity = 1}, Rate = 7},--crimson flame
				{Value = {ID = 5008,Quantity = 1}, Rate = 3},--azure thunder
				{Value = {ID = 5070,Quantity = 1}, Rate = 2},--cadaver
				{Value = {ID = 5283,Quantity = 1}, Rate = 6},--knife
				{Value = {ID = 5284,Quantity = 1}, Rate = 1},--fork
			}
			Quantity = 1,
		},
		
		Bonus = {
			Items = {},
			Quantity = 0,

		}
	},
}

function WeightedRandomIndex(table,index,rate)
	if not index then 
		index = "Value"
	end
	if not rate then 
		rate = "Rate"
	end
	local total = 0
	for i,v in ipairs(table) do
		total = total + v[rate]
	end
	local result = math.random(1,total)

	total = 0

	for i,v in ipairs(table) do
		total = total + v.Rate
		if total >= result then
			return v[index]
		end
	end
end


function OpenLootBox(role,lootTable)
	local num = lootTable.Quantity
	if type(lootTable.Quantity) == "table" then
		num = math.random(lootTable.Quantity[1],lootTable.Quantity[2])
	end
	if num == 0 then
		return false
	end
	for i = 1,num do
		local item = WeightedRandomIndex(lootTable.Items)
		GiveItem(role,0, item.ID,item.Quantity,0)
		return true
	end
end

function UseLootBox(role,item)
	local itemID = GetItemID(item)
	local lootTable = lootBoxTable[item]
	
	OpenLootBox(role,lootTable.Main)

	if lootTable.Bonus and math.random(1,100) == 77 then
		if OpenLootBox(role,lootTable.Bonus) then
			SystemNotice(role,"Lucky Strike! Bonus item obtained!")
		end
	end
end