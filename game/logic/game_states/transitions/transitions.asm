state_transition_id:
	.byt STATE_TRANSITION(GAME_STATE_TITLE, GAME_STATE_MODE_SELECTION)
	.byt STATE_TRANSITION(GAME_STATE_MODE_SELECTION, GAME_STATE_TITLE)
	.byt STATE_TRANSITION(GAME_STATE_MODE_SELECTION, GAME_STATE_CONFIG)
	.byt STATE_TRANSITION(GAME_STATE_CONFIG, GAME_STATE_MODE_SELECTION)
	.byt STATE_TRANSITION(GAME_STATE_TITLE, GAME_STATE_CREDITS)
	.byt STATE_TRANSITION(GAME_STATE_CREDITS, GAME_STATE_TITLE)
	.byt STATE_TRANSITION(GAME_STATE_CONFIG, GAME_STATE_CHARACTER_SELECTION)
	.byt STATE_TRANSITION(GAME_STATE_CHARACTER_SELECTION, GAME_STATE_CONFIG)
	.byt STATE_TRANSITION(GAME_STATE_CHARACTER_SELECTION, GAME_STATE_STAGE_SELECTION)
	.byt STATE_TRANSITION(GAME_STATE_STAGE_SELECTION, GAME_STATE_CHARACTER_SELECTION)
	.byt $00

state_transition_pretransition_lsb:
	.byt <state_transition_pre_scroll_down
	.byt <state_transition_pre_scroll_up
	.byt <state_transition_pre_scroll_down
	.byt <state_transition_pre_scroll_up
	.byt <state_transition_pre_scroll_down
	.byt <state_transition_pre_scroll_up
	.byt <state_transition_pre_scroll_down
	.byt <state_transition_pre_scroll_up
	.byt <state_transition_pre_scroll_down
	.byt <state_transition_pre_scroll_up

state_transition_pretransition_msb:
	.byt >state_transition_pre_scroll_down
	.byt >state_transition_pre_scroll_up
	.byt >state_transition_pre_scroll_down
	.byt >state_transition_pre_scroll_up
	.byt >state_transition_pre_scroll_down
	.byt >state_transition_pre_scroll_up
	.byt >state_transition_pre_scroll_down
	.byt >state_transition_pre_scroll_up
	.byt >state_transition_pre_scroll_down
	.byt >state_transition_pre_scroll_up

state_transition_posttransition_lsb:
	.byt <state_transition_post_scroll_down
	.byt <state_transition_post_scroll_up
	.byt <state_transition_post_scroll_down
	.byt <state_transition_post_scroll_up
	.byt <state_transition_post_scroll_down
	.byt <state_transition_post_scroll_up
	.byt <state_transition_post_scroll_down
	.byt <state_transition_post_scroll_up
	.byt <state_transition_post_scroll_down
	.byt <state_transition_post_scroll_up

state_transition_posttransition_msb:
	.byt >state_transition_post_scroll_down
	.byt >state_transition_post_scroll_up
	.byt >state_transition_post_scroll_down
	.byt >state_transition_post_scroll_up
	.byt >state_transition_post_scroll_down
	.byt >state_transition_post_scroll_up
	.byt >state_transition_post_scroll_down
	.byt >state_transition_post_scroll_up
	.byt >state_transition_post_scroll_down
	.byt >state_transition_post_scroll_up

#include "game/logic/game_states/transitions/scroll_transition.asm"
