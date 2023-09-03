// Properties
max_speed = 2;			// Max speed the player can move.
speed_inc = 2;			// Rate speed increases at.

dash_addition = 2;		// Amount added to max speed when dashing.
dash_timer_max = 15;	// Length of a dash in frames.

mask_index = spr_Player_Idle;

// Movement
hspd = 0;	// Horizontal speed.
vspd = 0;	// Vertical speed.
dash_timer = 0;	// How long is left in a dash.
z = 0;		// Distance from ground. Psuedo 3D stuff.

// Draw
xscale = 1;	// Sprite scale of player.
yscale = 1; // Sprite scale of player.
dir_facing = 1;
face_scale = 1;

// State
dashing = false;	
hurt = false;		// If true, out of player's control.
