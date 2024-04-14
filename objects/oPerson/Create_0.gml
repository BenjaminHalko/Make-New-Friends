/// @desc 

MinSpawnX = 160;
MaxSpawnX = room_width+50;

EnableLive;

properties = new ShapeProperties(3, c_lime);

startBeat = global.audioPos;

var _spawnnerYMargin = 30;
WaveSetup(MinSpawnX, MaxSpawnX, _spawnnerYMargin, oShapeSummoner.x+32);