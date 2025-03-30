stage_flatland_palette:
.byt $0f,$21,$00,$10, $0f,$21,$00,$31, $0f,$21,$19,$31, $0f,$20,$26,$16

stage_flatland_palette_fadeout1:
.byt $0f,$11,$00,$00, $0f,$11,$00,$21, $0f,$11,$09,$21, $0f,$20,$26,$16

stage_flatland_palette_fadeout2:
.byt $0f,$01,$0f,$0f, $0f,$01,$0f,$11, $0f,$01,$0f,$11, $0f,$20,$26,$16

stage_flatland_palette_fadeout3:
.byt $0f,$0f,$0f,$0f, $0f,$0f,$0f,$01, $0f,$0f,$0f,$01, $0f,$20,$26,$16

stage_flatland_palette_black:
.byt $0f,$0f,$0f,$0f, $0f,$0f,$0f,$0f, $0f,$0f,$0f,$0f, $0f,$0f,$0f,$0f

stage_flatland_fadeout_lsb:
.byt <stage_flatland_palette_black, <stage_flatland_palette_fadeout3, <stage_flatland_palette_fadeout2, <stage_flatland_palette_fadeout1, <stage_flatland_palette
stage_flatland_fadeout_msb:
.byt >stage_flatland_palette_black, >stage_flatland_palette_fadeout3, >stage_flatland_palette_fadeout2, >stage_flatland_palette_fadeout1, >stage_flatland_palette

; Temporary 3 char alias for tiles
#define TFP INGAME_TILE_CHAR_PCT

