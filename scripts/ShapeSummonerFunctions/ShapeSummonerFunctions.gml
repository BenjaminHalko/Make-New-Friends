function SummonShape() {
	EnableLive;
	with(oShapeSummoner) {
		if (hasShape and shapeRadius > 0.8) {
			instance_create_depth(x,y,depth-1,oShapeExplode, {wait: 0});
			instance_create_layer(x+48,y-8,"GUI",oPoints,{points: -50});
		}
		shapeRadius = 0;
		hasShape = true;
		pulse = 1;
		if (instance_exists(oShapeAbsorb))
			points = 100;
		else {
			var _nextBeat = infinity;
			with(oPerson) {
				_nextBeat = min(_nextBeat, targetBeat);
			}
			points = round(min(100, ValuePercent(global.audioPos, _nextBeat, lerp(max(_nextBeat-3, lastShapeBeat), _nextBeat, 0.25)) * 100));
		}
	}
}

enum FACE {
	Friend,
	Dead,
	Worried
}