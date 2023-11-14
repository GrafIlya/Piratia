print('Loading itemupgrade.lua')
-- Credits: Angelix@pkodev.net, KONG@pkodev.net, Billy@pkodev.net

Upgrade = {}
Upgrade.Money = 100000
Upgrade[01] = {ID = 0825, Catalyst = 2403, Result = 2549} -- KYLIN
Upgrade[02] = {ID = 0826, Catalyst = 2403, Result = 2550}
Upgrade[03] = {ID = 0827, Catalyst = 2403, Result = 2551}
Upgrade[04] = {ID = 0828, Catalyst = 2403, Result = 2552}
Upgrade[05] = {ID = 0845, Catalyst = 2404, Result = 2367} -- BLACK DRAGON
Upgrade[06] = {ID = 0846, Catalyst = 2404, Result = 2368}
Upgrade[07] = {ID = 0847, Catalyst = 2404, Result = 2369}
Upgrade[08] = {ID = 0848, Catalyst = 2404, Result = 2370}
Upgrade[09] = {ID = 2530, Catalyst = 2562, Result = 2817} -- HARDIN
Upgrade[10] = {ID = 2531, Catalyst = 2562, Result = 2818}
Upgrade[11] = {ID = 2532, Catalyst = 2562, Result = 2819}
Upgrade[12] = {ID = 2533, Catalyst = 2563, Result = 2820} -- DARKNESS
Upgrade[13] = {ID = 2534, Catalyst = 2563, Result = 2821}
Upgrade[14] = {ID = 2535, Catalyst = 2563, Result = 2822}
Upgrade[15] = {ID = 2536, Catalyst = 2564, Result = 2823} -- ABADDON
Upgrade[16] = {ID = 2537, Catalyst = 2564, Result = 2824}
Upgrade[17] = {ID = 2538, Catalyst = 2564, Result = 2825}
Upgrade[18] = {ID = 2539, Catalyst = 2565, Result = 2826} -- ASURA
Upgrade[19] = {ID = 2540, Catalyst = 2565, Result = 2827}
Upgrade[20] = {ID = 2541, Catalyst = 2565, Result = 2828}
Upgrade[21] = {ID = 2542, Catalyst = 2566, Result = 2829} -- ABYSS
Upgrade[22] = {ID = 2543, Catalyst = 2566, Result = 2830}
Upgrade[23] = {ID = 2544, Catalyst = 2566, Result = 2831}
Upgrade[24] = {ID = 2545, Catalyst = 2567, Result = 2832} -- STYX
Upgrade[25] = {ID = 2546, Catalyst = 2567, Result = 2833}
Upgrade[26] = {ID = 2547, Catalyst = 2567, Result = 2834}
-- ====================================================================
-- Upgrading unseals
-- ====================================================================
unsealup = {}
-- extmake.give(GetPlayerByName('Sharpie'), 0774, unsealup[0774][10150])

-- Crusader
unsealup[0774]	= { -- Blade of Incantation
	[10150] 	= {	[ITEMATTR_VAL_STR]	= 4,
					[ITEMATTR_COE_STR]	= 10,
					[ITEMATTR_VAL_HIT]	= 6,
					[ITEMATTR_VAL_FLEE]	= 0,
					[ITEMATTR_VAL_MXATK]= 152 },
	[10151] 	= {	[ITEMATTR_COE_ASPD]	= 90,
					[ITEMATTR_VAL_DEX]	= 0,
					[ITEMATTR_VAL_AGI]	= 5,
					[ITEMATTR_VAL_MXATK]= 143,
					[ITEMATTR_VAL_FLEE]	= 11 }}
unsealup[0775]	= { -- Dance of Evanescence
	[10152] 	= {	[ITEMATTR_VAL_STR]	= 5,
					[ITEMATTR_COE_STR]	= 15,
					[ITEMATTR_VAL_HIT]	= 8,
					[ITEMATTR_VAL_FLEE]	= 0,
					[ITEMATTR_VAL_MXATK]= 172 },
	[10153] 	= {	[ITEMATTR_COE_ASPD]	= 100,
					[ITEMATTR_VAL_DEX]	= 0,
					[ITEMATTR_VAL_AGI]	= 8,
					[ITEMATTR_VAL_MXATK]= 165,
					[ITEMATTR_VAL_FLEE]	= 13 }}
unsealup[0776]	= { -- Blade of Enigma
	[10154] 	= {	[ITEMATTR_VAL_STR]	= 6,
					[ITEMATTR_COE_STR]	= 20,
					[ITEMATTR_VAL_HIT]	= 10,
					[ITEMATTR_VAL_FLEE]	= 0,
					[ITEMATTR_VAL_MXATK]= 199 },
	[10155] 	= {	[ITEMATTR_COE_ASPD]	= 120,
					[ITEMATTR_VAL_DEX]	= 0,
					[ITEMATTR_VAL_AGI]	= 10,
					[ITEMATTR_VAL_MXATK]= 181,
					[ITEMATTR_VAL_FLEE]	= 15 }}
-- Champion
unsealup[0771]	= { -- Greatsword of Incantation
	[10156] 	= {	[ITEMATTR_VAL_STR]	= 6,
					[ITEMATTR_COE_STR]	= 20,
					[ITEMATTR_VAL_HIT]	= 10,
					[ITEMATTR_VAL_MNATK]= 302,
					[ITEMATTR_VAL_MXATK]= 335 },
	[10157] 	= {	[ITEMATTR_COE_ASPD]	= 60,
					[ITEMATTR_VAL_AGI]	= 5,
					[ITEMATTR_VAL_MNATK]= 252,
					[ITEMATTR_VAL_MXATK]= 311,
					[ITEMATTR_VAL_DEF]	= 15 }}
unsealup[0772]	= { -- Roar of Evanescence
	[10158] 	= {	[ITEMATTR_VAL_STR]	= 10,
					[ITEMATTR_COE_STR]	= 30,
					[ITEMATTR_VAL_HIT]	= 15,
					[ITEMATTR_VAL_MNATK]= 349,
					[ITEMATTR_VAL_MXATK]= 387 },
	[10159] 	= {	[ITEMATTR_COE_ASPD]	= 80,
					[ITEMATTR_VAL_AGI]	= 8,
					[ITEMATTR_VAL_MNATK]= 292,
					[ITEMATTR_VAL_MXATK]= 364,
					[ITEMATTR_VAL_DEF]	= 20 }}
unsealup[0773]	= { -- Judgment of Enigma
	[10160] 	= {	[ITEMATTR_VAL_STR]	= 15,
					[ITEMATTR_COE_STR]	= 40,
					[ITEMATTR_VAL_HIT]	= 20,
					[ITEMATTR_VAL_MNATK]= 401,
					[ITEMATTR_VAL_MXATK]= 475 },
	[10161] 	= {	[ITEMATTR_COE_ASPD]	= 100,
					[ITEMATTR_VAL_AGI]	= 10,
					[ITEMATTR_VAL_MNATK]= 337,
					[ITEMATTR_VAL_MXATK]= 442,
					[ITEMATTR_VAL_DEF]	= 30 }}
