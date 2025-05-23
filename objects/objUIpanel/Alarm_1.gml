_width = room_width * width;
_height = room_height * height;
_topX = x - _width/2;
_topY = y - _height/2;
_botX = x + _width/2;
_botY = y + _height/2;

if(instance_exists(objRun))
{
	if(name == "inventory")
	{
		//var _btn1 = instance_create_depth(_topX+ 32,_topY+_height - 32,0,objUIButton, 
		//{description: "options"});
		//_btn1.image_index = 6;
		//var _btn2 = instance_create_depth(_topX + 88*2,_topY+_height - 32,0,objUIButton, 
		//{description: "map"});
		//_btn2.image_index = 5;
		var _btn3 = instance_create_depth(_topX + 32,_topY + 32,0,objUIButton, 
		{description: "inventory"});
		_btn3.image_index = 4;
		
		objRun.bagArea = id;
	}
	
	if(name == "stats")
	{
		instance_create_depth(x,y,0,objPlayer)
		instance_create_depth(x + 128,y,0,objReset);
		//var _btn1 = instance_create_depth(_topX + _width - 32,_topY+_height - 32,0,objUIButton, 
		//{description: "HP"});
		//_btn1.image_index = 0;
		//var _btn2 = instance_create_depth(_topX + _width - 32,_topY+32,0,objUIButton, 
		//{description: "SHIELD"});
		//_btn2.image_index = 1;
	}
	
	
	if(name == "traps")
	{
		var _btn1 = instance_create_depth(_topX+32 ,_topY+32,0,objUIButton, 
		{description: "Mines in board / Hidden tiles"});
		_btn1.image_index = 8;
		objRun.minesArea = id;

	}
	if(name == "badges")
	{
		var _btn1 = instance_create_depth(_topX+32,_topY+32,0,objUIButton, 
		{description: "Owned badges"});
		_btn1.image_index = 7;
		objRun.badgesArea = id;
	}

	if(name == "moves")
	{
		var _btn1 = instance_create_depth(_topX +32,_topY +32,0,objUIButton, 
		{description: "Moves in board"});
		_btn1.image_index = 9;
		objRun.movesArea = id;
	}
	if(name == "board")
	{
		instance_create_depth(_topX+_width/2,_topY+_height/2,0,objBoard);
	}
	if(name == "enemies" && instance_exists(objCombat))
	{
		objCombat.enemyArea = id;
	}
}
else
{
	if(name == "board")
	{
		var _b = instance_create_depth(_topX+_width/2,_topY+_height-64,0,objButton);
		_b.image_index = 1;
	}
}