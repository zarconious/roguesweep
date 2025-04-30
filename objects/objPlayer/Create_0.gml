// Inherit the parent event
event_inherited();

dead = false;
description = "ME!"
image_speed = 0;

	instance_create_depth(x - 72,y,0,objUIButton, 
		{image_index: 2, description: "MONEY"});
	instance_create_depth(x + 72,y,0,objUIButton, 
		{image_index: 3, description: "STRENGTH"});