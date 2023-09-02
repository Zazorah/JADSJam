#macro view view_camera[0]

// Set Bounds
if (bounds == noone) {
	bounds_l = 0;
	bounds_r = room_width;
	bounds_u = 0;
	bounds_d = room_width;
} else {
	bounds_l = bounds.bbox_left;
	bounds_r = bounds.bbox_right;
	bounds_u = bounds.bbox_top;
	bounds_d = bounds.bbox_bottom;
}

// Set Size
camera_set_view_size(view, view_width, view_height);

// Set Position
if (follow != noone) {
	
	if (instance_exists(follow)) {
	    var _x = clamp(follow.x - view_width/2, bounds_l, bounds_r - view_width);
	    var _y = clamp(follow.y - view_height/2, bounds_u, bounds_d - view_height);
		
		var _cur_x = camera_get_view_x(view);
		var _cur_y = camera_get_view_y(view);
		var _spd = 0.1;
		
		camera_set_view_pos(
			view, 
			lerp(_cur_x, _x, _spd),
			lerp(_cur_y, _y, _spd)
		);
	}
}