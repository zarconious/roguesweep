draw_set_valign(fa_middle)
draw_set_halign(fa_center)

if(objUI.resets == 0)
draw_set_alpha(0.2);
draw_self();
draw_set_alpha(1);
draw_set_color(c_white);
draw_text(x,y,"Refresh (x" + string(objUI.resets) + ")");