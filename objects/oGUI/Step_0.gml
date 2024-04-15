/// @desc 

evilPulse = ApproachFade(evilPulse, 0, 0.1, 0.8);


image_blend = merge_color(c_white, c_red, evilPulse);

for(var i = 0; i < 3; i++) {
	heartScale[i] = Approach(heartScale[i],1,0.05);	
}

// Round Complete
if (roundComplete) {
	if (keyConfirm) {
		NextRound();	
	}
}