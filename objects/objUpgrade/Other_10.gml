//Upgrade costs
switch(image_index)
{
	case 0: cost = objRun.max_hp  / 5; break;
	case 1: cost = objRun.max_moves * 5;break;
	case 2: cost = objRun.board_size * 2; break;
	default: cost = objRun.resets * 5;break;
}
	