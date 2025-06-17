draw_sprite_stretched(sprButton,0,x-128*image_xscale,y-64*image_yscale,256*image_xscale,128*image_yscale);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if(instance_exists(objPlayer))
draw_text(x,y,"Retry");
else
draw_text(x,y,"Play");