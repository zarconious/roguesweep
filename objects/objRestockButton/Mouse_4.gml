if(objRun.coins >= objShop.restocks * 5)
{
	objRun.coins -= objShop.restocks * 5;
	instance_destroy(objItemShop);
	instance_destroy(objUpgrade);
	with(objShop) alarm[0] = 1;
}