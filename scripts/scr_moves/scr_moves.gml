function damage_enemy(args) {
   with(objCombat.selected_enemy)
   {
		current_scale = 0.5;
		target_hp-= args[0];
		
   }
}

function damage_all(args) {
	var _enemies = array_length(objCombat.enemy_list_id);
	for (var i = 0; i < _enemies; ++i;)
	{
	    with(objCombat.enemy_list_id[i])
		{
				current_scale = 0.5;
				target_hp-= args[0];
		}
	}
}


function damage_player(args) {
   with(objUI) {
	   if(shield > 0)
	   {
		  var _dmg = args[0];
		 _dmg -= shield;
		 shield -= args[0];
		 if(shield < 0) {shield = 0; hp-= _dmg};
	   }
	   else
	   hp-= args[0];	
   }
}

function add_shield(args){
	with(objUI) shield+= args[0];
}

function add_health(args){
	with(objUI) hp+= args[0];
}

function reset_board(){
	with(objBoard) create_new_board(board_width,board_height);
}

function init_moves(){
	globalvar all_items;
	
	all_items[ITEMS.DMG_Basic] = {move_script: damage_enemy, args: [5], description: "5 DMG to selected enemy"}
	
	all_items[ITEMS.DMG_Strong] = {move_script: damage_all, args: [2], description: "2 DMG to all enemies"}
	
	all_items[ITEMS.MSC_Reset] = {move_script: reset_board, args: [], description: "Resets board"}
	
	all_items[ITEMS.PUP_Shield] = {move_script: add_shield, args: [1], description: "1 Shield to player"}
	
	all_items[ITEMS.PUP_Health] = {move_script: add_health, args: [2], description: "2 HP to player"}
}

function init_mines(){
	globalvar all_mines;
	
	all_mines[MINES.DMG_Mine] = {move_script: damage_player,args: [10], description: "10 DMG to player"}
		
	all_mines[MINES.DMG_Mine_Strong] = {move_script: damage_player,args: [15], description: "15 DMG to player"}
}