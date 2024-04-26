/// @desc

scores = [];
names = [];

score_chasers = false;
lastScore = 0;
score_chasers_timer = 0;

global.score = 0;
global.round = 1;
global.highscore = 0;
global.leaderboardPos = -1;


listener = FirebaseRealTime(FIREBASE_LEADERBOARD_URL).Path("/").Listener();
