var _current_turn = turns - (objCombat.turn mod turns) - 1;

if(_current_turn == 0 && !dead)
{
	if(!add_item({tag: mine, index: -1}, TILES.ENEMY, true, true))
	{
		miss = 30;
	}
	else{current_scale = 1;}
}

//Test move
var _tile = random_tile(true,true);
if(_tile != noone)
{
	_tile.status = TILESTATUS.POISON;
	_tile.status_duration = TILESTATUS.POISON;
}
