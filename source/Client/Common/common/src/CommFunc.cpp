//=============================================================================
// FileName: CommFunc.cpp
// Creater: Jerry Li
// Date: 2005.02.23
// Comment:
//	2005.4.28	Arcol	add the text filter manager class: CTextFilter
//=============================================================================

#include "CommFunc.h"
#include "GameCommon.h"

const char* g_szJobName[MAX_JOB_TYPE] =
	{
		"Íîâè÷îê",
		"Âîèí",
		"Îõîòíèê",
		"Ìîğåïëàâàòåëü",
		"Èññëåäîâàòåëü",
		"Çíàõàğêà",
		"Èíæåíåğ",
		"Òîğãîâåö",
		"×åìïèîí",
		"Âîèòåëü",
		"Áåëûé ğûöàğü",
		"Óêğîòèòåëü",
		"Ñòğåëîê",
		"Öåëèòåëü",
		"Êîëäóí",
		"Êàïèòàí",
		"Ïîêîğèòåëü ìîğåé",
		"Âûñêî÷êà",
		"Èíæåíåğ",
};

const char* g_szCityName[defMAX_CITY_NUM] =
	{
		"Àğãåíò",
		"Ãğîìîãğàä",
		"Øàéòàí",
		"Ëåäûíü",
};

const long g_PartIdRange[PLAY_NUM][enumEQUIP_NUM + 1][2] =
	{
		/*å¼€å§‹ç¼–å·*/ /*ç»“æŸç¼–å·*/
					 //å¡è¥¿æ–¯
		/*å¤´*/ 0,
		0,
		/*HEAD è„¸å½¢*/ 2554,
		2561,
		/*BODY èº«ä½“*/ 0,
		0,
		/*GLOVEæ‰‹å¥—*/ 0,
		0,
		/*SHOESé‹å­*/ 0,
		0,
		/*NECK è„–å­*/ 0,
		0,
		/*LHANDå·¦æ‰‹*/ 0,
		0,
		/*HAND1æ‰‹é¥°*/ 0,
		0,
		/*HAND2æ‰‹é¥°*/ 0,
		0,
		/*RHANDå³æ‰‹*/ 0,
		0,
		/*FACE å¤´å‘*/ 2000,
		2007,

		//è“ç¥º
		/*å¤´*/ 0,
		0,
		/*HEAD è„¸å½¢*/ 2554,
		2561,
		/*BODY èº«ä½“*/ 0,
		0,
		/*GLOVEæ‰‹å¥—*/ 0,
		0,
		/*SHOESé‹å­*/ 0,
		0,
		/*NECK è„–å­*/ 0,
		0,
		/*LHANDå·¦æ‰‹*/ 0,
		0,
		/*HAND1æ‰‹é¥°*/ 0,
		0,
		/*HAND2æ‰‹é¥°*/ 0,
		0,
		/*RHANDå³æ‰‹*/ 0,
		0,
		/*FACE å¤´å‘*/ 2062,
		2069,

		//è²åˆ©å°”
		/*å¤´*/ 0,
		0,
		/*HEAD è„¸å½¢*/ 2554,
		2561,
		/*BODY èº«ä½“*/ 0,
		0,
		/*GLOVEæ‰‹å¥—*/ 0,
		0,
		/*SHOESé‹å­*/ 0,
		0,
		/*NECK è„–å­*/ 0,
		0,
		/*LHANDå·¦æ‰‹*/ 0,
		0,
		/*HAND1æ‰‹é¥°*/ 0,
		0,
		/*HAND2æ‰‹é¥°*/ 0,
		0,
		/*RHANDå³æ‰‹*/ 0,
		0,
		/*FACE å¤´å‘*/ 2124,
		2131,

		//è‰¾ç±³
		/*å¤´*/ 0,
		0,
		/*HEAD è„¸å½¢*/ 2554,
		2561,
		/*BODY èº«ä½“*/ 0,
		0,
		/*GLOVEæ‰‹å¥—*/ 0,
		0,
		/*SHOESé‹å­*/ 0,
		0,
		/*NECK è„–å­*/ 0,
		0,
		/*LHANDå·¦æ‰‹*/ 0,
		0,
		/*HAND1æ‰‹é¥°*/ 0,
		0,
		/*HAND2æ‰‹é¥°*/ 0,
		0,
		/*RHANDå³æ‰‹*/ 0,
		0,
		/*FACE å¤´å‘*/ 2291,
		2294,
};

