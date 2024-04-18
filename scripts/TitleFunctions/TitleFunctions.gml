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

function TitleChangeName() {
		
}