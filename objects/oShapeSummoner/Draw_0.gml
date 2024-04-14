/// @desc 

EnableLive;

draw_sprite_ext(sShapeCreatorStrip,0,x,0,1,room_height,0,c_white,1);
draw_self();

if (hasShape and !instance_exists(oShapeExplode)) {
	DrawShape(x, y, 56 * shapeRadius + shapePulse * 10, global.currentShape, shapeAngle, shapePulse * 0.5);
}