
// Draw Timer
if (timer_active) {
    draw_set_font(fnt_UI_Large);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    
    var _minutes = floor(timer/60/60);
    var _seconds = floor((timer - (_minutes*60*60))/60);
    var _display_time = $"{_minutes}:{_seconds}";
    
    var _xpos = 12;
    var _ypos = 12 * timer_alpha;
    
    scr_draw_text_border(_display_time, _xpos, _ypos, timer_alpha);
}

// Draw Inventory

for (var i = 0; i < array_length(i_icons); i++) {
    
    var _sep = 110;
    var _xpos = (window_get_width()/2 - 328) + (_sep*i);
    var _ypos = window_get_height() - 72;
    
    // Draw container
    var _alph = 0.6;
    var _col = c_dkgray;
    
    if (i == inventory_index) {
        _alph = 1;
        _col = c_white;
    }
    
    var _icon = i_icons[i];
    
    draw_sprite_ext(
        spr_UI_InventoryBacking, 0, _xpos, _ypos,
        _icon.scale, _icon.scale, _icon.angle, _col, _alph
    );
    
    // Draw icon if it exists
    if (inventory[i] != 0) {
        var _item = inventory[i];
        draw_sprite_ext(
            _item.icon_sprite, 0, _xpos, _ypos, 2, 2, 0, c_white, 1
        );
    }
}
