/// @desc 

if (!score_chasers) {
	if (keyboard_check_pressed(vk_tab)) {
		score_chasers_timer += 60;
		if (score_chasers_timer > 60) {
			FirebaseRealTime(FIREBASE_LEADERBOARD_URL).ListenerRemove(listener);
			listener = FirebaseRealTime(FIREBASE_LEADERBOARD_URL).Path("/scorechasers/").Listener();
			scores = [];
			global.highscore = 0;
			score_chasers = true;
			audio_play_sound(snFriend, 1, false);
		}
	}
	score_chasers_timer--;
}