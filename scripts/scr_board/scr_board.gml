function create_new_board(width, height){
	
	with(objTile) instance_destroy();
	with(objMine) instance_destroy();
	with(objItem) instance_destroy();
	with(objCombat) {
		found_list = [];	
		used_list = [];	
		mine_list = [];
	}

	// CREATE CLICKABLE TILES
	for(var _col = 0; _col < board_height; _col++)
	{
		var _draw_y = _col * square_size * 2 - square_size*(board_height-1);
		
		for(var _row = 0; _row < board_width; _row++)
		{	
			board[_row,_col] = 
			{
				row: _row,
				col: _col,
				tile: TILES.EMPTY,
				tag: 0,
				index: -1,
				mines: 0,
				open: false,
				has_coin: false,
				status: TILESTATUS.NORMAL,
				status_duration: 0,
				object: noone
			}
			
			var _draw_x = _row * square_size * 2 - square_size*(board_width-1);
			var _square = instance_create_depth(x + _draw_x,y + _draw_y,0, objTile);
			_square.row = _row;
			_square.col = _col;
			board[_row,_col].object = _square;
		}
	}
	
	add_coins(objRun.max_coins);
	add_moves(objRun.max_moves);
}

function get_item_data(item){
	return all_items[item];	
}

function get_item_object(index){
	
	return noone;
}

function get_mine_data(item){
	return all_mines[item];	
}


function random_tile(_closed = false, _empty = false) {
	var _tiles = get_tiles(_closed,_empty);
	var _tiles_number = array_length(_tiles);
	
	show_debug_message("(random_tile) Closed empty tiles: " + string(_tiles_number));
	if(_tiles_number > 0)
	{
		var _shuffled_tiles = array_shuffle(_tiles);
		var _tile = array_get(_shuffled_tiles,0);
		return _tile;
	}
	return noone;
}

function add_item(item,type, _closed = false, _empty = false){
	var _tile = random_tile(_closed,_empty);
	if(_tile){
		_tile.tile = type;
		_tile.tag = item.tag;	
		_tile.index = item.index;	

		update_mine_count();
		show_debug_message("Added item " + string(all_items[item.tag]));
		
		if(type == TILES.ENEMY)
		add_to_mine_list(item);
		
		return _tile;
	}
	
	show_debug_message("Can't add item " + string(all_items[item.tag]));
	return false;
}

function get_tiles(_closed = false, _empty = false){
	var _tiles = [];
	for(var _col = 0; _col < objBoard.board_height; _col++)
	{
		for(var _row = 0; _row < objBoard.board_width; _row++)
		{	
			var _tile = objBoard.board[_row,_col];
			var _is_empty = _tile.tile == TILES.EMPTY;
			var _is_closed = !_tile.open;
			var _get = false;
			
			// TODO: Improve this so we can get all types of tiles
			if(_closed && _is_closed && _empty && _is_empty) _get = true;
			
			if(_get) array_push(_tiles,objBoard.board[_row,_col]);
		}
	}
	return _tiles;
}

function get_board_items(){


}

function get_board_mines(){


}

//function get_current_moves(){
//	var _moves = objRun.current_moves;
//	var _current_moves_length = array_length(objRun.current_moves);
//	var _moves_id = []
//	for(var i = 0; i<_current_moves_length; i++)
//	{
//		array_push(_moves,_moves[i]);
//	}
//	return _moves;	
//}

function add_moves(max_moves){
	var _shuffled_moves = array_shuffle(objRun.move_bag);
	var _added_moves = [];
	for(var i = 0; i<max_moves; i++)
	{
		var _result = add_item(_shuffled_moves[i],TILES.ITEM,true,true);
		if(_result) array_push(_added_moves,_result);
	}
	update_lists();
	return _added_moves;
}

function add_coins(max_coins){
	// PLACE COINS
	for(var i=0; i<max_coins; i++)
	{
		placed = false;
		while(!placed) {
			var _try_row = irandom(board_width - 1);
			var _try_col = irandom(board_height - 1);
	
			if(board[_try_row,_try_col].tile == TILES.EMPTY && !board[_try_row,_try_col].has_coin)
			{
				placed = true;
				board[_try_row,_try_col].has_coin = true;	
			}
		}
	}
}

function update_mine_count(){
	with(objTile) count_mines();
}

function count_mines(){
	var _mine_count = 0;

	for(var _col = -1; _col < 2; _col++)
	{
		for(var _row = -1; _row < 2; _row++)
		{
			if(row + _row < objBoard.board_width and col + _col < objBoard.board_height and row + _row >= 0 and col + _col >= 0)
			{
				if objBoard.board[row + _row,col + _col].tile == TILES.ENEMY
				_mine_count++;
			
				
			}
		}
	}
	
	objBoard.board[row,col].mines = _mine_count;
}

function is_open(row,col){
		return objBoard.board[row,col].open;
}

