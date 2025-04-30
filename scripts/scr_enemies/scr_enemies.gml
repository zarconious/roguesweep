function init_enemies(){
	globalvar all_enemies;
	
	all_enemies[ENEMIES.A1_ENEMY1] = {
		mine: MINES.MINE_Basic, 
		turns: 2, 
		description: "Mine every 2 turns",
		sprite: sprEnemy3,
		hp: 14,
	}
	
	all_enemies[ENEMIES.A1_ENEMY2] = {
		mine: MINES.MINE_Basic, 
		turns: 1, 
		description: "Mine every turn",
		sprite: sprEnemy9,
		hp: 8,
	}
	
	all_enemies[ENEMIES.A1_ENEMY3] = {
		mine: MINES.MINE_Ice, 
		turns: 2, 
		description: "Ice Mine every 2 turns",
		sprite: sprEnemy4,
		hp: 10,
	}
	
	all_enemies[ENEMIES.A1_ENEMY4] = {
		mine: MINES.MINE_Poison, 
		turns: 1, 
		description: "Poison Mine every turn",
		sprite: sprEnemy1,
		hp: 8,
	}
	
	all_enemies[ENEMIES.A1_ENEMY5] = {
		mine: MINES.MINE_Basic, 
		turns: 1, 
		description: "2 Mines every turn",
		sprite: sprEnemy5,
		hp: 18,
	}
	all_enemies[ENEMIES.A1_ENEMY6] = {
		mine: MINES.STS_Hide, 
		turns: 1, 
		description: "Hide random tile",
		sprite: sprEnemy10,
		hp: 8,
	}
	all_enemies[ENEMIES.A1_ENEMY7] = {
		mine: MINES.STS_Cover, 
		turns: 1, 
		description: "Cover 3 random tiles",
		sprite: sprEnemy12,
		hp: 10,
	}
	all_enemies[ENEMIES.A1_ENEMY8] = {
		mine: MINES.STS_Poison, 
		turns: 1, 
		description: "Poison random tile",
		sprite: sprEnemy8,
		hp: 8,
	}
	all_enemies[ENEMIES.A1_ENEMY9] = {
		mine: MINES.STS_Ice, 
		turns: 1, 
		description: "Ice random tile",
		sprite: sprEnemy7,
		hp: 8,
	}
	all_enemies[ENEMIES.A1_ENEMY10] = {
		mine: MINES.STS_Steal, 
		turns: 2, 
		description: "Steal uncovered item",
		sprite: sprEnemy6,
		hp: 10,
	}
	all_enemies[ENEMIES.A1_ENEMY11] = {
		mine: MINES.MINE_Strong, 
		turns: 2, 
		description: "Strong mine every 2 turns",
		sprite: sprEnemy2,
		hp: 14,
	}
	all_enemies[ENEMIES.A1_ENEMY12] = {
		mine: MINES.STS_Heal, 
		turns: 2, 
		description: "Heal random enemy",
		sprite: sprEnemy11,
		hp: 8,
	}
}
