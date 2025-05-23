

if(objRun.current_event == "shop")
{
	with(objRun) event_user(0);
}
else if(objRun.current_event == "battle")
{
	if(objRun.resets > 0 && !objPlayer.dead)
	{
		with(objRun) resets--;
		reset_board();
		next_turn();
	}
}