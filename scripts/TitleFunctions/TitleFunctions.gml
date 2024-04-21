function TitleStart() {
	if (global.username != "") {
		with(oMusicController) {
			if !audio_is_playing(music) {
				music = audio_play_sound(mMusic, 1, true);
			}
		}
		ToGame();
	} else {
		usernameFlash = 1;
			audio_play_sound(snBlip,2,false);
	}	
}

function TitleGotoLeaderboard() {
	GotoLeaderboard();
	audio_play_sound(snBlip,2,false);	
}

function TitleToggleRender() {
	global.render = !global.render;
	Save("settings", "render", global.render);
	audio_play_sound(snBlip, 1, false);
}

function TitleToggleStars() {
	global.stars = !global.stars;
	Save("settings", "stars", global.stars);
	audio_play_sound(snBlip, 1, false);
}

function TitleToggleGamepad() {
	global.gamepad = !global.gamepad;
	Save("settings", "gamepad", global.gamepad);
	audio_play_sound(snBlip, 1, false);
}