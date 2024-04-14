/// @desc 

bpm = 130;
global.audioTick = false;
global.audioBeat = 0;
global.audioPos = 0;
music = audio_play_sound(mMusic, 1, true);
lastTick = 0;
lastBar = 0;