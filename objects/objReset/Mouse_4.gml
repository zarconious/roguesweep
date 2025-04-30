

if(objRun.current_event == "shop")
{
	with(objRun) event_user(0);
}
else
{
	if(objRun.resets > 0 && !objPlayer.dead)
	{
		with(objRun) resets--;
		reset_board();
		next_turn();
	}
}