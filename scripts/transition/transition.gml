/// @description transition(sprite);
function transition(_room, _sprite = spr_transition_square) {
	if (instance_exists(obj_transition_manager))
	{
	    if (!obj_transition_manager.fade) 
	    {
	        obj_transition_manager.fade = true;
	        obj_transition_manager.sprite = _sprite;
			obj_transition_manager.destination = _room;
	    }
	}
	else
	{
	    instance_create(0, 0, obj_transition_manager);
	    obj_transition_manager.fade = true;
	    obj_transition_manager.sprite = _sprite;
		obj_transition_manager.destination = _room;
	}



}
