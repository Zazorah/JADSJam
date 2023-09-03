
speed = mov_spd;


// Destroy and Deal Damage
var will_destroy = false;
var meeting = ds_list_create();
instance_place_list(x, y, par_Solid, meeting, true);
for (var i = 0; i < ds_list_size(meeting); i++) {
    
    var _inst = meeting[| i];
    
    // Just a wall. Mark for deletion but don't yet in case it also will hit
    // an enemy.
    if (_inst.object_index == par_Solid) {
        will_destroy = true;
    }
    
    // An enemy
    if (_inst.object_index == par_Enemy) {
        _inst.deal_damage(damage);
        instance_destroy();
    }
}

if (will_destroy) {
    instance_destroy();
}