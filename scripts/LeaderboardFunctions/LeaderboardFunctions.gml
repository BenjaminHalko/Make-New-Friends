function PositionLeaderboard() {
	with(oLeaderboardAPI) {
		var _index = array_find_index(scores, function(_val) {
			return _val.name == global.username;
		});
		
		if (_index != -1) {
			scoreOffsetTarget = max(0, min(_index-5, array_length(scores)-scoresPerPage));
			scoreOffset = scoreOffsetTarget;
		} else {
			scoreOffsetTarget = 0;
			scoreOffset = 0;
		}	
	}
}

function SetLeaderboardPosition() {
	global.leaderboardPos = array_find_index(oLeaderboardAPI.scores, function(_val) {
		if (_val.name == global.username)
			global.pb = max(global.pb, _val.points);
		return _val.name == global.username;
	});	
}

function GotoLeaderboard() {
	with(oTitle) {
		lookAtLeaderboard = true;
		var _index = array_find_index(oLeaderboardAPI.scores, function(_val) {
			return _val.name == global.username;
		});
		
		if (_index != -1) {
			scoreOffsetTarget = max(0, min(_index-6, array_length(oLeaderboardAPI.scores)-scoresPerPage));
			scoreOffset = scoreOffsetTarget;
		} else {
			scoreOffsetTarget = 0;
			scoreOffset = 0;
		}
	}
	
}