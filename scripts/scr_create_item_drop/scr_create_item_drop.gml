function scr_create_item_drop(_item, _hspd = noone, _vspd = noone) {
    
    // Creates a new item drop object.
    
    if (_hspd == noone) {
        _hspd = irandom_range(-5, 5);
    }
    
    if (_vspd == noone) {
        _vspd = irandom_range(-5, 5);
    }
    
    var drop = instance_create_depth(x, y, depth, obj_Item_Drop);
    drop.item = scr_copy_struct(_item);
    drop.hspd = _hspd;
    drop.vspd = _vspd;
    
    drop.z = -0.1;
    drop.zspd = -3;
}