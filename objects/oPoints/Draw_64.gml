/// @desc 

draw_set_font(fNormal);
draw_set_color(image_blend);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_alpha(image_alpha);
draw_text(x,y-round((1-image_alpha)*4),points);
draw_set_alpha(1);