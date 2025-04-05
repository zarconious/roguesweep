if(objUI.resets > 0)
{
	with(objUI) resets--;
	reset_board();
	next_turn();
}