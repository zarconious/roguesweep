draw_self();
if(show)
{
	draw_set_font(fnt_small);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_black);
	draw_rectangle(mouse_x - string_length(description)*5,mouse_y - 8, mouse_x + string_length(description)*5, mouse_y+8,-1);
	draw_set_color(c_white);
	draw_text(mouse_x,mouse_y, description);	
	draw_set_font(fnt_big);
}
