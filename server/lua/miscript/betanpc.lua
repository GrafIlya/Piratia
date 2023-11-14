print('Loading betanpc.lua')

-- Captain
function btalk_beta01()
	Talk(1, 'Captain Hook: Along side me are my fellow colleagues ready to assist you in your adventure in the beta phase of Corsairs Online.')
	Text(1, 'Leave...', CloseTalk)
end

-- Fairy merchant - Sparrow
function btalk_beta02()
	Talk(1, 'Sparrow: Fairies, fairies everywhere!')
	Text(1, 'Buy', BuyPage)
	Text(1, 'Leave...', CloseTalk)
	-- misc
	Other(	0262	) -- fairy box
	Other(	0227	) -- ration
	Other(	2312	) -- auto ration
	Other(	0578	) -- fruit growth
	-- fairy fruits
	Other(	0222	)
	Other(	0276	)
	Other(	0223	)
	Other(	0277	)
	Other(	0224	)
	Other(	0278	)
	Other(	0225	)
	Other(	0279	)
	Other(	0226	)
	Other(	0280	)
	-- fairy skills
	Other(	243	) -- protect
	Other(	244	)
	Other(	246	) -- berserk
	Other(	247	)
	Other(	249	) -- magic
	Other(	250	)
	Other(	252	) -- recover
	Other(	253	)
	Other(	259	) -- medi
	Other(	260	)
	-- marriage
	Other(3920)
	Other(3924)
	Other(3922)
	Other(3919)
	Other(3921)
	Other(3925)
	Other(3918)

	Other(3086)
	Other(3087)
end

-- Blacksmith - Turner
function btalk_beta03()
	Talk(1, 'Turner: Awakening is a process of sharpening your equipments even further... exclusive to Beta phase.')
	Text(1, 'Buy', BuyPage)
	Text(1, 'Leave...', CloseTalk)

	InitTrade()
	Weapon(	0767	)
	Weapon(	0774	)
	Weapon(	0764	)
	Weapon(	0771	)
	Weapon(	0804	)
	Weapon(	0800	)
	Weapon(	0790	)
	Weapon(	0793	)
	Weapon(	0796	)
	Weapon(	0786	)
	Weapon(	0778	)
	Weapon(	0782	)
	Weapon(	0768	)-- 55:crus
	Weapon(	0807	)
	Weapon(	0808	)
	Weapon(	0775	)
	Weapon(	0805	)-- voyager
	Weapon(	0815	)
	Weapon(	0877	)
	Weapon(	0801	)
	Weapon(	0797	)-- Sealmaster
	Weapon(	0811	)
	Weapon(	0813	)
	Weapon(	0794	)
	Weapon(	0791	)-- Cleric
	Weapon(	0812	)
	Weapon(	0814	)
	Weapon(	0787	)
	Weapon(	0779	)-- Sharpshooter
	Weapon(	0809	)
	Weapon(	0810	)
	Weapon(	0783	)
	Weapon(	0765	)  -- champ
	--Weapon(	3575	)
	--Weapon(	3576	)
	Weapon(	0772	)
	Weapon(	9160	)

	for i = 10150, 10221 do
		Defence(i)
	end
end

