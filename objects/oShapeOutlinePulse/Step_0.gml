/// @desc 

image_angle -= 2;

multiplier += 0.02;
if (--wait <= 0)
	image_alpha -= 0.1;
if (image_alpha <= 0)
	instance_destroy();