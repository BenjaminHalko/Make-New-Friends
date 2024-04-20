/// @desc 

ToTitle();

widthHalf = 130;
heightHalf = 80;

x = room_width/2+50;
y = -heightHalf-200;

introX = x;
introY = -heightHalf-200;

option = 0;
lookAtLeaderboard = false;
acceptMenuInput = true;
volAcceptMenuInput = true;
usernameFlash = 0;
blink = false;
editUsername = false;
editUsernameWait = 0;

scoreOffsetTarget = 0;
scoresPerPage = 10;
scoreOffset = 0;

diedTo = "Me";

titlePulse = [0, 0];
draggingLeaderboard = false;
draggingStart = 0;
draggingLeaderboardStartPos = 0;

draw_set_font(fLarge);
buttonStart = new TitleButton(undefined, "START", 140, false, 1, 20);
buttonStart.y = 20;
buttonLeaderboard = new TitleButton(sLeaderboard, "", 30, true, 1, 20);
buttonLeaderboard.x = -60;
buttonLeaderboard.y = 58;
buttonUsername = new TitleButton(undefined, global.username == "" ? "USERNAME" : global.username, 104, false, 1, 20);
buttonUsername.x = 22;
buttonUsername.y = 58;
buttonLeaderboardContinue = new TitleButton(undefined, "CONTINUE", 104, false, 1, 12);
buttonLeaderboardContinue.y = -heightHalf+12+130;