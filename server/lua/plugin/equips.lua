--[[
	Item title will replace the current prefixes (red dragon, cardic, etc)
	
	Item titles : 
		Title			Score	Colour
		Junk			-5      Grey
		Awful			-4      Grey
		Unholy			-3      Grey
		Cursed			-2      Grey
		Unlucky			-1      Grey
		Balanced		0		White
		Uncommon		1		Green
		Mystic			2		Blue
		Fabled			3		Red
		Mythical		4		Purple
		Legendary		5		Gold
		
	Titles via itempre.bin
	Colours will be edited in game.exe.
		
	Score is calculated as follows: +1 per positive stat, -1 per negative stat. eg +3 str, +1 con, -1 agi,+1 acc = +2
	

	Some items have extra weighting, eg uns45/55/65 will have better chance than normal equips.
	each stat will have less than/equal to than the previous.
		EG fabled sword, 3 of first stat, 3 of second, 1 of third.
		This is based on the % of max value, not absolute.
		eg if if fist stat is 10 def, that is 40% of max value. so second stat could be 4 str.
		eg if if fist stat is 10 def, that is 40% of max value. second stat rolls pr and a %, but will always be 1 pr. the % is used to decide next stat.
	
	Certain stats will be weighted to be much rarer than others.
		
	MaxValue presumes lv100 equip. Stats scale linearly. Therefore, lv50 equip would have at best half of that. Rounds up, so any equip has the chance for +1 pr.
			
	Chance of stat:
		Non-linear.
		Lower values shall be more common.
		
]]

--[[
	biased random func.
	bias<1 yeilds higher results
	bias>1 yeilds lower results.
	This is used to decide the amount of a stat.
	
	todo - decide on bias. Possibly based on level.
]]
EQUIPMENT_LV = 80

function randomBiased (min,max,bias) 
	local v = math.pow(math.random(), bias); 
	return math.floor(v * max)+ min;
end

function WeightedRandomIndex(table)
	local total = 0
	for i,v in ipairs(table) do
		total = total + v.Rate
	end
	local result = math.random(1,total)

	total = 0
	for i,v in ipairs(table) do
		total = total + v.Rate
		if total >= result then
			return i
		end
	end
end



