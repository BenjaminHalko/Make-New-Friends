/// @desc 

bpm = 130;
global.audioTick = false;
global.audioBeat = 0;
global.audioPos = 0;
music = audio_play_sound(mMusic, 1, true);
global.maxBeats = round(audio_sound_length(music) / 60 * bpm);
audio_sound_set_track_position(music, audio_sound_length(music)-10);
lastTick = 0;