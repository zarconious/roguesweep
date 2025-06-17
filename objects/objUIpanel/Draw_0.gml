if(debug)
{
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	draw_set_color(darkPurple);
	draw_text(_topX+25,_topY+25,name);
	draw_rectangle(_topX, _topY, _botX, _botY, 1);
	draw_circle(x,y,8,0);
}
	
draw_set_color(c_white);

if(name == "traps" && instance_exists(objCombat) && instance_exists(objBoard))
{
	var _max_add = min(objRun.max_moves, array_length(objRun.move_bag));
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_sprite_stretched(sprGUI,0,_topX,_topY,_width,_height);
	draw_sprite(sprUIicons, 2, _topX + 52,_topY + 48);
	draw_sprite(sprUIicons, 3, _topX + 52,_topY + _height-192);

	draw_set_color(brown);
	draw_set_font(fnt_big);
	draw_text(_topX + 96, _topY + 32, "Traps");	
	draw_text(_topX + 96, _topY + _height-192-16, "Found");	
	draw_set_font(fnt_small);
	draw_text(_topX + 96, _topY + 64, string(objCombat.mines_number) + "/" + string(objBoard.closedTiles));	
	draw_text(_topX + 96, _topY + _height-192 + 16, string(objCombat.found_number) + "/" + string(_max_add));	

	var _startX = _topX + 48;
	var _startY = _topY + _height-128;
	var _maxW = 5;
	var _distY = 64;
		
	draw_set_font(fnt_big);
	for(var i = objCombat.found_number; i<_max_add; i++)
	{
		draw_text(_startX + (i mod _maxW)*(_width/_maxW), _startY + floor(i div _maxW)*_distY, "?");
	}
	draw_set_color(c_white);

}

//if(name == "stats" &&  instance_exists(objRun))
//{
//	if(objRun.shield > 0)
//	draw_hp(x+16,y+8,objRun.curr_shield*4 + 32,32,objRun.curr_shield,objRun.curr_shield,c_aqua,false);
	
//	draw_hp(x+16,y+height-48,width-72,32,objRun.curr_hp,objRun.max_hp);
//}

if(!instance_exists(objRun) && name == "enemies")
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_font(fnt_big);
	draw_text(x+width/2,y+32, "Kaboom Critters (early alpha)\n\nThis prototype is a work in progress.\nNothing you see is guaranteed to be in the final product");
}

if(!instance_exists(objRun) && name == "stats")
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_font(fnt_big);
	draw_text(x+width/2,y+height-32, "June 9th 2025 build");
}

if(!instance_exists(objRun) && name == "menu")
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_font(fnt_big);
	draw_text(x+width/2,y+height-32, "By Jose Castanheira\n'Zarc Attack'");
}


if(instance_exists(objRun) && name == "menu")
{
	draw_set_valign(fa_middle);
	draw_set_halign(fa_left);
	draw_set_font(fnt_big);
	draw_set_color(c_white);

	draw_text(_topX,y + 32, "ROUND " + string(objRun.current_round));
	draw_text(_topX,y - 32,"TURNS " + string(objRun.current_turn));
}

if(!instance_exists(objRun) && name == "board")
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_font(fnt_big);
	draw_text(x+width/2,y+height-128, "Please do not share");
}

if(instance_exists(objRun) && name == "inventory")
{
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_set_font(fnt_big);
	draw_sprite_stretched(sprGUI,0,_topX,_topY,_width,_height);
	draw_set_color(brown);
	draw_text(_topX + 96, _topY + 32, "Badges");
	draw_text(_topX + 96, _topY + _height/2 - 16, "Inventory");
	draw_set_font(fnt_small);
	//draw_text(_topX + 96, _topY + _height/2+16, "x"+string(array_length(objRun.move_bag)));
	draw_set_color(c_white);
	draw_sprite(sprUIicons, 0, _topX + 52,_topY + 48);
	draw_sprite(sprUIicons, 1, _topX + 52,_topY + _height/2);
}

if(instance_exists(objRun) && name == "board" && objRun.current_event == "end")
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_font(fnt_big);
	draw_text(x+width/2,y+height-128, "YOU WIN!");
}

if(instance_exists(objRun) && name == "board")
{
	var _size = 7 - objRun.background_size;
	var _side = _height - _size*64;
	if(_side > 128)
	draw_sprite_stretched(sprGrassBoardBackground,0,x-_side/2,y-_side/2,_side,_side);
}
