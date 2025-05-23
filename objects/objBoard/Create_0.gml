var _size = irandom_range(4,12);
_size = objRun.board_size;
board_width = _size;
board_height = _size;
item_list = [];

draw_moves = [];
found_items = [];

mine_list = [];
draw_mines = [];

square_size = 21;
max_coins = 5;
board = [];
closedTiles = 0;
openedTiles = [];

is_opening = false;
free_move = false;

create_new_board(board_width,board_height);