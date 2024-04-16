global.lastNames = [];

function PersonDestroy(_wait=5) {
	with(instance_create_layer(x,y,layer,oShapeExplode,{wait: _wait})) {
		properties = variable_clone(other.properties, 1);
		radius = 32;
		angle = other.angle;
		faceAlpha = 1;
		faceAngle = 0;
		name = other.name;
	}
}

function PickName() {
	if (array_length(oLeaderboardAPI.scores) >= 10 and global.showLeaderboardNames) {
		var _name = global.username;
		if (array_length(global.lastNames) > 8) {
			global.lastNames = [];	
		}
		do {
			_name = oLeaderboardAPI.names[irandom(array_length(oLeaderboardAPI.names)-1)];
		} until(_name != global.username and !array_contains(global.lastNames, _name));
		array_push(global.lastNames, _name);
		return _name;
	} else {
		global.showLeaderboardNames = false;	
	}
	return "";
}