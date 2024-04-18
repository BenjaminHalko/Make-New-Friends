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

scoreOffsetTarget = 0;
scoresPerPage = 10;
scoreOffset = 0;

diedTo = "Me";

titlePulse = [0, 0];

buttonStart = new TitleButton(undefined, "START");
buttonStart.y = 20;
buttonLeaderboard = new TitleButton(undefined, "LEADERBOARD");
buttonLeaderboard.y = 70;
buttonUsername = new TitleButton(undefined, "CHANGE USERNAME");
buttonUsername.y = 100;