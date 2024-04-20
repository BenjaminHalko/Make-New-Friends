/// @desc Setup game

getOsType();

surface_resize(application_surface, RESW, RESH);
window_set_size(RESW * 2, RESH * 2);
window_center();

globalvar keyLeft; keyLeft = false;
globalvar keyRight; keyRight = false;
globalvar keyUp; keyUp = false;
globalvar keyDown; keyDown = false;
globalvar keyConfirm; keyConfirm = false;
globalvar keyBack; keyBack = false;

global.shapeProperties = [
	new ShapeProperties(3, #FF2055),
	new ShapeProperties(6, #ffdd12),
	new ShapeProperties(5, #2055FF),
	new ShapeProperties(4, #10df88),
];

global.currentShape = new ShapeProperties(0, c_white);

// Load Save Data
ini_open(SAVEFILE);
global.username = ini_read_string("settings","username","");
global.audioVol = ini_read_real("settings","vol",0.7);
global.pb =  ini_read_real("score","score",0);
global.render = ini_read_real("settings","render",true);
ini_close();

audio_master_gain(global.audioVol);
global.showLeaderboardNames = true;

instance_create_depth(0,0,0,oLeaderboardAPI);

room_goto_next();