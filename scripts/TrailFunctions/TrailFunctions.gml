/// @desc A trail effect
/// @param {function} callback
/// @param {real} width
/// @param {real} length
/// @param {real} speed
/// @param {array<any>} [callbackArgs]
function Trail(_callback, _width, _length, _speed, _callbackArgs=undefined) constructor {
	static step = function() {
		animPercent += spd;
	}
	
	static draw = function() {
		var _steps = length/100;
		if (length <= 0)
			return;
		
		var _pos, _nextPos, _angle, _prevangle, _dx, _dy, _w, _pos1, _pos2, _positions, _baseColor, _col, _alpha;
		_baseColor = draw_get_color();
		_positions = [];
		
		callbackArgs[0] = animPercent;
		_pos = script_execute_ext(callback, callbackArgs);
		callbackArgs[0] -= _steps;
		_nextPos = script_execute_ext(callback, callbackArgs);
		_angle = point_direction(_pos.x, _pos.y, _nextPos.x, _nextPos.y);
		_positions = [];
		
		draw_primitive_begin(pr_trianglestrip);
		var _start = animPercent-_steps*2;
		var _end = animPercent-length;
		for (var i = _start; i >= _end; i -= _steps) {
			_pos = _nextPos;
			_prevangle = _angle;
			
			callbackArgs[0] = i;
			_nextPos = script_execute_ext(callback, callbackArgs);
			_angle = point_direction(_pos.x, _pos.y, _nextPos.x, _nextPos.y);
			_w = animcurve_channel_evaluate(animCurve, ValuePercent(i, _start, _end)) * width;
			_dx = lengthdir_x(_w, (_angle + _prevangle + 180)/2);
			_dy = lengthdir_y(_w, (_angle + _prevangle + 180)/2);	

			if (abs(_angle-_prevangle) >= 180) {
				_dx *= -1;
				_dy *= -1;
				
			}
			
			_pos1 = [_pos.x - _dx, _pos.y - _dy];
			_pos2 = [_pos.x + _dx, _pos.y + _dy];
			_alpha = struct_exists(_pos, "alpha") ? _pos.alpha : 1;
			_col = struct_exists(_pos, "color") ? _pos.color : _baseColor;
			draw_vertex_color(_pos1[0], _pos1[1], _col, _alpha);
			draw_vertex_color(_pos2[0], _pos2[1], _col, _alpha);
			
			array_push(_positions, {
				pos1: _pos1,
				pos2: _pos2,
				dx: _dx / _w,
				dy: _dy / _w,
				alpha: _alpha
			});
		}
		
		draw_primitive_end();
		
		return _positions;
	}
	
	static drawOutline = function(_trailColor, _trailWidth) {
		var _positions = draw();
		var _posNumber = array_length(_positions);
		var _pos, _dir1, _dir2;
		
		_pos = _positions[1];
		_dir1 = point_direction(_pos.pos1[0],_pos.pos1[1],_pos.pos2[0],_pos.pos2[1])+90;
		_pos = _positions[_posNumber-2];
		_dir2 = point_direction(_pos.pos1[0],_pos.pos1[1],_pos.pos2[0],_pos.pos2[1])-90;
		
		
		_pos = _positions[1];
		draw_primitive_begin(pr_trianglestrip);
		draw_vertex_color(_pos.pos2[0]+lengthdir_x(_trailWidth, _dir1),_pos.pos2[1]+lengthdir_y(_trailWidth, _dir1),_trailColor,0);
		for(var i = 1; i < _posNumber-1; i++) {
			_pos = _positions[i];
			draw_vertex_color(_pos.pos2[0],_pos.pos2[1], _trailColor, _pos.alpha);
			draw_vertex_color(_pos.pos2[0]+_pos.dx*_trailWidth, _pos.pos2[1]+_pos.dy*_trailWidth, _trailColor, 0);
		}
		_pos = _positions[_posNumber-1];
		draw_vertex_color(_pos.pos2[0]+lengthdir_x(_trailWidth, _dir2),_pos.pos2[1]+lengthdir_y(_trailWidth, _dir2),_trailColor,0);
		draw_primitive_end();
		
		_pos = _positions[1];
		draw_primitive_begin(pr_trianglestrip);
		draw_vertex_color(_pos.pos1[0]+lengthdir_x(_trailWidth, _dir1),_pos.pos1[1]+lengthdir_y(_trailWidth, _dir1),_trailColor,0);
		for(var i = 1; i < _posNumber-1; i++) {
			_pos = _positions[i];
			draw_vertex_color(_pos.pos1[0],_pos.pos1[1], _trailColor, _pos.alpha);
			draw_vertex_color(_pos.pos1[0]-_pos.dx*_trailWidth, _pos.pos1[1]-_pos.dy*_trailWidth, _trailColor, 0);
		}
		_pos = _positions[_posNumber-1];
		draw_vertex_color(_pos.pos1[0]+lengthdir_x(_trailWidth, _dir2),_pos.pos1[1]+lengthdir_y(_trailWidth, _dir2),_trailColor,0);
		draw_primitive_end();
	}
	
	callback = _callback;
	length = _length;
	spd = _speed;
	animPercent = 0;
	width = _width
	animCurve = animcurve_get_channel(TrailCurves, "basic");
	callbackArgs = is_undefined(_callbackArgs) ? [] : _callbackArgs;
	array_insert(callbackArgs, 0, 0); // The animPercent is stored in index[0]
}