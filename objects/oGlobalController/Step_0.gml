/// @desc Input

ScaleCanvas();

keyLeft = false;
keyRight = false;
keyUp = false;
keyDown = false;
keyConfirm = false;
keyBack = false;

var _deadzone = 0.4;
for(var i = 0; i < gamepad_get_device_count(); i++) {
	keyLeft = keyLeft or gamepad_button_check(i, gp_padl) or (gamepad_button_check(i, gp_face3) and !global.title and !global.gameOver) or (gamepad_axis_value(i, gp_axislh) < -_deadzone) or (gamepad_axis_value(i, gp_axisrh) < -_deadzone);
	keyRight = keyRight or gamepad_button_check(i, gp_padr) or (gamepad_button_check(i, gp_face2) and !global.title and !global.gameOver) or (gamepad_axis_value(i, gp_axislh) > _deadzone) or (gamepad_axis_value(i, gp_axisrh) > _deadzone);
	keyUp = keyUp or gamepad_button_check(i, gp_padu) or (gamepad_button_check(i, gp_face4) and !global.title and !global.gameOver) or (gamepad_axis_value(i, gp_axislv) < -_deadzone) or (gamepad_axis_value(i, gp_axisrv) < -_deadzone);
	keyDown = keyDown or gamepad_button_check(i, gp_padd) or (gamepad_button_check(i, gp_face1) and !global.title and !global.gameOver) or (gamepad_axis_value(i, gp_axislv) > _deadzone) or (gamepad_axis_value(i, gp_axisrv) > _deadzone);
	keyConfirm = keyConfirm or gamepad_button_check_pressed(i, gp_face1) or gamepad_button_check_pressed(i, gp_face2) or gamepad_button_check_pressed(i, gp_face3) or gamepad_button_check_pressed(i, gp_face4) or gamepad_button_check_pressed(i, gp_start);
	keyBack = keyBack or gamepad_button_check_pressed(i, gp_select);
}

keyLeft = keyLeft or keyboard_check(vk_left) or keyboard_check(ord("A"));
keyRight = keyRight or keyboard_check(vk_right) or keyboard_check(ord("D"));
keyUp = keyUp or keyboard_check(vk_up) or keyboard_check(ord("W"));
keyDown = keyDown or keyboard_check(vk_down) or keyboard_check(ord("S"));
keyConfirm = keyConfirm or keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_shift);
keyBack = keyBack or keyboard_check_pressed(vk_escape) or ((!global.title or oTitle.lookAtLeaderboard) and keyboard_check_pressed(vk_backspace));

if (keyboard_check_pressed(vk_f4) or keyboard_check_pressed(vk_f11)) {
	window_set_fullscreen(!window_get_fullscreen());	
}

if (keyBack) {
	if (global.title) {
		if (oTitle.lookAtLeaderboard) {
			audio_play_sound(snBlip, 1, false);
			oTitle.lookAtLeaderboard = false;
		} else if (DESKTOP)
			game_end();
	} else {
		if (global.score != 0)
			LeaderboardPost();
		ToTitle();	
	}
}