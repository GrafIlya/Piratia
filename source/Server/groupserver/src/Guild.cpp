/* Generated by Together */

#include "dstring.h"
#include "GroupServerApp.h"
#include "Player.h"
#include "Guild.h"
#include "netcommand.h"
_DBC_USING

Guild::Guild(uLong size) : PreAllocStru(size), m_id(0), m_leader(0) {
	m_name[0] = 0;
}
Guild::~Guild() {}
void Guild::Initially() {
	RunBiDirectItem<Guild>::Initially();
	m_id = 0;
	m_name[0] = 0;
	m_leader = 0;
}
void Guild::Finally() {
	RunBiDirectItem<Guild>::Finally();
}
Guild* Guild::Alloc() {
	return g_gpsvr->m_gldheap.Get();
}
bool Guild::BeginRun() {
	return _BeginRun(&(g_gpsvr->m_gldlst)) ? true : false;
}
bool Guild::EndRun() {
	return _EndRun() ? true : false;
}
Player* Guild::FindGuildMemByChaID(uLong id) {
	Player* l_ply = 0;
	RunChainGetArmor<GuildMember> l(*this);
	while (l_ply = static_cast<Player*>(GetNextItem())) {
		if (l_ply->m_chaid[l_ply->m_currcha] == id)
			break;
	}
	l.unlock();
	return l_ply;
}
void ChkGuild::Process() {
	RefArmor l(g_ref);
	if (!g_exit) {
		Guild* l_gld = 0;
		RunChainGetArmor<Guild> l(g_gpsvr->m_gldlst);
		while (l_gld = g_gpsvr->m_gldlst.GetNextItem()) {
			if (l_gld->m_stat.IsTrue()) {
				uLong l_remain_min = l_gld->m_remain_minute - ((GetTickCount() - l_gld->m_tick) / (60 * 1000));
				if ((l_remain_min <= 60 && l_remain_min % 10 == 0) || (l_remain_min <= 10)) {
					Player* l_plylst[10240];
					short l_plynum = 0;

					Player* l_ply;
					RunChainGetArmor<GuildMember> l_lock(*l_gld);
					while (l_ply = static_cast<Player*>(l_gld->GetNextItem())) {
						l_plylst[l_plynum] = l_ply;
						l_plynum++;
					}
					l_lock.unlock();
					WPacket l_wpk = g_gpsvr->GetWPacket();
					l_wpk.WriteCmd(CMD_MC_SYSINFO);
					/*l_wpk.WriteString(dstring("你所属的公会将在")<<l_remain_min<<"分钟内因为["
						<<(l_gld->m_stat.IsTrue(0x1)?"会费不足":(l_gld->m_stat.IsTrue(0x2)?"成员数不足":(l_gld->m_stat.IsTrue(0x4)?"会长声望不足":"")))
						<<"]而解散.");
					*/
					char l_buf[512];
					sprintf(l_buf, RES_STRING(GP_GUILD_CPP_00001), l_remain_min,
							(l_gld->m_stat.IsTrue(0x1) ? RES_STRING(GP_GUILD_CPP_00002) : (l_gld->m_stat.IsTrue(0x2) ? RES_STRING(GP_GUILD_CPP_00003) : (l_gld->m_stat.IsTrue(0x4) ? RES_STRING(GP_GUILD_CPP_00004) : ""))));
					l_wpk.WriteString(l_buf);
					g_gpsvr->SendToClient(l_plylst, l_plynum, l_wpk);
				}
				if (l_remain_min == 0) {
					Player* l_plylst[10240];
					short l_plynum = 0;

					Player* l_ply;
					RunChainGetArmor<GuildMember> l_lock(*l_gld);
					while (l_ply = static_cast<Player*>(l_gld->GetNextItem())) {
						l_ply->m_guild[l_ply->m_currcha] = 0;
						l_ply->LeaveGuild();

						l_plylst[l_plynum] = l_ply;
						l_plynum++;
					}
					l_lock.unlock();
					if (l_plynum > 0) {
						WPacket l_wpk = g_gpsvr->GetWPacket();
						l_wpk.WriteCmd(CMD_PC_GUILD);
						l_wpk.WriteChar(MSG_GUILD_STOP);
						g_gpsvr->SendToClient(l_plylst, l_plynum, l_wpk);
						l_wpk = g_gpsvr->GetWPacket();
						l_wpk.WriteCmd(CMD_PM_GUILD_DISBAND);
						g_gpsvr->SendToClient(l_plylst, l_plynum, l_wpk);
					}
					MutexArmor l_lockDB(g_gpsvr->m_mtxDB);
					g_gpsvr->m_tblguilds->Disband(l_gld->m_id);
				}
			}
		}
		l.unlock();
	}
}
