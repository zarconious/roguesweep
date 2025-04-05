draw_set_halign(fa_left);
draw_set_font(fnt_big);
draw_set_color(c_white);

draw_text(96,64, "ROUND " + string(round_number));
draw_text(96,64*2,"TURNS " + string(objCombat.turn));

draw_sprite(sprUI, 0, 128, room_height - 128);
draw_sprite(sprUI, 1, 128, room_height - 128*2);
draw_sprite(sprUI, 2, 128, room_height - 128*3);
draw_sprite(sprUI, 3, 128, room_height - 128*4);

draw_set_color(c_orange);
draw_text(200, room_height - 128*4, string(coins));
draw_set_color(c_fuchsia);
draw_text(200, room_height - 128*3, string(strength));
draw_set_color(c_aqua);
draw_text(200, room_height - 128*2, string(shield));
draw_set_color(c_black);
if(hp<=0) draw_set_color(c_red);
draw_text(200, room_height - 128, string(hp) + " / " + string(max_hp));
draw_set_font(fnt_small);