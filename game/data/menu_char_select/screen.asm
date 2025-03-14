char_selection_palette:
; Background
.byt $0f,$21,$2d,$3d, $0f,$3d,$3c,$37, $0f,$21,$3c,$37, $0f,$0f,$21,$21
; Sprites
.byt $0f,$0f,$3d,$0f, $0f,$00,$00,$00, $0f,$0f,$3d,$0f, $0f,$00,$00,$00

#define A $4c
#define B A+48
char_selection_nametable:
.byt $00,$84
.byt
.byt
.byt
;    -------------------  -------------------  -------------------  -------------------  -------------------  -------------------  -------------------  -------------------
.byt                      A+0, A+1, A+2, A+3,  A+4, A+5,  $40, $40, $40, $40, $40, $40,  $40, $40, $40, $40,  $40, $40, B+0, B+1,  B+2, B+3, B+4, B+5, $00,$08
.byt                      A+6, A+7, A+8, A+9,  A+10,A+11, $40, $40, $40, $40, $40, $40,  $40, $40, $40, $40,  $40, $40, B+6, B+7,  B+8, B+9, B+10,B+11,$00,$08
.byt                      A+12,A+13,A+14,A+15, A+16,A+17,  $00,$02, $01, $02, $03, $04,  $05, $06, $07, $00,$03,        B+12,B+13, B+14,B+15,B+16,B+17,$00,$08
.byt                      A+18,A+19,A+20,A+21, A+22,A+23,  $00,$02, $08, $09, $0a, $0b,  $0c, $0d, $0e, $0f,  $00,$02,  B+18,B+19, B+20,B+21,B+22,B+23,$00,$08
;    -------------------  -------------------  -------------------  -------------------  -------------------  -------------------  -------------------  -------------------
.byt                      A+24,A+25,A+26,A+27,  A+28,A+29, $00,$02, $10, $11, $12, $13,  $14, $15, $16, $17,  $00,$02,  B+24,B+25, B+26,B+27,B+28,B+29,$00,$08
.byt                      A+30,A+31,A+32,A+33,  A+34,A+35, $00,$02, $18, $19, $1a, $1b,  $1c, $1d, $1e, $1f,  $00,$02,  B+30,B+31, B+32,B+33,B+34,B+35,$00,$08
.byt                      A+36,A+37,A+38,A+39,  A+40,A+41,$40, $40, $40, $40, $40, $40,  $40, $40, $40, $40,  $40, $40, B+36,B+37, B+38,B+39,B+40,B+41,$00,$08
.byt                      A+42,A+43,A+44,A+45,  A+46,A+47,$40, $40, $40, $40, $40, $40,  $40, $40, $40, $40,  $40, $40, B+42,B+43, B+44,B+45,B+46,B+47,$00,$07
;    -------------------  -------------------  -------------------  -------------------  -------------------  -------------------  -------------------  -------------------
.byt                $20,  $21, $22, $23, $24,  $25, $26, $27, $00,$0a,                                             $28, $21, $22,  $23, $24, $25, $26,  $27, $00,$09
.byt                                $29, $2a,  $00,$10,                                                                            $29, $2a, $00,$0c
.byt                                $29, $2a,  $00,$10,                                                                            $29, $2a, $00,$0c
.byt                                $29, $2a,  $00,$10,                                                                            $29, $2a, $00,$0c
;    -------------------  -------------------  -------------------  -------------------  -------------------  -------------------  -------------------  -------------------
.byt                                $29, $2a,  $00,$04,             $2b, $2c, $2c, $2c,  $2c, $2c, $2c, $2d,  $00,$04,             $29, $2a, $00,$0c
.byt                                $29, $2a,  $00,$04,             $2e, $2f, $30, $30,  $30, $30, $30, $31,  $00,$04,             $29, $2a, $00,$0c
.byt                                $29, $2a,  $00,$04,             $32, $33, $00,$02,   $30, $30, $30, $34,  $00,$04,             $29, $2a, $00,$0c
.byt                                $29, $2a,  $00,$04,             $2e, $2f, $00,$02,   $30, $30, $30, $31,  $00,$04,             $29, $2a, $00,$06
;    -------------------  -------------------  -------------------  -------------------  -------------------  -------------------  -------------------  -------------------
.byt $35, $36, $37, $38,  $39, $35, $29, $2a,  $38, $39, $35, $36,  $32, $33, $30, $30,  $00,$02,  $30, $34,  $35, $36, $37, $38,  $29, $2a, $36, $37,  $38, $39, $35, $36
.byt $3a, $3a, $3a, $3a,  $3a, $3a, $29, $2a,  $3a, $3a, $3a, $3a,  $2e, $2f, $30, $30,  $00,$02,  $30, $31,  $3a, $3a, $3a, $3a,  $29, $2a, $3a, $3a,  $3a, $3a, $3a, $3a
.byt $3a, $3a, $3a, $3a,  $3a, $3a, $29, $2a,  $3a, $3a, $3a, $3a,  $32, $33, $00,$02,   $30, $30, $30, $34,  $3a, $3a, $3a, $3a,  $29, $2a, $3a, $3a,  $3a, $3a, $3a, $3a
.byt $3a, $3a, $3a, $3a,  $3a, $3a, $29, $2a,  $3a, $3a, $3a, $3a,  $2e, $2f, $00,$02,   $30, $30, $30, $31,  $3a, $3a, $3a, $3a,  $29, $2a, $3a, $3a,  $3a, $3a, $3a, $3a
;    -------------------  -------------------  -------------------  -------------------  -------------------  -------------------  -------------------  -------------------
.byt $3a, $3a, $3a, $3a,  $3a, $3a, $29, $2a,  $3a, $3a, $3a, $3a,  $32, $33, $30, $30,  $00,$02,  $30, $34,  $3a, $3a, $3a, $3a,  $29, $2a, $3a, $3a,  $3a, $3a, $3a, $3a
.byt $3a, $3a, $3a, $3a,  $3a, $3a, $29, $2a,  $3a, $3a, $3a, $3a,  $2e, $2f, $30, $30,  $00,$02,  $30, $31,  $3a, $3a, $3a, $3a,  $29, $2a, $3a, $3a,  $3a, $3a, $3a, $3a
.byt $3a, $3a, $3a, $3a,  $3a, $3a, $29, $2a,  $3a, $3a, $3a, $3a,  $32, $33, $00,$02,   $30, $30, $30, $34,  $3a, $3a, $3a, $3a,  $29, $2a, $3a, $3a,  $3a, $3a, $3a, $3a
.byt $3f, $3f, $3f, $3f,  $3f, $3f, $29, $2a,  $3f, $3f, $3f, $3f,  $2e, $2f, $00,$02,   $30, $30, $30, $31,  $3f, $3f, $3f, $3f,  $29, $2a, $3f, $3f,  $3f, $3f, $3f, $3f
;    -------------------  -------------------  -------------------  -------------------  -------------------  -------------------  -------------------  -------------------
.byt $00,$06,                       $29, $2a,  $00,$04,             $32, $33, $30, $30,  $30, $30, $30, $34,  $00,$04,             $29, $2a, $00,$0c
.byt                                $29, $2a,  $00,$04,             $2e, $2f, $30, $30,  $30, $30, $30, $31,  $00,$04,             $29, $2a, $00,$06
.byt 
char_selection_nametable_attributes:
.byt ZIPNT_ZEROS(8+2)
.byt           $0c, $af, $af, $03, ZIPNT_ZEROS(2+2)
.byt           $c0, $fa, $fa, $30
.byt ZIPNT_ZEROS(2+8+3)
.byt                $40, ZIPNT_ZEROS(4)
.byt $aa, $22, $aa, $40, $01, $aa, $88, $aa
.byt $aa, $22, $aa, $40, $01, $aa, $88, $aa
.byt ZIPNT_ZEROS(8)
char_selection_nametable_end:
.byt ZIPNT_END

#undef B
#undef A
