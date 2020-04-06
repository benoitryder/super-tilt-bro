;
; State format
;   Byte 0 - X lsb
;   Byte 1 - X msb
;   Byte 2 - Y lsb
;   Byte 3 - Y msb
;   Byte 4-5 - vector to animation data
;   Byte 6 - direction of the animation (0 - natural, 1 - horizontally flipped)
;   Byte 7 - tick number
;   Byte 8 - index of the first OAM sprite to use
;   Byte 9 - index of the last OAM sprite to use
;   Byte 10-11 - index of the current frame
;
; Typical workflow
;   Initialization
;     ; ... code initializing other parts of the memory ...
;     lda #<my_animation_state
;     sta tmpfield11
;     lda #>my_animation_state
;     sta tmpfield12
;     lda #<my_animation_data
;     sta tmpfield13
;     lda #>my_animation_data
;     sta tmpfield14
;     jsr animation_init_state
;
;   Game loop
;     ; ... code that updates X, Y position of the animation ...
;     lda #<my_animation_state
;     sta tmpfield11
;     lda #>my_animation_state
;     sta tmpfield12
;     lda #0
;     sta tmpfield13
;     sta tmpfield14
;     sta tmpfield15
;     sta tmpfield16
;     jsr animation_draw
;     jsr animation_tick
;

; Initialize a memory location to be a valid animation state
;  tmpfield11, tmpfield12 - vector to the animation state
;  tmpfield13, tmpfield14 - vector to the animation data
; Overwrites registers A and Y
animation_init_state:
.(
	anim_state = tmpfield11
	anim_data = tmpfield13

	; Zero initialize most fields
	lda #0
	ldy #ANIMATION_STATE_OFFSET_X_LSB
	sta (anim_state), y
	ldy #ANIMATION_STATE_OFFSET_X_MSB
	sta (anim_state), y
	ldy #ANIMATION_STATE_OFFSET_Y_LSB
	sta (anim_state), y
	ldy #ANIMATION_STATE_OFFSET_Y_MSB
	sta (anim_state), y
	ldy #ANIMATION_STATE_OFFSET_DIRECTION
	sta (anim_state), y
	ldy #ANIMATION_STATE_OFFSET_CLOCK
	sta (anim_state), y
	ldy #ANIMATION_STATE_OFFSET_FIRST_SPRITE_NUM
	sta (anim_state), y
	ldy #ANIMATION_STATE_OFFSET_LAST_SPRITE_NUM
	sta (anim_state), y

	; Initialize frame vector and data vector to the first frame
	lda anim_data
	ldy #ANIMATION_STATE_OFFSET_DATA_VECTOR_LSB
	sta (anim_state), y
	ldy #ANIMATION_STATE_OFFSET_FRAME_VECTOR_LSB
	sta (anim_state), y

	lda anim_data+1
	ldy #ANIMATION_STATE_OFFSET_DATA_VECTOR_MSB
	sta (anim_state), y
	ldy #ANIMATION_STATE_OFFSET_FRAME_VECTOR_MSB
	sta (anim_state), y

	rts
.)

; Modify the animation playing in an animation state
;  tmpfield11, tmpfield12 - vector to the animation state
;  tmpfield13, tmpfield14 - vector to the animation data
; Overwrites registers A and Y
animation_state_change_animation:
.(
	anim_state = tmpfield11
	anim_data = tmpfield13

	; Reset clock
	lda #0
	ldy #ANIMATION_STATE_OFFSET_CLOCK
	sta (anim_state), y

	; Set frame vector and data vector to new animation's first frame
	lda anim_data
	ldy #ANIMATION_STATE_OFFSET_DATA_VECTOR_LSB
	sta (anim_state), y
	ldy #ANIMATION_STATE_OFFSET_FRAME_VECTOR_LSB
	sta (anim_state), y

	lda anim_data+1
	ldy #ANIMATION_STATE_OFFSET_DATA_VECTOR_MSB
	sta (anim_state), y
	ldy #ANIMATION_STATE_OFFSET_FRAME_VECTOR_MSB
	sta (anim_state), y

	rts
.)

