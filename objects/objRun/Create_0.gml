

// Player stats
current_event = "battle" //"shop"
current_turn = 0;
hp = 30;
shield = 0;
str = 0;
coins = 0;
current_round = 1;
max_moves = 2;
max_hp = 30;
curr_hp = max_hp;
curr_shield = shield;
curr_coins = shield;
curr_str = shield;
board_size = 4;
max_coins = board_size;
max_resets = 2;
resets = max_resets;

//TODO Change according to run
move_bag = [];
movesArea = noone;
bagArea = noone;
minesArea = noone;
badgesArea = noone;

add_to_bag(ITEMS.DMG_Basic);
add_to_bag(ITEMS.DMG_Basic);
add_to_bag(ITEMS.DMG_Strong);
add_to_bag(ITEMS.PUP_Shield);

update_lists();

instance_create_depth(0,0,0,obj_flexpanel);
instance_create_depth(x,y,0,objCombat)
instance_create_depth(room_width/2,room_height-72,0,objPlayer)

