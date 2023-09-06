function scr_set_flag(_flag, _value = true){
    
    // Sets a flag.
    
    if (!variable_global_exists("flags")) {
        global.flags = ds_map_create();
    }
    
    global.flags[_flag] = _value;
}