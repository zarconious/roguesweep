// Inherit the parent event
event_inherited();

current_scale = 1;
description = "SHOP";

shop_inventory = [];

for(var i = 0; i<10; i++){
	array_push(shop_inventory,
	{
		tag: i,
		cost: all_items[i].cost
	});
}


alarm[0] = step_interval;