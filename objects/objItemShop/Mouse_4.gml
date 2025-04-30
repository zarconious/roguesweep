if(objRun.coins >= cost)
{
	objRun.coins-=cost;
	add_to_bag(tag);
	instance_destroy();
}