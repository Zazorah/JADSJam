
// Rooms
play_room = rm_001;

// Go to Starting Room
room_goto(play_room);

// Inventory
inventory = array_create(8);
inventory[0] = new Item("Knife");   // Add knife to inventory
inventory[0].projectile = obj_Projectile_Direct;
inventory_index = 0;

// DEBUG - Adding fake items for inventory testing
red = new Item();
red.icon_sprite = spr_Icon_Red;
inventory[1] = red;

green = new Item();
green.icon_sprite = spr_Icon_Green;
inventory[2] = green;

blue = new Item();
blue.icon_sprite = spr_Icon_Blue;
inventory[3] = blue;

// State
timer = 18000;
timer_active = false;
timer_alpha = 0;

hp = 4;

// Effects
freeze_frame = 0;

// Save Data

// UI Icon Struct
function UIIcon(_index = 0) constructor {
    
    index = _index;
    scale = 1;
    scale_spd = 0;
    
    size = 72;
    radius = 4;
    
    angle = 0;
    angle_spd = 0;
}

i_icons = array_create(0);
for (var i = 0; i < array_length(inventory); i++) {
    array_push(i_icons, new UIIcon(i));
}