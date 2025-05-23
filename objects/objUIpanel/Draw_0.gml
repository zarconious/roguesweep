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

if(name == "moves" && instance_exists(objRun) && instance_exists(objCombat))
{
	draw_set_font(fnt_big);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	
	var _max_add = min(objRun.max_moves, array_length(objRun.move_bag));
	
	draw_text(_topX + 72, _topY + 32, string(objCombat.found_number) + "/" + string(_max_add));	
	
	for(var i = objCombat.found_number; i<_max_add; i++)
	{
		draw_text(_topX + 42*(i) + 32, _topY + 96, "?");
	}
}

if(name == "traps" && instance_exists(objCombat) && instance_exists(objBoard))
{
	draw_set_font(fnt_big);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	
	draw_text(_topX + 72, _topY + 32, string(objCombat.mines_number) + "/" + string(objBoard.closedTiles));	
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
	draw_text(x+width/2,y+8, "Sweep n'Strike (wip)\n\nThis prototype is a work in progress.\nNothing you see is guaranteed to be in the final product");
}

if(!instance_exists(objRun) && name == "stats")
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_font(fnt_big);
	draw_text(x+width/2,y+height-32, "May 24th 2025 build");
}

if(!instance_exists(objRun) && name == "menu")
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_font(fnt_big);
	draw_text(x+width/2,y+height-32, "By Jose Castanheira");
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

if(!instance_exists(objRun) && name == "tiles")
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
	draw_text(_topX + 96, _topY + 32, string(array_length(objRun.move_bag)));
}

if(instance_exists(objRun) && name == "tiles" && objRun.current_event == "end")
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_font(fnt_big);
	draw_text(x+width/2,y+height-128, "YOU WIN!");
}
