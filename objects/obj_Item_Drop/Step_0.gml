
image_angle += 25 * spin_direction;

// Set sprite
if (item != noone) {
    
    sprite_index = item.icon_sprite;
}

// Move
if (z < 0) {
    
    spin_direction = sign(hspd);
    
    if (ignore_collision <= 0) {
        
        if (place_meeting(x + hspd, y, par_Solid)) {
            while (!place_meeting(x + sign(hspd), y, par_Solid)) {
                x += sign(hspd);
            }
            
            hspd = 0;
        }
    }
    
    x += hspd;
    
    if (ignore_collision <= 0) {
        
        if (place_meeting(x, y + vspd, par_Solid)) {
            while (!place_meeting(x, y + sign(vspd), par_Solid)) {
                y += sign(vspd);
            }
            
            vspd = 0;
        }
    }
    
    y += vspd;
    
    hspd = scr_approach(hspd, 0, 0.1);
    vspd = scr_approach(vspd, 0, 0.1);
    
    z += zspd;
    if (z > 0) { z = 0; }
    zspd += 0.2;
} else {
    
    // DIE AND CREATE AN ACTUAL PICKUP
    instance_destroy();
}