/// @desc
sprite			= sShockwave;
shader			= shShockwave;
u_aspect		= shader_get_uniform(shader, "aspect");
u_tex_waves		= shader_get_sampler_index(shader, "tex_waves");
aspect			= RESW / RESH;
tex_waves		= -1;

// wave parameters:
wave_life		= 1 * game_get_speed(gamespeed_fps);	// life in seconds
wave_scale_max	= 1200 / sprite_get_width(sprite);		// size in pixels in room space
enum waveparam {xx, yy, age, scale, alpha}				// should be in unreferenced script rather

// create waves list which will hold lists for each active wave.
// those lists will be created in step event on click
// and will age and be deleted in step event as well
list_of_waves	= ds_list_create();

// prepare waves surface
srf_waves		= -1;
srf_waves_scale	= 1;
view_w			= RESW;
view_h			= RESH;


surface = surface_create(room_width, room_height);