if(objCombat.player_turn && !objPlayer.dead)
{
	if(tag == ITEMS.DMG_Bow)
	objBoard.free_move = true;
	
	if(tag == ITEMS.DMG_Boomerang)
	add_item({tag: tag, index: -1}, TILES.ITEM, 1, 1);
	
	var _move = all_items[tag];
	if(index != -1) use_item(index);
	
	with(objPlayer) current_scale = 0.5;
	
	script_execute(_move.move_script,_move.args);
	objBoard.alarm[0] = step_interval;
	instance_destroy();
}