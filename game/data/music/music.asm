#if 0

; Old game engine's musics
;TODO remove/convert them

#define TIMED_O1_A(duration) .byt $00, (duration << 3) + (NOTE_O1_A >> 8), (NOTE_O1_A & $ff)
#define TIMED_O1_B(duration) .byt $00, (duration << 3) + (NOTE_O1_B >> 8), (NOTE_O1_B & $ff)
#define TIMED_O1_C(duration) .byt $00, (duration << 3) + (NOTE_O1_C >> 8), (NOTE_O1_C & $ff)
#define TIMED_O1_D(duration) .byt $00, (duration << 3) + (NOTE_O1_D >> 8), (NOTE_O1_D & $ff)
#define TIMED_O1_E(duration) .byt $00, (duration << 3) + (NOTE_O1_E >> 8), (NOTE_O1_E & $ff)
#define TIMED_O1_F(duration) .byt $00, (duration << 3) + (NOTE_O1_F >> 8), (NOTE_O1_F & $ff)
#define TIMED_O1_G(duration) .byt $00, (duration << 3) + (NOTE_O1_G >> 8), (NOTE_O1_G & $ff)
#define TIMED_O2_A(duration) .byt $00, (duration << 3) + (NOTE_O2_A >> 8), (NOTE_O2_A & $ff)
#define TIMED_O2_B(duration) .byt $00, (duration << 3) + (NOTE_O2_B >> 8), (NOTE_O2_B & $ff)
#define TIMED_O2_C(duration) .byt $00, (duration << 3) + (NOTE_O2_C >> 8), (NOTE_O2_C & $ff)
#define TIMED_O2_D(duration) .byt $00, (duration << 3) + (NOTE_O2_D >> 8), (NOTE_O2_D & $ff)
#define TIMED_O2_E(duration) .byt $00, (duration << 3) + (NOTE_O2_E >> 8), (NOTE_O2_E & $ff)
#define TIMED_O2_F(duration) .byt $00, (duration << 3) + (NOTE_O2_F >> 8), (NOTE_O2_F & $ff)
#define TIMED_O2_G(duration) .byt $00, (duration << 3) + (NOTE_O2_G >> 8), (NOTE_O2_G & $ff)
#define TIMED_O3_A(duration) .byt $00, (duration << 3) + (NOTE_O3_A >> 8), (NOTE_O3_A & $ff)
#define TIMED_O3_B(duration) .byt $00, (duration << 3) + (NOTE_O3_B >> 8), (NOTE_O3_B & $ff)
#define TIMED_O3_C(duration) .byt $00, (duration << 3) + (NOTE_O3_C >> 8), (NOTE_O3_C & $ff)
#define TIMED_O3_D(duration) .byt $00, (duration << 3) + (NOTE_O3_D >> 8), (NOTE_O3_D & $ff)
#define TIMED_O3_E(duration) .byt $00, (duration << 3) + (NOTE_O3_E >> 8), (NOTE_O3_E & $ff)
#define TIMED_O3_F(duration) .byt $00, (duration << 3) + (NOTE_O3_F >> 8), (NOTE_O3_F & $ff)
#define TIMED_O3_G(duration) .byt $00, (duration << 3) + (NOTE_O3_G >> 8), (NOTE_O3_G & $ff)
#define TIMED_O4_A(duration) .byt $00, (duration << 3) + (NOTE_O4_A >> 8), (NOTE_O4_A & $ff)
#define TIMED_O4_B(duration) .byt $00, (duration << 3) + (NOTE_O4_B >> 8), (NOTE_O4_B & $ff)
#define TIMED_O4_C(duration) .byt $00, (duration << 3) + (NOTE_O4_C >> 8), (NOTE_O4_C & $ff)
#define TIMED_O4_D(duration) .byt $00, (duration << 3) + (NOTE_O4_D >> 8), (NOTE_O4_D & $ff)
#define TIMED_O4_E(duration) .byt $00, (duration << 3) + (NOTE_O4_E >> 8), (NOTE_O4_E & $ff)
#define TIMED_O4_F(duration) .byt $00, (duration << 3) + (NOTE_O4_F >> 8), (NOTE_O4_F & $ff)
#define TIMED_O4_G(duration) .byt $00, (duration << 3) + (NOTE_O4_G >> 8), (NOTE_O4_G & $ff)
#define TIMED_O5_A(duration) .byt $00, (duration << 3) + (NOTE_O5_A >> 8), (NOTE_O5_A & $ff)
#define TIMED_O5_B(duration) .byt $00, (duration << 3) + (NOTE_O5_B >> 8), (NOTE_O5_B & $ff)
#define TIMED_O5_C(duration) .byt $00, (duration << 3) + (NOTE_O5_C >> 8), (NOTE_O5_C & $ff)
#define TIMED_O5_D(duration) .byt $00, (duration << 3) + (NOTE_O5_D >> 8), (NOTE_O5_D & $ff)
#define TIMED_O5_E(duration) .byt $00, (duration << 3) + (NOTE_O5_E >> 8), (NOTE_O5_E & $ff)
#define TIMED_O5_F(duration) .byt $00, (duration << 3) + (NOTE_O5_F >> 8), (NOTE_O5_F & $ff)
#define TIMED_O5_G(duration) .byt $00, (duration << 3) + (NOTE_O5_G >> 8), (NOTE_O5_G & $ff)
#define TIMED_O6_A(duration) .byt $00, (duration << 3) + (NOTE_O6_A >> 8), (NOTE_O6_A & $ff)
#define TIMED_O6_B(duration) .byt $00, (duration << 3) + (NOTE_O6_B >> 8), (NOTE_O6_B & $ff)
#define TIMED_O6_C(duration) .byt $00, (duration << 3) + (NOTE_O6_C >> 8), (NOTE_O6_C & $ff)
#define TIMED_O6_D(duration) .byt $00, (duration << 3) + (NOTE_O6_D >> 8), (NOTE_O6_D & $ff)
#define TIMED_O6_E(duration) .byt $00, (duration << 3) + (NOTE_O6_E >> 8), (NOTE_O6_E & $ff)
#define TIMED_O6_F(duration) .byt $00, (duration << 3) + (NOTE_O6_F >> 8), (NOTE_O6_F & $ff)
#define TIMED_O6_G(duration) .byt $00, (duration << 3) + (NOTE_O6_G >> 8), (NOTE_O6_G & $ff)
#define TIMED_O7_A(duration) .byt $00, (duration << 3) + (NOTE_O7_A >> 8), (NOTE_O7_A & $ff)
#define TIMED_O7_B(duration) .byt $00, (duration << 3) + (NOTE_O7_B >> 8), (NOTE_O7_B & $ff)
#define TIMED_O7_C(duration) .byt $00, (duration << 3) + (NOTE_O7_C >> 8), (NOTE_O7_C & $ff)
#define TIMED_O7_D(duration) .byt $00, (duration << 3) + (NOTE_O7_D >> 8), (NOTE_O7_D & $ff)
#define TIMED_O7_E(duration) .byt $00, (duration << 3) + (NOTE_O7_E >> 8), (NOTE_O7_E & $ff)
#define TIMED_O7_F(duration) .byt $00, (duration << 3) + (NOTE_O7_F >> 8), (NOTE_O7_F & $ff)
#define TIMED_O7_G(duration) .byt $00, (duration << 3) + (NOTE_O7_G >> 8), (NOTE_O7_G & $ff)
#define TIMED_O8_A(duration) .byt $00, (duration << 3) + (NOTE_O8_A >> 8), (NOTE_O8_A & $ff)
#define TIMED_O8_B(duration) .byt $00, (duration << 3) + (NOTE_O8_B >> 8), (NOTE_O8_B & $ff)
#define TIMED_O8_C(duration) .byt $00, (duration << 3) + (NOTE_O8_C >> 8), (NOTE_O8_C & $ff)
#define TIMED_O8_D(duration) .byt $00, (duration << 3) + (NOTE_O8_D >> 8), (NOTE_O8_D & $ff)
#define TIMED_O8_E(duration) .byt $00, (duration << 3) + (NOTE_O8_E >> 8), (NOTE_O8_E & $ff)
#define TIMED_O8_F(duration) .byt $00, (duration << 3) + (NOTE_O8_F >> 8), (NOTE_O8_F & $ff)

