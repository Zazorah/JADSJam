
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
}