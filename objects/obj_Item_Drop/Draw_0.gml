
// Draw Shadow
var _width = abs(bbox_left - bbox_right) * 1 + 0.5;
var _height = abs(bbox_top - bbox_bottom) * 1;

var _x_offset = -0.5;
var _y_offset = -0.5;

var _x1 = x - _width/2 + _x_offset;
var _x2 = x + _width/2 + _x_offset;
var _y1 = y - _height/2 + _y_offset;
var _y2 = y + _height/2 + _y_offset;

draw_set_alpha(0.2);
draw_ellipse_color(_x1, _y1, _x2, _y2, _black, _black, false);
draw_set_alpha(1);

// Draw Self
var _y = y + z;
draw_sprite_ext(sprite_index, 0, x, _y, image_xscale, image_yscale, image_angle, c_white, 1);