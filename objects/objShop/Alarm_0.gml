var _shop_items = array_shuffle(shop_inventory);
var _space = 128;
instance_create_depth(x - _space,y + _space,0,objItemShop, {
	cost: _shop_items[0].cost,
	tag: _shop_items[0].tag,
	image_index: _shop_items[0].tag,
	description: all_items[_shop_items[0].tag].description
});
instance_create_depth(x,y + _space,0,objItemShop, {
	cost: _shop_items[1].cost,
	tag: _shop_items[1].tag,
	image_index: _shop_items[1].tag,
	description: all_items[_shop_items[1].tag].description
	});
instance_create_depth(x + _space,y + _space,0,objItemShop, {
	cost: _shop_items[2].cost,
	tag: _shop_items[2].tag,
	image_index: _shop_items[2].tag,
	description: all_items[_shop_items[2].tag].description
	});
	
instance_create_depth(x - _space,y+_space*2,0,objUpgrade, 
{sprite_index: sprUpgrade, image_index: 0, description: "+15 MAXHP",cost: 0});
instance_create_depth(x,y+_space*2,0,objUpgrade, 
{sprite_index: sprUpgrade, image_index: 1, description: "+1 MOVE",cost: 0});
instance_create_depth(x + _space,y+_space*2,0,objUpgrade, 
{sprite_index: sprUpgrade, image_index: 2, description: "BOARD SIZE +1 (MORE COINS)",cost: 0});
	
	
	