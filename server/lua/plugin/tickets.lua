print('Loading tickets.lua')


teletix = {}	-- for tickets
teletix_prohibit = {}

teletix[3141] = ""							Jz_Script_hc = ItemUse_Ticket
teletix[0332] = "Spring Town"				Jz_Script_cfzs = ItemUse_Ticket
teletix[0563] = "Summer Island"				Jz_Script_xdfjp = ItemUse_Ticket
teletix[0583] = "Autumn Island"				Jz_Script_qdfjp = ItemUse_Ticket
teletix[2445] = "Caribbean"					Jz_Script_jialebi = ItemUse_Ticket
teletix[2447] = "Skeletar IsleI"			TW_Ticket_Script2 = ItemUse_Ticket
teletix[2491] = "Naval Base"				TW_Ticket_Script3 = ItemUse_Ticket
teletix[2844] = "Abaddon 4"					Jz_Script_4thDy = ItemUse_Ticket
teletix[3048] = "Thundoria Castle"			Jz_Script_ltcsA = ItemUse_Ticket
teletix[3049] = "Thundoria Harbor"			Jz_Script_ltjgcsA = ItemUse_Ticket
teletix[3050] = "Sacred Snow Mountain"		Jz_Script_sxscsA = ItemUse_Ticket
teletix[3051] = "Andes Forest Haven"		Jz_Script_laslcsA = ItemUse_Ticket
teletix[3052] = "Oasis Haven"				Jz_Script_sqcsA = ItemUse_Ticket
teletix[3053] = "Icespire Haven"			Jz_Script_bjcsA = ItemUse_Ticket
teletix[3054] = "Lone Tower Entrace"		Jz_Script_jmztcsA = ItemUse_Ticket
teletix[3055] = "Barren Cavern Entrance"	Jz_Script_scrkcsA = ItemUse_Ticket
teletix[3056] = "Abandon Mine 2"			Jz_Script_fk2csA = ItemUse_Ticket
teletix[3057] = "Silver Mine 2"				Jz_Script_yk2csA = ItemUse_Ticket
teletix[3058] = "Silver Mine 3"				Jz_Script_yk3csA = ItemUse_Ticket
teletix[3059] = "Lone Tower 2"				Jz_Script_jmzt2csA = ItemUse_Ticket
teletix[3060] = "Lone Tower 3"				Jz_Script_jmzt3csA = ItemUse_Ticket
teletix[3070] = "Lone Tower 4"				Jz_Script_jmzt4csA = ItemUse_Ticket
teletix[3071] = "Lone Tower 5"				Jz_Script_jmzt5csA = ItemUse_Ticket
teletix[3072] = "Lone Tower 6"				Jz_Script_jmzt6csA = ItemUse_Ticket
teletix[3073] = "Abandon Mine 1"			Jz_Script_fk1csA = ItemUse_Ticket
teletix[3076] = "Spring Town"				Jz_Script_cfzsA = ItemUse_Ticket
teletix[3828] = "Thundoria Castle"			Jz_Script_ltcs = ItemUse_Ticket
teletix[3829] = "Thundoria Harbor"			Jz_Script_ltjgcs = ItemUse_Ticket
teletix[3830] = "Sacred Snow Mountain"		Jz_Script_sxscs = ItemUse_Ticket
teletix[3831] = "Andes Forest Haven"		Jz_Script_laslcs = ItemUse_Ticket
teletix[3832] = "Oasis Haven"				Jz_Script_sqcs = ItemUse_Ticket
teletix[3833] = "Icespire Haven"			Jz_Script_bjcs = ItemUse_Ticket
teletix[3834] = "Lone Tower Entrace"		Jz_Script_jmztcs = ItemUse_Ticket
teletix[3835] = "Barren Cavern Entrance"	Jz_Script_scrkcs = ItemUse_Ticket
teletix[3836] = "Abandon Mine 2"			Jz_Script_fk2cs = ItemUse_Ticket
teletix[3837] = "Silver Mine 2"				Jz_Script_yk2cs = ItemUse_Ticket
teletix[3838] = "Silver Mine 3"				Jz_Script_yk3cs = ItemUse_Ticket
teletix[3839] = "Lone Tower 2"				Jz_Script_jmzt2cs = ItemUse_Ticket
teletix[3840] = "Lone Tower 3"				Jz_Script_jmzt3cs = ItemUse_Ticket
teletix[3841] = "Lone Tower 4"				Jz_Script_jmzt4cs = ItemUse_Ticket
teletix[3842] = "Lone Tower 5"				Jz_Script_jmzt5cs = ItemUse_Ticket
teletix[3843] = "Lone Tower 6"				Jz_Script_jmzt6cs = ItemUse_Ticket
teletix[3847] = "Abandon Mine 1"			Jz_Script_fk1cs = ItemUse_Ticket
teletix[4602] = "Argent City"				Jz_Script_bycs = ItemUse_Ticket
teletix[4603] = "Shaitan City"				Jz_Script_slcs = ItemUse_Ticket
teletix[4604] = "Icicle Castle"				Jz_Script_blbcs = ItemUse_Ticket
teletix[3024] = "Church"					Jz_Script_yszs = ItemUse_Ticket
teletix[5619] = "Spring Town"				Jz_Script_spring = ItemUse_Ticket
teletix[5620] = "Summer Island"				Jz_Script_summer = ItemUse_Ticket
teletix[5621] = "Autumn Island"				Jz_Script_autumn = ItemUse_Ticket
teletix[5622] = "Caribbean"					Jz_Script_caribbean = ItemUse_Ticket
teletix[5623] = "Abaddon 4"					Jz_Script_4clime = ItemUse_Ticket
teletix[5624] = "Sacred Snow Mountain"		Jz_Script_jokul = ItemUse_Ticket
teletix[5625] = "Thundoria Castle"			Jz_Script_lante = ItemUse_Ticket
teletix[6205] = "Winter Island"				ItemUse_DDJP = ItemUse_Ticket
teletix[6398] = "Icespire Haven"			Jz_Script_bjcsA1 = ItemUse_Ticket
teletix[6399] = "Andes Forest Haven"		Jz_Script_laslcsA1 = ItemUse_Ticket
teletix[6400] = "Thundoria Harbor"			Jz_Script_ltjgcsA1 = ItemUse_Ticket
teletix[6401] = "Sacred Snow Mountain"		Jz_Script_sxscsA1 = ItemUse_Ticket
teletix[6454] = "Abandon Mine 1"			Jz_Script_fk1csA = ItemUse_Ticket
teletix[6455] = "Caribbean"					Jz_Script_jialebi = ItemUse_Ticket
teletix[9500] = "Argent Bar"

