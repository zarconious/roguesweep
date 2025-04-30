
if(current_event == "battle")
{
	current_round += 1;
	current_event = "shop";
}
else current_event = "battle";

resets = max_resets;

with(objEnemy) instance_destroy();
with(objCombat) event_user(0);