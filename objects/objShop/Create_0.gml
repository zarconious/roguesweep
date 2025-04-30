// Inherit the parent event
event_inherited();

current_scale = 1;
description = "SHOP";

shop_inventory = [];

array_push(shop_inventory,
{
	tag: ITEMS.DMG_Basic,
	cost: 2
});
array_push(shop_inventory,
{
	tag: ITEMS.DMG_Bow,
	cost: 4
});
array_push(shop_inventory,
{
	tag: ITEMS.DMG_Strong,
	cost: 3
});
array_push(shop_inventory,
{
	tag: ITEMS.MSC_Gem,
	cost: 10
});
array_push(shop_inventory,
{
	tag: ITEMS.MSC_Reset,
	cost: 3
});
array_push(shop_inventory,
{
	tag: ITEMS.PUP_Health,
	cost: 6
});
array_push(shop_inventory,
{
	tag: ITEMS.PUP_Shield,
	cost: 4
});

alarm[0] = step_interval;