bool g_IsValidLook(int nType, int nPart, long nValue) {
	if ((nType >= 1 && nType <= PLAY_NUM) && (nPart >= 0 && nPart < enumEQUIP_NUM + 1)) {
		/*return	(nValue >= g_PartIdRange[nType-1][nPart][0]) && 
				(nValue <= g_PartIdRange[nType-1][nPart][1]);*/
		return true;
	}
	return false;
}

BOOL IsDist(int x1, int y1, int x2, int y2, DWORD dwDist) {
	DWORD dwxDist = (x1 - x2) * (x1 - x2);
	DWORD dwyDist = (y1 - y2) * (y1 - y2);
	dwDist *= dwDist;
	return (dwxDist + dwyDist < dwDist * 10000);
}

const char* g_GetAreaName(int nValue) {
	switch (nValue) {
	case 1:
		return "Çåìëÿ/Ìîğå"; //"é™†åœ°/æµ·æ´‹";
	case 2:
		return "áåçîïàñíàÿ çîíà"; //"éæˆ˜æ–—åŒº";
	case 3:
		return "Çîíà áåç ÏÊ"; //"éPKåŒº";
	case 4:
		return "Ìîñò"; //"æ¡¥";
	case 5:
		return "Çàïğåòèòü çîíó ìîíñòğîâ"; //"ç¦æ€ªåŒº";
	case 6:
		return "Ãîğíîäîáûâàşùàÿ çîíà"; //"çŸ¿åŒº";
	default:
		return "Íåèçâåñòíûé"; //"æœªçŸ¥";
	}
}

inline bool g_IsRealItemID(int nItemID) {
	if (nItemID > 0 && nItemID != enumEQUIP_BOTH_HAND && nItemID != enumEQUIP_TOTEM)
		return true;
	return false;
}

static inline int GetItemType(int nItemID) {
	if (g_IsRealItemID(nItemID)) {
		CItemRecord* pItem = GetItemRecordInfo(nItemID);
		if (pItem) {
			return pItem->sType;
		}

		return -1;
	}

	return nItemID;
}

int g_GetItemSkill(int nLeftItemID, int nRightItemID) {
	int nRightType = GetItemType(nRightItemID);
	int nLeftType = GetItemType(nLeftItemID);

	const int nLRSkill[][3] = {
		// åŒæ‰‹
		0, 0, 25,
		1, 1, 38,
		11, 1, 28,
		9999, 2, 29,
		9999, 6, 33};

	// å³æ‰‹
	const int nRSkill[][3] = {
		-1, 1, 28,
		-1, 4, 31,
		-1, 5, 32,
		-1, 7, 34,
		-1, 8, 35,
		-1, 9, 36,
		-1, 10, 37,
		-1, 18, 200,
		-1, 19, 201};

	// å·¦æ‰‹
	const int nLSkill[][3] = {
		11, -1, 25,
		3, -1, 30};

	const int nLRCount = sizeof(nLRSkill) / sizeof(nLRSkill[0]);
	for (int i = 0; i < nLRCount; i++) {
		if (nRightType == nLRSkill[i][1] && nLeftType == nLRSkill[i][0]) {
			return nLRSkill[i][2];
		}
	}

	const int nRCount = sizeof(nRSkill) / sizeof(nRSkill[0]);
	for (int i = 0; i < nRCount; i++) {
		if (nRightType == nRSkill[i][1]) {
			return nRSkill[i][2];
		}
	}

	const int nLCount = sizeof(nLSkill) / sizeof(nLSkill[0]);
	for (int i = 0; i < nLCount; i++) {
		if (nLeftType == nLSkill[i][0]) {
			return nLSkill[i][2];
		}
	}
	return -1;
}

