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

if (MOBILE and !global.title and !global.gameOver) {
	if (!dragging) {
		if (mouse_check_button_pressed(mb_left)) {
			if (mouse_x > oInputCircle.x + oInputCircle.sprite_width/2) {
				dragging = true;
				draggingX = mouse_x;
				draggingY = mouse_y;
			}
		}
	} else {
		if (!mouse_check_button(mb_left)) {
			dragging = false;	
		} else {
			if (point_distance(draggingX, draggingY, mouse_x, mouse_y) >+ 32) {
				var _dir = Wrap(point_direction(draggingX, draggingY, mouse_x, mouse_y)+45, 0, 360) div 90;
				if (_dir == 0)
					keyRight = true;
				else if (_dir == 1)
					keyUp = true;
				else if (_dir == 2)
					keyLeft = true;
				else
					keyDown = true;
			}
		}
	}
}

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