; Draw the current frame of an animation
;  tmpfield11, tmpfield12 - vector to the animation_state
;  tmpfield13, tmpfield14 - camera position X (signed 16 bits)
;  tmpfield15, tmpfield16 - camera position Y (signed 16 bits)
; Overwrites tmpfields 1 to 10, tmpfields 13 to 16 and all registers
animation_draw:
.(
	anim_state = tmpfield11
	camera_position_x = tmpfield13
	camera_position_y = tmpfield15
	animation_position_x = tmpfield13 ; Animation position relative to camera (overrides camera position)
	animation_position_y = tmpfield15 ; Animation position relative to camera (overrides camera position)

	; Compute animation position relative to camera
	ldy #ANIMATION_STATE_OFFSET_X_LSB
	lda (anim_state), y
	sec
	sbc camera_position_x
	sta animation_position_x
	iny
	lda (anim_state), y
	sbc camera_position_x+1
	sta animation_position_x+1

	ldy #ANIMATION_STATE_OFFSET_Y_LSB
	lda (anim_state), y
	sec
	sbc camera_position_y
	sta animation_position_y
	iny
	lda (anim_state), y
	sbc camera_position_y+1
	sta animation_position_y+1

	; Pass parameters to draw_anim_frame
	lda animation_position_x
	sta tmpfield1
	lda animation_position_y
	sta tmpfield2
	ldy #ANIMATION_STATE_OFFSET_FRAME_VECTOR_LSB
	lda (anim_state), y
	clc    ; skip frame duration byte
	adc #1 ;
	sta tmpfield3
	iny
	lda (anim_state), y
	adc #0
	sta tmpfield4
	ldy #ANIMATION_STATE_OFFSET_FIRST_SPRITE_NUM
	lda (anim_state), y
	sta tmpfield5
	ldy #ANIMATION_STATE_OFFSET_LAST_SPRITE_NUM
	lda (anim_state), y
	sta tmpfield6
	ldy #ANIMATION_STATE_OFFSET_DIRECTION
	lda (anim_state), y
	sta tmpfield7
	lda animation_position_x+1
	sta tmpfield8
	lda animation_position_y+1
	sta tmpfield9

	jsr draw_anim_frame

	end:
		rts
.)

; Advance animation's clock
;  tmpfield11, tmpfield12 - vector to the animation_state
; Overwrites all registers, tmpfield3, tmpfield4, tmpfield8 and tmpfield9
animation_tick:
.(
	anim_state = tmpfield11
	;tmpfield12 is anim_state MSB
	frame_vector = tmpfield3
	;tmpfield4 is frame_vector MSB

	; Store current frame vector at a fixed location
	ldy #ANIMATION_STATE_OFFSET_FRAME_VECTOR_LSB
	lda (anim_state), y
	sta frame_vector
	iny
	lda (anim_state), y
	sta frame_vector+1

	; Increment counter
	ldy #ANIMATION_STATE_OFFSET_CLOCK
	lda (anim_state), y
	clc
	adc #1
	sta (anim_state), y

	; If counter is above (or equal) frame duration, update current frame vector
	ldy #0
	cmp (frame_vector), y
	bcs inc_current_frame
	jmp end

		inc_current_frame:
			; Search the next frame
			lda #$01                ; Skip frame duration byte
			jsr add_to_frame_vector ;
			skip_entry:
				lda (frame_vector), y ; Check continuation byte
				beq end_skip_frame    ;

				and #%00001111          ; Add entry length (least significant bits of the opcode) to the
				jsr add_to_frame_vector ; animation vector, to point on the next continuation byte

				jmp skip_entry
			end_skip_frame:
				lda #$01                ; Skip the last continuation byte
				jsr add_to_frame_vector ;

		; If the next frame begins with zero, it is then ANIM_ANIMATION_END, return to the begining
		lda (frame_vector), y
		bne store_frame_vector
			ldy #ANIMATION_STATE_OFFSET_DATA_VECTOR_LSB
			lda (anim_state), y
			sta frame_vector
			iny
			lda (anim_state),y
			sta frame_vector+1

		; Store computed frame vector in animation state
		store_frame_vector:
			ldy #ANIMATION_STATE_OFFSET_FRAME_VECTOR_LSB
			lda frame_vector
			sta (anim_state), y
			iny
			lda frame_vector+1
			sta (anim_state), y

		; Reset tick counter
		ldy #ANIMATION_STATE_OFFSET_CLOCK
		lda #0
		sta (anim_state), y

	end:
		rts

	add_to_frame_vector:
	.(
		clc
		adc frame_vector
		sta frame_vector
		lda #$00
		adc frame_vector+1
		sta frame_vector+1
		rts
	.)
.)