teletix_prohibit['prisonisland'] = true

function ItemUse_Ticket(role, Item)
	local itemId = GetItemID(Item)
	if (Hp(role) < Mxhp(role) * 0.5) or (Sp(role) < Mxsp(role) * 0.5) then 
		SystemNotice(role, "You need to have at least half of your max HP and SP to teleport.")
		UseItemFailed(role)
		return
	end
	if ChaIsBoat(role) == 1 then
		SystemNotice(role, "Cannot use while sailing!")
		UseItemFailed(role)
		return
	end
	if teletix_prohibit[GetChaMapName(role)] ~= nil and teletix_prohibit[GetChaMapName(role)] then
		BickerNotice(role, "Cannot use a ticket inside this map.")
		UseItemFailed(role)
		return
	end
	if GetItemType(Item) == 44 or GetItemType(Item) == 36 then
		local j = DelBagItem(role, itemId, 1)
		if j ~= 1 then
			SystemNotice(role, 'Error in item function. Please report!');
			UseItemFailed(role)
			return
		end
	end
	if teletix[itemId] then
		MoveCity(role, teletix[itemId])
	end
end

function GoToPlayer(role,target)
	local map_name = GetChaMapName (target) 
	local x, y = GetChaPos(target) 
	x = math.floor (x*0.01) 
	y = math.floor (y*0.01) 
	GoTo(role, x,y, map_name)
end