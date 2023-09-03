
// Wobble
xscale_spd = lerp(xscale_spd, (1 - xscale) * 0.5, 0.1);
yscale_spd = lerp(yscale_spd, (1 - yscale) * 0.5, 0.1);
xscale += xscale_spd;
yscale += yscale_spd;

// Flash Frames
if (flash_frames > 0) {
    flash_frames--;
}

// Die if dead.
if (hp <= 0) {
    instance_destroy();
}