function open_tile(row,col, clicked = false){
		var _tile = objBoard.board[row,col];
	
		if(!is_open(row,col))
		{
			_tile.open = true;
			var _tile_obj = _tile.object;
			_tile_obj.image_index = 1;
	
			if(_tile.has_coin)
			instance_create_depth(x,y,-100,objCoinAnim);
	
			if(_tile.tile == TILES.ENEMY) 
			{
					instance_create_depth(_tile_obj.x,_tile_obj.y,-10,objMine, {
						tag: _tile.tag,
						image_index: _tile.tag,
						description: all_mines[_tile.tag].description
					});
			}
	
			if(_tile.tile == TILES.ITEM)
			{
				instance_create_depth(_tile_obj.x,_tile_obj.y,-10,objItem, {
					index: _tile.index,
					tag: _tile.tag,
					image_index: _tile.tag,
					description: all_items[_tile.tag].description
				});
				find_item(_tile.index);
			}
			
			if(_tile.mines == 0)
			{
				// Time to uncover tiles
				_tile.object.alarm[0] = 2;
			}
		}
}

function open_adjacent_tiles(row,col){
	
	// Uncover nearby tiles
	if(col - 1 >= 0)
	{
		var _left_tile = objBoard.board[row,col - 1];
		//if(clicked)show_message(_left_tile);
		if(_left_tile.tile != TILES.ENEMY) open_tile(row,col - 1);
	}
		
	if(row - 1 >= 0)
	{
		var _top_tile = objBoard.board[row - 1,col];
		//if(clicked)show_message(_top_tile);
		if(_top_tile.tile != TILES.ENEMY) open_tile(row - 1,col);
	}
	
	if(row + 1 < objBoard.board_width)
	{
		var _bottom_tile = objBoard.board[row + 1,col];
		//if(clicked)show_message(_bottom_tile);
		if(_bottom_tile.tile != TILES.ENEMY) open_tile(row + 1,col);
	}
	
	if(col + 1 < objBoard.board_height)
	{
		var _right_tile = objBoard.board[row,col + 1];
		//if(clicked)show_message(_right_tile);
		if(_right_tile.tile != TILES.ENEMY) open_tile(row,col + 1);
	}
}

function add_to_mine_list(mine){
	with(objCombat)
	{
		var _mine_list_length = array_length(mine_list);
		array_push(mine_list,
		{
			index: _mine_list_length,
			tag: mine.tag
		});
	}
	update_lists();
}

function find_item(index){
	with(objCombat)
	{
		array_push(found_list,index);
		update_lists();
	}
}

function use_item(index){
	with(objCombat)
	{
		array_push(used_list,index);
		update_lists();
		
		if(array_length(used_list) == objRun.max_moves)
		{
			reset_board();	
		}
	}
}

function is_found(index){
	if(!instance_exists(objCombat)) return false;
	var _items = objCombat.found_list;
	var _item_count = array_length(_items);
	for(var i = 0; i < _item_count; i++)
	{
		if(_items[i] == index) {
			return true
		}
	}	
	return false;
}

function is_used(index){
	if(!instance_exists(objCombat)) return false;
	var _items = objCombat.used_list;
	var _item_count = array_length(_items);
	for(var i = 0; i < _item_count; i++)
	{
		if(_items[i] == index) {
			return true
		}
	}	
	return false;
}


function add_to_bag(item){
	with(objRun)
	{
		var _move_bag_length = array_length(move_bag);
		array_push(move_bag,
		{
			index: _move_bag_length,
			tag: item
		});
		//Add more stuff if needed (item upgrades...)
	}
}

function update_lists(){
	//TODO: Make generics lists so iterating is less used
	if(!instance_exists(objCombat)) return false;
	with(objItemUI) instance_destroy();
	update_bag();
	update_found();
	update_mines();
}

function update_mines(){
	var _mines = objCombat.mine_list;
	var _mines_count = array_length(_mines);
	
	for(var i = 0; i < _mines_count; i++)
	{
		var _tag = _mines[i].tag;
		var _mine = instance_create_depth(room_width - 432 + (i mod 5)*64, 265 + floor(i div 5)*64,0,objItemUI,{
			tag: _tag,
			image_index: _tag,
			sprite_index: sprMines,
			description: all_mines[_tag].description,
		})
	}
}

function update_bag(){
	var _items = objRun.move_bag;
	var _item_count = array_length(_items);
	
	for(var i = 0; i < _item_count; i++)
	{
		var _tag = _items[i].tag;
		var _item = instance_create_depth(room_width - 432 + (i mod 5)*64, 464 + floor(i div 5)*64,0,objItemUI,{
			index: _items[i].index,
			tag: _tag,
			image_index: _tag,
			description: all_items[_tag].description,
		})
		_item.found = is_found(_items[i].index);
		_item.used = is_used(_items[i].index);
	}
}

function update_found(){
	// TODO: Create a list object that takes objects and draws them
	var _items = objRun.move_bag;
	var _item_count = array_length(_items);
	var _found_count = 0;
	for(var i = 0; i < _item_count; i++)
	{
		if(is_found(_items[i].index))
		{
			var _tag = _items[i].tag;
			var _item = instance_create_depth(room_width /2 - 128 + (_found_count mod 5)*64, room_height - 128,0,objItemUI,{
				index: _items[i].index,
				tag: _tag,
				image_index: _tag,
				description: all_items[_tag].description,
			})
			_item.used = is_used(_items[i].index);
			_item.found = true;
			_found_count++;
		}
	
	}
}

function get_mine_count(row,col){
	return objBoard.board[row,col].mines;	
}

function get_tile_type(row,col){
	return objBoard.board[row,col].tile;	
}

function get_tile_tag(row,col){
	return objBoard.board[row,col].tag;	
}

function get_tile_status(row,col){
	return objBoard.board[row,col].status;	
}

function get_string_pos(row, col){
	return "(" + string(row) + "," + string(col) + ")";
}