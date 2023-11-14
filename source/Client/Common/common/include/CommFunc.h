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
* ��;:���ڼ�ⴴ���Ľ�ɫ��������Ƿ�Ϸ�
* nPart - ��Ӧ���ID,nValue - ��۵�ֵ
* ����ֵ����������Ƿ�Ϸ���
*/
extern bool g_IsValidLook(int nType, int nPart, long nValue);

/*---------------------------------------------------------------
* ulAreaMask ��������
* ����ֵ��true ����false ½��
*/
inline bool g_IsSea(unsigned short usAreaMask) {
	return !(usAreaMask & enumAREA_TYPE_LAND);
}

inline bool g_IsLand(unsigned short usAreaMask) {
	return (usAreaMask & enumAREA_TYPE_LAND) || (usAreaMask & enumAREA_TYPE_BRIDGE);
}

// ���ݴ���������ֵ���ID
// ���ؿ���ʹ�õ�Ĭ�ϼ���,����-1,û�м���
extern int g_GetItemSkill(int nLeftItemID, int nRightItemID);

extern BOOL IsDist(int x1, int y1, int x2, int y2, DWORD dwDist);

// �Ƿ���ȷ�ļ���Ŀ��
extern int g_IsRightSkillTar(int nTChaCtrlType, bool bTIsDie, bool bTChaBeSkilled, int nTChaArea,
							 int nSChaCtrlType, int nSSkillObjType, int nSSkillObjHabitat, int nSSkillEffType,
							 bool bIsTeammate, bool bIsFriend, bool bIsSelf);