-- Sharpshooter
unsealup[0782]	= { -- Kiss of the Cursed
	[10162] 	= {	[ITEMATTR_VAL_MNATK]= 299,
					[ITEMATTR_VAL_MXATK]= 374,
					[ITEMATTR_COE_ASPD]	= -20,
					[ITEMATTR_VAL_DEX]	= 8,
					[ITEMATTR_VAL_HIT]	= 10 },
	[10163] 	= {	[ITEMATTR_VAL_MNATK]= 251,
					[ITEMATTR_VAL_MXATK]= 338,
					[ITEMATTR_COE_ASPD]	= 0,
					[ITEMATTR_VAL_CON]	= 6,
					[ITEMATTR_VAL_STA]	= 0 }}
unsealup[0783]	= { -- Bellow of Evanescence
	[10164] 	= {	[ITEMATTR_VAL_MNATK]= 342,
					[ITEMATTR_VAL_MXATK]= 425,
					[ITEMATTR_COE_ASPD]	= -10,
					[ITEMATTR_VAL_DEX]	= 12,
					[ITEMATTR_VAL_HIT]	= 15 },
	[10165] 	= {	[ITEMATTR_VAL_MNATK]= 273,
					[ITEMATTR_VAL_MXATK]= 382,
					[ITEMATTR_COE_ASPD]	= 10,
					[ITEMATTR_VAL_CON]	= 8,
					[ITEMATTR_VAL_STA]	= 0 }}
unsealup[0784]	= { -- Rifle of Enigma
	[10166] 	= {	[ITEMATTR_VAL_MNATK]= 383,
					[ITEMATTR_VAL_MXATK]= 467,
					[ITEMATTR_COE_ASPD]	= 0,
					[ITEMATTR_VAL_DEX]	= 15,
					[ITEMATTR_VAL_HIT]	= 20 },
	[10167] 	= {	[ITEMATTR_VAL_MNATK]= 295,
					[ITEMATTR_VAL_MXATK]= 405,
					[ITEMATTR_COE_ASPD]	= 20,
					[ITEMATTR_VAL_CON]	= 10,
					[ITEMATTR_VAL_STA]	= 0 }}
-- Voyager
unsealup[0800]	= { -- Tooth of the Cursed
	[10168] 	= {	[ITEMATTR_VAL_STR]	= 0,
					[ITEMATTR_COE_ASPD]	= 0,
					[ITEMATTR_COE_MXSP]	= 100,
					[ITEMATTR_VAL_STA]	= 8,
					[ITEMATTR_VAL_MSPD]	= 30 },
	[10169] 	= {	[ITEMATTR_VAL_STR]	= 0,
					[ITEMATTR_COE_ASPD]	= 0,
					[ITEMATTR_VAL_DEF]	= 10,
					[ITEMATTR_VAL_CON]	= 2,
					[ITEMATTR_VAL_MSPD]	= 30 }}
unsealup[0801]	= { -- Tooth of Evanescence
	[10170] 	= {	[ITEMATTR_VAL_STR]	= 0,
					[ITEMATTR_COE_ASPD]	= 0,
					[ITEMATTR_COE_MXSP]	= 120,
					[ITEMATTR_VAL_STA]	= 12,
					[ITEMATTR_VAL_MSPD]	= 40 },
	[10171] 	= {	[ITEMATTR_VAL_STR]	= 0,
					[ITEMATTR_COE_ASPD]	= 0,
					[ITEMATTR_VAL_DEF]	= 15,
					[ITEMATTR_VAL_CON]	= 3,
					[ITEMATTR_VAL_MSPD]	= 40 }}
unsealup[0802]	= { -- Kris of the Sphinx
	[10172] 	= {	[ITEMATTR_VAL_STR]	= 0,
					[ITEMATTR_COE_ASPD]	= 0,
					[ITEMATTR_COE_MXSP]	= 140,
					[ITEMATTR_VAL_STA]	= 15,
					[ITEMATTR_VAL_MSPD]	= 50 },
	[10173] 	= {	[ITEMATTR_VAL_STR]	= 0,
					[ITEMATTR_COE_ASPD]	= 0,
					[ITEMATTR_VAL_DEF]	= 20,
					[ITEMATTR_VAL_CON]	= 9,
					[ITEMATTR_VAL_MSPD]	= 50 }}
-- Cleric
unsealup[0786]	= { -- Staff of Incantation
	[10174] 	= {	[ITEMATTR_VAL_STA]	= 14,
					[ITEMATTR_VAL_DEX]	= 0,
					[ITEMATTR_VAL_CON]	= 2,
					[ITEMATTR_COE_STA]	= 10,
					[ITEMATTR_VAL_HIT]	= 0 },
	[10175] 	= {	[ITEMATTR_VAL_DEX]	= 0,
					[ITEMATTR_VAL_CON]	= 6,
					[ITEMATTR_VAL_MSPD]	= 10,
					[ITEMATTR_COE_SREC]	= 100,
					[ITEMATTR_VAL_HIT]	= 0 }}
unsealup[0787]	= { -- Staff of Evanescence
	[10176] 	= {	[ITEMATTR_VAL_STA]	= 16,
					[ITEMATTR_VAL_DEX]	= 0,
					[ITEMATTR_VAL_CON]	= 3,
					[ITEMATTR_COE_STA]	= 15,
					[ITEMATTR_VAL_HIT]	= 0 },
	[10177] 	= {	[ITEMATTR_VAL_DEX]	= 0,
					[ITEMATTR_VAL_CON]	= 8,
					[ITEMATTR_VAL_MSPD]	= 20,
					[ITEMATTR_COE_SREC]	= 120,
					[ITEMATTR_VAL_HIT]	= 0 }}
unsealup[0788]	= { -- Staff of Enigma
	[10178] 	= {	[ITEMATTR_VAL_STA]	= 18,
					[ITEMATTR_VAL_DEX]	= 0,
					[ITEMATTR_VAL_CON]	= 4,
					[ITEMATTR_COE_STA]	= 20,
					[ITEMATTR_VAL_HIT]	= 0 },
	[10179] 	= {	[ITEMATTR_VAL_DEX]	= 0,
					[ITEMATTR_VAL_CON]	= 10,
					[ITEMATTR_VAL_MSPD]	= 30,
					[ITEMATTR_COE_SREC]	= 140,
					[ITEMATTR_VAL_HIT]	= 0 }}
-- Sealmaster
unsealup[0793]	= { -- Staff of Abraxas
	[10180] 	= {	[ITEMATTR_VAL_STA]	= 14,
					[ITEMATTR_VAL_DEX]	= 0,
					[ITEMATTR_COE_STA]	= 05,
					[ITEMATTR_VAL_HIT]	= 0 },
	[10181] 	= {	[ITEMATTR_VAL_DEX]	= 0,
					[ITEMATTR_VAL_CON]	= 8,
					[ITEMATTR_VAL_MSPD]	= 10,
					[ITEMATTR_COE_DEF]	= 10,
					[ITEMATTR_VAL_HIT]	= 0 }}