int g_IsUseSkill(stNetChangeChaPart* pSEquip, int nSkillID) {
	CSkillRecord* p = GetSkillRecordInfo(nSkillID);
	if (!p) {
		return -1;
	}

	int nLHandID = pSEquip->SLink[enumEQUIP_LHAND].sID;
	int nRHandID = pSEquip->SLink[enumEQUIP_RHAND].sID;
	int nBodyID = pSEquip->SLink[enumEQUIP_BODY].sID;
	if (!pSEquip->SLink[enumEQUIP_LHAND].IsValid())
		nLHandID = 0;
	if (!pSEquip->SLink[enumEQUIP_RHAND].IsValid())
		nRHandID = 0;
	if (!pSEquip->SLink[enumEQUIP_BODY].IsValid())
		nBodyID = 0;

	short sLHandType = 0, sRHandType = 0, sBodyType = 0;

	CItemRecord* pItem = GetItemRecordInfo(nLHandID);
	if (pItem)
		sLHandType = pItem->sType;

	pItem = GetItemRecordInfo(nRHandID);
	if (pItem)
		sRHandType = pItem->sType;

	pItem = GetItemRecordInfo(nBodyID);
	if (pItem)
		sBodyType = pItem->sType;

	bool IsLeft = false;
	bool IsRight = false;
	bool IsBody = false;
	bool IsConch = false;

	// å·¦æ‰‹
	for (int i = 0; i < defSKILL_ITEM_NEED_NUM; i++) {
		if (p->sItemNeed[0][i][0] == cchSkillRecordKeyValue)
			break;

		if (p->sItemNeed[0][i][0] == enumSKILL_ITEM_NEED_TYPE) {
			if (p->sItemNeed[0][i][1] == -1 || p->sItemNeed[0][i][1] == sLHandType) {
				IsLeft = true;
				break;
			}
		} else if (p->sItemNeed[0][i][0] == enumSKILL_ITEM_NEED_ID) {
			if (p->sItemNeed[0][i][1] == nLHandID) {
				IsLeft = true;
				break;
			}
		}
	}
	if (!IsLeft)
		return 0;

	// å³æ‰‹
	for (int i = 0; i < defSKILL_ITEM_NEED_NUM; i++) {
		if (p->sItemNeed[1][i][0] == cchSkillRecordKeyValue)
			break;

		if (p->sItemNeed[1][i][0] == enumSKILL_ITEM_NEED_TYPE) {
			if (p->sItemNeed[1][i][1] == -1 || p->sItemNeed[1][i][1] == sRHandType) {
				IsRight = true;
				break;
			}
		} else if (p->sItemNeed[1][i][0] == enumSKILL_ITEM_NEED_ID) {
			if (p->sItemNeed[1][i][1] == nRHandID) {
				IsRight = true;
				break;
			}
		}
	}
	if (!IsRight)
		return 0;

	// èº«ä½“
	for (int i = 0; i < defSKILL_ITEM_NEED_NUM; i++) {
		if (p->sItemNeed[2][i][0] == cchSkillRecordKeyValue)
			break;

		if (p->sItemNeed[2][i][0] == enumSKILL_ITEM_NEED_TYPE) {
			if (p->sItemNeed[2][i][1] == -1 || p->sItemNeed[2][i][1] == sBodyType) {
				IsBody = true;
				break;
			}
		} else if (p->sItemNeed[2][i][0] == enumSKILL_ITEM_NEED_ID) {
			if (p->sItemNeed[2][i][1] == nBodyID) {
				IsBody = true;
				break;
			}
		}
	}
	if (!IsBody)
		return 0;

	// è´å£³é“å…·
	for (int i = 0; i < defSKILL_ITEM_NEED_NUM; i++) {
		if (p->sConchNeed[i][0] == cchSkillRecordKeyValue)
			break;

		if (p->sConchNeed[i][0] == -1) // ä¸éœ€è¦è´å£³
		{
			IsConch = true;
			break;
		}
		if (!pSEquip->SLink[p->sConchNeed[i][0]].IsValid())
			continue;
		pItem = GetItemRecordInfo(pSEquip->SLink[p->sConchNeed[i][0]].sID);
		if (pItem) {
			if (p->sConchNeed[i][1] == enumSKILL_ITEM_NEED_TYPE) {
				if (pItem->sType == p->sConchNeed[i][2]) {
					IsConch = true;
					break;
				}
			} else if (p->sConchNeed[i][1] == enumSKILL_ITEM_NEED_ID) {
				if (pItem->lID == p->sConchNeed[i][2]) {
					IsConch = true;
					break;
				}
			}
		}
	}
	if (!IsConch)
		return 0;

	return 1;
}

