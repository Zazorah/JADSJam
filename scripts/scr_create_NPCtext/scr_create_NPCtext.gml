function scr_create_NPCtext(_msg) {
	
	var _txt = instance_create_depth(x, y, depth - 100, obj_UI_NPCText);
	
    if (array_length(_msg) == 1) {
        _txt.msg = _msg[0];
    } else if (array_length(_msg) > 1) {
        _txt.msg = _msg[0];
        _txt.next_msg = scr_slice_array(_msg, 1);
    }
    
    return _txt;
}