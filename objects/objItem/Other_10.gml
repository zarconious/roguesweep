var _move = all_items[tag];
use_item(index);
next_turn();

script_execute(_move.move_script,_move.args)
instance_destroy();