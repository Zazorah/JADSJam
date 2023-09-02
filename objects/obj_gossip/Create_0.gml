scribble_font_add_all();

#region Styling initialization (re-defined & elaborated in gossip_set_style)

enum gossip_transitions {
	fade_in,
	fade_out,
	sweep_left,
	sweep_right,
	sweep_down,
	sweep_up,
	none
}

//Textbox
textbox_font                = "";
textbox_font_color          = "";
textbox_line_height         = 0;
textbox_theme               = noone;
textbox_theme_index         = 0;
textbox_is_tiled            = false;
draw_textbox                = false;
textbox_transition_in       = gossip_transitions.none;
textbox_transition_out      = gossip_transitions.none;
textbox_transition_speed    = 10;
textbox_proceed_arrow       = noone;
textbox_proceed_arrow_speed = 10;

textbox_typewriter = {
	is_enabled: false,
	speedup: 2,
	speed: .35,
	smoothness: 1,
	ease: {
		ease_method: SCRIBBLE_EASE.QUAD,
		offset: {
			x: 0,
			y: 0
		},
		scale: {
			x: 0,
			y: 0
		},
		rotation: 0,
		alpha_duration: 1
	}
};

textbox_position = {
	x: 0,
	y: 0
};

textbox_dimensions = {
	width: 0,
	height: 0
};

textbox_padding = {
	left:   0,
	right:  0,
	top:    0,
	bottom: 0
};

textbox_proceed_arrow_offset = {
	x: 0,
	y: 0
}

//Nametag
nametag_font        = "";
nametag_font_color  = "";
nametag_theme       = noone;
nametag_theme_index = 0;
nametag_is_tiled    = true;
draw_nametag        = true;

nametag_typewriter = {
	is_enabled: false,
	speed: .35,
	smoothness: 1,
	ease: {
		ease_method: SCRIBBLE_EASE.QUAD,
		offset: {
			x: 0,
			y: 0
		},
		scale: {
			x: 0,
			y: 0
		},
		rotation: 0,
		alpha_duration: 1
	}
};

nametag_offset = {
	x: 0,
	y: 0
};

nametag_dimensions = {
	width: 0,
	height: 0
};

nametag_padding = {
	left:   0,
	right:  0,
	top:    0,
	bottom: 0
};

//Portrait
portrait_sprite = noone;
portrait_speed = 0;
portrait_behind = false;

portrait_offset = {
	x: 0,
	y: 0
}

//Question box
enum gossip_question_box_locations {
	top_left,
	top_right,
	bottom_left,
	bottom_right
}

question_box_font               = "";
question_box_font_color         = "";
question_box_theme              = noone;
question_box_theme_index        = 0;
question_box_location           = gossip_question_box_locations.top_left;
question_box_option_spacing     = 0;
question_box_option_arrow       = noone;
question_box_option_arrow_speed = 1;

question_box_offset = {
	x: 0,
	y: 0
};

question_box_padding = {
	left:   0,
	right:  0,
	top:    0,
	bottom: 0
};

gossip_set_style();

#endregion

#region Current style parameters

current_alpha = 0; //The current alpha the the textbox

current_dimensions = { //The current dimensions (for transitions)
	width: 0,
	height: 0
};

current_offset = { //The current offset (for transitions)
	x: 0,
	y: 0
};

#endregion

#region Gossip Properties

enum gossip_textbox_states { //Overall states that gossip can be in
	init,
	opening,
	open,
	closing,
	closed
};

enum gossip_typing_states { //The state of the typewriter
	typing,
	waiting_for_input
};

textbox_state = gossip_textbox_states.closed; //The current state of the textbox
typing_state = gossip_typing_states.waiting_for_input; //The current state of the typewriter
current_message = noone; //The current message the textbox is processing
textbox_scribble = noone; //The scribble object for the textbox text
nametag_scribble = noone; //The scribble object for the nametag text
textbox_allow_speed_up = false; //Whether speeding up text is allowed
textbox_dt = 0; //the current delta time
textbox_timer = 0; //A timer for the textbox transitions
portrait_timer = 0; //A timer for the portrait animations
question_box_arrow_timer = 0; //A timer for the question box arrow
question_box_current_choice = 0; //The current choice the player is hovered over
question_box_answer_positions = ds_list_create(); //The positions of the question box answers on the screen

question_box_dimensions = { //The dimensions of the question box
	width: 0,
	height: 0
};

question_box_option_arrow_snap = false; //Whether the option arrow has snapped to position yet (don't change!)

question_box_option_arrow_position = { //The current position of the question box arrow
	x: 0,
	y: 0
};

#endregion

#region Input

input_holding = false; //Whether the holding button is pressed
input_proceed = false; //Whether the proceed button is pressed
input_proceed_release = false; //Whether you have released the proceed button
input_skip = false; //Whether the skip text button has been pressed
input_up = false; //Whether the "up" choice for input has been pressed
input_down = false; //Whether the "down" choice for input has been pressed
option_changed = false; //Whether the current option has been changed

#endregion

#region Initialization

gossip_debug = false; //Whether gossip is in debug mode (for testing only)
global.gossip_dialogue_sheets = ds_list_create(); //The list of dialogue sheets
global.gossip_dialogue_sheet_names = ds_map_create(); //The names of dialogue sheets (input is sheet ID)
global.gossip_dialogue_sheet_indexes = ds_map_create(); //The sheet IDs of dialogue sheets (input is name)
global.gossip_dialogue_sheet_lookup_tables = ds_list_create(); //The lookup tables for individual dialogue sheets (input is sheet ID)

gossip_scan_dialogue_sheets(); //Scans the dialogue sheets in included files (MUST LIST .CSV FILES IN GOSSIP_SCAN_DIALOGUE_SHEETS!)

#endregion