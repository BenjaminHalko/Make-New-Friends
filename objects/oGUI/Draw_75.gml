/// @desc 

EnableLive;

draw_set_font(fLarge);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);

draw_text(170, guiY+8, "SCORE:");
draw_text(170, guiY+20, DisplayNumber(global.score, 4));

draw_text(220, guiY+8, "ROUND:");
draw_text(220, guiY+20, global.round);

draw_sprite_ext(sScoreSeparator,0,260,guiY+11,1,22,0,c_white,1);

draw_text(330, guiY+8, "PERSONAL BEST:");
draw_text(330, guiY+20, $"{DisplayNumber(global.pb, 5)} (20/30)");

draw_text(420, guiY+8, "HI-SCORE:");
draw_text(420, guiY+20, DisplayNumber(global.pb, 5));