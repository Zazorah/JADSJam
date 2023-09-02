/// @description Transition
fade = false;
spawn = false;
counter = -1;
timer = 1;
done = false;
sprite = spr_transition_square;

//Size of your transition sprite. Must be power of 2.
spritesize = 16;

//Width & Height of your screen
screenWidth = 512 * 3;
screenHeight = 288 * 3;

width = screenWidth / spritesize;
height = screenHeight / spritesize;

destination = rm_001;