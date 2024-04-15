/// @desc 

EnableLive;

draw_set_alpha(image_alpha);
DrawShape(x+random_range(-8,8),y+random_range(-8,8),radius+(1-image_alpha)*20+min(0,wait-5)*2,properties,angle,1);
draw_set_alpha(1);