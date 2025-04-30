curr_turn--;

if(curr_turn == 0 && !dead)
{
	if(!add_item({tag: mine, index: array_length(objCombat.mine_list)}, TILES.ENEMY, true, true))
	{
		miss = 30;
	}
	else{current_scale = 1;}
	curr_turn = turns;
}

//Test move
//var _tile = random_tile(true,true);
//if(_tile != noone)
//{
//	_tile.status = TILESTATUS.POISON;
//	_tile.status_duration = TILESTATUS.POISON;
//}
