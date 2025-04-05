function enums(){
	
	//Damage, Misc, Status, Power Up,
	enum ITEMS {
    DMG_Basic,
	DMG_Strong,
	PUP_Shield,
	MSC_Reset,
	PUP_Health,

	DMG_Poison,
	DMG_Freeze,
	PUP_Strength,
	}
	
	enum MINES {
    DMG_Mine,
    DMG_Mine_Strong,
	}
	
	enum ENEMIES {
    A1_ENEMY1,
    A1_ENEMY2,
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

