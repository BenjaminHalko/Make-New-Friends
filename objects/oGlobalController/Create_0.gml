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

global.render = true;

instance_create_depth(0,0,0,oLeaderboardAPI);

room_goto_next();