function btalk_beta04()
	Talk ( 1, "Sue: Tickets to all over the places are sold here. How may i help you?" )
	Text ( 1, "Ticket Shop", BuyPage)

	InitTrade()
	Other(	4602	)--Argent City
	Other(	4603	)--
	Other(	4604	)--
	Other(	3141	)--Old Ticket
	Other(	3048	)--Pass to Thundoria Castle
	Other(	3049	)--Pass to Thundoria Harbor
	Other(	3076	)--Pass to Spring Town
	--Other(	6205	)--Pass to Winter Isle?
	Other(	0563	)--Pass to Summer
	Other(	0583	)--Pass to Autumn
	Other(	3050	)--Pass to Sacred Snow Mountain
	--Other(	10029	)--Pass to Abandon Mine Haven
	Other(	3051	)--Pass to Andes Forest Haven
	Other(	3052	)--Pass to Oasis Haven
	Other(	3053	)--Pass to Icespire Haven
	Other(	3073	)--Pass to Abandon Mine 1
	Other(	3056	)--Pass to Abandoned Mine 2
	Other(	3057	)--Pass to Silver Mine 2
	Other(	3058	)--Pass to Silver Mine 3
	Other(	3055	)--Pass to Barren Cavern
	--Other(	3054	)--Pass to Lone Tower 1
	--Other(	3059	)--Pass to Lone Tower 2
	--Other(	3060	)--Pass to Lone Tower 3
	--Other(	3070	)--Pass to Lone Tower 4
	--Other(	3071	)--Pass to Lone Tower 5
	--Other(	3072	)--Pass to Lone Tower 6
	--Other(	2445	)--Caribbean Tour Ticket
	--Other(	2491	)--Pass to Naval Base
	--Other(	2447	)--Pass to Skeletar Isle?
	--Other(	10027	)--PK Map
	-- Other(	7072	)-- Heaven
	--Other(	10028	)
	--Other(	7078	) -- LA
	--Other(	7079	) -- DA
end

-- Accessories - Elizabeth
function btalk_beta05()
	Talk(1, 'Elizabeth: Ladies do love a man who can give them shiny things...')
	Text(1, 'Buy', BuyPage)
	Text(1, 'Leave...', CloseTalk)

	InitTrade()
	-- necks
	Weapon(	739	)
	Weapon(	461	)
	Weapon(	462	)
	Weapon(	463	)
	-- rings
	Weapon(	324	) -- str
	Weapon(	334	)
	Weapon(	327	) -- agi
	Weapon(	346	)
	Weapon(	328	) -- acc
	Weapon(	347	)
	Weapon(	329	) -- con
	Weapon(	348	)
	Weapon(	330	) -- spr
	Weapon(	349	)
	Weapon()
	Weapon()
	local c = 0
	for i = 7294, 7311 do
		Weapon(i)
		c = c + 1
		if c == 3 then
			Weapon()
			c = 0
		end
	end
end

function btalk_beta06()
	Talk( 1, "Barbarossa: Arrrrrrrr the things u find at sea..." )
	Text( 1, "Let me see", BuyPage )

	InitTrade()
	Weapon(	453	)
	Weapon(	454	)
	Weapon(	455	)
	Weapon(	456	)
	Weapon(	3074	)
	Weapon(	3075	)
	Weapon(	891	)
	Weapon(	890	)
	Weapon(	1020	)
	--normal gems
	Weapon(	0885	)
	Weapon(	0878	)
	Weapon(	0879	)
	Weapon(	0880	)
	Weapon(	0881	)
	Weapon(	0882	)
	Weapon(	0883	)
	Weapon(	0884	)
	Weapon(	0887	)

	Defence(	3109	)
	Defence(	3110	)
	Defence(	3111	) 
	Defence(	3112	)
	Defence(	3113	)
	Defence(	3047	)
	Defence(	3098	)
	Defence(	3099	)
	Defence(	3342	)
	--Defence(	850	)
	Defence(	3105	)
	-- amps
	for i = 3094,3097 do
		Defence(i)
	end
	-- nana
	Defence(0849)
	Defence(	2816	)
	Defence(	5939	)
	Defence(	15006	)

	Other(	3088	)
	Other(	3089	)
	Other(	3090	)
	Other(	3091	)
	Other(	3092	)
	Other(	3093	)
	Other(	3908	)
	Other(	207	)
	Other(	208	)
	Other(	3462	)
	Other(	3463	)
	Other(	3300	)
	Other(	3301	)
	Other(	2625	)
	Other(	2630	)
	Other(	2634	)
	Other(	2635	)
	Other(	2636	)
	Other(	2637	)
	Other(	2638	)
end

