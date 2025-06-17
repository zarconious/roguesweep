objRun.current_turn = 0;

switch(objRun.current_round)
{
	case 1: 	enemy_list_tag = [ENEMIES.RAT]; 
				break;
	case 2: 	enemy_list_tag = [ENEMIES.BAT, ENEMIES.BAT]; 
				break;
	case 3: 	enemy_list_tag = [ENEMIES.PENGUIN, ENEMIES.SHARK];
				break;
	case 4: 	enemy_list_tag = [ENEMIES.RAT, ENEMIES.OWL, ENEMIES.RAT];
				break;
	case 5: 	enemy_list_tag = [ENEMIES.BAT, ENEMIES.PENGUIN, ENEMIES.RAT];
				break;
	//case 5: 	enemy_list_tag = [ENEMIES.DOVE, ENEMIES.MONKEY, ENEMIES.BAT];
	//			break;
	//case 6: 	enemy_list_tag = [ENEMIES.SNAKE, ENEMIES.SHARK];
	//			break;
	//case 7: 	enemy_list_tag = [ENEMIES.SCORPION, ENEMIES.BAT, ENEMIES.SCORPION]; 
	//			break;
	//case 8: 	enemy_list_tag = [ENEMIES.PENGUIN, ENEMIES.RAT, ENEMIES.RAT, ENEMIES.PENGUIN]; 
	//			break;
	//case 9: 	enemy_list_tag = [ENEMIES.SCORPION, ENEMIES.BAT, ENEMIES.BAT, ENEMIES.MONKEY];
	//			break;
	//case 10: 	enemy_list_tag = [ENEMIES.PENGUIN, ENEMIES.OWL, ENEMIES.SHARK, ENEMIES.DOVE, ENEMIES.SCORPION];
	//			break;
	default: 	
		var _list = [];
		for(var i = 0; i<4; i++)
		{
			array_push(_list,choose(ENEMIES.PENGUIN, ENEMIES.BAT,ENEMIES.RAT,ENEMIES.SHARK))
		}
			enemy_list_tag = _list;
		break;
}

enemy_count = array_length(enemy_list_tag);

var _board_size = 2;

for(var i = 0; i < enemy_count; i++)
{
	enemy_list_id[i] = instance_create_depth(enemyArea.x + enemyArea.width/2 - floor(spaceX*enemy_count/2) + spaceX*i+spaceX/2,enemyArea.y + enemyArea.height/2 + spaceY,0,objEnemy,
	{
		sprite_index: all_enemies[enemy_list_tag[i]].sprite,
		description: all_enemies[enemy_list_tag[i]].description,
		turns: all_enemies[enemy_list_tag[i]].turns,
		mine: all_enemies[enemy_list_tag[i]].mine,
		max_hp: all_enemies[enemy_list_tag[i]].hp,
		count: all_enemies[enemy_list_tag[i]].count,
	});
	
	_board_size+= all_enemies[enemy_list_tag[i]].rank;
}
 selected_enemy = enemy_list_id[0];

objRun.board_size = min(6,_board_size);
objRun.background_size_goal = objRun.board_size;
	
reset_board();

alarm[0] = step_interval;