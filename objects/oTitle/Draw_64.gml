/// @desc 

if (x != room_width + widthHalf + 50) {
	if (!lookAtLeaderboard) {
		if (!editUsername) {
			draw_set_font(fLarge);
			draw_set_color(c_white);
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
		
			var _titleY = -36;
			draw_sprite_ext(sFriend, FACE.Friend, x-74, y+_titleY-15,0.7+0.3*titlePulse[0],0.7+0.3*titlePulse[0],lerp(0, -10, sin(-global.audioPos * pi)),c_white,1);
			draw_sprite_ext(sFriend, FACE.Friend, x+18, y+_titleY+20,-0.7-0.3*titlePulse[1],0.7+0.3*titlePulse[1],lerp(-35, -45, sin(-global.audioPos * pi)),c_white,1);
		
			if (!MOBILE) {
				var _menuX = x - 34;
				var _menuY = y + 8;
		
				draw_text(_menuX - 10, _menuY + 16 * option + 8 * (option == 3), ">");
				draw_text(_menuX, _menuY, "START");
		
				_menuY += 16;
				draw_text(_menuX, _menuY, "LEADERBOARD");
		
				_menuY += 16;
				draw_set_color(merge_color(c_white, c_red, usernameFlash));
				draw_text(_menuX+random_range(-2,2)*usernameFlash, _menuY+random_range(-2,2)*usernameFlash, "USERNAME");
				draw_set_color(c_white);
		
				_menuY += 5;
				var _username = global.username;
				draw_set_font(fNormal);
				if (blink and option == 2) _username += "_";
				if (global.username == "") {
					draw_set_color(c_dkgray);
					draw_text(_menuX+16, _menuY, "ENTER USERNAME");
					draw_set_color(c_white);
				}
				draw_text(_menuX + 16, _menuY, _username);
	
				_menuY += 22;
				draw_sprite(sAudioLine,0,_menuX,_menuY);
				draw_sprite(sAudioLine,1,_menuX+round(60 * global.audioVol),_menuY);
				draw_sprite(sAudio,0,_menuX+62,_menuY);
			} else {
				buttonStart.draw();
				buttonLeaderboard.draw();
				buttonUsername.draw();
			}
		} else {
			draw_set_font(fLarge);
			draw_set_color(c_white);
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			if (global.username == "") {
				draw_set_color(c_dkgray);
				draw_text_transformed(x, y-60, "USERNAME",2,2,0);
			} else {
				draw_text_transformed(x, y-60, global.username,2,2,0);	
			}
		}
	} else {
		draw_set_font(fLarge);
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		draw_set_color(c_white);
	
		var _x = x-widthHalf+20;
		var _y = y-heightHalf+12;
		
		if (heightHalf != 80) {
			draw_text(x,_y,"GAME OVER!");
			if (global.showLeaderboardNames) {
				draw_set_font(fNormal);
				draw_text(x,_y+8,$"You failed to find a friend for {diedTo}");
				draw_set_font(fLarge);
			}
			_y += 28;
		}
	
		draw_text(_x+12, _y, "PLACE");
		draw_text(_x+84, _y, "NAME");
		draw_text(_x+162, _y, "SCORE");
		draw_text(_x+212, _y, "ROUND");
	
		draw_set_halign(fa_left);
	
		for(var i = max(0, scoreOffsetTarget-1); i < min(array_length(oLeaderboardAPI.scores), scoreOffsetTarget+scoresPerPage+1); i++) {
			draw_set_color((oLeaderboardAPI.scores[i].name == global.username) ? c_yellow : c_white);
			draw_set_alpha(1 - median(0, 1, abs((i - scoreOffset) - 4.5) - 4.5));
			var _scoreY = _y + (i - scoreOffset) * 9 + 20;
		
			var _place = string(i + 1);
			if ((i+1) % 10 == 1 and (i+1) % 100 != 11) _place += "st";
			else if ((i+1) % 10 == 2 and (i+1) % 100 != 12) _place += "nd";
			else if ((i+1) % 10 == 3 and (i+1) % 100 != 13) _place += "rd";
			else _place += "th";
		
			draw_text(_x-8, _scoreY, _place);
			draw_text(_x+44, _scoreY, oLeaderboardAPI.scores[i].name);
			draw_text(_x+142, _scoreY, oLeaderboardAPI.scores[i].points);
			draw_text(_x+208, _scoreY, oLeaderboardAPI.scores[i].level);
		}
		draw_set_alpha(1);
	
		if (scoreOffsetTarget != 0) {
			draw_sprite(sArrowLeaderboard, 0, x, _y+16);	
		}
	
		if (scoreOffsetTarget < array_length(oLeaderboardAPI.scores)-scoresPerPage) {
			draw_sprite_ext(sArrowLeaderboard, 0, x, _y+112, 1, -1, 0, c_white, 1);	
		}
	
		draw_set_color(c_dkgray);
		draw_set_halign(fa_center);
		if (!MOBILE)
			draw_text(x,_y+124,"PRESS ENTER TO");
		else
			draw_text(x,_y+124,"TAP ANYWHERE TO");
		draw_text(x,_y+133,"CONTINUE");	
	}
} 