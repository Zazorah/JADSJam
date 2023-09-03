function Item(_name = "Knife") constructor {
    
    name = _name;
    description = "Your trusty kitchen knife. A great last line of defence.";
    
    icon_sprite = spr_Icon_Knife;
    held_sprite = spr_Icon_Knife;
    bullet_sprite = spr_Bullet_Knife;
    
    // General States and Objects
    droppable = false;      // Whether or not you can drop it in your pot.
    cut_result = noone;     // Result when used on a cutting board.
    projectile = noone;     // What projectile type to spawn when thrown.
    
    // Weapon Info
    damage = 1;             // How much damage the projectiles do.
    air_life = -1;          // Lifetime in air. -1 is infinite.
    ground_life = 0;        // Lifetime after hitting a wall.
    exploding = false;      // Wehther or not it explodes on death.
    mov_spd = 4;            // How quickly the projectile moves.
    debuff = noone;         // Debuff to apply on hit.
    buff = noone;           // Buff to apply on use.
    
    // Potted Values
    potted_value = 15;      // Score value when put in your pot.
    mixed_multiplier = 1.5; // Score multiplier when mixed in.
    
    // Timer
    reload_timer = 0;       // Amount of time before item can be used again.
    reload_timer_cap = 15;  // How many frames before next use is avaialable.
}

enum Buffs {
    
    Shield,         // Provides a shield that prevents damage for one hit.
    Haste,          // Improves movement speed.
    Anger,          // Damage done by items is increased.
    Invicibility
}
