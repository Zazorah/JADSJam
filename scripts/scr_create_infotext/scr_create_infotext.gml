function scr_create_infotext(_msg) {
    
    var _inf = instance_create_depth(0, 0, depth, obj_UI_InfoText);
	argument_make_array = argument[argument_index];
	
    if (argument_count == 1) {
        _inf.msg = _msg;
    } else if (argument_count > 1) {
        _inf.msg = argument[0];
        _inf.next_msg = scr_slice_array(argument_array, 1);
    }
}