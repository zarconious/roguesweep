function damage_enemy(args) {
   with(objCombat.selected_enemy)
   {
		current_scale = 0.5;
		target_hp-= args[0]*(1+objRun.str);
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
				target_hp-= args[0]*(1+objRun.str);
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
		
		instance_create_depth(x,y-128,0,objButton);
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
	with(objRun) shield+= args[0]*(1+objRun.str);
}

function add_strength(args){
	create_particle(objPlayer.x,objPlayer.y+32,4,2);
	with(objRun) str+= args[0];
}


function add_health(args){
	create_particle(objPlayer.x,objPlayer.y+32,4,4);
	with(objRun) hp = clamp(hp + args[0],0,max_hp);
}

function get_coins(args){
	create_particle(objPlayer.x,objPlayer.y+32,4,1);
	with(objRun) coins+= args[0];
}

function add_reset(args){
	with(objRun) resets+= args[0];
}

function reset_board(){
	with(objBoard) create_new_board(board_width,board_height);
}

function filter_mines(tile_list){
	
	function mine_filter(element, index)
	{
	    return element.tile == TILES.ENEMY;
	}
	
	return array_filter(tile_list, mine_filter);
}

function reveal_mines(args){
	var _tiles = array_shuffle(filter_mines(get_tiles(1,0)));
	
	var _len = array_length(_tiles);
	var _max_tiles = min(_len,args[0]);
	
	for(var i = 0; i<_max_tiles; i++)
	{
		var _tile = _tiles[i];
		var _object = objBoard.board[_tile.row,_tile.col].object;
		if(_object != noone) _object.magnifier = true;
	}
}

function init_moves(){
	globalvar all_items;
	
	all_items[ITEMS.DMG_Basic] = {move_script: damage_enemy, args: [6], description: "6 DMG to selected enemy", cost: 2}
	
	all_items[ITEMS.DMG_Strong] = {move_script: damage_all, args: [4], description: "4 DMG to all enemies", cost: 4}
	
	all_items[ITEMS.MSC_Reset] = {move_script: add_reset, args: [1], description: "+1 Reset", cost: 8}
	
	all_items[ITEMS.PUP_Shield] = {move_script: add_shield, args: [4], description: "4 Shield to player", cost: 4 }
	
	all_items[ITEMS.PUP_Health] = {move_script: add_health, args: [6], description: "6 HP to player", cost: 6}
	
	all_items[ITEMS.DMG_Bow] = {move_script: damage_enemy, args: [4], description: "4 DMG to selected enemy (free)", cost: 2}
	
	all_items[ITEMS.MSC_Gem] = {move_script: get_coins, args: [5], description: "5 coins", cost: 8}
	
	all_items[ITEMS.PUP_Strength] = {move_script: add_strength, args: [0.25], description: "+0.25 STR", cost: 6}
	
	all_items[ITEMS.MSC_Magnifier] = {move_script: reveal_mines, args: [3], description: "Reveal 3 mines", cost: 8}
	
	all_items[ITEMS.DMG_Boomerang] = {move_script: damage_enemy, args: [4], description: "4 DMG / Returns if empty closed tiles exist", cost: 6}

}

function init_mines(){
	globalvar all_mines;
	
	all_mines[MINES.MINE_Basic] = {move_script: damage_player,args: [10], description: "10 DMG to player"}
		
	all_mines[MINES.MINE_Basic2] = {move_script: damage_player,args: [25], description: "25 DMG to player"}
	
	all_mines[MINES.MINE_Ice] = {move_script: damage_player,args: [15], description: "Freeze player"}
	
	all_mines[MINES.MINE_Poison] = {move_script: damage_player,args: [15], description: "Poison player"}
}