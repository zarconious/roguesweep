update_closed_tiles();
if(free_move)
{
	objCombat.player_turn = true;
	free_move = false;
}
else
next_turn();