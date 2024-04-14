/// @desc 

EnableLive;

var _offbeatChange = 8;

if (global.audioTick and (global.audioBeat % 2 == 0 or irandom(_offbeatChange-1) == 0)) {
	instance_create_layer(irandom_range(MinSpawnX, MaxSpawnX),room_height+random(room_height),layer,oPerson,{targetBeat: global.audioBeat + 4});	
}