#define NB_OPTIONS 3
#define CHARACTER_SELECTION_OPTION_CHARACTER_PALETTE 0
#define CHARACTER_SELECTION_OPTION_WEAPON 1
#define CHARACTER_SELECTION_OPTION_CHARACTER 2

CHARACTER_SELECTION_ASYNC_COPY_BYTES_PER_ITERATIONS = 32
CHARACTER_SELECTION_ASYNC_COPY_NB_ITERATIONS = 48
#if CHARACTER_SELECTION_ASYNC_COPY_NB_ITERATIONS*CHARACTER_SELECTION_ASYNC_COPY_BYTES_PER_ITERATIONS <> CHARACTERS_NUM_TILES_PER_CHAR*16
#error "Incorrect number of copied bytes"
#endif

character_selection_animation_states_addresses_lsb:
.byt <character_selection_player_a_animation, <character_selection_player_b_animation
character_selection_animation_states_addresses_msb:
.byt >character_selection_player_a_animation, >character_selection_player_b_animation

init_character_selection_screen:
.(
	.(
		SWITCH_BANK(#DATA_BANK_NUMBER)

		; Deactivate asynchronous jobs
		lda #0
		sta character_selection_player_a_async_job_active
		sta character_selection_player_b_async_job_active

		; Construct nt buffers for palettes (to avoid changing it mid-frame)
		lda #<palette_character_selection
		sta tmpfield1
		lda #>palette_character_selection
		sta tmpfield2
		jsr construct_palettes_nt_buffer

		; Copy background from PRG-rom to PPU nametable
		lda #<nametable_character_selection
		sta tmpfield1
		lda #>nametable_character_selection
		sta tmpfield2
		jsr draw_zipped_nametable

		; Store characters' tiles in CHR
		; TODO avoid palette change midframe (can wait vblank or create an nt buffers)
		ldx #0
		jsr place_character_ppu_tiles
		ldx #1
		jsr place_character_ppu_tiles

		; Initialize player A's animation state
		ldx #0
		ldy config_player_a_character, x
		SWITCH_BANK(characters_bank_number COMMA y)

		lda #<character_selection_player_a_animation
		sta tmpfield11
		lda #>character_selection_player_a_animation
		sta tmpfield12

		lda characters_properties_lsb, y
		sta tmpfield1
		lda characters_properties_msb, y
		sta tmpfield2
		ldy #CHARACTERS_PROPERTIES_MENU_SELECT_ANIM_OFFSET
		lda (tmpfield1), y
		sta tmpfield13
		iny
		lda (tmpfield1), y
		sta tmpfield14

		jsr animation_init_state

		lda #INGAME_PLAYER_A_FIRST_SPRITE
		sta character_selection_player_a_animation+ANIMATION_STATE_OFFSET_FIRST_SPRITE_NUM
		lda #INGAME_PLAYER_A_LAST_SPRITE
		sta character_selection_player_a_animation+ANIMATION_STATE_OFFSET_LAST_SPRITE_NUM
		lda #$44
		sta character_selection_player_a_animation+ANIMATION_STATE_OFFSET_X_LSB
		lda #$58
		sta character_selection_player_a_animation+ANIMATION_STATE_OFFSET_Y_LSB

		; Initialize player B's animation state
		ldx #1
		ldy config_player_a_character, x
		SWITCH_BANK(characters_bank_number COMMA y)

		lda #<character_selection_player_b_animation
		sta tmpfield11
		lda #>character_selection_player_b_animation
		sta tmpfield12

		lda characters_properties_lsb, y
		sta tmpfield1
		lda characters_properties_msb, y
		sta tmpfield2
		ldy #CHARACTERS_PROPERTIES_MENU_SELECT_ANIM_OFFSET
		lda (tmpfield1), y
		sta tmpfield13
		iny
		lda (tmpfield1), y
		sta tmpfield14

		jsr animation_init_state

		lda #INGAME_PLAYER_B_FIRST_SPRITE
		sta character_selection_player_b_animation+ANIMATION_STATE_OFFSET_FIRST_SPRITE_NUM
		lda #INGAME_PLAYER_B_LAST_SPRITE
		sta character_selection_player_b_animation+ANIMATION_STATE_OFFSET_LAST_SPRITE_NUM
		lda #$b4
		sta character_selection_player_b_animation+ANIMATION_STATE_OFFSET_X_LSB
		lda #$58
		sta character_selection_player_b_animation+ANIMATION_STATE_OFFSET_Y_LSB

		; Init local options values from global state
		lda #2
		sta character_selection_player_a_selected_option
		sta character_selection_player_b_selected_option

		; Adapt to configuration's state
		jsr character_selection_update_screen

		; Wait VBI to process nt buffers
		bit PPUSTATUS ; Clear PPUSTATUS bit 7 to avoid starting at the middle of the current VBI

		lda #$80          ;
		wait_vbi:         ; Wait for PPUSTATUS bit 7 to be set
			bit PPUSTATUS ; indicating the begining of a VBI
			beq wait_vbi  ;

		; Process the batch of nt buffers immediately (while the PPU is disabled)
		jsr process_nt_buffers
		jsr reset_nt_buffers

		rts
	.)
.)

character_selection_screen_tick:
.(
	.(
		; Clear already written buffers
		jsr reset_nt_buffers

		; Tick asynchronous jobs
		jsr async_jobs

		; Refresh players animations
		jsr character_selection_tick_animations

		; Check if a button is released and trigger correct action
		ldx #0
		check_one_controller:

		lda controller_a_btns, x
		bne next_controller

		ldy #0
		btn_search_loop:
		lda buttons_numbering, y
		cmp controller_a_last_frame_btns, x
		beq jump_from_table
		iny
		cpy #7
		bne btn_search_loop

		next_controller:
		inx
		cpx #2
		bne check_one_controller
		jmp end

		jump_from_table:
		tya
		asl
		tay
		lda buttons_actions, y
		sta tmpfield1
		lda buttons_actions+1, y
		sta tmpfield2
		jmp (tmpfield1)

		; Go to the next screen
		next_screen:
		.(
			lda #GAME_STATE_STAGE_SELECTION
			jsr change_global_game_state
			; jmp end ; not needed, change_global_game_state does not return
		.)

		previous_screen:
		.(
			lda #GAME_STATE_CONFIG
			jsr change_global_game_state
			; jmp end ; not needed, change_global_game_state does not return
		.)

		next_value:
		.(
			txa
			pha
			lda character_selection_player_a_selected_option, x
			asl
			tax
			lda next_value_handlers, x
			sta tmpfield1
			lda next_value_handlers+1, x
			sta tmpfield2
			pla
			tax
			jmp (tmpfield1)
			jmp end
		.)

		previous_value:
		.(
			txa
			pha
			lda character_selection_player_a_selected_option, x
			asl
			tax
			lda previous_value_handlers, x
			sta tmpfield1
			lda previous_value_handlers+1, x
			sta tmpfield2
			pla
			tax
			jmp (tmpfield1)
			jmp end
		.)

		next_option:
		.(
			inc character_selection_player_a_selected_option, x
			lda character_selection_player_a_selected_option, x
			cmp #NB_OPTIONS
			bne refresh_player_highlighting
			lda #0
			sta character_selection_player_a_selected_option, x

			jmp refresh_player_highlighting
		.)

		previous_option:
		.(
			dec character_selection_player_a_selected_option, x
			bpl refresh_player_highlighting
			lda #NB_OPTIONS-1
			sta character_selection_player_a_selected_option, x
			jmp refresh_player_highlighting
		.)

		refresh_player_highlighting:
		.(
			txa
			pha
			lda #CHARACTER_SELECTION_OPTION_CHARACTER_PALETTE
			sta tmpfield1
			jsr character_selection_highligh_option

			pla
			tax
			pha
			lda #CHARACTER_SELECTION_OPTION_WEAPON
			sta tmpfield1
			jsr character_selection_highligh_option

			pla
			tax
			lda #CHARACTER_SELECTION_OPTION_CHARACTER
			sta tmpfield1
			jsr character_selection_highligh_option

			jmp end
		.)

		next_character_color:
		.(
			inc config_player_a_character_palette, x
			lda config_player_a_character_palette, x
			cmp #NB_CHARACTER_PALETTES
			bne refresh_player_character_color
			lda #0
			sta config_player_a_character_palette, x
			jmp refresh_player_character_color
		.)

		previous_character_color:
		.(
			dec config_player_a_character_palette, x
			bpl refresh_player_character_color
			lda #NB_CHARACTER_PALETTES-1
			sta config_player_a_character_palette, x
			jmp refresh_player_character_color
		.)

		refresh_player_character_color:
		.(
			lda #CHARACTER_SELECTION_OPTION_CHARACTER_PALETTE
			sta tmpfield1
			jsr character_selection_draw_value
			jmp end
		.)

		next_weapon_color:
		.(
			inc config_player_a_weapon_palette, x
			lda config_player_a_weapon_palette, x
			cmp #NB_WEAPON_PALETTES
			bne refresh_player_weapon
			lda #0
			sta config_player_a_weapon_palette, x
			jmp refresh_player_weapon
		.)

		previous_weapon_color:
		.(
			dec config_player_a_weapon_palette, x
			bpl refresh_player_weapon
			lda #NB_WEAPON_PALETTES-1
			sta config_player_a_weapon_palette, x
			jmp refresh_player_weapon
		.)

		refresh_player_weapon:
		.(
			lda #CHARACTER_SELECTION_OPTION_WEAPON
			sta tmpfield1
			jsr character_selection_draw_value
			jmp end
		.)

		next_character:
		.(
			inc config_player_a_character, x
			lda config_player_a_character, x
			cmp #CHARACTERS_NUMBER
			bne refresh_player_character
			lda #0
			sta config_player_a_character, x
			jmp refresh_player_character
		.)

		previous_character:
		.(
			dec config_player_a_character, x
			bpl refresh_player_character
			lda #CHARACTERS_NUMBER-1
			sta config_player_a_character, x
			jmp refresh_player_character
		.)

		refresh_player_character:
		.(
			; Select new character's bank
			ldy config_player_a_character, x
			SWITCH_BANK(characters_bank_number COMMA y)

			; Change current animation to "invisible"
			lda character_selection_animation_states_addresses_lsb, x
			sta tmpfield11
			lda character_selection_animation_states_addresses_msb, x
			sta tmpfield12
			lda #<anim_invisible
			sta tmpfield13
			lda #>anim_invisible
			sta tmpfield14
			jsr animation_state_change_animation

			; Start animation change async job (which will copy tiles in CHR-RAM before changing animation)
			.(
				; Put PRG tiles address in job's state
				ldy config_player_a_character, x
				lda characters_tiles_data_lsb, y
				sta character_selection_player_a_async_job_prg_tiles, x
				lda characters_tiles_data_msb, y
				sta character_selection_player_a_async_job_prg_tiles_msb, x

				; Set CHR tiles address in job's state
				cpx #0
				bne player_b
					lda #<CHARACTERS_CHARACTER_A_TILES_OFFSET
					sta character_selection_player_a_async_job_ppu_tiles, x
					lda #>CHARACTERS_CHARACTER_A_TILES_OFFSET
					jmp end_set_ppu_addr
				player_b:
					lda #<CHARACTERS_CHARACTER_B_TILES_OFFSET
					sta character_selection_player_a_async_job_ppu_tiles, x
					lda #>CHARACTERS_CHARACTER_B_TILES_OFFSET
				end_set_ppu_addr:
				sta character_selection_player_a_async_job_ppu_tiles_msb, x

				; Set number of tiles to copy
				lda #CHARACTER_SELECTION_ASYNC_COPY_NB_ITERATIONS-1
				sta character_selection_player_a_async_job_ppu_write_count, x

				; Activate job
				lda #3
				sta character_selection_player_a_async_job_active, x
			.)

			jmp end
		.)

		end:
		rts

		buttons_numbering:
		.byt CONTROLLER_BTN_RIGHT, CONTROLLER_BTN_LEFT, CONTROLLER_BTN_DOWN, CONTROLLER_BTN_UP, CONTROLLER_BTN_START, CONTROLLER_BTN_B, CONTROLLER_BTN_A
		buttons_actions:
		.word next_value,          previous_value,      next_option,         previous_option,   next_screen,          previous_screen,  next_value

		next_value_handlers:
		.word next_character_color, next_weapon_color, next_character

		previous_value_handlers:
		.word previous_character_color, previous_weapon_color, previous_character
	.)

	async_jobs:
	.(
		.(
			; Do job with the highest value in "job_active" (acting as a priority)
			lda character_selection_player_a_async_job_active
			cmp character_selection_player_b_async_job_active
			bcs do_player_a_job
			jmp do_player_b_job

			do_player_a_job:
				; Do nothing if job is inactive
				lda character_selection_player_a_async_job_active
				beq end

				; Do the job
				ldx #0
				jmp tick_async_job
				; Note - jump to routine, no return

			do_player_b_job:
				; Do nothing if job is inactive
				lda character_selection_player_b_async_job_active
				beq end

				; Do the job
				ldx #1
				jmp tick_async_job
				; Note - jump to routine, no return

			end:
			rts
		.)

		tick_async_job:
		.(
			prg_tiles = tmpfield2
			prg_tiles_msb = tmpfield3
			ppu_tiles = tmpfield4
			ppu_tiles_msb = tmpfield5
			ppu_write_count = tmpfield6

			; Save character number
			stx player_number

			; Use actual value in "job_active" to choose between three steps
			;  3 - Update character palette option
			;  2 - Update weapon paelette option and character name displayed
			;  1 - Copy tiles to VRAM and change character animation (this one takes multiple frames to complete)
			lda character_selection_player_a_async_job_active, x
			cmp #3
			beq update_char_palette
			cmp #2
			beq update_weapon_palette
			jmp copy_tiles

			update_char_palette:
				option = tmpfield1

				; Set character palette option value to zero (sure to never overflow the available palettes)
				lda #0
				sta config_player_a_character_palette, x

				; Refresh new character palette name on screen
				lda #CHARACTER_SELECTION_OPTION_CHARACTER_PALETTE
				sta option
				jsr character_selection_draw_value

				; Set job to next step
				ldx player_number
				dec character_selection_player_a_async_job_active, x
				jmp end

			update_weapon_palette:
				; Set weapon palette option value to zero (sure to never overflow the available palettes)
				lda #0
				sta config_player_a_weapon_palette, x

				; Refresh new weapon palette name on screen
				lda #CHARACTER_SELECTION_OPTION_WEAPON
				sta option
				jsr character_selection_draw_value

				; Refresh character and weapon names
				ldx player_number
				lda #CHARACTER_SELECTION_OPTION_CHARACTER
				sta tmpfield1
				jsr character_selection_draw_value

				; Set job to next step
				ldx player_number
				dec character_selection_player_a_async_job_active, x
				jmp end

			copy_tiles:

			; Store job's state at fixed location
			lda character_selection_player_a_async_job_prg_tiles, x
			sta prg_tiles
			lda character_selection_player_a_async_job_prg_tiles_msb, x
			sta prg_tiles_msb
			lda character_selection_player_a_async_job_ppu_tiles, x
			sta ppu_tiles
			lda character_selection_player_a_async_job_ppu_tiles_msb, x
			sta ppu_tiles_msb
			lda character_selection_player_a_async_job_ppu_write_count, x
			sta ppu_write_count

			; Switch to character bank
			ldy config_player_a_character, x
			SWITCH_BANK(characters_bank_number COMMA y)

			; Copy a chunk of bytes
			jsr last_nt_buffer
			lda #$01
			sta nametable_buffers, x
			inx
			lda ppu_tiles_msb
			sta nametable_buffers, x
			inx
			lda ppu_tiles
			sta nametable_buffers, x
			inx
			lda #CHARACTER_SELECTION_ASYNC_COPY_BYTES_PER_ITERATIONS
			sta nametable_buffers, x
			inx

			ldy #0
			copy_one_byte:
				lda (prg_tiles), y
				sta nametable_buffers, x
				iny
				inx

				cpy #CHARACTER_SELECTION_ASYNC_COPY_BYTES_PER_ITERATIONS
				bne copy_one_byte

			lda #0
			sta nametable_buffers, x

			; Restore player number
			ldx player_number

			; Update tiles addresses to the next byte to copy
			lda #CHARACTER_SELECTION_ASYNC_COPY_BYTES_PER_ITERATIONS
			clc
			adc prg_tiles
			sta character_selection_player_a_async_job_prg_tiles, x
			lda #0
			adc prg_tiles_msb
			sta character_selection_player_a_async_job_prg_tiles_msb, x

			lda #CHARACTER_SELECTION_ASYNC_COPY_BYTES_PER_ITERATIONS
			clc
			adc ppu_tiles
			sta character_selection_player_a_async_job_ppu_tiles, x
			lda #0
			adc ppu_tiles_msb
			sta character_selection_player_a_async_job_ppu_tiles_msb, x

			; Loop
#if CHARACTER_SELECTION_ASYNC_COPY_NB_ITERATIONS >= 128
#error "This loop code expects that bit 7 of any valid ppu_write_count is not set"
#endif
			dec character_selection_player_a_async_job_ppu_write_count, x
			bmi finalize_switch
				jmp end

			finalize_switch:
				; Deactivate job
				lda #0
				sta character_selection_player_a_async_job_active, x

				; Change current animation to the new character's one
				lda character_selection_animation_states_addresses_lsb, x
				sta tmpfield11
				lda character_selection_animation_states_addresses_msb, x
				sta tmpfield12

				ldy config_player_a_character, x

				lda characters_properties_lsb, y
				sta tmpfield1
				lda characters_properties_msb, y
				sta tmpfield2
				ldy #CHARACTERS_PROPERTIES_MENU_SELECT_ANIM_OFFSET
				lda (tmpfield1), y
				sta tmpfield13
				iny
				lda (tmpfield1), y
				sta tmpfield14

				jsr animation_state_change_animation

			end:
			rts
		.)
	.)
.)

; Tick animations in characters portraits
; Overwrites all registers and all tmpfields
character_selection_tick_animations:
.(
		; Tick character A's animation
		ldx #0
		stx player_number
		ldy config_player_a_character, x
        SWITCH_BANK(characters_bank_number COMMA y)

		lda #<character_selection_player_a_animation
		sta tmpfield11
		lda #>character_selection_player_a_animation
		sta tmpfield12
		lda #0
		sta tmpfield13
		sta tmpfield14
		sta tmpfield15
		sta tmpfield16
		jsr animation_draw
		jsr animation_tick

		; Tick character B's animation
		ldx #1
		stx player_number
		ldy config_player_a_character, x
        SWITCH_BANK(characters_bank_number COMMA y)

		lda #<character_selection_player_b_animation
		sta tmpfield11
		lda #>character_selection_player_b_animation
		sta tmpfield12
		lda #0
		sta tmpfield13
		sta tmpfield14
		sta tmpfield15
		sta tmpfield16
		jsr animation_draw
		jsr animation_tick

		rts
.)

character_selection_update_screen:
.(
	option = tmpfield1

	lda #0
	sta option

	highlight_one_option:
	ldx #0
	jsr character_selection_highligh_option
	ldx #0
	jsr character_selection_draw_value
	ldx #1
	jsr character_selection_highligh_option
	ldx #1
	jsr character_selection_draw_value

	inc option
	lda option
	cmp #NB_OPTIONS
	bne highlight_one_option

	rts
.)

; Change the higlighting of an option to match its selection state
;  register X - player's number
;  tmpfield1 - Option to change
;
;  Overwrites registers, tmpfield2, tmpfield3, tmpfield4 and tmpfield5
character_selection_highligh_option:
.(
	option = tmpfield1
	buffer_index = tmpfield2
	buffer_length = tmpfield3
	buffer_vector = tmpfield4
	; tmpfield5 is buffer_vector's MSB

	; Compute the index of the buffer corresponding to the option
	;  index = 4*option + 2*X + status
	;  (with status being 0 for inactive, 1 for active)

	lda character_selection_player_a_selected_option, x
	cmp option
	bne status_inactive
	lda #1
	jmp write_status_component
	status_inactive:
	lda #0
	write_status_component:
	sta buffer_index

	txa
	asl
	; clc ; useless, asl shall not overflow
	adc buffer_index
	sta buffer_index

	lda option
	asl
	asl
	; clc ; useless, asl shall not overflow
	adc buffer_index
	sta buffer_index

	; Store buffer's information in fixed memory location

	lda buffer_index
	tax
	lda options_buffer_length, x
	sta buffer_length
	lda options_buffer_lsb, x
	sta buffer_vector
	lda options_buffer_msb, x
	sta buffer_vector+1

	; Copy the buffer to the list of buffers to be processed

	jsr last_nt_buffer
	ldy #0
	copy_one_byte:
	lda (buffer_vector), y
	sta nametable_buffers, x
	inx
	iny
	cpy buffer_length
	bne copy_one_byte
	lda #$00
	sta nametable_buffers, x

	rts

	options_buffer_length:
	.byt 14, 14, 14, 14, 7, 7, 7, 7, 7, 7, 7, 7
	options_buffer_lsb:
	.byt <buffer_player_a_character_palette_inactive, <buffer_player_a_character_palette_active
	.byt <buffer_player_b_character_palette_inactive, <buffer_player_b_character_palette_active
	.byt <buffer_player_a_weapon_inactive,            <buffer_player_a_weapon_active
	.byt <buffer_player_b_weapon_inactive,            <buffer_player_b_weapon_active
	.byt <buffer_player_a_character_inactive,         <buffer_player_a_character_active
	.byt <buffer_player_b_character_inactive,         <buffer_player_b_character_active
	options_buffer_msb:
	.byt >buffer_player_a_character_palette_inactive, >buffer_player_a_character_palette_active
	.byt >buffer_player_b_character_palette_inactive, >buffer_player_b_character_palette_active
	.byt >buffer_player_a_weapon_inactive,            >buffer_player_a_weapon_active
	.byt >buffer_player_b_weapon_inactive,            >buffer_player_b_weapon_active
	.byt >buffer_player_a_character_inactive,         >buffer_player_a_character_active
	.byt >buffer_player_b_character_inactive,         >buffer_player_b_character_active

	buffer_player_a_character_palette_active:
	.byt $01, $23, $d9, $03, %01011000, %01011010, %01010000
	.byt $01, $23, $e1, $03, %00000101, %00000101, %00000101
	buffer_player_a_character_palette_inactive:
	.byt $01, $23, $d9, $03, %00001000, %00001010, %00000000
	.byt $01, $23, $e1, $03, %00000000, %00000000, %00000000
	buffer_player_b_character_palette_active:
	.byt $01, $23, $dc, $03, %01010000, %01011010, %01010010
	.byt $01, $23, $e4, $03, %00000101, %00000101, %00000101
	buffer_player_b_character_palette_inactive:
	.byt $01, $23, $dc, $03, %00000000, %00001010, %00000010
	.byt $01, $23, $e4, $03, %00000000, %00000000, %00000000
	buffer_player_a_weapon_active:
	.byt $01, $23, $e9, $03, %00000101, %00000101, %00000101
	buffer_player_a_weapon_inactive:
	.byt $01, $23, $e9, $03, %00000000, %00000000, %00000000
	buffer_player_b_weapon_active:
	.byt $01, $23, $ec, $03, %00000101, %00000101, %00000101
	buffer_player_b_weapon_inactive:
	.byt $01, $23, $ec, $03, %00000000, %00000000, %00000000
	buffer_player_a_character_inactive:
	.byt $01, $23, $d1, $03, %10000000, %10100000, %00000000
	buffer_player_a_character_active:
	.byt $01, $23, $d1, $03, %10010000, %10100000, %00010000
	buffer_player_b_character_inactive:
	.byt $01, $23, $d4, $03, %00000000, %10100000, %00100000
	buffer_player_b_character_active:
	.byt $01, $23, $d4, $03, %01000000, %10100000, %01100000
.)

; Reflects an option's value on screen
;  register X - player's number
;  tmpfield1 - Option to change
;
;  Overwrites registers, tmpfield2, tmpfield3, tmpfield4, tmpfield5, tmpfield6, tmpfield7
character_selection_draw_value:
.(
	option = tmpfield1
	; tmpfield2 used as temporary register for some computations and for jumping to option specific routine
	; tmpfield3 used for jumping to option specific routine
	; tmpfield4 used by option specific routines
	header_offset = tmpfield5
	name_offset = tmpfield6
	palette_offset = tmpfield7
	character_number = tmpfield8
	table_addr_lsb = tmpfield9
	table_addr_msb = tmpfield10

	; Save option number
	lda option
	pha

	; Jump to the good label regarding option
	;lda option ; useless - A is already set to option
	asl
	tay
	lda values_handlers, y
	sta tmpfield2
	lda values_handlers+1, y
	sta tmpfield3
	jmp (tmpfield2)

	end:
	pla        ; Restore option number
	sta option ;
	rts

	compute_option_indexes:
	.(
		; Compute buffer header's offset
		txa
		sta header_offset
		asl
		;clc ; useless, asl shall not overflow
		adc header_offset
		sta header_offset

		; Store character number and switch to character's bank
		ldy config_player_a_character, x
		sty character_number
		SWITCH_BANK(characters_bank_number COMMA y)

		; Compute palette offset
		lda option    ;
		asl           ;
		sta tmpfield2 ;
		txa           ; X = 2*option_num + X
		clc           ; X now points to weapon or character option
		adc tmpfield2 ;
		tax           ;

		lda config_player_a_character_palette, x
		sta palette_offset
		asl
		;clc ; useless, asl shall not overflow
		adc palette_offset
		sta palette_offset

		; Compute name offset
		lda config_player_a_character_palette, x
		asl
		asl
		asl
		sta name_offset

		rts
	.)

	draw_character_palette:
	.(
		; Compute useful offsets
		jsr compute_option_indexes

		; Contruct palette buffer
		lda #<buffer_header_player_a_character_palette ;
		clc                                            ;
		adc header_offset                              ;
		sta tmpfield1                                  ; header's address = first_header_address + header_offset
		lda #>buffer_header_player_a_character_palette ;
		adc #0                                         ;
		sta tmpfield2                                  ;

		ldy character_number           ;
		lda characters_palettes_lsb, y ;
		clc                            ;
		adc palette_offset             ;
		sta tmpfield3                  ; payload_address = first_palette_address + palette_offset
		lda characters_palettes_msb, y ;
		adc #0                         ;
		sta tmpfield4                  ;

		jsr construct_nt_buffer

		; Construct name buffer
		lda #<buffer_header_player_a_character_palette_name ;
		clc                                                 ;
		adc header_offset                                   ;
		sta tmpfield1                                       ; header's offser = first_header_address + header_offset
		lda #>buffer_header_player_a_character_palette_name ;
		adc #0                                              ;
		sta tmpfield2                                       ;

		ldy character_number                 ;
		lda characters_palettes_names_lsb, y ;
		clc                                  ;
		adc name_offset                      ;
		sta tmpfield3                        ; payload_address = first_name_address + name_offset
		lda characters_palettes_names_msb, y ;
		adc #0                               ;
		sta tmpfield4                        ;

		jsr construct_nt_buffer

		jmp end
	.)

	draw_weapon:
	.(
		; Compute useful offsets
		jsr compute_option_indexes

		; Contruct palette buffer
		lda #<buffer_header_player_a_weapon_palette ;
		clc                                         ;
		adc header_offset                           ;
		sta tmpfield1                               ; header's address = first_header_address + header_offset
		lda #>buffer_header_player_a_weapon_palette ;
		adc #0                                      ;
		sta tmpfield2                               ;

		ldy character_number                  ;
		lda characters_weapon_palettes_lsb, y ;
		clc                                   ;
		adc palette_offset                    ;
		sta tmpfield3                         ; payload_address = first_palette_address + palette_offset
		lda characters_weapon_palettes_msb, y ;
		adc #0                                ;
		sta tmpfield4                         ;

		jsr construct_nt_buffer

		; Construct name buffer
		lda #<buffer_header_player_a_weapon_palette_name ;
		clc                                              ;
		adc header_offset                                ;
		sta tmpfield1                                    ; header's offser = first_header_address + header_offset
		lda #>buffer_header_player_a_weapon_palette_name ;
		adc #0                                           ;
		sta tmpfield2                                    ;

		ldy character_number
		lda characters_weapon_names_lsb, y ;
		clc                                ;
		adc name_offset                    ;
		sta tmpfield3                      ; payload_address = first_name_address + name_offset
		lda characters_weapon_names_msb, y ;
		adc #0                             ;
		sta tmpfield4                      ;

		jsr construct_nt_buffer
		jmp end
	.)

	draw_character:
	.(
		character_properties_addr = tmpfield11
		character_properties_addr_msb = tmpfield12

		; Compute useful offsets
		;  TODO we care only of buffer header's index and bank switching, it could be upgraded in mother routine
		jsr compute_option_indexes

		; Get address of character propeties table in zero page
		ldy character_number
		lda characters_properties_lsb, y
		sta character_properties_addr
		lda characters_properties_msb, y
		sta character_properties_addr_msb

		; Write character name
		lda #<buffer_header_player_a_character_name
		clc
		adc header_offset
		sta tmpfield1
		lda #>buffer_header_player_a_character_name
		adc #0
		sta tmpfield2

		lda character_properties_addr
		clc
		adc #CHARACTERS_PROPERTIES_CHAR_NAME_OFFSET
		sta tmpfield3
		lda character_properties_addr_msb
		adc #0
		sta tmpfield4

		jsr construct_nt_buffer

		; Write weapon name
		lda #<buffer_header_player_a_weapon_name
		clc
		adc header_offset
		sta tmpfield1
		lda #>buffer_header_player_a_weapon_name
		adc #0
		sta tmpfield2

		lda character_properties_addr
		clc
		adc #CHARACTERS_PROPERTIES_WEAPON_NAME_OFFSET
		sta tmpfield3
		lda character_properties_addr_msb
		adc #0
		sta tmpfield4

		jsr construct_nt_buffer

		jmp end
	.)

	values_handlers:
	.word draw_character_palette, draw_weapon, draw_character

	buffer_header_player_a_character_palette:
	.byt $3f, $11, $03
	buffer_header_player_b_character_palette:
	.byt $3f, $19, $03
	buffer_header_player_a_character_palette_name:
	.byt $21, $e5, $08
	buffer_header_player_b_character_palette_name:
	.byt $21, $f3, $08

	buffer_header_player_a_weapon_palette:
	.byt $3f, $15, $03
	buffer_header_player_b_weapon_palette:
	.byt $3f, $1d, $03
	buffer_header_player_a_weapon_palette_name:
	.byt $22, $85, $08
	buffer_header_player_b_weapon_palette_name:
	.byt $22, $93, $08

	buffer_header_player_a_character_name:
	.byt $22, $04, $0a
	buffer_header_player_b_character_name:
	.byt $22, $12, $0a
	buffer_header_player_a_weapon_name:
	.byt $22, $a4, $0a
	buffer_header_player_b_weapon_name:
	.byt $22, $b2, $0a
.)