//=============================================================================
// æ˜¯å¦æ­£ç¡®çš„æŠ€èƒ½ç›®æ ‡
// nTChaCtrlType ç›®æ ‡çš„æ§åˆ¶ç±»å‹ï¼ˆEChaCtrlTypeï¼‰ï¼Œ
// bTIsDie ç›®æ ‡æ˜¯å¦æ­»äº¡ï¼Œ
// bTChaBeSkilled ç›®æ ‡æ˜¯å¦èƒ½è¢«ä½¿ç”¨æŠ€èƒ½ï¼Œ
// nTChaArea ç›®æ ‡çš„åŒºåŸŸï¼ˆEAreaMaskï¼‰ï¼Œ
// nSSkillObjType æºæŠ€èƒ½çš„ç›®æ ‡ç±»å‹ï¼ˆESkillObjTypeï¼‰ï¼Œ
// nSSkillObjHabitat æºæŠ€èƒ½çš„åŒºåŸŸç±»å‹ï¼ˆESkillTarHabitatTypeï¼‰ï¼Œ
// nSSkillEffType æºæŠ€èƒ½çš„æ•ˆæœç±»å‹ï¼ˆESkillEffTypeï¼‰ï¼Œ
// bIsTeammate æºå’Œç›®æ ‡æ˜¯å¦é˜Ÿå‹å…³ç³»ã€‚
// bIsTeammate æºå’Œç›®æ ‡æ˜¯å¦å‹æ–¹å…³ç³»ã€‚
// bIsSelf æºå’Œç›®æ ‡æ˜¯å¦ç›¸åŒ
//=============================================================================
int g_IsRightSkillTar(int nTChaCtrlType, bool bTIsDie, bool bTChaBeSkilled, int nTChaArea,
					  int nSChaCtrlType, int nSSkillObjType, int nSSkillObjHabitat, int nSSkillEffType,
					  bool bIsTeammate, bool bIsFriend, bool bIsSelf) {
	bool bTIsPlayer = g_IsPlyCtrlCha(nTChaCtrlType);

	if (g_IsNPCCtrlCha(nTChaCtrlType)) // NPC
		return enumESKILL_FAILD_NPC;
	if (!bTChaBeSkilled) // ä¸èƒ½è¢«ä½¿ç”¨æŠ€èƒ½
		return enumESKILL_FAILD_NOT_SKILLED;

	if (nTChaArea & enumAREA_TYPE_NOT_FIGHT) // å®‰å…¨åŒº
	{
		if (nSSkillEffType != enumSKILL_EFF_HELPFUL)
			return enumESKILL_FAILD_SAFETY_BELT;
	}
	if (nTChaArea & enumSKILL_TAR_LAND || nTChaArea & enumAREA_TYPE_BRIDGE) // é™†åœ°
	{
		if (nSSkillObjHabitat == enumSKILL_TAR_SEA)
			return enumESKILL_FAILD_NOT_LAND;
	} else if (!(nTChaArea & enumSKILL_TAR_LAND)) // æµ·æ´‹
	{
		if (nSSkillObjHabitat == enumSKILL_TAR_LAND)
			return enumESKILL_FAILD_NOT_SEA;
	}

	if (!bIsSelf) // è‡ªèº«
	{
		if (nSSkillObjType == enumSKILL_TYPE_SELF)
			return enumESKILL_FAILD_ONLY_SELF;
		else if (nSSkillObjType == enumSKILL_TYPE_EXCEPT_SELF) // é™¤äº†è‡ªå·±ä»¥å¤–çš„æ‰€æœ‰è§’è‰²å’Œæ€ªç‰©
		{
			return enumESKILL_SUCCESS;
		}
	} else {
		if (nSSkillObjType == enumSKILL_TYPE_EXCEPT_SELF)
			return enumESKILL_FAILD_SELF;
	}

	if (bTIsDie) // å°¸ä½“
	{
		if (!bTIsPlayer)
			return enumESKILL_FAILD_ONLY_DIEPLY;
		if (nSSkillObjType != enumSKILL_TYPE_PLAYER_DIE)
			return enumESKILL_FAILD_ONLY_DIEPLY;
	}

	if (nTChaCtrlType == enumCHACTRL_MONS_TREE) // æ ‘
	{
		if (nSSkillObjType != enumSKILL_TYPE_TREE)
			return enumESKILL_FAILD_ESP_MONS;
	} else if (nTChaCtrlType == enumCHACTRL_MONS_MINE) // çŸ¿
	{
		if (nSSkillObjType != enumSKILL_TYPE_MINE)
			return enumESKILL_FAILD_ESP_MONS;
	} else if (nTChaCtrlType == enumCHACTRL_MONS_FISH) // é±¼
	{
		if (nSSkillObjType != enumSKILL_TYPE_FISH)
			return enumESKILL_FAILD_ESP_MONS;
	} else if (nTChaCtrlType == enumCHACTRL_MONS_DBOAT) // æ²‰èˆ¹
	{
		if (nSSkillObjType != enumSKILL_TYPE_SALVAGE)
			return enumESKILL_FAILD_ESP_MONS;
	}

	if (nSSkillObjType == enumSKILL_TYPE_REPAIR) {
		if (nTChaCtrlType != enumCHACTRL_MONS_REPAIRABLE)
			return enumESKILL_FAILD_ESP_MONS;
	}
	if (nSSkillObjType == enumSKILL_TYPE_TREE) {
		if (nTChaCtrlType != enumCHACTRL_MONS_TREE)
			return enumESKILL_FAILD_ESP_MONS;
	} else if (nSSkillObjType == enumSKILL_TYPE_MINE) {
		if (nTChaCtrlType != enumCHACTRL_MONS_MINE)
			return enumESKILL_FAILD_ESP_MONS;
	} else if (nSSkillObjType == enumSKILL_TYPE_FISH) {
		if (nTChaCtrlType != enumCHACTRL_MONS_FISH)
			return enumESKILL_FAILD_ESP_MONS;
	} else if (nSSkillObjType == enumSKILL_TYPE_SALVAGE) {
		if (nTChaCtrlType != enumCHACTRL_MONS_DBOAT)
			return enumESKILL_FAILD_ESP_MONS;
	}

	if (nSSkillObjType == enumSKILL_TYPE_ENEMY) {
		if (bIsFriend)
			return enumESKILL_FAILD_FRIEND;
	} else if (nSSkillObjType == enumSKILL_TYPE_TEAM) {
		if (!bIsTeammate)
			return enumESKILL_FAILD_NOT_FRIEND;
	} else if (nSSkillObjType == enumSKILL_TYPE_ALL) {
		if (nSSkillEffType == enumSKILL_EFF_HELPFUL) // æœ‰ç›ŠæŠ€èƒ½ï¼Œåªå¯¹å‹æ–¹æœ‰æ•ˆ
		{
			if (!bIsFriend)
				return enumESKILL_FAILD_NOT_FRIEND;
		} else {
			if (bIsFriend)
				return enumESKILL_FAILD_FRIEND;
		}
	}

	return enumESKILL_SUCCESS;
}

