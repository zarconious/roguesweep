// Inherit the parent event
event_inherited();

current_scale = 1;
description = "SHOP";

restocks = 0;
shop_inventory = [];

for(var i = 0; i<9; i++){
	array_push(shop_inventory,
	{
		tag: i,
		cost: all_items[i].cost
	});
}

instance_create_depth(x,y+256*2,0,objRestockButton);
alarm[0] = step_interval;