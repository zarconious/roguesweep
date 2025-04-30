function next_turn(){
	objRun.current_turn++;
	with(objCombat) {
		enemy_turn = 0;
		player_turn = false;
		alarm[0] = step_interval;
	}
}

function kill_enemy(_id){
	with(objCombat)
	{
		var pos = 0;
		var enemies = array_length(enemy_list_id);
		for(var i = 0; i < enemies; i++)
		{
			if(enemy_list_id[i] == _id)
			pos = i;
		}
	
		array_delete(enemy_list_id,pos,1);
	
		if(array_length(enemy_list_id) > 0)
		selected_enemy = pos-1 < 0 ? enemy_list_id[enemies-2] : enemy_list_id[pos-1];
		else
		{
			// End battle
			selected_enemy = -1;
			with(objRun) event_user(0);
		}
	}	
}