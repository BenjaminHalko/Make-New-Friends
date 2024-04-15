/// @desc 

EnableLive;

if (!global.inGame and oGUI.startNum < 6) exit;

if (global.audioTick and global.audioBeat % 4 == 0) {
	global.offBeatChance = array_shuffle(global.offBeatChance);
}

if (global.audioTick) {
	var _create = false;
	if (global.score > 300) {
		if (global.audioBeat % 2 == 0 or (global.audioBeat % 2 == 0 and (global.secondBeatChance == 0 or ((global.secondBeatChance < 1 ? irandom(1/global.secondBeatChance) == 0 : irandom(global.secondBeatChance) != 0)))) or (global.audioBeat % 2 == 1 and global.offBeatChance[global.audioBeat % 4 != 1] != 0 and irandom(global.offBeatChance[global.audioBeat % 4 != 1]-1) == 0))
			_create = true;
	} else {
		if (global.audioBeat % 4 == 0 or (global.audioBeat % 2 == 0 and global.score > 0 and irandom(2 - global.score / 100) == 0))
			_create = true;
	}
	if (_create)
		instance_create_layer(irandom_range(MinSpawnX, MaxSpawnX),room_height+random(40),layer,oPerson,{targetBeat: global.audioBeat + 6});	
}