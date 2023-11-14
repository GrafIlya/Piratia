print( "Loading Init_Attr.lua" )

function Init_attr() 
--LG("init_attr", "enter function initattr : " , "\n" ) 
	for i = 0, ATTR_MAX_NUM, 1 do							
		SetChaAttrMax( i, 100000000) 
	end 
end 

Init_attr() 

SetChaAttrMax( ATTR_LV			,	100				)	-- Максимальный уровень
SetChaAttrMax( ATTR_HP			,	2000000000		)	-- Максимальный HP
SetChaAttrMax( ATTR_SP			,	2000000000		)	-- Максимальный SP
SetChaAttrMax( ATTR_JOB			,	100				)	-- Максимальное кол-во профессий
SetChaAttrMax( ATTR_CEXP		,	4200000000		)	-- 
SetChaAttrMax( ATTR_NLEXP		,	4200000000		)	-- 
SetChaAttrMax( ATTR_AP			,	300				)	-- 
SetChaAttrMax( ATTR_TP			,	200				)	-- 
SetChaAttrMax( ATTR_GD			,	2000000000		)	-- Максимальное кол-во золота
SetChaAttrMax( ATTR_CLEXP		,	4200000000		)	--
SetChaAttrMax( ATTR_MXHP		,	2000000000		)	--
SetChaAttrMax( ATTR_MXSP		,	2000000000		)	--
SetChaAttrMax( ATTR_BSTR		,	100				)	-- Максимальное кол-во силы         
SetChaAttrMax( ATTR_BDEX		,	100				)	-- Максимальное кол-во точности             
SetChaAttrMax( ATTR_BAGI		,	100				)	-- Максимальное кол-во ловкости             
SetChaAttrMax( ATTR_BCON		,	100				)	-- Максимальное кол-во телосложения             
SetChaAttrMax( ATTR_BSTA		,	100				)	-- Максимальное кол-во духа             
SetChaAttrMax( ATTR_BLUK		,	100				)	-- Максимальное кол-во удачи             
SetChaAttrMax( ATTR_BMXHP		,	2000000000		)	-- 
SetChaAttrMax( ATTR_BMXSP		,	2000000000		)	-- 
SetChaAttrMax( ATTR_BMNATK		,	9999			)	-- 
SetChaAttrMax( ATTR_BMXATK		,	9999			)	-- 
SetChaAttrMax( ATTR_BDEF		,	9999			)	-- 
SetChaAttrMax( ATTR_BHIT		,	9999			)	-- 
SetChaAttrMax( ATTR_BFLEE		,	9999			)	-- 
SetChaAttrMax( ATTR_BMF			,	9999			)	-- 
SetChaAttrMax( ATTR_BCRT		,	9999			)	-- 
SetChaAttrMax( ATTR_BHREC		,	9999			)	-- 
SetChaAttrMax( ATTR_BSREC		,	9999			)	-- 
SetChaAttrMax( ATTR_BASPD		,	9999			)	-- 
SetChaAttrMax( ATTR_BADIS		,	9999			)	-- 
SetChaAttrMax( ATTR_BMSPD		,	9999			)	-- 
SetChaAttrMax( ATTR_BCOL		,	9999			)	-- 
SetChaAttrMax( ATTR_MSPD		,	9999			)	--
SetChaAttrMax( ATTR_LHAND_ITEMV	,	9999			)	--
SetChaAttrMax( ATTR_BOAT_SHIP	,	100000			)	--
SetChaAttrMax( ATTR_BOAT_HEADER	,	100000			)	--
SetChaAttrMax( ATTR_BOAT_BODY	,	100000			)	--
SetChaAttrMax( ATTR_BOAT_ENGINE	,	100000			)	--
SetChaAttrMax( ATTR_BOAT_CANNON	,	100000			)	--
SetChaAttrMax( ATTR_BOAT_PART	,	100000			)	--
SetChaAttrMax( ATTR_BOAT_BERTH	,	100000			)	--
SetChaAttrMax( ATTR_BOAT_DBID	,	2000000000		)	--