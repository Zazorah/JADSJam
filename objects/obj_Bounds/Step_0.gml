if (place_meeting(x, y, obj_Player)) {
	if (instance_exists(obj_Camera)) {
		obj_Camera.bounds = self;
	}
}