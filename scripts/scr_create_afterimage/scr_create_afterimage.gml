function scr_create_afterimage(_life = 10, _blend = c_blue) {
    
    // Creates an afterimage of the object at it's current sprite.
    
    var _img = instance_create_depth(x, y, depth + 1, obj_AfterImage);
    _img.sprite_index = sprite_index;
    _img.image_index = image_index;
    _img.image_xscale = image_xscale;
    _img.image_yscale = image_yscale;
}