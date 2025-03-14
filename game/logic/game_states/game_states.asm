; Subroutine called when the state change to this state
game_states_init:
VECTOR(init_game_state)
VECTOR(init_title_screen)
VECTOR(init_gameover_screen)
VECTOR(init_credits_screen)
VECTOR(init_config_screen)
VECTOR(init_stage_selection_screen)
VECTOR(init_character_selection_screen)
VECTOR(init_mode_selection_screen)
VECTOR(init_netplay_launch_screen)
VECTOR(init_donation_screen)
VECTOR(init_donation_btc_screen)
VECTOR(init_donation_paypal_screen)
VECTOR(init_online_mode_screen)

; Subroutine called each frame
game_states_tick:
VECTOR(game_tick)
VECTOR(title_screen_tick)
VECTOR(gameover_screen_tick)
VECTOR(credits_screen_tick)
VECTOR(config_screen_tick)
VECTOR(stage_selection_screen_tick)
VECTOR(character_selection_screen_tick)
VECTOR(mode_selection_screen_tick)
VECTOR(netplay_launch_screen_tick)
VECTOR(donation_screen_tick)
VECTOR(donation_qr_screen_tick)
VECTOR(donation_qr_screen_tick)
VECTOR(online_mode_screen_tick)

;NOTE if you change these tables, do not forget to update GAME_STATE_* constants

#include "game/logic/game_states/character_selection_screen.asm"
#include "game/logic/game_states/config_screen.asm"
#include "game/logic/game_states/credits_screen.asm"
#include "game/logic/game_states/donation_screen.asm"
#include "game/logic/game_states/donation_qr.asm"
#include "game/logic/game_states/game/game.asm"
#include "game/logic/game_states/gameover_screen.asm"
#include "game/logic/game_states/mode_selection_screen.asm"
#include "game/logic/game_states/netplay_launch_screen.asm"
#include "game/logic/game_states/online_mode_screen.asm"
#include "game/logic/game_states/stage_selection_screen.asm"
#include "game/logic/game_states/title_screen.asm"
#include "game/logic/game_states/transitions/transitions.asm"
