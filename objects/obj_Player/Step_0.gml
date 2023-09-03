// TODO - Normalize movement so that diagnol movement isn't faster.

// Standard Movement
if (!dashing) {
	
	// Standard linear movement.
	if (keyboard_check(ord("W"))) {
		vspd = max(-max_speed, vspd - speed_inc);
	} else if (keyboard_check(ord("S"))) {
		vspd = min(max_speed, vspd + speed_inc);
	} else {
		vspd = scr_approach(vspd, 0, 2);
	}
	
	if (keyboard_check(ord("A"))) {
		hspd = max(-max_speed, hspd - speed_inc);
		dir_facing = -1;
	} else if (keyboard_check(ord("D"))) {
		hspd = min(max_speed, hspd + speed_inc);
		dir_facing = 1;
	} else {
		hspd = scr_approach(hspd, 0, 2);
	}
	
	// Dash
	if (mouse_check_button_pressed(mb_right)) {
		
		var dash_success = false;
		
		if (keyboard_check(ord("W"))) {
			
			vspd = -max_speed - dash_addition;
			dash_success = true;
			
		} else if (keyboard_check(ord("S"))) {
			
			vspd = max_speed + dash_addition;
			dash_success = true;
		}
		
		if (keyboard_check(ord("A"))) {
			
			hspd = -max_speed - dash_addition;
			dash_success = true;
			
		} else if (keyboard_check(ord("D"))) {
			
			hspd = max_speed + dash_addition;
			dash_success = true;
		}
		
		dashing = dash_success;
		
		if (dashing) {
			dash_timer = dash_timer_max;
		}
	}
	
	// Set Walking Animation
	if (keyboard_check(ord("W")) || keyboard_check(ord("S")) || keyboard_check(ord("A")) || keyboard_check(ord("D"))) {
		sprite_index = spr_Player_Walk;
	} else {
		sprite_index = spr_Player_Idle;
	}
} 

// Dashing
else if (dashing) {
	scr_create_afterimage();
	
	dash_timer--;
	if (dash_timer == 0) {
		dashing = false;
	}
}

// Normalize Movement
var cap = dashing ? max_speed + dash_addition : max_speed;
var total_spd = hspd * hspd + vspd * vspd;
if (total_spd > cap * cap) {
	var dir = point_direction(0, 0, hspd, vspd);
	hspd = lengthdir_x(cap, dir);
	vspd = lengthdir_y(cap, dir);
}


// Apply Horizontal Movement
if (place_meeting(x + hspd, y, par_Solid)) {
	
	while (!place_meeting(x + sign(hspd), y, par_Solid)) {
		x += sign(hspd);
	}
	
	hspd = 0;
}

x += hspd;

// Apply Vertical Movement
if (place_meeting(x, y + vspd, par_Solid)) {
	
	while (!place_meeting(x, y + sign(vspd), par_Solid)) {
		y += sign(vspd);
	}
	
	vspd = 0;
}

y += vspd;

// Flip Sprite
face_scale = scr_approach(face_scale, dir_facing, 0.2);