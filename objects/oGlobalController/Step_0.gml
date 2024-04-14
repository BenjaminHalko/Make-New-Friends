/// @desc Input

EnableLive;

ScaleCanvas();

keyLeft = keyboard_check(vk_left) or keyboard_check(ord("A"));
keyRight = keyboard_check(vk_right) or keyboard_check(ord("D"));
keyUp = keyboard_check(vk_up) or keyboard_check(ord("W"));
keyDown = keyboard_check(vk_down) or keyboard_check(ord("S"));
keyConfirm = keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_shift);

if (keyboard_check_pressed(vk_f4) or keyboard_check_pressed(vk_f11)) {
	window_set_fullscreen(!window_get_fullscreen());	
}