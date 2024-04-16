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
		
		if (keyDown or keyUp) and (option != 2 or (!keyboard_check(ord("W")) and !keyboard_check(ord("S")))) {
			if (acceptMenuInput) {
				if (option == 2) {
					var _usernameLength = string_length(global.username);
					while(_usernameLength > 0 and string_char_at(global.username, _usernameLength) == " ") {
						global.username = string_copy(global.username,0,_usernameLength-1);
						_usernameLength = string_length(global.username);
					}
					
					Save("settings","username",global.username);
					SetLeaderboardPosition();
				}
				option = Wrap(option + keyDown - keyUp, 0, 3);
				if (option == 2) keyboard_string = global.username;
				acceptMenuInput = false;
				audio_play_sound(snBlip,2,false);
			}
		} else {
			acceptMenuInput	= true;	
		}
	
		if (option == 0 and keyConfirm) {
			if (global.username != "") {
				with(oMusicController) {
					if !audio_is_playing(music) {
						music = audio_play_sound(mMusic, 1, true);
					}
				}
				ToGame();
			} else {
				usernameFlash = 1;
				 audio_play_sound(snBlip,2,false);
			}
		}
	
		if (option == 1 and keyConfirm) {
			GotoLeaderboard();
			audio_play_sound(snBlip,2,false);
		}
	
		if (option == 2) {
			if (alarm[0] <= 0) alarm[0] = 30;
			if keyboard_lastkey != vk_nokey {
				if (keyboard_lastkey == vk_backspace or (ord(keyboard_lastchar) >= 32 and ord(keyboard_lastchar) <= 255)) and string_length(keyboard_string) <= 10 and (keyboard_lastkey != vk_space or string_length(global.username) > 0) global.username = keyboard_string;
				else keyboard_string = global.username;
				keyboard_lastkey = vk_nokey;
			}
		}
	
		if (option == 3) {
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