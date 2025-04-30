
draw_set_font(fnt_big);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_orange);
draw_text(x,y+80,string(cost) + " $");
draw_set_color(c_white);

event_inherited();