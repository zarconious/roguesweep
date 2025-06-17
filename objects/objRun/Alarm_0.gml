
if(current_event == "battle")
{
	
	background_size_goal = 0;
	
	current_round += 1;
	if(current_round == 11)
	{
		current_event = "end";
	}
	else
	current_event = "shop";
	
	
}
else current_event = "battle";

shield = 0;
str = 0;
resets = max_resets;

with(objEnemy) instance_destroy();
with(objCombat) event_user(0);