TILESET_MENUS_BANK_NUMBER = CURRENT_BANK_NUMBER

tileset_menus:

; Tileset's size in tiles (zero means 256)
.byt (tileset_menus_end-tileset_menus_tiles)/16

tileset_menus_tiles:

; Full backdrop color
;
; 00000000
; 00000000
; 00000000
; 00000000
; 00000000
; 00000000
; 00000000
; 00000000
.byt $00, $00, $00, $00, $00, $00, $00, $00
.byt $00, $00, $00, $00, $00, $00, $00, $00

; Solid 1
;
; 11111111
; 11111111
; 11111111
; 11111111
; 11111111
; 11111111
; 11111111
; 11111111
.byt $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byt $00, $00, $00, $00, $00, $00, $00, $00

; Solid 2
.byt $00, $00, $00, $00, $00, $00, $00, $00
.byt $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff

; Solid 3
.byt $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byt $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff

; Menu box, top border plus top internal border
;
; 33333333
; 33333333
; 22222222
; 22222222
; 22222222
; 22222222
; 22222222
; 33333333
.byt %11111111, %11111111, %00000000, %00000000, %00000000, %00000000, %00000000, %11111111
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111

; Numeric font 2 with other background color
.byt %00000000, %01111100, %11000110, %01100110, %00001100, %00111000, %01111110, %00000000
.byt %11111111, %10000011, %00111001, %10011001, %11110011, %11000111, %10000001, %11111111

; Title
;
; Full picture layout
;             01 02 03
;          04 05 06 07 08 09 0a 0b 0c 0d 0e 0f 10 11
;          12 13 14 15 16 17 18 19 1a 1b 1c 1d 1e 1f
;          20 21 22 23 24 25 26 27 28 29 2a 2b 2c 2d
;          2e 2f 30 31 32 33 34 35 36 37 38 39 3a 3b
; 3c 3d 3d 3e                   3f 40 41 42
; 43 44 45 46 47 48 49 4a 4b 4c 4d 45 4e 4f 50 51 52 53 54
;    55 56 57 58 56 59 58 5a 5b 55 5c 5d 5e 5f 60 61 67 62
;    63 66 67 68 66 64 65 66    63 66 67 68 69 6a 6b 6c 6d 6e
;    6f 70 71 72 73 74 75 76    7f 73 77 78 79 7a 7b 7c 7d 7e

