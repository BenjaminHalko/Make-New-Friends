function RoundConfig() {
	
	switch(global.round) {
		case 1:
			global.friendsNeeded = 10;
			global.offBeatChance = [0, 0];
			break;
		
		default:
			global.friendsNeeded = 10;
			global.offBeatChance = [4, 4];
			break;
	}
	
}