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
+stage_flatland_ringout_check:
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
+stage_flatland_fadeout:
.(
	; Set ideal fade level
	stx stage_fade_level

	; If not in rollback, apply it immediately
	lda network_rollback_mode
	beq apply_fadeout
		rts

	apply_fadeout:
	;Fallthrough to stage_flatland_fadeout_update
.)

; Rewrite palettes to match fadeout level
;  register X - fadeout level
;
; Overwrites registers, tmpfield1 to tmpfield4
stage_flatland_fadeout_update:
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

	lda stage_flatland_fadeout_lsb, x
	sta payload
	lda stage_flatland_fadeout_msb, x
	sta payload+1

	jmp construct_nt_buffer

	;rts ; useless, jump to subroutine

	palette_header:
	.byt $3f, $00, $10
.)

+stage_flatland_init:
.(
	; Disable screen restore
	lda #$ff
	sta stage_restore_screen_step
	lda #FADE_LEVEL_NORMAL
	sta stage_fade_level
	sta stage_current_fade_level
	rts
.)

+stage_flatland_tick:
.(
	; Falthrough to stage_flatland_repair_screen
.)

; Redraw the stage background (one step per call)
;  network_rollback_mode - set to inhibit any repair operation
;  stage_screen_effect - set to inhibit any repair operation
;  stage_fade_level - Desired fade level
;  stage_current_fade_level - Currently applied fade level
;  stage_restore_screen_step - Attributes restoration step (>= $80 to inhibit attributes restoration)
;
; Overwrites all registers, tmpfield1 to tmpfield4
stage_flatland_repair_screen:
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
			jmp stage_flatland_fadeout_update
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
	.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
	.byt %00000000, %00000000, %01010101, %00000000, %00000000, %01010101, %01010101, %01010101
	.byt %01010101, %01010101, %00000000, %00000000, %00000000, %00000000, %01010101, %01010101
	.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
	bot_attibutes:
	.byt $23, $e0, $20
	.byt %00000000, %00001000, %00000000, %00000000, %00000000, %00001000, %00000000, %00000000
	.byt %01010000, %00010001, %00000000, %00000000, %00000000, %00000000, %01000100, %01010000
	.byt %01010101, %00010001, %00000000, %00000000, %00000000, %00000000, %01000100, %01010101
	.byt %01010101, %00010001, %00000000, %00000000, %00000000, %00000000, %01000100, %01010101

	steps_buffers_lsb:
	.byt <top_attributes, <bot_attibutes
	steps_buffers_msb:
	.byt >top_attributes, >bot_attibutes
	NUM_RESTORE_STEPS = *-steps_buffers_msb
.)
