
// Properties
hp = 4;

// State
bounds = false;

// Draw
xscale = 1; xscale_spd = 0;
yscale = 1; yscale_spd = 0;
flash_frames = 0;

// Object References
drop = "Green Root"

// Functions
deal_damage = function(_amt) {
    hp -= _amt;
    
    // Scale
    var addition = choose(-0.2, -0.1, 0.1, 0.2);
    xscale += addition;
    yscale -= addition;
    
    // Flash
    flash_frames += 4;
	
	// Play Hit Sound
	audio_sound_pitch(sfx_Explosion, random_range(0.6, 1.6));
	audio_play_sound(sfx_Explosion, 0, false);
}