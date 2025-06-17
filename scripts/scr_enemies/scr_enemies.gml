function init_enemies(){
	globalvar all_enemies;
	
	//TODO: Make an excel grid with stats
	
	all_enemies[ENEMIES.RAT] = {
		mine: MINES.MINE_Basic, 
		turns: 4, 
		count: 1,
		description: "Mine every 4 turns",
		sprite: sprEMouse,
		hp: 14,
		rank: 1,
		refresh_mine: MINES.MINE_Basic, 
		refresh_count: 1
	}
	
	all_enemies[ENEMIES.BAT] = {
		mine: MINES.MINE_Basic, 
		turns: 2, 
		count: 1,
		description: "Mine every 2 turns",
		sprite: sprEBat,
		hp: 8,
		rank: 1,
		refresh_mine: MINES.MINE_Basic, 
		refresh_count: 1
	}
	
	all_enemies[ENEMIES.SEAL] = {
		mine: MINES.STS_Ice,
		count: 1,
		turns: 2, 
		description: "Ice tile every 2 turns",
		sprite: sprEnemy4,
		hp: 10,
		rank: 1,
		refresh_mine: MINES.MINE_Ice, 
		refresh_count: 1
	}
	
	all_enemies[ENEMIES.SNAKE] = {
		mine: MINES.STS_Poison, 
		count: 2,
		turns: 2, 
		description: "Poison 2 random tiles every 2 turns",
		sprite: sprEnemy1,
		hp: 8,
		rank: 1,
		refresh_mine: MINES.MINE_Poison, 
		refresh_count: 1
	}
	
	all_enemies[ENEMIES.SHARK] = {
		mine: MINES.MINE_Basic, 
		count: 2,
		turns: 3, 
		description: "2 Mines every 3 turns",
		sprite: sprEShark,
		hp: 18,
		rank: 2,
		refresh_mine: MINES.MINE_Basic, 
		refresh_count: 2
	}
	all_enemies[ENEMIES.OWL] = {
		mine: MINES.STS_Hide,
		count: 6,
		turns: 2, 
		description: "Hide 2 random tiles every 2 turns",
		sprite: sprEnemy10,
		hp: 8,
		rank: 1,
		refresh_mine: MINES.MINE_Basic, 
		refresh_count: 1
	}
	all_enemies[ENEMIES.DOG] = {
		mine: MINES.STS_Cover,
		count: 2,
		turns: 1, 
		description: "Cover 3 random tiles",
		sprite: sprEnemy12,
		hp: 10,
		rank: 1,
		refresh_mine: MINES.MINE_Basic, 
		refresh_count: 1
	}
	all_enemies[ENEMIES.SCORPION] = {
		mine: MINES.STS_Poison,
		count: 2,
		turns: 2, 
		description: "Poison 2 random tiles every 2 turns",
		sprite: sprEnemy8,
		hp: 8,
		rank: 2,
		refresh_mine: MINES.MINE_Poison, 
		refresh_count: 2
	}
	all_enemies[ENEMIES.PENGUIN] = {
		mine: MINES.STS_Ice,
		count: 2,
		turns: 3, 
		description: "Ice 2 random tiles every 3 turns",
		sprite: sprEPenguin,
		hp: 8,
		rank: 2,
		refresh_mine: MINES.MINE_Ice, 
		refresh_count: 2
	}
	all_enemies[ENEMIES.MONKEY] = {
		mine: MINES.MSC_Steal, 
		count: 2,
		turns: 4, 
		description: "Steal uncovered item",
		sprite: sprEnemy6,
		hp: 10,
		rank: 1,
		refresh_mine: MINES.MINE_Basic, 
		refresh_count: 1
	}
	all_enemies[ENEMIES.DRAGON] = {
		mine: MINES.MINE_Basic2,
		count: 2,
		turns: 2, 
		description: "Strong mine every 2 turns",
		sprite: sprEnemy2,
		hp: 14,
		rank: 2,
		refresh_mine: MINES.MINE_Fire, 
		refresh_count: 1
	}
	all_enemies[ENEMIES.DOVE] = {
		mine: MINES.MSC_Heal, 
		count: 2,
		turns: 4, 
		description: "Heal random enemy",
		sprite: sprEnemy11,
		hp: 8,
		rank: 1,
		refresh_mine: MINES.MINE_Basic, 
		refresh_count: 1
	}
}
