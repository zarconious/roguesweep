// Inherit the parent event
if(instance_exists(objRun))
{
	draw_hp(x-(sprite_width*1.5)/2, y + 64,sprite_width*1.5, 32,objRun.curr_hp,objRun.max_hp);

	if(objRun.shield > 0)
	{
		draw_set_color(make_color_rgb(45,114,193));
		draw_text(x,y+128,objRun.curr_shield);
	}
	//draw_hp(x-(sprite_width*1.5)/2, y + 128,16,objRun.curr_shield,objRun.curr_shield, make_color_rgb(45,114,193),false);
}

draw_sprite_ext(sprEShadow,0,x,y,1,1,1,c_white,1);

event_inherited();

