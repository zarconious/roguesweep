if(!is_open(row,col) && objCombat.player_turn)
{
	next_turn();
	open_tile(row,col, true);
}