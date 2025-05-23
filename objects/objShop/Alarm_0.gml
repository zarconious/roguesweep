var _shop_items = array_shuffle(shop_inventory);
var _space = 128;
var _item1 = instance_create_depth(x - _space,y + _space,0,objItemShop, {
	cost: _shop_items[0].cost,
	tag: _shop_items[0].tag,
	description: all_items[_shop_items[0].tag].description
});
_item1.image_index = _shop_items[0].tag;

var _item2 = instance_create_depth(x,y + _space,0,objItemShop, {
	cost: _shop_items[1].cost,
	tag: _shop_items[1].tag,
	description: all_items[_shop_items[1].tag].description
	});
_item2.image_index = _shop_items[1].tag;

var _item3 = instance_create_depth(x + _space,y + _space,0,objItemShop, {
	cost: _shop_items[2].cost,
	tag: _shop_items[2].tag,
	description: all_items[_shop_items[2].tag].description
	});
_item3.image_index = _shop_items[2].tag;
	
var _up1 = instance_create_depth(x - _space,y+_space*2,0,objUpgrade, 
{description: "+15 MAXHP",cost: 0});
_up1.image_index = 0;
var _up2 = instance_create_depth(x,y+_space*2,0,objUpgrade, 
{description: "+1 REFRESH",cost: 0});
_up2.image_index = 1;
var _up3 = instance_create_depth(x + _space,y+_space*2,0,objUpgrade, 
{description: "+1 BOARD SIZE/MOVE",cost: 0});
_up3.image_index = 2;
	
	
	