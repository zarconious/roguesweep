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

