
if (will_create) {
    var new_hspd = lengthdir_x(speed, direction) * -0.8;
    var new_vspd = lengthdir_y(speed, direction) * -0.8;
    
    scr_create_item_drop(item, new_hspd, new_vspd);
}