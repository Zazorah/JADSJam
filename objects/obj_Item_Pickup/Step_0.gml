
// Set Visual Info
sprite_index = item.held_sprite;

// Do Rotation
if (rot_timer > 0) {
    rot_timer--;
    
    rot_scale = scr_approach(rot_scale, 1, 0.1);
} else {
    rot_scale = scr_approach(rot_scale, -1, 0.1);
    
    if (rot_scale == -1) {
        rot_timer += 360;
    }
}

// Do Hover
hover = sin(((current_time + (hover_offset*100))/1200) * 4) - 2;

// Normalize Angle Speed
angle_speed = lerp(angle_speed, (0 - image_angle) * 0.5, 0.2);
image_alpha += angle_speed;

// Detect Pickups and Render Border
if (instance_exists(obj_Player)) {
	in_range = distance_to_object(obj_Player) < 48;
}

if (in_range) {
    
    border_scale = scr_approach(border_scale, 1, 0.1);
    
    if (keyboard_check_pressed(ord("E"))) {
        var success = scr_give_item(item);
        if (success) {
            instance_destroy();
        }
    }
} else {
    
    border_scale = scr_approach(border_scale, 0, 0.1);
}