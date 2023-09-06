function scr_find_dialog(_dialogs) {
    
    // Runs through the list of dialogs to find the right one to play.
    // Used for NPCs who need to check flags and items carried.
    
    // Flags: ^FLAG_NAME
    // Items: *ITEM_NAME*QUANTITY
    
    for (var i = 0; i < array_length(_dialogs)) {
        
        var dialog = _dialogs[i];
        
        // If is Flag
        if (string_char_at(dialog[0], 0) == "^") {
            
            var flag = string_copy(dialog[0], 1, string_length(dialog[0]));
            if (scr_get_flag(flag)) {
                return dialog;
            }
        }
        
        // If is Item Dependency
        else if (string_char_at(dialog[0], 0) == "*") {
            
        }
        
        // If just text
        else {
            return dialog;
        }
    }
    
}