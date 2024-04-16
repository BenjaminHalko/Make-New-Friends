/// @desc 

var _showColor = !is_undefined(global.shapeProperties[index].color);
var _blend = _showColor ? global.shapeProperties[index].color : c_white;
if (pressedPercent != 0) {
	draw_sprite_ext(sArrow, 0, x, y, 1, 1, image_angle, _blend, pressedPercent);
}
if (selectedPercent != 0) {
	var _scale = lerp(0.8, 1, animcurve_channel_evaluate(pulseCurve, max(0, pulse-0.2)*1.2));
	draw_sprite_ext(sShapeBorder, 0, shapeX, shapeY, _scale, _scale, 0, _blend, selectedPercent);
}

DrawShape(shapeX, shapeY, shapeSize + animcurve_channel_evaluate(pulseCurve, 1-pulse) * 8 - selectedPercent * 3, global.shapeProperties[index], rotation, pulse, selectedPercent * 0.6);