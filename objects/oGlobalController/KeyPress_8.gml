/// @desc 

if (global.title) {
	if (oTitle.lookAtLeaderboard) {
		audio_play_sound(snBlip, 1, false);
		oTitle.lookAtLeaderboard = false;
	}
} else {
	if (global.score != 0)
		LeaderboardPost();
	ToTitle();	
}