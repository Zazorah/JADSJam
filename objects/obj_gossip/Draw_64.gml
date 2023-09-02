var p_alpha = draw_get_alpha();

if(textbox_state != gossip_textbox_states.closed && textbox_state != gossip_textbox_states.init && current_message != noone) {

	draw_set_alpha(current_alpha);
	
	#region Portrait (behind)
	
	if(current_message.portrait > -1 && portrait_behind) {
		draw_set_alpha(current_alpha);
		draw_sprite
		(
			current_message.portrait,
			portrait_timer, 
			textbox_position.x + current_offset.x + portrait_offset.x, 
			textbox_position.y + current_offset.y + portrait_offset.y
		);
		
		if(gossip_debug) {
			var spr_width = sprite_get_width(current_message.portrait);
			var spr_height = sprite_get_height(current_message.portrait);
			draw_set_color(c_yellow);
			draw_line(textbox_position.x + current_offset.x, textbox_position.y + current_offset.y, textbox_position.x + current_offset.x + portrait_offset.x, textbox_position.y + current_offset.y + portrait_offset.y);
			draw_set_color(c_purple);
			draw_set_alpha(.5)
			draw_rectangle(textbox_position.x + current_offset.x + portrait_offset.x, textbox_position.y + current_offset.y + portrait_offset.y, textbox_position.x + current_offset.x + portrait_offset.x + spr_width, textbox_position.y + current_offset.y + portrait_offset.y + spr_height, false);
			draw_set_alpha(current_alpha);
			draw_set_color(c_white);
		}
	}
	
	#endregion

	#region Textbox

	if(draw_textbox) {
	
		if(textbox_is_tiled) {
		
			gossip_draw_window
			(
				textbox_position.x + current_offset.x,
				textbox_position.y + current_offset.y,
				textbox_dimensions.width * current_dimensions.width, 
				textbox_dimensions.height * current_dimensions.height, 
				textbox_theme, 
				textbox_theme_index
			);
		
		} else {
		
			draw_sprite(textbox_theme, textbox_theme_index, textbox_position.x, textbox_position.y);
		}	
	}
	
	if(gossip_debug) {
		
		draw_set_color(c_yellow);
		draw_rectangle(textbox_position.x + current_offset.x, textbox_position.y + current_offset.y, textbox_position.x + current_offset.x + textbox_dimensions.width * textbox_dimensions.width, textbox_position.y + current_offset.y + textbox_dimensions.height * textbox_dimensions.height, true);
		draw_set_color(c_white);
		
	}	

	#endregion

	#region Nametag

	if(draw_nametag) {
	
		if(nametag_is_tiled) {
		
			draw_set_font(asset_get_index(nametag_font));
			
			gossip_draw_window
			(
				textbox_position.x + nametag_offset.x + current_offset.x, 
				textbox_position.y + nametag_offset.y + current_offset.y, 
				nametag_is_fit ? max(string_width(current_message.name) + nametag_padding.left + nametag_padding.right, nametag_min_width) : nametag_dimensions.width, 
				nametag_dimensions.height, 
				nametag_theme, 
				nametag_theme_index
			);
		
		} else {
		
			draw_sprite(nametag_theme, nametag_theme_index, textbox_position.x + nametag_offset.x, textbox_position.y + nametag_offset.y);
		}
	
		nametag_scribble = scribble(current_message.name);
		nametag_scribble.starting_format(nametag_font, nametag_font_color);

		if(nametag_typewriter.is_enabled) {

			nametag_scribble.typewriter_in
			(
				nametag_typewriter.speed, 
				nametag_typewriter.smoothness
			);
			
			nametag_scribble.typewriter_ease
			(
				nametag_typewriter.ease.ease_method,
				nametag_typewriter.ease.offset.x,
				nametag_typewriter.ease.offset.y,
				nametag_typewriter.ease.scale.x,
				nametag_typewriter.ease.scale.y,
				nametag_typewriter.ease.rotation,
				nametag_typewriter.ease.alpha_duration
			);
	
		} 

		nametag_scribble.draw
		(
			textbox_position.x + nametag_offset.x + current_offset.x + nametag_padding.left,
			textbox_position.y + nametag_offset.y + current_offset.y + nametag_padding.top,
		);
	}

	#endregion

	#region Text

	if(textbox_state == gossip_textbox_states.open) {

		textbox_scribble.starting_format(textbox_font, textbox_font_color);

		if(textbox_typewriter.is_enabled) {

			textbox_scribble.typewriter_in
			(
				textbox_typewriter.speed * (input_holding && textbox_allow_speed_up ? textbox_typewriter.speedup : 1), 
				textbox_typewriter.smoothness
			);

			if(current_message.sounds != noone) {
			
				textbox_scribble.typewriter_sound_per_char
				(
					current_message.sounds, 
					1, 
					1
				);
			
			}
	
		}
		
		textbox_scribble.wrap
		(
			textbox_dimensions.width - textbox_padding.left - textbox_padding.right, 
			textbox_dimensions.height - textbox_padding.top - textbox_padding.bottom
		);

		textbox_scribble.draw
		(
			textbox_position.x + textbox_padding.left,
			textbox_position.y + textbox_padding.top,
		);
		
		if(textbox_scribble.get_typewriter_state() == 1 && !current_message.question_flag) {
			
			draw_sprite
			(
				textbox_proceed_arrow, 
				floor(textbox_timer * textbox_proceed_arrow_speed),
				textbox_position.x + current_offset.x + textbox_dimensions.width - textbox_proceed_arrow_offset.x, 
				textbox_position.y + current_offset.y + textbox_dimensions.height - textbox_proceed_arrow_offset.y
			);
		}
		
	}

	#endregion
	
	#region Portrait (in front)
	
	if(current_message.portrait > -1 && !portrait_behind) {
		draw_set_alpha(current_alpha);
		draw_sprite
		(
			current_message.portrait,
			portrait_timer, 
			textbox_position.x + current_offset.x + portrait_offset.x, 
			textbox_position.y + current_offset.y + portrait_offset.y
		);
		
		if(gossip_debug) {
			var spr_width = sprite_get_width(current_message.portrait);
			var spr_height = sprite_get_height(current_message.portrait);
			draw_set_color(c_yellow);
			draw_line(textbox_position.x + current_offset.x, textbox_position.y + current_offset.y, textbox_position.x + current_offset.x + portrait_offset.x, textbox_position.y + current_offset.y + portrait_offset.y);
			draw_set_color(c_purple);
			draw_set_alpha(.5)
			draw_rectangle(textbox_position.x + current_offset.x + portrait_offset.x, textbox_position.y + current_offset.y + portrait_offset.y, textbox_position.x + current_offset.x + portrait_offset.x + spr_width, textbox_position.y + current_offset.y + portrait_offset.y + spr_height, false);
			draw_set_alpha(current_alpha);
			draw_set_color(c_white);
		}
	}
	
	#endregion
	
	#region Question box
	
	if(textbox_state == gossip_textbox_states.open) {
		
		if(textbox_scribble.get_typewriter_state() == 1 && current_message.question_flag) {
			
			var qb_pos = {};
		
			switch(question_box_location) {
		
				case(gossip_question_box_locations.top_left):
			
					qb_pos = {
						x: textbox_position.x + question_box_offset.x,
						y: textbox_position.y - question_box_dimensions.height + question_box_offset.y
					}
			
				break;
			
				case(gossip_question_box_locations.top_right):
				
					qb_pos = {
						x: textbox_position.x + textbox_dimensions.width - question_box_dimensions.width + question_box_offset.x,
						y: textbox_position.y - question_box_dimensions.height + question_box_offset.y
					}
			
				break;
			
				case(gossip_question_box_locations.bottom_left):
			
					qb_pos = {
						x: textbox_position.x + question_box_offset.x,
						y: textbox_position.y + textbox_dimensions.height + question_box_offset.y
					}
			
				break;
			
				case(gossip_question_box_locations.bottom_right):
			
					qb_pos = {
						x: textbox_position.x + textbox_dimensions.width - question_box_dimensions.width + question_box_offset.x,
						y: textbox_position.y + textbox_dimensions.height + question_box_offset.y
					}
				
				break;
				
			}
		
			ds_list_clear(question_box_answer_positions);

			var textbox_font_asset = asset_get_index(textbox_font);
			draw_set_font(textbox_font_asset);
		
			var max_answer_width = -1;
			var answer_height = string_height("W") + 2;
			
			var clean_answers = ds_list_create();
		
			for(var i = 0; i < array_length(current_message.answers); i++) {
				var answer = current_message.answers[i].option;
				var ans_scribble = scribble(__bracket(question_box_font) + __bracket(question_box_font_color) + answer);
				var clean_answer = __string_clean(answer)
				ds_list_add(clean_answers, clean_answer);
				var answer_width = string_width(clean_answer);
				if(answer_width > max_answer_width) {
					max_answer_width = answer_width;
				}
			}

			var height_of_answers = (answer_height * array_length(current_message.answers));
			var height_of_spaces = (question_box_option_spacing * (array_length(current_message.answers) - 1));
		
			question_box_dimensions.width = max_answer_width + question_box_padding.left + question_box_padding.right;
			question_box_dimensions.height = height_of_answers + height_of_spaces + question_box_padding.top + question_box_padding.bottom;

			gossip_draw_window(qb_pos.x, qb_pos.y, question_box_dimensions.width, question_box_dimensions.height, question_box_theme, question_box_theme_index);
		
			var ans_pos = {
				x: question_box_padding.left,
				y: question_box_padding.top
			};
			
			var answer_pos = {};
			var answer_align = fa_left;
			
			switch(question_box_location) {
		
				case(gossip_question_box_locations.top_left):
				case(gossip_question_box_locations.bottom_left):
				
					answer_pos = {
						x: question_box_dimensions.width - question_box_padding.right,
						y: question_box_padding.top
					}
					
					answer_align = fa_right;
					
				break;
			}
			
			ds_list_clear(question_box_answer_positions);
		
			for(var i = 0; i < array_length(current_message.answers); i++) {

				var answer = current_message.answers[i].option;
				ans_scribble = scribble(__bracket(question_box_font) + __bracket(question_box_font_color) + answer);
				
				ans_scribble
				.align(answer_align)
				.blend(c_white, question_box_current_choice == i ? 1 : .65)
				.draw(qb_pos.x + ans_pos.x, qb_pos.y + ans_pos.y);
				
				var dimensions = {
					width: string_width(clean_answers[|i]),
					height: string_height(clean_answers[|i])
				}

				if(gossip_debug) {
					draw_set_alpha(.35);
					draw_set_color(c_green);
					draw_rectangle(qb_pos.x + ans_pos.x, qb_pos.y + ans_pos.y, qb_pos.x + ans_pos.x + dimensions.width, qb_pos.y + ans_pos.y + dimensions.height, false);
					draw_set_color(c_purple);
					draw_rectangle(qb_pos.x + ans_pos.x, qb_pos.y + ans_pos.y + dimensions.height, qb_pos.x + ans_pos.x + dimensions.width, qb_pos.y + ans_pos.y + dimensions.height + question_box_option_spacing, false);
					draw_set_color(c_white);
					draw_set_alpha(current_alpha);
				}

				var ans_pos_center_pos = {
					x: qb_pos.x + ans_pos.x,
					y: qb_pos.y + ans_pos.y
				};
				
				ans_pos_center_pos.y += answer_height / 2;
				ds_list_add(question_box_answer_positions, ans_pos_center_pos);
				
				ans_pos.y += answer_height + question_box_option_spacing;
			}
			
			ds_list_destroy(clean_answers);

			draw_sprite_ext
			(
				question_box_option_arrow, 
				question_box_arrow_timer, 
				question_box_option_arrow_position.x,
				question_box_option_arrow_position.y,
				answer_align == fa_right ? -1 : 1,
				1,
				0,
				c_white,
				current_alpha
			);
			
			if(gossip_debug) {
				draw_set_color(c_yellow);
				draw_rectangle(qb_pos.x, qb_pos.y, qb_pos.x + question_box_dimensions.width - 1, qb_pos.y + question_box_dimensions.height, true);
				draw_set_alpha(.5);
				draw_set_color(c_red);
				draw_rectangle(qb_pos.x, qb_pos.y, qb_pos.x + question_box_padding.left, qb_pos.y + question_box_dimensions.height, false);
				draw_rectangle(qb_pos.x + question_box_dimensions.width - question_box_padding.right, qb_pos.y, qb_pos.x + question_box_dimensions.width, qb_pos.y + question_box_dimensions.height, false);
				draw_rectangle(qb_pos.x, qb_pos.y, qb_pos.x + question_box_dimensions.width, qb_pos.y + question_box_padding.top, false);
				draw_rectangle(qb_pos.x, qb_pos.y + question_box_dimensions.height - question_box_padding.bottom, qb_pos.x + question_box_dimensions.width, qb_pos.y + question_box_dimensions.height, false);
				draw_set_color(c_white);
				draw_set_alpha(current_alpha);
			}
			
		}
	}
	
	#endregion

}

draw_set_alpha(p_alpha);