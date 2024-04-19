function TitleButton(_sprite,_name,_width=-1,_iconOverText=false,_textSize=1,_height=-1) constructor {
	x = 0;
	y = 0;
	index = 0;
	sprite = _sprite;
	name = _name;
	iconOverText = _iconOverText;
	width = _width;
	textSize = _textSize;
	if is_undefined(_sprite) {
		spriteWidth = 0;
		spriteHeight = 0;
	} else {
		spriteWidth = sprite_get_width(_sprite);
		spriteHeight = sprite_get_height(_sprite);
	}
	textWidth = string_width(_name)*textSize;
	textHeight = string_height(_name)*textSize;
	margin = 3;
	widthHalf = 0;
	heightHalf = 0;
	originalWidth = width;
	height = _height;
	originalHeight = height;
	iconOnRight = false;
	fontColor = c_white;
	
	borderWidthHalf = 0;
	borderHeightHalf = 0;
	
	coloredBorder = c_white;
	
	updatePos = function() {
		if iconOverText {
			widthHalf = width / 2;
			heightHalf = ceil((spriteHeight+textHeight+4)/2);
			borderWidthHalf = widthHalf+margin;
			borderHeightHalf = heightHalf+margin
		} else {
			heightHalf = max(spriteHeight/2,textHeight/2);
			if height != -1 heightHalf = height/2;
			if name == "" widthHalf = spriteWidth/2;
			else if is_undefined(sprite) widthHalf = ceil(textWidth/2)+2;
			else widthHalf = ceil((spriteWidth+textWidth+4)/2);
			borderWidthHalf = widthHalf+margin;
			borderHeightHalf = heightHalf+margin;
			if width != -1 borderWidthHalf = width/2+margin;
		}
	}
	
	updateText = function(_newText) {
		draw_set_font(fLarge);
		name = _newText;
		textWidth = string_width(_newText)*textSize;
		textHeight = string_height(_newText)*textSize;
	}
	
	draw = function(_dontDrawText=false) {
		var _x = x + oTitle.x;
		var _y = y + oTitle.y;
		if iconOverText {
			draw_set_color(coloredBorder);
			draw_set_font(fLarge);
			draw_set_halign(fa_center);
			draw_set_valign(fa_bottom);
			draw_roundrect(_x-widthHalf-margin,_y-heightHalf-margin,_x+widthHalf+margin,_y+heightHalf+margin,true);
			draw_sprite(sprite,index,_x-spriteWidth/2,_y-heightHalf);
			draw_set_color(c_white);
			draw_text(_x+1,_y+heightHalf-2,name);
		} else {
			var _col = name == "" ? c_gray : coloredBorder;
			draw_set_color(_col);
			draw_set_font(fLarge);
			draw_set_halign(fa_right);
			if iconOnRight draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
			draw_set_color(coloredBorder == -1 ? (global.hardMode ? #FE0054 : #00F0F0): _col);
			draw_roundrect(_x-borderWidthHalf,_y-borderHeightHalf,_x+borderWidthHalf,_y+borderHeightHalf,true);
			draw_set_color(c_white);
			if coloredBorder != c_white _col = c_white;
			if !is_undefined(sprite) draw_sprite_ext(sprite,index,_x-widthHalf*(1-iconOnRight*2)-spriteWidth*iconOnRight,_y-spriteHeight/2,1,1,0,_col,1);
			draw_set_color(fontColor);
			if name != "" and !_dontDrawText draw_text_transformed(_x+widthHalf*(1-iconOnRight*2),_y+1,name,textSize,textSize,0);
		}
	}
	
	clicked = function() {
		var _x = x + oTitle.x;
		var _y = y + oTitle.y;
		return point_in_rectangle(mouse_x,mouse_y,_x-borderWidthHalf,_y-borderHeightHalf,_x+borderWidthHalf,_y+borderHeightHalf);	
	}
	
	updatePos();
}