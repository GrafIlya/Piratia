
function UseItemGoldStore(role,item)
	local num = GetItemForgeParam(item,1)
	local gold = GetChaAttr(role,ATTR_GD)
	if gold + num > 2000000000 then
		SystemNotice(role,"Total gold can not exceed 2b")
		UseItemFailed(role)
		return
	end
	AddMoney ( role , 0 , num )
end

function CreateGoldStore(role,num)
	if GetChaFreeBagGridNum(role) < 1 then
		SystemNotice(role,"Requires slot in inventory")
		return
	end
	local gold = GetChaAttr(role,ATTR_GD)
	num = math.min(gold,num,1000000000)
	if num < 1 then
		SystemNotice(role,"Creating a gold store requires atleast 1 gold.")
		return
	end
	AddMoney ( role , 0 , -num )
	local itemTab = {
		ID = 15043,
		Quantity = 1,
		ForgeParam = num,
	}
	AddItem(role,itemTab)
end