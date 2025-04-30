use_mine(index);
with(objPlayer) event_user(0);
var _move = all_mines[tag];
script_execute(_move.move_script,_move.args)