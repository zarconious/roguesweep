if(instance_exists(objRun))
{
	if(name == "menu")
	{
		instance_create_depth(x+ 32,y+height - 32,0,objUIButton, 
		{image_index: 6, description: "options"});
		instance_create_depth(x + 88*2,y+height - 32,0,objUIButton, 
		{image_index: 5, description: "map"});
		instance_create_depth(x + 88*3,y+height - 32,0,objUIButton, 
		{image_index: 4, description: "bag"});
		
		objRun.bagArea = id;
	}
	
	if(name == "stats")
	{
		instance_create_depth(x + width - 32,y+height - 32,0,objUIButton, 
		{image_index: 0, description: "HP"});
		instance_create_depth(x + width - 32,y+32,0,objUIButton, 
		{image_index: 1, description: "SHIELD"});
	}
	
	
	
	if(name == "mines")
	{
		instance_create_depth(x+width-32 ,y+32,0,objUIButton, 
		{image_index: 8, description: "All mines in the board"});
		
		objRun.minesArea = id;

	}
	if(name == "badges")
	{
		instance_create_depth(x+32,y+32,0,objUIButton, 
		{image_index: 7, description: "Owned badges"});
		
		objRun.badgesArea = id;
	}

	if(name == "moves")
	{
		instance_create_depth(x+width,y+32,0,objReset);
		instance_create_depth(x,y,0,objUIButton, 
		{image_index: 9, description: "Available moves"});
		objRun.movesArea = id;
	}
	if(name == "tiles")
	{
		instance_create_depth(x+width/2,y+height/2,0,objBoard);
	}
	if(name == "enemies" && instance_exists(objCombat))
	{
		objCombat.enemyArea = id;
	}
}
else
{
	if(name == "tiles")
	{
		instance_create_depth(x+width/2,y+height/2,0,objButton);
	}
}