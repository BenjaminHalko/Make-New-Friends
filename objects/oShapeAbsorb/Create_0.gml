/// @desc 

points = oShapeSummoner.points;
shapePulse = oShapeSummoner.shapePulse;
shapeRadius = oShapeSummoner.shapeRadius;
shapeAngle = oShapeSummoner.shapeAngle;
faceAngle = oShapeSummoner.faceAngle;
faceAngleTarget = oShapeSummoner.faceAngleTarget;
personID = oShapeSummoner.personID;
targetBeat = ceil(global.audioPos);
startBeat = global.audioPos;

properties = variable_clone(global.currentShape, 1);

startPercent = max(0.7, frac(global.audioPos));
percent = (frac(global.audioPos)-startPercent) / (1-startPercent);
shapeX = lerp(x, personID.x, percent);
shapeY = lerp(y, personID.y, percent);
shapeAngle = Wrap(shapeAngle,0,360/properties.sides);

foundFriend = false;
spd = 0;
friendOffsetX = 20;
friendOffsetY = 10;
friendRotation = 0;
