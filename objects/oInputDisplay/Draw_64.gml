/// @desc 

draw_sprite_ext(sArrow, 0, x, y, 1, 1, image_angle, c_white, min(1, 2-pressedPercent*2));
var _scale = lerp(0.8, 1, animcurve_channel_evaluate(pulseCurve, max(0, pulse-0.2)*1.2));
draw_sprite_ext(sShapeBorder, 0, shapeX, shapeY, _scale, _scale, 0, c_ltgrey, min(1, 2-selectedPercent*2));