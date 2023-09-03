function scr_draw_text_border(_msg, _x, _y, _alpha = 1, _width = 3, _msg_width = -1, _msg_sep = 36) {
    
    if (_msg_width == -1) {
        _msg_width = window_get_width() - 72;
    }
    
    var _dists = [
        [-_width, -_width],
        [-_width, _width],
        [_width, -_width],
        [_width, _width],
        [-_width/2, _width],
        [_width/2, _width],
        [_width, -_width/2],
        [_width, _width/2],
        [-_width/2, -_width/2],
        [_width/2, _width/2]
    ];
    for (var i = 0; i < array_length(_dists); i++) {
        var _xpos = _x + _dists[i][0];
        var _ypos = _y + _dists[i][1];
        
        draw_text_ext_color(_xpos, _ypos, _msg, _msg_sep, _msg_width, _black, _black, _black, _black, _alpha);
    }
    
    draw_text_ext_color(_x, _y, _msg, _msg_sep, _msg_width, c_white, c_white, c_white, c_white, _alpha);
}