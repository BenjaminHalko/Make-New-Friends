function RoundConfig() {
	global.startOffset = (global.round-1)*50;
	switch(global.round) {
		case 1:
			ChangeBPM(130);
			global.friendsNeeded = 8;
			global.offBeatChance = [0, 0];
			global.startOffset = 0;
			global.beatOffset = 5;
			global.bombChance = 0;
			break;
		case 2:
			global.friendsNeeded = 15;
			global.offBeatChance[0] = 5;
			break;
		case 3:
			global.friendsNeeded = 20;
			global.offBeatChance[0] = 3;
			global.beatOffset = 4;
			break;
		case 4:
			global.friendsNeeded = 30;
			global.offBeatChance[0] = 2;
			global.offBeatChance[1] = 5;
			break;
		case 5:
			global.friendsNeeded = 35;
			global.offBeatChance[0] = 2;
			global.offBeatChance[1] = 3;
			break;
		default:
			ChangeBPM(130 + (global.round div 5) * 10);
			global.beatOffset = 5 - (global.round % 5 >= 2);
			global.friendsNeeded = 10 + global.round * 5;
			switch(global.round % 5) {
				default:
					global.offBeatChance[0] = 4;
					global.offBeatChance[1] = 6;
					break;
				case 1:
					global.offBeatChance[0] = 4;
					global.offBeatChance[1] = 5;
				case 2:
					global.offBeatChance[0] = 4;
					global.offBeatChance[1] = 5;
					break;
				case 3:
					global.offBeatChance[0] = 3;
					global.offBeatChance[1] = 4;
					break;
				case 4:
					global.offBeatChance[0] = 2;
					global.offBeatChance[1] = 3;
					break;
			}
			break;
	}
}