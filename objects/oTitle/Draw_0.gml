/// @desc 

EnableLive;

if (x != room_width + widthHalf + 50) {
	draw_set_color(c_black);
	draw_set_alpha(0.8);
	draw_roundrect(x-widthHalf, y-heightHalf, x+widthHalf, y+heightHalf, false);
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_roundrect(x-widthHalf, y-heightHalf, x+widthHalf, y+heightHalf, true);
	
	
	if (!lookAtLeaderboard) {
		draw_sprite(sTitle,0,x,y-40);
	} else {
		
	}
	
}