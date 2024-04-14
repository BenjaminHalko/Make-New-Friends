/// @desc 

surfacePong = surface_create(RESW, RESH);
surfaceDoNot = surface_create(RESW, RESH);

uBlurVector = shader_get_uniform(shBlur, "blur_vector");