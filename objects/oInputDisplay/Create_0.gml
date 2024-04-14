/// @desc 

EnableLive;

shapeSize = 28;

var _margin = 4;
size = sprite_get_width(sShapeBorder);
dist = sprite_get_width(sArrow) + _margin;

image_angle = index * 90;
isPressed = false;

rotation = 1;
rotationTarget = 1;
maxRotSpd = 2;
rotSpd = maxRotSpd;

pressedPercent = 0;
selectedPercent = 0;
pulse = 0;

pulseCurve = animcurve_get_channel(ShapeCurves, "inputPulse");

locked = false;

shapeX = x + lengthdir_x(dist + size / 2, image_angle);
shapeY = y + lengthdir_y(dist + size / 2, image_angle);

circlePulse = 0;