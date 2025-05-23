// Inherit the parent event
if(instance_exists(objRun))
{
	draw_hp(x-(sprite_width*1.5)/2, y + sprite_height/2,sprite_width*1.5, 32,objRun.curr_hp,objRun.max_hp);

	if(objRun.shield > 0)
	draw_hp(x-(sprite_width*1.5)/2, y + sprite_height,sprite_width*1.5,16,objRun.curr_shield,objRun.max_hp,c_aqua,false);
}
event_inherited();

