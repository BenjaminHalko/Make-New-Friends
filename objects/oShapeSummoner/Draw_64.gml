/// @desc 

EnableLive;

if (hasShape and !instance_exists(oShapeExplode)) {
	var _x = shapeX + random_range(-2,2) * worried;
	var _y = shapeY + random_range(-2,2) * worried;
	draw_sprite_ext(sFriend, worried ? FACE.Worried : FACE.Friend, _x, _y, shapeRadius*shapeRadiusAbsorb+shapePulse*0.5, shapeRadius*shapeRadiusAbsorb+shapePulse*0.5,faceAngle,c_white,1);
}