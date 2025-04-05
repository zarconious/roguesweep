// Inherit the parent event
event_inherited();

if(miss > 0)
miss--;

if(hp>0)
{
	image_angle = sine_wave(current_time / 1000, 1, 15, 0);

	hp = lerp(hp,target_hp,animation_speed);	
}
else
{
	if(!dead)
	{
		hp = 0;
		dead = true;
		kill_enemy(id);
	}
}