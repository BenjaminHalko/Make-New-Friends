/// @desc

scores = [];
names = [];

draw = false;
scoreOffset = 0;
scoreOffsetTarget = 0;

scoresPerPage = 8;
disableSelect = false;

global.username = "";
global.score = 0;
global.round = 0;
global.highscore = 0;
global.pb = 0;

LeaderboardGet();
listener = FirebaseRealTime(FIREBASE_LEADERBOARD_URL).Path("/").Listener();
