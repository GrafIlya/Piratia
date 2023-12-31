//=============================================================================
// FileName: CommFunc.h
// Creater: ZhangXuedong
// Date: 2005.01.06
// Comment:
//	2005.4.28	Arcol	add the text filter manager class: CTextFilter
//=============================================================================

#ifndef COMMFUNC_H
#define COMMFUNC_H

#include "CompCommand.h"
#include "SkillRecord.h"
#include "CharacterRecord.h"
#include "ItemRecord.h"
#include "ItemAttrType.h"
#include "JobType.h"
#include "NetRetCode.h"

extern bool KitbagStringConv(short sKbCapacity, std::string& strData);

//=============================================================================
/*---------------------------------------------------------------
* 用途:用于检测创建的角色外观数据是否合法
* nPart - 对应外观ID,nValue - 外观的值
* 返回值：外观数据是否合法。
*/
extern bool g_IsValidLook(int nType, int nPart, long nValue);

/*---------------------------------------------------------------
* ulAreaMask 区域类型
* 返回值：true 海洋。false 陆地
*/
inline bool g_IsSea(unsigned short usAreaMask) {
	return !(usAreaMask & enumAREA_TYPE_LAND);
}

inline bool g_IsLand(unsigned short usAreaMask) {
	return (usAreaMask & enumAREA_TYPE_LAND) || (usAreaMask & enumAREA_TYPE_BRIDGE);
}

// 根据传入的左右手道具ID
// 返回可以使用的默认技能,返回-1,没有技能
extern int g_GetItemSkill(int nLeftItemID, int nRightItemID);

extern BOOL IsDist(int x1, int y1, int x2, int y2, DWORD dwDist);

// 是否正确的技能目标
extern int g_IsRightSkillTar(int nTChaCtrlType, bool bTIsDie, bool bTChaBeSkilled, int nTChaArea,
							 int nSChaCtrlType, int nSSkillObjType, int nSSkillObjHabitat, int nSSkillEffType,
							 bool bIsTeammate, bool bIsFriend, bool bIsSelf);

/*---------------------------------------------------------------
* 参数:左手，右手，身体的道具ID。技能编号。
* 返回值:1-可使用,0-不可使用,-1-技能不存在
*/
extern int g_IsUseSkill(stNetChangeChaPart* pSEquip, int nSkillID);
extern bool g_IsRealItemID(int nItemID);

inline int g_IsUseSkill(stNetChangeChaPart* pSEquip, CSkillRecord* p) {
	if (!p)
		return -1;

	return g_IsUseSkill(pSEquip, p->nID);
}

inline int g_IsUseSeaLiveSkill(long lFitNo, CSkillRecord* p) {
	if (!p)
		return -1;

	for (int i = 0; i < defSKILL_ITEM_NEED_NUM; i++) {
		if (p->sItemNeed[0][i][0] == cchSkillRecordKeyValue)
			break;

		if (p->sItemNeed[0][i][0] == enumSKILL_ITEM_NEED_ID) {
			if (p->sItemNeed[0][i][1] == lFitNo)
				return 1;
		}
	}

	return 0;
}

inline bool g_IsPlyCtrlCha(int nChaCtrlType) {
	if (nChaCtrlType == enumCHACTRL_PLAYER || nChaCtrlType == enumCHACTRL_PLAYER_PET)
		return true;
	return false;
}

inline bool g_IsMonsCtrlCha(int nChaCtrlType) {
	if (nChaCtrlType == enumCHACTRL_MONS || nChaCtrlType == enumCHACTRL_MONS_TREE || nChaCtrlType == enumCHACTRL_MONS_MINE || nChaCtrlType == enumCHACTRL_MONS_FISH || nChaCtrlType == enumCHACTRL_MONS_DBOAT || nChaCtrlType == enumCHACTRL_MONS_REPAIRABLE)
		return true;
	return false;
}

inline bool g_IsNPCCtrlCha(int nChaCtrlType) {
	if (nChaCtrlType == enumCHACTRL_NPC || nChaCtrlType == enumCHACTRL_NPC_EVENT)
		return true;
	return false;
}

