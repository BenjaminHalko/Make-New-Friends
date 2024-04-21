/// @desc 

var _beat = global.audioPos;
var _allowBeat = false;

if (lastPos == _beat)
	_beat = lastFakePos + delta_time / 1000000 / 60 * oMusicController.bpm;
else {
	_allowBeat = true;
	lastPos = _beat;
}
lastFakePos = _beat;


if (_beat < startBeat) {
	_beat += global.maxBeats;
}

var _points = WaveGetPoint(ValuePercent(_beat, startBeat, targetBeat));
x = _points.x;
y = _points.y;

angle += 2;

if (_beat >= targetBeat and _allowBeat) {
	if (!instance_exists(oShapeAbsorb)) {
		with(oShapeSummoner) {
			if (hasShape) {
				hasShape = false;
				if (worried) {
					instance_create_depth(x,y,depth-1,oShapeExplode);
				}
				global.currentShape.sides = 0;
				global.currentShape.color = c_white;
			}
		}
		
		oGUI.evilPulse = 1;
		global.lives--;
		oGUI.heartScale[global.lives] = 1.4;
		if (global.lives <= 0) {
			oTitle.diedTo = name;
			GameOver();
			PersonDestroy(120);
			audio_play_sound(snLargeExplosion, 1, false);	
		} else {
			with(oPerson) {
				if (normalizedTargetBeat < global.audioPos + 2 and id != other.id) {
					PersonDestroy(20);
					instance_destroy();
				}
			}
			PersonDestroy();
			audio_play_sound(snSmallExplosion, 1, false,1,0,0.7+properties.sides*0.1);	
		}
	} else {
		oShapeAbsorb.friendRotation = angle;	
	}
	oShapeSummoner.lastShapeBeat = normalizedTargetBeat;
	instance_destroy();
}

if (irandom(1+BROWSER*2) == 0) {
	var _pulse = PulseShape(x+random_range(-12,12),y+random_range(-12,12),properties.sides,4,angle,properties.color);
	_pulse.depth = depth + 1;
}