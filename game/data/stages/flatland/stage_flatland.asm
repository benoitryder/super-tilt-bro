STAGE_FLATLAND_BANK_NUMBER = CURRENT_BANK_NUMBER

stage_flatland_data:
STAGE_HEADER($4000, $a000, $80ff, $80ff, $7000, $6000) ; player_a_x, player_b_x, player_a_y, player_b_y, respawn_x, respawn_y
stage_flatland_elements:
PLATFORM($28, $d0, $80, $ff) ; left, right, top, bot
END_OF_STAGE

#include "game/data/stages/flatland/screen.asm"
#include "game/data/stages/flatland/illustration.asm"
#include "game/data/stages/flatland/logic.built.asm"
