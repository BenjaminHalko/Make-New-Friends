/// @desc 

if (x != room_width + widthHalf + 50) {
	draw_set_color(c_black);
	draw_set_alpha(0.8);
	draw_roundrect(x-widthHalf, y-heightHalf, x+widthHalf, y+heightHalf, false);
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_roundrect(x-widthHalf, y-heightHalf, x+widthHalf, y+heightHalf, true);
	
	
	if (!lookAtLeaderboard) {
		var _titleY = -36;
		draw_sprite(sTitle,0,x,y+_titleY);
		draw_set_color(merge_color(#FF2055, c_white, titlePulse[0]*0.8));
		DrawPolygon(x - 74, y+_titleY-15, lerp(18, 24, titlePulse[0]), 3, 90);
		draw_set_color(merge_color(#38df88, c_white, titlePulse[1]*0.8));
		DrawPolygon(x + 18, y+_titleY+20, lerp(18, 24, titlePulse[1]), 4, 45);
	}
}