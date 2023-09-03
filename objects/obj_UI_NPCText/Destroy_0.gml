
if (is_array(next_msg)) {
    
    if (array_length(next_msg) == 0) {
        if (owner != noone) {
            owner.textbox = noone;
        }
        exit;
    }
}

if (next_msg != [] and next_msg != noone and is_array(next_msg)) {
    var txt = instance_create_depth(x, y, depth, obj_UI_NPCText);
    txt.msg = next_msg[0];
    txt.owner = owner;
    var next = scr_slice_array(next_msg, 1);
    if (next != []) {
        txt.next_msg = next;
    }
    
    owner.textbox = txt;
}