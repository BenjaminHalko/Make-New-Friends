/// @desc 

EnableLive;

var _points = WaveGetPoint(ValuePercent(global.audioPos, startBeat, targetBeat));
x = _points.x;
y = _points.y;

if (global.audioPos >= targetBeat)
	instance_destroy();