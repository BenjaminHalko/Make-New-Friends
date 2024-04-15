global.lives = 6;
global.friendsNeeded = 1;
global.friendsMade = 0;
global.offBeatChance = array_create(2, 0);
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
	if (global.lives != 6) {
		global.lives++;
		oGUI.addedHeart = true;
	} else
		oGUI.addedHeart = false;
	if (_addScore) {
		global.score += 100 * global.friendsNeeded;
		global.round++;
	}
}

function GameOver() {
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
	oGUI.alarm[0] = 1;
	oGUI.roundComplete = false;
	global.friendsMade = 0;
	RoundConfig();
}

function ToGame() {
	global.title = false;
	global.gameOver = false;
	global.lives = 6;
	global.round = 1;
	global.score = 0;
	with(oShapeSummoner) {
		if (hasShape) {
			instance_create_depth(x,y,depth-1,oShapeExplode,{wait: 15});
			hasShape = false;
		}
	}
	NextRound()
}

function ToTitle() {
	RoundEnd(false);
	global.lives = 6;
	global.title = true;
	global.gameOver = false;
	ChangeBPM(130);
	oGUI.alarm[0] = -1;
	oGUI.startNum = 0;
	oGUI.roundComplete = false;
	oTitle.lookAtLeaderboard = false;
}