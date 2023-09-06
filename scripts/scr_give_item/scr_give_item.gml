function scr_give_item(_item) {
    
    // Accepts an item struct as an argument and then adds it to the players inventory.
    
    for (var i = 0; i < array_length(obj_Game.inventory); i++) {
        var slot = obj_Game.inventory[i];
        
        if (slot == 0) {
            obj_Game.inventory[i] = scr_copy_struct(_item);
            obj_Game.i_icons[i].scale += 0.5;
            return true;
        }
    }
    
    return false;
}