/// @desc 

if (global.title and !hasShape and oTitle.y > room_height/2+oGUI.guiY/2-room_height) {
	SummonShape();
	global.currentShape.sides = 5;
	global.currentShape.color = #2055FF;
}

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
	shapeRadius = Approach(shapeRadius, 1, 0.1);
}

shapeAngle = ApproachFade(shapeAngle, shapeAngleTarget, 50, 0.7);
faceAngle = ApproachFade(faceAngle, faceAngleTarget * (!worried or faceAngleTarget == -360), 50, 0.7);

image_blend = merge_color(oGUI.image_blend, global.currentShape.color, pulse);

// MOVE TO NEXT FRIEND
worried = false;
var _percent = (frac(global.audioPos)-0.7) * 10/3;
if (!instance_exists(oShapeAbsorb) and _percent >= 0) {
	if (!instance_exists(personID)) {
		with(oPerson) {
			if (normalizedTargetBeat == ceil(((global.audioPos+1) % global.maxBeats)-1)) {
				other.personID = id;
			}
		}
	}
	
	if (instance_exists(personID)) {
		if (personID.properties.color != global.currentShape.color or personID.properties.sides != global.currentShape.sides) {
			worried = true;
		} else {
			instance_create_depth(x,y,personID.depth-1,oShapeAbsorb);
			call_later(1,time_source_units_frames,function(){
				hasShape = false;
				global.currentShape.color = c_white;
				global.currentShape.sides = 2;
			}, 0);
		}
	}
}