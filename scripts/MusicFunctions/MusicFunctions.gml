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
		
		if (bpm < MaxBPM or _bpm < MaxBPM) {
			var _trackPercent = audio_sound_get_track_position(music) * min(MaxBPM, bpm) / min(MaxBPM, _bpm);
			audio_stop_sound(music);
			music = audio_play_sound(_music, 1, true, musicVol, _trackPercent);
		}
		
		if (_bpm >= MaxBPM) {
			audio_sound_pitch(music, _bpm / MaxBPM);
		}
		
		bpm = _bpm;
	}
}