unsealup[0794]	= { -- Staff of Mirage
	[10182] 	= {	[ITEMATTR_VAL_STA]	= 16,
					[ITEMATTR_VAL_DEX]	= 0,
					[ITEMATTR_COE_STA]	= 10,
					[ITEMATTR_VAL_HIT]	= 0 },
	[10183] 	= {	[ITEMATTR_VAL_DEX]	= 0,
					[ITEMATTR_VAL_CON]	= 10,
					[ITEMATTR_VAL_MSPD]	= 20,
					[ITEMATTR_COE_DEF]	= 15,
					[ITEMATTR_VAL_HIT]	= 0 }}
unsealup[0795]	= { -- Staff of Sphinx
	[10184] 	= {	[ITEMATTR_VAL_STA]	= 18,
					[ITEMATTR_VAL_DEX]	= 0,
					[ITEMATTR_COE_STA]	= 15,
					[ITEMATTR_VAL_HIT]	= 0 },
	[10185] 	= {	[ITEMATTR_VAL_DEX]	= 0,
					[ITEMATTR_VAL_CON]	= 12,
					[ITEMATTR_VAL_MSPD]	= 30,
					[ITEMATTR_COE_DEF]	= 20,
					[ITEMATTR_VAL_HIT]	= 0 }}

-- extmake.give(GetPlayerByName('WTF'), 0767, unsealup[0776][10186])
unsealup[0767]	= { -- Platemail of the Cursed Soul
	[10186] 	= {	[ITEMATTR_VAL_STR]	= 4,
					[ITEMATTR_VAL_PDEF]	= 21,
					[ITEMATTR_COE_DEF]	= 70,
					[ITEMATTR_VAL_FLEE]	= 0,
					[ITEMATTR_VAL_HIT]	= 8 },
	[10187] 	= {	[ITEMATTR_VAL_AGI]	= 8,
					[ITEMATTR_VAL_PDEF]	= 21,
					[ITEMATTR_COE_DEF]	= 80,
					[ITEMATTR_VAL_DEF]	= 62,
					[ITEMATTR_VAL_FLEE]	= 10 }}
unsealup[0768]	= { -- Armor of Evanescence
	[10188] 	= {	[ITEMATTR_VAL_STR]	= 6,
					[ITEMATTR_VAL_PDEF]	= 25,
					[ITEMATTR_COE_DEF]	= 80,
					[ITEMATTR_VAL_FLEE]	= 0,
					[ITEMATTR_VAL_HIT]	= 10 },
	[10189] 	= {	[ITEMATTR_VAL_AGI]	= 10,
					[ITEMATTR_VAL_PDEF]	= 25,
					[ITEMATTR_COE_DEF]	= 90,
					[ITEMATTR_VAL_DEF]	= 78,
					[ITEMATTR_VAL_FLEE]	= 12 }}
unsealup[0769]	= { -- Armor of Enigma
	[10190] 	= {	[ITEMATTR_VAL_STR]	= 8,
					[ITEMATTR_VAL_PDEF]	= 29,
					[ITEMATTR_COE_DEF]	= 90,
					[ITEMATTR_VAL_FLEE]	= 0,
					[ITEMATTR_VAL_HIT]	= 12 },
	[10191] 	= {	[ITEMATTR_VAL_AGI]	= 12,
					[ITEMATTR_VAL_PDEF]	= 29,
					[ITEMATTR_COE_DEF]	= 100,
					[ITEMATTR_VAL_DEF]	= 95,
					[ITEMATTR_VAL_FLEE]	= 15 }}
unsealup[0764]	= { -- Tattoo of the Cursed Warrior
	[10192] 	= {	[ITEMATTR_VAL_STR]	= 10,
					[ITEMATTR_VAL_PDEF]	= 21,
					[ITEMATTR_COE_DEF]	= 90,
					[ITEMATTR_COE_STR]	= 10,
					[ITEMATTR_VAL_HIT]	= 6 },
	[10193] 	= {	[ITEMATTR_VAL_CON]	= 10,
					[ITEMATTR_VAL_PDEF]	= 21,
					[ITEMATTR_COE_DEF]	= 100,
					[ITEMATTR_VAL_AGI]	= 6,
					[ITEMATTR_VAL_DEF]	= 67 }}
unsealup[0765]	= { -- Tattoo of Evanescence
	[10194] 	= {	[ITEMATTR_VAL_STR]	= 12,
					[ITEMATTR_VAL_PDEF]	= 25,
					[ITEMATTR_COE_DEF]	= 100,
					[ITEMATTR_COE_STR]	= 15,
					[ITEMATTR_VAL_HIT]	= 8 },
	[10195] 	= {	[ITEMATTR_VAL_CON]	= 12,
					[ITEMATTR_VAL_PDEF]	= 25,
					[ITEMATTR_COE_DEF]	= 110,
					[ITEMATTR_VAL_AGI]	= 8,
					[ITEMATTR_VAL_DEF]	= 75 }}
unsealup[0766]	= { -- Tattoo of Enigma
	[10196] 	= {	[ITEMATTR_VAL_STR]	= 15,
					[ITEMATTR_VAL_PDEF]	= 29,
					[ITEMATTR_COE_DEF]	= 110,
					[ITEMATTR_COE_STR]	= 20,
					[ITEMATTR_VAL_HIT]	= 10 },
	[10197] 	= {	[ITEMATTR_VAL_CON]	= 15,
					[ITEMATTR_VAL_PDEF]	= 29,
					[ITEMATTR_COE_DEF]	= 120,
					[ITEMATTR_VAL_AGI]	= 10,
					[ITEMATTR_VAL_DEF]	= 87 }}
unsealup[0778]	= { -- Corset of Incantation
	[10198] 	= {	[ITEMATTR_VAL_STA]	= 0,
					[ITEMATTR_VAL_PDEF]	= 18,
					[ITEMATTR_VAL_MSPD]	= 10,
					[ITEMATTR_VAL_DEX]	= 6,
					[ITEMATTR_VAL_HIT]	= 6 },
	[10199] 	= {	[ITEMATTR_VAL_STA]	= 0,
					[ITEMATTR_VAL_PDEF]	= 18,
					[ITEMATTR_VAL_MSPD]	= 10,
					[ITEMATTR_VAL_AGI]	= 8,
					[ITEMATTR_VAL_CON]	= 8 }}
unsealup[0779]	= { -- Coat of Evanescence
	[10200] 	= {	[ITEMATTR_VAL_STA]	= 0,
					[ITEMATTR_VAL_PDEF]	= 22,
					[ITEMATTR_VAL_MSPD]	= 20,
					[ITEMATTR_VAL_DEX]	= 8,
					[ITEMATTR_VAL_HIT]	= 10 },
	[10201] 	= {	[ITEMATTR_VAL_STA]	= 0,
					[ITEMATTR_VAL_PDEF]	= 22,
					[ITEMATTR_VAL_MSPD]	= 20,
					[ITEMATTR_VAL_AGI]	= 10,
					[ITEMATTR_VAL_CON]	= 10 }}
