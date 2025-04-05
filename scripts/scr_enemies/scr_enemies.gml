function init_enemies(){
	globalvar all_enemies;
	
	all_enemies[ENEMIES.A1_ENEMY1] = {
		mine: MINES.DMG_Mine, 
		turns: 2, 
		description: "Mine every 4 turns",
		sprite: sprEnemy1,
		hp: 25,
	}
	
	all_enemies[ENEMIES.A1_ENEMY2] = {
		mine: MINES.DMG_Mine_Strong, 
		turns: 0, 
		description: "Strong mine every 2 turns",
		sprite: sprEnemy2,
		hp: 40,
	}
}
