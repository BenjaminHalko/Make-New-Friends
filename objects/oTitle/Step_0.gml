/// @desc 

introX = ApproachFade(introX, lerp(room_width + widthHalf + 50, room_width/2+45, (global.title or global.gameOver) and (instance_number(oShapeExplode) <= 1)), 50, 0.8);
introY = ApproachFade(introY, room_height/2+(oGUI.guiY-room_height)/2, 20, 0.7);

x = round(introX);
y = round(introY);

if (global.gameOver)
	heightHalf = 94;
else if (global.title)
	heightHalf = 80;

// INPUT
if (global.title or global.gameOver) and (instance_number(oShapeExplode) <= 1) {
	if (!lookAtLeaderboard) {
		if (global.audioTick) {
			titlePulse[global.audioBeat % 2] = 1;	
		}
		
		titlePulse[0] = ApproachFade(titlePulse[0], 0, 0.1, 0.8);
		titlePulse[1] = ApproachFade(titlePulse[1], 0, 0.1, 0.8);
		
		if (!MOBILE) {
			if (keyDown or keyUp) and (lookAtOptions or option != 2 or (!keyboard_check(ord("W")) and !keyboard_check(ord("S")))) {
				if (acceptMenuInput) {
					if (!lookAtOptions and option == 2) {
						var _usernameLength = string_length(global.username);
						while(_usernameLength > 0 and string_char_at(global.username, _usernameLength) == " ") {
							global.username = string_copy(global.username,0,_usernameLength-1);
							_usernameLength = string_length(global.username);
						}
					
						Save("settings","username",global.username);
						SetLeaderboardPosition();
					}
					option = Wrap(option + keyDown - keyUp, 0, 3+lookAtOptions);
					if (!lookAtOptions and option == 2) keyboard_string = global.username;
					acceptMenuInput = false;
					audio_play_sound(snBlip,2,false);
				}
			} else {
				acceptMenuInput	= true;	
			}
			
			
			if (!lookAtOptions) {
				if (option == 0 and keyConfirm) {
					TitleStart();
				}
	
				if (option == 1 and keyConfirm) {
					TitleGotoLeaderboard();
				}
	
				if (option == 2) {
					if (alarm[0] <= 0) alarm[0] = 30;
					if keyboard_lastkey != vk_nokey {
						if (keyboard_lastkey == vk_backspace or (ord(keyboard_lastchar) >= 32 and ord(keyboard_lastchar) <= 255)) and string_length(keyboard_string) <= 10 and (keyboard_lastkey != vk_space or string_length(global.username) > 0) {
							if (OPERA and string_length(keyboard_string) > string_length(global.username)) {
								var _char = string_char_at(keyboard_string, string_length(keyboard_string));
								if (keyboard_check(vk_shift))
									_char = string_upper(_char);
								else
									_char = string_lower(_char);
								keyboard_string = string_copy(keyboard_string, 1, string_length(keyboard_string)-1) + _char;
							}
							global.username = keyboard_string;
						}
						else keyboard_string = global.username;
						keyboard_lastkey = vk_nokey;
					}
				}
	
				if (option == 3 and keyConfirm) {
					lookAtOptions = true;
					option = 0;
					audio_play_sound(snBlip, 1, false);
				}
			} else {
				if (option == 1) {
					if (keyLeft or keyRight) {
						if (volAcceptMenuInput) {
							volAcceptMenuInput = false;
							global.audioVol = clamp(global.audioVol + (keyRight - keyLeft) * 0.1, 0, 1);
							Save("settings","vol",global.audioVol);
							audio_master_gain(global.audioVol);
							audio_play_sound(snBlip,2,false);
						}
					} else {
						volAcceptMenuInput = true;	
					}
				}
				
				if (option == 2 and keyConfirm) {
					TitleToggleRender();
				}
				
				if (option == 3 and keyConfirm) {
					TitleToggleStars();
				}
				
				if (option == 4 and keyConfirm) {
					TitleToggleGamepad();
				}
				
				if (option == 0 and keyConfirm) {
					option = 3;
					lookAtOptions = false;
					audio_play_sound(snBlip, 1, false);
				}
			}
		} else {
			if (editUsername) {
				if (--editUsernameWait < 0 and (!keyboard_virtual_status() or keyboard_check_pressed(vk_enter))) {
					editUsername = false;
					var _usernameLength = string_length(global.username);
					while(_usernameLength > 0 and string_char_at(global.username, _usernameLength) == " ") {
						global.username = string_copy(global.username,0,_usernameLength-1);
						_usernameLength = string_length(global.username);
					}
					
					Save("settings","username",global.username);
					SetLeaderboardPosition();
					
					if (global.username == "") {
						buttonUsername.updateText("USERNAME");
						buttonUsername.updatePos();
					} else {
						buttonUsername.updateText(global.username);
						buttonUsername.updatePos();
						buttonUsername.fontColor = c_white;
					}
					
					keyboard_virtual_hide();
				} else {
					if keyboard_lastkey != vk_nokey {
						if (keyboard_lastkey == vk_backspace or (ord(keyboard_lastchar) >= 32 and ord(keyboard_lastchar) <= 255)) and string_length(keyboard_string) <= 10 and (keyboard_lastkey != vk_space or string_length(global.username) > 0) {
							if (OPERA and string_length(keyboard_string) > string_length(global.username)) {
								var _char = string_char_at(keyboard_string, string_length(keyboard_string));
								if (keyboard_check(vk_shift))
									_char = string_upper(_char);
								else
									_char = string_lower(_char);
								keyboard_string = string_copy(keyboard_string, 1, string_length(keyboard_string)-1) + _char;
							}
							global.username = keyboard_string;
						}
						else keyboard_string = global.username;
						keyboard_lastkey = vk_nokey;
					}
				}
			} else {
				if (mouse_check_button_pressed(mb_left)) {
					if (buttonStart.clicked())
						TitleStart();
					else if (buttonLeaderboard.clicked())
						TitleGotoLeaderboard();
					else if (buttonUsername.clicked()) {
						editUsername = true;
						editUsernameWait = 30;
						keyboard_virtual_show(kbv_type_ascii, kbv_returnkey_done, kbv_autocapitalize_none, true);
					}
				}
			
				
			}
			
			if (global.username == "") {
				buttonUsername.fontColor = merge_color(c_dkgray, c_red, usernameFlash);
			}
		}
		
		usernameFlash = Approach(usernameFlash, 0, 0.04);
	} else {
		if (keyConfirm) {
			if (global.title) {
				lookAtLeaderboard = false;
				audio_play_sound(snBlip, 2, false);
			} else {
				ToGame();
			}
		}
		
		if (MOBILE) {
			buttonLeaderboardContinue.y = -heightHalf+12+130+28*global.gameOver;
			if (mouse_check_button_pressed(mb_left)) {
				if (buttonLeaderboardContinue.clicked()) {
					if (global.title) {
						lookAtLeaderboard = false;
						audio_play_sound(snBlip, 2, false);
					} else {
						ToGame();
					}
				} else {
					draggingStart = mouse_y;
					draggingLeaderboard = true;
					draggingLeaderboardStartPos = scoreOffsetTarget;
				}
			}
			
			if (draggingLeaderboard) {
				if (!mouse_check_button(mb_left)) {
					draggingLeaderboard = false;
				} else {
					scoreOffsetTarget = median(draggingLeaderboardStartPos + round((draggingStart - mouse_y) / 10), 0, array_length(oLeaderboardAPI.scores)-scoresPerPage);
					scoreOffset = scoreOffsetTarget;
				}
			}
		}
		
		if (scoreOffset == scoreOffsetTarget) {
			if (array_length(oLeaderboardAPI.scores)-scoresPerPage <= 0) {
				scoreOffsetTarget = 0;
			} else {
				scoreOffsetTarget = median(scoreOffsetTarget + keyDown - keyUp, 0, array_length(oLeaderboardAPI.scores)-scoresPerPage);
			}
		}
		scoreOffset = Approach(scoreOffset, scoreOffsetTarget, 0.4);
	}
}