/// @desc 

if (!global.stars) exit;

draw_set_color(c_white);

for(var i = 0; i < particleCount; i++) {
	if (particles[i].x < room_width and particles[i].y < room_height)
		draw_sprite_ext(sWaveParticle,0,particles[i].x,particles[i].y,1,1,random(360),c_white,1);
}