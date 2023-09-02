/// @description Done
if (done)
{
    room_goto(destination);
    done = false;
}

///Transition

// For testing purposes press any key to start the transition!
// Comment out the next line when you put this into your game!
if (keyboard_check_pressed(vk_anykey)) fade = true;

//Start Transition
if (fade)
{
    //Increment our timer
    timer += 1/room_speed;
    
    if (timer % 4)
    {
        //If our counter is less than the width of the screen, Start spawning!
        if (counter < width) spawn = true;
        counter++;
    }
    
    //Start Spawning!
    if (spawn)
    {
        //Loop to spawn vertical strips of our transition objects.
        for(var i = 0; i < height; i++)
        {
            //Position
            xx = spritesize*counter;
            yy = spritesize*i;
            //Create transition object
            with(instance_create(0, 0, obj_transition))
            {
                sprite_index = obj_transition_manager.sprite;
                xx = obj_transition_manager.xx;
                yy = obj_transition_manager.yy;
            }
        }
        
        //Finished spawning our objects now set spawn to false
        spawn = false;
    }
    
    //Our screen is filled with transition objects, reset all variables
    if (counter-30 > width)
    {
        counter = -1;
        fade = false;
        timer = 1;
        done = true;
    }
}

