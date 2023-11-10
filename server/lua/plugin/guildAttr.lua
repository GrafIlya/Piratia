--[[

alter table guild add 
PDEF int default(0) NOT NULL,
MSPD int default(0) NOT NULL,
ASPD int default(0) NOT NULL,
MXATK int default(0) NOT NULL,
DEF  int default(0) NOT NULL,
HIT  int default(0) NOT NULL,
FLEE int default(0) NOT NULL,
HREC int default(0) NOT NULL,
SREC int default(0) NOT NULL,
MXHP int default(0) NOT NULL,
MXSP int default(0) NOT NULL,
level int default(0) NOT NULL;

alter table character drop constraint DF_character_guild_permission;
alter table character alter column guild_permission int;



550 points at lv99 - 32934000 exp required
For lv20 def, requires 630 points.

Break down:
32934000 / 5000 = 6586 t1 mobs

To get 1k hp requires 210 points
to get 2k
to max out hp requires 5050 points.

lv3 hr takes 18 points

]]

guildAttributes = guildAttributes or {}
guildLevels = guildLevels or {}

guildExp = {
	[988] = 5000, --supreme kara
	[987] = 5000, --supreme hardin
	
	[796] = 2500, --kraken
	[978] = 2500, --kuroo
	[789] = 2500, --BD
	[1109] = 2500, --fury kara
	[1117] = 2500, --morpheus
	
	[807] = 1000, --dsc
	[979] = 1000, --abyss lord phantom baron
	[980] = 1000, --abyss lord demon flame
	[981] = 1000, --abyss lord evil bease
	[982] = 1000, --abyss lord tyran
	[983] = 1000, --abyss lord phoenix
	[984] = 1000, --abyss lord despair
	[985] = 1000, --abyss lord drakan
	[986] = 1000, --abyss lord tidal
	[1113] = 1000, --D1 boss
	[1105] = 1000, --L1 boss
	
	[974] = 500, --despair knight saro
	[975] = 500, --mud monster karu
	[976] = 500, --prisoner aruthur
	[977] = 500, --demon sacrois
	[805] = 500, --barborosa
	[1099] = 500, --stone dragon lord
	[1100] = 500, --evil snow leopard
	[1101] = 500, --Icy soul lord
	
	[679] = 250, --dwb1
	[678] = 250, --dwb2
	[675] = 250, --ds3 boss
	[708] = 250, --ds3 mini boss
	[707] = 250, --ds2 mini boss
	[706] = 250, --ds1 mini boss
	[673] = 250, --fc2 boss
	[959] = 250, --phantom knight
	[967] = 250, --warrior phantom
	[963] = 250, --evil ice phantom
	
	[815] = 150, --black jewel
	
	[757] = 100, --Pirate captain 008
	[776] = 100, --fox sage
	[786] = 100, --lizardman warrior commander
	[788] = 100, --evil tribal chieften
	[74] = 100, --Icy dragon
	
	[883] = 50, --bd lance
	[884] = 50, --bd carsise
	[885] = 50, --bd phyllis
	[886] = 50, --bd ami
	
	--mini bosses (purple circle mobs)
	[855] = 5, 
	[852] = 5, 
	[845] = 5, 
	[844] = 5, 
	[842] = 5, 
	[853] = 5, 
	[843] = 5, 
	[854] = 5, 
	[851] = 5, 
	[850] = 5, 
	[848] = 5, 
	[846] = 5, 
	[841] = 5, 
	[847] = 5, 
	[849] = 5, 
}

guildAttributeIncrement = {
	[ATTR_PDEF] = 1,
	[ATTR_MSPD] = 5,
	[ATTR_ASPD] = 5,
	[ATTR_MXATK] = 5,
	[ATTR_DEF] = 5,
	[ATTR_HIT] = 5,
	[ATTR_FLEE] = 5,
	[ATTR_HREC] = 1,
	[ATTR_SREC] = 1,
	[ATTR_MXHP] = 50,
	[ATTR_MXSP] = 50,
}

function InitGuildAttr(guildID,pdef,ms,as,mx,def,hit,flee,hrec,srec,mxhp,mxsp,level)
	guildAttributes[guildID] = {
		[ATTR_PDEF] = pdef,
		[ATTR_MSPD] = ms,
		[ATTR_ASPD] = as,
		[ATTR_MXATK] = mx,
		[ATTR_DEF] = def,
		[ATTR_HIT] = hit,
		[ATTR_FLEE] = flee,
		[ATTR_HREC] = hrec,
		[ATTR_SREC] = srec,
		[ATTR_MXHP] = mxhp,
		[ATTR_MXSP] = mxsp,
	}
	SetGuildLevel(guildID,level)
end

function SetGuildLevel(guildID,Lv)
	guildLevels[guildID] = Lv
end

function GetGuildLevel(guildID)
	return guildLevels[guildID] or 0
end

function DestroyGuildAttr(guildID)
	guildAttributes[guildID] = {}
end

function InitNewGuildAttr(guildID)
	InitGuildAttr(guildID,0,0,0,0,0,0,0,0,0,0,0,0)
	DealAllInGuild(guildID,"AttrRecheck")
	DealAllInGuild(guildID,"RefreshCha")
	DealAllInGuild(guildID,"UpdateGuildAttrs")
end

function GetGuildAttr(role,attr)
	local guildID = GetChaGuildID(role)
	local guildAttr = guildAttributes[guildID]
	if not guildAttr or not guildAttr[attr] then
		return 0
	else
		return guildAttr[attr] *  guildAttributeIncrement[attr]
	end
end

