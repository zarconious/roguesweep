draw_set_color(c_white);
if(!objCombat.player_turn)
image_alpha = 0.8;

var _status = get_tile_status(row,col);
var _open = is_open(row,col);
var _tile = get_tile_type(row,col);
var _color = c_white;
if(_open && _tile == TILES.ENEMY)
 _color = colors[5];
if(_open && _tile == TILES.ITEM)
 _color = colors[3];
if(_open && _status == TILESTATUS.HIDDEN)
image_index = 7;

if(!_open)
{
	switch(_status)
	{
		case TILESTATUS.POISON: image_index = 5; break;
		case TILESTATUS.ICE: image_index = 3; break;
		case TILESTATUS.HIDDEN: image_index = 6; break;
		default: if((row+col) mod 2 == 0) image_index = 0 else image_index = 8;
	}
}
draw_sprite_ext(sprite_index,image_index,x,y+yy,1,1,0,c_white,1);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);

image_alpha = 1;

		
if(mark && !_open)
draw_sprite(sprite_index,2,x,y);

if(!_open && position_meeting(mouse_x, mouse_y, id))
{
	draw_set_color(c_white);
	draw_set_alpha(0.5);
	draw_rectangle(x-sprite_width/2,y+yy-sprite_height/2,x+sprite_width/2,y+yy+sprite_height/2,-1);
	draw_set_alpha(1);
}

if(_open && _color != c_white)
{
	draw_set_color(_color);
	draw_set_alpha(0.5);
	draw_rectangle(x-sprite_width/2,y+yy-sprite_height/2,x+sprite_width/2,y+yy+sprite_height/2,-1);
	draw_set_alpha(1);
}


if(debug || objRun.hp == 0)
{
	
	if(_tile != TILES.EMPTY && !_open)
	{
		if(_tile == TILES.ENEMY)
		draw_sprite_ext(sprMines, get_tile_tag(row,col), x,y,0.8,0.8,0,colors[5],0.2);
		else
		draw_sprite_ext(sprMoves, get_tile_tag(row,col), x,y,0.8,0.8,0,colors[3],0.2);
	}
}

if(magnifier)
{
	
	if(_tile != TILES.EMPTY && !_open)
	{
		if(_tile == TILES.ENEMY)
		draw_sprite_ext(sprMines, get_tile_tag(row,col), x,y,0.8,0.8,0,colors[5],0.2);
		else
		draw_sprite_ext(sprMoves, get_tile_tag(row,col), x,y,0.8,0.8,0,colors[3],0.2);
	}
}

if(_open && !position_meeting(x,y,objItem))
{
	draw_set_font(fnt_big);
	//TODO: Optimize this
	if(get_tile_type(row,col) != TILES.ENEMY)
	{
		var _mine_count = get_mine_count(row,col);
		if(_mine_count > 0)
		{
			//switch(_mine_count)
			//{
			//	case 1: draw_set_color(color1); break;	
			//	case 2: draw_set_color(color2);break;
			//	case 3: 	
			//	case 4: draw_set_color(color3); break;
			//	case 5: 		
			//	case 6: 	
			//	case 7: 	
			//	case 8: draw_set_color(color4); break;	
			//}
			
			draw_set_color(colors[_mine_count-1]);
			if(_status == TILESTATUS.HIDDEN)
			{
				draw_set_color(colors[7]);
				draw_text(x,y,"?");
			}
			else
			draw_text(x,y,_mine_count);
		} 		
	}
}