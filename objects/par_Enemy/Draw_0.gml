event_inherited();

// DEBUG - color to make it clear that this test collision is an enemy
draw_sprite_ext(
    sprite_index, image_index, x, y, xscale, yscale, 0, c_white, 1
);

// Draw flashed sprite
if (flash_frames > 0) {
    
    gpu_set_fog(true, c_white, 1, 1);
    draw_sprite_ext(
        sprite_index, image_index, x, y, xscale, yscale, 0, c_red, 1
    );
    gpu_set_fog(false, c_white, 1, 1);
}