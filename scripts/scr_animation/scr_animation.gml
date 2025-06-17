function sine_wave(time, period, amplitude, midpoint) {
    return sin(time * 2 * pi / period) * amplitude + midpoint;
}

function sine_between(time, period, minimum, maximum) {
    var midpoint = mean(minimum, maximum);
    var amplitude = maximum - midpoint;
    return sine_wave(time, period, amplitude, midpoint);
}


function create_particle(xx,yy, number, type = 0) {
	repeat(number)
	{
		var _part = instance_create_depth(xx,yy-32,-100,objParticle);
		_part.image_index = type;
	}
}

function draw_hp(xx,yy,width,height,hp,maxhp,color = make_color_rgb(237,80,80), show_max = true) {
	
	var _border = 4;
	
	draw_set_color(c_black);
	draw_rectangle(xx,yy,xx+width,yy+height,false);
	draw_set_color(color);
	var _hp_start = map_value(clamp(hp,0,maxhp),0,maxhp,xx+width-_border,xx+_border);
	draw_rectangle(_hp_start,yy+_border,xx+width-_border,yy+height-_border,false);
	draw_set_font(fnt_big);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	if(show_max)
	draw_text(xx+width/2, yy+height/2, string(floor(hp)) + "/" + string(maxhp));
	else
	draw_text(xx+width/2, yy+height/2, string(floor(hp)));
	
}





