
// Start timer when Player 
if (room == play_room && obj_Camera.bounds == noone) {
    timer_active = true;
}

// Fade timer in
if (timer_active) {
    
    timer_alpha = scr_approach(timer_alpha, 1, 0.1);
    timer--;
}

if (keyboard_check_pressed(vk_space)) {
    scr_kill_infotext();
}

// Scroll through UI Icons
if (mouse_wheel_down()) {
    inventory_index++;
    if (inventory_index >= array_length(inventory)) {
        inventory_index -= array_length(inventory);
    }
} else if (mouse_wheel_up()) {
    inventory_index--;
    if (inventory_index < 0) {
        inventory_index += array_length(inventory);
    }
}

// Update UI Icons
for (var i = 0; i < array_length(i_icons); i++) {
    
    var icon = i_icons[i];
    
    // Grow if active
    if (inventory_index == i) {
        icon.scale_spd = lerp(icon.scale_spd, (1.25 - icon.scale) * 0.5, 0.1);
        icon.scale += icon.scale_spd;
    } else {
        icon.scale_spd = lerp(icon.scale_spd, (1 - icon.scale) * 0.5, 0.1);
        icon.scale += icon.scale_spd;
    }
    
    // Spin based on usability
    // If item can be used as a weapon, it'll rotate to be diamond shaped
    if (inventory[icon.index] != 0) {
        
        var item = inventory[icon.index];
        
        if (item.projectile != noone) {
            icon.angle_spd = lerp(icon.angle_spd, (45 - icon.angle) * 0.5, 0.1);
            icon.angle += icon.angle_spd;
        } else {
            icon.angle_spd = lerp(icon.angle_spd, (0 - icon.angle) * 0.5, 0.1);
            icon.angle += icon.angle_spd;
        }
    }
    
    i_icons[i] = icon;
}