ITEMSTAT = {
	[enumItemTypeClothing] ={
		[ITEMATTR_VAL_STR]   = {MaxValue = 7, Rate = 70},
		[ITEMATTR_VAL_DEX]   = {MaxValue = 7, Rate = 70},
		[ITEMATTR_VAL_AGI]   = {MaxValue = 7, Rate = 70},
		[ITEMATTR_VAL_CON]   = {MaxValue = 15, Rate = 150},
		[ITEMATTR_VAL_STA]   = {MaxValue = 15, Rate = 150},
	
		[ITEMATTR_VAL_DEF]  = {MaxValue = 60, Rate = 50},
		[ITEMATTR_VAL_HIT]  = {MaxValue = 25, Rate = 15},
		[ITEMATTR_VAL_FLEE]  = {MaxValue = 25, Rate = 15},
		[ITEMATTR_VAL_MXATK]  = {MaxValue = 25, Rate = 15},
			
		[ITEMATTR_VAL_MXHP]  = {MaxValue = 500, Rate = 50},
		[ITEMATTR_VAL_MXSP]  = {MaxValue = 500, Rate = 50},
		
		[ITEMATTR_VAL_HREC] = {MaxValue = 10, Rate = 30},
		[ITEMATTR_VAL_SREC] = {MaxValue = 10, Rate = 30},
		
		[ITEMATTR_VAL_ASPD] = {MaxValue = 15, Rate = 1},
		[ITEMATTR_VAL_MSPD] = {MaxValue = 15, Rate = 1},
		[ITEMATTR_VAL_PDEF] = {MaxValue = 6, Rate = 1},
	},
	
	[enumItemTypeGlove] = {
		[ITEMATTR_VAL_STR]   = {MaxValue = 7, Rate = 70},
		[ITEMATTR_VAL_DEX]   = {MaxValue = 15, Rate = 170},
		[ITEMATTR_VAL_AGI]   = {MaxValue = 7, Rate = 70},
		[ITEMATTR_VAL_CON]   = {MaxValue = 7, Rate = 100},
		[ITEMATTR_VAL_STA]   = {MaxValue = 7, Rate = 100},
	
		[ITEMATTR_VAL_DEF]  = {MaxValue = 20, Rate = 50},
		[ITEMATTR_VAL_HIT]  = {MaxValue = 50, Rate = 80},
		[ITEMATTR_VAL_FLEE]  = {MaxValue = 20, Rate = 15},
		[ITEMATTR_VAL_MXATK]  = {MaxValue = 20, Rate = 15},
			
		[ITEMATTR_VAL_MXHP]  = {MaxValue = 500, Rate = 50},
		[ITEMATTR_VAL_MXSP]  = {MaxValue = 500, Rate = 50},
		
		[ITEMATTR_VAL_HREC] = {MaxValue = 10, Rate = 10},
		[ITEMATTR_VAL_SREC] = {MaxValue = 10, Rate = 10},
		
		[ITEMATTR_VAL_ASPD] = {MaxValue = 40, Rate = 5},
		[ITEMATTR_VAL_MSPD] = {MaxValue = 15, Rate = 1},
		[ITEMATTR_VAL_PDEF] = {MaxValue = 1, Rate = 1},
	},
	
	[enumItemTypeBoot] = {
		[ITEMATTR_VAL_STR]   = {MaxValue = 7, Rate = 70},
		[ITEMATTR_VAL_DEX]   = {MaxValue = 7, Rate = 70},
		[ITEMATTR_VAL_AGI]   = {MaxValue = 15, Rate = 100},
		[ITEMATTR_VAL_CON]   = {MaxValue = 7, Rate = 100},
		[ITEMATTR_VAL_STA]   = {MaxValue = 7, Rate = 100},
	
		[ITEMATTR_VAL_DEF]  = {MaxValue = 20, Rate = 50},
		[ITEMATTR_VAL_HIT]  = {MaxValue = 20, Rate = 40},
		[ITEMATTR_VAL_FLEE]  = {MaxValue = 50, Rate = 80},
		[ITEMATTR_VAL_MXATK]  = {MaxValue = 20, Rate = 15},
			
		[ITEMATTR_VAL_MXHP]  = {MaxValue = 500, Rate = 50},
		[ITEMATTR_VAL_MXSP]  = {MaxValue = 500, Rate = 50},
		
		[ITEMATTR_VAL_HREC] = {MaxValue = 10, Rate = 10},
		[ITEMATTR_VAL_SREC] = {MaxValue = 10, Rate = 10},
		
		[ITEMATTR_VAL_ASPD] = {MaxValue = 10, Rate = 1},
		[ITEMATTR_VAL_MSPD] = {MaxValue = 40, Rate = 5},
		[ITEMATTR_VAL_PDEF] = {MaxValue = 1, Rate = 1},
	},
	
	[enumItemTypeHair] = {
		[ITEMATTR_VAL_STR]   = {MaxValue = 5, Rate = 70},
		[ITEMATTR_VAL_DEX]   = {MaxValue = 5, Rate = 70},
		[ITEMATTR_VAL_AGI]   = {MaxValue = 5, Rate = 70},
		[ITEMATTR_VAL_CON]   = {MaxValue = 8, Rate = 150},
		[ITEMATTR_VAL_STA]   = {MaxValue = 15, Rate = 150},
	
		[ITEMATTR_VAL_DEF]  = {MaxValue = 40, Rate = 50},
		[ITEMATTR_VAL_HIT]  = {MaxValue = 25, Rate = 15},
		[ITEMATTR_VAL_FLEE]  = {MaxValue = 25, Rate = 15},
		[ITEMATTR_VAL_MXATK]  = {MaxValue = 25, Rate = 15},
			
		[ITEMATTR_VAL_MXHP]  = {MaxValue = 500, Rate = 50},
		[ITEMATTR_VAL_MXSP]  = {MaxValue = 500, Rate = 50},
		
		[ITEMATTR_VAL_HREC] = {MaxValue = 10, Rate = 30},
		[ITEMATTR_VAL_SREC] = {MaxValue = 10, Rate = 30},
		
		[ITEMATTR_VAL_ASPD] = {MaxValue = 15, Rate = 1},
		[ITEMATTR_VAL_MSPD] = {MaxValue = 15, Rate = 1},
		[ITEMATTR_VAL_PDEF] = {MaxValue = 1, Rate = 1},
	},
	
	[enumItemTypeSword] = {-- sword
		[ITEMATTR_VAL_STR]   = {MaxValue = 10, Rate = 70},
		[ITEMATTR_VAL_DEX]   = {MaxValue = 7, Rate = 70},
		[ITEMATTR_VAL_AGI]   = {MaxValue = 7, Rate = 100},
		[ITEMATTR_VAL_CON]   = {MaxValue = 5, Rate = 100},
		[ITEMATTR_VAL_STA]   = {MaxValue = 7, Rate = 150},
	
		[ITEMATTR_VAL_DEF]  = {MaxValue = 20, Rate = 10},
		[ITEMATTR_VAL_HIT]  = {MaxValue = 40, Rate = 40},
		[ITEMATTR_VAL_FLEE]  = {MaxValue = 40, Rate = 40},
		[ITEMATTR_VAL_MXATK]  = {MaxValue = 60, Rate = 60},
			
		[ITEMATTR_VAL_MXHP]  = {MaxValue = 100, Rate = 50},
		[ITEMATTR_VAL_MXSP]  = {MaxValue = 100, Rate = 50},
		
		[ITEMATTR_VAL_HREC] = {MaxValue = 5, Rate = 30},
		[ITEMATTR_VAL_SREC] = {MaxValue = 5, Rate = 30},
		
		[ITEMATTR_VAL_ASPD] = {MaxValue = 10, Rate = 1},
		[ITEMATTR_VAL_MSPD] = {MaxValue = 10, Rate = 1},
		[ITEMATTR_VAL_PDEF] = {MaxValue = 1, Rate = 1},
	},
	
	[enumItemTypeGlave] = {-- gr8sword
		[ITEMATTR_VAL_STR]   = {MaxValue = 15, Rate = 70},
		[ITEMATTR_VAL_DEX]   = {MaxValue = 7, Rate = 120},
		[ITEMATTR_VAL_AGI]   = {MaxValue = 7, Rate = 100},
		[ITEMATTR_VAL_CON]   = {MaxValue = 9, Rate = 90},
		[ITEMATTR_VAL_STA]   = {MaxValue = 7, Rate = 150},
	
		[ITEMATTR_VAL_DEF]  = {MaxValue = 50, Rate = 40},
		[ITEMATTR_VAL_HIT]  = {MaxValue = 20, Rate = 30},
		[ITEMATTR_VAL_FLEE]  = {MaxValue = 20, Rate = 30},
		[ITEMATTR_VAL_MXATK]  = {MaxValue = 60, Rate = 60},
			
		[ITEMATTR_VAL_MXHP]  = {MaxValue = 300, Rate = 50},
		[ITEMATTR_VAL_MXSP]  = {MaxValue = 300, Rate = 50},
		
		[ITEMATTR_VAL_HREC] = {MaxValue = 5, Rate = 30},
		[ITEMATTR_VAL_SREC] = {MaxValue = 5, Rate = 30},
		
		[ITEMATTR_VAL_ASPD] = {MaxValue = 20, Rate = 1},
		[ITEMATTR_VAL_MSPD] = {MaxValue = 10, Rate = 1},
		[ITEMATTR_VAL_PDEF] = {MaxValue = 1, Rate = 1},
	},
	
	[enumItemTypeBow] = {-- bow
		[ITEMATTR_VAL_STR]   = {MaxValue = 5, Rate = 130},
		[ITEMATTR_VAL_DEX]   = {MaxValue = 15, Rate = 110},
		[ITEMATTR_VAL_AGI]   = {MaxValue = 10, Rate = 100},
		[ITEMATTR_VAL_CON]   = {MaxValue = 9, Rate = 90},
		[ITEMATTR_VAL_STA]   = {MaxValue = 7, Rate = 150},
	
		[ITEMATTR_VAL_DEF]  = {MaxValue = 20, Rate = 30},
		[ITEMATTR_VAL_HIT]  = {MaxValue = 30, Rate = 60},
		[ITEMATTR_VAL_FLEE]  = {MaxValue = 20, Rate = 40},
		[ITEMATTR_VAL_MXATK]  = {MaxValue = 60, Rate = 60},
			
		[ITEMATTR_VAL_MXHP]  = {MaxValue = 200, Rate = 50},
		[ITEMATTR_VAL_MXSP]  = {MaxValue = 200, Rate = 50},
		
		[ITEMATTR_VAL_HREC] = {MaxValue = 5, Rate = 30},
		[ITEMATTR_VAL_SREC] = {MaxValue = 5, Rate = 30},
		
		[ITEMATTR_VAL_ASPD] = {MaxValue = 20, Rate = 3},
		[ITEMATTR_VAL_MSPD] = {MaxValue = 20, Rate = 3},
		[ITEMATTR_VAL_PDEF] = {MaxValue = 1, Rate = 1},
	},
	
	[enumItemTypeHarquebus] = {-- gun
		[ITEMATTR_VAL_STR]   = {MaxValue = 5, Rate = 130},
		[ITEMATTR_VAL_DEX]   = {MaxValue = 15, Rate = 110},
		[ITEMATTR_VAL_AGI]   = {MaxValue = 10, Rate = 100},
		[ITEMATTR_VAL_CON]   = {MaxValue = 9, Rate = 90},
		[ITEMATTR_VAL_STA]   = {MaxValue = 7, Rate = 150},
	
		[ITEMATTR_VAL_DEF]  = {MaxValue = 20, Rate = 30},
		[ITEMATTR_VAL_HIT]  = {MaxValue = 30, Rate = 60},
		[ITEMATTR_VAL_FLEE]  = {MaxValue = 20, Rate = 40},
		[ITEMATTR_VAL_MXATK]  = {MaxValue = 60, Rate = 60},
			
		[ITEMATTR_VAL_MXHP]  = {MaxValue = 200, Rate = 50},
		[ITEMATTR_VAL_MXSP]  = {MaxValue = 200, Rate = 50},
		
		[ITEMATTR_VAL_HREC] = {MaxValue = 5, Rate = 30},
		[ITEMATTR_VAL_SREC] = {MaxValue = 5, Rate = 30},
		
		[ITEMATTR_VAL_ASPD] = {MaxValue = 20, Rate = 3},
		[ITEMATTR_VAL_MSPD] = {MaxValue = 20, Rate = 3},
		[ITEMATTR_VAL_PDEF] = {MaxValue = 1, Rate = 1},
	},
	
	[enumItemTypeStylet] = {-- dagger
		[ITEMATTR_VAL_STR]   = {MaxValue = 12, Rate = 150},
		[ITEMATTR_VAL_DEX]   = {MaxValue = 5, Rate = 110},
		[ITEMATTR_VAL_AGI]   = {MaxValue = 5, Rate = 100},
		[ITEMATTR_VAL_CON]   = {MaxValue = 12, Rate = 90},
		[ITEMATTR_VAL_STA]   = {MaxValue = 20, Rate = 150},
	
		[ITEMATTR_VAL_DEF]  = {MaxValue = 40, Rate = 60},
		[ITEMATTR_VAL_HIT]  = {MaxValue = 30, Rate = 20},
		[ITEMATTR_VAL_FLEE]  = {MaxValue = 40, Rate = 40},
		[ITEMATTR_VAL_MXATK]  = {MaxValue = 60, Rate = 60},
			
		[ITEMATTR_VAL_MXHP]  = {MaxValue = 200, Rate = 50},
		[ITEMATTR_VAL_MXSP]  = {MaxValue = 500, Rate = 50},
		
		[ITEMATTR_VAL_HREC] = {MaxValue = 5, Rate = 30},
		[ITEMATTR_VAL_SREC] = {MaxValue = 5, Rate = 30},
		
		[ITEMATTR_VAL_ASPD] = {MaxValue = 20, Rate = 3},
		[ITEMATTR_VAL_MSPD] = {MaxValue = 10, Rate = 2},
		[ITEMATTR_VAL_PDEF] = {MaxValue = 1, Rate = 1},
	},
	
	[enumItemTypeCosh] = {-- staff
		[ITEMATTR_VAL_STR]   = {MaxValue = 12, Rate = 150},
		[ITEMATTR_VAL_DEX]   = {MaxValue = 5, Rate = 110},
		[ITEMATTR_VAL_AGI]   = {MaxValue = 5, Rate = 100},
		[ITEMATTR_VAL_CON]   = {MaxValue = 12, Rate = 90},
		[ITEMATTR_VAL_STA]   = {MaxValue = 20, Rate = 150},
	
		[ITEMATTR_VAL_DEF]  = {MaxValue = 40, Rate = 60},
		[ITEMATTR_VAL_HIT]  = {MaxValue = 30, Rate = 20},
		[ITEMATTR_VAL_FLEE]  = {MaxValue = 40, Rate = 40},
		[ITEMATTR_VAL_MXATK]  = {MaxValue = 60, Rate = 60},
			
		[ITEMATTR_VAL_MXHP]  = {MaxValue = 200, Rate = 50},
		[ITEMATTR_VAL_MXSP]  = {MaxValue = 500, Rate = 50},
		
		[ITEMATTR_VAL_HREC] = {MaxValue = 5, Rate = 30},
		[ITEMATTR_VAL_SREC] = {MaxValue = 5, Rate = 30},
		
		[ITEMATTR_VAL_ASPD] = {MaxValue = 20, Rate = 3},
		[ITEMATTR_VAL_MSPD] = {MaxValue = 10, Rate = 2},
		[ITEMATTR_VAL_PDEF] = {MaxValue = 1, Rate = 1},
	},
	
	[enumItemTypeShield] = {-- shield
		[ITEMATTR_VAL_STR]   = {MaxValue = 7, Rate = 150},
		[ITEMATTR_VAL_DEX]   = {MaxValue = 7, Rate = 110},
		[ITEMATTR_VAL_AGI]   = {MaxValue = 7, Rate = 100},
		[ITEMATTR_VAL_CON]   = {MaxValue = 15, Rate = 90},
		[ITEMATTR_VAL_STA]   = {MaxValue = 7, Rate = 150},
	
		[ITEMATTR_VAL_DEF]  = {MaxValue = 40, Rate = 50},
		[ITEMATTR_VAL_HIT]  = {MaxValue = 30, Rate = 50},
		[ITEMATTR_VAL_FLEE]  = {MaxValue = 40, Rate = 50},
		[ITEMATTR_VAL_MXATK]  = {MaxValue = 60, Rate = 50},
			
		[ITEMATTR_VAL_MXHP]  = {MaxValue = 400, Rate = 50},
		[ITEMATTR_VAL_MXSP]  = {MaxValue = 400, Rate = 50},
		
		[ITEMATTR_VAL_HREC] = {MaxValue = 5, Rate = 30},
		[ITEMATTR_VAL_SREC] = {MaxValue = 5, Rate = 30},
		
		[ITEMATTR_VAL_ASPD] = {MaxValue = 10, Rate = 3},
		[ITEMATTR_VAL_MSPD] = {MaxValue = 10, Rate = 2},
		[ITEMATTR_VAL_PDEF] = {MaxValue = 3, Rate = 1},
	},
}

