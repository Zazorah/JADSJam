event_inherited();

if (range_scale > 0) {
	
	var _xscale = image_xscale + (0.1 * range_scale);
	var _yscale = image_yscale + (0.1 * range_scale);
	
	var _offset = 0.8 * range_scale;
	
	gpu_set_fog(true, c_white, 0, 0);
	draw_sprite_ext(sprite_index, image_index, x, y + _offset, _xscale, _yscale, 0, c_blue, 1);
	gpu_set_fog(false, c_white, 0, 0);
}

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_blue, 1);
