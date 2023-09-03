// Check if in Range
if (instance_exists(obj_Player)) {
	in_range = distance_to_object(obj_Player) < 48;
}

if (in_range) {
	range_scale = scr_approach(range_scale, 1, 0.1);
	
	if (keyboard_check_pressed(ord("E"))) {
		
		if (textbox == noone) {
			textbox = scr_create_NPCtext(dialog);
			textbox.owner = self;
		} else {
			textbox.dead = true;
		}
	}
} else {
	range_scale = scr_approach(range_scale, 0, 0.1);
	
	if (textbox != noone) {
		
		textbox.dead = true;
		textbox = noone;
	}
}