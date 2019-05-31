squareman_chr_tiles:

; 1 tile - square body
;
; 01111110
; 12222221
; 12322321
; 12322321
; 12222221
; 12222221
; 12222221
; 01111110
TILE_SQUAREMAN_BODY = (*-squareman_chr_tiles)/16
.byt %01111110, %10000001, %10100101, %10100101, %10000001, %10000001, %10000001, %01111110
.byt %00000000, %01111110, %01111110, %01111110, %01111110, %01111110, %01111110, %00000000

; 1 tile - square hat
;
; 00011000
; 00122100
; 00123100
; 01233310
; 01323210
; 13332221
; 12322221
; 01111110
TILE_SQUAREMAN_HAT = (*-squareman_chr_tiles)/16
.byt %00011000, %00100100, %00101100, %01011110, %01101010, %11110001, %10100001, %01111110
.byt %00000000, %00011000, %00011000, %00111100, %00111100, %01111110, %01111110, %00000000

SQUAREMAN_SPRITE_TILES_NUMBER = (*-squareman_chr_tiles)/16
#print SQUAREMAN_SPRITE_TILES_NUMBER
#if SQUAREMAN_SPRITE_TILES_NUMBER > 96
#echo *** Error: too many sprites for squareman
#endif
