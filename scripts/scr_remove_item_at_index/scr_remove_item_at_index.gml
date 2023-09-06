function scr_remove_item_at_index(_index) {
    
    // Removes and returns an item.
    
    var item = obj_Game.inventory[_index];
    if (item != 0) {
        obj_Game.inventory[_index] = 0;
        scr_collapse_inventory();
        return item;
    }
    
    return noone;
}