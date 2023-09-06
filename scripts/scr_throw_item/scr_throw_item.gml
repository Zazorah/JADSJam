function scr_throw_item(_index) {

    // Throws an item from the inventory.
    
    var _item = scr_remove_item_at_index(_index);
    if (_item != noone) {
        
        // Create projectile
        var bullet_offset_x = 0;
        var bullet_offset_y = -8;
        
        var _prod = instance_create_depth(
            x + bullet_offset_x, y + bullet_offset_y, depth, obj_Thrown_Item
        );
        _prod.item = _item;
        
        // Play sound
        audio_play_sound(sfx_Hit, 0, false);
    }
}