TILESET_MENUS_TITLE_0 = (*-tileset_menus_tiles)/16
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00001111, %00111111, %11111000
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00001111, %00111111
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %11111000, %11111111, %00001111
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %11111000, %11111111
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %10000000, %11000000
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %10000000
.byt %00000001, %00000011, %00000111, %00000110, %00000110, %00001110, %00001101, %00001101
.byt %00000000, %00000001, %00000011, %00000011, %00000011, %00000111, %00000110, %00000110
.byt %11100111, %10011111, %01111110, %11111001, %11111011, %11110111, %11110111, %11110111
.byt %11111000, %11100000, %10000001, %00000111, %00000111, %00001111, %00001111, %00001111
.byt %11110000, %11111111, %00011111, %11100111, %11110111, %11110111, %11111000, %11111111
.byt %00001111, %00000000, %11100000, %11111000, %11111000, %11111000, %11111111, %11111111
.byt %11100000, %01100000, %01111111, %01111111, %01110000, %01101111, %11101111, %11110111
.byt %11000000, %11000000, %11100000, %11111111, %11111111, %11110000, %11110000, %11111000
.byt %00000000, %00000000, %11110000, %11111111, %00011111, %11101111, %11101111, %10011111
.byt %00000000, %00000000, %00000000, %11110000, %11111111, %00011111, %00011111, %01111111
.byt %00000000, %00000000, %11111111, %11111111, %10000001, %01111110, %01111110, %10011001
.byt %00000000, %00000000, %00000000, %11111111, %11111111, %10000001, %10000001, %11100111
.byt %00000000, %00000000, %11111111, %11111111, %10000000, %01111111, %01111111, %10011110
.byt %00000000, %00000000, %00000000, %11111111, %11111111, %10000000, %10000000, %11100001
.byt %00000000, %00000000, %11110000, %11111111, %00011111, %11100001, %11111110, %00001111
.byt %00000000, %00000000, %00000000, %11110000, %11111111, %00011111, %00000001, %11110000
.byt %00000000, %00000000, %00011111, %11111111, %11110000, %11101111, %01101111, %10110011
.byt %00000000, %00000000, %00000000, %00011111, %11111111, %11110000, %11110000, %01111100
.byt %00000000, %00000000, %11111111, %11111111, %00000000, %11111111, %11111111, %11000000
.byt %00000000, %00000000, %00000000, %11111111, %11111111, %00000000, %00000000, %00111111
.byt %00000000, %00000000, %11111111, %11111111, %00001100, %11110011, %11110011, %00110100
.byt %00000000, %00000000, %00000000, %11111111, %11111111, %00001100, %00001100, %11001111
.byt %00000000, %00000000, %11111111, %11111111, %00000000, %11111111, %11111111, %11110000
.byt %00000000, %00000000, %00000000, %11111111, %11111111, %00000000, %00000000, %00001111
.byt %00000000, %00000000, %10000000, %11111000, %11111110, %00001111, %11110011, %01111101
.byt %00000000, %00000000, %00000000, %10000000, %11111000, %11111110, %00001111, %10000011
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %10000000, %10000000
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %00001101, %00001110, %00000110, %00000110, %00000111, %00000011, %00000001, %00000000
.byt %00000110, %00000111, %00000011, %00000011, %00000011, %00000001, %00000000, %00000000
.byt %11110111, %11111011, %11111101, %11111110, %01111111, %10111111, %11001111, %11110011
.byt %00001111, %00000111, %00000011, %00000001, %10000000, %11000000, %11110000, %01111100
.byt %11111111, %11111111, %11111111, %00111111, %11001111, %11110011, %11111101, %11111110
.byt %11111111, %11111111, %11111111, %11111111, %00111111, %00001111, %00000011, %00000001
.byt %11110111, %11110111, %11110111, %11110111, %11110111, %11110111, %11110111, %11110111
.byt %11111000, %11111000, %11111000, %11111000, %11111000, %11111000, %11111000, %11111000
.byt %10111111, %10111111, %10111111, %10111111, %10111111, %10111111, %10111111, %10111111
.byt %01111111, %01111111, %01111111, %01111111, %01111111, %01111111, %01111111, %01111111
.byt %11011011, %11011011, %11011011, %11011011, %11011011, %11011011, %11011011, %11011011
.byt %11100111, %11100111, %11100111, %11100111, %11100111, %11100111, %11100111, %11100111
.byt %11011110, %11011110, %11011110, %11011110, %11011110, %11011110, %11011110, %11011110
.byt %11100001, %11100001, %11100001, %11100001, %11100001, %11100001, %11100001, %11100001
.byt %11110111, %11111011, %11111011, %11111011, %11111011, %11111011, %11111011, %00000111
.byt %11111000, %11111100, %11111100, %11111100, %11111100, %11111100, %11111100, %11111000
.byt %11011011, %11101011, %11101011, %11101011, %11101011, %11101011, %11011011, %10111011
.byt %00111100, %00011100, %00011100, %00011100, %00011100, %00011100, %00111100, %01111100
.byt %11011111, %11011111, %11011111, %11011111, %11011111, %11011111, %11011110, %11000001
.byt %00111111, %00111111, %00111111, %00111111, %00111111, %00111111, %00111111, %00111110
.byt %10110110, %11010110, %11101110, %11111110, %11111110, %11111110, %11111110, %01111110
.byt %11001111, %11101111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %11110111, %11110111, %11110111, %11110111, %11110111, %11110111, %11110111, %11110000
.byt %00001111, %00001111, %00001111, %00001111, %00001111, %00001111, %00001111, %00001111
.byt %10111101, %11011110, %11011111, %11011111, %11011111, %11011110, %11011110, %00111101
.byt %11000011, %11100001, %11100000, %11100000, %11100000, %11100001, %11100001, %11000011
.byt %11000000, %11100000, %01100000, %01100000, %01100000, %11100000, %11000000, %11000000
.byt %10000000, %11000000, %11000000, %11000000, %11000000, %11000000, %10000000, %10000000
.byt %00000000, %00000000, %00000011, %00000111, %00001110, %00001101, %00001101, %00001101
.byt %00000000, %00000000, %00000000, %00000011, %00000111, %00000110, %00000110, %00000110
.byt %01111100, %00111111, %11111111, %11111111, %00111111, %11011111, %11011111, %11011111
.byt %00011111, %00011111, %00011111, %11111111, %11111111, %00111111, %00111111, %00111111
.byt %11111111, %00111111, %11001111, %11101111, %11110111, %11110111, %11110111, %11110111
.byt %00000000, %11000000, %11110000, %11110000, %11111000, %11111000, %11111000, %11111000
.byt %01110111, %10110111, %10110111, %11010111, %11010111, %11010111, %11011011, %11011011
.byt %11111000, %01111000, %01111000, %00111000, %00111000, %00111000, %00111100, %00111100
.byt %10111111, %10111111, %10111111, %10111111, %10111111, %10111111, %10011111, %11011111
.byt %01111111, %01111111, %01111111, %01111111, %01111111, %01111111, %01111111, %00111111
.byt %11011011, %11011011, %11011011, %11011011, %11011011, %11011011, %11011011, %10011011
.byt %11100111, %11100111, %11100111, %11100111, %11100111, %11100111, %11100111, %11100111
.byt %11011111, %11011111, %11011110, %11011110, %11011110, %11011110, %11011110, %11011110
.byt %11100000, %11100000, %11100001, %11100001, %11100001, %11100001, %11100001, %11100001
.byt %11111111, %11111110, %00000001, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %00000000, %00000001, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %01111011, %11111011, %11111011, %11111011, %11111011, %11111011, %11111011, %11111011
.byt %11111100, %11111100, %11111100, %11111100, %11111100, %11111100, %11111100, %11111100
.byt %11111111, %11111111, %11000001, %11011101, %11011110, %11011111, %11011111, %11011111
.byt %00000000, %00000000, %00111110, %00111110, %00111111, %00111111, %00111111, %00111111
.byt %01111110, %01111110, %01111110, %01111110, %11111110, %11111110, %11111110, %11111110
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %11111111, %11111111, %11110001, %11110101, %11110101, %11110110, %11110111, %11110111
.byt %00000000, %00000000, %00001110, %00001110, %00001110, %00001111, %00001111, %00001111
.byt %11111011, %11100111, %11101110, %11101110, %11101110, %11110111, %01111011, %01111011
.byt %00000111, %00011110, %00011100, %00011100, %00011100, %00001110, %10000110, %10000111
.byt %10000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %10000000
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %00001101, %00001101, %00001110, %00000111, %00000011, %00000001, %00000000, %00000000
.byt %00000110, %00000110, %00000111, %00000011, %00000001, %00000000, %00000000, %00000000
.byt %11011111, %11101111, %11110000, %01111111, %10011111, %11100000, %11111111, %00111111
.byt %00111111, %00011111, %00001111, %10000000, %11100000, %11111111, %00111111, %00000000
.byt %11101111, %11011111, %00111111, %11111110, %11111001, %00000111, %11111111, %11111100
.byt %11110000, %11100000, %11000000, %00000001, %00000111, %11111111, %11111100, %00000000
.byt %10111011, %10111011, %01111101, %11111110, %11000111, %10000011, %00000001, %00000000
.byt %01111100, %01111100, %11111110, %11000111, %10000011, %00000001, %00000000, %00000000
.byt %11011111, %11001111, %11100000, %11111111, %01111111, %10000000, %11111111, %11111111
.byt %00111111, %00111111, %00011111, %00000000, %10000000, %11111111, %11111111, %00000000
.byt %10110111, %00110111, %01101111, %11101111, %10011111, %01111111, %11110001, %11000000
.byt %11001111, %11001111, %10011111, %00011111, %01111111, %11110001, %11000000, %00000000
.byt %11011110, %11011110, %10011110, %01111111, %01111111, %10000000, %11111111, %11111111
.byt %11100001, %11100001, %11100001, %10000000, %10000000, %11111111, %11111111, %00000000
.byt %11111111, %11111111, %01111111, %10111111, %10111111, %01111111, %11100000, %11000000
.byt %11111111, %11111111, %11111111, %01111111, %01111111, %11100000, %11000000, %00000000
.byt %11111011, %11111011, %11110011, %11101111, %11101111, %11110000, %00111111, %00011111
.byt %11111100, %11111100, %11111100, %11110000, %11110000, %00111111, %00011111, %00000000
.byt %11011111, %11011111, %11000000, %11111111, %11111111, %00000000, %11111111, %11111111
.byt %00111111, %00111111, %00111111, %00000000, %00000000, %11111111, %11111111, %00000000
.byt %11100110, %11011010, %00011000, %11111011, %11110011, %00001100, %11111111, %11111111
.byt %11111111, %11100111, %11100111, %00000100, %00001100, %11111111, %11111111, %00000000
.byt %11110111, %11110111, %11110011, %11111101, %11111101, %00000011, %11111111, %11111110
.byt %00001111, %00001111, %00001111, %00000011, %00000011, %11111111, %11111110, %00000000
.byt %10111101, %10111110, %11011110, %11101111, %11101111, %11110000, %11111111, %00011111
.byt %11000011, %11000001, %11100001, %11110000, %11110000, %11111111, %00011111, %00000000
.byt %11100000, %11110000, %00111000, %11011000, %11011000, %00111000, %11110000, %11100000
.byt %10000000, %11100000, %11110000, %00110000, %00110000, %11110000, %11100000, %00000000
.byt %00000000, %00000000, %00000000, %00000011, %00000111, %00001110, %00001101, %00001101
.byt %00000000, %00000000, %00000000, %00000000, %00000011, %00000111, %00000110, %00000110
.byt %00000000, %00000000, %00000000, %11111111, %11111111, %00000000, %11111111, %11111111
.byt %00000000, %00000000, %00000000, %00000000, %11111111, %11111111, %00000000, %00000000
.byt %00000000, %00000000, %00000000, %11110000, %11111000, %00011100, %11101110, %11110110
.byt %00000000, %00000000, %00000000, %00000000, %11110000, %11111000, %00011100, %00001100
.byt %00000000, %00000000, %00000000, %00001111, %00011111, %00111000, %00110111, %00110111
.byt %00000000, %00000000, %00000000, %00000000, %00001111, %00011111, %00011000, %00011000
.byt %00000000, %00000000, %00000000, %11111110, %11111111, %00000011, %11111100, %11111111
.byt %00000000, %00000000, %00000000, %00000000, %11111110, %11111111, %00000011, %00000000
.byt %00000000, %00000000, %00000000, %00000000, %11111000, %11111110, %00001111, %11110011
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %11111000, %11111110, %00001111
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %10000000
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %00011101, %00011011, %00011011, %00011011, %00011100, %00001111, %00000111, %00000000
.byt %00001110, %00001100, %00001100, %00001100, %00001111, %00000111, %00000000, %00000000
.byt %11111111, %10000001, %01111101, %01111101, %11101101, %11001101, %10001101, %00001101
.byt %00000000, %01111110, %11111110, %11000110, %11000110, %10000110, %00000110, %00000110
.byt %11111111, %11110000, %11110111, %11110111, %11110111, %11110111, %11110111, %11110111
.byt %00000000, %00001111, %00001111, %00001111, %00001111, %00001111, %00001111, %00001111
.byt %11110111, %01110111, %10110000, %10111111, %11001111, %11110001, %11111101, %11111101
.byt %00001100, %10001111, %11001111, %11000000, %11110000, %11111110, %11111110, %11111110
.byt %11111111, %11111111, %00001100, %11110011, %11110011, %11101100, %11101110, %11101110
.byt %00000000, %11111111, %11111111, %00001100, %00001100, %00011111, %00011111, %00011111
.byt %11111100, %11111110, %00000111, %11111011, %11111011, %11110111, %11110111, %11110111
.byt %00000000, %11111100, %11111110, %00000111, %00000111, %00001111, %00001111, %00001111
.byt %00000001, %00000011, %10001111, %11111110, %11111110, %11111101, %11111101, %11111101
.byt %00000000, %00000001, %00000011, %10001111, %11111111, %11111110, %11111110, %11111110
.byt %11111111, %11111111, %00000000, %11111111, %11111111, %11000011, %10111011, %10111011
.byt %00000000, %11111111, %11111111, %00000000, %00000000, %00111100, %01111100, %01111100
.byt %11111111, %11111111, %00000000, %11111111, %11111111, %11000001, %11011101, %11011101
.byt %00000000, %11111111, %11111111, %00000000, %00000000, %00111110, %00111110, %00110110
.byt %11000000, %11100000, %01110000, %10110000, %10110000, %10110000, %10110000, %10110000
.byt %00000000, %11000000, %11100000, %01100000, %01100000, %01100000, %01100000, %01100000
.byt %00110111, %00111001, %00011101, %00001101, %00001101, %00001101, %00001101, %00001101
.byt %00011000, %00011110, %00001110, %00000110, %00000110, %00000110, %00000110, %00000110
.byt %11111101, %00111110, %10111110, %11011111, %11011111, %11011111, %11011111, %11011111
.byt %00000011, %11000001, %11000001, %11100000, %11100000, %11100000, %11100000, %11100000
.byt %11011111, %11111111, %11110000, %01101111, %01101111, %01110011, %01111011, %01111011
.byt %10000000, %10011111, %11111111, %11110000, %11110000, %11111100, %11111100, %11111100
.byt %11111110, %11111111, %00000011, %11111100, %11111111, %11000001, %11011110, %11011111
.byt %00000000, %11111110, %11111111, %00000011, %00000000, %00111110, %00111111, %00111111
.byt %00000000, %11100000, %11111000, %00111100, %11001110, %11110110, %11110111, %01111011
.byt %00000000, %00000000, %11100000, %11111000, %00111100, %00001100, %00001110, %10000111
.byt %00000011, %00001111, %00011110, %00111001, %01110111, %11101111, %11011110, %11011110
.byt %00000000, %00000011, %00001111, %00011110, %00111000, %01110000, %01100001, %11100001
.byt %11111100, %11111111, %00000111, %11111001, %11111110, %00000111, %11111011, %11111011
.byt %00000000, %11111100, %11111111, %00000111, %00000001, %11111000, %11111100, %11111100
.byt %00000000, %00000000, %11000000, %11100000, %01110000, %10110000, %10111000, %11011000
.byt %00000000, %00000000, %00000000, %11000000, %11100000, %01100000, %01110000, %00110000
.byt %00001101, %00001101, %00001101, %00001101, %00001101, %00001101, %00001101, %00001101
.byt %00000110, %00000110, %00000110, %00000110, %00000110, %00000110, %00000110, %00000110
.byt %11110111, %11110111, %11110111, %11110111, %11110111, %11110111, %11110111, %11110111
.byt %00001111, %00001111, %00001111, %00001111, %00001111, %00001111, %00001111, %00001111
.byt %11111101, %11111101, %11111101, %11111101, %11111101, %11111101, %11111101, %11111101
.byt %11111110, %11111110, %11111110, %11111110, %11111110, %11111110, %11111110, %11111110
.byt %11101110, %11101110, %11101110, %11101110, %11101110, %11101110, %11101110, %11101110
.byt %00011111, %00011111, %00011111, %00011111, %00011111, %00011111, %00011111, %00011111
.byt %11111110, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %11011110, %11011111, %11011011, %11011000, %11011000, %11011000, %11011000, %11011000
.byt %00110111, %00110011, %00110000, %00110000, %00110000, %00110000, %00110000, %00110000
.byt %01110000, %11100000, %11000000, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %11100000, %11000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %11110111, %11110111, %11110000, %11111111, %11111111, %11110000, %11110111, %11110111
.byt %00001111, %00001111, %00001111, %00000000, %00000000, %00001111, %00001111, %00001111
.byt %11011111, %10111110, %01111110, %11111001, %11111110, %00111111, %11011111, %11101111
.byt %11100000, %11000001, %10000001, %00000111, %00000001, %11000000, %11100000, %11110000
.byt %01111011, %11111011, %11111011, %11111011, %11111011, %01111011, %10111011, %10111011
.byt %11111100, %11111100, %11111100, %11111100, %11111100, %11111100, %01111100, %01111100
.byt %11011111, %11011111, %11011111, %11011111, %11011111, %11000000, %11111111, %11111111
.byt %00111111, %00111111, %00111111, %00111111, %00111111, %00111111, %00000000, %00000000
.byt %01111101, %01111101, %01111101, %01111011, %01111011, %11110111, %11101111, %10011111
.byt %10000011, %10000011, %10000011, %10000111, %10000111, %00001111, %00011111, %01111111
.byt %10111101, %10111101, %10111101, %10111101, %01111011, %01111011, %01111011, %01111011
.byt %11000011, %11000011, %11000011, %11000011, %10000111, %10000111, %10000111, %10000111
.byt %11011100, %11101100, %11101100, %11101100, %11101100, %11101100, %11101100, %11101100
.byt %00111000, %00011000, %00011000, %00011000, %00011000, %00011000, %00011000, %00011000
.byt %00001101, %00001101, %00001101, %00001101, %00001101, %00001101, %00001101, %00011101
.byt %00000110, %00000110, %00000110, %00000110, %00000110, %00000110, %00000110, %00001110
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111001, %11110110
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111001
.byt %11111011, %11111011, %11111011, %11111011, %11111011, %11111011, %11111011, %11111011
.byt %11111100, %11111100, %11111100, %11111100, %11111100, %11111100, %11111100, %11111100
.byt %11011000, %11011000, %11011000, %11011000, %11011000, %11011000, %11011000, %11011100
.byt %00110000, %00110000, %00110000, %00110000, %00110000, %00110000, %00110000, %00111000
.byt %11110111, %11110111, %11110111, %11110111, %11110111, %11110111, %11101111, %11011111
.byt %11111000, %11111000, %11111000, %11111000, %11111000, %11111000, %11110000, %11100000
.byt %11011011, %11011011, %11011011, %11011011, %11011011, %11011011, %10111011, %10111011
.byt %00111100, %00111100, %00111100, %00111100, %00111100, %00111100, %01111100, %01111100
.byt %11000111, %11010111, %11010111, %11011011, %11011101, %11011101, %11011110, %11011110
.byt %00111000, %00111000, %00111000, %00111100, %00111110, %00111110, %00111111, %00111111
.byt %10111111, %10111111, %10111111, %11011111, %11101111, %11101111, %11110111, %11111011
.byt %01111111, %01111111, %01111111, %00111111, %00011111, %00011111, %00001111, %00000111
.byt %01111011, %01111011, %10111101, %10111101, %10111101, %10111101, %11011101, %11011110
.byt %10000111, %10000111, %11000011, %11000011, %11000011, %11000011, %11100011, %11100001
.byt %11111101, %11111101, %11111101, %11111101, %11111101, %11111101, %11111011, %11111011
.byt %11111110, %11111110, %11111110, %11111110, %11111110, %11111110, %11111100, %11111100
.byt %11101100, %11101100, %11101100, %11101100, %11101111, %11101111, %11011100, %11011011
.byt %00011000, %00011000, %00011000, %00011000, %00011000, %00011111, %00111111, %00111100
.byt %00000000, %00000000, %00000000, %00000000, %10000000, %11000000, %11100000, %01110000
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %10000000, %11000000, %11100000
.byt %00111001, %00110111, %00110111, %00111000, %00011111, %00001111, %00000000, %00000000
.byt %00011110, %00011000, %00011000, %00011111, %00001111, %00000000, %00000000, %00000000
.byt %11110011, %11111101, %11111101, %00000011, %11111111, %11111110, %00000000, %00000000
.byt %00001111, %00000011, %00000011, %11111111, %11111110, %00000000, %00000000, %00000000
.byt %11110001, %11101111, %11101111, %11110000, %00111111, %00011111, %00000000, %00000000
.byt %11111110, %11110000, %11110000, %00111111, %00011111, %00000000, %00000000, %00000000
.byt %11101100, %11110011, %11110011, %00001100, %11111111, %11111111, %00000000, %00000000
.byt %00011111, %00001100, %00001100, %11111111, %11111111, %00000000, %00000000, %00000000
.byt %11110000, %11111111, %11111111, %00000000, %11111111, %11111111, %00000000, %00000000
.byt %00001111, %00000000, %00000000, %11111111, %11111111, %00000000, %00000000, %00000000
.byt %00000110, %11111110, %11111110, %00000001, %11111111, %11111111, %00000000, %00000000
.byt %11111001, %00000001, %00000001, %11111111, %11111111, %00000000, %00000000, %00000000
.byt %11110011, %11101111, %11101111, %11110000, %10111111, %00011111, %00000000, %00000000
.byt %11111100, %11110000, %11110000, %10111111, %00011111, %00000000, %00000000, %00000000
.byt %11001110, %11110110, %11110110, %00001110, %11111100, %11111000, %00000000, %00000000
.byt %00111100, %00001100, %00001100, %11111100, %11111000, %00000000, %00000000, %00000000
.byt %00111111, %11111110, %11111001, %00000111, %11111111, %11111100, %00000000, %00000000
.byt %11000000, %00000001, %00000111, %11111111, %11111100, %00000000, %00000000, %00000000
.byt %01110011, %11101111, %11101111, %11110000, %00111111, %00011111, %00000000, %00000000
.byt %11111100, %11110000, %10110000, %00111111, %00011111, %00000000, %00000000, %00000000
.byt %11001111, %11110111, %11110111, %00001111, %11111100, %11111000, %00000000, %00000000
.byt %00111111, %00001101, %00001100, %11111100, %11111000, %00000000, %00000000, %00000000
.byt %01111000, %10111111, %10111111, %11000000, %11111111, %01111111, %00000000, %00000000
.byt %10000111, %11000000, %11000000, %11111111, %01111111, %00000000, %00000000, %00000000
.byt %11101111, %01110111, %01111011, %11111100, %11001111, %10000111, %00000000, %00000000
.byt %11110000, %11111000, %11011100, %11001111, %10000111, %00000000, %00000000, %00000000
.byt %01110111, %10001111, %11111110, %00000001, %11111111, %11111111, %00000000, %00000000
.byt %11111000, %01110000, %00000001, %11111111, %11111111, %00000000, %00000000, %00000000
.byt %10110111, %01110111, %11111011, %11011100, %10001111, %00000111, %00000000, %00000000
.byt %01111000, %11111000, %11011100, %10001111, %00000111, %00000000, %00000000, %00000000
.byt %10110000, %10110000, %01110000, %11100000, %11000000, %10000000, %00000000, %00000000
.byt %01100000, %01100000, %11100000, %11000000, %10000000, %00000000, %00000000, %00000000

