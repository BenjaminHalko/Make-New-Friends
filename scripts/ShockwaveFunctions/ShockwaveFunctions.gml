function tween_cubic_out_simple(argument0) {
	/*
	_______________________________________________________________________________
	INFO:
	-------------------------------------------------------------------------------
	This script remaps/tweens an input value from an input range of 0 to 1
	to an output range of 0 to 1 in a "cubic out" fashion: fast -> slow

	input_value			The value to remap
						could i.e. be a timers current value
					
	returns				the input_value remapped to the output_range
						so basically out_value
	_____________________________________________________________________________*/

	/* original version:
	t /= d;
	t--;
	return c*(t*t*t + 1) + b; */


	/* Long version:
	//var in_min	= 0;			// -
	var in_value	= argument0;	// t
	//var in_range	= 1;			// d
	//var out_min	= 0;			// b
	//var out_range	= 1;			// c

	in_value--;
	return in_value * in_value * in_value + 1; */

	// Short version:
	var in_value = argument0 - 1;
	return in_value * in_value * in_value + 1;
}

function tween_quadratic_out_simple(argument0) {
	/*
	_______________________________________________________________________________
	INFO:
	-------------------------------------------------------------------------------
	This script remaps/tweens an input value from an input range of 0 to 1
	to an output range of 0 to 1 in a "quadratic out" fashion: fast -> slow

	input_value			The value to remap
						could i.e. be a timers current value
					
	returns				the input_value remapped to the output_range
						so basically out_value
	_____________________________________________________________________________*/

	/* original version:
	t/=d
	-c * t * (t - 2) + b; */


	/* Long version:
	//var in_min	= 0;			// -
	var in_value	= argument0;	// t
	//var in_range	= 1;			// d
	//var out_min	= 0;			// b
	//var out_range	= 1;			// c

	return -1 * in_value * (in_value - 2); */

	// Short version:
	return -1 * argument0 * (argument0 - 2); 
}
	
function CreateShockwave(_x,_y,_size=1200)
{
	if(!instance_exists(oShockwave)) instance_create_depth(0,0,depth-1,oShockwave);
	with(oShockwave)
	{
		wave_scale_max = _size / sprite_get_width(sprite);
		var new_wave = ds_list_create();
		new_wave[|waveparam.xx]		= _x;
		new_wave[|waveparam.yy]		= _y;
		new_wave[|waveparam.age]	= 0;
		new_wave[|waveparam.scale]	= 0;
		new_wave[|waveparam.alpha]	= 1;

		ds_list_add(list_of_waves, new_wave);
	}
}