
var _x = x;
var _y = y + hover;

var _xscale = xscale * rot_scale;
var _yscale = yscale;

// Draw Border
if (in_range) {
    gpu_set_fog(true, c_white, 0, 0);
    draw_sprite_ext(
        sprite_index, image_index, _x, _y,
        _xscale + (0.1 * border_scale),
        _yscale + (0.1 * border_scale),
        0, c_white, 1
    );
    gpu_set_fog(false, c_white, 0, 0);
}

// Draw Item
draw_sprite_ext(sprite_index, image_index, _x, _y, _xscale, _yscale, image_angle, c_white, 1);
