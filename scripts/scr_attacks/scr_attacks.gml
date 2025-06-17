function heal_random_enemy(hp){
	if(instance_exists(objCombat) && array_length(objCombat.enemy_list_id) > 0)
	{
		var _enemy = array_get(array_shuffle(objCombat.enemy_list_id),0);
		heal_enemy(_enemy, hp);
	}
}

function steal_items(){
		with(objItem) {
			stolen = true;
			description = "Item stolen!"
			image_index = 11;
		}
}

function heal_enemy(enemy, _hp){
	create_particle(enemy.x,enemy.y+32,4,4);
	with(enemy) target_hp = clamp(hp + _hp,0,max_hp);
}