; Menu box, top inner border
;
; 22222222
; 22222222
; 22222222
; 22222222
; 22222222
; 22222222
; 22222222
; 33333333
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %11111111
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111

; Menu box, left inner border
;
; 22222223
; 22222223
; 22222223
; 22222223
; 22222223
; 22222223
; 22222223
; 22222223
.byt %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111

; Menu box, bottom inner border
;
; 32222222
; 32222222
; 32222222
; 32222222
; 32222222
; 32222222
; 32222222
; 32222222
.byt %10000000, %10000000, %10000000, %10000000, %10000000, %10000000, %10000000, %10000000
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111

; Stage selection menu icon
;
; Full picture layout
; e9 ea
; eb ec
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %11111111, %11111111, %11111111, %11111111, %11110000, %11111000, %11111100, %11111111
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %11111111, %11111111, %11111111, %11111111, %00001111, %00011111, %00111111, %11111111
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %11111111, %11111111, %11111111, %10000011, %11000111, %11111111, %11111111, %11111111
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %11111111, %11111111, %11111111, %11000001, %11100011, %11111111, %11111111, %11111111

; Configuration menu icon
;
; Full picture layout
; ed ee
; ef f0
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %11111111, %11111001, %10010011, %11000111, %11101111, %11111111, %11111001, %10010011
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %11111111, %11111111, %11111111, %00000001, %11111111, %11111111, %11111111, %11111111
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %11000111, %11101111, %11111111, %11111001, %10010011, %11000111, %11101111, %11111111
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %00000001, %11111111, %11111111, %11111111, %11111111, %00000001, %11111111, %11111111

