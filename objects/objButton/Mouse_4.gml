
if(instance_exists(objPlayer))
game_restart()
else
{
	init_moves();
	init_mines();
	init_enemies();

	instance_create_depth(room_width/2,room_height/3*2,0,objRun);

	instance_destroy();
}