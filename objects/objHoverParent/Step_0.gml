show = position_meeting(mouse_x, mouse_y, id) && image_alpha > 0;
depth = show ? -100 : -10;

if(show)
current_scale += 0.1;

if(is_animating)
{
	x = lerp(x,target_x,animation_speed);	
	y = lerp(y,target_y,animation_speed);	
	current_scale = lerp(current_scale,target_scale,animation_speed);	
	current_xscale = lerp(current_xscale,target_xscale,animation_speed);	
	current_yscale = lerp(current_yscale,target_yscale,animation_speed);	
	image_xscale = current_xscale + current_scale;
	image_yscale = current_yscale + current_scale;
	image_angle = lerp(image_angle,target_angle,animation_speed);	
}