; Draw an animation frame on screen
;  tmpfield1 - Position X LSB
;  tmpfield2 - Position Y LSB
;  tmpfield3, tmpfield4 - Vector pointing to the frame to draw
;  tmpfield5 - First sprite index to use
;  tmpfield6 - Last sprite index to use
;  tmpfield7 - Animation's direction (0 normal, 1 flipped)
;  tmpfield8 - Position X MSB
;  tmpfield9 - Position Y MSB
;  tmpfield11, tmpfield12 - vector to the animation_state
;
; Overwrites all registers, tmpfield5, tmpfield6, tmpfield10 and tmpfield13 to tmpfield16
;
; Note - tmpfield11 and tmpfield12 are unused by nine-gine, but are guaranteed
;        to be passed to custom entry handlers
draw_anim_frame:
.(
	; Pretty names
	anim_pos_x = tmpfield1
	anim_pos_y = tmpfield2
	frame_vector = tmpfield3
	sprite_index = tmpfield5
	last_sprite_index = tmpfield6
	animation_direction = tmpfield7
	anim_pos_x_msb = tmpfield8
	anim_pos_y_msb = tmpfield9
	continuation_byte = tmpfield10

	.(
		; Initialization
		ldy #$00

		; Handle animation's entries
		handle_one_entry:
			; Check continuation byte - zero value means end of data
			lda (frame_vector), y
			beq clear_unused_sprites

			; In rollback mode, stop at the first sprite (hitboxes should be before sprites)
			ldx network_rollback_mode
			beq continue:
				cmp #ANIM_OPCODE_SPRITE
				beq end
				cmp #ANIM_OPCODE_SPRITE_FOREGROUND
				beq end
			continue:

			; Handle one entry
			sta continuation_byte
			iny

			lsr
			lsr
			lsr
			lsr
			tax
			lda animation_frame_entry_handlers_lsb, x
			sta tmpfield13
			lda animation_frame_entry_handlers_msb, x
			sta tmpfield14
			jsr call_pointed_subroutine13

			jmp handle_one_entry

		; Place unused sprites off screen
		clear_unused_sprites:
			lda network_rollback_mode
			bne end

			lda last_sprite_index
			cmp sprite_index
			bcc end

			lda sprite_index ;
			asl              ; Set X to the byte offset of the sprite in OAM memory
			asl              ;
			tax              ;

			lda #$fe
			sta oam_mirror, x
			sta oam_mirror+1, x
			sta oam_mirror+2, x
			sta oam_mirror+3, x

			inc sprite_index
			jmp clear_unused_sprites

		end:
			rts
	.)

	call_pointed_subroutine13:
	.(
		jmp (tmpfield13)
	.)
.)

; Default animation entry opcode table
;  may be overriden by defining it before including this file
#ifldef animation_frame_entry_handlers_lsb
#else
animation_frame_entry_handlers_lsb:
.byt <anim_frame_move_sprite, <anim_frame_move_sprite
animation_frame_entry_handlers_msb:
.byt >anim_frame_move_sprite, >anim_frame_move_sprite
#endif

