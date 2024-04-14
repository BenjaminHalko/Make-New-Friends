/// @desc 


percent += 0.005;
if (percent > 1)
	instance_destroy();

var _pos = WaveGetPoint(percent, false);
x = _pos.x;
y = _pos.y;