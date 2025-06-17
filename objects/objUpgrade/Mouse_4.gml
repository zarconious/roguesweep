if(objRun.coins >= cost)
{
	objRun.coins-=cost;
	switch(image_index)
	{
		case 0: var _prevMax = objRun.max_hp; objRun.max_hp += 15;  objRun.hp = (objRun.max_hp * objRun.hp) / _prevMax; break;
		case 1: objRun.max_resets += 1; objRun.resets = objRun.max_resets; break;
		case 2: objRun.board_size += 1; objRun.max_moves+=1; break;
	}
	
	event_user(0);
}