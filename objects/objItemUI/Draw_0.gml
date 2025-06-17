
if(!found) image_alpha = 0.5; else image_alpha = 1;
event_inherited();
if(used) {
	if(sprite_index == sprMines)
	draw_sprite_ext(sprCross,0,x,y,0.5,0.5,0,c_white,0.8);
	else
	draw_sprite_ext(sprCheckmark,0,x,y,1,1,0,c_white,0.8);
	
}