TILESET_LOGO_BANK_NUMBER = CURRENT_BANK_NUMBER

tileset_logo:

; Tileset's size in tiles (zero means 256)
.byt (tileset_logo_end-tileset_logo_tiles)/16

tileset_logo_tiles:

; Super Tilt Bro. Logo
;
; Full picture layout
;  $00 $00 $00 $00 $01 $02 $03 $04 $05 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 
;  $00 $00 $00 $00 $06 $07 $08 $09 $0a $0b $0c $0d $0e $0b $0f $10 $11 $12 $13 $14 $0b $0f $15 $00 $00 $00 $00 $00 
;  $00 $00 $00 $00 $16 $17 $18 $19 $1a $1b $19 $1c $1a $1b $1d $1e $1f $20 $21 $22 $1b $1d $1e $23 $00 $00 $00 $00 
;  $00 $00 $00 $00 $24 $25 $26 $27 $28 $1b $19 $1c $1a $29 $2a $2b $1f $2c $2d $1a $29 $2a $2e $2f $00 $00 $00 $00 
;  $00 $00 $00 $00 $30 $31 $32 $33 $34 $35 $19 $1c $1a $36 $37 $19 $1f $38 $39 $1a $36 $3a $3b $00 $00 $00 $00 $00 
;  $00 $00 $00 $00 $3c $3d $3e $3f $40 $41 $42 $43 $44 $29 $45 $46 $47 $2c $48 $49 $29 $4a $4b $4c $00 $00 $00 $00 
;  $00 $00 $00 $00 $4d $4e $4f $50 $00 $51 $4f $52 $53 $4f $54 $55 $4f $4f $4f $56 $4f $57 $4f $58 $00 $00 $00 $00 
;  $59 $03 $03 $03 $5a $5b $00 $00 $00 $00 $00 $00 $00 $5c $03 $5d $5e $05 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 
;  $5f $60 $61 $62 $63 $64 $65 $66 $67 $68 $69 $6a $6b $6c $61 $6d $6e $6f $70 $0b $0f $15 $71 $72 $73 $74 $00 $00 
;  $75 $76 $77 $78 $19 $77 $79 $77 $79 $7a $7b $7c $7d $76 $77 $7e $7f $80 $1a $1b $1d $1e $81 $82 $83 $84 $85 $00 
;  $00 $86 $77 $78 $19 $77 $79 $77 $79 $19 $7b $87 $00 $86 $77 $88 $89 $8a $1a $29 $2a $2b $8b $20 $19 $8c $8d $00 
;  $00 $86 $77 $78 $19 $77 $79 $77 $79 $19 $7b $87 $00 $86 $77 $78 $8e $8f $1a $36 $3a $90 $91 $92 $93 $94 $95 $96 
;  $00 $97 $98 $99 $9a $98 $9b $98 $9c $9d $9e $9f $a0 $a1 $98 $a2 $a3 $a4 $44 $29 $4a $a5 $a6 $a7 $a8 $a9 $aa $ab 
;  $00 $ac $4f $ad $ae $4f $af $4f $4f $b0 $b1 $ad $b2 $ac $4f $4f $b3 $b4 $b5 $4f $b6 $4f $b7 $51 $b3 $b8 $b9 $ba 
;  $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 
;  $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 

