
reset_board();

objRun.current_turn = 0;

switch(objRun.current_round)
{
	case 1: 	enemy_list_tag = [ENEMIES.RAT]; 
				break;
	case 2: 	enemy_list_tag = [ENEMIES.BAT,ENEMIES.BAT]; 
				break;
	case 3: 	enemy_list_tag = [ENEMIES.BAT, ENEMIES.RAT,ENEMIES.BAT];
				break;
	case 4: 	enemy_list_tag = [ENEMIES.RAT, ENEMIES.SHARK, ENEMIES.RAT];
				break;
	case 5: 	enemy_list_tag = [ENEMIES.SHARK,ENEMIES.SHARK];
				break;
	case 6: 	enemy_list_tag = [ENEMIES.PENGUIN, ENEMIES.DRAGON, ENEMIES.PENGUIN];
				break;
	case 7: 	enemy_list_tag = [ENEMIES.PENGUIN, ENEMIES.DRAGON, ENEMIES.PENGUIN];
				break;
	case 8: 	enemy_list_tag = [ENEMIES.PENGUIN, ENEMIES.DRAGON, ENEMIES.PENGUIN];
				break;
	case 9: 	enemy_list_tag = [ENEMIES.PENGUIN, ENEMIES.DRAGON, ENEMIES.PENGUIN];
				break;
	case 10: 	enemy_list_tag = [ENEMIES.PENGUIN, ENEMIES.DRAGON, ENEMIES.PENGUIN];
				break;
	default: 	enemy_list_tag = [ENEMIES.RAT]; break;
}

enemy_count = array_length(enemy_list_tag);

for(var i = 0; i < enemy_count; i++)
{
	enemy_list_id[i] = instance_create_depth(enemyArea.x + enemyArea.width/2 - floor(space*enemy_count/2) + space*i+space/2,enemyArea.y + enemyArea.height/2 + space/4,0,objEnemy,
	{
		sprite_index: all_enemies[enemy_list_tag[i]].sprite,
		description: all_enemies[enemy_list_tag[i]].description,
		turns: all_enemies[enemy_list_tag[i]].turns,
		mine: all_enemies[enemy_list_tag[i]].mine,
		max_hp: all_enemies[enemy_list_tag[i]].hp,
		count: all_enemies[enemy_list_tag[i]].count,
	});
}
 selected_enemy = enemy_list_id[0];

alarm[0] = step_interval;