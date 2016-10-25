anim_sinbad_aerial_jumping_left:
; Frame 1
ANIM_FRAME_BEGIN(3)
ANIM_HURTBOX($00, $08, $02, $10) ; left, right, top, bottom
ANIM_SPRITE($08, TILE_POWER_FLAMES_LARGE_1, $01, $f9) ; Y, tile, attr, X
ANIM_SPRITE($08, TILE_POWER_FLAMES_LARGE_2, $41, $07)
ANIM_SPRITE($09, TILE_SCIMITAR_BLADE, $01, $fa)
ANIM_SPRITE($09, TILE_SCIMITAR_HANDLE, $01, $02)
ANIM_SPRITE($00, TILE_LANDING_SINBAD_2_TOP, $00, $00)
ANIM_SPRITE($08, TILE_LANDING_SINBAD_2_BOT, $00, $00)
ANIM_FRAME_END
; Frame 2
ANIM_FRAME_BEGIN(4)
ANIM_HURTBOX($00, $08, $00, $10)
ANIM_SPRITE($fe, TILE_ANGLED_SCIMITAR_BLADE, $01, $fd)
ANIM_SPRITE($06, TILE_ANGLED_SCIMITAR_HANDLE, $01, $fd)
ANIM_SPRITE($00, TILE_SIDE_TILT_SINBAD_2_1, $00, $00)
ANIM_SPRITE($08, TILE_JUMPING_SINBAD_2, $00, $00)
ANIM_FRAME_END
; Frame 3
ANIM_FRAME_BEGIN(100)
ANIM_HURTBOX($00, $08, $00, $10)
ANIM_SPRITE($fa, TILE_VERTICAL_SCIMITAR_BLADE, $01, $01)
ANIM_SPRITE($02, TILE_VERTICAL_SCIMITAR_HANDLE, $01, $01)
ANIM_SPRITE($00, TILE_JUMPING_SINBAD_3_HEAD, $00, $00)
ANIM_SPRITE($08, TILE_JUMPING_SINBAD_3_BODY, $00, $00)
ANIM_FRAME_END
; End of animation
ANIM_ANIMATION_END

anim_sinbad_aerial_jumping_right:
; Frame 1
ANIM_FRAME_BEGIN(3)
ANIM_HURTBOX($00, $08, $02, $10)
ANIM_SPRITE($08, TILE_POWER_FLAMES_LARGE_2, $01, $f9) ; Y, tile, attr, X
ANIM_SPRITE($08, TILE_POWER_FLAMES_LARGE_1, $41, $07)
ANIM_SPRITE($00, TILE_LANDING_SINBAD_2_TOP, $40, $00)
ANIM_SPRITE($08, TILE_LANDING_SINBAD_2_BOT, $40, $00)
ANIM_SPRITE($09, TILE_SCIMITAR_BLADE, $41, $06)
ANIM_SPRITE($09, TILE_SCIMITAR_HANDLE, $41, $fe)
ANIM_FRAME_END
; Frame 2
ANIM_FRAME_BEGIN(4)
ANIM_HURTBOX($00, $08, $00, $10)
ANIM_SPRITE($00, TILE_SIDE_TILT_SINBAD_2_1, $40, $00)
ANIM_SPRITE($08, TILE_JUMPING_SINBAD_2, $40, $00)
ANIM_SPRITE($fe, TILE_ANGLED_SCIMITAR_BLADE, $41, $03)
ANIM_SPRITE($06, TILE_ANGLED_SCIMITAR_HANDLE, $41, $03)
ANIM_FRAME_END
; Frame 3
ANIM_FRAME_BEGIN(100)
ANIM_HURTBOX($00, $08, $00, $10)
ANIM_SPRITE($00, TILE_JUMPING_SINBAD_3_HEAD, $40, $00)
ANIM_SPRITE($08, TILE_JUMPING_SINBAD_3_BODY, $40, $00)
ANIM_SPRITE($fa, TILE_VERTICAL_SCIMITAR_BLADE, $41, $ff)
ANIM_SPRITE($02, TILE_VERTICAL_SCIMITAR_HANDLE, $41, $ff)
ANIM_FRAME_END
; End of animation
ANIM_ANIMATION_END
