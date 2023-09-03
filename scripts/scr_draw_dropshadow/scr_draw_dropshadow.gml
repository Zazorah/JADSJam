function scr_draw_dropshadow(_alpha = 0.2, _horz_mult = 1.5, _vert_mult = 0.8) {
    
    
    var _width = abs(bbox_left - bbox_right) * _horz_mult + 0.5;
    var _height = abs(bbox_top - bbox_bottom) * _vert_mult;
    
    var _x_offset = -0.5;
    var _y_offset = -0.5;
    
    var _x1 = x - _width/2 + _x_offset;
    var _x2 = x + _width/2 + _x_offset;
    var _y1 = y - _height/2 + _y_offset;
    var _y2 = y + _height/2 + _y_offset;
    
    draw_set_alpha(_alpha);
    draw_ellipse_color(_x1, _y1, _x2, _y2, _black, _black, false);
    draw_set_alpha(1);
}