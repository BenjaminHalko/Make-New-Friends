/// @desc 

EnableLive;

DrawShape(shapeX, shapeY, lerp(56 * shapeRadius + shapePulse * 10, 40, percent), properties, shapeAngle);
if (foundFriend) {
	DrawShape(shapeX+friendOffsetX, shapeY+friendOffsetY, 32, properties, friendRotation);
}