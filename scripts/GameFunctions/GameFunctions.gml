global.lives = 12;
global.friendsNeeded = 0;
global.friendsMade = 0;
global.offBeatChance = array_create(2, 0);
global.inGame = false;
global.title = true;
global.gameOver = false;

function RoundStart() {
	global.inGame = true;
}

function RoundEnd() {
	global.inGame = false;
	with(oPerson) {
		PersonDestroy(15);
		instance_destroy();
	}
	with(oShapeSummoner) {
		hasShape = false;
	}
}

function GameOver() {
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
	global.round++;
	oGUI.alarm[0] = 1;
	oGUI.roundComplete = false;
	global.friendsMade = 0;
	RoundConfig();
}

function ToGame() {
	global.title = false;
	global.gameOver = false;
	global.lives = 12;
	global.round = 0;
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
	RoundEnd();
	global.friendsNeeded = 1;
	global.friendsMade = 0;
	global.lives = 12;
	global.title = true;
	global.gameOver = false;
	ChangeBPM(130);
	oGUI.alarm[0] = -1;
	oGUI.startNum = 0;
}