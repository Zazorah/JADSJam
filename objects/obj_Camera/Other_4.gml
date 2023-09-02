view_enabled = true;
view_visible[0] = true;


if (instance_exists(follow)) {
    
    // Snap to Player
    for (var i = 0; i < instance_number(obj_Bounds); i++) {
        var _b = instance_find(obj_Bounds, i);
        if (place_meeting(follow.x, follow.y, _b)) {
            bounds = _b;
            break;
        }
    }
    
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

	var _x = clamp(follow.x - view_width/2, bounds_l, bounds_r - view_width);
	var _y = clamp(follow.y - view_height/2, bounds_u, bounds_d - view_height);
	
	camera_set_view_pos(
			view, 
			_x,
			_y
		);
}