inline bool g_IsChaEnemyCtrlSide(int nSCtrlType, int nTCtrlType) {
	if (g_IsPlyCtrlCha(nSCtrlType) & g_IsPlyCtrlCha(nTCtrlType))
		return false;
	if (g_IsMonsCtrlCha(nSCtrlType) & g_IsMonsCtrlCha(nTCtrlType))
		return false;
	return true;
}

inline bool g_IsFileExist(const char* szFileName) {
	FILE* fp = NULL;
	if (NULL == (fp = fopen(szFileName, "rb")))
		return false;
	if (fp)
		fclose(fp);
	return true;
}

extern char* LookData2String(const stNetChangeChaPart* pLook, char* szLookBuf, int nLen, bool bNewLook = true);
extern bool Strin2LookData(stNetChangeChaPart* pLook, std::string& strData);
extern char* ShortcutData2String(const stNetShortCut* pShortcut, char* szShortcutBuf, int nLen);
extern bool String2ShortcutData(stNetShortCut* pShortcut, std::string& strData);

inline long g_ConvItemAttrTypeToCha(long lItemAttrType) {
	if (lItemAttrType >= ITEMATTR_COE_STR && lItemAttrType <= ITEMATTR_COE_PDEF)
		return lItemAttrType + (ATTR_ITEMC_STR - ITEMATTR_COE_STR);
	else if (lItemAttrType >= ITEMATTR_VAL_STR && lItemAttrType <= ITEMATTR_VAL_PDEF)
		return lItemAttrType + (ATTR_ITEMV_STR - ITEMATTR_VAL_STR);
	else
		return 0;
}

// 对应区域类型的参数个数
inline short g_GetRangeParamNum(char RangeType) {
	short sParamNum = 0;
	switch (RangeType) {
	case enumRANGE_TYPE_STICK:
		sParamNum = 2;
		break;
	case enumRANGE_TYPE_FAN:
		sParamNum = 2;
		break;
	case enumRANGE_TYPE_SQUARE:
		sParamNum = 1;
		break;
	case enumRANGE_TYPE_CIRCLE:
		sParamNum = 1;
		break;
	}

	return sParamNum + 1;
}

//=============================================================================
// chChaType 角色类型
// chChaTerrType 角色活动空间的类型
// bIsBlock 是否障碍
// ulAreaMask 区域类型
// 返回值：true 可在该单元上移动。false 不可移动
//=============================================================================
inline bool g_IsMoveAble(char chChaCtrlType, char chChaTerrType, unsigned short usAreaMask) {
	bool bRet1 = false;
	if (chChaTerrType == defCHA_TERRITORY_DISCRETIONAL)
		bRet1 = true;
	else if (chChaTerrType == defCHA_TERRITORY_LAND) {
		if (usAreaMask & enumAREA_TYPE_LAND || usAreaMask & enumAREA_TYPE_BRIDGE)
			bRet1 = true;
	} else if (chChaTerrType == defCHA_TERRITORY_SEA) {
		if (!(usAreaMask & enumAREA_TYPE_LAND))
			bRet1 = true;
	}

	bool bRet2 = true;
	if (usAreaMask & enumAREA_TYPE_NOT_FIGHT) // 非战斗区域
	{
		if (g_IsMonsCtrlCha(chChaCtrlType))
			bRet2 = false;
	}

	return bRet1 && bRet2;
}

inline const char* g_GetJobName(short sJobID) {
	if (sJobID < 0 || sJobID >= MAX_JOB_TYPE)
		return g_szJobName[0];

	return g_szJobName[sJobID];
}

inline short g_GetJobID(const char* szJobName) {
	for (short i = 0; i < MAX_JOB_TYPE; i++) {
		if (!strcmp(g_szJobName[i], szJobName))
			return i;
	}

	return 0;
}

inline const char* g_GetCityName(short sCityID) {
	if (sCityID < 0 || sCityID >= defMAX_CITY_NUM)
		return "";

	return g_szCityName[sCityID];
}