//------------------------------------------------------------------------
//	CTextFilter ç±»å®šä¹‰
//------------------------------------------------------------------------

BYTE CTextFilter::m_NowSign[eTableMax][8];
vector<string> CTextFilter::m_FilterTable[eTableMax];
static CTextFilter bin;

CTextFilter::CTextFilter() {
	setlocale(LC_CTYPE, "chs");
	ZeroMemory(m_NowSign, sizeof(m_NowSign));
}

CTextFilter::~CTextFilter() {
}

bool CTextFilter::Add(const eFilterTable eTable, const char* szFilterText) {
	if (!szFilterText)
		return false;
	if (strlen(szFilterText) <= 0)
		return false;
	m_FilterTable[eTable].push_back(*(new string(szFilterText)));
	for (int i = 0; i < (int)strlen(szFilterText); i++) {
		BYTE j = szFilterText[i] / 32;
		int n = (i + j) % 8;
		m_NowSign[eTable][n] += j + i;
	}
	return true;
}

bool CTextFilter::IsLegalText(const eFilterTable eTable, const string strText) {
	vector<string>::iterator iter;
	for (iter = m_FilterTable[eTable].begin(); iter != m_FilterTable[eTable].end(); iter++) {
		if (!bCheckLegalText(strText, &(*iter))) {
			return false;
		}
	}
	return true;
}

bool CTextFilter::Filter(const eFilterTable eTable, string& strText) {
	bool ret = false;
	vector<string>::iterator iter;
	for (iter = m_FilterTable[eTable].begin(); iter != m_FilterTable[eTable].end(); iter++) {
		if (ReplaceText(strText, &(*iter))) {
			ret = true;
		}
	}
	return ret;
}

bool CTextFilter::ReplaceText(string& strText, const string* pstrFilterText) {
	bool ret = false;
	_W64 nPos = strText.find(*pstrFilterText);
	static const basic_string<char>::size_type errPos = -1;
	while (nPos != errPos) {

		if (_ismbslead((unsigned char*)pstrFilterText->c_str(), (unsigned char*)pstrFilterText->c_str()) ==
			_ismbslead((unsigned char*)strText.c_str(), (unsigned char*)&strText[nPos])) {
			strText.replace(nPos, pstrFilterText->length(), pstrFilterText->length(), '*');
			ret = true;
		} else {
			nPos++;
		}
		nPos = strText.find(*pstrFilterText, nPos + pstrFilterText->length());
	}
	return ret;
}

bool CTextFilter::bCheckLegalText(const string& strText, const string* pstrIllegalText) {
	_W64 nPos = strText.find(*pstrIllegalText);
	static const basic_string<char>::size_type errPos = -1;
	while (nPos != errPos) {
		if (_ismbslead((unsigned char*)pstrIllegalText->c_str(), (unsigned char*)pstrIllegalText->c_str()) ==
			_ismbslead((unsigned char*)strText.c_str(), (unsigned char*)&strText[nPos])) {
			return false;
		} else {
			nPos++;
		}
		nPos = strText.find(*pstrIllegalText, nPos + pstrIllegalText->length());
	}
	return true;
}

