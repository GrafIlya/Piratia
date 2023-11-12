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
* УГНѕ:УГУЪјмІвґґЅЁµДЅЗЙ«Нв№ЫКэѕЭКЗ·сєП·Ё
* nPart - ¶ФУ¦Нв№ЫID,nValue - Нв№ЫµДЦµ
* ·µ»ШЦµЈєНв№ЫКэѕЭКЗ·сєП·ЁЎЈ
*/
extern bool g_IsValidLook(int nType, int nPart, long nValue);

/*---------------------------------------------------------------
* ulAreaMask ЗшУтАаРН
* ·µ»ШЦµЈєtrue єЈСуЎЈfalse ВЅµШ
*/
inline bool g_IsSea(unsigned short usAreaMask) {
	return !(usAreaMask & enumAREA_TYPE_LAND);
}

inline bool g_IsLand(unsigned short usAreaMask) {
	return (usAreaMask & enumAREA_TYPE_LAND) || (usAreaMask & enumAREA_TYPE_BRIDGE);
}

// ёщѕЭґ«ИлµДЧуУТКЦµАѕЯID
// ·µ»ШїЙТФК№УГµДД¬ИПјјДЬ,·µ»Ш-1,Г»УРјјДЬ
extern int g_GetItemSkill(int nLeftItemID, int nRightItemID);

extern BOOL IsDist(int x1, int y1, int x2, int y2, DWORD dwDist);

// КЗ·сХэИ·µДјјДЬДї±к
extern int g_IsRightSkillTar(int nTChaCtrlType, bool bTIsDie, bool bTChaBeSkilled, int nTChaArea,
							 int nSChaCtrlType, int nSSkillObjType, int nSSkillObjHabitat, int nSSkillEffType,
							 bool bIsTeammate, bool bIsFriend, bool bIsSelf);

