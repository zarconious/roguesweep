centerX = room_width/2;
centerY = room_height/2;
gapX = 0.025;
gapY = 0.05;
colW = 0.2;
colH = 0.5;
rowH = 0.2;

instance_create_depth(centerX, centerY - room_height * colH/2 -  room_height * rowH/2, 0, objUIpanel,
{
	name: "enemies",
	width: colW*4 + gapX*2,
	height: rowH
});

instance_create_depth(centerX, centerY, 0, objUIpanel,
{
	name: "board",
	width: colW*2,
	height: colH
});

instance_create_depth(centerX - room_width * colW - room_width * colW/2 - room_width * gapX, centerY, 0, objUIpanel,
{
	name: "inventory",
	width: colW,
	height: colH
});
	
instance_create_depth(centerX + room_width * colW + room_width * colW/2 + room_width * gapX, centerY, 0, objUIpanel,
{
	name: "traps",
	width: colW,
	height: colH
});

instance_create_depth(centerX - room_width * colW - room_width * colW/2 - room_width * gapX, centerY + room_height * colH/2 +  room_height * rowH/2, 0, objUIpanel,
{
	name: "menu",
	width: colW,
	height: rowH
});
	
instance_create_depth(centerX + room_width * colW + room_width * colW/2 + room_width * gapX, centerY + room_height * colH/2 +  room_height * rowH/2, 0, objUIpanel,
{
	name: "moves",
	width: colW,
	height: rowH
});
	
instance_create_depth(centerX, centerY + room_height * colH/2 +  room_height * rowH/2, 0, objUIpanel,
{
	name: "stats",
	width: colW*2,
	height: rowH
})

