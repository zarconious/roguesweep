// Inherit the parent event
event_inherited();

dead = false;
description = "ME!"
image_speed = 0;

	var _btn1 = instance_create_depth(x - 128,y + 42,0,objUIButton, 
		{description: "MONEY"});
		_btn1.image_index = 2;
	var _btn2 = instance_create_depth(x - 128,y - 42,0,objUIButton, 
		{description: "STRENGTH"});
		_btn2.image_index = 3;