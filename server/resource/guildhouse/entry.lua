function config_entry(entry) 

end 

function after_create_entry(entry) 

end

function after_destroy_entry_guildhouse(entry)

end

function after_player_login_guildhouse(entry, player_name)

end

function after_get_map_copy_guildhouse(copy_mgr, player1, player2, type) 
   
   
end 

function check_can_enter_guildhouse( role, copy_mgr )
	return GetChaGuildID(role) > 0
end

function begin_enter_guildhouse(role, copy_mgr) 
end 