function btalk_beta07()
	Talk( 1, "Lance: Welcome to the Apparel Shop. I am the owner - Lance." )
	Text( 1, "Trade Apparel", BuyPage )

	InitTrade()
	Other(	5118	)
	Other(	5119	)
	Other(	5120	)
	Other(	5121	)
	Other(	5122	)
	Other(	5123	)
	Other(	5124	)
	Other(	5125	)
	Other(	5126	)
	Other(	5127	)
	Other(	5128	)
	Other(	5129	)
	Other(	5154	)
	Other(	5155	)
	Other(	5156	)
	Other(	5157	)
	Other(	5158	)
	Other(	5159	)
	Other(	5160	)
	Other(	5161	)
	Other(	5162	)
	Other(	5205	)
	Other(	5206	)
	Other(	5207	)
	Other(	5221	)
	Other(	5222	)
	Other(	5223	)
	Other(	5224	)
	Other(	5225	)
	Other(	5226	)
	Other(	5227	)
	Other(	5228	)
	Other(	5229	)
	Other(	5315	)
	Other(	5316	)
	Other(	5317	)
	Other(	5318	)
	Other(	5341	)
	Other(	5342	)
	Other(	5343	)
	Other(	5356	)
	Other(	5357	)
	Other(	5358	)
	Other(	5359	)
	Other(	5661	)
	Other(	5662	)
	Other(	5663	)
	Other(	5664	)
	Other(	5677	)
	Other(	5678	)
	Other(	5679	)
	Other(	5680	)
	Other(	5041	)--Cata
	Other(	5045	)
	Other(	5049	)
	Other(	5537	)
	Other(	5538	)
	Other(	5539	)
	Other(	5540	)
	Other(	5553	)
	Other(	5554	)
	Other(	5555	)
	Other(	5556	)
	Other(	5569	)
	Other(	5570	)
	Other(	5571	)
	Other(	5572	)
	Other(	5578	)
	Other(	5579	)
	Other(	5580	)
	Other(	5577	)
	Other(	5593	)
	Other(	5594	)
	Other(	5595	)
	Other(	5596	)
end

function btalk_beta08()
	Talk( 1, "Carsise: Welcome to the Apparel Shop of Icicle City. I am the owner Carsise." )
	Text( 1, "Trade Apparel", BuyPage )

	InitTrade()
	Other(	5107	)
	Other(	5108	)
	Other(	5109	)
	Other(	5110	)
	Other(	5111	)
	Other(	5112	)
	Other(	5113	)
	Other(	5114	)
	Other(	5115	)
	Other(	5116	)
	Other(	5117	)
	Other(	5163	)
	Other(	5164	)
	Other(	5165	)
	Other(	5195	)
	Other(	5196	)
	Other(	5197	)
	Other(	5230	)
	Other(	5231	)
	Other(	5232	)
	Other(	5233	)
	Other(	5234	)
	Other(	5235	)
	Other(	5236	)
	Other(	5237	)
	Other(	5238	)
	Other(	5239	)
	Other(	5240	)
	Other(	5291	)
	Other(	5292	)
	Other(	5293	)
	Other(	5294	)
	Other(	5319	)
	Other(	5320	)
	Other(	5321	)
	Other(	5322	)
	Other(	5681	)
	Other(	5682	)
	Other(	5683	)
	Other(	5684	)
	Other(	5665	)
	Other(	5666	)
	Other(	5667	)
	Other(	5668	)
	Other(	5042	)--Cata
	Other(	5046	)
	Other(	5050	)
	Other(	5541	)
	Other(	5542	)
	Other(	5543	)
	Other(	5544	)
	Other(	5557	)
	Other(	5558	)
	Other(	5559	)
	Other(	5560	)
	Other(	5573	)
	Other(	5574	)
	Other(	5575	)
	Other(	5576	)
	Other(	5581	)
	Other(	5582	)
	Other(	5583	)
	Other(	5584	)
	Other(	5597	)
	Other(	5598	)
	Other(	5599	)
	Other(	5600	)
end 

