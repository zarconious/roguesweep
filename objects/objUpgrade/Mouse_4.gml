if(objRun.coins >= cost)
{
	objRun.coins-=cost;
	switch(image_index)
	{
		case 0: objRun.max_hp += 15; objRun.hp += 20; break;
		case 1: objRun.max_moves+=1;
		case 2: objRun.board_size += 1; break;
		default: objRun.max_resets += 1; objRun.resets = objRun.max_resets; break; break;
	}
	
	event_user(0);
}