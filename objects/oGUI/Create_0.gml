/// @desc 

EnableLive;

guiY = 230;
evilPulse = 0;

instance_create_depth(56, 214, depth-1, oInputCircle);
instance_create_layer(56, 60, "Summoner", oShapeSummoner);

startNum = 0;

roundComplete = false;
heartScale = array_create(3,1);
addedHeart = false;