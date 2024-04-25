/// @desc 

evilPulse = ApproachFade(evilPulse, 0, 0.1, 0.8);


image_blend = merge_color(c_white, c_red, evilPulse);

for(var i = 0; i < 3; i++) {
	heartScale[i] = Approach(heartScale[i],1,0.05);	
}

if (backgroundPercent != 1) {
	backgroundPercent = Approach(backgroundPercent, 1, 0.02);
	var _col = merge_color(lastBackgroundColor, backgroundColor, backgroundPercent);
	layer_background_blend(backgroundID, _col);
}

// Round Complete
if (roundComplete and instance_number(oShapeExplode) <= 1) {
	if (keyConfirm or (MOBILE and mouse_check_button_pressed(mb_left))) {
		NextRound();	
	}
}