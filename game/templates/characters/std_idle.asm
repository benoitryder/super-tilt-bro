; Choose between falling or idle depending if grounded
{char_name}_start_inactive_state:
.(
	lda player_a_grounded, x
	bne idle

	fall:
		jmp {char_name}_start_falling
		; No return, jump to subroutine

	idle:
	; Fallthrough to {char_name}_start_idle
.)

.(
	SUBSTATE_SLOWING = 0
	SUBSTATE_STOPPED = 1

	&{char_name}_start_idle:
	.(
		; Set the player's state
		lda #{char_name_upper}_STATE_IDLE
		sta player_a_state, x

		; Set substate
		lda #SUBSTATE_SLOWING
		sta player_a_state_field1, x

		; Set the appropriate animation
		lda #<{char_name}_anim_idle
		sta tmpfield13
		lda #>{char_name}_anim_idle
		sta tmpfield14
		jmp set_player_animation

		;rts ; useless, jump to subroutine
	.)

	&{char_name}_tick_idle:
	.(
#ifldef {char_name}_global_tick
		jsr {char_name}_global_tick
#endif

		; Check if we stopped moving (and should change substate)
		lda player_a_velocity_h, x
		bne substate_ok
		lda player_a_velocity_h_low, x
		bne substate_ok
			lda #1
			sta player_a_state_field1, x
		substate_ok

		; Apply friction
		lda player_a_state_field1, x
		bne stopped
			slowing:
				; Do not move, velocity tends toward vector (0,0)
				lda #$00
				sta tmpfield4
				sta tmpfield3
				sta tmpfield2
				sta tmpfield1
				lda #$ff ;NOTE should be a character's constant, or use ground friction (and remove substate)
				sta tmpfield5
				jsr merge_to_player_velocity
				jmp friction_ok
			stopped:
				jsr {char_name}_apply_ground_friction
		friction_ok:

		; Force handling directional controls
		;   we want to start running even if button presses where maintained from previous state
		lda controller_a_btns, x
		cmp #CONTROLLER_INPUT_LEFT
		bne no_left
			jmp input_idle_left
			; No return, jump to subroutine
		no_left:
			cmp #CONTROLLER_INPUT_RIGHT
			bne end
				jmp input_idle_right
				; No return, jump to subroutine

		end:
		rts
	.)

	&{char_name}_input_idle:
	.(
		; Do not handle any input if under hitstun
		lda player_a_hitstun, x
		bne no_input

			; Check state changes
			lda #<input_table
			sta tmpfield1
			lda #>input_table
			sta tmpfield2
			lda #INPUT_TABLE_LENGTH
			sta tmpfield3
			jmp controller_callbacks

		no_input:
		rts

		input_table:
		!place "{char_name_upper}_IDLE_INPUTS_TABLE"

		input_idle_jump_right:
		.(
			lda DIRECTION_RIGHT
			sta player_a_direction, x
			jmp {char_name}_start_jumping
			;rts ; useless, jump to subroutine
		.)

		input_idle_jump_left:
		.(
			lda DIRECTION_LEFT
			sta player_a_direction, x
			jmp {char_name}_start_jumping
			;rts ; useless, jump to subroutine
		.)

		input_idle_tilt_left:
		.(
			lda DIRECTION_LEFT
			sta player_a_direction, x
			jmp {char_name}_start_side_tilt
			;rts ; useless, jump to subroutine
		.)

		input_idle_tilt_right:
		.(
			lda DIRECTION_RIGHT
			sta player_a_direction, x
			jmp {char_name}_start_side_tilt
			;rts ; useless, jump to subroutine
		.)
	.)

	input_idle_left:
	.(
		lda DIRECTION_LEFT
		sta player_a_direction, x
		jsr {char_name}_start_running
		rts
	.)

	input_idle_right:
	.(
		lda DIRECTION_RIGHT
		sta player_a_direction, x
		jsr {char_name}_start_running
		rts
	.)
.)
