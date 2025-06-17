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
	MSC_Magnifier,
	DMG_Poison,
	DMG_Freeze,
	
	}
	
	enum MINES {
    MINE_Basic,
    MINE_Basic2,
    MINE_Basic3,
    MINE_Ice,
    MINE_Ice2,
    MINE_Ice3,
    MINE_Poison,
    MINE_Poison2,
    MINE_Poison3,
    MINE_Fire,
    MINE_Fire2,
    MINE_Fire3,
    MINE_Hide,
    MINE_Hide2,
    MINE_Hide3,
    STS_Ice,
    STS_Poison,
	STS_Cover,
	STS_Hide,
	STS_Fire,
	MSC_Heal,
	MSC_Steal,
	
	}
	
	enum ENEMIES {
    RAT,
    BAT,
    SEAL,
    SNAKE,
    SHARK,
    OWL,
    DOG,
    SCORPION,
    PENGUIN,
    MONKEY,
    DRAGON,
    DOVE,
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