function btalk_beta09()
	Talk( 1, "Phyllis: Welcome to the Apparel Shop of Icicle City. I am the owner Phyllis." )
	Text( 1, "Trade Apparel", BuyPage )

	InitTrade()
	Other(	5142	)
	Other(	5143	)
	Other(	5144	)
	Other(	5145	)
	Other(	5146	)
	Other(	5147	)
	Other(	5148	)
	Other(	5149	)
	Other(	5150	)
	Other(	5151	)
	Other(	5152	)
	Other(	5153	)
	Other(	5166	)
	Other(	5167	)
	Other(	5168	)
	Other(	5169	)
	Other(	5170	)
	Other(	5171	)
	Other(	5202	)
	Other(	5203	)
	Other(	5204	)
	Other(	5241	)
	Other(	5242	)
	Other(	5243	)
	Other(	5244	)
	Other(	5245	)
	Other(	5246	)
	Other(	5247	)
	Other(	5248	)
	Other(	5249	)
	Other(	5250	)
	Other(	5251	)
	Other(	5295	)
	Other(	5296	)
	Other(	5297	)
	Other(	5298	)
	Other(	5323	)
	Other(	5324	)
	Other(	5325	)
	Other(	5326	)
	Other(	5669	)
	Other(	5670	)
	Other(	5671	)
	Other(	5672	)
	Other(	5685	)
	Other(	5686	)
	Other(	5687	)
	Other(	5688	)
	Other(	5043	)--Cata
	Other(	5047	)
	Other(	5051	)
	Other(	5545	)
	Other(	5546	)
	Other(	5547	)
	Other(	5548	)
	Other(	5561	)
	Other(	5562	)
	Other(	5563	)
	Other(	5564	)
	Other(	5585	)
	Other(	5586	)
	Other(	5587	)
	Other(	5588	)
	Other(	5601	)
	Other(	5602	)
	Other(	5603	)
	Other(	5604	)
end

function btalk_beta10()
	Talk( 1, "Ami: Welcome to the Apparel Shop of Icicle City. I am the owner Ami." )
	Text( 1, "Trade Appereals", BuyPage )

	InitTrade()
	Other(	5130	)
	Other(	5131	)
	Other(	5132	)
	Other(	5133	)
	Other(	5134	)
	Other(	5135	)
	Other(	5136	)
	Other(	5137	)
	Other(	5138	)
	Other(	5139	)
	Other(	5140	)
	Other(	5141	)
	Other(	5175	)
	Other(	5176	)
	Other(	5177	)
	Other(	5178	)
	Other(	5179	)
	Other(	5180	)
	Other(	5181	)
	Other(	5182	)
	Other(	5183	)
	Other(	5184	)
	Other(	5185	)
	Other(	5186	)
	Other(	5187	)
	Other(	5188	)
	Other(	5189	)
	Other(	5190	)
	Other(	5191	)
	Other(	5192	)
	Other(	5193	)
	Other(	5194	)
	Other(	5198	)
	Other(	5199	)
	Other(	5200	)
	Other(	5201	)
	Other(	5252	)
	Other(	5253	)
	Other(	5254	)
	Other(	5255	)
	Other(	5256	)
	Other(	5257	)
	Other(	5258	)
	Other(	5259	)
	Other(	5260	)
	Other(	5261	)
	Other(	5262	)
	Other(	5263	)
	Other(	5299	)
	Other(	5300	)
	Other(	5301	)
	Other(	5302	)
	Other(	5327	)
	Other(	5328	)
	Other(	5329	)
	Other(	5330	)
	Other(	5673	)
	Other(	5674	)
	Other(	5675	)
	Other(	5676	)
	Other(	5689	)
	Other(	5690	)
	Other(	5691	)
	Other(	5692	)
	Other(	5056	)--Crown Cata
	Other(	5044	)--Cata Armor
	Other(	5048	)
	Other(	5052	)
	Other(	5549	)
	Other(	5550	)
	Other(	5551	)
	Other(	5552	)
	Other(	5565	)
	Other(	5566	)
	Other(	5567	)
	Other(	5568	)
	Other(	5589	)
	Other(	5590	)
	Other(	5591	)
	Other(	5592	)
	Other(	5605	)
	Other(	5606	)
	Other(	5607	)
	Other(	5608	)
end

