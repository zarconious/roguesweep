draw_self();
if(show)
{
	draw_set_font(fnt_small);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_black);
	draw_sprite_stretched(sprGUIMoves,0,mouse_x,mouse_y, max(144, string_length(description)*18), 96);
	draw_set_color(c_white);
	draw_text(mouse_x+24,mouse_y+24, description);	
	draw_set_font(fnt_big);
}
