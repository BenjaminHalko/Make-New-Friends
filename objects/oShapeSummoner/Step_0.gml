/// @desc 

EnableLive;

hasShapePercent = ApproachFade(hasShapePercent, hasShape, 0.1, 0.8);
image_yscale = lerp(0.85, 0.95, (sin(global.audioPos * pi)+1)) + hasShapePercent * 0.5;

if (global.audioTick) {
	shapePulse = 1;
	shapeAngleTarget -= 30;
	if (global.audioBeat % 8 == 7) {
		faceAngleTarget = -360;
		shapeAngleTarget -= 60;
		shapePulse = 2;
	} else {
		if (faceAngleTarget == -360)
			faceAngle += 360;	
		faceAngleTarget = 20 * (1-(global.audioBeat % 2)*2);
	}
}
shapeAngleTarget -= 0.5;


if (!instance_exists(oShapeExplode)) {
	shapePulse = ApproachFade(shapePulse, 0, 0.1, 0.8);
	pulse = ApproachFade(pulse, 0, 0.08, 0.8);
	shapeRadius = ApproachFade(shapeRadius, 1, 0.2, 0.7);
}

shapeAngle = ApproachFade(shapeAngle, shapeAngleTarget, 50, 0.7);
faceAngle = ApproachFade(faceAngle, faceAngleTarget, 50, 0.7);

image_blend = merge_color(c_white, global.currentShape.color, pulse);