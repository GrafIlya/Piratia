print('Loading packet.lua')
-- credits: Billy@pkodev.net, kong@pkodev.net, saeed, momo

--======================================================================
--[[ gam[m]e <-> ga[t]e ]]
--======================================================================
CMD_MT_KICKUSER = 1505

function KickCha(cha)
	local pkt = GetPacket()
	WriteCmd(pkt, CMD_MT_KICKUSER)
	SendPacket(cha, pkt)
end

--======================================================================
--[[ ga[m]e <-> [c]lient ]]
--======================================================================
CMD_MC_SAY = 501
CMD_MC_ENTERMAP = 516
CMD_MC_POPUP_NOTICE = 503
CMD_MC_GM_MAIL = 597
CMD_MC_GUILD_LISTCHALL = 905

function HelpInfoX(role, npc, text)
	local npcdata = -1
	if npc ~= nil and type(npc) == 'userdata' then
		npcdata = GetCharID(npc)
	end
	local packet = GetPacket()
	WriteCmd(packet, CMD_MC_TALKPAGE)
	WriteDword(packet, npcdata)
	WriteByte(packet, -1)
	WriteString(packet, text)
	SendPacket(role, packet)
end

function CharSay(role, target, text)
	local pkt = GetPacket()
	local tid = GetCharID(target)
	WriteCmd(pkt, CMD_MC_SAY);
	WriteDword(pkt, tid);
	WriteString(pkt, text);
	SendPacket(role, pkt);
end

function CloneX(cha) -- CloneX by Saeed
	local orginal_cha = cha
	if(ChaIsBoat(cha) == 1)then
		ship = TurnToShip(cha)
		cha = TurnToCha(cha)
	end
	local packet = GetPacket()
	WriteCmd(packet, CMD_MC_ENTERMAP)

	if(ChaIsBoat(orginal_cha) == 1)then
		SendPacket(ship, packet)
	else
		SendPacket(cha, packet)
	end
end

PopupNotice = PopupNotice or function(role, text) -- PopupNotice by Billy
	local packet = GetPacket() 
	WriteCmd(packet, CMD_MC_POPUP_NOTICE)
	WriteString(packet, text)
	SendPacket(role, packet) 
end 

function GmMail(role, str1, str2) --GmMail by Billy (not gmail xD)
	local packet = GetPacket() 
	WriteCmd(packet, CMD_MC_GM_MAIL)
	WriteString(packet, str1)
	if str2 ~= nil then
		WriteString(packet, str2)
	else
		WriteString(packet, '')
	end
	SendPacket(role, packet) 
end

function CloseClient(role) -- CloseClient by Billy
	local ID = GetRoleID(role)
	local packet = GetPacket()
	WriteCmd(packet, 935)
	SendPacket(role, packet)
end

function GuildBid(role)
	local packet = GetPacket()
	WriteCmd(packet, CMD_MC_GUILD_LISTCHALL)
	SendPacket(role, packet)
end

CMD_MC_KITBAG_CHECK_ASR = 553
function LockKitbag(cha)
	local packet = GetPacket()
	WriteCmd(packet, CMD_MC_KITBAG_CHECK_ASR)
	WriteByte(packet, 1)
	SendPacket(cha, packet)
end

function UnlockKitbag(cha)
	local packet = GetPacket()
	WriteCmd(packet, CMD_MC_KITBAG_CHECK_ASR)
	WriteByte(packet, 0)
	SendPacket(cha, packet)
end

CMD_MC_NOTIACTION = 508
function Blind(cha, toself)
	local packet = GetPacket()
	WriteCmd(packet, CMD_MC_NOTIACTION)
	WriteDword(packet, GetCharID(cha))
	WriteDword(packet, 0)
	WriteByte(packet, 5)
	for i = 1, 9 do
		local id = GetItemID(GetChaItem(cha, 1, i))
		if i == 2 then
			id = 825
		end
		WriteWord(packet, id)
	end
	NoticeChangeToEye(cha, packet, toself)
end

--======================================================================
--[[ ga[m]e <-> ga[m]e ]]
--======================================================================
CMD_MM_QUERY_CHA = 4003
CMD_MM_DO_STRING = 4015 -- lua_all

function QueryCha(role, targetname)
	local ID = GetRoleID(role)
	local packet = GetPacket()
	WriteCmd(packet, CMD_MM_QUERY_CHA)
	WriteDword(packet, ID)
	WriteString(packet, target)
	WriteDword(packet, ID)
	SendPacket(role, packet)
end

function lua_all(role, cmd)
	local packet = GetPacket()
	WriteCmd(packet, CMD_MM_DO_STRING)
	WriteDword(packet, 0)
	WriteString(packet, cmd)
	SendPacket(role, packet)
end

-- DealAllChaInGameServer(functionName)
-- DealAllChaInAllGameServer(functionName)
--[[ non packet functions ]]

function Say(character,text)
	local map_copy = GetChaMapCopy(character)
	local ply_num = GetMapCopyPlayerNum(map_copy)
	local ps = {}
	local i = 1
	BeginGetMapCopyPlayerCha(map_copy)
	for i = 1 , ply_num , 1 do
		ps = GetMapCopyNextPlayerCha(map_copy)
	end
	
	for i = 1 , ply_num , 1 do
		if ( ps~= 0 and ps~= nil ) then
			CharSay( ps , character , text )
		end
	end
end

--[[ timer to kick players ]]--
shutdown, Protected, KickTimer = false, Protected or {}, player_timer

player_timer = function(role)
	KickTimer(role)
	TerminateServer(role)
end

function TerminateServer(role)
	if shutdown then
		if IsPlayer(role) == 1 then
			if Protected[GetChaDefaultName(role)] == nil then 
				KickCha(role)
			end
		end
	end
end
-- &lua_all shutdown=true

