/// @desc

scores = [];
names = [];

global.score = 0;
global.round = 1;
global.highscore = 0;
global.leaderboardPos = -1;

//LeaderboardGet();
listener = FirebaseRealTime(FIREBASE_LEADERBOARD_URL).Path("/").Listener();