; Handler for anim_sprite and anim_sprite_foreground animations entries
;  tmpfield1 - Position X LSB
;  tmpfield2 - Position Y LSB
;  tmpfield3, tmpfield4 - Vector pointing to the frame to draw
;  tmpfield5 - First sprite index to use
;  tmpfield6 - Last sprite index to use
;  tmpfield7 - Animation's direction (0 normal, 1 flipped)
;  tmpfield8 - Position X MSB
;  tmpfield9 - Position Y MSB
;  tmpfield10 - Opcode of the entry
;  tmpfield11, tmpfield12 - vector to the animation_state
;  register Y - Index of the etnry's first byte in the frame vector (payload byte, not opcode)
;
; Overwrites tmpfield5, tmpfield6, tmpfield13, tmpfield14, tmpfield15 and all registers
;
; Output - tmpfield5 is updated to stay on the next free sprite
;          tmpfield6 is updated to stay on the last free sprite
;          registerY is advanced to the first byte after the entry
anim_frame_move_sprite:
.(
	; Pretty names (matching draw_anim_frame)
	anim_pos_x = tmpfield1
	anim_pos_y = tmpfield2
	frame_vector = tmpfield3
	sprite_index = tmpfield5
	last_sprite_index = tmpfield6
	animation_direction = tmpfield7
	anim_pos_x_msb = tmpfield8
	anim_pos_y_msb = tmpfield9
	continuation_byte = tmpfield10

	; Pretty names (local variables)
	sign_extension_byte = tmpfield13
	attributes_modifier = tmpfield14
	sprite_used = tmpfield15 ; 0 - first sprite, 1 - last sprite

	; Compute direction dependent information
	;  attributes modifier - to flip the animation if needed
	;  A - sprite index to use
	lda animation_direction
	beq default_direction

		lda #$40                ; Flip horizontally attributes
		sta attributes_modifier ;

		lda continuation_byte        ;
		cmp #ANIM_OPCODE_SPRITE      ;
		beq use_last_sprite          ;
			lda #0                   ;
			jmp set_sprite_used      ; Use the last sprite unless explicitely foreground
		use_last_sprite:             ;
			lda #1                   ;
		set_sprite_used:             ;
		sta sprite_used              ;
		jmp end_init_direction_data  ;

	default_direction:
		lda #$00                ;
		sta attributes_modifier ; Do not flip attributes
		sta sprite_used         ; Always use the first sprite

	end_init_direction_data:

	; X points on sprite data to modify
	lda sprite_used
	beq use_first_sprite
	lda last_sprite_index
	jmp sprite_index_set
	use_first_sprite:
	lda sprite_index
	sprite_index_set:
	asl
	asl
	tax

	; Y value, must be relative to animation Y position (avoid to place this sprite if offscreen)
	lda (frame_vector), y

	.(
	pha
	bmi set_relative_msb_neg
		lda #0
		jmp set_relative_msb
	set_relative_msb_neg:
		lda #$ff
	set_relative_msb:
		sta sign_extension_byte
	pla
	.)

	clc
	adc anim_pos_y
	sta oam_mirror, x
	lda sign_extension_byte
	adc anim_pos_y_msb
	bne skip
	iny

	; Tile number
#ifdef ANIM_HOOK_TILE_NUMBER
	ANIM_HOOK_TILE_NUMBER
#else
	lda (frame_vector), y
#endif
	sta oam_mirror+1, x
	iny

	; Attributes
	;  Flip horizontally (eor $40) if oriented to the right
#ifdef ANIM_HOOK_SPRITE_ATTRIBUTES
	ANIM_HOOK_SPRITE_ATTRIBUTES
#else
	lda (frame_vector), y
#endif
	eor attributes_modifier
	sta oam_mirror+2, x
	iny

	; X value, must be relative to animation X position
	;  Flip symetrically to the vertical axe if needed
	lda animation_direction
	bne flip_x
		lda (frame_vector), y
		jmp got_relative_pos
	flip_x:
		lda (frame_vector), y
		eor #%11111111
		clc
		adc #1
	got_relative_pos:

	.(
	pha
	bmi set_relative_msb_neg
		lda #0
		jmp set_relative_msb
	set_relative_msb_neg:
		lda #$ff
	set_relative_msb:
		sta sign_extension_byte
	pla
	.)

	clc
	adc anim_pos_x
	sta oam_mirror+3, x

	lda sign_extension_byte
	adc anim_pos_x_msb
	beq continue
		; Sprite is offscreen, erase it
		dey
		dey
		dey
		jmp skip
	continue:
	iny

	; Next sprite
	lda sprite_used
	beq inc_sprite_index
	dec last_sprite_index
	jmp end_next_sprite
	inc_sprite_index:
	inc sprite_index
	end_next_sprite:
	jmp end

	; Skip sprite
	skip:
	lda #$fe          ; Reset OAM sprite's Y position
	sta oam_mirror, x ;
	iny ;
	iny ; Advance to the next frame's sprite
	iny ;
	iny ;

	end:
	rts
.)