/*---------------------------------------------------------------
* ІОКэ:ЧуКЦЈ¬УТКЦЈ¬ЙнМеµДµАѕЯIDЎЈјјДЬ±аєЕЎЈ
* ·µ»ШЦµ:1-їЙК№УГ,0-І»їЙК№УГ,-1-јјДЬІ»ґжФЪ
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

// ¶ФУ¦ЗшУтАаРНµДІОКэёцКэ
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
// chChaType ЅЗЙ«АаРН
// chChaTerrType ЅЗЙ«»о¶ЇїХјдµДАаРН
// bIsBlock КЗ·сХП°­
// ulAreaMask ЗшУтАаРН
// ·µ»ШЦµЈєtrue їЙФЪёГµҐФЄЙПТЖ¶ЇЎЈfalse І»їЙТЖ¶Ї
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
	if (usAreaMask & enumAREA_TYPE_NOT_FIGHT) // ·ЗХЅ¶·ЗшУт
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

// Тэ·ў±нПЦ·µ»ШХж
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
		return "Сила"; // "Б¦БїјУіЙ";
	case ITEMATTR_COE_AGI:
		return "Ловкость"; // "ГфЅЭјУіЙ";
	case ITEMATTR_COE_DEX:
		return "Точность"; // "ЧЁЧўјУіЙ";
	case ITEMATTR_COE_CON:
		return "Телосложение"; // "МеЦКјУіЙ";
	case ITEMATTR_COE_STA:
		return "Дух"; // "ѕ«ЙсјУіЙ";
	case ITEMATTR_COE_LUK:
		return "Удача"; // "РТФЛјУіЙ";
	case ITEMATTR_COE_ASPD:
		return "Скорость Атаки"; // "№Ґ»чЖµВКјУіЙ";
	case ITEMATTR_COE_ADIS:
		return "Дальность Атаки"; // "№Ґ»чѕаАлјУіЙ";
	case ITEMATTR_COE_MNATK:
		return "Минимальная Атака"; // "ЧоРЎ№Ґ»чБ¦јУіЙ";
	case ITEMATTR_COE_MXATK:
		return "Максимальная Атака"; // "Чоґу№Ґ»чБ¦јУіЙ";
	case ITEMATTR_COE_DEF:
		return "Бонус Защиты"; // "·АУщјУіЙ";
	case ITEMATTR_COE_MXHP:
		return "Максимальный бонус Здоровья"; // "ЧоґуHPјУіЙ";
	case ITEMATTR_COE_MXSP:
		return "Максимальный Бонус Маны"; // "ЧоґуSPјУіЙ";
	case ITEMATTR_COE_FLEE:
		return "Уклонение"; // "ЙБ±ЬВКјУіЙ";
	case ITEMATTR_COE_HIT:
		return "Шанс Урона"; // "ГьЦРВКјУіЙ";
	case ITEMATTR_COE_CRT:
		return "Бонус к Критическому Удару"; // "±¬»чВКјУіЙ";
	case ITEMATTR_COE_MF:
		return "Бонус к Шансу Выпадения"; // "С°±¦ВКјУіЙ";
	case ITEMATTR_COE_HREC:
		return "Скорость Восстановления Здоровья"; // "HP»ЦёґЛЩ¶ИјУіЙ";
	case ITEMATTR_COE_SREC:
		return "Скорость Востановления Маны"; // "SP»ЦёґЛЩ¶ИјУіЙ";
	case ITEMATTR_COE_MSPD:
		return "Скорость Передвижения"; // "ТЖ¶ЇЛЩ¶ИјУіЙ";
	case ITEMATTR_COE_COL:
		return "Скорости Добычи Материалов"; // "ЧКФґІЙјЇЛЩ¶ИјУіЙ";

	case ITEMATTR_VAL_STR:
		return "Сила"; // "Б¦БїјУіЙ";
	case ITEMATTR_VAL_AGI:
		return "Ловкость"; // "ГфЅЭјУіЙ";
	case ITEMATTR_VAL_DEX:
		return "Точность"; // "ЧЁЧўјУіЙ";
	case ITEMATTR_VAL_CON:
		return "Телосложение"; // "МеЦКјУіЙ";
	case ITEMATTR_VAL_STA:
		return "Дух"; // "ѕ«ЙсјУіЙ";
	case ITEMATTR_VAL_LUK:
		return "Удача"; // "РТФЛјУіЙ";
	case ITEMATTR_VAL_ASPD:
		return "Скорость Атаки"; // "№Ґ»чЖµВКјУіЙ";
	case ITEMATTR_VAL_ADIS:
		return "Дальность Атаки"; // "№Ґ»чѕаАлјУіЙ";
	case ITEMATTR_VAL_MNATK:
		return "Минимальная Атака"; // "ЧоРЎ№Ґ»чБ¦јУіЙ";
	case ITEMATTR_VAL_MXATK:
		return "Максимальная Атака"; // "Чоґу№Ґ»чБ¦јУіЙ";
	case ITEMATTR_VAL_DEF:
		return "Защита"; // "·АУщјУіЙ";
	case ITEMATTR_VAL_MXHP:
		return "Здоровье"; // "ЧоґуHPјУіЙ";
	case ITEMATTR_VAL_MXSP:
		return "Мана"; // "ЧоґуSPјУіЙ";
	case ITEMATTR_VAL_FLEE:
		return "Уклонение"; // "ЙБ±ЬВКјУіЙ";
	case ITEMATTR_VAL_HIT:
		return "Шанс Урона"; // "ГьЦРВКјУіЙ";
	case ITEMATTR_VAL_CRT:
		return "Бонус к Критическому Удару"; // "±¬»чВКјУіЙ";
	case ITEMATTR_VAL_MF:
		return "Бонус к Шансу Выпадения"; // "С°±¦ВКјУіЙ";
	case ITEMATTR_VAL_HREC:
		return "Скорость Восстановления Здоровья"; // "HP»ЦёґЛЩ¶ИјУіЙ";
	case ITEMATTR_VAL_SREC:
		return "Скорость Востановления Маны"; // "SP»ЦёґЛЩ¶ИјУіЙ";
	case ITEMATTR_VAL_MSPD:
		return "Скорость Передвижения"; // "ТЖ¶ЇЛЩ¶ИјУіЙ";
	case ITEMATTR_VAL_COL:
		return "Скорости Добычи Материалов"; // "ЧКФґІЙјЇЛЩ¶ИјУіЙ";

	case ITEMATTR_VAL_PDEF:
		return "Физическое Сопротивление"; // "ОпАнµЦї№јУіЙ";
	case ITEMATTR_MAXURE:
		return "Долговечность"; // "ЧоґуДНѕГ¶И";
	case ITEMATTR_MAXENERGY:
		return "Энергия"; // "ЧоґуДЬБї";
	default:
		return "Неизвестные характеристики инструментов"; // "ОґЦЄµАѕЯКфРФ";
	}
}

inline const char* g_GetServerError(int error_code) // ЅвОцґнОуВл
{
	switch (error_code) {
	case ERR_AP_INVALIDUSER:
		return "Неверный аккаунт"; // "ОЮР§ХЛєЕ";
	case ERR_AP_INVALIDPWD:
		return "Неверный пароль"; // "ГЬВлґнОу";
	case ERR_AP_ACTIVEUSER:
		return "Активация аккаунта не удалась"; // "ј¤»оУГ»§К§°Ь";
	case ERR_AP_DISABLELOGIN:
		return "Ваш собеседник в настоящее время находится в режиме сохранения выхода из системы. Попробуйте войти позже."; // "ДїЗ°ДъµДЅЗЙ«Хэґ¦УЪПВПЯґжЕМ№эіМЦРЈ¬ЗлЙФєуФЩіўКФµЗВјЎЈ";
	case ERR_AP_LOGGED:
		return "Этот аккаунт уже онлайн"; // "ґЛХКєЕТСґ¦УЪµЗВјЧґМ¬";
	case ERR_AP_BANUSER:
		return "Аккаунт заблокирован"; // "ХКєЕТС·вНЈ";
	case ERR_AP_GPSLOGGED:
		return "У этого GroupServer есть логин"; // "ґЛGroupServerТСµЗВј";
	case ERR_AP_GPSAUTHFAIL:
		return "Эта проверка GroupServer не удалась"; // "ґЛGroupServerИПЦ¤К§°Ь";
	case ERR_AP_SAVING:
		return "Сохраняем персонажа. Повторите попытку через 15 секунд...."; // "ХэФЪ±ЈґжДгµДЅЗЙ«Ј¬Зл15ГлєуЦШКФ...";
	case ERR_AP_LOGINTWICE:
		return "Ваша учетная запись зарегистрирована далеко"; // "ДгµДХЛєЕФЪФ¶ґ¦ФЩґОµЗВј";
	case ERR_AP_ONLINE:
		return "Ваш аккаунт уже онлайн"; // "ДгµДХЛєЕТСФЪПЯ";
	case ERR_AP_DISCONN:
		return "Групповой сервер отключен"; // "GroupServerТС¶ПїЄ";
	case ERR_AP_UNKNOWNCMD:
		return "неизвестное соглашение, не иметь дело с"; // "ОґЦЄР­ТйЈ¬І»ґ¦Ан";
	case ERR_AP_TLSWRONG:
		return "ошибка локального сохранения"; // "±ѕµШґжґўґнОу";
	case ERR_AP_NOBILL:
		return "Срок действия этой учетной записи истек, пожалуйста, пополните!"; // "ґЛХЛєЕТС№эЖЪЈ¬ЗлідЦµЈЎ";

	case ERR_PT_LOGFAIL:
		return "Ошибка входа с GateServer на GroupServer"; // "GateServerПтGroupServerµДµЗВјК§°Ь";
	case ERR_PT_SAMEGATENAME:
		return "GateServer и логин GateServer имеют одинаковое имя."; // "GateServerУлТСµЗВјGateServerЦШГы";

	case ERR_PT_INVALIDDAT:
		return "Неэффективная модель данных"; // "ОЮР§µДКэѕЭёсКЅ";
	case ERR_PT_INERR:
		return "ошибка целостности операции соединения с сервером "; // "·юОсЖчЦ®јдµДІЩЧчНкХыРФґнОу";
	case ERR_PT_NETEXCP:
		return "На сервере учетных записей возникла неисправность"; // "ХКєЕ·юОсЖч№КХП";	// GroupServer·ўПЦµДµЅAccuntServerµДНшВз№КХП
	case ERR_PT_DBEXCP:
		return "неисправность сервера базы данных"; // "КэѕЭїв·юОсЖч№КХП";	// GroupServer·ўПЦµДµЅDatabaseµД№КХП
	case ERR_PT_INVALIDCHA:
		return "На текущем аккаунте нет запроса (Выбрать/Удалить) персонажа"; // "µ±З°ХКєЕІ»УµУРЗлЗу(СЎФс/Йѕіэ)µДЅЗЙ«";
	case ERR_PT_TOMAXCHA:
		return "достигнуто максимальное количество персонажей, которых вы можете создать"; // "ТСѕ­ґпµЅЧо¶аДЬґґЅЁµДЅЗЙ«КэБЛ";
	case ERR_PT_SAMECHANAME:
		return "Имя персонажа уже существует"; // "ЦШёґµДЅЗЙ«Гы";
	case ERR_PT_INVALIDBIRTH:
		return "незаконное место рождения"; // "·З·ЁµДіцЙъµШ";
	case ERR_PT_TOOBIGCHANM:
		return "Имя персонажа слишком длинное"; // "ЅЗЙ«ГыМ«і¤";
	case ERR_PT_ISGLDLEADER:
		return "Гильдия должна иметь лидера. Сначала распустите гильдию, а затем удалите своего персонажа."; // "№«»бІ»їЙТ»ИХОЮі¤Ј¬ЗлПИЅвЙў№«»бФЩЙѕіэЅЗЙ«";
	case ERR_PT_ERRCHANAME:
		return "Недопустимое имя персонажа"; // "·З·ЁµДЅЗЙ«ГыіЖ";
	case ERR_PT_SERVERBUSY:
		return "Система занята, повторите попытку позже"; // "ПµНіГ¦Ј¬ЗлЙФєуФЩКФ";
	case ERR_PT_TOOBIGPW2:
		return "вторая длина кода недопустима"; // "¶юґОГЬВлі¤¶И·З·Ё";
	case ERR_PT_INVALID_PW2:
		return "Второй пароль не создан"; // "ОґґґЅЁЅЗЙ«±Ј»¤¶юґОГЬВл";
	case ERR_PT_BADBOY:
		return "Дитя Мое, ты очень смелая. О вас сообщили властям. Пожалуйста, больше не совершайте правонарушений!"; // "єўЧУЈ¬ДгєЬBTЈ¬ТСѕ­ЧФ¶Ї¶ФДгЧчіцБЛНЁ±ЁЕъЖАЈ¬ТЄТэТФОЄЅдЈ¬І»їЙФЩ·ёЈЎ";

	case ERR_MC_NETEXCP:
		return "Обнаружена исключительная ошибка линии на GateServer."; // "GateServer·ўПЦµДНшВзТміЈ";
	case ERR_MC_NOTSELCHA:
		return "текущее еще не обработанное состояние персонажа"; // "µ±З°Оґґ¦УЪСЎФсЅЗЙ«ЧґМ¬";
	case ERR_MC_NOTPLAY:
		return "В данный момент не в игре, не могу отправить команду ENDPLAY."; // "µ±З°І»ґ¦УЪНжУОП·ЧґМ¬Ј¬І»ДЬ·ўЛНENDPLAYГьБо";
	case ERR_MC_NOTARRIVE:
		return "целевая карта не может быть достигнута"; // "Дї±кµШНјІ»їЙµЅґп";
	case ERR_MC_TOOMANYPLY:
		return "Этот сервер в настоящее время заполнен, пожалуйста, выберите другой сервер!"; // "±ѕ·юОсЖчЧйИЛКэТСВъ, ЗлСЎФсЖдЛьЧйЅшРРУОП·!";
	case ERR_MC_NOTLOGIN:
		return "Вы не авторизованы"; // "ДгЙРОґµЗВЅ";
	case ERR_MC_VER_ERROR:
		return "Ошибка версии клиента, сервер отказался подключиться!"; // "їН»§¶ЛµД°ж±ѕєЕґнОу,·юОсЖчѕЬѕшµЗВјЈЎ";
	case ERR_MC_ENTER_ERROR:
		return "не удалось войти на карту!"; // "ЅшИлµШНјК§°ЬЈЎ";
	case ERR_MC_ENTER_POS:
		return "Положение на карте незаконное, вас отправят обратно в город вашего рождения, пожалуйста, перезайдите в систему.!"; // "µШНјО»ЦГ·З·ЁЈ¬ДъЅ«±»ЛН»ШіцЙъіЗКРЈ¬ЗлЦШРВµЗВЅЈЎ";

	case ERR_TM_OVERNAME:
		return "Имя игрового сервера повторяется"; // "GameServerГыЦШёґ";
	case ERR_TM_OVERMAP:
		return "GameServerMapNameRepeated"; // "GameServerЙПµШНјГыЦШёґ";
	case ERR_TM_MAPERR:
		return "Ошибка назначения языка карты GameServer"; // "GameServerµШНјЕдЦГУп·ЁґнОу";

	case ERR_SUCCESS:
		return "Джек слишком БТ, правильно и спросит меня, если что-то не так.!"; // "JackМ«BTБЛЈ¬ХэИ·ТІАґОКОТКІГґґнОуЈЎ";
	default: {
		int l_error_code = error_code;
		l_error_code /= 500;
		l_error_code *= 500;
		static char l_buffer[500];
		char l_convt[20];
		switch (l_error_code) {
		case ERR_MC_BASE:
			return strcat(strcpy(l_buffer, itoa(error_code, l_convt, 10)), "(GameServer/GateServer->Код ошибки возврата клиента, пространство 1–500)"); //"(GameServer/GateServer->Client·µ»ШµДґнОуВлїХјд1Ј­500)");
		case ERR_PT_BASE:
			return strcat(strcpy(l_buffer, itoa(error_code, l_convt, 10)), "(GroupServer->GateServer возвращает код ошибки в диапазоне 501–1000.)"); //"(GroupServer->GateServer·µ»ШµДґнОуВлїХјд501Ј­1000)");
		case ERR_AP_BASE:
			return strcat(strcpy(l_buffer, itoa(error_code, l_convt, 10)), "(AccountServer->GroupServe возвращает код ошибки 1001-1500)"); //"(AccountServer->GroupServer·µ»ШµДґнОуВлїХјд1001Ј­1500)");
		case ERR_MT_BASE:
			return strcat(strcpy(l_buffer, itoa(error_code, l_convt, 10)), "(GameServer->GateServer возвращает код ошибки в диапазоне 1501–2000.)"); //"(GameServer->GateServer·µ»ШµДґнОуВлїХјд1501Ј­2000)");
		default:
			return strcat(strcpy(l_buffer, itoa(error_code, l_convt, 10)), "(Джек слишком сумасшедший, он совершил ошибку, о которой я даже не знаю..)"); //"(JackМ«BTБЛЈ¬ЕЄёцґнОуБ¬ОТ¶јІ»ИПК¶ЎЈ)");
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

//±ѕєЇКэ№¦ДЬ°ьАЁјмІйЧЦ·ыґ®ЦРGBKЛ«ЧЦЅЪєєЧЦЧЦ·ыµДНкХыРФЎўНшВз°ьЦРЧЦ·ыґ®µДНкХыРФµИЎЈ
//nameОЄЦ»ФКРнУРґуРЎРґЧЦДёКэЧЦєНєєЧЦЈЁИҐіэИ«ЅЗїХёсЈ©ІЕ·µ»Шtrue;
//lenІОКэОЄЧЦ·ыґ®nameµДі¤¶И=strlen(name),І»°ьАЁЅбОІNULLЧЦ·ыЎЈ
inline bool IsValidName(const char* name, unsigned short len) {
	const unsigned char* l_name = reinterpret_cast<const unsigned char*>(name);
	bool l_ishan = false;
	//if (len == 0)
	//	return 0;
	for (unsigned short i = 0; i < len; i++) {
		if (!l_name[i]) {
			return false;
		} else if (l_ishan) {
			if (l_name[i - 1] == 0xA1 && l_name[i] == 0xA1) //№эВЛИ«ЅЗїХёс
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
		return "Операция с объектом прошла успешно"; // "µАѕЯІЩЧчіЙ№¦";
		break;
	case enumITEMOPT_ERROR_NONE:
		return "Оборудование не существует"; // "µАѕЯІ»ґжФЪ";
		break;
	case enumITEMOPT_ERROR_KBFULL:
		return "Инвентарь полон"; // "µАѕЯАёТСВъ";
		break;
	case enumITEMOPT_ERROR_UNUSE:
		return "Не удалось использовать предмет"; // "µАѕЯК№УГК§°Ь";
		break;
	case enumITEMOPT_ERROR_UNPICKUP:
		return "µRl??»ДЬE°C?"; // "µАѕЯІ»ДЬК°ИЎ";
		break;
	case enumITEMOPT_ERROR_UNTHROW:
		return "Предмет нельзя бросить"; // "µАѕЯІ»ДЬ¶ЄЖъ";
		break;
	case enumITEMOPT_ERROR_UNDEL:
		return "Предмет не может быть уничтожен"; // "µАѕЯІ»ДЬПъ»Щ";
		break;
	case enumITEMOPT_ERROR_KBLOCK:
		return "инвентарь на данный момент заблокирован"; // "µАѕЯАёґ¦УЪЛш¶ЁЧґМ¬";
		break;
	case enumITEMOPT_ERROR_DISTANCE:
		return "Расстояние слишком большое"; // "ѕаАлМ«Ф¶";
		break;
	case enumITEMOPT_ERROR_EQUIPLV:
		return "Несоответствие уровня оборудования"; // "Ч°±ёµИј¶І»ВъЧг";
		break;
	case enumITEMOPT_ERROR_EQUIPJOB:
		return "Не соответствует классу оборудования"; // "Ч°±ёЦ°ТµІ»ВъЧг";
		break;
	case enumITEMOPT_ERROR_STATE:
		return "Невозможно управлять предметами в текущем состоянии"; // "ёГЧґМ¬ПВІ»ДЬІЩЧчµАѕЯ";
		break;
	case enumITEMOPT_ERROR_PROTECT:
		return "Объект находится под защитой"; // "µАѕЯ±»±Ј»¤";
		break;
	case enumITEMOPT_ERROR_AREA:
		return "другой тип региона"; // "І»Н¬µДЗшУтАаРН";
		break;
	case enumITEMOPT_ERROR_BODY:
		return "тип сборки не соответствует"; // "МеРНІ»ЖҐЕд";
		break;
	case enumITEMOPT_ERROR_TYPE:
		return "Невозможно сохранить этот товар"; // "ґЛµАѕЯОЮ·Ёґж·Е";
		break;
	case enumITEMOPT_ERROR_INVALID:
		return "Товар не используется"; // "ОЮР§µДµАѕЯ";
		break;
	case enumITEMOPT_ERROR_KBRANGE:
		return "вне диапазона инвентаря"; // "і¬іцµАѕЯАё·¶О§";
		break;
	default:
		return "Неизвестный код ошибки использования элемента"; // "ОґЦЄµДµАѕЯІЩЧчК§°ЬВл";
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