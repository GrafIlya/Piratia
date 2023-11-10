print('Loading itemuse.lua')

do
	if not IsItemEquipment then
		weap_t = {}
		weap_t[09] = true -- Staff
		weap_t[02] = true -- Hammer
		weap_t[07] = true -- Dagger
		weap_t[04] = true -- Gun
		weap_t[03] = true -- Bow
		weap_t[01] = true -- Sword
		weap_t[11] = true -- Shield
		eqpt_t = {}
		eqpt_t[22] = true
		eqpt_t[23] = true
		eqpt_t[24] = true
		eqpt_t[27] = true
		eqpt_t[20] = true

		function IsItemWeapon(item) return weap_t[GetItemType(item)] or false end
		function IsItemArmor(item) return eqpt_t[GetItemType(item)] or false end
		function IsItemEquipment(item) return IsItemWeapon(item) or IsItemArmor(item) end
	end
end

ITEM_MAX_DELEVEL = 5

-- item deleveling hamemr
function ItemUse_DelevlEq(role, Item, Item_Traget)
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return
	end
	local isboat = 0
	isboat = GetCtrlBoat(role)
	if isboat ~= nil then
		SystemNotice(role, "Cannot use while sailing")
		UseItemFailed(role)
		return
	end
	-- check itemtype
	local isequip = IsItemEquipment(Item_Traget)
	if not isequip then
		SystemNotice(role, "Can only be used on equipments!")
		UseItemFailed(role)
		return
	end
	local originalLv = GetItemOriginalLv(Item_Traget)
	local currentLv = GetItemLv(Item_Traget)
	if currentLv <= (originalLv - ITEM_MAX_DELEVEL) then
		SystemNotice(role, "Target equipment has already been deleveled "..ITEM_MAX_DELEVEL.." times!")
		UseItemFailed(role)
		return
	end
	if currentLv <= 1 then
		SystemNotice(role, "Target equipment cannot be deleveled any further!")
		UseItemFailed(role)
		return
	end
	local newLv = currentLv-1
	SetItemLv(Item_Traget, newLv)
	BickerNotice(role, "Level of "..GetItemName(GetItemID(Item_Traget)).." was decreased to "..newLv.."!")
	PlayEffect(role, 345)
	
	SynChaKitbag(role, 13)
	SetChaKitbagChange( role , 1 )
	--SynChaKitbag(role, 4)
end


apparelConverterTable = {
	[1] = 5291,--1h sword
	[2] = 5292,--2h sword
	[3] = 5296,--bow
	[4] = 5293,--gun
	[7] = 5295, --dagger
	[9] = 5294, --staff
	[11] = 5297, --shield
	[20] = 5287, --helm
	[22] = 5288, --armour
	[23] = 5289, --glove
	[24] = 5290, --boot
	[27] = 5288, --tatoo
}
function ApparelConverter(role,item,target)
	if not target or GetItemAttr(target,ITEMATTR_MAXURE) == 25000 then
		return UseItemFailed(role)
	end
	local itemType = GetItemType(target)
	if apparelConverterTable[itemType] then
		local ID = GetItemID(target)
		for i = 0,47 do
			local item2 = GetChaItem(role,2,i)
			if item2 == target then
				RemoveChaItem ( role , GetItemID(target) , 1 , 2 , i , 2 , 1 , 0)
				break
			end
		end
		local appTab = {
			ID = apparelConverterTable[itemType],
			Quantity = 1,
			MaxDurability = 25000,
			Durability = 25000,
			FuseID = ID,
		}
		AddItem(role,appTab)
	else
		SystemNotice(role,"Invalid equipment.")
		return UseItemFailed(role)
	end
end

