
if (is_array(next_msg)) {
    
    if (array_length(next_msg) == 0) {
        exit;
    }
}

if (next_msg != [] and next_msg != noone and is_array(next_msg)) {
    var inf = instance_create_depth(0, 0, depth, obj_UI_InfoText);
    inf.msg = next_msg[0];
    var next = scr_slice_array(next_msg, 1);
    if (next != []) {
        inf.next_msg = next;
    }
}