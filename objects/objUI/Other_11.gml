instance_destroy(objReset);
instance_destroy(objCombat);
instance_destroy(objBoard);
instance_destroy(objTile);
instance_destroy(objHoverParent);

resets = 3;
shield = 0;

instance_create_depth(room_width/2,room_height-64,0,objReset);
instance_create_depth(room_width/2,room_height/2-100,0,objRun);
instance_create_depth(room_width/2,room_height/3*2 - 50,0,objBoard);