/// @desc 

var _hasColor = !is_undefined(global.shapeProperties[index].color);
var _hasSides = !is_undefined(global.shapeProperties[index].sides);

var _lastPressed = isPressed;
if (!global.inGame)
	isPressed = false;
else {
	switch(index) {
		default:
			isPressed = keyRight;
			break;
		case 1:
			isPressed = keyUp;
			break;
		case 2:
			isPressed = keyLeft;
			break;
		case 3:
			isPressed = keyDown;
			break;
	}
	
	if (MOBILE) {
		for(var i = 0; i < 5; i++) {
			var _x = device_mouse_x(i);
			var _y = device_mouse_y(i);
			if (point_in_rectangle(_x, _y, shapeX-18, shapeY-18, shapeX+18, shapeY+18) and device_mouse_check_button(i, mb_left)) {
				isPressed = true;
			}
		}
	}
}

if (!_lastPressed and isPressed) {
	if (!_hasColor or global.currentShape.color != global.shapeProperties[index].color) or (!_hasSides and global.currentShape.sides != global.shapeProperties[index].sides) {
		locked = false;
		pulse = 1;
		rotationTarget += 5;
	
		SummonShape();
	
		if (_hasColor)
			global.currentShape.color = global.shapeProperties[index].color;
		if (_hasSides)
			global.currentShape.sides = global.shapeProperties[index].sides;
	
		with(oShapeSummoner) {
			repeat(20) {
				with(instance_create_depth(x,y,depth-1,oParticle)) {
					radius = 14;
					direction = random(360);
					image_angle = random(360);
					spd = random_range(0.03, 0.05);
					speed = random_range(1.6, 3);
					image_blend = merge_color(global.currentShape.color, c_white, 0.5);
					sides = global.currentShape.sides;
				}
			}
			
			CreateShockwave(x,y,400);
		}
	
		with(oInputDisplay) {
			if (id == other.id) continue;
			if ((_hasColor and !is_undefined(global.shapeProperties[index].color))
				or (_hasSides and !is_undefined(global.shapeProperties[index].sides))) {
					locked = true;	
				}
		}
	
		if (_hasSides) {
			PulseShape(shapeX, shapeY, global.shapeProperties[index].sides, (shapeSize + 8) * 0.5, rotation + 100, _hasColor ? global.shapeProperties[index].color : c_white);
		}
	}
}


pulse = Approach(pulse, 0, 0.15);
rotation = ApproachFade(rotation, -rotationTarget * 20, 10, 0.8);

var _pressed = (!_hasColor or global.shapeProperties[index].color == global.currentShape.color) and (!_hasSides or global.shapeProperties[index].sides == global.currentShape.sides);
selectedPercent = ApproachFade(selectedPercent, _pressed, 0.4, 0.7);
pressedPercent = ApproachFade(pressedPercent, isPressed and !locked, 0.4, 0.6);

if (global.audioTick and !_pressed) {
	pulse = max(pulse, 0.2);
	rotationTarget++;
}