inline short g_GetCityID(const char* szCityName) {
	for (short i = 0; i < defMAX_CITY_NUM; i++) {
		if (!strcmp(g_szCityName[i], szCityName))
			return i;
	}

	return -1;
}

inline bool g_IsSeatPose(int pose) {
	return 16 == pose;
}

// 引发表现返回真
inline bool g_IsValidFightState(int nState) {
	return nState < enumFSTATE_TARGET_NO;
}

inline bool g_ExistStateIsDie(char chState) {
	if (chState >= enumEXISTS_WITHERING)
		return true;

	return false;
}

inline const char* g_GetItemAttrExplain(int v) {
	switch (v) {
	case ITEMATTR_COE_STR:
		return "谚豚"; // "力量加成";
	case ITEMATTR_COE_AGI:
		return "祟怅铖螯"; // "敏捷加成";
	case ITEMATTR_COE_DEX:
		return "翌黜铖螯"; // "专注加成";
	case ITEMATTR_COE_CON:
		return "义腩耠铈屙桢"; // "体质加成";
	case ITEMATTR_COE_STA:
		return "捏�"; // "精神加成";
	case ITEMATTR_COE_LUK:
		return "愉圜�"; // "幸运加成";
	case ITEMATTR_COE_ASPD:
		return "殃铕铖螯 莉嚓�"; // "攻击频率加成";
	case ITEMATTR_COE_ADIS:
		return "泥朦眍耱� 莉嚓�"; // "攻击距离加成";
	case ITEMATTR_COE_MNATK:
		return "惕龛爨朦磬� 莉嚓�"; // "最小攻击力加成";
	case ITEMATTR_COE_MXATK:
		return "锑犟桁嚯�� 莉嚓�"; // "最大攻击力加成";
	case ITEMATTR_COE_DEF:
		return "令眢� 青螓"; // "防御加成";
	case ITEMATTR_COE_MXHP:
		return "锑犟桁嚯 犷眢� 卿铕钼��"; // "最大HP加成";
	case ITEMATTR_COE_MXSP:
		return "锑犟桁嚯 令眢� 锑睇"; // "最大SP加成";
	case ITEMATTR_COE_FLEE:
		return "雨腩礤龛�"; // "闪避率加成";
	case ITEMATTR_COE_HIT:
		return "剜眈 羽铐�"; // "命中率加成";
	case ITEMATTR_COE_CRT:
		return "令眢� � 署栩梓羼觐祗 愉囵�"; // "爆击率加成";
	case ITEMATTR_COE_MF:
		return "令眢� � 剜眈� 蔓镟溴龛�"; // "寻宝率加成";
	case ITEMATTR_COE_HREC:
		return "殃铕铖螯 骂耨蜞眍怆屙�� 卿铕钼��"; // "HP恢复速度加成";
	case ITEMATTR_COE_SREC:
		return "殃铕铖螯 骂耱囗钼脲龛� 锑睇"; // "SP恢复速度加成";
	case ITEMATTR_COE_MSPD:
		return "殃铕铖螯 襄疱溻桄屙��"; // "移动速度加成";
	case ITEMATTR_COE_COL:
		return "殃铕铖蜩 念猁麒 锑蝈痂嚯钼"; // "资源采集速度加成";

	case ITEMATTR_VAL_STR:
		return "谚豚"; // "力量加成";
	case ITEMATTR_VAL_AGI:
		return "祟怅铖螯"; // "敏捷加成";
	case ITEMATTR_VAL_DEX:
		return "翌黜铖螯"; // "专注加成";
	case ITEMATTR_VAL_CON:
		return "义腩耠铈屙桢"; // "体质加成";
	case ITEMATTR_VAL_STA:
		return "捏�"; // "精神加成";
	case ITEMATTR_VAL_LUK:
		return "愉圜�"; // "幸运加成";
	case ITEMATTR_VAL_ASPD:
		return "殃铕铖螯 莉嚓�"; // "攻击频率加成";
	case ITEMATTR_VAL_ADIS:
		return "泥朦眍耱� 莉嚓�"; // "攻击距离加成";
	case ITEMATTR_VAL_MNATK:
		return "惕龛爨朦磬� 莉嚓�"; // "最小攻击力加成";
	case ITEMATTR_VAL_MXATK:
		return "锑犟桁嚯�� 莉嚓�"; // "最大攻击力加成";
	case ITEMATTR_VAL_DEF:
		return "青蜞"; // "防御加成";
	case ITEMATTR_VAL_MXHP:
		return "卿铕钼"; // "最大HP加成";
	case ITEMATTR_VAL_MXSP:
		return "锑磬"; // "最大SP加成";
	case ITEMATTR_VAL_FLEE:
		return "雨腩礤龛�"; // "闪避率加成";
	case ITEMATTR_VAL_HIT:
		return "剜眈 羽铐�"; // "命中率加成";
	case ITEMATTR_VAL_CRT:
		return "令眢� � 署栩梓羼觐祗 愉囵�"; // "爆击率加成";
	case ITEMATTR_VAL_MF:
		return "令眢� � 剜眈� 蔓镟溴龛�"; // "寻宝率加成";
	case ITEMATTR_VAL_HREC:
		return "殃铕铖螯 骂耨蜞眍怆屙�� 卿铕钼��"; // "HP恢复速度加成";
	case ITEMATTR_VAL_SREC:
		return "殃铕铖螯 骂耱囗钼脲龛� 锑睇"; // "SP恢复速度加成";
	case ITEMATTR_VAL_MSPD:
		return "殃铕铖螯 襄疱溻桄屙��"; // "移动速度加成";
	case ITEMATTR_VAL_COL:
		return "殃铕铖蜩 念猁麒 锑蝈痂嚯钼"; // "资源采集速度加成";

	case ITEMATTR_VAL_PDEF:
		return "澡玷麇耜铄 杨镳铗桠脲龛�"; // "物理抵抗加成";
	case ITEMATTR_MAXURE:
		return "念脬钼鬻眍耱�"; // "最大耐久度";
	case ITEMATTR_MAXENERGY:
		return "蓓屦汨�"; // "最大能量";
	default:
		return "湾桤忮耱睇� 踵疣牝屦桉蜩觇 桧耱痼戾眚钼"; // "未知道具属性";
	}
}

