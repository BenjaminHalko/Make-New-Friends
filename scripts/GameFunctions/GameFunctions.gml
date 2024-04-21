global.lives = MaxHealth;
global.friendsNeeded = 1;
global.friendsMade = 0;
global.offBeatChance = array_create(2, 0);
global.startOffset = 0;
global.beatOffset = 6;
global.inGame = false;
global.title = true;
global.gameOver = false;

function RoundStart() {
	global.inGame = true;	
}

function RoundEnd(_addScore=true) {
	global.inGame = false;
	with(oPerson) {
		PersonDestroy(15);
		instance_destroy();
	}
	with(oShapeSummoner) {
		hasShape = false;
	}
	if (global.lives != MaxHealth) {
		global.lives += 0.5;
		oGUI.addedHeart = true;
	} else
		oGUI.addedHeart = false;
	if (_addScore) {
		global.score += 100 * global.friendsNeeded;
		global.round++;
		if ((global.round-1) % 5 == 0)
			ChangeBackground(c_black);
		else {
			var _col = [2,3,1,0];
			ChangeBackground(make_color_hsv(color_get_hue(global.shapeProperties[_col[(global.round+3) % 5]].color), 255, 10));
		}
		ChangeBPM(130 + (global.round div 5) * 10);
		audio_play_sound(snRoundComplete, 1, false);
	}
}

function GameOver() {
	LeaderboardPost();
	GotoLeaderboard();
	global.inGame = false;
	global.gameOver = true;
	with(oShapeSummoner) {
		if (hasShape) {
			instance_create_depth(x,y,depth-1,oShapeExplode,{wait: 20});
			hasShape = false;
		}
	}
	with(oPerson) {
		PersonDestroy(20);
		instance_destroy();
	}
}

function NextRound() {
	audio_play_sound(snStart, 1, false);
	oGUI.alarm[0] = 1;
	oGUI.roundComplete = false;
	oWaveController.created = 0;
	global.friendsMade = 0;
	RoundConfig();
}

function ToGame() {
	global.title = false;
	global.gameOver = false;
	global.lives = MaxHealth;
	global.round = 1;
	global.score = 0;
	ChangeBackground(c_black);
	with(oShapeSummoner) {
		if (hasShape) {
			instance_create_depth(x,y,depth-1,oShapeExplode,{wait: 15});
			hasShape = false;
		}
	}
	global.currentShape = new ShapeProperties(0, c_white);
	NextRound()
}

function ToTitle() {
	RoundEnd(false);
	global.lives = MaxHealth;
	global.title = true;
	global.gameOver = false;
	ChangeBPM(130);
	ChangeBackground(c_black);
	oGUI.alarm[0] = -1;
	oGUI.startNum = 0;
	oGUI.roundComplete = false;
	oTitle.lookAtLeaderboard = false;
}

function ChangeBackground(_col) {
	oGUI.lastBackgroundColor = oGUI.backgroundColor;
	oGUI.backgroundColor = _col;	
	oGUI.backgroundPercent = 0;
}