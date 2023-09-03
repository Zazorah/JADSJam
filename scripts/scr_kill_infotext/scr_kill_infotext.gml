function scr_kill_infotext() {
    
    // Sends a kill command to whatever info UI object is up.
    
    if (instance_exists(obj_UI_InfoText)) {
        obj_UI_InfoText.dead = true;
    }
}