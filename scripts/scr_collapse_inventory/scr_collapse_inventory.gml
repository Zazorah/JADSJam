function scr_collapse_inventory() {
    
    // Gets rid of all empty space in the inventory.
    
    var new_array = array_create(array_length(obj_Game.inventory));
    var new_i = 0;
    
    for (var i = 0; i < array_length(obj_Game.inventory); i++) {
        
        if (obj_Game.inventory[i] != 0) {
            new_array[new_i] = obj_Game.inventory[i];
            new_i++;
        }
    }
    
    obj_Game.inventory = new_array;
}