unsealup[0780]	= { -- Mantle of Enigma
	[10202] 	= {	[ITEMATTR_VAL_STA]	= 0,
					[ITEMATTR_VAL_PDEF]	= 26,
					[ITEMATTR_VAL_MSPD]	= 30,
					[ITEMATTR_VAL_DEX]	= 10,
					[ITEMATTR_VAL_HIT]	= 14 },
	[10203] 	= {	[ITEMATTR_VAL_STA]	= 0,
					[ITEMATTR_VAL_PDEF]	= 26,
					[ITEMATTR_VAL_MSPD]	= 30,
					[ITEMATTR_VAL_AGI]	= 12,
					[ITEMATTR_VAL_CON]	= 12 }}
unsealup[0804]	= { -- Mantle of the Cursed Flame
	[10204] 	= {	[ITEMATTR_VAL_STA]	= 6,
					[ITEMATTR_VAL_PDEF]	= 19,
					[ITEMATTR_VAL_DEX]	= 0,
					[ITEMATTR_COE_STA]	= 10,
					[ITEMATTR_VAL_FLEE]	= 0 },
	[10205] 	= {	[ITEMATTR_VAL_DEX]	= 0,
					[ITEMATTR_VAL_PDEF]	= 19,
					[ITEMATTR_VAL_CON]	= 10,
					[ITEMATTR_VAL_DEF]	= 57,
					[ITEMATTR_COE_DEF]	= 20 }}
unsealup[0805]	= { -- Cloak of Evanescence
	[10206] 	= {	[ITEMATTR_VAL_STA]	= 8,
					[ITEMATTR_VAL_PDEF]	= 23,
					[ITEMATTR_VAL_DEX]	= 0,
					[ITEMATTR_COE_STA]	= 20,
					[ITEMATTR_VAL_FLEE]	= 0 },
	[10207] 	= {	[ITEMATTR_VAL_DEX]	= 0,
					[ITEMATTR_VAL_PDEF]	= 23,
					[ITEMATTR_VAL_CON]	= 12,
					[ITEMATTR_VAL_DEF]	= 65,
					[ITEMATTR_COE_DEF]	= 40 }}
unsealup[0806]	= { -- Mantle of the Sphinx
	[10208] 	= {	[ITEMATTR_VAL_STA]	= 10,
					[ITEMATTR_VAL_PDEF]	= 27,
					[ITEMATTR_VAL_DEX]	= 0,
					[ITEMATTR_COE_STA]	= 30,
					[ITEMATTR_VAL_FLEE]	= 0 },
	[10209] 	= {	[ITEMATTR_VAL_DEX]	= 0,
					[ITEMATTR_VAL_PDEF]	= 27,
					[ITEMATTR_VAL_CON]	= 14,
					[ITEMATTR_VAL_DEF]	= 72,
					[ITEMATTR_COE_DEF]	= 60 }}
unsealup[0790]	= { -- Coat of Invocation
	[10210] 	= {	[ITEMATTR_VAL_PDEF]	= 17,
					[ITEMATTR_VAL_STR]	= 0,
					[ITEMATTR_VAL_STA]	= 8,
					[ITEMATTR_VAL_CON]	= 0,
					[ITEMATTR_VAL_MSPD]	= 10 },
	[10211] 	= {	[ITEMATTR_VAL_PDEF]	= 17,
					[ITEMATTR_VAL_STR]	= 0,
					[ITEMATTR_COE_MXSP]	= 30,
					[ITEMATTR_COE_SREC]	= 300,
					[ITEMATTR_VAL_MSPD]	= 10 }}
unsealup[0791]	= { -- Robe of the Arcane
	[10212] 	= {	[ITEMATTR_VAL_PDEF]	= 20,
					[ITEMATTR_VAL_STR]	= 0,
					[ITEMATTR_VAL_STA]	= 10,
					[ITEMATTR_VAL_CON]	= 0,
					[ITEMATTR_VAL_MSPD]	= 20 },
	[10213] 	= {	[ITEMATTR_VAL_PDEF]	= 20,
					[ITEMATTR_VAL_STR]	= 0,
					[ITEMATTR_COE_MXSP]	= 40,
					[ITEMATTR_COE_SREC]	= 340,
					[ITEMATTR_VAL_MSPD]	= 20 }}
unsealup[0792]	= { -- Robe of Enigma
	[10214] 	= {	[ITEMATTR_VAL_PDEF]	= 25,
					[ITEMATTR_VAL_STR]	= 0,
					[ITEMATTR_VAL_STA]	= 12,
					[ITEMATTR_VAL_CON]	= 0,
					[ITEMATTR_VAL_MSPD]	= 30 },
	[10215] 	= {	[ITEMATTR_VAL_PDEF]	= 25,
					[ITEMATTR_VAL_STR]	= 0,
					[ITEMATTR_COE_MXSP]	= 50,
					[ITEMATTR_COE_SREC]	= 380,
					[ITEMATTR_VAL_MSPD]	= 30 }}
unsealup[0796]	= { -- Robe of Abraxas
	[10216] 	= {	[ITEMATTR_VAL_PDEF]	= 17,
					[ITEMATTR_VAL_STR]	= 0,
					[ITEMATTR_VAL_STA]	= 8,
					[ITEMATTR_COE_STA]	= 10,
					[ITEMATTR_VAL_MSPD]	= 10 },
	[10217] 	= {	[ITEMATTR_VAL_PDEF]	= 17,
					[ITEMATTR_VAL_STR]	= 0,
					[ITEMATTR_COE_DEF]	= 130,
					[ITEMATTR_VAL_CON]	= 8,
					[ITEMATTR_VAL_MSPD]	= 10 }}
unsealup[0797]	= { -- Robe of Malediction
	[10218] 	= {	[ITEMATTR_VAL_PDEF]	= 21,
					[ITEMATTR_VAL_STR]	= 0,
					[ITEMATTR_VAL_STA]	= 10,
					[ITEMATTR_COE_STA]	= 15,
					[ITEMATTR_VAL_MSPD]	= 20 },
	[10219] 	= {	[ITEMATTR_VAL_PDEF]	= 21,
					[ITEMATTR_VAL_STR]	= 0,
					[ITEMATTR_COE_DEF]	= 150,
					[ITEMATTR_VAL_CON]	= 10,
					[ITEMATTR_VAL_MSPD]	= 20 }}
unsealup[0798]	= { -- Robe of the Sphinx
	[10220] 	= {	[ITEMATTR_VAL_PDEF]	= 25,
					[ITEMATTR_VAL_STR]	= 0,
					[ITEMATTR_VAL_STA]	= 12,
					[ITEMATTR_COE_STA]	= 20,
					[ITEMATTR_VAL_MSPD]	= 30 },
	[10221] 	= {	[ITEMATTR_VAL_PDEF]	= 25,
					[ITEMATTR_VAL_STR]	= 0,
					[ITEMATTR_COE_DEF]	= 170,
					[ITEMATTR_VAL_CON]	= 12,
					[ITEMATTR_VAL_MSPD]	= 30 }}

