/// @desc 

draw_sprite_ext(sGUISeparator,0,0,guiY,room_width,(room_height-guiY)/4,0,image_blend,1);

for(var i = 0; i < 3; i++) {
	draw_sprite_ext(sHeart,median(0,(global.lives-i*2),2),250-(i-1)*13,guiY+28,heartScale[i],heartScale[i],0,c_white,1);
}

if (roundComplete and addedHeart)
	draw_sprite(sHeart,1,room_width/2+50, room_height/2-13);