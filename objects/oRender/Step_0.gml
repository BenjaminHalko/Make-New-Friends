/// @desc 

//Create Non-Existant Surfaces
if !surface_exists(surfacePong) surfacePong = surface_create(RESW, RESH);
if !surface_exists(surfaceDoNot) surfaceDoNot = surface_create(RESW, RESH);

if (keyboard_check_pressed(vk_control) or device_mouse_check_button_pressed(3, mb_left))
	global.render = !global.render;