function IsFullEquipUpgraded(cha)
  local player,boat = IsPlayer(cha), ChaIsBoat(cha)
  if player == 0 and boat == 1 then return 0 end
  local armor = GetChaItem(cha, 1, 2)
  local weap1 = GetChaItem(cha, 1, 9)
  if armor == nil or weap1 == nil then return 0 end
  local armorid = GetItemID(armor)
  local fusedarmorid = GetItemAttr(armor, ITEMATTR_VAL_FUSIONID)
  if fusedarmorid ~= 0 then armorid = fusedarmorid end
  local weap1id = GetItemID(weap1)
  local fusedweap1id = GetItemAttr(weap1, ITEMATTR_VAL_FUSIONID)
  if fusedweap1id ~= 0 then weap1id = fusedweap1id end
  local isAwakened = GetItemAttr(armor, ITEMATTR_MAXENERGY) >= MAXENERGY_AWAKEN and
                     GetItemAttr(weap1, ITEMATTR_MAXENERGY) >= MAXENERGY_AWAKEN
  if not isAwakened then return 0 end
  local isItemID = unsealup[weap1id] ~= nil and unsealup[armorid] ~= nil
  if not isItemID then return 0 end
  local isSameLv = GetItemLv(armor) == GetItemLv(weap1)
  if not isSameLv then return 0 end
  local job = GetChaAttr(cha, ATTR_JOB)
  if job ~= JOB_TYPE_SHUANGJS then return 1 else
    local weap2 = GetChaItem(cha, 1, 6)
    if weap2 == nil then return 0 end
    local weap2id = GetItemID(weap2)
    local fusedweap2id = GetItemAttr(weap2, ITEMATTR_VAL_FUSIONID)
    if fusedweap2id ~= 0 then weap2id = fusedweap2id end
    if not (isAwakened and GetItemAttr(weap2, ITEMATTR_MAXENERGY) >= MAXENERGY_AWAKEN) then return 0 end
    if not (isItemID and unsealup[weap2id] ~= nil) then return 0 end
    if not (isSameLv and GetItemLv(armor) == GetItemLv(weap2)) then return 0 end
    return 1
  end
  return 0
end

unsealup[2817]	= { -- Hardin's Bind
	[10222] 	= {	[ITEMATTR_VAL_STR]	= 24 }}
unsealup[2820]	= { -- Darkness's Shadow
	[10223] 	= {	[ITEMATTR_VAL_STR]	= 18 }}
unsealup[2823]	= { -- Abaddon's Seal
	[10224] 	= {	[ITEMATTR_VAL_DEX]	= 18 }}
unsealup[2826]	= { -- Asura's Protection
	[10225] 	= {	[ITEMATTR_VAL_STA]	= 24 }}
unsealup[2829]	= { -- Abyss's Possession
	[10226] 	= {	[ITEMATTR_VAL_STA]	= 25 }}
unsealup[2832]	= { -- Styx's Torso
	[10227] 	= {	[ITEMATTR_VAL_CON]	= 25 }}

--AwakenedTick = player_timer

function ChaHasAwakenedSet(cha)
	return true
end

-- Use RecheckAttr instead
--[[function player_time(cha)
	AwakenedTick(cha)
	if ChaHasAwakenedSet(cha) then
	end
end]]
--[[ function upgradeunseal(cha)
	local slot = 4
	local item = GetChaItem(cha, 2, (slot-1))
	local item_mxenergy = GetItemAttr(item, ITEMATTR_MAXENERGY)
	local itemid = GetItemID(item)
	local isFuse = GetItemAttr(item, ITEMATTR_VAL_FUSIONID)
	if isFuse ~= 0 then
		itemid = GetItemAttr(item, ITEMATTR_VAL_FUSIONID)
	end
	local energy = 9000
	if item_mxenergy ~= energy then
		if unsealup[itemid] ~= nil then
			local a = false
			for i,v in pairs(unsealup[itemid].offensive) do
				a = true
				SetItemAttr(item, i, v)
			end
			if a then
				SetItemAttr(item, ITEMATTR_MAXENERGY, energy)
				PlayEffect(cha, 345)
				SynChaKitbag(cha, 13)
			end
		end
	end
end -- &lua upgradeunseal(GetPlayerByName('Sharpie')) ]]

weap_t = {}
weap_t[09] = true -- Staff
weap_t[02] = true -- Hammer
weap_t[07] = true -- Dagger
weap_t[04] = true -- Gun
weap_t[03] = true -- Bow
weap_t[01] = true -- Sword
weap_t[11] = true -- Shield
eqpt_t = {}
eqpt_t[22] = true
eqpt_t[23] = true
eqpt_t[24] = true
eqpt_t[27] = true
eqpt_t[20] = true

function IsItemWeapon(item)
	local t = weap_t
	return t[GetItemType(item)]
end

function IsItemArmor(item)
	local t = eqpt_t
	return t[GetItemType(item)]
end

function IsItemEquipment(item)
	--local t = weap_t
	--local v = eqpt_t
	--local itemtype = GetItemType(item)
	--return t[itemtype] or v[itemtype]
	return IsItemWeapon(item) or IsItemArmor(item)
end

function GetItemNameWithPrefix(item)
end

ATR_PREFIX = 70
DEF_PREFIX = 71
ENH_PREFIX = 72

awake = {}
awake[22] = {ITEMATTR_COE_DEF,ITEMATTR_VAL_CON,ITEMATTR_VAL_PDEF,ITEMATTR_VAL_DEF,ITEMATTR_VAL_MXHP}
awake[23] = {ITEMATTR_VAL_CRT,ITEMATTR_VAL_HIT,ITEMATTR_VAL_ASPD,ITEMATTR_VAL_MXHP,ITEMATTR_VAL_MXSP}
awake[24] = {ITEMATTR_VAL_CRT,ITEMATTR_VAL_MSPD,ITEMATTR_VAL_FLEE,ITEMATTR_VAL_MXHP,ITEMATTR_VAL_MXSP}
awake[20] = {ITEMATTR_VAL_STR,ITEMATTR_VAL_AGI,ITEMATTR_VAL_DEX,ITEMATTR_VAL_CON,ITEMATTR_VAL_STA}
awake[27] = awake[22]
awake[01] = awake[20]

statnametable = statnametable or (function()
	local t = {}
	for i,v in pairs(_G) do
		if string.find(i, 'ITEMATTR_COE_') == 1 then
			t[_G[i]] = 'percent '..string.lower(string.sub(i, 14))
		end
		if string.find(i, 'ITEMATTR_VAL_') == 1 then
			t[_G[i]] = string.lower(string.sub(i, 14))
		end
	end
	return t
end)()

function GetStatName(attr)
	local t = statnametable
	if t[attr] ~= nil then
		return t[attr]
	end return '?'
