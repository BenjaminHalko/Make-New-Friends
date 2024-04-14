/// @desc 

EnableLive;

if (hasShape and !instance_exists(oShapeExplode)) {
	draw_sprite_ext(sFriend, 0, x, y, shapeRadius+shapePulse*0.5, shapeRadius+shapePulse*0.5,faceAngle,c_white,1);
}