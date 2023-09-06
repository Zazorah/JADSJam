
// Weapon Info
damage = 0;             // How much damage the projectiles do.
air_life = -1;          // Lifetime in air. -1 is infinite.
ground_life = 0;        // Lifetime after hitting a wall.
exploding = false;      // Wehther or not it explodes on death.
mov_spd = 4;            // How quickly the projectile moves.
debuff = noone;         // Debuff to apply on hit.
buff = noone;           // Buff to apply on use.

// Position
var angle = point_direction(x, y, mouse_x, mouse_y);
image_angle = angle;
direction = angle;