/// @desc

scores = [];
names = [];

draw = false;
scoreOffset = 0;
scoreOffsetTarget = 0;

scoresPerPage = 8;
disableSelect = false;

global.score = 0;
global.round = 1;
global.highscore = 0;
global.leaderboardPos = -1;

LeaderboardGet();
listener = FirebaseRealTime(FIREBASE_LEADERBOARD_URL).Path("/").Listener();