function btalk_beta11()
	Talk( 1, "Foxy: Hi! I am Apparel Tailor, Foxy. Take a look at my apparels, and remember to check all 3 tabs!" )
	Text( 1, "Trade Apparel", BuyPage )

	InitTrade()
	Other(	5001	)
	Other(	5002	)
	Other(	5007	)
	Other(	5008	)
	Other(	5003	)
	Other(	5009	)
	Other(	5004	)
	Other(	5010	)
	Other(	5005	)
	Other(	5011	)
	Other(	5279	)
	Other(	5286	)
	Other(	5006	)
	Other(	5012	)
	Other(	5283	)
	Other(	5284	)
	Other(	5280	)
	Other(	0141	)--Ebony Dragon Wings
	Other(	0906	)--Devil Wings
	Other(	0937	)--Angelic Wings
	Other(	0142	)--Rainbow Wings
	Other(	0905	)--Dragon Wings
	Other(	0904	)--Vampiric Wings
	Other(	0935	)--Elven Wings
	Other(	0936	)--Butterfly Wings
	Other(	15000	)
end

function r_talkJOB ()
		local npcName = 'Tang'
		Talk( 10, npcName..": You do not meet the requirements for Job advancement!" )
		Text( 10, "Close Talk...", CloseTalk )
----------------------
		Talk( 2, npcName..": Welcome Lance, what class do you want to become?" )
		Text( 2, "Swordsman", JumpPage, 6 )
		Text( 2, "Explorer", JumpPage, 9 )
		Text( 2, "Hunter", JumpPage, 7 )
--		Text( 2, "Herbalist", JumpPage, 8 )
		Text( 2, "Nevermind", CloseTalk )
----------------------
		Talk( 3, npcName..": Welcome Carsise, what class do you want to become?" )
		Text( 3, "Swordsman", JumpPage, 6 )
--		Text( 3, "Explorer", JumpPage, 9 )
--		Text( 3, "Herbalist", JumpPage, 8 )
		Text( 3, "Nevermind", CloseTalk )
----------------------
		Talk( 4, npcName..": Welcome Phyllis, what class do you want to become?" )
		Text( 4, "Swordsman", JumpPage, 6 )
		Text( 4, "Explorer", JumpPage, 9 )
		Text( 4, "Hunter", JumpPage, 7 )
		Text( 4, "Herbalist", JumpPage, 8 )
		Text( 4, "Nevermind", CloseTalk )
----------------------
		Talk( 5, npcName..": Welcome Ami, what class do you want to become?" )
		Text( 5, "Explorer", JumpPage, 9 )
		Text( 5, "Herbalist", JumpPage, 8 )
		Text( 5, "Nevermind", CloseTalk )
----------------------
		Talk( 6, npcName..": Are you sure you want to become a Swordsman?" )
		InitTrigger()
		TriggerAction( 1, SetProfession, 1 )--swordsman
		Text( 6, "Yes", MultiTrigger, GetMultiTrigger(), 1 )
		Text( 6, "Nevermind", CloseTalk )
----------------------
		Talk( 7, npcName..": Are you sure you want to become a Hunter?" )
		InitTrigger()
		TriggerAction( 1, SetProfession, 2 )--hunter
		Text( 7, "Yes", MultiTrigger, GetMultiTrigger(), 1 )
		Text( 7, "Nevermind", CloseTalk )
----------------------
		Talk( 8, npcName..": Are you sure you want to become a Herbalist?" )
		InitTrigger()
		TriggerAction( 1, SetProfession, 5 )--herbalist
		Text( 8, "Yes", MultiTrigger, GetMultiTrigger(), 1 )
		Text( 8, "Nevermind", CloseTalk )
----------------------
		Talk( 9, npcName..": Are you sure you want to become a Explorer?" )
		InitTrigger()
		TriggerAction( 1, SetProfession, 4 )--explorer
		Text( 9, "Yes", MultiTrigger, GetMultiTrigger(), 1 )
		Text( 9, "Nevermind", CloseTalk )