#define AUDIO_SILENCE(duration) .byt $01, duration, $00
#define AUDIO_LOOP .byt $02, $00, $00 ; obsolete
#define SAMPLE_END .byt $02, $00, $00

#define MUSIC_END .byt $00, $00

#include "game/data/music/theme_menus/theme_menus.asm"
#include "game/data/music/theme_main/theme_main.asm"
#include "game/data/music/theme_gameover/theme_gameover.asm"

#else

audio_notes_table_low:
.byt <NOTE_O0_C, <NOTE_O0_Cs, <NOTE_O0_D, <NOTE_O0_Ds, <NOTE_O0_E, <NOTE_O0_F, <NOTE_O0_Fs, <NOTE_O0_G, <NOTE_O0_Gs, <NOTE_O0_A, <NOTE_O0_As, <NOTE_O0_B
.byt <NOTE_O1_C, <NOTE_O1_Cs, <NOTE_O1_D, <NOTE_O1_Ds, <NOTE_O1_E, <NOTE_O1_F, <NOTE_O1_Fs, <NOTE_O1_G, <NOTE_O1_Gs, <NOTE_O1_A, <NOTE_O1_As, <NOTE_O1_B
.byt <NOTE_O2_C, <NOTE_O2_Cs, <NOTE_O2_D, <NOTE_O2_Ds, <NOTE_O2_E, <NOTE_O2_F, <NOTE_O2_Fs, <NOTE_O2_G, <NOTE_O2_Gs, <NOTE_O2_A, <NOTE_O2_As, <NOTE_O2_B
.byt <NOTE_O3_C, <NOTE_O3_Cs, <NOTE_O3_D, <NOTE_O3_Ds, <NOTE_O3_E, <NOTE_O3_F, <NOTE_O3_Fs, <NOTE_O3_G, <NOTE_O3_Gs, <NOTE_O3_A, <NOTE_O3_As, <NOTE_O3_B
.byt <NOTE_O4_C, <NOTE_O4_Cs, <NOTE_O4_D, <NOTE_O4_Ds, <NOTE_O4_E, <NOTE_O4_F, <NOTE_O4_Fs, <NOTE_O4_G, <NOTE_O4_Gs, <NOTE_O4_A, <NOTE_O4_As, <NOTE_O4_B
.byt <NOTE_O5_C, <NOTE_O5_Cs, <NOTE_O5_D, <NOTE_O5_Ds, <NOTE_O5_E, <NOTE_O5_F, <NOTE_O5_Fs, <NOTE_O5_G, <NOTE_O5_Gs, <NOTE_O5_A, <NOTE_O5_As, <NOTE_O5_B
.byt <NOTE_O6_C, <NOTE_O6_Cs, <NOTE_O6_D, <NOTE_O6_Ds, <NOTE_O6_E, <NOTE_O6_F, <NOTE_O6_Fs, <NOTE_O6_G, <NOTE_O6_Gs, <NOTE_O6_A, <NOTE_O6_As, <NOTE_O6_B
.byt <NOTE_O7_C, <NOTE_O7_Cs, <NOTE_O7_D, <NOTE_O7_Ds, <NOTE_O7_E, <NOTE_O7_F, <NOTE_O7_Fs, <NOTE_O7_G, <NOTE_O7_Gs, <NOTE_O7_A, <NOTE_O7_As, <NOTE_O7_B

