/// @desc	Draws a shape
/// @param	{real} x
/// @param	{real} y
/// @param	{real} size
/// @param	{struct.ShapeProperties} shapeProperties
/// @param	{real} [angle]
/// @param	{real} [white]
/// @param	{real} [black]
function DrawShape(_x, _y, _size, _shapeProperties, _angle=0, _white=0, _black=0) {
	var _showColor = !is_undefined(_shapeProperties.color);
	_size *= 0.5;
	
	if (_showColor) {
		if (_white == 0 and _black == 0)
			draw_set_color(_shapeProperties.color);
		else {
			draw_set_color(merge_color(merge_color(_shapeProperties.color, c_black, _black), c_white, _white));
		}
	} else {
		draw_set_color(c_white);
	}
	
	if (is_undefined(_shapeProperties.sides)) {
		draw_sprite_ext(sColor,0,_x,_y,1,1,0,_shapeProperties.color,1);	
	} else {
		DrawPolygon(_x, _y, _size, _shapeProperties.sides, _angle);
		if (!_showColor) {
			draw_set_color(c_black);
			DrawPolygon(_x, _y, _size * OutlineSize, _shapeProperties.sides, _angle);
		}
	}
	
	if (_showColor) {
		StopBloom();
		draw_set_color(merge_color(_shapeProperties.color, c_white, 0.5));
		DrawOutline(_x,_y,_size,_shapeProperties.sides,_angle);
		StartBloom();
	}
}

function DrawPolygon(_x, _y, _size, _sides, _angle) {
	draw_primitive_begin(pr_trianglelist);
	var _oneAngle = 360 / _sides;
	for(var i = 0; i < _sides; i++) {
		draw_vertex(
			_x + lengthdir_x(_size, _angle+_oneAngle*i),
			_y + lengthdir_y(_size, _angle+_oneAngle*i)
		);
		draw_vertex(
			_x + lengthdir_x(_size, _angle+_oneAngle*(i+1)),
			_y + lengthdir_y(_size, _angle+_oneAngle*(i+1))
		);
		draw_vertex(_x,_y);
	}
	draw_primitive_end();
}

function DrawOutline(_x, _y, _radius, _sides, _angle) {
	var _oneAngle = 360 / _sides;
	var _offset = -(0.5-(!BROWSER)*0.5)*(!OPERA);
	for(var i = 0; i < _sides; i++) {
		draw_line(
			_x + lengthdir_x(_radius, _angle+_oneAngle*i)+_offset,
			_y + lengthdir_y(_radius, _angle+_oneAngle*i)+_offset,
			_x + lengthdir_x(_radius, _angle+_oneAngle*(i+1))+_offset,
			_y + lengthdir_y(_radius, _angle+_oneAngle*(i+1))+_offset
		);
	}
}