end
-- ====================================================================
-- Creat_Item hooks
-- ====================================================================
itemColour = {}
	-- BD set will always be purple
	--itemColour[0845] = 16
	--itemColour[0846] = 16
	--itemColour[0847] = 16
	--itemColour[0848] = 16
	-- Chaos set will always be green
	itemColour[1124] = 15
	itemColour[1125] = 15
	itemColour[1126] = 15
	itemColour[1127] = 15
	-- unique rings are green
	itemColour[0281] = 15
	itemColour[0286] = 15
	itemColour[0324] = 15
	itemColour[0334] = 15
	itemColour[0387] = 15
	itemColour[0282] = 15
	itemColour[0287] = 15
	itemColour[0327] = 15
	itemColour[0346] = 15
	itemColour[0414] = 15
	itemColour[0283] = 15
	itemColour[0288] = 15
	itemColour[0328] = 15
	itemColour[0347] = 15
	itemColour[0415] = 15
	itemColour[0284] = 15
	itemColour[0524] = 15
	itemColour[0329] = 15
	itemColour[0348] = 15
	itemColour[0416] = 15
	itemColour[0285] = 15
	itemColour[0321] = 15
	itemColour[0330] = 15
	itemColour[0349] = 15
	itemColour[0417] = 15
	-- unique necks are green
	itemColour[0418] = 15
	itemColour[0420] = 15
	itemColour[0739] = 15
	itemColour[0462] = 15
	itemColour[0495] = 15
	itemColour[0419] = 15
	itemColour[0421] = 15
	itemColour[0461] = 15
	itemColour[0463] = 15
	itemColour[0497] = 15

ForbidItem = {} -- TODO: chip/broken/azrael/advance/kylin/bd/

createitemhook = Creat_ItemX

function Creat_ItemX(item, item_type, item_lv, item_event)
	local item, item_type, item_lv, item_event = createitemhook(item, item_type, item_lv, item_event)
	-- ================================================================
	-- death equipments
	-- ================================================================
	local isDeath = false
	for i = 2817, 2832, 3 do
		if GetItemID(item) == i then
			isDeath = true
			break
		end
	end
	if isDeath then
		Add_Item_Attr(26, 0)
		Add_Item_Attr(27, 0)
		--Add_Item_Attr(183, 0)
		Add_Item_Attr(28, 0)
		Add_Item_Attr(29, 0)
		Add_Item_Attr(30, 0)
	end
	-- ================================================================
	-- Awakening
	-- ================================================================
	-- only items from npc...
	if item_event == 0 and IsItemEquipment(item) then
		local item_mxenergy = GetItemAttr(item, ITEMATTR_MAXENERGY)
		if item_mxenergy == 0 then
			local itemtype = GetItemType(item)
			if awake[itemtype] ~= nil then
				for i = 1, table.getn(awake[itemtype]) do
					Add_Item_Attr(awake[itemtype][i], 0)
				end
			end
		end
	end
	-- ================================================================
	--  Green Equipments
	-- ================================================================
	if itemColour[GetItemID(item)] ~= nil then
		--if item_event == 0 or item_event == 1 or item_event == 4 or item_event == 22 then
			item_event = itemColour[GetItemID(item)]
			SetItemPrefix(item, 0)
		--end
	end
	
	-- ================================================================
	--  Setting the item level
	-- ================================================================
	local itemLv = GetItemLv2(GetItemID(item))
	SetItemLv(item, itemLv)
	return item, item_type, item_lv, item_event
end

-- Credits: Billy
extmake = {}
extmake.attr = {}
extmake.event = 127

Hook:AddPreHook("Creat_Item_Tattr", function(...)
										local arg = {...}
										local itemtype, itemlv, itemevent = arg[1], arg[2], arg[3]
										if itemevent == extmake.event then
											for i,v in pairs(extmake.attr) do
												Add_Item_Attr(i, 0)
											end
											return false
										end
									end)
MAXENERGY_AWAKEN = 9000
MAXENERGY_ENHANC = 5000

extmake.give = function(cha, itemid, t, attr)
	attr = attr or MAXENERGY_AWAKEN
	local canget = GetChaFreeBagGridNum(cha)
	if canget < 1 then
		SystemNotice(cha, 'Insufficient inventory slots!')
		return false
	end
	if type(t) ~= 'table' then t = {} end
	extmake.attr = t
	local ignore,slot = MakeItem(cha, itemid, 1, extmake.event)
	local item = GetChaItem(cha, 2, slot)
	for i,v in pairs(t) do
		SetItemAttr(item, i, v)
	end
	SetItemAttr(item, ITEMATTR_MAXENERGY, attr)
	SynChaKitbag(cha, 13)
	extmake.attr = {}
	return ignore, slot
end -- extmake.give(GetPlayerByName('Sharpie'), 825, {[26]=500})

-- ====================================================================
-- Upgrading Death sets
-- ====================================================================
function upgradedeath(cha) -- test code working.
	local slot = 4
	local item = GetChaItem(cha, 2, (slot-1))
	local item_mxenergy = GetItemAttr(item, ITEMATTR_MAXENERGY)
	local itemid = GetItemID(item)
	local isFuse = GetItemAttr(item, ITEMATTR_VAL_FUSIONID)
	--for i = 1, 200 do
		--print(i..' '..GetItemAttr(item, i))
	--end
	if isFuse ~= 0 then
		itemid = GetItemAttr(item, ITEMATTR_VAL_FUSIONID)
	end
	local energy = 5000 -- 9000 (gold)
	if item_mxenergy ~= energy then
		local attr, boost;
		if itemid == 2817 then -- champion
			attr = ITEMATTR_VAL_STR
			boost = GetItemAttr(item, attr)
		end
		if itemid == 2820 then -- crusader
			attr = ITEMATTR_VAL_STR
			boost = GetItemAttr(item, attr)
		end
		if itemid == 2823 then -- sharpshooter
			attr = ITEMATTR_VAL_DEX
			boost = GetItemAttr(item, attr)
		end
		if itemid == 2826 then -- voyager
			attr = ITEMATTR_VAL_STA
			boost = GetItemAttr(item, attr)
		end
		if itemid == 2829 then
			attr = ITEMATTR_VAL_STA
			boost = GetItemAttr(item, attr)
		end
		if itemid == 2832 then
			attr = ITEMATTR_VAL_CON
			boost = GetItemAttr(item, attr)
		end
		if attr ~= nil and boost ~= nil then
			boost = boost + 10
			SetItemAttr(item, attr, boost)
			SetItemAttr(item, ITEMATTR_MAXENERGY, energy)
			SetItemPrefix(item, 62)
			PlayEffect(cha, 345)
			SynChaKitbag(cha, 13)
			-- TESTS:
			--SetItemAttr(item, 183, 5)
			--SynChaKitbag(cha, 13)
			return true
		end
		return false
	else
		return false
	end
end -- &lua upgradedeath(GetPlayerByName('Sharpie'))