bool CTextFilter::LoadFile(const char* szFileName, const eFilterTable eTable) {
	if (!szFileName)
		return false;
	ifstream filterTxt(szFileName, ios::in);
	if (!filterTxt.is_open())
		return false;
	char buf[500] = {0};
	filterTxt.getline(buf, 500);
	while (!filterTxt.fail()) {
		char* pText = new char[strlen(buf) + 2];
		// modify by lark.li 20080424 begin
		//TODO
		strcpy(pText, buf);
		//strcpy(pText,ConvertResString(buf));
		// End
		m_FilterTable[eTable].push_back(pText);
		filterTxt.getline(buf, 500);
	}
	filterTxt.close();
	return true;
}

BYTE* CTextFilter::GetNowSign(const eFilterTable eTable) {
	return m_NowSign[eTable];
}

// å¤–è§‚æ•°æ®è½¬æ¢ä¸ºå­—ç¬¦ä¸²
char* LookData2String(const stNetChangeChaPart* pLook, char* szLookBuf, int nLen, bool bNewLook) {
	if (!pLook || !szLookBuf)
		return NULL;
	if (bNewLook && !g_IsValidLook(pLook->sTypeID, enumEQUIP_NUM, pLook->sHairID))
		return NULL;

	__int64 lnCheckSum = 0;
	char szData[512];
	int nBufLen = 0, nDataLen;
	szLookBuf[0] = '\0';

	/*	2008-8-7	yangyinyu	change	begin!
	sprintf(szData, "%d#", defLOOK_CUR_VER);
	*/
	strcpy(szData, "112#");
	//	2008-8-7	yangyinyu	change	end!
	nDataLen = (int)strlen(szData);
	if (nBufLen + nDataLen >= nLen)
		return NULL;
	strcat(szLookBuf, szData);
	nBufLen += nDataLen;

	sprintf(szData, "%d,%d", pLook->sTypeID, pLook->sHairID);
	nDataLen = (int)strlen(szData);
	if (nBufLen + nDataLen >= nLen)
		return NULL;
	strcat(szLookBuf, szData);
	nBufLen += nDataLen;
	lnCheckSum += (pLook->sTypeID + pLook->sHairID);

	SItemGrid* pGridCont;
	for (int i = 0; i < enumEQUIP_NUM; i++) {
		pGridCont = (SItemGrid*)pLook->SLink + i;
		if (bNewLook && !g_IsValidLook(pLook->sTypeID, i, pGridCont->sID))
			return NULL; // æ•°æ®ä¸åˆæ³•

		/*	2008-8-7	yangyinyu	change	begin!
		sprintf(szData, ";%d,%d,%d,%d,%d,%d,%d",
			pGridCont->sID, pGridCont->sNum,
			pGridCont->sEndure[0], pGridCont->sEndure[1], pGridCont->sEnergy[0], pGridCont->sEnergy[1], pGridCont->chForgeLv);
			*/
		sprintf(szData, ";%d,%d,%d,%d,%d,%d,%d,%d,%d",
				pGridCont->sNeedLv, pGridCont->dwDBID, pGridCont->sID, pGridCont->sNum,
				pGridCont->sEndure[0], pGridCont->sEndure[1], pGridCont->sEnergy[0], pGridCont->sEnergy[1], pGridCont->chForgeLv);
		//	2008-8-7	yangyinyu	change	end!
		nDataLen = (int)strlen(szData);
		if (nBufLen + nDataLen >= nLen)
			return NULL;
		strcat(szLookBuf, szData);
		nBufLen += nDataLen;

		/*	2008-8-7	yangyinyu	change	begin!
		lnCheckSum += (pGridCont->sID + pGridCont->sNum + pGridCont->sEndure[0] + pGridCont->sEndure[1] + pGridCont->sEnergy[0] + pGridCont->sEnergy[1] + pGridCont->chForgeLv);
		*/
		lnCheckSum += (pGridCont->sNeedLv + pGridCont->dwDBID + pGridCont->sID + pGridCont->sNum + pGridCont->sEndure[0] + pGridCont->sEndure[1] + pGridCont->sEnergy[0] + pGridCont->sEnergy[1] + pGridCont->chForgeLv);
		//	2008-8-7	yangyinyu	change	end!
		for (int m = 0; m < enumITEMDBP_MAXNUM; m++) {
			sprintf(szData, ",%d", pGridCont->GetDBParam(m));
			nDataLen = (int)strlen(szData);
			if (nBufLen + nDataLen >= nLen)
				return NULL;
			strcat(szLookBuf, szData);
			nBufLen += nDataLen;
			lnCheckSum += pGridCont->GetDBParam(m);
		}
		if (pGridCont->IsInstAttrValid()) {
			nDataLen = 2;
			if (nBufLen + nDataLen >= nLen)
				return NULL;
			strcat(szLookBuf, ",1");
			nBufLen += nDataLen;

			for (int k = 0; k < defITEM_INSTANCE_ATTR_NUM; k++) {
				sprintf(szData, ",%d,%d", pGridCont->sInstAttr[k][0], pGridCont->sInstAttr[k][1]);
				nDataLen = (int)strlen(szData);
				if (nBufLen + nDataLen >= nLen)
					return NULL;
				strcat(szLookBuf, szData);
				nBufLen += nDataLen;
				lnCheckSum += pGridCont->sInstAttr[k][0] + pGridCont->sInstAttr[k][1];
			}
		} else {
			nDataLen = 2;
			if (nBufLen + nDataLen >= nLen)
				return NULL;
			strcat(szLookBuf, ",0");
			nBufLen += nDataLen;
		}
	}
	sprintf(szData, ";%d", lnCheckSum);
	nDataLen = (int)strlen(szData);
	if (nBufLen + nDataLen >= nLen)
		return NULL;
	strcat(szLookBuf, szData);
	nBufLen += nDataLen;

	return szLookBuf;
}

