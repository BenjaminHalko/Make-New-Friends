function PersonDestroy(_wait=5) {
	with(instance_create_layer(x,y,layer,oShapeExplode,{wait: _wait})) {
		properties = variable_clone(other.properties, 1);
		radius = 32;
		angle = other.angle;
		faceAlpha = 1;
		faceAngle = 0;
	}
}

function PickName() {
	if (array_length(oLeaderboardAPI.scores) >= 5 or true) {
		return oLeaderboardAPI.names[irandom(array_length(oLeaderboardAPI.names)-1)];
	}
	return "";
}