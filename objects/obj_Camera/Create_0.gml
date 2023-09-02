view_width = 512;
view_height = 288;

window_scale = 3;

window_set_size(view_width * window_scale, view_height * window_scale);
alarm[0] = 1;

surface_resize(application_surface, view_width * window_scale, view_height * window_scale);

follow = obj_Player;
bounds = noone;