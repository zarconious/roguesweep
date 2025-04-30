if(!is_open(row,col) && objCombat.player_turn && !objPlayer.dead)
{
	objBoard.is_opening = true;
	open_tile(row,col, true);
}