; Character selection menu icon
;
; Full picture layout
; f1 f2
; f2 f4
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %11111111, %10001011, %01110111, %11111011, %10101011, %11111011, %11011011, %00000111
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %11111111, %11110001, %11001110, %10110101, %10110101, %11001110, %11011011, %11100000
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %10101101, %01110111, %01110100, %01110111, %00100100, %01010111, %10101111, %11111111
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %01110101, %11101110, %10101110, %11101110, %01100100, %11101010, %11110101, %11111111

; Left arrow
;
; 22222222
; 22221222
; 22211222
; 21111222
; 11111222
; 21111222
; 22211222
; 22221222
.byt %00000000, %00001000, %00011000, %01111000, %11111000, %01111000, %00011000, %00001000
.byt %11111111, %11110111, %11100111, %10000111, %00000111, %10000111, %11100111, %11110111

; Right arrow
;
; 22222222
; 22212222
; 22211222
; 22211112
; 22211111
; 22211112
; 22211222
; 22212222
.byt %00000000, %00010000, %00011000, %00011110, %00011111, %00011110, %00011000, %00010000
.byt %11111111, %11101111, %11100111, %11100001, %11100000, %11100001, %11100111, %11101111

; Menu box, top-left corner
;
; 00000003
; 00000333
; 00033332
; 00333222
; 00332222
; 03322222
; 03322222
; 33222222
.byt %00000001, %00000111, %00011110, %00111000, %00110000, %01100000, %01100000, %11000000
.byt %00000001, %00000111, %00011111, %00111111, %00111111, %01111111, %01111111, %11111111

