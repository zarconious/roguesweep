if(objRun.resets == 0)
image_alpha = 0.5;
else
image_alpha = 1;


for(var i = objRun.resets - 1; i>0; i--)
{
	draw_sprite_ext(sprite_index,0,x,y+i*10,image_xscale, image_yscale,0,c_white,image_alpha);	
}

event_inherited();


