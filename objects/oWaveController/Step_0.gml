/// @desc 

EnableLive;

if (global.audioTick) {
	instance_create_layer(irandom_range(MinSpawnX, MaxSpawnX),room_height,layer,oPerson,{targetBeat: global.audioBeat + 4});	
}

instance_create_layer(random(MaxSpawnX+50), random_range(room_height, room_height*2),"Particles",oWaveParticle);