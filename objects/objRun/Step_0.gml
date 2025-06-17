if(curr_hp>0)
curr_hp = lerp(curr_hp,hp,0.2);

if(shield>0)
curr_shield = lerp(curr_shield,shield,0.2);

if(background_size != background_size_goal)
background_size = lerp(background_size,background_size_goal,0.2);

curr_coins = lerp(curr_coins,coins,0.2);
curr_str = lerp(curr_str,str,0.2);