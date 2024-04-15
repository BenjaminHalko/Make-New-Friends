/// @desc 

EnableLive;

if (foundFriend) {
	spd = ApproachFade(spd, 10, 1, 0.8);
	shapeX -= spd;
	shapeAngle += spd * 5;
	friendRotation += spd * 5;
	if (shapeX < -10)
		instance_destroy();
} else {
	if (!instance_exists(personID)) {
		global.friendsMade++;
		instance_create_layer(shapeX+24,shapeY,"GUI",oPoints,{points: points, image_blend: merge_color(properties.color, c_white, 0.5)});
		if (global.friendsMade >= global.friendsNeeded) {
			RoundEnd();
			oGUI.roundComplete = true;
		}
		foundFriend = true;
		exit
	}

	percent = (frac(global.audioPos)-startPercent) / (1-startPercent);
	if (global.audioPos >= targetBeat or global.audioPos < startBeat)
		percent = 0;

	shapePulse = ApproachFade(shapePulse, 0, 0.1, 0.8);
	shapeRadius = Approach(shapeRadius, 1, 0.7);
	faceAngle = ApproachFade(faceAngle, faceAngleTarget * (faceAngleTarget == -360), 50, 0.7);

	shapeX = lerp(x, personID.x-friendOffsetX, percent);
	shapeY = lerp(y, personID.y-friendOffsetY, percent);
}