function StopBloom() {
	if (global.render)
		surface_set_target(oRender.surfaceDoNot);
}

function StartBloom() {
	if (global.render)
		surface_reset_target();
}