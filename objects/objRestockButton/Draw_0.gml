draw_sprite_stretched(sprButton,0,x-128*image_xscale,y-64*image_yscale,256*image_xscale,128*image_yscale);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_big);
draw_text(x,y,"Restock");

draw_set_font(fnt_big);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_orange);
draw_text(x,y-72,string(objShop.restocks * 5) + " $");