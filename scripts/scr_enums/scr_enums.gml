function enums(){
	
	//Damage, Misc, Status, Power Up,
	enum ITEMS {
    DMG_Basic,
	DMG_Strong,
	PUP_Shield,
	MSC_Reset,
	PUP_Health,
	DMG_Bow,
	MSC_Gem,
	PUP_Strength,
	DMG_Boomerang,
	DMG_Poison,
	DMG_Freeze,
	
	}
	
	enum MINES {
    MINE_Basic,
    MINE_Strong,
    MINE_Ice,
    MINE_Poison,
    STS_Ice,
    STS_Poison,
	STS_Cover,
	STS_Hide,
	STS_Steal,
	STS_Fire,
	STS_Heal,
	
	}
	
	enum ENEMIES {
    A1_ENEMY1,
    A1_ENEMY2,
    A1_ENEMY3,
    A1_ENEMY4,
    A1_ENEMY5,
    A1_ENEMY6,
    A1_ENEMY7,
    A1_ENEMY8,
    A1_ENEMY9,
    A1_ENEMY10,
    A1_ENEMY11,
    A1_ENEMY12,
	}
	
	enum TILES {
    EMPTY,
	ENEMY,
	ITEM,
	}
	
	enum TILESTATUS {
    NORMAL,
	ICE,
	HIDDEN,
	POISON,
	BURN,
	MULTI
	}
}

