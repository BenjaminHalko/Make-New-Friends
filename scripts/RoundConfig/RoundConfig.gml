function RoundConfig() {
	
	switch(global.round) {
		case 1:
			global.friendsNeeded = 10;
			global.offBeatChance = [0, 0];
			global.secondBeatChance = 0.5;
			break;
		
		default:
			global.friendsNeeded = 20;
			global.secondBeatChance = 0.75;
			break;
	}
	
}