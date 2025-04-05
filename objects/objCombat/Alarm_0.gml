// Perform move
if(enemy_turn > array_length(enemy_list_id)-1)
{
	player_turn = true;
}
else
{
	with(enemy_list_id[enemy_turn])
	{
		event_user(0);
	}
	enemy_turn++;
	alarm[0] = step_interval;
}
