draw_set_color(c_white);
if(!objCombat.player_turn)
image_alpha = 0.8;

var _open = is_open(row,col);
var _tile = get_tile_type(row,col);
var _color = c_white;
if(_open && _tile == TILES.ENEMY)
 _color = c_red;
if(_open && _tile == TILES.ITEM)
 _color = c_lime;
 
if(get_tile_status(row,col) == TILESTATUS.POISON)
 _color = c_green;
draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,_color,1);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);

image_alpha = 1;

		
if(mark && !_open)
draw_sprite(sprite_index,2,x,y);


if(debug)
{
	
	if(_tile != TILES.EMPTY && !_open)
	{
		if(_tile == TILES.ENEMY)
		draw_sprite_ext(sprMines, get_tile_tag(row,col), x,y,0.8,0.8,0,c_red,0.2);
		else
		draw_sprite_ext(sprMoves, get_tile_tag(row,col), x,y,0.8,0.8,0,c_green,0.2);
	}
}

if(magnifier)
{
	
	if(_tile != TILES.EMPTY && !_open)
	{
		if(_tile == TILES.ENEMY)
		draw_sprite_ext(sprMines, get_tile_tag(row,col), x,y,0.8,0.8,0,c_red,0.2);
		else
		draw_sprite_ext(sprMoves, get_tile_tag(row,col), x,y,0.8,0.8,0,c_green,0.2);
	}
}

if(_open && !position_meeting(x,y,objItem))
{
	//TODO: Optimize this
	if(get_tile_type(row,col) != TILES.ENEMY)
	{
		var _mine_count = get_mine_count(row,col);
		switch(_mine_count)
		{
			case 1: draw_set_color(c_blue); break;	
			case 2: 
			case 3: draw_set_color(c_purple);break;	
			case 4: 
			case 5: draw_set_color(c_fuchsia); break;		
			case 6: 	
			case 7: 	
			case 8: draw_set_color(c_red); break;	
		}
		
		if(_mine_count > 0)
		draw_text(x,y,_mine_count);	
	}
}