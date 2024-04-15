/// @desc

var wave_list_size = ds_list_size(list_of_waves);
if (wave_list_size > 0) {
	var w, this_wave;
	for (w = 0; w < wave_list_size; w++) {
		this_wave = list_of_waves[|w];
		this_wave[|waveparam.age]++;
		
		if (this_wave[|waveparam.age] < wave_life) {
			this_wave[|waveparam.scale]	= tween_cubic_out_simple(this_wave[|waveparam.age] / wave_life) * wave_scale_max;
			this_wave[|waveparam.alpha]	= 1 - tween_quadratic_out_simple(this_wave[|waveparam.age] / wave_life);
		} else {
			ds_list_destroy(this_wave);
			ds_list_delete(list_of_waves, w);
			w--;
			wave_list_size--;
		}
	}
}

if (wave_list_size <= 0)
	instance_destroy();

if (!surface_exists(surface)) {
	surface = surface_create(room_width, room_height);	
}