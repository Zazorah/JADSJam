function scr_get_flag(_flag, _def = false){
    
    // Returns a flag.
    
    if (!variable_global_exists("flags")) {
        global.flags = ds_map_create();
    }
    
    if (ds_map_exists(global.flags, _flag)) {
        return global.flags[_flag];
    }
    
    return _def;
}