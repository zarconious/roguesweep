function create_new_board(width, height){
	
	var _size = objRun.board_size;
	board_width = _size;
	board_height = _size;

	with(objTile) instance_destroy();
	with(objMine) instance_destroy();
	with(objItem) instance_destroy();
	with(objCombat) {
		found_list = [];	
		used_list = [];	
		mine_list = [];
		mine_used_list = [];
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
			var _square = instance_create_depth(x + _draw_x,y + _draw_y,-_col, objTile);
			_square.row = _row;
			_square.col = _col;
			board[_row,_col].object = _square;
		}
	}
	
	add_coins(objRun.max_coins);
	add_moves(objRun.max_moves);
	add_hold();
	update_closed_tiles();
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


function random_tile(_closed = 0, _empty = 0) {
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

function add_item(item,type, _closed = 0, _empty = 0){
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
	update_closed_tiles();
	return false;
}

function update_closed_tiles()
{
	var _tiles = [];
	for(var _col = 0; _col < objBoard.board_height; _col++)
	{
		for(var _row = 0; _row < objBoard.board_width; _row++)
		{	
			var _tile = objBoard.board[_row,_col];
			var _is_empty = _tile.tile == TILES.EMPTY;
			var _is_closed = !_tile.open;
			var _get = false;
			if(instance_exists(_tile.object)) _tile.object.cracked = false;
			
			// TODO: Improve this so we can get all types of tiles
			if(_is_closed) _get = true;
			
			if(_get) array_push(_tiles,objBoard.board[_row,_col]);
		}
	}
	objBoard.closedTiles = array_length(_tiles);
	return _tiles;
}

function get_tiles(_closed = 0, _empty = 0){
	var _tiles = [];
	for(var _col = 0; _col < objBoard.board_height; _col++)
	{
		for(var _row = 0; _row < objBoard.board_width; _row++)
		{	
			var _tile = objBoard.board[_row,_col];
			var _is_empty = _tile.tile == TILES.EMPTY;
			var _is_closed = !_tile.open;
			var _get = false;
			
			if(_closed == -1)
			{
				if(_empty == 1 && _is_empty) _get = true;
				if(_empty == 0 && !_is_empty) _get = true;
			}
			
			if(_empty == -1)
			{
				if(_closed == 1 && _is_closed) _get = true;
				if(_closed == 0 && !_is_closed) _get = true;
			}
			
			if(_closed == 1 && _empty == 1 && _is_closed && _is_empty) _get = true;
			if(_closed == 1 && _empty == 0 && _is_closed && !_is_empty) _get = true;
			if(_closed == 0 && _empty == 1 && !_is_closed && _is_empty) _get = true;
			if(_closed == 0 && _empty == 0 && !_is_closed && !_is_empty) _get = true;
			if(_closed == -1 && _empty == -1) _get = true;
			
			if(_get) array_push(_tiles,objBoard.board[_row,_col]);
		}
	}
	return _tiles;
}

//TODO: Replace found list with this
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
	var _max_add = min(max_moves, array_length(_shuffled_moves));
	for(var i = 0; i< _max_add; i++)
	{
		var _result = add_item(_shuffled_moves[i],TILES.ITEM,1,1);
		if(_result) array_push(_added_moves,_result);
	}
	update_lists();
	return _added_moves;
}

