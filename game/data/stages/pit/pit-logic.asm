STAGE_PIT_MOVING_PLATFORM_1_OFFSET = STAGE_ELEMENT_SIZE * 2
STAGE_PIT_MOVING_PLATFORM_2_OFFSET = STAGE_PIT_MOVING_PLATFORM_1_OFFSET + STAGE_ELEMENT_SIZE

#define STAGE_PIT_MOVING_PLATFORM_SPRITES INGAME_STAGE_FIRST_SPRITE
#define STAGE_PIT_NB_MOVING_PLATFORM_SPRITES 8

STAGE_PIT_PLATFORM_MAX_HEIGHT = 137
STAGE_PIT_PLATFORM_MIN_HEIGHT = 175
STAGE_PIT_PLATFORM_LEFTMOST = 73
STAGE_PIT_PLATFORM_RIGHTMOST = 137
STAGE_PIT_PLATFORM_START_HEIGHT = STAGE_PIT_PLATFORM_MAX_HEIGHT+((STAGE_PIT_PLATFORM_MIN_HEIGHT-STAGE_PIT_PLATFORM_MAX_HEIGHT)/2)

+stage_pit_netload:
.(
	lda esp_rx_buffer+0, x
	sta stage_pit_platform1_direction_v
	lda esp_rx_buffer+1, x
	sta stage_pit_platform2_direction_v
	lda esp_rx_buffer+2, x
	sta stage_pit_platform1_direction_h
	lda esp_rx_buffer+3, x
	sta stage_pit_platform2_direction_h

	lda esp_rx_buffer+4, x
	sta stage_data+STAGE_OFFSET_ELEMENTS+STAGE_PIT_MOVING_PLATFORM_1_OFFSET+STAGE_PLATFORM_OFFSET_TOP
	lda esp_rx_buffer+5, x
	sta stage_data+STAGE_OFFSET_ELEMENTS+STAGE_PIT_MOVING_PLATFORM_1_OFFSET+STAGE_PLATFORM_OFFSET_LEFT
	clc
	adc #38
	sta stage_data+STAGE_OFFSET_ELEMENTS+STAGE_PIT_MOVING_PLATFORM_1_OFFSET+STAGE_PLATFORM_OFFSET_RIGHT

	lda esp_rx_buffer+6, x
	sta stage_data+STAGE_OFFSET_ELEMENTS+STAGE_PIT_MOVING_PLATFORM_2_OFFSET+STAGE_PLATFORM_OFFSET_TOP
	lda esp_rx_buffer+7, x
	sta stage_data+STAGE_OFFSET_ELEMENTS+STAGE_PIT_MOVING_PLATFORM_2_OFFSET+STAGE_PLATFORM_OFFSET_LEFT
	;clc ; useless, last ADC should not overflow (platforms stay on screen)
	adc #38
	sta stage_data+STAGE_OFFSET_ELEMENTS+STAGE_PIT_MOVING_PLATFORM_2_OFFSET+STAGE_PLATFORM_OFFSET_RIGHT

	rts
.)

