
var xpos = window_get_width()/2;
var ypos = 32 + (16 * alpha);

draw_set_font(fnt_UI_Large);

// TODO - Draw backdrop?

draw_set_halign(fa_center);
scr_draw_text_border(msg, xpos, ypos, alpha);