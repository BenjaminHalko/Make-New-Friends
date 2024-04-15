/// @desc 

EnableLive;

for(var i = 0; i < particleCount; i++) {
	with(particles[i]) {
		percent += 0.005;
		if (percent > 1) {
			percent = 0;
			x = random_range(oInputCircle.x, room_width*1.4);
			y = room_height * 2;
			WaveSetup(oInputCircle.x, room_width*1.4, oInputCircle.y-oShapeSummoner.y-oShapeSummoner.x/2, oInputCircle.x);
		} else {
			var _pos = WaveGetPoint(percent);
			x = _pos.x;
			y = _pos.y;
		}
	}
}

if (particleCount < 200 - 100 * BROWSER and --timer < 0) {
	var _data = {
		x: random_range(oInputCircle.x, room_width*1.4),
		y: room_height * 2,
		percent: 0.35
	};
	with (_data) {
		WaveSetup(oInputCircle.x, room_width*1.4, oInputCircle.y-oShapeSummoner.y-oShapeSummoner.x/2, oInputCircle.x);
	}
	array_push(particles, _data);
	particleCount++;
	if (BROWSER)
		timer = 1;
}