; Check if a player is out of the stage's bounds
;  register X - player number
;  tmpfield4 - player's current X pixel
;  tmpfield7 - player's current Y pixel
;  tmpfield5 - player's current X screen
;  tmpfield8 - player's current Y screen
;
; Output:
;  tmpfield1 - 0 if no collision happened, 1 i player is behind a blastline
;
; Implementation is allowed to modify tmpfield1 to tmpfield3, register A and register Y
+stage_pit_ringout_check:
.(
    current_x_pixel = tmpfield4
    current_x_screen = tmpfield5
    current_y_pixel = tmpfield7
    current_y_screen = tmpfield8

    SIGNED_CMP(current_x_pixel, current_x_screen, #<STAGE_BLAST_LEFT, #>STAGE_BLAST_LEFT)
    bmi ringout
    SIGNED_CMP(#<STAGE_BLAST_RIGHT, #>STAGE_BLAST_RIGHT, current_x_pixel, current_x_screen)
    bmi ringout
    SIGNED_CMP(current_y_pixel, current_y_screen, #<STAGE_BLAST_TOP, #>STAGE_BLAST_TOP)
    bmi ringout
    SIGNED_CMP(#<STAGE_BLAST_BOTTOM, #>STAGE_BLAST_BOTTOM, current_y_pixel, current_y_screen)
    bmi ringout
        on_stage:
            lda #0
            sta tmpfield1
            rts
        ringout:
            lda 1
            sta tmpfield1
            rts
    ;rts ; useless, no branch returns
.)

; Sets fadeout level
;  register X - fadeout level
;
; Overwrites registers, tmpfield1 to tmpfield4
+stage_pit_fadeout:
.(
	; Set ideal fade level
	stx stage_fade_level

	; If not in rollback, apply it immediately
	lda network_rollback_mode
	beq apply_fadeout
		rts

	apply_fadeout:
	;Fallthrough to stage_pit_fadeout_update
.)

; Rewrite palettes to match fadeout level
;  register X - fadeout level
;
; Overwrites registers, tmpfield1 to tmpfield4
stage_pit_fadeout_update:
.(
	header = tmpfield1 ; construct_nt_buffer parameter
	payload = tmpfield3 ; construct_nt_buffer parameter

	; Do nothing if there is not enough space in the buffer
	.(
		IF_NT_BUFFERS_FREE_SPACE_LT(#1+3+16+1, ok)
			rts
		ok:
	.)

	; Set actual fade level
	stx stage_current_fade_level

	; Change palette
	lda #<palette_header
	sta header
	lda #>palette_header
	sta header+1

	lda stage_pit_fadeout_lsb, x
	sta payload
	lda stage_pit_fadeout_msb, x
	sta payload+1

	jmp construct_nt_buffer

	;rts ; useless, jump to subroutine

	palette_header:
	.byt $3f, $00, $10
.)

+stage_pit_init:
.(
	; Copy stage's tiles in VRAM
	.(
		tileset_addr = tmpfield1 ; Not movable, used by cpu_to_ppu_copy_tileset
		;tileset_addr_msb = tmpfield2 ; Not movable, used by cpu_to_ppu_copy_tileset
		tiles_count = tmpfield3 ; Not movable, used by cpu_to_ppu_copy_tileset

		lda #<tileset_stage_pit_sprites
		sta tileset_addr
		lda #>tileset_stage_pit_sprites
		sta tileset_addr+1

		lda PPUSTATUS
		lda #>STAGE_FIRST_SPRITE_TILE_OFFSET
		sta PPUADDR
		lda #<STAGE_FIRST_SPRITE_TILE_OFFSET
		sta PPUADDR

		jsr cpu_to_ppu_copy_tileset
	.)

	; Disable screen restore
	lda #$ff
	sta stage_restore_screen_step
	lda #FADE_LEVEL_NORMAL
	sta stage_fade_level
	sta stage_current_fade_level

	; Set stage's state
	lda #$ff
	sta stage_pit_platform1_direction_v
	lda #$01
	sta stage_pit_platform2_direction_v
	lda #0
	sta stage_pit_platform1_direction_h
	sta stage_pit_platform2_direction_h

	; Init moving platform sprites
	lda #TILE_MOVING_PLATFORM                                ;
	sta oam_mirror+STAGE_PIT_MOVING_PLATFORM_SPRITES*4+1     ;
	sta oam_mirror+(STAGE_PIT_MOVING_PLATFORM_SPRITES+1)*4+1 ; Tile number
	sta oam_mirror+(STAGE_PIT_MOVING_PLATFORM_SPRITES+2)*4+1 ;
	sta oam_mirror+(STAGE_PIT_MOVING_PLATFORM_SPRITES+3)*4+1 ;
	sta oam_mirror+(STAGE_PIT_MOVING_PLATFORM_SPRITES+4)*4+1 ;
	sta oam_mirror+(STAGE_PIT_MOVING_PLATFORM_SPRITES+5)*4+1 ;
	sta oam_mirror+(STAGE_PIT_MOVING_PLATFORM_SPRITES+6)*4+1 ;
	sta oam_mirror+(STAGE_PIT_MOVING_PLATFORM_SPRITES+7)*4+1 ;

	lda #%00000011                                           ;
	sta oam_mirror+STAGE_PIT_MOVING_PLATFORM_SPRITES*4+2     ;
	sta oam_mirror+(STAGE_PIT_MOVING_PLATFORM_SPRITES+1)*4+2 ;
	sta oam_mirror+(STAGE_PIT_MOVING_PLATFORM_SPRITES+2)*4+2 ; Attributes
	sta oam_mirror+(STAGE_PIT_MOVING_PLATFORM_SPRITES+3)*4+2 ;
	sta oam_mirror+(STAGE_PIT_MOVING_PLATFORM_SPRITES+4)*4+2 ;
	sta oam_mirror+(STAGE_PIT_MOVING_PLATFORM_SPRITES+5)*4+2 ;
	sta oam_mirror+(STAGE_PIT_MOVING_PLATFORM_SPRITES+6)*4+2 ;
	sta oam_mirror+(STAGE_PIT_MOVING_PLATFORM_SPRITES+7)*4+2 ;

	; Place moving platform sprites
	; Fallthrough stage_pit_place_platform_sprites
.)

stage_pit_place_platform_sprites:
.(
	; Avoid placing sprites in rollback mode
	lda network_rollback_mode
	beq do_it
		rts
	do_it:

	; Y positions
	lda stage_data+STAGE_OFFSET_ELEMENTS+STAGE_PIT_MOVING_PLATFORM_1_OFFSET+STAGE_PLATFORM_OFFSET_TOP
	clc
	adc #15
	sta oam_mirror+STAGE_PIT_MOVING_PLATFORM_SPRITES*4
	sta oam_mirror+(STAGE_PIT_MOVING_PLATFORM_SPRITES+1)*4
	sta oam_mirror+(STAGE_PIT_MOVING_PLATFORM_SPRITES+2)*4
	sta oam_mirror+(STAGE_PIT_MOVING_PLATFORM_SPRITES+3)*4
	lda stage_data+STAGE_OFFSET_ELEMENTS+STAGE_PIT_MOVING_PLATFORM_2_OFFSET+STAGE_PLATFORM_OFFSET_TOP
	clc
	adc #15
	sta oam_mirror+(STAGE_PIT_MOVING_PLATFORM_SPRITES+4)*4
	sta oam_mirror+(STAGE_PIT_MOVING_PLATFORM_SPRITES+5)*4
	sta oam_mirror+(STAGE_PIT_MOVING_PLATFORM_SPRITES+6)*4
	sta oam_mirror+(STAGE_PIT_MOVING_PLATFORM_SPRITES+7)*4

	; X positions
	lda stage_data+STAGE_OFFSET_ELEMENTS+STAGE_PIT_MOVING_PLATFORM_1_OFFSET+STAGE_PLATFORM_OFFSET_LEFT
	clc
	adc #7
	sta oam_mirror+STAGE_PIT_MOVING_PLATFORM_SPRITES*4+3
	adc #8
	sta oam_mirror+(STAGE_PIT_MOVING_PLATFORM_SPRITES+1)*4+3
	adc #8
	sta oam_mirror+(STAGE_PIT_MOVING_PLATFORM_SPRITES+2)*4+3
	adc #8
	sta oam_mirror+(STAGE_PIT_MOVING_PLATFORM_SPRITES+3)*4+3
	lda stage_data+STAGE_OFFSET_ELEMENTS+STAGE_PIT_MOVING_PLATFORM_2_OFFSET+STAGE_PLATFORM_OFFSET_LEFT
	adc #7
	sta oam_mirror+(STAGE_PIT_MOVING_PLATFORM_SPRITES+4)*4+3
	adc #8
	sta oam_mirror+(STAGE_PIT_MOVING_PLATFORM_SPRITES+5)*4+3
	adc #8
	sta oam_mirror+(STAGE_PIT_MOVING_PLATFORM_SPRITES+6)*4+3
	adc #8
	sta oam_mirror+(STAGE_PIT_MOVING_PLATFORM_SPRITES+7)*4+3

	rts
.)

; Redraw the stage background (one step per call)
;  network_rollback_mode - set to inhibit any repair operation
;  stage_screen_effect - set to inhibit any repair operation
;  stage_fade_level - Desired fade level
;  stage_current_fade_level - Currently applied fade level
;  stage_restore_screen_step - Attributes restoration step (>= $80 to inhibit attributes restoration)
;
; Overwrites all registers, tmpfield1 to tmpfield4
stage_pit_repair_screen:
.(
	; Do nothing in rollback mode
	.(
		lda network_rollback_mode
		beq ok
			rts
		ok:
	.)

	; Do nothing if a fullscreen animation is running
	.(
		lda stage_screen_effect
		beq ok
			rts
		ok:
	.)

	; Fix fadeout if needed
	;NOTE does not return if action is taken (to avoid flooding nametable buffers)
	.(
		ldx stage_fade_level
		cpx stage_current_fade_level
		beq ok
			jmp stage_pit_fadeout_update
			;No return, jump to subroutine
		ok:
	.)

	; Fix attributes if needed
	.(
		; Do noting if there is no restore operation running
		.(
			ldx stage_restore_screen_step
			bpl ok
				rts
			ok:
		.)

		; Do nothing if there lack space for the nametable buffers
		.(
			IF_NT_BUFFERS_FREE_SPACE_LT(#1+3+32+1, ok)
				rts
			ok:
		.)

		; Write NT buffer corresponding to current step
		.(
			;ldx stage_restore_screen_step ; useless, done above
			lda steps_buffers_lsb, x
			ldy steps_buffers_msb, x
			jsr push_nt_buffer
		.)

		; Increment step
		.(
			inc stage_restore_screen_step
			lda stage_restore_screen_step
			cmp #NUM_RESTORE_STEPS
			bne ok
				lda #$ff
				sta stage_restore_screen_step
			ok:
		.)
	.)

	rts

	top_attributes:
	.byt $23, $c0, $20
	.byt %01010101, %01010101, %01010101, %01010101, %01010101, %01010101, %01010101, %01010101
	.byt %01010101, %01010101, %10010101, %01010101, %01010101, %01010101, %01011001, %01010101
	.byt %01010101, %01010101, %01010101, %01010101, %01010101, %01100101, %01010101, %01010101
	.byt %01100101, %01010101, %01010101, %01010101, %01010101, %01010101, %10010101, %01010101
	bot_attibutes:
	.byt $23, $e0, $20
	.byt %00000110, %00000000, %01000000, %01000000, %01010000, %00000001, %00000100, %00000000
	.byt %00000000, %00000000, %00000000, %00000101, %00000101, %00000000, %00000000, %00000000
	.byt %00000000, %00000000, %00000000, %01000000, %00000000, %00000000, %00000000, %00000000
	.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000

	steps_buffers_lsb:
	.byt <top_attributes, <bot_attibutes
	steps_buffers_msb:
	.byt >top_attributes, >bot_attibutes
	NUM_RESTORE_STEPS = *-steps_buffers_msb
.)

+stage_pit_tick:
.(
	; Update background
	jsr stage_pit_repair_screen

	; Move platforms
	.(
		; Change platforms direction
		ldy #0 ; Y = platform index
		ldx #0 ; X = platform offset in stage data from first moving platform
		change_one_platform_direction:

			jsr apply_platform_waypoint

			ldx #STAGE_ELEMENT_SIZE
			iny
			cpy #2
			bne change_one_platform_direction

		; Move platforms and players on it
		ldx #0
		ldy #0
		lda stage_pit_platform1_direction_v
		sta tmpfield4
		lda stage_pit_platform1_direction_h
		sta tmpfield5

		check_one_player_one_platform:

			; Move players that are on platforms
			move_players_on_platform:
				tya
				clc
				adc #STAGE_OFFSET_ELEMENTS+STAGE_PIT_MOVING_PLATFORM_1_OFFSET
				cmp player_a_grounded, x
				bne next_check

					;HACK don't use temporary velocity for vertical movement
					;     problem - When effective player velocity is upward, grounded flag is never set.
					;               So if the platform moves up, the player is considered ungrounded next frame and no more moves with platform.
					lda player_a_y, x
					clc
					adc tmpfield4
					sta player_a_y, x

					lda player_a_temporary_velocity_h, x
					clc
					adc tmpfield5
					sta player_a_temporary_velocity_h, x

				next_check:
				inx
				cpx #2
				bne move_players_on_platform

			; Move platform in stage's data
			lda stage_data+STAGE_OFFSET_ELEMENTS+STAGE_PIT_MOVING_PLATFORM_1_OFFSET+STAGE_PLATFORM_OFFSET_TOP, y
			clc
			adc tmpfield4
			sta stage_data+STAGE_OFFSET_ELEMENTS+STAGE_PIT_MOVING_PLATFORM_1_OFFSET+STAGE_PLATFORM_OFFSET_TOP, y
			lda stage_data+STAGE_OFFSET_ELEMENTS+STAGE_PIT_MOVING_PLATFORM_1_OFFSET+STAGE_PLATFORM_OFFSET_LEFT, y
			clc
			adc tmpfield5
			sta stage_data+STAGE_OFFSET_ELEMENTS+STAGE_PIT_MOVING_PLATFORM_1_OFFSET+STAGE_PLATFORM_OFFSET_LEFT, y
			lda stage_data+STAGE_OFFSET_ELEMENTS+STAGE_PIT_MOVING_PLATFORM_1_OFFSET+STAGE_PLATFORM_OFFSET_RIGHT, y
			clc
			adc tmpfield5
			sta stage_data+STAGE_OFFSET_ELEMENTS+STAGE_PIT_MOVING_PLATFORM_1_OFFSET+STAGE_PLATFORM_OFFSET_RIGHT, y

			; Prepare next platform
			cpy #STAGE_ELEMENT_SIZE
			beq end_move_platforms
			ldy #STAGE_ELEMENT_SIZE
			ldx #0
			lda stage_pit_platform2_direction_v
			sta tmpfield4
			lda stage_pit_platform2_direction_h
			sta tmpfield5
			jmp check_one_player_one_platform

		end_move_platforms:

		; Move platform sprites
		jmp stage_pit_place_platform_sprites

		;rts ; useless, jump to a subroutine
	.)

	; Modify platform's direction if on a waypoint
	;  register Y - Platform index
	;  register X - Platform offset in stage data from first moving platform
	;
	;  Overwrites tmpfield1 and tmpfield2
	apply_platform_waypoint:
	.(
		platform_index = tmpfield1
		new_direction_v = tmpfield2

		; Save platform index
		sty platform_index

		; Check if on a waypoint
		ldy #0 ; Y is the current waypoint index
		check_one_wp:
		lda waypoints_v, y
		cmp stage_data+STAGE_OFFSET_ELEMENTS+STAGE_PIT_MOVING_PLATFORM_1_OFFSET+STAGE_PLATFORM_OFFSET_TOP, x
		bne next_wp
		lda waypoints_h, y
		cmp stage_data+STAGE_OFFSET_ELEMENTS+STAGE_PIT_MOVING_PLATFORM_1_OFFSET+STAGE_PLATFORM_OFFSET_LEFT, x
		beq change_direction

		next_wp:
		iny
		cpy #4
		bne check_one_wp
		jmp end

		; Apply waypoint's direction to the platform
		change_direction:
		lda waypoints_direction_v, y
		sta new_direction_v
		lda waypoints_direction_h, y
		ldy platform_index
		sta stage_pit_platform1_direction_h, y
		lda new_direction_v
		sta stage_pit_platform1_direction_v, y

		; Restore register Y and return
		end:
		ldy platform_index
		rts
	.)

	waypoints_v:
	.byt STAGE_PIT_PLATFORM_MAX_HEIGHT, STAGE_PIT_PLATFORM_MAX_HEIGHT, STAGE_PIT_PLATFORM_MIN_HEIGHT, STAGE_PIT_PLATFORM_MIN_HEIGHT

	waypoints_h:
	.byt STAGE_PIT_PLATFORM_LEFTMOST,   STAGE_PIT_PLATFORM_RIGHTMOST,  STAGE_PIT_PLATFORM_RIGHTMOST,  STAGE_PIT_PLATFORM_LEFTMOST

	waypoints_direction_v:
	.byt $00, $01, $00, $ff

	waypoints_direction_h:
	.byt $01, $00, $ff, $00
.)
