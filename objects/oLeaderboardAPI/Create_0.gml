/// @desc

scores = [];
names = [];

score_chasers = false;

global.score = 0;
global.round = 1;
global.highscore = 0;
global.leaderboardPos = -1;


listener = FirebaseRealTime(FIREBASE_LEADERBOARD_URL).Path("/").Listener();
