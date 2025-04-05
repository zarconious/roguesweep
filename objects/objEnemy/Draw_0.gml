// Inherit the parent event
event_inherited();

if(objCombat.selected_enemy == id)
draw_sprite_ext(sprArrow,0,x-sprite_width/2-16  + abs(image_angle),y+24,0.4,0.4,90,c_white,1);

var _current_turn = turns - (objCombat.turn mod turns) - 1;
var _turn_color;
if(_current_turn == 0) _turn_color = #F95738;
if(_current_turn == 1) _turn_color = #EE964B;
if(_current_turn > 1) _turn_color = #F4D35E;

if(!dead)
{
	draw_set_valign(fa_middle)
	draw_set_halign(fa_center)

	draw_set_color(_turn_color)
	draw_circle(x+sprite_width/2,y,16,-1);
	draw_set_color(c_white);
	draw_text(x+sprite_width/2,y,string(_current_turn));

	draw_set_color(#EBEBD3);
	draw_rectangle(x-sprite_width/2-2,y+16-2,x+sprite_width/2+2,y+32+2,false);
	draw_set_color(#F95738);
	var _hp_end = map_value(hp,0,max_hp,x-sprite_width/2,x+sprite_width/2);
	draw_rectangle(x-sprite_width/2,y+16,_hp_end,y+32,false);
	draw_set_color(c_black);
	draw_text(x, y+26, string(floor(hp)) + "/" + string(max_hp));
	
	if(miss > 0)
	draw_text(x, y-sprite_height-16, "MISS");
	
	var _current_turn = turns - (objCombat.turn mod turns) - 1;
	if(_current_turn == 1) 
	draw_sprite_ext(sprExclamation, 0, x,y-sprite_height,0.1,0.1,0,c_white,1);
}
else
{
	draw_sprite(sprCross, 0, x,y-sprite_height/2);	
}

if(debug)
{
	draw_set_color(c_red)
	draw_rectangle(x-sprite_width/2,y-sprite_height,x+sprite_width/2,y,true)
	draw_text(x+sprite_width/2,y-sprite_height, "(" + string(sprite_width) + "," + string(sprite_height) + ")");
}