----------------------
		Talk( 11, npcName..": Welcome Swordsman, Here for your class advancement?" )
		InitTrigger()
		TriggerCondition( 1, IsCategory, 1 )--lance
		TriggerAction( 1, SetProfession, 9 )--crusader
		TriggerCondition( 2, IsCategory, 2 )--carsise
		TriggerAction( 2, SetProfession, 8 )--champion
		TriggerCondition( 3, IsCategory, 3 )--phyllis
		TriggerAction( 3, SetProfession, 9 )--crusader
		Text( 11, "Yes", MultiTrigger, GetMultiTrigger(), 3 )
		Text( 11, "Nevermind", CloseTalk )
----------------------
		Talk( 12, npcName..": Welcome Hunter, Here for your class advancement?" )
		InitTrigger()
		TriggerAction( 1, SetProfession, 12 )--sharpshooter
		Text( 12, "SharpShooter", MultiTrigger, GetMultiTrigger(), 1 )
		Text( 12, "Nevermind", CloseTalk )
----------------------
		Talk( 13, npcName..": Welcome Herbalist, which class do you want to become?" )
		Text( 13, "Seal Master", JumpPage, 14 )
		Text( 13, "Cleric", JumpPage, 15 )
		Text( 13, "Nevermind", CloseTalk )
----------------------
		Talk( 14, npcName..": Welcome Herbalist, Here for your Seal Master advancement?" )
		InitTrigger()
		TriggerAction( 1, SetProfession, 14 )--seal master
		Text( 14, "Yes", MultiTrigger, GetMultiTrigger(), 1 )
		Text( 14, "Nevermind", CloseTalk )
----------------------
		Talk( 15, npcName..": Welcome Herbalist, Here for your Cleric advancement?" )
		InitTrigger()
		TriggerAction( 1, SetProfession, 13 )--cleric
		Text( 15, "Yes", MultiTrigger, GetMultiTrigger(), 1 )
		Text( 15, "Nevermind", CloseTalk )
----------------------
		Talk( 16, npcName..": Welcome Explorer, Here for your class advancement?" )
		InitTrigger()
		TriggerAction( 1, SetProfession, 16 )--voyager
		Text( 16, "Yes", MultiTrigger, GetMultiTrigger(), 1 )
		Text( 16, "Nevermind", CloseTalk )
----------------------
		InitTrigger()

		TriggerCondition( 1, PfEqual, 0 )--newbie
		TriggerCondition( 1, IsCategory, 1 )--lance
		TriggerCondition( 1, LvCheck, ">", 9 )
		TriggerAction( 1, JumpPage, 2 )

		TriggerCondition( 2, PfEqual, 0 )--newbie
		TriggerCondition( 2, IsCategory, 2 )--carsise
		TriggerCondition( 2, LvCheck, ">", 9 )
		TriggerAction( 2, JumpPage, 3 )

		TriggerCondition( 3, PfEqual, 0 )--newbie
		TriggerCondition( 3, IsCategory, 3 )--phyllis
		TriggerCondition( 3, LvCheck, ">", 9 )
		TriggerAction( 3, JumpPage, 4 )

		TriggerCondition( 4, PfEqual, 0 )--newbie
		TriggerCondition( 4, IsCategory, 4 )--ami
		TriggerCondition( 4, LvCheck, ">", 9 )
		TriggerAction( 4, JumpPage, 5 )

		TriggerCondition( 5, PfEqual, 1 )--swordsman
		TriggerCondition( 5, LvCheck, ">", 39 )
		TriggerAction( 5, JumpPage, 11 )

		TriggerCondition( 6, PfEqual, 2 )--hunter
		TriggerCondition( 6, LvCheck, ">", 39 )
		TriggerAction( 6, JumpPage, 12 )

		TriggerCondition( 7, PfEqual, 4 )--explorer
		TriggerCondition( 7, LvCheck, ">", 39 )
		TriggerAction( 7, JumpPage, 16 )

		TriggerCondition( 8, PfEqual, 5 )--herbalist
		TriggerCondition( 8, LvCheck, ">", 39 )
		TriggerAction( 8, JumpPage, 13 )

		TriggerFailure( 8, JumpPage, 10 )
		Start( GetMultiTrigger(), 8 )
end