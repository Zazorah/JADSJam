function scr_use_item(_item) {
    
    // Uses an item. Typically done from obj_Player.
    
    // Parameters
    var bullet_offset_x = 0;
    var bullet_offset_y = -8;
    
    if (!is_struct(_item)) {
        return;
    }
    
    // Create projectile
    if (_item.projectile != noone) {
        var _prod = instance_create_depth(
            x + bullet_offset_x, y + bullet_offset_y, depth, _item.projectile
        );
        _prod.damage = _item.damage;
        _prod.air_life = _item.air_life;
        _prod.ground_life = _item.ground_life;
        _prod.exploding = _item.exploding;
        _prod.mov_spd = _item.mov_spd;
        _prod.debuff = _item.debuff;
        _prod.sprite_index = _item.bullet_sprite;
        
        // Play sound
        audio_play_sound(sfx_Hit, 0, false);
    }
    
    // Apply buff
    if (_item.buff != noone) {
        apply_buff(_item.buff);
    }
}

function apply_buff(_buff) {
    
    show_message($"Applied {_buff}");
}