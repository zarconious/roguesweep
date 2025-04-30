image_angle+= rot;

scale = lerp(scale,0,0.05);
if(scale <= 0.4) instance_destroy();

image_xscale = scale;
image_yscale = scale;
