/// @desc 

if (global.audioTick) {
	image_xscale = 1.2;	
}

image_xscale = ApproachFade(image_xscale, 1, 0.1, 0.8);
image_yscale = image_xscale;