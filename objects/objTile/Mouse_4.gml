if(!is_open(row,col) && objCombat.player_turn && !objPlayer.dead)
{
	objBoard.is_opening = true;
	if(objBoard.board[row,col].status == TILESTATUS.POISON)
	damage_player([5]);
	
	
	open_tile(row,col, true);
}