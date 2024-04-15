/// @desc Setup game

instance_create_depth(0,0,0,obj_gmlive);

getOsType();

surface_resize(application_surface, RESW, RESH);
window_set_size(RESW * 2, RESH * 2);
window_center();

globalvar keyLeft; keyLeft = false;
globalvar keyRight; keyRight = false;
globalvar keyUp; keyUp = false;
globalvar keyDown; keyDown = false;
globalvar keyConfirm; keyConfirm = false;

global.shapeProperties = [
	new ShapeProperties(6, c_lime),
	new ShapeProperties(3, c_aqua),
	new ShapeProperties(5, c_red),
	new ShapeProperties(4, c_yellow),
];

global.currentShape = new ShapeProperties(4, c_white);

// Load Save Data
ini_open(SAVEFILE);
global.username = ini_read_string("settings","username","Testing Guy");
global.audioVol = ini_read_real("settings","vol",0.7);
global.pb =  ini_read_real("score","score",0);
global.render = ini_read_real("settings","render",true);
ini_close();

audio_master_gain(global.audioVol);

instance_create_depth(0,0,0,oLeaderboardAPI);

room_goto_next();