/// @desc
var wave_list_size = ds_list_size(list_of_waves);

if (wave_list_size > 0) {
	// create waves surface:
	if (!surface_exists(srf_waves)) {
		srf_waves = surface_create(view_w * srf_waves_scale, view_h * srf_waves_scale);
		tex_waves = surface_get_texture(srf_waves);
	}
	
	// draw wave sprite to waves surface:
	surface_set_target(srf_waves);
		draw_clear_alpha($FF7F7F, 1);
		gpu_set_blendmode_ext(bm_dest_color, bm_src_color);
		shader_set(shAddSpriteToSurface);
		
		var w, this_wave;
		//var wave_list_size = ds_list_size(list_of_waves);
		for (w = 0; w < wave_list_size; w++) {
			this_wave = list_of_waves[|w];
			draw_sprite_ext(sprite, 0,
							(this_wave[|waveparam.xx]) * srf_waves_scale,
							(this_wave[|waveparam.yy]) * srf_waves_scale,
							this_wave[|waveparam.scale] * srf_waves_scale,
							this_wave[|waveparam.scale] * srf_waves_scale,
							0, c_white, this_wave[|waveparam.alpha]);
		}
		
		shader_reset();
		gpu_set_blendmode(bm_normal);
	surface_reset_target();
	
	// draw application surface with waves surface as 2nd texture:
	surface_set_target(surface);
		shader_set(shader);
			shader_set_uniform_f(u_aspect,aspect);
			texture_set_stage(u_tex_waves, tex_waves);
			draw_surface(application_surface, 0, 0);
		shader_reset();
	surface_reset_target();
	
	if (!global.render) {
		draw_surface(surface, 0, 0);
	}
}