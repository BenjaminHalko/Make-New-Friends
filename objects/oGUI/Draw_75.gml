/// @desc 

EnableLive;

draw_set_font(fNormal);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);

var _guiX = 150;
draw_text(_guiX, guiY+8, "SCORE:");
draw_text(_guiX, guiY+20, DisplayNumber(global.score, 4));

_guiX += 50;
draw_text(_guiX, guiY+8, "ROUND:");
draw_text(_guiX, guiY+20, global.round);

_guiX += 50;
draw_text(_guiX, guiY+8, "LIVES:");

_guiX += 35;
draw_sprite_ext(sScoreSeparator,0,_guiX,guiY+11,1,22,0,c_white,1);

_guiX += 65;
draw_text(_guiX, guiY+8, "PERSONAL BEST:");
draw_text(_guiX, guiY+20, $"{DisplayNumber(global.pb, 5)} (20/30)");

_guiX += 80;
draw_text(_guiX, guiY+8, "HI-SCORE:");
draw_text(_guiX, guiY+20, DisplayNumber(global.pb, 5));

draw_set_font(fSmall);
draw_text(oShapeSummoner.x, 114, "FRIENDS:");
draw_text(oShapeSummoner.x, 124, $"{global.friendsMade}/{global.friendsNeeded}");

if (startNum % 2 == 1) {
	draw_set_font(fLarge);
	draw_set_valign(fa_middle);
	draw_text(room_width/2, room_height/2, "ROUND START!");
}

if (roundComplete) {
	draw_set_font(fLarge);
	draw_set_valign(fa_middle);
	draw_text(room_width/2, room_height/2-4, $"ROUND {global.round} COMPLETE!");
	draw_set_font(fNormal);
	draw_text(room_width/2, room_height/2+8, $"PRESS ENTER TO CONTINUE");
}