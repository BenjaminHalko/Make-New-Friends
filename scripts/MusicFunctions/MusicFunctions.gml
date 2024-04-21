function ChangeBPM(_bpm) {
	with(oMusicController) {
		if (_bpm == bpm)
			break;
	
		var _music = mMusic;
		if (_bpm == 130) {
			_music = mMusic;
		} else {
			_music = mMusicFaster;
		}
		
		if (bpm < 140 or _bpm < 140) {
			var _trackPercent = audio_sound_get_track_position(music) * bpm / _bpm;
			audio_stop_sound(music);
			music = audio_play_sound(_music, 1, true, 1, _trackPercent);
		}
		
		if (_bpm >= 140) {
			audio_sound_pitch(music, _bpm / 140);
		}
		
		bpm = _bpm;
	}
}