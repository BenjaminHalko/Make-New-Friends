function PulseShape(_x, _y, _sides, _size, _angle, _blend) {
	return instance_create_depth(_x, _y, depth-5, oShapeOutlinePulse, {
		sides: _sides,
		radius: _size,
		image_angle: _angle,
		image_blend: _blend
	});
}