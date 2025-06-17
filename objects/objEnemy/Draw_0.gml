draw_sprite_ext(sprEShadow,0,x,y,1,1,1,c_white,1);


if(objCombat.selected_enemy == id)
draw_sprite_ext(sprArrow,0,x-(sprite_width*1.5)/2 + abs(image_angle) - 16,y+22,0.4,0.4,90,c_white,1);



var _current_turn = curr_turn;
var _turn_color = make_color_rgb(237,80,80);
if(_current_turn == 2) _turn_color = make_color_rgb(237,80,80);
if(_current_turn > 2) _turn_color =make_color_rgb(234,188,36);

draw_set_valign(fa_middle)
draw_set_halign(fa_center)
draw_set_font(fnt_small)

if(floor(hp) > 0)
draw_hp(x-(sprite_width*1.5)/2, y + 6,sprite_width*1.5, 32,hp,max_hp);	
event_inherited();
if(floor(hp) <= 0)
draw_sprite(sprCross, 0, x,y-sprite_height/2);	


if(!dead)
{
	
	if(miss > 0)
	draw_text(x, y-sprite_height-16, "MISS");
	
	if(_current_turn == 1) 
	draw_sprite_ext(sprExclamation, 0, x,y-sprite_height,1,1,0,c_white,1);
	else 
	{
		draw_set_color(_turn_color)
		draw_circle(x,y-sprite_height-16,16,-1);
		draw_set_color(c_white);
		draw_set_font(fnt_small);
		draw_set_valign(fa_middle)
		draw_set_halign(fa_center)
		draw_text(x,y-sprite_height - 16,string(_current_turn));	
	}
}

if(debug)
{
	draw_set_color(c_red)
	draw_rectangle(x-sprite_width/2,y-sprite_height,x+sprite_width/2,y,true)
	draw_text(x+sprite_width/2,y-sprite_height, "(" + string(sprite_width) + "," + string(sprite_height) + ")");
}