function IncrementGuildAttr(guildID,attr)
	if not guildAttributes[guildID] then
		guildAttributes[guildID] = {[attr] = 1}
	elseif not guildAttributes[guildID][attr] then
		guildAttributes[guildID][attr] = 1
	else
		guildAttributes[guildID][attr] = guildAttributes[guildID][attr] + 1
	end
	DealAllInGuild(guildID,"AttrRecheck")
	DealAllInGuild(guildID,"RefreshCha")
	DealAllInGuild(guildID,"UpdateGuildAttrs")
	
end

function GetGuildAttrs(role)
	local guildID = GetChaGuildID(role)
	if not guildAttributes[guildID] then
		InitGuildAttr(guildID,0,0,0,0,0,0,0,0,0,0,0,0)
	end
	return guildAttributes[guildID][ATTR_PDEF]  or 0 , 
		guildAttributes[guildID][ATTR_MSPD]  or 0 , 
		guildAttributes[guildID][ATTR_ASPD]  or 0 , 
		guildAttributes[guildID][ATTR_MXATK]  or 0 , 
		guildAttributes[guildID][ATTR_DEF]  or 0 , 
		guildAttributes[guildID][ATTR_HIT]  or 0 , 
		guildAttributes[guildID][ATTR_FLEE]  or 0 , 
		guildAttributes[guildID][ATTR_HREC]  or 0 , 
		guildAttributes[guildID][ATTR_SREC]  or 0 , 
		guildAttributes[guildID][ATTR_MXHP]  or 0 , 
		guildAttributes[guildID][ATTR_MXSP]  or 0 
end             

function UpdateGuildAttrs(role)
	local guildID = GetChaGuildID(role)
	if not guildAttributes[guildID] then
		InitGuildAttr(guildID,0,0,0,0,0,0,0,0,0,0,0,0)
	end
	local pkt = GetPacket()
	WriteCmd(pkt,508)
	WriteDword(pkt,GetRoleID(role))
	WriteDword(pkt,0)
	WriteByte(pkt,32)
	WriteDword(pkt,guildAttributes[guildID][ATTR_PDEF]  or 0)
	WriteDword(pkt,guildAttributes[guildID][ATTR_MSPD]  or 0)
	WriteDword(pkt,guildAttributes[guildID][ATTR_ASPD]  or 0)
	WriteDword(pkt,guildAttributes[guildID][ATTR_MXATK]  or 0)
	WriteDword(pkt,guildAttributes[guildID][ATTR_DEF]  or 0)
	WriteDword(pkt,guildAttributes[guildID][ATTR_HIT]  or 0)
	WriteDword(pkt,guildAttributes[guildID][ATTR_FLEE]  or 0)
	WriteDword(pkt,guildAttributes[guildID][ATTR_HREC]  or 0)
	WriteDword(pkt,guildAttributes[guildID][ATTR_SREC]  or 0)
	WriteDword(pkt,guildAttributes[guildID][ATTR_MXHP]  or 0)
	WriteDword(pkt,guildAttributes[guildID][ATTR_MXSP]  or 0)

	SendPacket(role,pkt)

end                        

after_player_kill_playerGuildHook = after_player_kill_playerGuildHook or after_player_kill_player
function after_player_kill_player(role,DEFER)
	local gid = GetChaGuildID(DEFER)
	if GetChaGuildID(role) ~= 0 and GetChaGuildID(role) ~= gid then
		AddGuildExp(role,1)
	end
	return after_player_kill_playerGuildHook(role,DEFER)
end

GetExp_PKMGuildHook = GetExp_PKMGuildHook or GetExp_PKM
function GetExp_PKM(Mob,role)
	local mobID = GetChaTypeID(Mob)
	local guildID = GetChaGuildID(role) 
	if guildID~= 0 then
		if guildExp[mobID] then
			AddGuildExp(role,guildExp[mobID])
		end
		CheckGuildQuests(role,mobID)
	end
	return GetExp_PKMGuildHook(Mob,role)
end

Mxhp_final2 = Mxhp_final2 or Mxhp_final
Mxsp_final2 = Mxsp_final2  or Mxsp_final 
Mxatk_final2 = Mxatk_final2 or Mxatk_final
Def_final2 = Def_final2 or  Def_final
Resist_final2 = Resist_final2 or Resist_final
Hit_final2 = Hit_final2 or Hit_final
Flee_final2 = Flee_final2 or Flee_final
Hrec_final2 = Hrec_final2 or Hrec_final
Srec_final2 = Srec_final2 or Srec_final 
Aspd_final2 = Aspd_final2 or Aspd_final
Mspd_final2 = Mspd_final2 or Mspd_final 

Mxhp_final = function (role) return Mxhp_final2(role) + GetGuildAttr(role,ATTR_MXHP) end
Mxsp_final = function (role) return Mxsp_final2(role) + GetGuildAttr(role,ATTR_MXSP) end
Mxatk_final = function (role) return Mxatk_final2(role) + GetGuildAttr(role,ATTR_MXATK) end
Def_final = function (role) return Def_final2(role) + GetGuildAttr(role,ATTR_DEF) end
Resist_final = function (role) return Resist_final2(role) + GetGuildAttr(role,ATTR_PDEF) end
Hit_final =  function (role) return Hit_final2(role) + GetGuildAttr(role,ATTR_HIT) end
Flee_final = function (role) return Flee_final2(role) + GetGuildAttr(role,ATTR_FLEE) end
Hrec_final = function (role) return Hrec_final2(role) + GetGuildAttr(role,ATTR_HREC) end
Srec_final = function (role) return Srec_final2(role) + GetGuildAttr(role,ATTR_SREC) end 
Aspd_final = function (role) return Aspd_final2(role) + GetGuildAttr(role,ATTR_ASPD) end
Mspd_final = function (role) return Mspd_final2(role) + GetGuildAttr(role,ATTR_MSPD) end 