nametable_flatland:
.byt ZIPNT_ZEROS(148)
.byt
.byt
.byt
;    -------------------  -------------------  -------------------  -------------------  -------------------  -------------------  -------------------  -------------------
.byt                                                                                                          $01, $02, ZIPNT_ZEROS(30)
.byt                                                                                                          $03, $04, $05, ZIPNT_ZEROS(67)
.byt
.byt                                                                                                                                         $01, $02,  ZIPNT_ZEROS(6)
;    -------------------  -------------------  -------------------  -------------------  -------------------  -------------------  -------------------  -------------------
.byt           $01, $02,  ZIPNT_ZEROS(22),                                                                                                   $03, $04,  $05
.byt ZIPNT_ZEROS(5)
.byt           $03, $04,  $05, ZIPNT_ZEROS(133)
.byt
.byt
;    -------------------  -------------------  -------------------  -------------------  -------------------  -------------------  -------------------  -------------------
.byt
.byt                                                     $21, $20,  ZIPNT_ZEROS(30)
.byt                                                     $1c, $1d,  ZIPNT_ZEROS(6),                $21, $21,
.byt ZIPNT_ZEROS(22)
.byt                                                     $1c, $1d,  ZIPNT_ZEROS(2), $06, $07, $08, $09, $1c, $1d
.byt ZIPNT_ZEROS(18)
;    -------------------  -------------------  -------------------  -------------------  -------------------  -------------------  -------------------  -------------------
.byt                                $0e, $0f
.byt                                          ZIPNT_ZEROS(2), $1c, $1d
.byt                                                                    ZIPNT_ZEROS(3), $0b, $0c,
.byt                                                                                              ZIPZ,$1e, $1f
.byt                                                                                                             ZIPNT_ZEROS(2), $0e, $0f
.byt                                                                                                                                       ZIPNT_ZEROS(14)
.byt                                $14, $15,  $28, $2c, $29, $2a,  $2b, $2c, $2e, $11,  $12, $2e, $29, $2a,  $21, $13, $14, $15,  $2d, $28, ZIPNT_ZEROS(12)
.byt                                $30, $31,  $31, $31, $31, $31,  $31, $31, $31, $31,  $31, $31, $31, $31,  $31, $31, $31, $31,  $31, $32, ZIPNT_ZEROS(12)
.byt                                $33, $3a,  $3a, $3a, $3a, $3a,  $3a, $3a, $3a, $3a,  $3a, $3a, $3a, $3a,  $3a, $3a, $3a, $3a,  $3a, $36, ZIPNT_ZEROS(12)
;    -------------------  -------------------  -------------------  -------------------  -------------------  -------------------  -------------------  -------------------
.byt                                $37, $39,  $3a, $3a, $3a, $3a,  $3a, $3a, $38, $39,  $3a, $3a, $3a, $3a,  $3a, $3a, $3a, $3a,  $3a, $3b, ZIPNT_ZEROS(12)
.byt                                $33, $3a,  $3a, $3a, $3a, $3a,  $3a, $3a, $3c, $3d,  $3a, $3a, $3a, $3a,  $3a, $3a, $3e, $3a,  $3a, $36, ZIPNT_ZEROS(6)
.byt $3f, $40, $41, $42,  $43, $3f, $37, $3a,  $3e, $3a, $3a, $3a,  $3a, $44, $45, $3a,  $3a, $3a, $44, $45,  $3a, $3a, $3a, $3a,  $3a, $3b, $40, $41,  $42, $43, $3f, $40
.byt $3a, $3a, $3a, $3a,  $3a, $3a, $33, $3d,  $3a, $3a, $44, $45,  $3a, $3a, $3a, $3a,  $3a, $3a, $3a, $3a,  $3a, $3a, $3a, $3a,  $3a, $36, $3a, $3a,  $3a, $3a, $3a, $3a
;    -------------------  -------------------  -------------------  -------------------  -------------------  -------------------  -------------------  -------------------
.byt $3a, $3a, $3a, $3a,  $3a, $3a, $37, $3a,  $3a, $d1, $d2, $39,  $3a, $3a, $3e, $3a,  $3a, $3a, $3a, $3a,  $3a, $d6, $d7, $3a,  $3c, $3b, $3a, $3a,  $3a, $3a, $3a, $3a
.byt $3a, $3a, $3a, $3a,  $3a, $3a, $33, $3a,  $3a, $d3, $d4, $3d,  $3a, $3a, $3a, $3e,  $3a, $3a, $3a, $3a,  $38, $d8, $d9, $3a,  $3a, $36, $3a, $3a,  $3a, $3a, $3a, $3a
.byt $3a, $3a, $3a, $3a,  $3a, $3a, $37, $3a,  $3a, $3a, $3a, TFP,  $45, $3a, $3a, $3a,  $3a, $3a, $3a, $3d,  $3c, $3d, $3a, TFP,  $3a, $3b, $3a, $3a,  $3a, $3a, $3a, $3a
.byt $3a, $3a, $3a, $3a,  $3a, $3a, $33, $3a,  $3a, $3a, $3a, $3a,  $3a, $3a, $3a, $3a,  $3a, $3a, $3a, $3a,  $44, $45, $3a, $3a,  $38, $36, $3a, $3a,  $3a, $3a, $3a, $3a
;    -------------------  -------------------  -------------------  -------------------  -------------------  -------------------  -------------------  -------------------
.byt $46, $46, $46, $46,  $46, $46, $37, $3a,  $3a, $3a, $3a, $3a,  $3a, $3a, $3a, $3a,  $3a, $3a, $3e, $3a,  $3a, $3a, $3a, $3a,  $3a, $3b, $46, $46,  $46, $46, $46, $46
.byt ZIPNT_ZEROS(6),                $33, $3a,  $3a, $3a, $3a, $3a,  $3a, $3a, $3a, $3a,  $3a, $3a, $3a, $3a,  $3a, $3a, $3a, $3a,  $3a, $36
.byt ZIPNT_ZEROS(6)
nametable_flatland_attributes:
.byt ZIPNT_ZEROS(8+2)
.byt                       %01010101, ZIPNT_ZEROS(2),       %01010101, %01010101, %01010101
.byt %01010101, %01010101, ZIPNT_ZEROS(4),                             %01010101, %01010101
.byt ZIPNT_ZEROS(8+1)
.byt            %00001000, ZIPNT_ZEROS(3),                  %00001000
.byt ZIPNT_ZEROS(2)
.byt %01010000, %00010001, ZIPNT_ZEROS(4),                             %01000100, %01010000
.byt %01010101, %00010001, ZIPNT_ZEROS(4),                             %01000100, %01010101
.byt %01010101, %00010001, ZIPNT_ZEROS(4),                             %01000100, %01010101
nametable_flatland_end:
.byt ZIPNT_END

#undef TFP