; Menu box, top-right corner
;
; 33333333
; 33333333
; 22222233
; 22222233
; 22222233
; 22222233
; 22222233
; 22222233
.byt %11111111, %11111111, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111

; Menu box, bottom-left corner
;
; 33222222
; 33222222
; 33222222
; 33222222
; 33333333
; 33333333
; 33333333
; 33333333
.byt %11000000, %11000000, %11000000, %11000000, %11111111, %11111111, %11111111, %11111111
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111

; Menu box, bottom-right corner
;
; 22222233
; 22222233
; 22222233
; 22222233
; 33333333
; 33333333
; 33333333
; 33333333
.byt %00000011, %00000011, %00000011, %00000011, %11111111, %11111111, %11111111, %11111111
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111

; Menu box, top border
;
; 33333333
; 33333333
; 22222222
; 22222222
; 22222222
; 22222222
; 22222222
; 22222222
.byt %11111111, %11111111, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111

; Menu box, left border
;
; 33222222
; 33222222
; 33222222
; 33222222
; 33222222
; 33222222
; 33222222
; 33222222
.byt %11000000, %11000000, %11000000, %11000000, %11000000, %11000000, %11000000, %11000000
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111

; Menu box, right border
;
; 22222233
; 22222233
; 22222233
; 22222233
; 22222233
; 22222233
; 22222233
; 22222233
.byt %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111

; Menu box, bottom border
;
; 22222222
; 22222222
; 22222222
; 22222222
; 33333333
; 33333333
; 33333333
; 33333333
.byt %00000000, %00000000, %00000000, %00000000, %11111111, %11111111, %11111111, %11111111
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111

; Menu box, bottome inner border
;
; 33333333
; 22222222
; 22222222
; 22222222
; 22222222
; 22222222
; 22222222
; 22222222
.byt %11111111, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111

tileset_menus_end:
