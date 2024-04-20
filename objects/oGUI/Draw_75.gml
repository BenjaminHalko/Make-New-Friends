/// @desc 

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
if (global.leaderboardPos == -1)
	draw_text(_guiX, guiY+20, $"{DisplayNumber(global.pb, 5)}");
else {
	var _place = string(global.leaderboardPos + 1);
	if ((global.leaderboardPos+1) % 10 == 1 and (global.leaderboardPos+1) % 100 != 11) _place += "st";
	else if ((global.leaderboardPos+1) % 10 == 2 and (global.leaderboardPos+1) % 100 != 12) _place += "nd";
	else if ((global.leaderboardPos+1) % 10 == 3 and (global.leaderboardPos+1) % 100 != 13) _place += "rd";
	else _place += "th";
	draw_text(_guiX, guiY+20, $"{DisplayNumber(global.pb, 5)} - {_place}");
}

_guiX += 80;
draw_text(_guiX, guiY+8, "HI-SCORE:");
draw_text(_guiX, guiY+20, DisplayNumber(global.highscore, 5));

draw_set_font(fSmall);
draw_text(oShapeSummoner.x, 114, "FRIENDS:");
draw_text(oShapeSummoner.x, 124, $"{global.friendsMade}/{global.friendsNeeded}");

if (startNum % 2 == 1) {
	draw_set_font(fLarge);
	draw_set_valign(fa_middle);
	draw_text(room_width/2+45, room_height/2-18, "ROUND START!");
}

if (roundComplete) {
	draw_set_font(fLarge);
	draw_set_valign(fa_middle);
	draw_text(room_width/2+45, room_height/2-30-8*addedHeart, $"ROUND {global.round-1} COMPLETE!");
	draw_set_font(fNormal);
	if (addedHeart) {
		draw_text(room_width/2+45, room_height/2-25, $"+{global.friendsNeeded*100} POINTS");
		draw_text(room_width/2+38, room_height/2-13, $"+");
	} else
		draw_text(room_width/2+45, room_height/2-18, $"+{global.friendsNeeded*100} POINTS");
	draw_text(room_width/2+45, room_height/2+12, MOBILE ? "TAP TO CONTINUE" : "PRESS ENTER TO CONTINUE");
}