inline const char* g_GetServerError(int error_code) // 解析错误码
{
	switch (error_code) {
	case ERR_AP_INVALIDUSER:
		return "湾忮痦 嚓赅箜�"; // "无效账号";
	case ERR_AP_INVALIDPWD:
		return "湾忮痦 镟痤朦"; // "密码错误";
	case ERR_AP_ACTIVEUSER:
		return "狸蜩忄鲨� 嚓赅箜蜞 礤 箐嚯囫�"; // "激活用户失败";
	case ERR_AP_DISABLELOGIN:
		return "锣� 耦徨皴漤桕 � 磬耱��� 怵屐� 磬躅滂蝰� � 疱骅戾 耦躔囗屙�� 恹躅溧 桤 耔耱屐�. 项镳钺箝蝈 忸轵� 镱珂�."; // "目前您的角色正处于下线存盘过程中，请稍后再尝试登录。";
	case ERR_AP_LOGGED:
		return "蒡铗 嚓赅箜� 箧� 铐豚轫"; // "此帐号已处于登录状态";
	case ERR_AP_BANUSER:
		return "狸赅箜� 玎犭铌桊钼囗"; // "帐号已封停";
	case ERR_AP_GPSLOGGED:
		return "� 钽� GroupServer 羼螯 腩汨�"; // "此GroupServer已登录";
	case ERR_AP_GPSAUTHFAIL:
		return "蒡� 镳钼屦赅 GroupServer 礤 箐嚯囫�"; // "此GroupServer认证失败";
	case ERR_AP_SAVING:
		return "杨躔囗�屐 镥瘃铐噫�. 项怛铕栩� 镱稃蜿� 麇疱� 15狇尻箜�...."; // "正在保存你的角色，请15秒后重试...";
	case ERR_AP_LOGINTWICE:
		return "锣 篦弪磬� 玎镨顸 玎疱汨耱痂痤忄磬 溧脲觐"; // "你的账号在远处再次登录";
	case ERR_AP_ONLINE:
		return "锣� 嚓赅箜� 箧� 铐豚轫"; // "你的账号已在线";
	case ERR_AP_DISCONN:
		return "灭箫镱忸� 皴疴屦 铗觌屙"; // "GroupServer已断开";
	case ERR_AP_UNKNOWNCMD:
		return "礤桤忮耱眍� 耦汶帏屙桢, 礤 桁弪� 溴腩 �"; // "未知协议，不处理";
	case ERR_AP_TLSWRONG:
		return "铠栳赅 腩赅朦眍泐 耦躔囗屙��"; // "本地存储错误";
	case ERR_AP_NOBILL:
		return "佯铌 溴轳蜮�� 铋 篦弪眍� 玎镨耔 桉蝈�, 镱驵塍轳蜞, 镱镱腠栩�!"; // "此账号已过期，请充值！";

	case ERR_PT_LOGFAIL:
		return "硒栳赅 怩钿� � GateServer 磬 GroupServer"; // "GateServer向GroupServer的登录失败";
	case ERR_PT_SAMEGATENAME:
		return "GateServer � 腩汨� GateServer 桁妣� 钿桧嚓钼铄 桁�."; // "GateServer与已登录GateServer重名";

	case ERR_PT_INVALIDDAT:
		return "湾翦牝桠磬� 祛溴朦 溧眄"; // "无效的数据格式";
	case ERR_PT_INERR:
		return "铠栳赅 鲥腩耱眍耱� 铒屦圉梃 耦邃桧屙�� � 皴疴屦铎 "; // "服务器之间的操作完整性错误";
	case ERR_PT_NETEXCP:
		return "袜 皴疴屦� 篦弪睇� 玎镨皴� 忸珥桕豚 礤桉镳噔眍耱�"; // "帐号服务器故障";	// GroupServer发现的到AccuntServer的网络故障
	case ERR_PT_DBEXCP:
		return "礤桉镳噔眍耱� 皴疴屦� 徉琨 溧眄"; // "数据库服务器故障";	// GroupServer发现的到Database的故障
	case ERR_PT_INVALIDCHA:
		return "袜 蝈牦� 嚓赅箜蝈 礤� 玎镳铖� (蔓狃囹�/愉嚯栩�) 镥瘃铐噫�"; // "当前帐号不拥有请求(选择/删除)的角色";
	case ERR_PT_TOMAXCHA:
		return "漕耱桡眢蝾 爨犟桁嚯铄 觐腓麇耱忸 镥瘃铐噫彘, 觐蝾瘥� 恹 祛驽蝈 耦玟囹�"; // "已经达到最多能创建的角色数了";
	case ERR_PT_SAMECHANAME:
		return "褥� 镥瘃铐噫� 箧� 耋耱怏弪"; // "重复的角色名";
	case ERR_PT_INVALIDBIRTH:
		return "礤玎觐眄铄 戾耱� 痤驿屙��"; // "非法的出生地";
	case ERR_PT_TOOBIGCHANM:
		return "褥� 镥瘃铐噫� 耠桫觐� 潆桧眍�"; // "角色名太长";
	case ERR_PT_ISGLDLEADER:
		return "描朦滂� 漕腈磬 桁弪� 腓溴疣. 秧圜嚯� 疣耧篑蜩蝈 汨朦滂�, � 玎蝈� 箐嚯栩� 疋铄泐 镥瘃铐噫�."; // "公会不可一日无长，请先解散公会再删除角色";
	case ERR_PT_ERRCHANAME:
		return "湾漕矬耱桁铄 桁� 镥瘃铐噫�"; // "非法的角色名称";
	case ERR_PT_SERVERBUSY:
		return "谚耱屐� 玎��蜞, 镱怛铕栩� 镱稃蜿� 镱珂�"; // "系统忙，请稍后再试";
	case ERR_PT_TOOBIGPW2:
		return "怛铕�� 潆桧� 觐溧 礤漕矬耱桁�"; // "二次密码长度非法";
	case ERR_PT_INVALID_PW2:
		return "买铕铋 镟痤朦 礤 耦玟囗"; // "未创建角色保护二次密码";
	case ERR_PT_BADBOY:
		return "蔫�� 填�, 螓 铟屙� 耢咫��. � 忄� 耦钺腓 怆囫���. 项驵塍轳蜞, 犷朦 礤 耦忮瘌嚅蝈 镳噔铐囵篪屙栝!"; // "孩子，你很BT，已经自动对你作出了通报批评，要引以为戒，不可再犯！";

	case ERR_MC_NETEXCP:
		return "吾磬痼驽磬 桉觌栩咫�� 铠栳赅 腓龛� 磬 GateServer."; // "GateServer发现的网络异常";
	case ERR_MC_NOTSELCHA:
		return "蝈牦� 妁� 礤 钺疣犷蜞眄铄 耦耱��龛� 镥瘃铐噫�"; // "当前未处于选择角色状态";
	case ERR_MC_NOTPLAY:
		return "� 溧眄 祛戾眚 礤 � 桡疱, 礤 祛泱 铗镳噔栩� 觐爨礓� ENDPLAY."; // "当前不处于玩游戏状态，不能发送ENDPLAY命令";
	case ERR_MC_NOTARRIVE:
		return "鲥脲忄� 赅痱� 礤 祛驽� 猁螯 漕耱桡眢蜞"; // "目标地图不可到达";
	case ERR_MC_TOOMANYPLY:
		return "蒡铗 皴疴屦 � 磬耱��� 怵屐� 玎镱腠屙, 镱驵塍轳蜞, 恹徨痂蝈 漯筱铋 皴疴屦!"; // "本服务器组人数已满, 请选择其它组进行游戏!";
	case ERR_MC_NOTLOGIN:
		return "蔓 礤 噔蝾痂珙忄睇"; // "你尚未登陆";
	case ERR_MC_VER_ERROR:
		return "硒栳赅 忮瘃梃 觌桢眚�, 皴疴屦 铗赅玎腭� 镱潢膻麒螯��!"; // "客户端的版本号错误,服务器拒绝登录！";
	case ERR_MC_ENTER_ERROR:
		return "礤 箐嚯铖� 忸轵� 磬 赅痱�!"; // "进入地图失败！";
	case ERR_MC_ENTER_POS:
		return "项腩驽龛� 磬 赅痱� 礤玎觐眄铄, 忄� 铗镳噔�� 钺疣蝽� � 泐痤� 忄泐 痤驿屙��, 镱驵塍轳蜞, 镥疱玎殇栩� � 耔耱屐�.!"; // "地图位置非法，您将被送回出生城市，请重新登陆！";

	case ERR_TM_OVERNAME:
		return "褥� 桡痤忸泐 皴疴屦� 镱怛铕�弪��"; // "GameServer名重复";
	case ERR_TM_OVERMAP:
		return "GameServerMapNameRepeated"; // "GameServer上地图名重复";
	case ERR_TM_MAPERR:
		return "硒栳赅 磬珥圜屙�� �琨赅 赅痱� GameServer"; // "GameServer地图配置语法错误";

	case ERR_SUCCESS:
		return "逆尻 耠桫觐� 烈, 镳噔桦� � 耧痤耔� 戾��, 羼腓 黩�-蝾 礤 蜞�.!"; // "Jack太BT了，正确也来问我什么错误！";
	default: {
		int l_error_code = error_code;
		l_error_code /= 500;
		l_error_code *= 500;
		static char l_buffer[500];
		char l_convt[20];
		switch (l_error_code) {
		case ERR_MC_BASE:
			return strcat(strcpy(l_buffer, itoa(error_code, l_convt, 10)), "(GameServer/GateServer->暑� 铠栳觇 忸玮疣蜞 觌桢眚�, 镳铖蝠囗耱忸 1�500)"); //"(GameServer/GateServer->Client返回的错误码空间1－500)");
		case ERR_PT_BASE:
			return strcat(strcpy(l_buffer, itoa(error_code, l_convt, 10)), "(GroupServer->GateServer 忸玮疣弪 觐� 铠栳觇 � 滂囡噻铐� 501�1000.)"); //"(GroupServer->GateServer返回的错误码空间501－1000)");
		case ERR_AP_BASE:
			return strcat(strcpy(l_buffer, itoa(error_code, l_convt, 10)), "(AccountServer->GroupServe 忸玮疣弪 觐� 铠栳觇 1001-1500)"); //"(AccountServer->GroupServer返回的错误码空间1001－1500)");
		case ERR_MT_BASE:
			return strcat(strcpy(l_buffer, itoa(error_code, l_convt, 10)), "(GameServer->GateServer 忸玮疣弪 觐� 铠栳觇 � 滂囡噻铐� 1501�2000.)"); //"(GameServer->GateServer返回的错误码空间1501－2000)");
		default:
			return strcat(strcpy(l_buffer, itoa(error_code, l_convt, 10)), "(逆尻 耠桫觐� 耋爨聒邃�, 铐 耦忮瘌桦 铠栳牦, � 觐蝾痤� � 溧驽 礤 珥帼..)"); //"(Jack太BT了，弄个错误连我都不认识。)");
		}
	}
	}
}