// å­—ç¬¦ä¸²è½¬æ¢ä¸ºå¤–è§‚æ•°æ®
bool Strin2LookData(stNetChangeChaPart* pLook, std::string& strData) {
	if (!pLook)
		return false;

	__int64 lnCheckSum = 0;
	const short csStrNum = enumEQUIP_NUM + 1 + 10;
	std::string strList[csStrNum];
	/*	2008-7-8	yangyinyu	change	begin!
	const short csSubNum = 8 + defITEM_INSTANCE_ATTR_NUM_VER110 * 2 + 1;
	*/
	const short csSubNum = 9 + defITEM_INSTANCE_ATTR_NUM_VER110 * 2 + 1;
	//	2008-7-8	yangyinyu	change	end!
	std::string strSubList[csSubNum];
	std::string strVer[2];
	bool bIsOldVer = Util_ResolveTextLine(strData.c_str(), strVer, 2, '#') == 1 ? true : false;

	/*	2008-7-8	yangyinyu	add	begin!
	if (bIsOldVer)
		Util_ResolveTextLine(strData.c_str(), strList, csStrNum, ';');
	else
		Util_ResolveTextLine(strVer[1].c_str(), strList, csStrNum, ';');
		*/
	int iVer = 0;

	if (bIsOldVer)
		Util_ResolveTextLine(strData.c_str(), strList, csStrNum, ';');
	else {
		Util_ResolveTextLine(strVer[1].c_str(), strList, csStrNum, ';');
		iVer = atoi(strVer[0].c_str());
	};
	//	2008-7-8	yangyinyu	add	end!

	Util_ResolveTextLine(strList[0].c_str(), strSubList, 3, ',');
	pLook->sTypeID = Str2Int(strSubList[0]);
	pLook->sHairID = Str2Int(strSubList[1]);
	lnCheckSum += pLook->sTypeID + pLook->sHairID;
	SItemGrid* pItem = 0;
	short sTCount;
	int i = 0;
	for (i = 0; i < enumEQUIP_NUM; i++) {
		sTCount = 0;
		pItem = pLook->SLink + i;
		Util_ResolveTextLine(strList[i + 1].c_str(), strSubList, csSubNum, ',');

		//	2008-7-8	yangyinyu	add	begin!
		if (iVer == 112) {
			pItem->sNeedLv = Str2Int(strSubList[sTCount++]);
			pItem->dwDBID = Str2Int(strSubList[sTCount++]);
		};
		//	2008-7-8	yangyinyu	add	end!

		pItem->sID = Str2Int(strSubList[sTCount++]);
		pItem->sNum = Str2Int(strSubList[sTCount++]);
		pItem->sEndure[0] = Str2Int(strSubList[sTCount++]);
		pItem->sEndure[1] = Str2Int(strSubList[sTCount++]);
		pItem->sEnergy[0] = Str2Int(strSubList[sTCount++]);
		pItem->sEnergy[1] = Str2Int(strSubList[sTCount++]);
		pItem->chForgeLv = Str2Int(strSubList[sTCount++]);

		/*	2008-7-8	yangyinyu	add	begin!
		lnCheckSum += pItem->sID + pItem->sNum + pItem->sEndure[0] + pItem->sEndure[1] + pItem->sEnergy[0] + pItem->sEnergy[1] + pItem->chForgeLv;
		*/
		if (iVer == 112) {
			lnCheckSum += pItem->sNeedLv + pItem->dwDBID + pItem->sID + pItem->sNum + pItem->sEndure[0] + pItem->sEndure[1] + pItem->sEnergy[0] + pItem->sEnergy[1] + pItem->chForgeLv;
		} else {
			lnCheckSum += pItem->sID + pItem->sNum + pItem->sEndure[0] + pItem->sEndure[1] + pItem->sEnergy[0] + pItem->sEnergy[1] + pItem->chForgeLv;
		}
		//	2008-7-8	yangyinyu	add	end!

		for (int m = 0; m < enumITEMDBP_MAXNUM; m++) {
			pItem->SetDBParam(m, Str2Int(strSubList[sTCount++]));
			lnCheckSum += pItem->GetDBParam(m);
		}
		if (!bIsOldVer && iVer >= defLOOK_CUR_VER) // æœ‰å±æ€§æ•°æ®æ˜¯å¦å­˜åœ¨çš„æ ‡ç¤º
		{
			if (Str2Int(strSubList[sTCount++]) > 0) // å­˜åœ¨å®ä¾‹å±æ€§
			{
				for (int k = 0; k < defITEM_INSTANCE_ATTR_NUM; k++) {
					pItem->sInstAttr[k][0] = Str2Int(strSubList[sTCount + k * 2]);
					pItem->sInstAttr[k][1] = Str2Int(strSubList[sTCount + k * 2 + 1]);
					lnCheckSum += (pItem->sInstAttr[k][0] + pItem->sInstAttr[k][1]);
				}
			} else
				pItem->SetInstAttrInvalid();
		} else {
			for (int k = 0; k < defITEM_INSTANCE_ATTR_NUM; k++) {
				pItem->sInstAttr[k][0] = Str2Int(strSubList[sTCount + k * 2]);
				pItem->sInstAttr[k][1] = Str2Int(strSubList[sTCount + k * 2 + 1]);
				lnCheckSum += (pItem->sInstAttr[k][0] + pItem->sInstAttr[k][1]);
			}
		}
	}

	if (!bIsOldVer) {
		char szCheckSum[64];
		sprintf(szCheckSum, "%d", lnCheckSum);
		if (strncmp(szCheckSum, strList[i + 1].c_str(), 64))
			return false;
	} else
		pLook->sVer = defLOOK_CUR_VER;

	return true;
}

