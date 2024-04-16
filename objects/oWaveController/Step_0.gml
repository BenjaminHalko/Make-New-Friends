/// @desc 

if (!global.inGame and oGUI.startNum < 6) exit;

if (global.audioTick and global.audioBeat % 4 == 0) {
	global.offBeatChance = array_shuffle(global.offBeatChance,0,2);
}

if (global.audioTick) {
	var _create = false;
	var _beat = (global.audioBeat + global.beatOffset);
	if (global.score > 200) {
		if (_beat % 2 == 0 or (_beat % 2 == 1 and global.offBeatChance[_beat % 4 != 1] != 0 and irandom(global.offBeatChance[_beat % 4 != 1]-1) == 0))
			_create = true;
	} else {
		if (_beat % 4 == 0 or (_beat % 2 == 0 and global.score > 0 and irandom(2 - global.score / 100) == 0))
			_create = true;
	}
	if (_create) {
		created++;
		instance_create_layer(irandom_range(MinSpawnX, MaxSpawnX),room_height+random(50)+global.startOffset,layer,oPerson,{targetBeat: _beat});	
	}
}