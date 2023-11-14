print('Loading skill.lua')

-- if you use lightning curtain on land mobs it mess up the map respawn causing a instant respawn problem
-- https://pkodev.net/index.php?/topic/2879-lightning-curtain-on-land/&tab=comments#comment-18355
function State_Lm_Add(role, statelv) 
	local dmg = 160 + statelv * 20 
	Endure_Dmg(role, dmg)
end 