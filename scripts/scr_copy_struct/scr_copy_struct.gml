function scr_copy_struct(_struct) {
    
    var key, value;
    var newCopy = {};
    var keys = variable_struct_get_names(_struct);
    for (var i = array_length(keys) - 1; i >= 0; --i) {
        key = keys[i];
        value = _struct[$ key];
        variable_struct_get(_struct, key);
        variable_struct_set(newCopy, key, value);
    }
    
    return newCopy;
}