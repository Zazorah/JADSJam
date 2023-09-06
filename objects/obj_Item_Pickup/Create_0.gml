
// Item Info
item = new Item();
item.projectile = obj_Projectile_Direct;

// State
in_range = false;

// Draw
xscale = 0.5;
yscale = 0.5;
rot_scale = 1; rot_direction = -1;
rot_timer = 60 + irandom(10);

border_scale = 0;

hover = 0; hover_offset = irandom(10);
angle_speed = 0;