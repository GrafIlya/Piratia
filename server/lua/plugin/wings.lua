print('Loading wings.lua')

ITEMPRE_AERO = 95

-- wing upgrade item
function ItemUse_WingUpgrade(role, Item, Item_Traget)
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
	local targetpre = GetItemPrefix(Item_Traget)
	if GetItemType(Item_Traget) ~= 44 then
		SystemNotice(role, "Only wings can be upgraded.")
		UseItemFailed(role)
		return
	end
	local targetpre = GetItemPrefix(Item_Traget)
	if targetpre == ITEMPRE_AERO then
		SystemNotice(role, GetItemName(GetItemID(Item_Traget)).." already upgraded!")
		UseItemFailed(role)
		return
	end
	SystemNotice(role, 'Successfully upgrade '..GetItemName(GetItemID(Item_Traget))..'!')
	SetItemPrefix(Item_Traget, ITEMPRE_AERO)
	PlayEffect(role, 345)
	SynChaKitbag(role, 13)
end

rbwing = {}
rbwing[0128] = true
rbwing[0129] = true
rbwing[0130] = true
rbwing[0131] = true
rbwing[0132] = true
rbwing[0133] = true
rbwing[0134] = true
rbwing[0136] = true
rbwing[0137] = true
rbwing[0138] = true
rbwing[0139] = true
rbwing[0140] = true

Creat_RebirthItem = Creat_ItemX

function Creat_ItemX(item, item_type, item_lv, item_event)
	local item, item_type, item_lv, item_event = Creat_RebirthItem(item, item_type, item_lv, item_event)
	local itemid = GetItemID(item)
	if rbwing[itemid] then
		SetItemPrefix(item, ITEMPRE_AERO)
	end
	return item, item_type, item_lv, item_event
end