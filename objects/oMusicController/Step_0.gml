/// @desc 

global.audioPos = audio_sound_get_track_position(music) / 60 * bpm;
var _tick = global.audioPos % 1;
global.audioTick = (_tick < lastTick);
global.audioBeat = floor(global.audioPos);
lastTick = _tick;
lastBar = global.audioBeat;