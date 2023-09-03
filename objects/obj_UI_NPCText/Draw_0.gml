

draw_set_font(fnt_UI_Small);

var width = 12 + string_width_ext(msg, 24, 128);
var height = 2 + string_height_ext(msg, 24, 128);

var xpos = x;
var ypos = y - 24 + (-8 * alpha) - (height);

var x1 = xpos - width/2;
var x2 = xpos + width/2;
var y1 = ypos;
var y2 = ypos + height;

draw_set_alpha(0.3 * alpha);
//draw_roundrect_color_ext(x1, y1, x2, y2, 12, 12, _black, _black, false);
draw_set_alpha(1);


draw_set_halign(fa_center);
scr_draw_text_border(display_msg, xpos, ypos + (height/2), alpha, 1, 128, 12);