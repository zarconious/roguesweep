
if(name != "left" && name != "right" && name != "board" && name != "root")
{
	draw_set_color(darkPurple);
	draw_rectangle(x, y, x + width, y + height, 0);

	draw_set_color(c_white);
}

if(name == "moves" && instance_exists(objRun))
{
	for(var i = 0; i<objRun.max_moves; i++)
	{
		draw_circle(x + 64*(i) + 32, y + 32, 24, 1);
	}
}

if(name == "mines" && instance_exists(objCombat) && objCombat.mines_number > 0)
{
	draw_set_font(fnt_big);
	draw_set_halign(fa_left);
	draw_text(x + 32,y + 32, string(objCombat.mines_number) + "x");	
}

if(name == "stats" &&  instance_exists(objRun))
{
	if(objRun.shield > 0)
	draw_hp(x+16,y+8,objRun.curr_shield*4 + 32,32,objRun.curr_shield,objRun.max_hp,c_aqua,false);
	
	draw_hp(x+16,y+height-48,width-72,32,objRun.curr_hp,objRun.max_hp);
}