function awakeneq(cha)
	local slot = 4
	local item = GetChaItem(cha, 2, (slot-1))
	local itemtype = GetItemType(item)
	if item == nil then
		BickerNotice(cha, 'There are no equipments inserted in slot '..slot..'!')
		return false
	end
	if not IsItemEquipment(item) then
		BickerNotice(cha, '['..GetItemName(GetItemID(item))..'] is not an equipment!')
		return false
	end
	local item_mxenergy = GetItemAttr(item, ITEMATTR_MAXENERGY)
	if item_mxenergy ~= 0 then
		BickerNotice(cha, '['..GetItemName(GetItemID(item))..'] is not an awakenable item!')
		return false
	end
	if awake[itemtype] == nil then
		BickerNotice(cha, 'This equipment type cannot be awakened!')
		return false
	end
	if awake[itemtype] ~= nil then
		local getLv = GetItemAttr(item, 55);
		if getLv < 10 then
			local radstat = math.random(1, table.getn(awake[itemtype]))
			local radperc = math.random(1, 50)
			local statamt
			if awake[itemtype][radstat] == ITEMATTR_COE_DEF then
				if     radperc > 00 and radperc <= 25 then statamt = 05
				elseif radperc > 25 and radperc <= 35 then statamt = 10
				elseif radperc > 35 and radperc <= 40 then statamt = 20
				elseif radperc > 40 and radperc <= 44 then statamt = 20
				elseif radperc > 44 and radperc <= 47 then statamt = 25
				elseif radperc > 47 and radperc <= 49 then statamt = 30
				elseif radperc > 49 and radperc <= 50 then statamt = 50
				end
			end
			if awake[itemtype][radstat] == ITEMATTR_VAL_STR or awake[itemtype][radstat] == ITEMATTR_VAL_AGI 
				or awake[itemtype][radstat] == ITEMATTR_VAL_DEX or awake[itemtype][radstat] == ITEMATTR_VAL_CON 
					or awake[itemtype][radstat] == ITEMATTR_VAL_STA then
				if     radperc > 00 and radperc <= 25 then statamt = 01
				elseif radperc > 25 and radperc <= 35 then statamt = 02
				elseif radperc > 35 and radperc <= 40 then statamt = 03
				elseif radperc > 40 and radperc <= 44 then statamt = 04
				elseif radperc > 44 and radperc <= 47 then statamt = 05
				elseif radperc > 47 and radperc <= 49 then statamt = 06
				elseif radperc > 49 and radperc <= 50 then statamt = 07
				end
			end
			if awake[itemtype][radstat] == ITEMATTR_VAL_PDEF then
				if     radperc > 00 and radperc <= 30 then statamt = 01
				elseif radperc > 30 and radperc <= 40 then statamt = 01
				elseif radperc > 40 and radperc <= 45 then statamt = 02
				elseif radperc > 45 and radperc <= 49 then statamt = 02
				elseif radperc > 49 and radperc <= 50 then statamt = 03
				end
			end
			if awake[itemtype][radstat] == ITEMATTR_VAL_DEF or awake[itemtype][radstat] == ITEMATTR_VAL_HIT
				or awake[itemtype][radstat] == ITEMATTR_VAL_FLEE or awake[itemtype][radstat] == ITEMATTR_VAL_CRT then
				if     radperc > 00 and radperc <= 30 then statamt = 02
				elseif radperc > 30 and radperc <= 40 then statamt = 04
				elseif radperc > 40 and radperc <= 45 then statamt = 06
				elseif radperc > 45 and radperc <= 49 then statamt = 08
				elseif radperc > 49 and radperc <= 50 then statamt = 10
				end
			end
			if awake[itemtype][radstat] == ITEMATTR_VAL_MSPD or awake[itemtype][radstat] == ITEMATTR_VAL_ASPD then
				if     radperc > 00 and radperc <= 30 then statamt = 05
				elseif radperc > 30 and radperc <= 40 then statamt = 10
				elseif radperc > 40 and radperc <= 45 then statamt = 15
				elseif radperc > 45 and radperc <= 49 then statamt = 20
				elseif radperc > 49 and radperc <= 50 then statamt = 25
				end
			end
			if awake[itemtype][radstat] == ITEMATTR_VAL_MXHP or awake[itemtype][radstat] == ITEMATTR_VAL_MXSP then
				if     radperc > 00 and radperc <= 30 then statamt = 30
				elseif radperc > 30 and radperc <= 40 then statamt = 40
				elseif radperc > 40 and radperc <= 45 then statamt = 50
				elseif radperc > 45 and radperc <= 49 then statamt = 60
				elseif radperc > 49 and radperc <= 50 then statamt = 70
				end
			end
			local negorpos = math.random(1, 100)
			if negorpos > 65 then
				statamt = statamt * -1
			end
			local chosenstat = GetItemAttr(item, awake[itemtype][radstat])
			chosenstat = chosenstat + statamt
			SetItemAttr(item, awake[itemtype][radstat], chosenstat)
			getLv = getLv + 1
			SetItemAttr(item, 55, getLv)
			if statamt >= 0 then
				PlayEffect(cha, 345)
				Notice('+'..statamt..' '..GetStatName(awake[itemtype][radstat]))
			else
				PlayEffect(cha, 346)
				Notice(statamt..' '..GetStatName(awake[itemtype][radstat]))
			end
			SynChaKitbag(cha, 13)
			return true
		else
			BickerNotice(cha, 'Failed. ['..GetItemName(GetItemID(item))..'] already maxed awakened!')
			return false
		end
	end
end -- &lua awakeneq(GetPlayerByName('Sharpie'))
-- IGS: scroll of reversion