inline bool isNumeric(const char* name, unsigned short len) {
	const unsigned char* l_name = reinterpret_cast<const unsigned char*>(name);
	if (len == 0) {
		return false;
	}
	for (unsigned short i = 0; i < len; i++) {
		if (!l_name[i] || !isdigit(l_name[i])) {
			return false;
		}
	}
	return true;
}

inline bool isAlphaNumeric(const char* name, unsigned short len) {
	const unsigned char* l_name = reinterpret_cast<const unsigned char*>(name);
	if (len == 0) {
		return false;
	}
	for (unsigned short i = 0; i < len; i++) {
		if (!l_name[i] || !isalnum(l_name[i])) {
			return false;
		}
	}
	return true;
}

//本函数功能包括检查字符串中GBK双字节汉字字符的完整性、网络包中字符串的完整性等。
//name为只允许有大小写字母数字和汉字（去除全角空格）才返回true;
//len参数为字符串name的长度=strlen(name),不包括结尾NULL字符。
inline bool IsValidName(const char* name, unsigned short len) {
	const unsigned char* l_name = reinterpret_cast<const unsigned char*>(name);
	bool l_ishan = false;
	//if (len == 0)
	//	return 0;
	for (unsigned short i = 0; i < len; i++) {
		if (!l_name[i]) {
			return false;
		} else if (l_ishan) {
			if (l_name[i - 1] == 0xA1 && l_name[i] == 0xA1) //过滤全角空格
			{
				return false;
			}
			if (l_name[i] > 0x3F && l_name[i] < 0xFF && l_name[i] != 0x7F) {
				l_ishan = false;
			} else {
				return false;
			}
		} else if (l_name[i] > 0x80 && l_name[i] < 0xFF) {
			l_ishan = true;
		} else if ((l_name[i] >= 'A' && l_name[i] <= 'Z') || (l_name[i] >= 'a' && l_name[i] <= 'z') || (l_name[i] >= '0' && l_name[i] <= '9')) {

		} else {
			return false;
		}
	}
	return !l_ishan;
}

