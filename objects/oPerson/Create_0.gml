/// @desc 

EnableLive;

name = PickName();
properties = new ShapeProperties();

while(is_undefined(properties.color) and is_undefined(properties.sides)) {
	var i = irandom(3);
	if (global.round == 1)
		i = choose(1,3);
	var _p = global.shapeProperties[i];
	if (!is_undefined(_p.color))
		properties.color = _p.color;
	if (!is_undefined(_p.sides))
		properties.sides = _p.sides;
}

startBeat = global.audioPos;

var _spawnnerYMargin = 20;
WaveSetup(MinSpawnX, MaxSpawnX, _spawnnerYMargin, oShapeSummoner.x+24);

angle = random(360);

normalizedTargetBeat = targetBeat;

if (targetBeat >= global.maxBeats) {
	normalizedTargetBeat -= global.maxBeats;	
}