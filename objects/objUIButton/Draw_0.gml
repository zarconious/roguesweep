event_inherited();

draw_set_font(fnt_big);

if(image_index == 1)
{
	image_alpha = 0;
	if(objRun.shield != 0)
	{
		image_alpha = 1;
	}
}

if(image_index == 2)
{
	draw_set_color(c_orange);
	draw_set_halign(fa_right);
	draw_text(x - 48, y, string(round(objRun.curr_coins))+ "$");	
}


if(image_index == 3)
{
	image_alpha = 0;
	if(objRun.str != 0)
	{
		image_alpha = 1;
	draw_set_color(c_orange);
	draw_set_halign(fa_right);
		draw_text(x - 48, y, string(1+objRun.curr_str) + "x");
	}	
}

draw_set_color(c_white);