inline const char* g_GetUseItemFailedInfo(short sErrorID) {
	switch (sErrorID) {
	case enumITEMOPT_SUCCESS:
		return "物屦圉�� � 钺牝铎 镳铠豚 篑镥�"; // "道具操作成功";
		break;
	case enumITEMOPT_ERROR_NONE:
		return "吾铕箐钼囗桢 礤 耋耱怏弪"; // "道具不存在";
		break;
	case enumITEMOPT_ERROR_KBFULL:
		return "软忮眚囵� 镱腩�"; // "道具栏已满";
		break;
	case enumITEMOPT_ERROR_UNUSE:
		return "湾 箐嚯铖� 桉镱朦珙忄螯 镳邃戾�"; // "道具使用失败";
		break;
	case enumITEMOPT_ERROR_UNPICKUP:
		return "礡l??荒蹺癈?"; // "道具不能拾取";
		break;
	case enumITEMOPT_ERROR_UNTHROW:
		return "橡邃戾� 礤朦�� 狃铖栩�"; // "道具不能丢弃";
		break;
	case enumITEMOPT_ERROR_UNDEL:
		return "橡邃戾� 礤 祛驽� 猁螯 箜梓蝾驽�"; // "道具不能销毁";
		break;
	case enumITEMOPT_ERROR_KBLOCK:
		return "桧忮眚囵� 磬 溧眄 祛戾眚 玎犭铌桊钼囗"; // "道具栏处于锁定状态";
		break;
	case enumITEMOPT_ERROR_DISTANCE:
		return "朽耨蝾�龛� 耠桫觐� 犷朦�"; // "距离太远";
		break;
	case enumITEMOPT_ERROR_EQUIPLV:
		return "湾耦铗忮蝰蜮桢 箴钼�� 钺铕箐钼囗��"; // "装备等级不满足";
		break;
	case enumITEMOPT_ERROR_EQUIPJOB:
		return "湾 耦铗忮蝰蜮箦� 觌囫耋 钺铕箐钼囗��"; // "装备职业不满足";
		break;
	case enumITEMOPT_ERROR_STATE:
		return "湾忸珈铈眍 箫疣怆�螯 镳邃戾蜞扈 � 蝈牦� 耦耱��龛�"; // "该状态下不能操作道具";
		break;
	case enumITEMOPT_ERROR_PROTECT:
		return "吾牝 磬躅滂蝰� 镱� 玎蝾�"; // "道具被保护";
		break;
	case enumITEMOPT_ERROR_AREA:
		return "漯筱铋 蜩� 疱汨铐�"; // "不同的区域类型";
		break;
	case enumITEMOPT_ERROR_BODY:
		return "蜩� 襻铕觇 礤 耦铗忮蝰蜮箦�"; // "体型不匹配";
		break;
	case enumITEMOPT_ERROR_TYPE:
		return "湾忸珈铈眍 耦躔囗栩� 铗 蝾忄�"; // "此道具无法存放";
		break;
	case enumITEMOPT_ERROR_INVALID:
		return "翌忄� 礤 桉镱朦珞弪��"; // "无效的道具";
		break;
	case enumITEMOPT_ERROR_KBRANGE:
		return "忭� 滂囡噻铐� 桧忮眚囵�"; // "超出道具栏范围";
		break;
	default:
		return "湾桤忮耱睇� 觐� 铠栳觇 桉镱朦珙忄龛� 屐屙蜞"; // "未知的道具操作失败码";
		break;
	}
}

class CTextFilter {
public:
#define eTableMax 5
	enum eFilterTable { NAME_TABLE = 0,
						DIALOG_TABLE = 1,
						MAX_TABLE = eTableMax };
	/*
	* Warning : Do not use MAX_TABLE enum value, it just use for the maximum limit definition,
	*			If you want to expand this enum table value more than the default number eTableMax(5),
	*			please increase the eTableMax definition
	*/

	CTextFilter();
	~CTextFilter();
	static bool Add(const eFilterTable eTable, const char* szFilterText);
	static bool IsLegalText(const eFilterTable eTable, const string strText);
	static bool Filter(const eFilterTable eTable, string& strText);
	static bool LoadFile(const char* szFileName, const eFilterTable eTable = NAME_TABLE);
	static BYTE* GetNowSign(const eFilterTable eTable);

private:
	static bool ReplaceText(string& strText, const string* pstrFilterText);
	static bool bCheckLegalText(const string& strText, const string* pstrIllegalText);

	static vector<string> m_FilterTable[eTableMax];
	static BYTE m_NowSign[eTableMax][8];
};

#endif // COMMFUNC_H