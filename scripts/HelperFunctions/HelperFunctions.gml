	/// @desc Moves "a" towards "b" by "amount" and returns the result
/// @param {Real} a The value to change
/// @param {Real} b The target value
/// @param {Real} amount The amount to move by
/// @return {Real}
function Approach(_a, _b, _amount)
{
	if (_a < _b)
	{
		_a += _amount;
	    if (_a > _b)
	        return _b;
	}
	else
	{
	    _a -= _amount;
	    if (_a < _b)
	        return _b;
	}
	return _a;
}

/// @desc Moves a value to a target value with easing.
/// @param {Real} Value The target value
/// @param {Real} Target The target value
/// @param {Real} MaxSpd The maximum speed
/// @param {Real} Ease The ease amount from 0 - 1
/// @return {Real}
function ApproachFade(_value,_target,_maxSpd,_ease)
{
	_value += median(-_maxSpd,_maxSpd,(1-_ease)*(_target-_value));
	return _value
}

/// @desc Moves a value to a target value with easing, used for circles
/// @param {Real} Value The target value
/// @param {Real} Target The target value
/// @param {Real} MaxSpd The maximum speed
/// @param {Real} Ease The ease amount from 0 - 1
/// @return {Real}
function ApproachCircleEase(_value,_target,_maxSpd,_ease)
{
	_value += median(-_maxSpd,_maxSpd,(1-_ease)*angle_difference(_target,_value));
	return _value
}

/// @desc Turns {x} into a percent from {a} to {b}
/// @param {Real} x The value to turn into a percent
/// @param {Real} a The min value
/// @param {Real} b The max value
/// @return {Real}
function ValuePercent(_x, _a, _b) {
	return (_x - _a) / (_b - _a)
}

/// @desc Returns the value wrapped, values over or under will be wrapped around
/// @param {Real} value
/// @param {Real} min
/// @param {Real} max
/// @return {Real}
function Wrap(_value, _min, _max) {
	if (_value mod 1 == 0)
	{
	    while (_value > _max || _value < _min)
	    {
	        if (_value > _max)
	            _value += _min - _max - 1;
	        else if (_value < _min)
	            _value += _max - _min + 1;
	    }
	    return(_value);
	}
	else
	{
	    var _valueOld = _value + 1;
	    while (_value != _valueOld)
	    {
	        _valueOld = _value;
	        if (_value < _min)
	            _value = _max - (_min - _value);
	        else if (_value > _max)
	            _value = _min + (_value - _max);
	    }
	    return(_value);
	}

}

function Save(_section, _key, _value) {
	ini_open(SAVEFILE);
	if is_real(_value) ini_write_real(_section, _key, _value);
	else ini_write_string(_section, _key, _value);
	ini_close();
}

function DisplayNumber(_num, _digits) {
	return string_replace_all(string_format(_num,_digits,0)," ","0");
}

function RenderConverArt(_sprite) {
	var _width = sprite_get_width(_sprite)+8;
	var _height = sprite_get_height(_sprite)+8;
	var _surfacePing = surface_create(_width,_height);
	var _surfacePong = surface_create(_width,_height);
	var _uniform = shader_get_uniform(shBlur, "blur_vector");

	surface_set_target(_surfacePing);
	draw_sprite(_sprite,0,_width/2,_height/2);
	surface_reset_target();

	surface_set_target(_surfacePong);
	shader_set(shBlur);
	shader_set_uniform_f(_uniform,0,1);
	draw_surface(_surfacePing,0,0);
	surface_reset_target();

	surface_set_target(_surfacePing);
	shader_set_uniform_f(_uniform,1,0);
	draw_surface_ext(_surfacePong,0,0,1,1,0,make_color_hsv(0,0,255*0.9),1);
	shader_reset();

	gpu_set_blendmode(bm_add);
	draw_sprite_ext(_sprite,0,_width/2,_height/2,1,1,0,make_color_hsv(0,0,255*0.55),1);
	gpu_set_blendmode(bm_normal);
	surface_reset_target();

	var _file = get_save_filename("*.png","CoverArt.png");
	surface_save(_surfacePing,_file);

	surface_free(_surfacePing);
	surface_free(_surfacePong);	
}