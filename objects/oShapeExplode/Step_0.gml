/// @desc 

if (--wait <= 0) {
	image_alpha -= 0.2;
	faceAlpha -= 0.15;
	if (faceAlpha <= 0)
		instance_destroy();
}

faceAngle = ApproachFade(faceAngle, 0, 10, 0.2);