-- ====================================================================
-- Furnace of Immortality functions
-- ====================================================================
function can_tichun_item(...)
	local arg = {...}
	if #arg ~= 10 and #arg ~= 14 then
		SystemNotice(arg[1], "Parameter value illegal."..#arg)
		return 0
	end
	local Check = 0
	Check = can_tichun_item_main(arg)
	if Check == 1 then
		return 1
	else
		return 0
	end
end

function can_tichun_item_main(Table)
	local Player = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local ItemBag_Now = 0
	local ItemCount_Now = 0
	local ItemBagCount_Num = 0
	Player, ItemBag, ItemCount, ItemBagCount, ItemBag_Now, ItemCount_Now, ItemBagCount_Num = Read_Table(Table)
	if ItemCount[0] ~= 1 or ItemCount[1] ~= 1 or ItemBagCount[0] ~= 1 or ItemBagCount[1] ~= 1 then
		SystemNotice(Player,"Equipment quantity illegal.")
		return 0
	end
	local ItemMain = GetChaItem(Player, 2, ItemBag[0])
	local ItemCatalyst = GetChaItem(Player, 2, ItemBag[1])
	local ItemType_mainitem = GetItemType(ItemMain)
	local ItemType_otheritem = GetItemType(ItemCatalyst)
	local ItemMainID = GetItemID(ItemMain)
	local ItemCatalystID = GetItemID(ItemCatalyst)
	local ItemMainID_Lv = GetItemLv(ItemMain)
	local ItemCatalystID_Lv = GetItemLv(ItemCatalyst)
	local MainID = ItemMainID
	local CatalystID = ItemCatalystID
	if MainID > 5000 then
		MainID = GetItemAttr(ItemMain, ITEMATTR_VAL_FUSIONID)
	end
	local Check = 0
	for i = 1, table.getn(Upgrade), 1 do
		if MainID == Upgrade[i].ID then
			if CatalystID == Upgrade[i].Catalyst then
				Check = 1
			end
		end
	end
	-- CUSTOMS:
	if Check == 0 and unsealup ~= nil then
		if unsealup[MainID] ~= nil then
			if unsealup[MainID][CatalystID] ~= nil then
				Check = 1
				-- check the dura here
				if GetItemAttr(ItemMain, ITEMATTR_MAXENERGY) >= MAXENERGY_AWAKEN then
					Check = 0
				end
			end
		end
	end -- END CUSTOMS
	if Check == 0 then
		SystemNotice(Player, "Please use the correct equipment and upgrade stone.")
		return 0
	end
	if gettichun_money_main(Table) > GetChaAttr(Player, ATTR_GD) then
		SystemNotice(Player, "Insufficient Gold, unable to upgrade equipment.")
		return 0
	end
	return 1
end

function begin_tichun_item(...)
	local arg = {...}
	local Check_Cantichun = 0
	Check_Cantichun = can_tichun_item_main(arg)
	if Check_Cantichun == 0 then
		return 0
	end
	local Player = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0
	Player, ItemBag, ItemCount, ItemBagCount, ItemBag_Num, ItemCount_Num, ItemBagCount_Num = Read_Table(arg)
	local ItemMain = GetChaItem(Player, 2, ItemBag[0])
	local ItemCatalyst = GetChaItem(Player, 2, ItemBag[1])
	local Money_Need = gettichun_money_main(arg)
	TakeMoney(Player, nil, Money_Need)
	Check_TiChun_Item = tichun_item(arg)
	if Check_TiChun_Item == 0  then
		SystemNotice(Player, "Upgrade failed, please check the script.")
	end
	return 1
end

function get_item_tichun_money(...)
	local arg = {...}
	local Money = gettichun_money_main(arg)
	return Money
end

function gettichun_money_main(Table)
	local Player = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0
	Player, ItemBag, ItemCount, ItemBagCount, ItemBag_Num, ItemCount_Num, ItemBagCount_Num = Read_Table(Table)
	local ItemMain = GetChaItem(Player, 2, ItemBag[0])
	local ItemMainLv =  GetItemLv(ItemMain)
	local Money_Need = Upgrade.Money * ItemMainLv
	return Money_Need
end

function tichun_item(Table)
	local Player = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0
	local ItemID_Cuihuaji = 0
	Player, ItemBag, ItemCount, ItemBagCount, ItemBag_Num, ItemCount_Num, ItemBagCount_Num = Read_Table(Table)
	local ItemMain = GetChaItem(Player, 2, ItemBag[0])
	local ItemCatalyst = GetChaItem(Player, 2, ItemBag[1])
	local ItemType_mainitem = GetItemType(ItemMain)
	local ItemType_otheritem = GetItemType(ItemCatalyst)
	local ItemMainID = GetItemID(ItemMain)
	local ItemCatalystID = GetItemID(ItemCatalyst)
	local ItemMainID_Lv = GetItemLv(ItemMain)
	local ItemCatalystID_Lv = GetItemLv(ItemCatalyst)
	local MainID = ItemMainID
	local CatalystID = ItemCatalystID
	if MainID > 5000 then
		MainID = GetItemAttr(ItemMain, ITEMATTR_VAL_FUSIONID)
	end
	local Forge = GetItemForgeParam(ItemMain, 1)
	local r1 = 0
	local r2 = 0
	local ItemEnergy = GetItemAttr(ItemMain, ITEMATTR_ENERGY) 
	local ItemQuality = 12
	for k = 1, table.getn(Upgrade) do
		if MainID == Upgrade[k].ID and CatalystID == Upgrade[k].Catalyst then
			if ItemEnergy < 1000 then 								ItemQuality = 2
			elseif ItemEnergy >= 1000 and ItemEnergy < 2000 then 	ItemQuality = 12
			elseif ItemEnergy >= 2000 and ItemEnergy < 3000 then 	ItemQuality = 13
			elseif ItemEnergy >= 3000 and ItemEnergy < 4000 then 	ItemQuality = 14
			elseif ItemEnergy >= 4000 and ItemEnergy < 5000 then 	ItemQuality = 15
			elseif ItemEnergy >= 5000 and ItemEnergy < 6000 then 	ItemQuality = 16
			elseif ItemEnergy >= 6000 and ItemEnergy < 7000 then 	ItemQuality = 17
			elseif ItemEnergy >= 7000 and ItemEnergy < 8000 then 	ItemQuality = 18
			elseif ItemEnergy >= 8000 and ItemEnergy < 9000 then 	ItemQuality = 19
			elseif ItemEnergy >= 9000 and ItemEnergy < 10000 then 	ItemQuality = 20
			end
			MainID = Upgrade[k].Result
			r1,r2 = MakeItem(Player, MainID, 1, ItemQuality)
		end
	end
	-- SetItemAttr(item, ITEMATTR_MAXENERGY, MAXENERGY_AWAKEN)
	-- extmake.give(GetPlayerByName('Sharpie'), 0776, unsealup[0776].offensive)
	-- CUSTOMS:
	local IsAwakened = 0
	if r1 == 0 and r2 == 0 and extmake ~= nil and unsealup ~= nil then
		if unsealup[MainID] ~= nil and unsealup[MainID][CatalystID] ~= nil then
			MainID = MainID
			local attr = MAXENERGY_AWAKEN
			-- for death equipments
			for i = 2817, 2832, 3 do
				if MainID == i then
					attr = MAXENERGY_ENHANC
					break
				end
			end
			--Notice(attr)
			r1, r2 = extmake.give(Player, MainID, unsealup[MainID][CatalystID], attr)
			IsAwakened = 1
		end
	end -- END CUSTOM
	local RemMain = 0
	local RemCata = 0
	RemMain = RemoveChaItem(Player, ItemMainID, 1, 2, ItemBag[0], 2, 1, 1)
	RemCata = RemoveChaItem(Player, ItemCatalystID, 1, 2, ItemBag[1], 2, 1, 1)
	if RemMain == 0 or RemCata == 0 then
		SystemNotice(Player, "Remove item failed.")
		return
	end
	local NewItem = GetChaItem(Player, 2, r2)
	local CheckForge = SetItemForgeParam(NewItem, 1, Forge)
	if CheckForge == 0 then
		SystemNotice(Player, "Fail to set forging attribute settings.")
		return
	end
	-- CUSTOM:
	if IsAwakened == 1 then
		local awakeType,awakeName
		local cataName = tostring(GetItemName(CatalystID))
		if string.find(cataName, ' ATK ') then 		awakeType,awakeName = ATR_PREFIX,'Offensive' end
		if string.find(cataName, ' DEF ') then 		awakeType,awakeName = DEF_PREFIX,'Defensive' end
		if string.find(cataName, ' Enhanced ') then awakeType,awakeName = ENH_PREFIX,'Enhanced' end
		if awakeType ~= nil and awakeName ~= nil then
			SetItemPrefix(NewItem, awakeType)
			Notice("Congratulations, "..GetChaDefaultName(Player).." awakened ["..GetItemName(ItemMainID).."] to "..awakeName.." mode!")
		end
	else -- END CUSTOM
		Notice("Congratulations, "..GetChaDefaultName(Player).." upgraded "..GetItemName(ItemMainID).." with "..GetItemName(ItemCatalystID).." and obtained "..GetItemName(MainID)..".")
	end
	--&updpkoLG("EquipmentUpgrade", "player ["..GetChaDefaultName(Player).."], Equipment: ["..GetItemName(ItemMainID).."], Catalyst: ["..GetItemName(ItemCatalystID).."], Result: ["..GetItemName(MainID).."]")
	SynChaKitbag(Player, 13)
end