audio_notes_table_high:
.byt >NOTE_O0_C, >NOTE_O0_Cs, >NOTE_O0_D, >NOTE_O0_Ds, >NOTE_O0_E, >NOTE_O0_F, >NOTE_O0_Fs, >NOTE_O0_G, >NOTE_O0_Gs, >NOTE_O0_A, >NOTE_O0_As, >NOTE_O0_B 
.byt >NOTE_O1_C, >NOTE_O1_Cs, >NOTE_O1_D, >NOTE_O1_Ds, >NOTE_O1_E, >NOTE_O1_F, >NOTE_O1_Fs, >NOTE_O1_G, >NOTE_O1_Gs, >NOTE_O1_A, >NOTE_O1_As, >NOTE_O1_B 
.byt >NOTE_O2_C, >NOTE_O2_Cs, >NOTE_O2_D, >NOTE_O2_Ds, >NOTE_O2_E, >NOTE_O2_F, >NOTE_O2_Fs, >NOTE_O2_G, >NOTE_O2_Gs, >NOTE_O2_A, >NOTE_O2_As, >NOTE_O2_B 
.byt >NOTE_O3_C, >NOTE_O3_Cs, >NOTE_O3_D, >NOTE_O3_Ds, >NOTE_O3_E, >NOTE_O3_F, >NOTE_O3_Fs, >NOTE_O3_G, >NOTE_O3_Gs, >NOTE_O3_A, >NOTE_O3_As, >NOTE_O3_B 
.byt >NOTE_O4_C, >NOTE_O4_Cs, >NOTE_O4_D, >NOTE_O4_Ds, >NOTE_O4_E, >NOTE_O4_F, >NOTE_O4_Fs, >NOTE_O4_G, >NOTE_O4_Gs, >NOTE_O4_A, >NOTE_O4_As, >NOTE_O4_B 
.byt >NOTE_O5_C, >NOTE_O5_Cs, >NOTE_O5_D, >NOTE_O5_Ds, >NOTE_O5_E, >NOTE_O5_F, >NOTE_O5_Fs, >NOTE_O5_G, >NOTE_O5_Gs, >NOTE_O5_A, >NOTE_O5_As, >NOTE_O5_B 
.byt >NOTE_O6_C, >NOTE_O6_Cs, >NOTE_O6_D, >NOTE_O6_Ds, >NOTE_O6_E, >NOTE_O6_F, >NOTE_O6_Fs, >NOTE_O6_G, >NOTE_O6_Gs, >NOTE_O6_A, >NOTE_O6_As, >NOTE_O6_B 
.byt >NOTE_O7_C, >NOTE_O7_Cs, >NOTE_O7_D, >NOTE_O7_Ds, >NOTE_O7_E, >NOTE_O7_F, >NOTE_O7_Fs, >NOTE_O7_G, >NOTE_O7_Gs, >NOTE_O7_A, >NOTE_O7_As, >NOTE_O7_B 

#include "game/data/music/theme_title/theme_title.asm"

#endif