-- Chaos Chest
-- edits: added Chaos Crownstone
function ItemUse_FightingBox( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 2 then
		SystemNotice(role ,"You need at least 2 empty inventory slots to open the Chaos Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 2610 , 1 , 4 )
	local rad = math.random ( 1, 4 )
	if rad ==1 then
		GiveItem ( role , 0 , 1124 , 1 , 15 )
	end
	if rad ==2 then
		GiveItem ( role , 0 , 1125 , 1 , 15 )
	end
	if rad ==3 then
		GiveItem ( role , 0 , 1126 , 1 , 15 )
	end
	if rad ==4 then
		GiveItem ( role , 0 , 1127 , 1 , 15 )
	end
end

-- skill reset book
function ItemUse_XiDianBook ( role , item )
	local zsskill_lv = {}
	 zsskill_lv [0] = GetSkillLv ( role, 453 )
	 zsskill_lv [1] = GetSkillLv ( role, 454 )
	 zsskill_lv [2] = GetSkillLv ( role, 455 )
	 zsskill_lv [3] = GetSkillLv ( role, 456 )
	 zsskill_lv [4] = GetSkillLv ( role, 457 )
	 zsskill_lv [5] = GetSkillLv ( role, 458 )
	local n = 0
	local item_canget = GetChaFreeBagGridNum ( role )
	if item_canget < 2 then
		SystemNotice(role ,"You need to have at least 2 empty inventory slot")
		UseItemFailed ( role )
	else
		for i = 0, 5, 1 do
			if zsskill_lv [i] >= 1 then
				n = n+1
			end
		end
		local cha_skill_num=GetChaAttr(role, ATTR_TP )
		local clear_skill_num=ClearFightSkill(role)
		cha_skill_num=cha_skill_num+clear_skill_num
		if n > 0 then
			local job = GetChaAttr( role, ATTR_JOB)
			local item_id = {}
			item_id [8] = 2957
			item_id [9] = 2956
			item_id [12] = 2961
			item_id [13] = 2959
			item_id [14] = 2958
			item_id [16] = 2960
			GiveItem ( role, 0, item_id [job] , 1, 4)
			GiveItem ( role, 0, 1572, 1, 4)
			cha_skill_num = cha_skill_num - 2
		end
		SetChaAttr(role, ATTR_TP ,cha_skill_num ) 
	end
end

function ItemUse_TLHFJA( role , Item )
	local map = GetChaMapName(role)
	if map == 'garner2' then
		SystemNotice(role ,"Cannot be used in Chaos Argent")
		UseItemFailed ( role )
	end
	local hp = GetChaAttr(role, ATTR_HP) 
	hp_resume = 1000 
	
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then
		hp = mxhp 
	end 
	SetCharaAttr(hp, role, ATTR_HP)
end

function ItemUse_TMLGZA( role , Item ) 
	local map = GetChaMapName(role)
	if map == 'garner2' then
		SystemNotice(role ,"Cannot be used in Chaos Argent")
		UseItemFailed ( role )
	end
	local sp = GetChaAttr(role, ATTR_SP) 
	sp_resume = 150 
	
	sp = sp + sp_resume 
	mxsp = GetChaAttr(role,ATTR_MXSP) 
	if sp > mxsp then
		sp = mxsp 
	end 
	SetCharaAttr(sp, role, ATTR_SP) 
end

function ItemUse_NoExp(role, item)
	local on = GetItemAttr(item, 55);
	local itemname = GetItemName(GetItemID(item))
	if on == 1 then
		SystemNotice(role, itemname..' grants you full EXP!')
		SetItemAttr(item, 55, 0)
	else
		SystemNotice(role, itemname..' grats you zero EXP!')
		SetItemAttr(item, 55, 1)
	end
	SynChaKitbag(role, 13)
end

function ItemUse_CZBox ( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 4 then
		SystemNotice(role ,"To open a Aries Apparel Chest requires at least 4 empty inventory slots")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 5525  , 1 , 4 )
	GiveItem ( role , 0 , 5526  , 1 , 4 )
	GiveItem ( role , 0 , 5527  , 1 , 4 )
	--GiveItem ( role , 0 , 5528  , 1 , 4 )
	local cha_type = GetChaTypeID ( role ) 
	if cha_type == 4 then
		GiveItem(role, 0, 5528, 1, 4)
	end
end

function ItemUse_JNCZBox ( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 4 then
		SystemNotice(role ,"You need at least 4 space to use the Taurus Apparel Chest")
		UseItemFailed ( role )
		return
	end
	--GiveItem ( role , 0 , 5529  , 1 , 4 )
	GiveItem ( role , 0 , 5530  , 1 , 4 )
	GiveItem ( role , 0 , 5531  , 1 , 4 )
	GiveItem ( role , 0 , 5532  , 1 , 4 )
	
	local cha_type = GetChaTypeID ( role ) 
	if cha_type == 4 then
		GiveItem(role, 0, 5529, 1, 4)
	end
end
