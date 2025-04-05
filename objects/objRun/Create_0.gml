current_event = "battle" //"shop"
current_round = 1;

coins = 0;
resets = 3;
max_moves = 2;
max_coins = 5;

//TODO Change according to run
move_bag = [];

add_to_bag(ITEMS.DMG_Basic);
add_to_bag(ITEMS.DMG_Basic);
add_to_bag(ITEMS.DMG_Basic);
add_to_bag(ITEMS.DMG_Strong);
add_to_bag(ITEMS.PUP_Shield);
add_to_bag(ITEMS.MSC_Reset);

update_lists();

instance_create_depth(x,y,0,objCombat)