// å¿«æ·æ æ•°æ®è½¬æ¢ä¸ºå­—ç¬¦ä¸²
char* ShortcutData2String(const stNetShortCut* pShortcut, char* szShortcutBuf, int nLen) {
	if (!pShortcut || !szShortcutBuf)
		return NULL;

	char szData[512];
	int nBufLen = 0, nDataLen;
	szShortcutBuf[0] = '\0';

	for (int i = 0; i < SHORT_CUT_NUM; i++) {
		sprintf(szData, "%d,%d;", pShortcut->chType[i], pShortcut->byGridID[i]);
		nDataLen = (int)strlen(szData);
		if (nBufLen + nDataLen >= nLen)
			return NULL;
		strcat(szShortcutBuf, szData);
		nBufLen += nDataLen;
	}

	return szShortcutBuf;
}

// å­—ç¬¦ä¸²è½¬æ¢ä¸ºå¿«æ·æ æ•°æ®
bool String2ShortcutData(stNetShortCut* pShortcut, std::string& strData) {
	if (!pShortcut)
		return false;

	std::string strList[SHORT_CUT_NUM + 1];
	const short csSubNum = 2;
	std::string strSubList[csSubNum];
	Util_ResolveTextLine(strData.c_str(), strList, SHORT_CUT_NUM + 1, ';');
	for (int i = 0; i < SHORT_CUT_NUM; i++) {
		Util_ResolveTextLine(strList[i].c_str(), strSubList, csSubNum, ',');
		pShortcut->chType[i] = Str2Int(strSubList[0]);
		pShortcut->byGridID[i] = Str2Int(strSubList[1]);
	}

	return true;
}

bool KitbagStringConv(short sKbCapacity, std::string& strData) {
	int nInsertPos = 0;
	if (strData == "")
		return true;
	if ((int)strlen(strData.c_str()) < nInsertPos)
		return true;
	char szCap[10];
	sprintf(szCap, "%d@", sKbCapacity);
	strData.insert(nInsertPos, szCap);
	return true;
}
