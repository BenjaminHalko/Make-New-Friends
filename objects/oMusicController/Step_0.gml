/// @desc 

global.audioPos = audio_sound_get_track_position(music) / 60 * min(MaxBPM, bpm);
var _tick = global.audioPos % 1;
global.audioTick = (_tick < lastTick);
global.audioBeat = floor(global.audioPos);
lastTick = _tick;

if (keyboard_check_pressed(ord("M")) and (!global.title or oTitle.option != 2)) {
	musicVol = 1-musicVol;
	audio_sound_gain(music, musicVol, 0);
}