// Created for every combat encounter

turn = 0;
space = 128;
enemy_turn = 0;
player_turn = false;

//enemy_list_tag = [ENEMIES.A1_ENEMY1,ENEMIES.A1_ENEMY1,ENEMIES.A1_ENEMY2];
found_list = [];
used_list = [];
mine_list = [];

enemy_list_tag = [];
switch(objUI.round_number)
{
	case 1: 	enemy_list_tag = [ENEMIES.A1_ENEMY1,ENEMIES.A1_ENEMY1]; 
				break;
	case 2: 	enemy_list_tag = [ENEMIES.A1_ENEMY2]; 
				break;
	case 3: 	enemy_list_tag = [ENEMIES.A1_ENEMY2, ENEMIES.A1_ENEMY1];
				break;
	default: 	enemy_list_tag = [ENEMIES.A1_ENEMY1]; break;
}

enemy_count = array_length(enemy_list_tag);

for(var i = 0; i < enemy_count; i++)
{
	enemy_list_id[i] = instance_create_depth(room_width/2-floor(space*enemy_count/2) + space*i+space/2,200,0,objEnemy,
	{
		sprite_index: all_enemies[enemy_list_tag[i]].sprite,
		description: all_enemies[enemy_list_tag[i]].description,
		turns: all_enemies[enemy_list_tag[i]].turns,
		mine: all_enemies[enemy_list_tag[i]].mine,
		max_hp: all_enemies[enemy_list_tag[i]].hp,
	});
}

selected_enemy = enemy_list_id[0];
shake = 0;

alarm[0] = step_interval;