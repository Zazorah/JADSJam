
// Shrink and Die
if (life > 0) {
    life--;
} else {
    scale -= 0.1;
    if (scale == 0) {
        instance_destroy();
    }
}