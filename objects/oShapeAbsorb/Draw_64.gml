/// @desc 

EnableLive;

draw_sprite_ext(sFriend, FACE.Friend, shapeX, shapeY, lerp(shapeRadius+shapePulse*0.5, 40 / 56, percent)*(1-foundFriend*2), lerp(shapeRadius+shapePulse*0.5, 40 / 56, percent),faceAngle,c_white,1);
if (foundFriend) {
	draw_sprite_ext(sFriend, FACE.Friend, shapeX+friendOffsetX, shapeY+friendOffsetY, -0.8, 0.8,faceAngle,c_white,1);
}