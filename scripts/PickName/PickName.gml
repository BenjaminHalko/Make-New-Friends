function PickName() {
	if (array_length(oLeaderboardAPI.scores) >= 5) {
		return oLeaderboardAPI.names[irandom(array_length(oLeaderboardAPI.names))-1];
	}
	return "";
}