function add_hold(){
	var _mines = objCombat.hold_list;
	var _mines_length = array_length(_mines);
	var _added_moves = [];
	for(var i = 0; i<_mines_length; i++)
	{
		var _result = add_item(array_pop(_mines),TILES.ENEMY,1,1);
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
		
		objBoard.alarm[0] = 5;
		
		var _tile = objBoard.board[row,col];
		var _tile_obj = _tile.object;
		
		if(!is_open(row,col) && !_tile_obj.cracked)
		{
			var _status = objBoard.board[row,col].status;
			if( _status == TILESTATUS.ICE)
			{
				_tile_obj.cracked = true;
				if(_status == TILESTATUS.ICE) objBoard.board[row,col].status = TILESTATUS.NORMAL;
			}
			else
			{
				_tile.open = true;
				_tile_obj.image_index = 1;
	
				if(_tile.has_coin)
				instance_create_depth(x,y,-100,objCoinAnim);
	
				if(_tile.tile == TILES.ENEMY) 
				{
						var _mine = instance_create_depth(_tile_obj.x,_tile_obj.y,-10,objMine, {
							index: _tile.index,
							tag: _tile.tag,
							description: all_mines[_tile.tag].description
						});
					
						_mine.image_index= _tile.tag;
				}
	
				if(_tile.tile == TILES.ITEM)
				{
					var _is_hidden = _status == TILESTATUS.HIDDEN;
					var _item = instance_create_depth(_tile_obj.x,_tile_obj.y,-10,objItem, {
						index: _tile.index,
						tag: _tile.tag,
						hidden: _is_hidden,
						description: _is_hidden ? "???" : all_items[_tile.tag].description
					});
					_item.image_index = _is_hidden ? 10 : _tile.tag;
					if(_tile.index != -1) find_item(_tile.index, _is_hidden);
				}
			
				if(_tile.mines == 0)
				{
					// Time to uncover tiles
					_tile.object.alarm[0] = 2;
				}
			}
		}
}

function open_adjacent_tiles(row,col){
	
	for(var i=-1; i<2; i++)
	{
		for(var j=-1; j<2; j++)
		{
			if(col + j >= 0 && col + j < objBoard.board_height
			&& row + i < objBoard.board_width && row + i >= 0)
			{
				var _tile = objBoard.board[row + i,col + j];
				if(_tile.tile != TILES.ENEMY) open_tile(row + i,col + j);
			}
		}	
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

function add_to_hold_list(mine){
	var _added = false;
	with(objCombat)
	{
		var _hold_list_length = array_length(hold_list);
		if(_hold_list_length < objRun.board_size)
		{
			array_push(hold_list,
			{
				index: _hold_list_length,
				tag: mine.tag
			});
			_added = true;
		}
	}
	update_lists();
	
	return _added;
}

function find_item(index, hidden){
	with(objCombat)
	{
		array_push(found_list,{index: index, hidden: hidden});
		update_lists();
	}
}

function use_item(index){
	with(objCombat)
	{
		array_push(used_list,index);
		update_lists();
		
		if(array_length(used_list) == min(objRun.max_moves, array_length(objRun.move_bag)))
		{
			reset_board();	
		}
	}
}

function use_mine(index){
	with(objCombat)
	{
		array_push(mine_used_list,index);
		update_lists();
	}
}

function is_found(index){
	if(!instance_exists(objCombat)) return false;
	var _items = objCombat.found_list;
	var _item_count = array_length(_items);
	for(var i = 0; i < _item_count; i++)
	{
		if(_items[i].index == index) {
			return true
		}
	}	
	return false;
}

function is_hidden(index){
	if(!instance_exists(objCombat)) return false;
	var _items = objCombat.found_list;
	var _item_count = array_length(_items);
	for(var i = 0; i < _item_count; i++)
	{
		if(_items[i].index == index && _items[i].hidden) {
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

function is_mine_used(index){
	if(!instance_exists(objCombat)) return false;
	var _items = objCombat.mine_used_list;
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
		update_lists();
	}
}

function update_lists(){
	if(!instance_exists(objCombat)) return false;
	with(objItemUI) instance_destroy();
	update_bag();
	update_found();
	update_mines();
	update_hold();
}
function reset_lists(){
	found_list = [];
	used_list = [];
	mine_list = [];
	hold_list = [];
	mine_used_list = [];
	enemy_list_id = [];
	enemy_list_tag = [];
	update_lists();
}

function update_mines(){
	var _mines = objCombat.mine_list;
	var _mines_count = array_length(_mines);
	objCombat.mines_number = _mines_count;
	if(objRun.minesArea != noone)
	{
		var _startX = objRun.minesArea._topX + 56;
		var _startY = objRun.minesArea._topY + 120;
		var _width = objRun.minesArea._width - 32;
		var _maxW = 5;
		var _distY = 64;
	
		for(var i = 0; i < _mines_count; i++)
		{
			var _tag = _mines[i].tag;
			var _mine = instance_create_depth(_startX + (i mod _maxW)*(_width/_maxW), _startY + floor(i div _maxW)*_distY,0,objItemUI,{
				index: _mines[i].index,
				tag: _tag,
				description: all_mines[_tag].description,
			})
			_mine.image_index = _tag;
			_mine.sprite_index = sprMines;
			_mine.found = true;
			_mine.used = is_mine_used(_mines[i].index);
		}
	}
}
function update_hold(){
	var _mines = objCombat.hold_list;
	var _mines_count = array_length(_mines);
	if(objRun.minesArea != noone)
	{
		var _startX = objRun.minesArea._topX  + 56;
		var _startY = objRun.minesArea._topY  + 120;
		var _width = objRun.minesArea._width - 32;
		var _maxW = 5;
		var _distY = 64;
	
		for(var i = 0; i < _mines_count; i++)
		{
			var _offset = array_length(objCombat.mine_list) + i;
			var _tag = _mines[i].tag;
			var _mine = instance_create_depth(_startX + (_offset mod _maxW)*(_width/_maxW), _startY + floor(_offset div _maxW)*_distY,0,objItemUI,{
				index: _mines[i].index,
				tag: _tag,
				description: all_mines[_tag].description + " (on hold)",
			})
			_mine.image_index =_tag;
			_mine.sprite_index = sprMines;
		}
	}
}

function update_bag(){
	var _items = objRun.move_bag;
	var _item_count = array_length(_items);
	if(objRun.bagArea != noone)
	{
		var _startX = objRun.bagArea._topX + 56;
		var _startY = objRun.bagArea._topY + objRun.bagArea._height/2 + 64;
		var _width = objRun.bagArea._width - 32;
		var _maxW = 5;
		var _distY = 64;
	
		for(var i = 0; i < _item_count; i++)
		{
			var _tag = _items[i].tag;
			var _item = instance_create_depth(_startX + (i mod _maxW)*(_width/_maxW), _startY + floor(i div _maxW)*_distY,0,objItemUI,{
				index: _items[i].index,
				tag: _tag,
				description: all_items[_tag].description,
			})
			_item.image_index = _tag;
			_item.found = is_found(_items[i].index);
			_item.used = is_used(_items[i].index);
		}
	}
}

function update_found(){
	// TODO: Create a list object that takes objects and draws them
	var _items = objRun.move_bag;
	var _item_count = array_length(_items);
	var _found_count = 0;
	
	if(objRun.minesArea != noone)
	{
		var _startX = objRun.minesArea._topX + 48;
		var _startY = objRun.minesArea._topY + objRun.minesArea._height-128;
		var _width = objRun.minesArea._width;
		var _maxW = 5;
		var _distY = 64;
		
		for(var i = 0; i < _item_count; i++)
		{
			if(is_found(_items[i].index))
			{
				var _tag = _items[i].tag;
				var _hidden = is_hidden(_items[i].index)
				var _used = is_used(_items[i].index);
				var _item = instance_create_depth(_startX + (_found_count mod _maxW)*(_width/_maxW), _startY + floor(_found_count div _maxW)*_distY,0,objItemUI,{
					index: _items[i].index,
					hidden: _used ? false : _hidden,
					tag: _tag,
					description: all_items[_tag].description,
				})
				_item.image_index = !_used && _hidden ? 10 : _tag;
				_item.used = _used;
				_item.found = true;
				_found_count++;
			}
		}
	}
	if(instance_exists(objCombat))
	objCombat.found_number = _found_count;
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