BADCHANCE = 0.3
BIAS = 3.4


function CalculateExtraStats(Lv,itemstat,statrate)
	--percent starts at 100, and diminishes as new stat is added.
	local percent = 100
	local title = 0
	local itemRates = {}
	mul = mul or 1
	--load all stat rates.
	for i,v in pairs(itemstat)do
		itemRates[#itemRates+1] = {Value=i,Rate=v.Rate}
	end
	
	local stats = {}
	
	for i = 1,5 do
		--check if next stat will be added.
		if Percentage_Random(statrate[i]) == 1 then
			--generate new percent value (used to calculate stats to be added.)
			percent = randomBiased (1,percent,BIAS)
			local ratio = (Lv * percent ) / 10000
			--select item stat
			local index = WeightedRandomIndex(itemRates)
			--remove stat from stat pool, as cant have the same stat twice
			local stat = itemRates[index].Value
			table.remove(itemRates,index)
			--calculate stat value
			local value = math.max(math.floor(itemstat[stat].MaxValue * ratio),1)
			--decide if stat should be positive or negative.
			if Percentage_Random(BADCHANCE) == 1 then
				value = -value
				title = title - 1
				if stat == ITEMATTR_VAL_MXATK then
					stat = ITEMATTR_VAL_MNATK
				end
			else
				title = title + 1
			end
			stats[#stats+1] = {ID = stat, Num = value}
		else
			--if not added then break
			break
		end
	end
	return stats , title
end



ITEMRATE = {
	[MONSTER_BAOLIAO] = { --mob drops
		0.6,
		0.3,
		0.15,
		0.1,
		0.05,
	},
	
	[QUEST_AWARD_3] = { --unsX0 chests etc
		1,
		0.6,
		0.3,
		0.15,
		0.1,
	},
	
	[QUEST_AWARD_5] = { --mystic/beautiful chests etc
		1,
		0.4,
		0.2,
		0.1,
		0.05,
	},
	
	[PLAYER_HSSRA] = { --black market
		1,
		0.5,
		0.25,
		0.1,
		0.05,
	},
	
	[PLAYER_ZSITEM] = { --star of unity
		1,
		1,
		0.1,
		0.1,
		0.05,
	},
}

ITEMCOLOUR = {
	[-5] = 0,--grey
	[-4] = 0,--grey
	[-3] = 0,--grey
	[-2] = 0,--grey
	[-1] = 0,--grey
	[0] = 0, --grey
	[1] = 1, --white
	[2] = 3, --green
	[3] = 7, --red
	[4] = 5, --purple
	[5] = 9, --gold
}


Creat_ItemOriginal  = Creat_ItemOriginal or Creat_Item
function Creat_Item(item, item_type, item_lv, item_event)
	
	if item_lv >= EQUIPMENT_LV and ITEMSTAT[item_type] and ITEMRATE[item_event] then
		Reset_item_add()
		local attr,title = CalculateExtraStats(item_lv,ITEMSTAT[item_type],ITEMRATE[item_event])
		for i,v in pairs(attr) do
			SetAttributeEditable(item,i-1,v.ID)
			SetItemAttr(item,v.ID,GetItemAttr(item,v.ID)+v.Num)
		end
		local prefix = (35+title)*10 + (ITEMCOLOUR[title] * 1000)
		SetItemAttr(item,ITEMATTR_MAXENERGY,prefix)
		return 0
	else 
		return Creat_ItemOriginal(item, item_type, item_lv, item_event)
	end
	
end 