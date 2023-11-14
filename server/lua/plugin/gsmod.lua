print('Loading gsmod.lua')

--[[
-- OnBankItem
-- @author: kong@pkodev.net
-- @param role - player who is banking
-- @param item - userdata item type of targeted item
-- @return return 1 to allow banking, return 0 to prevent banking
--]]
function OnBankItem(role, item)
	local itemtype = GetItemType(item)
	if itemtype == 43 or itemtype == 45 or itemtype == 46 then
		return 0
	end
	return 1
end

function RightClickHandle(role,item)
	local itemType = GetItemType(item)
	if itemType == 59 and FairyObj then
		local fairy = FairyObj:Create(role)
		if fairy and fairy.Fairy == item then
			fairy:Open()
		end
		return 0
	end
	return 1
end


function BeforeLeaveMap(role)

end

function AfterEnterMap(role)

end

function AfterCastSkill(ATKER,DEFER,skill,lv)

end

function OnDeath(role)

end