/*---------------------------------------------------------------
* ����:���֣����֣�����ĵ���ID�����ܱ�š�
* ����ֵ:1-��ʹ��,0-����ʹ��,-1-���ܲ�����
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

// ��Ӧ�������͵Ĳ�������
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
// chChaType ��ɫ����
// chChaTerrType ��ɫ��ռ������
// bIsBlock �Ƿ��ϰ�
// ulAreaMask ��������
// ����ֵ��true ���ڸõ�Ԫ���ƶ���false �����ƶ�
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
	if (usAreaMask & enumAREA_TYPE_NOT_FIGHT) // ��ս������
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

// �������ַ�����
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
		return "����"; // "�����ӳ�";
	case ITEMATTR_COE_AGI:
		return "��������"; // "���ݼӳ�";
	case ITEMATTR_COE_DEX:
		return "��������"; // "רע�ӳ�";
	case ITEMATTR_COE_CON:
		return "������������"; // "���ʼӳ�";
	case ITEMATTR_COE_STA:
		return "���"; // "����ӳ�";
	case ITEMATTR_COE_LUK:
		return "�����"; // "���˼ӳ�";
	case ITEMATTR_COE_ASPD:
		return "�������� �����"; // "����Ƶ�ʼӳ�";
	case ITEMATTR_COE_ADIS:
		return "��������� �����"; // "��������ӳ�";
	case ITEMATTR_COE_MNATK:
		return "����������� �����"; // "��С�������ӳ�";
	case ITEMATTR_COE_MXATK:
		return "������������ �����"; // "��󹥻����ӳ�";
	case ITEMATTR_COE_DEF:
		return "����� ������"; // "�����ӳ�";
	case ITEMATTR_COE_MXHP:
		return "������������ ����� ��������"; // "���HP�ӳ�";
	case ITEMATTR_COE_MXSP:
		return "������������ ����� ����"; // "���SP�ӳ�";
	case ITEMATTR_COE_FLEE:
		return "���������"; // "�����ʼӳ�";
	case ITEMATTR_COE_HIT:
		return "���� �����"; // "�����ʼӳ�";
	case ITEMATTR_COE_CRT:
		return "����� � ������������ �����"; // "�����ʼӳ�";
	case ITEMATTR_COE_MF:
		return "����� � ����� ���������"; // "Ѱ���ʼӳ�";
	case ITEMATTR_COE_HREC:
		return "�������� �������������� ��������"; // "HP�ָ��ٶȼӳ�";
	case ITEMATTR_COE_SREC:
		return "�������� ������������� ����"; // "SP�ָ��ٶȼӳ�";
	case ITEMATTR_COE_MSPD:
		return "�������� ������������"; // "�ƶ��ٶȼӳ�";
	case ITEMATTR_COE_COL:
		return "�������� ������ ����������"; // "��Դ�ɼ��ٶȼӳ�";

	case ITEMATTR_VAL_STR:
		return "����"; // "�����ӳ�";
	case ITEMATTR_VAL_AGI:
		return "��������"; // "���ݼӳ�";
	case ITEMATTR_VAL_DEX:
		return "��������"; // "רע�ӳ�";
	case ITEMATTR_VAL_CON:
		return "������������"; // "���ʼӳ�";
	case ITEMATTR_VAL_STA:
		return "���"; // "����ӳ�";
	case ITEMATTR_VAL_LUK:
		return "�����"; // "���˼ӳ�";
	case ITEMATTR_VAL_ASPD:
		return "�������� �����"; // "����Ƶ�ʼӳ�";
	case ITEMATTR_VAL_ADIS:
		return "��������� �����"; // "��������ӳ�";
	case ITEMATTR_VAL_MNATK:
		return "����������� �����"; // "��С�������ӳ�";
	case ITEMATTR_VAL_MXATK:
		return "������������ �����"; // "��󹥻����ӳ�";
	case ITEMATTR_VAL_DEF:
		return "������"; // "�����ӳ�";
	case ITEMATTR_VAL_MXHP:
		return "��������"; // "���HP�ӳ�";
	case ITEMATTR_VAL_MXSP:
		return "����"; // "���SP�ӳ�";
	case ITEMATTR_VAL_FLEE:
		return "���������"; // "�����ʼӳ�";
	case ITEMATTR_VAL_HIT:
		return "���� �����"; // "�����ʼӳ�";
	case ITEMATTR_VAL_CRT:
		return "����� � ������������ �����"; // "�����ʼӳ�";
	case ITEMATTR_VAL_MF:
		return "����� � ����� ���������"; // "Ѱ���ʼӳ�";
	case ITEMATTR_VAL_HREC:
		return "�������� �������������� ��������"; // "HP�ָ��ٶȼӳ�";
	case ITEMATTR_VAL_SREC:
		return "�������� ������������� ����"; // "SP�ָ��ٶȼӳ�";
	case ITEMATTR_VAL_MSPD:
		return "�������� ������������"; // "�ƶ��ٶȼӳ�";
	case ITEMATTR_VAL_COL:
		return "�������� ������ ����������"; // "��Դ�ɼ��ٶȼӳ�";

	case ITEMATTR_VAL_PDEF:
		return "���������� �������������"; // "����ֿ��ӳ�";
	case ITEMATTR_MAXURE:
		return "�������������"; // "����;ö�";
	case ITEMATTR_MAXENERGY:
		return "�������"; // "�������";
	default:
		return "����������� �������������� ������������"; // "δ֪��������";
	}
}

inline const char* g_GetServerError(int error_code) // ����������
{
	switch (error_code) {
	case ERR_AP_INVALIDUSER:
		return "�������� �������"; // "��Ч�˺�";
	case ERR_AP_INVALIDPWD:
		return "�������� ������"; // "�������";
	case ERR_AP_ACTIVEUSER:
		return "��������� �������� �� �������"; // "�����û�ʧ��";
	case ERR_AP_DISABLELOGIN:
		return "��� ���������� � ��������� ����� ��������� � ������ ���������� ������ �� �������. ���������� ����� �����."; // "Ŀǰ���Ľ�ɫ���������ߴ��̹����У����Ժ��ٳ��Ե�¼��";
	case ERR_AP_LOGGED:
		return "���� ������� ��� ������"; // "���ʺ��Ѵ��ڵ�¼״̬";
	case ERR_AP_BANUSER:
		return "������� ������������"; // "�ʺ��ѷ�ͣ";
	case ERR_AP_GPSLOGGED:
		return "� ����� GroupServer ���� �����"; // "��GroupServer�ѵ�¼";
	case ERR_AP_GPSAUTHFAIL:
		return "��� �������� GroupServer �� �������"; // "��GroupServer��֤ʧ��";
	case ERR_AP_SAVING:
		return "��������� ���������. ��������� ������� ����� 15�������...."; // "���ڱ�����Ľ�ɫ����15�������...";
	case ERR_AP_LOGINTWICE:
		return "���� ������� ������ ���������������� ������"; // "����˺���Զ���ٴε�¼";
	case ERR_AP_ONLINE:
		return "��� ������� ��� ������"; // "����˺�������";
	case ERR_AP_DISCONN:
		return "��������� ������ ��������"; // "GroupServer�ѶϿ�";
	case ERR_AP_UNKNOWNCMD:
		return "����������� ����������, �� ����� ���� �"; // "δ֪Э�飬������";
	case ERR_AP_TLSWRONG:
		return "������ ���������� ����������"; // "���ش洢����";
	case ERR_AP_NOBILL:
		return "���� �������� ���� ������� ������ �����, ����������, ���������!"; // "���˺��ѹ��ڣ����ֵ��";

	case ERR_PT_LOGFAIL:
		return "������ ����� � GateServer �� GroupServer"; // "GateServer��GroupServer�ĵ�¼ʧ��";
	case ERR_PT_SAMEGATENAME:
		return "GateServer � ����� GateServer ����� ���������� ���."; // "GateServer���ѵ�¼GateServer����";

	case ERR_PT_INVALIDDAT:
		return "������������� ������ ������"; // "��Ч�����ݸ�ʽ";
	case ERR_PT_INERR:
		return "������ ����������� �������� ���������� � �������� "; // "������֮��Ĳ��������Դ���";
	case ERR_PT_NETEXCP:
		return "�� ������� ������� ������� �������� �������������"; // "�ʺŷ���������";	// GroupServer���ֵĵ�AccuntServer���������
	case ERR_PT_DBEXCP:
		return "������������� ������� ���� ������"; // "���ݿ����������";	// GroupServer���ֵĵ�Database�Ĺ���
	case ERR_PT_INVALIDCHA:
		return "�� ������� �������� ��� ������� (�������/�������) ���������"; // "��ǰ�ʺŲ�ӵ������(ѡ��/ɾ��)�Ľ�ɫ";
	case ERR_PT_TOMAXCHA:
		return "���������� ������������ ���������� ����������, ������� �� ������ �������"; // "�Ѿ��ﵽ����ܴ����Ľ�ɫ����";
	case ERR_PT_SAMECHANAME:
		return "��� ��������� ��� ����������"; // "�ظ��Ľ�ɫ��";
	case ERR_PT_INVALIDBIRTH:
		return "���������� ����� ��������"; // "�Ƿ��ĳ�����";
	case ERR_PT_TOOBIGCHANM:
		return "��� ��������� ������� �������"; // "��ɫ��̫��";
	case ERR_PT_ISGLDLEADER:
		return "������� ������ ����� ������. ������� ���������� �������, � ����� ������� ������ ���������."; // "���᲻��һ���޳������Ƚ�ɢ������ɾ����ɫ";
	case ERR_PT_ERRCHANAME:
		return "������������ ��� ���������"; // "�Ƿ��Ľ�ɫ����";
	case ERR_PT_SERVERBUSY:
		return "������� ������, ��������� ������� �����"; // "ϵͳæ�����Ժ�����";
	case ERR_PT_TOOBIGPW2:
		return "������ ����� ���� �����������"; // "�������볤�ȷǷ�";
	case ERR_PT_INVALID_PW2:
		return "������ ������ �� ������"; // "δ������ɫ������������";
	case ERR_PT_BADBOY:
		return "���� ���, �� ����� ������. � ��� �������� �������. ����������, ������ �� ���������� ��������������!"; // "���ӣ����BT���Ѿ��Զ�����������ͨ��������Ҫ����Ϊ�䣬�����ٷ���";

	case ERR_MC_NETEXCP:
		return "���������� �������������� ������ ����� �� GateServer."; // "GateServer���ֵ������쳣";
	case ERR_MC_NOTSELCHA:
		return "������� ��� �� ������������ ��������� ���������"; // "��ǰδ����ѡ���ɫ״̬";
	case ERR_MC_NOTPLAY:
		return "� ������ ������ �� � ����, �� ���� ��������� ������� ENDPLAY."; // "��ǰ����������Ϸ״̬�����ܷ���ENDPLAY����";
	case ERR_MC_NOTARRIVE:
		return "������� ����� �� ����� ���� ����������"; // "Ŀ���ͼ���ɵ���";
	case ERR_MC_TOOMANYPLY:
		return "���� ������ � ��������� ����� ��������, ����������, �������� ������ ������!"; // "������������������, ��ѡ�������������Ϸ!";
	case ERR_MC_NOTLOGIN:
		return "�� �� ������������"; // "����δ��½";
	case ERR_MC_VER_ERROR:
		return "������ ������ �������, ������ ��������� ������������!"; // "�ͻ��˵İ汾�Ŵ���,�������ܾ���¼��";
	case ERR_MC_ENTER_ERROR:
		return "�� ������� ����� �� �����!"; // "�����ͼʧ�ܣ�";
	case ERR_MC_ENTER_POS:
		return "��������� �� ����� ����������, ��� �������� ������� � ����� ������ ��������, ����������, ����������� � �������.!"; // "��ͼλ�÷Ƿ����������ͻس������У������µ�½��";

	case ERR_TM_OVERNAME:
		return "��� �������� ������� �����������"; // "GameServer���ظ�";
	case ERR_TM_OVERMAP:
		return "GameServerMapNameRepeated"; // "GameServer�ϵ�ͼ���ظ�";
	case ERR_TM_MAPERR:
		return "������ ���������� ����� ����� GameServer"; // "GameServer��ͼ�����﷨����";

	case ERR_SUCCESS:
		return "���� ������� ��, ��������� � ������� ����, ���� ���-�� �� ���.!"; // "Jack̫BT�ˣ���ȷҲ������ʲô����";
	default: {
		int l_error_code = error_code;
		l_error_code /= 500;
		l_error_code *= 500;
		static char l_buffer[500];
		char l_convt[20];
		switch (l_error_code) {
		case ERR_MC_BASE:
			return strcat(strcpy(l_buffer, itoa(error_code, l_convt, 10)), "(GameServer/GateServer->��� ������ �������� �������, ������������ 1�500)"); //"(GameServer/GateServer->Client���صĴ�����ռ�1��500)");
		case ERR_PT_BASE:
			return strcat(strcpy(l_buffer, itoa(error_code, l_convt, 10)), "(GroupServer->GateServer ���������� ��� ������ � ��������� 501�1000.)"); //"(GroupServer->GateServer���صĴ�����ռ�501��1000)");
		case ERR_AP_BASE:
			return strcat(strcpy(l_buffer, itoa(error_code, l_convt, 10)), "(AccountServer->GroupServe ���������� ��� ������ 1001-1500)"); //"(AccountServer->GroupServer���صĴ�����ռ�1001��1500)");
		case ERR_MT_BASE:
			return strcat(strcpy(l_buffer, itoa(error_code, l_convt, 10)), "(GameServer->GateServer ���������� ��� ������ � ��������� 1501�2000.)"); //"(GameServer->GateServer���صĴ�����ռ�1501��2000)");
		default:
			return strcat(strcpy(l_buffer, itoa(error_code, l_convt, 10)), "(���� ������� �����������, �� �������� ������, � ������� � ���� �� ����..)"); //"(Jack̫BT�ˣ�Ū���������Ҷ�����ʶ��)");
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

//���������ܰ�������ַ�����GBK˫�ֽں����ַ��������ԡ���������ַ����������Եȡ�
//nameΪֻ�����д�Сд��ĸ���ֺͺ��֣�ȥ��ȫ�ǿո񣩲ŷ���true;
//len����Ϊ�ַ���name�ĳ���=strlen(name),��������βNULL�ַ���
inline bool IsValidName(const char* name, unsigned short len) {
	const unsigned char* l_name = reinterpret_cast<const unsigned char*>(name);
	bool l_ishan = false;
	//if (len == 0)
	//	return 0;
	for (unsigned short i = 0; i < len; i++) {
		if (!l_name[i]) {
			return false;
		} else if (l_ishan) {
			if (l_name[i - 1] == 0xA1 && l_name[i] == 0xA1) //����ȫ�ǿո�
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
		return "�������� � �������� ������ �������"; // "���߲����ɹ�";
		break;
	case enumITEMOPT_ERROR_NONE:
		return "������������ �� ����������"; // "���߲�����";
		break;
	case enumITEMOPT_ERROR_KBFULL:
		return "��������� �����"; // "����������";
		break;
	case enumITEMOPT_ERROR_UNUSE:
		return "�� ������� ������������ �������"; // "����ʹ��ʧ��";
		break;
	case enumITEMOPT_ERROR_UNPICKUP:
		return "�Rl??���E�C?"; // "���߲���ʰȡ";
		break;
	case enumITEMOPT_ERROR_UNTHROW:
		return "������� ������ �������"; // "���߲��ܶ���";
		break;
	case enumITEMOPT_ERROR_UNDEL:
		return "������� �� ����� ���� ���������"; // "���߲�������";
		break;
	case enumITEMOPT_ERROR_KBLOCK:
		return "��������� �� ������ ������ ������������"; // "��������������״̬";
		break;
	case enumITEMOPT_ERROR_DISTANCE:
		return "���������� ������� �������"; // "����̫Զ";
		break;
	case enumITEMOPT_ERROR_EQUIPLV:
		return "�������������� ������ ������������"; // "װ���ȼ�������";
		break;
	case enumITEMOPT_ERROR_EQUIPJOB:
		return "�� ������������� ������ ������������"; // "װ��ְҵ������";
		break;
	case enumITEMOPT_ERROR_STATE:
		return "���������� ��������� ���������� � ������� ���������"; // "��״̬�²��ܲ�������";
		break;
	case enumITEMOPT_ERROR_PROTECT:
		return "������ ��������� ��� �������"; // "���߱�����";
		break;
	case enumITEMOPT_ERROR_AREA:
		return "������ ��� �������"; // "��ͬ����������";
		break;
	case enumITEMOPT_ERROR_BODY:
		return "��� ������ �� �������������"; // "���Ͳ�ƥ��";
		break;
	case enumITEMOPT_ERROR_TYPE:
		return "���������� ��������� ���� �����"; // "�˵����޷����";
		break;
	case enumITEMOPT_ERROR_INVALID:
		return "����� �� ������������"; // "��Ч�ĵ���";
		break;
	case enumITEMOPT_ERROR_KBRANGE:
		return "��� ��������� ���������"; // "������������Χ";
		break;
	default:
		return "����������� ��� ������ ������������� ��������"; // "δ֪�ĵ��߲���ʧ����";
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