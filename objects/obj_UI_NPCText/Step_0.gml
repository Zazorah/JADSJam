
// Decrease timer
if (timer > 0) {
    timer--;
    
    if (timer == 0) {
        dead = true;
    }
}

// Die
if (dead) {
    alpha = lerp(alpha, 0, 0.1);
    
    if (alpha <= 0.05) {
        instance_destroy();
    }
}

// Fade in
else {
    alpha = lerp(alpha, 1, 0.1);
    
    // Typewriter
    msg_index = scr_approach(msg_index, string_length(msg), msg_step);
    display_msg = string_copy(msg, 1, msg_index);
    
    if (msg_index % 4 == 0 && msg_index != string_length(msg)) {
        audio_sound_pitch(sfx_Typewriter, random_range(0.5, 1.5));
        audio_play_sound(sfx_Typewriter, 1, false);
    }
}
