textbox_dt = delta_time / 999999;
textbox_timer += textbox_dt;

switch(textbox_state) {
	
	#region Initialize
	
	case(gossip_textbox_states.init):
	
		//Initializes the transition values
		gossip_init_transition();
	
	break;
	
	#endregion
	
	#region Opening
	
	case(gossip_textbox_states.opening):
	
		//Transitions into the open state
		gossip_transition_in();
	
	break;
	
	break;
	
	#endregion
	
	#region Open
	
	case(gossip_textbox_states.open):
	
		//Processes input for gossip
		gossip_process_input();
		
		//Increment the portrait timer
		portrait_timer += textbox_dt * portrait_speed;
		
		//Interpolate the question box option arrow to the correct position
		if(ds_list_size(question_box_answer_positions) > 0) {
			if(ds_list_size(question_box_answer_positions) > question_box_current_choice) {
				if(question_box_option_arrow_smooth) {
					question_box_option_arrow_position = {
						x: __lerp_snap(question_box_option_arrow_position.x, question_box_answer_positions[|question_box_current_choice].x + textbox_proceed_arrow_offset.x, textbox_dt * (option_changed ? question_box_option_arrow_speed : 100)),
						y: __lerp_snap(question_box_option_arrow_position.y, question_box_answer_positions[|question_box_current_choice].y + textbox_proceed_arrow_offset.y, textbox_dt * (option_changed ? question_box_option_arrow_speed : 100)),
					}
				} else {
					question_box_option_arrow_position = {
						x: question_box_answer_positions[|question_box_current_choice].x + textbox_proceed_arrow_offset.x,
						y: question_box_answer_positions[|question_box_current_choice].y + textbox_proceed_arrow_offset.y
					}
				}
			}
		}

		//If the typewriter is done typing...
		if(textbox_scribble.get_typewriter_state() == 1) {
			
			//Assume not proceeded yet
			var proceeded = false;
			
			//Increment the textbox arrow timer
			question_box_arrow_timer += textbox_dt * question_box_option_arrow_speed;
			
			//If the question box arrow has not snapped to position yet, snap it
			if(!question_box_option_arrow_snap) {
				question_box_option_arrow_snap = true;
			}
			
			//If the message is the last message...
			if(current_message.end_flag) {
				
				//If you proceed, end the dialogue
				if(input_proceed) {
					proceeded = true;
					gossip_end();
				}
			
			//Else, if it's a normal message...
			} else if(!current_message.question_flag) {
				
				//Proceed
				if(input_proceed || input_skip) {
					proceeded = true;
					
					//If a "goto" exists on a regular message, take the current message to it
					if(current_message.goto == "") {
						gossip_proceed();
					} else {
						current_message = gossip_get_message_from_conversation_key(gossip_sheet_index_to_name(current_message.sheet_index), current_message.goto);
					}
					
					gossip_message_changed();
				}
			
			//Else, if it's question & answer...
			} else {
				
				//If you input-up, select the answer above
				if(input_up) {
					
					option_changed = true;
					question_box_current_choice--;
					
					if(question_box_current_choice < 0) {
						question_box_current_choice = 0;
					}
				
				//If input down, select the answer below
				} else if(input_down) {
					
					option_changed = true;
					question_box_current_choice++;
					
					var max_choice = array_length(current_message.answers);
					if(question_box_current_choice >= max_choice) {
						question_box_current_choice = max_choice - 1;;
					}
				
				//If proceed, go to the option selected
				} else if(input_proceed) {
					proceeded = true;
					gossip_select_choice(question_box_current_choice);
					gossip_message_changed();
				}
				
			}
			
			//If you have proceeded, reset the typewriter values
			if(proceeded) {
				textbox_scribble.typewriter_reset();
				textbox_allow_speed_up = false;
				option_changed = false;
			}
			
		//Else, if the typewriter isn't finished typing...
		} else {
			
			//If you can speed up text, speed it up
			if(input_proceed_release) {
				textbox_allow_speed_up = true;
			}
			
			//If it is a question, set up/reset variables for the question box
			if(current_message.question_flag) {
				question_box_option_arrow_snap = false;
				question_box_current_choice = 0;
			}
			
			//Skip text
			if(input_skip) {
				textbox_scribble.typewriter_skip()
			}
		}
	
	break;
	
	#endregion
	
	#region Closing
	
	case(gossip_textbox_states.closing):
	
		//Transition out of the open state
		gossip_transition_out();
	
	break;
	
	#endregion
	
	#region Closed
	
	case(gossip_textbox_states.closed):
	
	break;
	
	#endregion
	
}