/// @desc 

bpm = 130;
global.audioTick = false;
global.audioBeat = 0;
global.audioPos = 0;
music = audio_play_sound(mMusic, 1, true);
global.maxBeats = audio_sound_length(music) / 60 * bpm;
lastTick = 0;