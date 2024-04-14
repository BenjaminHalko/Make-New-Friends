/// @desc 

EnableLive;

var _beat = global.audioPos;
if (_beat < startBeat) {
	_beat += global.maxBeats;
}

var _points = WaveGetPoint(ValuePercent(_beat, startBeat, targetBeat));
x = _points.x;
y = _points.y;

angle += 2;

if (_beat >= targetBeat) {
	with(oShapeSummoner) {
		if (hasShape) {
			hasShape = false;
			if (worried) {
				instance_create_depth(x,y,depth-1,oShapeExplode);
			}
			global.currentShape.sides = 0;
			global.currentShape.color = c_white;
		}
	}
	instance_destroy();
}

if (irandom(1) == 0)
	PulseShape(x+random_range(-12,12),y+random_range(-12,12),properties.sides,4,angle,properties.color);