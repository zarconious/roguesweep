curr_turn--;

if(curr_turn == 0 && !dead)
{
	repeat(count)
	{
		var _tile = noone;
		switch(mine)
		{
			case MINES.MSC_Heal: 
				heal_random_enemy(10);
				current_scale = 1;
			break;
			case MINES.STS_Hide:
				_tile = random_tile(1,-1);
				if(_tile != noone)
				{
					current_scale = 1;
					_tile.status = TILESTATUS.HIDDEN;
					with(_tile.object)
					effect_create_above(ef_ring,x,y,32,c_purple);
				} else {
					miss = 30;
				}
			break;
			case MINES.STS_Ice: 
				_tile = random_tile(1,-1);
				if(_tile != noone)
				{
					current_scale = 1;
					_tile.status = TILESTATUS.ICE;
					with(_tile.object)
					effect_create_above(ef_ring,x,y,32,c_aqua);
				} else {
					miss = 30;
				}
			break;
			case MINES.STS_Poison:
				_tile = random_tile(1,-1);
				if(_tile != noone)
				{
					current_scale = 1;
					_tile.status = TILESTATUS.POISON;
					with(_tile.object)
					effect_create_above(ef_ring,x,y,32,c_lime);
				} else {
					miss = 30;
				}
			break;
			case MINES.MSC_Steal: 
				if(instance_number(objItem)>0)
				{
					current_scale = 1;
					steal_items();
				}
				else miss = 30;
			break;
			
			
			default: 
				if(!add_item({tag: mine, index: array_length(objCombat.mine_list)}, TILES.ENEMY, 1, 1))
				{
					if(!add_to_hold_list({tag: mine, index: array_length(objCombat.mine_list)}))
					miss = 30;
					else{current_scale = 1;}
				}
				else{current_scale = 1;}
			break;
		}
	}
	curr_turn = turns;
}