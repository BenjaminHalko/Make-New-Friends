/// @desc Resizes the browser window
function ScaleCanvas() {
	if (!BROWSER) or (variable_global_exists("browserWidth") and global.browserWidth == browser_width and global.browserHeight == browser_height) return;
	global.browserWidth = browser_width;
	global.browserHeight = browser_height;
	
	var _aspect = RESW/RESH;
	if ((global.browserWidth / _aspect) > global.browserHeight) window_set_size((global.browserHeight *_aspect), global.browserHeight);
	else window_set_size(global.browserWidth, (global.browserWidth / _aspect));
	window_center();
	
	// resize gui
	display_set_gui_maximize(window_get_width() / RESW, window_get_height() / RESH, 0, 0);
}