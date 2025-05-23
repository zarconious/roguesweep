function init_enemies(){
	globalvar all_enemies;
	
	//TODO: Make an excel grid with stats
	
	all_enemies[ENEMIES.RAT] = {
		mine: MINES.MINE_Basic, 
		turns: 4, 
		count: 1,
		description: "Mine every 4 turns",
		sprite: sprEnemy3,
		hp: 14,
	}
	
	all_enemies[ENEMIES.BAT] = {
		mine: MINES.MINE_Basic, 
		turns: 2, 
		count: 1,
		description: "Mine every 2 turns",
		sprite: sprEnemy9,
		hp: 8,
	}
	
	all_enemies[ENEMIES.SEAL] = {
		mine: MINES.MINE_Ice,
		count: 1,
		turns: 2, 
		description: "Ice Mine every 2 turns",
		sprite: sprEnemy4,
		hp: 10,
	}
	
	all_enemies[ENEMIES.SNAKE] = {
		mine: MINES.MINE_Poison, 
		count: 1,
		turns: 1, 
		description: "Poison Mine every turn",
		sprite: sprEnemy1,
		hp: 8,
	}
	
	all_enemies[ENEMIES.SHARK] = {
		mine: MINES.MINE_Basic, 
		count: 2,
		turns: 4, 
		description: "2 Mines every 4 turns",
		sprite: sprEnemy5,
		hp: 18,
	}
	all_enemies[ENEMIES.OWL] = {
		mine: MINES.STS_Hide,
		count: 2,
		turns: 1, 
		description: "Hide random tile",
		sprite: sprEnemy10,
		hp: 8,
	}
	all_enemies[ENEMIES.DOG] = {
		mine: MINES.STS_Cover,
		count: 2,
		turns: 1, 
		description: "Cover 3 random tiles",
		sprite: sprEnemy12,
		hp: 10,
	}
	all_enemies[ENEMIES.SCORPION] = {
		mine: MINES.STS_Poison,
		count: 2,
		turns: 1, 
		description: "Poison random tile",
		sprite: sprEnemy8,
		hp: 8,
	}
	all_enemies[ENEMIES.PENGUIN] = {
		mine: MINES.STS_Ice,
		count: 2,
		turns: 1, 
		description: "Ice random tile",
		sprite: sprEnemy7,
		hp: 8,
	}
	all_enemies[ENEMIES.MONKEY] = {
		mine: MINES.STS_Steal, 
		count: 2,
		turns: 2, 
		description: "Steal uncovered item",
		sprite: sprEnemy6,
		hp: 10,
	}
	all_enemies[ENEMIES.DRAGON] = {
		mine: MINES.MINE_Strong,
		count: 2,
		turns: 2, 
		description: "Strong mine every 2 turns",
		sprite: sprEnemy2,
		hp: 14,
	}
	all_enemies[ENEMIES.DOVE] = {
		mine: MINES.STS_Heal, 
		count: 2,
		turns: 2, 
		description: "Heal random enemy",
		sprite: sprEnemy11,
		hp: 8,
	}
}
