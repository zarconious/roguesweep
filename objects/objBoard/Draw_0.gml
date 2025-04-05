//draw_set_valign(fa_center)
//draw_set_halign(fa_center)

//var _x = x + square_size;
//var _y = y + square_size;

//for(var col = 0; col < board_height; col++)
//{
//	var _draw_y = col * square_size * 2;
		
//	for(var row = 0; row < board_width; row++)
//	{
	
//		var _draw_x = row * square_size * 2;
		
//		if(board[row,col][2] == 0)
//		{
//			draw_set_color(c_gray);
//			draw_rectangle(_x + _draw_x - square_size,_y + _draw_y - square_size,_x + _draw_x + square_size,_y +  _draw_y + square_size,false);
//		}
//		else
//		draw_text(_x + _draw_x,_y + _draw_y,board[row,col][1])
		
//		draw_set_color(c_white);
//		draw_rectangle(_x + _draw_x - square_size,_y + _draw_y - square_size,_x + _draw_x + square_size,_y +  _draw_y + square_size,true);
		
		
//		if(board[row,col][0] == 1)
//		{
//			draw_set_color(c_red);
//			draw_circle(_x +_draw_x,_y + _draw_y,square_size/2,false);
//		}
		
		
//		//draw_text(x +_draw_x,y + _draw_y,string(row) + "," + string(col))
//	}
//}


draw_set_halign(fa_left);


if(debug)
{
	draw_set_color(c_red);
	//draw_text(room_width - 448,64, "Board: " + string(mine_list));
	//draw_text(room_width - 448,96, "Combat: " + string(objCombat.mine_list));
	//draw_text(room_width - 448,32, "Closed Tiles: " + string(array_length(closedTiles)));
	draw_text(room_width - 448,32, "Found: " + string(array_length(objCombat.found_list)));
	draw_text(room_width - 448,64, "Used: " + string(array_length(objCombat.used_list)));
}
draw_set_color(c_white);
var _mine_count = array_length(draw_mines);
draw_text(room_width - 448,128, "Mines in board: x" + string(_mine_count));
for(var i = 0; i < _mine_count; i++)
{
	draw_sprite(sprMines, draw_mines[i], room_width - 432 + (i mod 5)*64, 192 + floor(i div 5)*32);
}