.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000001, %00000011, %00000111
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000001, %00000011
.byt %00000011, %00001111, %00111111, %01111100, %11110011, %11101111, %11011111, %10111111
.byt %00000000, %00000011, %00001111, %00111111, %01111100, %11110000, %11100000, %11000000
.byt %11111111, %11111111, %11111111, %00000000, %11111111, %11111111, %11111111, %11111111
.byt %00000000, %11111111, %11111111, %11111111, %00000000, %00000000, %00000000, %00000000
.byt %00000000, %11100000, %11111000, %11111110, %00011111, %11100111, %11111001, %11111110
.byt %00000000, %00000000, %11100000, %11111000, %11111110, %00011111, %00000111, %00000001
.byt %00000000, %00000000, %00000000, %00000000, %10000000, %11000000, %11100000, %11110000
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %10000000, %11000000, %11100000
.byt %00001111, %00001110, %00011101, %00011101, %00111011, %00111011, %00111011, %00111011
.byt %00000111, %00000111, %00001110, %00001110, %00011100, %00011100, %00011100, %00011100
.byt %01111111, %11111111, %11111110, %11111101, %11111011, %11111011, %11111011, %11111011
.byt %10000000, %00000000, %00000001, %00000011, %00000111, %00000111, %00000111, %00000111
.byt %11000000, %00111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %00111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %11111110, %00111110, %11011110, %11011110, %11011110, %11011110, %11100001, %11111111
.byt %00000001, %11000001, %11100001, %11100001, %11100001, %11100001, %11111111, %11111111
.byt %11111111, %11111111, %11111111, %11110000, %11101111, %11101111, %11101111, %11110001
.byt %11110000, %11111111, %11111111, %11111111, %11110000, %11110000, %11110000, %11111110
.byt %11111111, %11111111, %11111111, %00000000, %11111111, %11111111, %11111111, %11111000
.byt %00000000, %11111111, %11111111, %11111111, %00000000, %00000000, %00000000, %00000111
.byt %00000000, %11000011, %11111111, %11111111, %01111110, %01111110, %01111110, %11111111
.byt %00000000, %00000000, %11000011, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %11111111, %11111111, %11111111, %00000000, %11111111, %11111111, %11111111, %00011110
.byt %00000000, %11111111, %11111111, %11111111, %00000000, %00000000, %00000000, %11100001
.byt %11111111, %11111111, %11111111, %00110000, %11001111, %11001111, %11001111, %00110001
.byt %00000000, %11111111, %11111111, %11111111, %00110000, %00110000, %00110000, %11111110
.byt %11100000, %11111100, %11111111, %00011111, %11100011, %11111100, %11111111, %00011111
.byt %00000000, %11100000, %11111100, %11111111, %00011111, %00000011, %00000000, %11100000
.byt %00000000, %00000001, %10000011, %11111111, %11111110, %01111110, %10011110, %11101111
.byt %00000000, %00000000, %00000001, %10000011, %11111111, %11111111, %01111111, %00011111
.byt %11111111, %11111111, %11111111, %00000000, %11111111, %11111111, %11111111, %00011111
.byt %00000000, %11111111, %11111111, %11111111, %00000000, %00000000, %00000000, %11100000
.byt %11111111, %11111111, %11111111, %00000000, %11111111, %11111111, %11111111, %10000000
.byt %00000000, %11111111, %11111111, %11111111, %00000000, %00000000, %00000000, %01111111
.byt %11111111, %11111111, %11111111, %00000000, %11111111, %11111111, %11111111, %00000111
.byt %00000000, %11111111, %11111111, %11111111, %00000000, %00000000, %00000000, %11111000
.byt %11111111, %11111111, %11111111, %11110000, %01101111, %01101111, %01101111, %01110001
.byt %00000000, %11111111, %11111111, %11111111, %11110000, %11110000, %11110000, %11111110
.byt %00000000, %00000000, %10000000, %11100000, %11111000, %01111100, %10011110, %11101111
.byt %00000000, %00000000, %00000000, %10000000, %11100000, %11111000, %01111100, %00011110
.byt %00111011, %00111011, %00111011, %00111011, %00111011, %00011101, %00011110, %00001111
.byt %00011100, %00011100, %00011100, %00011100, %00011100, %00001110, %00001111, %00000111
.byt %11111011, %11111011, %11111101, %11111110, %11111111, %11111111, %11111111, %01111111
.byt %00000111, %00000111, %00000011, %00000001, %00000000, %00000000, %00000000, %10000000
.byt %11111111, %11111111, %11111111, %11111111, %01111111, %10011111, %11100011, %11111100
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %01111111, %00011111, %00000011
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %11111101, %11111101, %11111101, %11111101, %11111101, %11111101, %11111101, %11111101
.byt %11111110, %11111110, %11111110, %11111110, %11111110, %11111110, %11111110, %11111110
.byt %11111011, %11111011, %11111011, %11111011, %11111011, %11111011, %11111011, %11111011
.byt %00000111, %00000111, %00000111, %00000111, %00000111, %00000111, %00000111, %00000111
.byt %11011110, %11011110, %11011110, %11011110, %11011110, %11011110, %11011110, %11011110
.byt %11100001, %11100001, %11100001, %11100001, %11100001, %11100001, %11100001, %11100001
.byt %11100111, %11111011, %11111101, %11111110, %11111110, %11111110, %11111110, %11111110
.byt %11111000, %11111100, %11111110, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %11110111, %11111011, %11111101, %11111110, %11111110, %11111110, %11111110, %11111110
.byt %00001111, %00000111, %00000011, %00000001, %00000001, %00000001, %00000001, %00000001
.byt %11011111, %11011111, %11011111, %11011111, %11011111, %11011111, %11011111, %11011111
.byt %11100000, %11100000, %11100000, %11100000, %11100000, %11100000, %11100000, %11100000
.byt %10111111, %10111111, %10111111, %10111111, %10111111, %10111111, %10111111, %10111111
.byt %01111111, %01111111, %01111111, %01111111, %01111111, %01111111, %01111111, %01111111
.byt %11110111, %11110111, %11111000, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %11111000, %11111000, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %01111101, %01111101, %11111101, %11111101, %11111101, %11111101, %11111101, %11111101
.byt %11111110, %11111110, %11111110, %11111110, %11111110, %11111110, %11111110, %11111110
.byt %10000000, %11000000, %11000000, %11100000, %11100000, %11100000, %11100000, %11100000
.byt %00000000, %10000000, %10000000, %11000000, %11000000, %11000000, %11000000, %11000000
.byt %00000111, %00000011, %00000001, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %00000011, %00000001, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %10111111, %11011111, %11100111, %11111001, %01111110, %00011111, %00000111, %00000001
.byt %11000000, %11100000, %11111000, %01111110, %00011111, %00000111, %00000001, %00000000
.byt %11111111, %11111111, %11111111, %11111111, %01111111, %10011111, %11100111, %11111001
.byt %00000000, %00000000, %00000000, %00000000, %10000000, %11100000, %11111000, %11111110
.byt %00111111, %11001111, %11110111, %11111011, %11111101, %11111110, %11111111, %11111111
.byt %11111111, %00111111, %00001111, %00000111, %00000011, %00000001, %00000000, %00000000
.byt %11111101, %11111101, %11111101, %11111101, %11111101, %11111101, %01111101, %10111101
.byt %11111110, %11111110, %11111110, %11111110, %11111110, %11111110, %11111110, %01111110
.byt %11111011, %11111011, %11111011, %11111011, %11111000, %11111111, %11111111, %11111111
.byt %00000111, %00000111, %00000111, %00000111, %00000111, %00000000, %00000000, %00000000
.byt %11111110, %11111101, %11111011, %11100111, %00011111, %11111111, %11111111, %11111110
.byt %11111111, %11111110, %11111100, %11111000, %11100000, %00000000, %00000000, %00000001
.byt %11111110, %11111101, %11111011, %11110111, %11101111, %11011111, %10111111, %01111111
.byt %00000001, %00000011, %00000111, %00001111, %00011111, %00111111, %01111111, %11111111
.byt %10111111, %10111111, %10111111, %10111111, %10000000, %11111111, %11111111, %11111111
.byt %01111111, %01111111, %01111111, %01111111, %01111111, %00000000, %00000000, %00000000
.byt %11111111, %10011111, %01101111, %01101111, %01101111, %11101111, %11101111, %11101111
.byt %11111111, %11111111, %10011111, %10011111, %10011111, %00011111, %00011111, %00011111
.byt %11111110, %11111101, %11111011, %11110111, %11101111, %11011110, %10111100, %01111000
.byt %00000001, %00000011, %00000111, %00001111, %00011110, %00111100, %01111000, %11110000
.byt %11100000, %11000000, %11000000, %10000000, %00000000, %00000000, %00000000, %00000000
.byt %11000000, %10000000, %10000000, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %00000011, %00001111, %00011111, %00011100, %00111011, %00111011, %00111011, %00111011
.byt %00000000, %00000011, %00001111, %00001111, %00011100, %00011100, %00011100, %00011100
.byt %11000001, %11110001, %11111111, %00111111, %11011111, %11011111, %11011111, %11011111
.byt %00000000, %11000000, %11110001, %11111111, %00111111, %00111111, %00111111, %00111111
.byt %11111110, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %11111111, %01111111, %10111111, %11011111, %11011111, %11011111, %11011111, %11011111
.byt %00000000, %10000000, %11000000, %11100000, %11100000, %11100000, %11100000, %11100000
.byt %10111101, %11011101, %11011101, %11011101, %11011101, %11011101, %11011110, %11011110
.byt %01111110, %00111110, %00111110, %00111110, %00111110, %00111110, %00111111, %00111111
.byt %11111011, %11111011, %11111011, %11111011, %11111011, %11111011, %11111011, %11111101
.byt %00000111, %00000111, %00000111, %00000111, %00000111, %00000111, %00000111, %00000011
.byt %11111000, %11111011, %11111011, %11111011, %11111011, %11111011, %11111011, %11111011
.byt %00000111, %00000111, %00000111, %00000111, %00000111, %00000111, %00000111, %00000111
.byt %00000001, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %10000000, %10111111, %10111111, %10111111, %10111111, %10111111, %10111111, %10111111
.byt %01111111, %01111111, %01111111, %01111111, %01111111, %01111111, %01111111, %01111111
.byt %01101111, %01101111, %01101111, %10011111, %11111111, %11111111, %11111111, %11111111
.byt %10011111, %10011111, %10011111, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %01111110, %01111110, %10111111, %10111111, %11011111, %11011111, %11101111, %11101111
.byt %10000001, %10000001, %11000000, %11000000, %11100000, %11100000, %11110000, %11110000
.byt %11111000, %11110000, %01110000, %01110000, %10111000, %10111000, %11011100, %11011100
.byt %11110000, %11100000, %11100000, %11100000, %01110000, %01110000, %00111000, %00111000
.byt %00111011, %00111011, %00011101, %00011101, %00001110, %00001111, %00000111, %00000011
.byt %00011100, %00011100, %00001110, %00001110, %00000111, %00000111, %00000011, %00000001
.byt %11011111, %11011111, %11101111, %11110111, %11111000, %01111111, %10111111, %11001111
.byt %00111111, %00111111, %00011111, %00001111, %00000111, %10000000, %11000000, %11110000
.byt %11111111, %11111111, %11111111, %11111100, %00000011, %11111111, %11111111, %11111111
.byt %11111111, %11111111, %11111111, %11111111, %11111100, %00000000, %00000000, %00000000
.byt %11011111, %10111111, %01111111, %11111111, %11111110, %11111101, %11111011, %11100111
.byt %11100000, %11000000, %10000000, %00000000, %00000001, %00000011, %00000111, %00011111
.byt %11011110, %10111110, %10111110, %01111110, %11111111, %11100111, %11000011, %10000001
.byt %00111111, %01111111, %01111111, %11111111, %11100111, %11000011, %10000001, %00000000
.byt %11111101, %11111101, %11111101, %11111100, %01111111, %10111111, %11011111, %11100111
.byt %00000011, %00000011, %00000011, %00000011, %10000000, %11000000, %11100000, %11111000
.byt %11111111, %11111111, %11111111, %11111111, %00000000, %11111111, %11111111, %11111111
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %00000000, %00000000, %00000000
.byt %10011110, %01111001, %01111011, %01111011, %11110111, %11110111, %11101111, %00011111
.byt %11100001, %10000111, %10000111, %10000111, %00001111, %00001111, %00011111, %11111111
.byt %11111101, %11111101, %11111101, %11111101, %11110001, %11101111, %11101111, %11101111
.byt %11111110, %11111110, %11111110, %11111110, %11111110, %11110000, %11110000, %11110000
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %01111111, %01111111, %01111111
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111110, %11111110, %11111110
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %11011111, %11011111, %11011111, %11011111, %00011111, %11111111, %11111111, %11111111
.byt %11100000, %11100000, %11100000, %11100000, %11100000, %00000000, %00000000, %00000000
.byt %11111111, %11111110, %11111101, %11111101, %00000001, %11111111, %11111111, %11111111
.byt %11111111, %11111111, %11111110, %11111110, %11111110, %00000000, %00000000, %00000000
.byt %11111101, %00111101, %11011101, %11011101, %11010001, %11001111, %11001111, %00101111
.byt %11111110, %11111110, %00111110, %00111110, %00111110, %00110000, %00110000, %11110000
.byt %11110111, %11110111, %11111011, %11111011, %11111101, %01111101, %01111101, %01111101
.byt %11111000, %11111000, %11111100, %11111100, %11111110, %11111110, %11111110, %11111110
.byt %11101110, %11101111, %11110111, %11110111, %11111000, %11111111, %11111111, %11111111
.byt %00011100, %00011110, %00001111, %00001111, %00000111, %00000000, %00000000, %00000000
.byt %00000000, %10000000, %11000000, %11100000, %11100000, %01110000, %01110000, %01110000
.byt %00000000, %00000000, %10000000, %11000000, %11000000, %11100000, %11100000, %11100000
.byt %00000001, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %11110000, %11111111, %00111111, %00001111, %00000000, %00000000, %00000000, %00000000
.byt %11111111, %00111111, %00001111, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %00000000, %11111111, %11111111, %11111111, %00000000, %00000000, %00000000, %00000000
.byt %11111111, %11111111, %11111111, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %00011111, %11111110, %11111000, %11100000, %00000000, %00000000, %00000000, %00000000
.byt %11111110, %11111000, %11100000, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %11111000, %01111111, %00011111, %00000111, %00000000, %00000000, %00000000, %00000000
.byt %01111111, %00011111, %00000111, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %11111111, %11111111, %11110000, %10000000, %00000000, %00000000, %00000000, %00000000
.byt %11111111, %11110000, %10000000, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %11110000, %11111111, %01111111, %00111111, %00000000, %00000000, %00000000, %00000000
.byt %11111111, %01111111, %00111111, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %11111111, %11111111, %11100000, %10000000, %00000000, %00000000, %00000000, %00000000
.byt %11111111, %11100000, %10000000, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %11111111, %11111111, %00000111, %00000001, %00000000, %00000000, %00000000, %00000000
.byt %11111111, %00000111, %00000001, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %11110000, %11111111, %11111111, %11111111, %00000000, %00000000, %00000000, %00000000
.byt %11111111, %11111111, %11111111, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %11111110, %11111111, %11111111, %11000000, %00000000, %00000000, %00000000, %00000000
.byt %11111111, %11111111, %11000001, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %11100000, %11100000, %11000000, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %11000000, %11000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %00000111, %00001111, %00011111, %00111100, %00111011, %01111011, %01110111, %01110111
.byt %00000000, %00000111, %00001111, %00011111, %00011100, %00111100, %00111000, %00111000
.byt %11111000, %11111110, %11111111, %00000111, %11111011, %11111011, %11111101, %11111101
.byt %00000000, %11111000, %11111110, %11111111, %00000111, %00000111, %00000011, %00000011
.byt %00000000, %00000000, %00000000, %10000000, %11000000, %11000000, %11100000, %11110000
.byt %00000000, %00000000, %00000000, %00000000, %10000000, %10000000, %11000000, %11100000
.byt %00000011, %00000111, %00001111, %00011110, %00011101, %00011101, %00011101, %00011101
.byt %00000000, %00000011, %00000111, %00001111, %00001110, %00001110, %00001110, %00001110
.byt %11111100, %11111111, %11111111, %00000111, %11111000, %11111111, %11111111, %11111111
.byt %00000000, %11111100, %11111111, %11111111, %00000111, %00000000, %00000000, %00000000
.byt %00000000, %11100000, %11111100, %11111111, %00011111, %11100111, %11111001, %11111110
.byt %00000000, %00000000, %11100000, %11111100, %11111111, %00011111, %00000111, %00000001
.byt %01110111, %01110111, %01110111, %01110111, %01111011, %00111100, %00111111, %00011111
.byt %00111000, %00111000, %00111000, %00111000, %00111100, %00011111, %00011111, %00001111
.byt %11111111, %11000000, %00111111, %01111111, %01111111, %11100011, %11100011, %11000011
.byt %00000000, %00111111, %11111111, %11111111, %11100001, %11000001, %11000001, %10000001
.byt %11111111, %00111111, %10111111, %10111111, %10111111, %10111111, %10111111, %10111111
.byt %00000000, %11000000, %11000000, %11000000, %11000000, %11000000, %11000000, %11000000
.byt %11111111, %11000000, %11011111, %11011111, %11011111, %11011111, %11011111, %11011111
.byt %00000000, %00111111, %00111111, %00111111, %00111111, %00111111, %00111111, %00111111
.byt %11111101, %01111101, %10011101, %11011100, %11011011, %11100011, %11111011, %11111100
.byt %00000011, %10000011, %11100011, %11100011, %11100100, %11111100, %11111100, %11111111
.byt %11111111, %11111111, %11111111, %00000000, %11111111, %11111111, %11111111, %00111111
.byt %11110000, %11111111, %11111111, %11111111, %00000000, %00000000, %00000000, %11000000
.byt %11111111, %11111111, %11111111, %00001110, %11110101, %11110101, %11110101, %00001110
.byt %00000000, %11111111, %11111111, %11111111, %00001110, %00001110, %00001110, %11111111
.byt %11111111, %11111111, %11111111, %00000000, %11111111, %11111111, %11111111, %00111111
.byt %00000000, %11111111, %11111111, %11111111, %00000000, %00000000, %00000000, %11000000
.byt %11000000, %11110000, %11111111, %00111111, %11011111, %11011111, %11011111, %00111111
.byt %00000000, %11000000, %11110000, %11111111, %00111111, %00111111, %00111111, %11111111
.byt %00001111, %00111111, %11111111, %11110000, %11101111, %11011111, %11011111, %11011100
.byt %00000000, %00001111, %00111111, %11111111, %11110000, %11100000, %11100000, %11100011
.byt %11111111, %11111111, %11111111, %00000000, %11111111, %11111111, %11111111, %00001111
.byt %00000000, %11111111, %11111111, %11111111, %00000000, %00000000, %00000000, %11110000
.byt %11111111, %11111111, %11111111, %00000000, %11111111, %11111111, %11111111, %11000000
.byt %00000000, %11111111, %11111111, %11111111, %00000000, %00000000, %00000000, %00111111
.byt %11110000, %11111100, %11111110, %00001111, %11110111, %11111011, %11111011, %00111011
.byt %00000000, %11110000, %11111100, %11111110, %00001110, %00000111, %00000111, %11000111
.byt %00011101, %00011110, %00001111, %00000111, %00000011, %10000011, %10000011, %10000011
.byt %00001110, %00001111, %00000111, %00000011, %00000001, %00000001, %00000001, %00000001
.byt %11111111, %11000001, %11011110, %11011111, %11011111, %11011111, %11011111, %11011111
.byt %00000000, %00111110, %00111111, %00111111, %00111111, %00111111, %00111111, %00111111
.byt %11111111, %11111111, %01111111, %10111111, %11011111, %11011111, %11101111, %11101111
.byt %00000000, %00000000, %10000000, %11000000, %11100000, %11100000, %11110000, %11110000
.byt %01111000, %10111100, %11011100, %11101110, %11101111, %11110111, %11110111, %11110111
.byt %11110000, %01111000, %00111000, %00011100, %00011110, %00001111, %00001111, %00001111
.byt %00001111, %00111111, %01111111, %01110000, %11101111, %11101111, %11101111, %11110001
.byt %00000000, %00001111, %00111111, %00111111, %01110000, %11110000, %11110000, %11111110
.byt %00000000, %00000000, %00000000, %00000000, %00000001, %00000011, %00000111, %00011111
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000001, %00000011, %00000111
.byt %00000111, %00011111, %01111111, %11111000, %11100111, %11011111, %10111111, %01111110
.byt %00000000, %00000111, %00011111, %01111111, %11111000, %11100000, %11000000, %10000001
.byt %11111100, %11111111, %11111111, %00000011, %11111100, %11111111, %11111111, %00001111
.byt %00000000, %11111100, %11111111, %11111111, %00000011, %00000000, %00000000, %11110000
.byt %00000000, %00000000, %11000000, %11100000, %11110000, %01111000, %10111100, %11011110
.byt %00000000, %00000000, %00000000, %11000000, %11100000, %11110000, %01111000, %00111100
.byt %00001111, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %10000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011
.byt %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001
.byt %10111111, %10111111, %10111111, %10111111, %10111111, %10111111, %10111111, %10111111
.byt %11000000, %11000000, %11000000, %11000000, %11000000, %11000000, %11000000, %11000000
.byt %11011111, %11011111, %11011111, %11011111, %11011111, %11011111, %11011111, %11011111
.byt %00111111, %00111111, %00111111, %00111111, %00111111, %00111111, %00111111, %00111111
.byt %01111111, %01111111, %01111111, %01111111, %01111111, %01111111, %01111111, %01111111
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %11011101, %11101101, %11110011, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %11100011, %11110011, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %11101111, %11101111, %11101111, %11101111, %11101111, %11101111, %11101111, %11101111
.byt %11110000, %11110000, %11110000, %11110000, %11110000, %11110000, %11110000, %11110000
.byt %11011111, %11011111, %11011111, %11011111, %11011111, %11011100, %11011100, %11011100
.byt %00111111, %00111111, %00111111, %00111111, %00111100, %00111000, %00111000, %00111000
.byt %10111011, %10110111, %11001111, %11111110, %11111100, %01110000, %00000000, %00000000
.byt %11000111, %11001110, %11111110, %11111100, %01110000, %00000000, %00000000, %00000000
.byt %11011111, %11011111, %11011111, %11011111, %11011111, %11011111, %11011111, %11000000
.byt %00111111, %00111111, %00111111, %00111111, %00111111, %00111111, %00111111, %00111111
.byt %11101111, %11101111, %11101111, %11101111, %11011111, %11011111, %00111111, %11111111
.byt %11110000, %11110000, %11110000, %11110000, %11100000, %11100000, %11000000, %00000000
.byt %11110111, %11110111, %11110111, %11110111, %11101111, %11011111, %10111111, %01111111
.byt %00001111, %00001111, %00001111, %00001111, %00011111, %00111111, %01111111, %11111111
.byt %11111110, %11111101, %11111011, %11111011, %11110111, %11110111, %11101111, %11101111
.byt %00011111, %11111110, %11111100, %11111100, %11111000, %11111000, %11110000, %11110000
.byt %11111101, %11111011, %11110111, %11101111, %11101111, %11011111, %11011111, %11011111
.byt %00000011, %00000111, %00001111, %00011111, %00011111, %00111111, %00111111, %00111111
.byt %11110111, %11111011, %11111101, %11111110, %11111110, %11111111, %11111111, %11111111
.byt %11111000, %11111100, %11111110, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %11101110, %11110111, %11110111, %11111011, %11111011, %01111101, %01111101, %01111110
.byt %00011100, %00001110, %00001110, %00000111, %00000111, %10000011, %10000011, %10000001
.byt %00000000, %00000000, %00000000, %10000000, %10000000, %11000000, %11000000, %11100000
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %10000000, %10000000, %11000000
.byt %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011
.byt %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001
.byt %11011100, %11011100, %11011100, %11011100, %11011100, %11011100, %11011100, %11011100
.byt %00111000, %00111000, %00111000, %00111000, %00111000, %00111000, %00111000, %00111000
.byt %11111111, %11111111, %11111111, %11111111, %11000000, %11011111, %11011111, %11011111
.byt %00000000, %00000000, %00000000, %00000000, %00111111, %00111111, %00111111, %00111111
.byt %11111110, %11111101, %11111110, %11111111, %00111111, %11001111, %11110111, %11111011
.byt %00000001, %00000011, %00000001, %00000000, %11000000, %11110000, %11111000, %11111100
.byt %11111111, %11111111, %01111111, %10011111, %11101111, %11110111, %11111011, %11111101
.byt %11111111, %11111111, %11111111, %01111111, %00011111, %00001111, %00000111, %00000011
.byt %11101111, %11011111, %11011111, %11011111, %11011111, %11011111, %11011111, %11011111
.byt %11110000, %11100000, %11100000, %11100000, %11100000, %11100000, %11100000, %11100000
.byt %01111110, %10111110, %10111111, %10111111, %10111111, %10111111, %10111111, %10111111
.byt %10000001, %11000001, %11000000, %11000000, %11000000, %11000000, %11000000, %11000000
.byt %11100000, %11100000, %01110000, %01110000, %01110000, %01110000, %01110000, %01110000
.byt %11000000, %11000000, %11100000, %11100000, %11100000, %11100000, %11100000, %11100000
.byt %11111011, %11111101, %11111101, %11111101, %11111101, %11111101, %11111101, %11111011
.byt %11111100, %11111110, %11111110, %11111110, %11111110, %11111110, %11111110, %11111100
.byt %11111110, %11111110, %11111110, %11111110, %11111110, %11111110, %11111110, %11111101
.byt %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000011
.byt %11111111, %11111111, %01111111, %01111111, %10111111, %10111111, %11011111, %11011111
.byt %11111111, %11111111, %11111111, %11111111, %01111111, %01111111, %00111111, %00111111
.byt %11011111, %11011111, %11011111, %11011111, %11101111, %11101111, %11101111, %11110111
.byt %11100000, %11100000, %11100000, %11100000, %11110000, %11110000, %11110000, %11111000
.byt %10111111, %10111111, %10111111, %10111111, %10111111, %11011111, %11011111, %11011111
.byt %01111111, %01111111, %01111111, %01111111, %01111111, %00111111, %00111111, %00111111
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111110
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %10111111, %10111111, %10111111, %01111110, %01111110, %01111110, %01111101, %11111101
.byt %11000000, %11000000, %11000000, %10000001, %10000001, %10000001, %10000011, %00000011
.byt %01110000, %01110000, %01110000, %11100000, %11100000, %11111110, %11111111, %11111111
.byt %11100000, %11100000, %11100000, %11000000, %11000000, %11100000, %11111110, %11111111
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %10000000, %11000000
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %10000000
.byt %00000011, %00000011, %00000111, %00001111, %00011110, %00011101, %00011101, %00011101
.byt %00000001, %00000001, %00000011, %00000111, %00001111, %00001110, %00001110, %00001110
.byt %10111111, %10111111, %10111111, %10111111, %00111111, %11111111, %11111111, %11111111
.byt %11000000, %11000000, %11000000, %11000000, %11000000, %00000000, %00000000, %00000000
.byt %11011111, %11011111, %11011111, %11011111, %11000111, %11111011, %11111011, %11111011
.byt %00111111, %00111111, %00111111, %00111111, %00111111, %00000111, %00000111, %00000111
.byt %11111111, %11111111, %11111111, %11111111, %11111100, %11111011, %11111011, %11111011
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111100, %11111100, %11111100
.byt %01111111, %01111111, %01111111, %01111111, %00001110, %11110101, %11110101, %11110101
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %00001110, %00001110, %00001110
.byt %01111111, %01111111, %01111111, %01111111, %00000000, %11111111, %11111111, %11111111
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %00000000, %00000000, %00000000
.byt %11111111, %11110001, %11101110, %11101110, %00001110, %11111110, %11111110, %11111110
.byt %11111111, %11111111, %11110001, %11110001, %11110001, %00000001, %00000001, %00000001
.byt %11101111, %11101111, %11101111, %11101111, %10001111, %01111111, %01111111, %01111111
.byt %11110000, %11110000, %11110000, %11110000, %11110000, %10000000, %10000000, %10000000
.byt %11011100, %11011110, %11011110, %11011111, %11000111, %11111011, %11111011, %11111011
.byt %00111000, %00111100, %00111100, %00111110, %00111110, %00000111, %00000111, %00000111
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %10000000, %10000000, %10000000
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %00000011, %00000011, %00001111, %00011111, %00011110, %00011101, %00011101, %00011101
.byt %00000001, %00000001, %00000011, %00001111, %00001111, %00001110, %00001110, %00001110
.byt %11011111, %11011111, %11011111, %11000000, %11111111, %11111111, %11111111, %11111111
.byt %00111111, %00111111, %00111111, %00111111, %00000000, %00000000, %00000000, %00000000
.byt %11111011, %11110111, %11001111, %00111111, %11111111, %11111111, %11111111, %11111100
.byt %11111100, %11111000, %11110000, %11000000, %00000000, %00000000, %00000000, %00000011
.byt %11111101, %11111011, %11110111, %11101111, %11011111, %10111111, %01111111, %11111111
.byt %00000011, %00000111, %00001111, %00011111, %00111111, %01111111, %11111111, %11110001
.byt %11101111, %11101111, %11110111, %11110111, %11111000, %11111111, %11111111, %11111111
.byt %00011111, %00011111, %00001111, %00001111, %00000111, %00000000, %00000000, %00000000
.byt %11110111, %11111011, %11111011, %11111101, %11111110, %01111111, %01111111, %01111111
.byt %11111000, %11111100, %11111100, %11111110, %11111111, %11111111, %11111111, %11110001
.byt %11101111, %11101111, %11110111, %11111011, %11111100, %01111111, %10011111, %11100111
.byt %00011111, %00011111, %00001111, %00000111, %00000011, %10000000, %11100000, %11111000
.byt %11111110, %11111101, %11111011, %11110111, %11001111, %00111111, %11111111, %11111100
.byt %11111111, %11111110, %11111100, %11111000, %11110000, %11000000, %00000000, %00000011
.byt %11111011, %11110111, %11110111, %11101111, %11011111, %10111111, %01111111, %11111111
.byt %00000111, %00001111, %00001111, %00011111, %00111111, %01111111, %11111111, %11100011
.byt %11000001, %10111110, %01111111, %01111111, %01111111, %01111111, %01111111, %10111110
.byt %11111111, %11000001, %10000000, %10000000, %10000000, %10000000, %10000000, %11000001
.byt %11100000, %11100000, %01110000, %01110000, %01110000, %01110000, %01110000, %11100000
.byt %11000000, %11000000, %11100000, %11100000, %11100000, %11100000, %11100000, %11000000
.byt %00011110, %00001111, %00000111, %00000011, %00000000, %00000000, %00000000, %00000000
.byt %00001111, %00000111, %00000011, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %00000111, %11111111, %11111110, %11111100, %00000000, %00000000, %00000000, %00000000
.byt %11111111, %11111110, %11111100, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %11111100, %00011111, %00011111, %00001111, %00000000, %00000000, %00000000, %00000000
.byt %00011111, %00001111, %00001111, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %00001110, %11111111, %11111111, %11110001, %00000000, %00000000, %00000000, %00000000
.byt %11111111, %11111111, %11110001, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %00000001, %11111111, %11111111, %11111110, %00000000, %00000000, %00000000, %00000000
.byt %11111111, %11111111, %11111110, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %10000000, %11111111, %11111111, %01111111, %00000000, %00000000, %00000000, %00000000
.byt %11111111, %11111111, %01111111, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %10000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %00000011, %11111111, %11111111, %11111100, %00000000, %00000000, %00000000, %00000000
.byt %11111111, %11111111, %11111100, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %11110001, %11000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %11000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %11110000, %01111111, %00111111, %00011111, %00000000, %00000000, %00000000, %00000000
.byt %01111111, %00111111, %00011111, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %11111110, %11111111, %11000111, %00000001, %00000000, %00000000, %00000000, %00000000
.byt %11111111, %11000111, %00000001, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %11110001, %11100000, %11000000, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %11100000, %11000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %11100011, %11000001, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %11000001, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %11000001, %11111111, %11111111, %00111110, %00000000, %00000000, %00000000, %00000000
.byt %11111111, %11111111, %00111110, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %11100000, %11000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %11000000, %10000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000

tileset_logo_end:
