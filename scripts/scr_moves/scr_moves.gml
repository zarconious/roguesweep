function damage_enemy(args) {
   with(objCombat.selected_enemy)
   {
		current_scale = 0.5;
		target_hp-= args[0] + objRun.str;
		create_particle(x,y,4);
   }
}

function damage_all(args) {
	var _enemies = array_length(objCombat.enemy_list_id);
	for (var i = 0; i < _enemies; ++i;)
	{
	    with(objCombat.enemy_list_id[i])
		{
				current_scale = 0.5;
				target_hp-= args[0] + objRun.str;
				create_particle(x,y,4);
		}
	}
}

function kill_player() {
	with(objPlayer){
		dead = true;
		description = "RIP";
		image_index = 2;
		alarm[0] = -1;
	}
}


function damage_player(args) {
   with(objRun) {
	   if(shield > 0)
	   {
		  var _dmg = args[0];
		 _dmg -= shield;
		 shield -= args[0];
		 if(shield < 0) {shield = 0; hp-= _dmg};
	   }
	   else
	   {
		   create_particle(objPlayer.x,objPlayer.y+32,4);
		   hp-= args[0];
		   if(hp<=0) 
		   {
			   hp = 0;
			   kill_player();
		   }
	   }
   }
}

function add_shield(args){
	 create_particle(objPlayer.x,objPlayer.y+32,4,3);
	with(objRun) shield+= args[0];
}

function add_strength(args){
	create_particle(objPlayer.x,objPlayer.y+32,4,2);
	with(objRun) str+= args[0];
}


function add_health(args){
	create_particle(objPlayer.x,objPlayer.y+32,4,4);
	with(objRun) hp+= args[0];
}

function get_coins(args){
	create_particle(objPlayer.x,objPlayer.y+32,4,1);
	with(objRun) coins+= args[0];
}

function reset_board(){
	with(objEnemy) curr_turn = 1;
	with(objBoard) create_new_board(board_width,board_height);
}

function init_moves(){
	globalvar all_items;
	
	all_items[ITEMS.DMG_Basic] = {move_script: damage_enemy, args: [6], description: "5 DMG to selected enemy"}
	
	all_items[ITEMS.DMG_Strong] = {move_script: damage_all, args: [2], description: "2 DMG to all enemies"}
	
	all_items[ITEMS.MSC_Reset] = {move_script: reset_board, args: [], description: "Resets board"}
	
	all_items[ITEMS.PUP_Shield] = {move_script: add_shield, args: [4], description: "4 Shield to player"}
	
	all_items[ITEMS.PUP_Health] = {move_script: add_health, args: [2], description: "2 HP to player"}
	
	all_items[ITEMS.DMG_Bow] = {move_script: damage_enemy, args: [2], description: "2 DMG to selected enemy (free)"}
	
	all_items[ITEMS.MSC_Gem] = {move_script: get_coins, args: [4], description: "5 coins to player"}
	
	all_items[ITEMS.PUP_Strength] = {move_script: add_strength, args: [2], description: "2 STR to player"}

}

function init_mines(){
	globalvar all_mines;
	
	all_mines[MINES.MINE_Basic] = {move_script: damage_player,args: [10], description: "10 DMG to player"}
		
	all_mines[MINES.MINE_Strong] = {move_script: damage_player,args: [15], description: "15 DMG to player"}
	
	all_mines[MINES.MINE_Ice] = {move_script: damage_player,args: [15], description: "Freeze player"}
	
	all_mines[MINES.MINE_Poison] = {move_script: damage_player,args: [15], description: "Poison player"}
}