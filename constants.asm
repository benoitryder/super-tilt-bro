#define DEFAULT_GRAVITY $03

#define PLAYER_STATE_STANDING #$00
#define PLAYER_STATE_RUNNING #$01
#define PLAYER_STATE_FALLING #$02
#define PLAYER_STATE_JUMPING #$03
#define PLAYER_STATE_JABBING #$04
#define PLAYER_STATE_THROWN #$05
#define PLAYER_STATE_RESPAWN #$06
#define PLAYER_STATE_SIDE_TILT #$07
#define PLAYER_STATE_SPECIAL #$08
#define PLAYER_STATE_SIDE_SPECIAL #$09
#define PLAYER_STATE_HELPLESS #$0a
#define PLAYER_STATE_LANDING #$0b
#define PLAYER_STATE_CRASHING #$0c
#define PLAYER_STATE_DOWN_TILT #$0d
#define PLAYER_STATE_AERIAL_SIDE #$0e
#define PLAYER_STATE_AERIAL_DOWN #$0f
#define PLAYER_STATE_AERIAL_UP #$10
#define PLAYER_STATE_AERIAL_NEUTRAL #$11
#define PLAYER_STATE_AERIAL_SPE_NEUTRAL #$12
#define PLAYER_STATE_SPE_UP #$13
#define PLAYER_STATE_SPE_DOWN #$14
#define PLAYER_STATE_UP_TILT #$15
#define PLAYER_STATE_SHIELDING #$16
#define PLAYER_STATE_INNEXISTANT #$17

#define DIRECTION_LEFT #$00
#define DIRECTION_RIGHT #$01

#define HITBOX_DISABLED #$00
#define HITBOX_ENABLED #$01

#define HITSTUN_PARRY_NB_FRAMES 10
#define SCREENSHAKE_PARRY_NB_FRAMES 2
#define SCREENSHAKE_PARRY_INTENSITY 1

#define MAX_STOCKS 4

#define TILENUM_NT_CHAR_0 #$14

#define CONTROLLER_BTN_A      %10000000
#define CONTROLLER_BTN_B      %01000000
#define CONTROLLER_BTN_SELECT %00100000
#define CONTROLLER_BTN_START  %00010000
#define CONTROLLER_BTN_UP     %00001000
#define CONTROLLER_BTN_DOWN   %00000100
#define CONTROLLER_BTN_LEFT   %00000010
#define CONTROLLER_BTN_RIGHT  %00000001

#define CONTROLLER_INPUT_JUMP          CONTROLLER_BTN_UP
#define CONTROLLER_INPUT_JAB           CONTROLLER_BTN_A
#define CONTROLLER_INPUT_LEFT          CONTROLLER_BTN_LEFT
#define CONTROLLER_INPUT_RIGHT         CONTROLLER_BTN_RIGHT
#define CONTROLLER_INPUT_JUMP_RIGHT    CONTROLLER_BTN_UP | CONTROLLER_BTN_RIGHT
#define CONTROLLER_INPUT_JUMP_LEFT     CONTROLLER_BTN_UP | CONTROLLER_BTN_LEFT
#define CONTROLLER_INPUT_ATTACK_LEFT   CONTROLLER_BTN_LEFT | CONTROLLER_BTN_A
#define CONTROLLER_INPUT_ATTACK_RIGHT  CONTROLLER_BTN_RIGHT | CONTROLLER_BTN_A
#define CONTROLLER_INPUT_ATTACK_UP     CONTROLLER_BTN_UP | CONTROLLER_BTN_A
#define CONTROLLER_INPUT_SPECIAL       CONTROLLER_BTN_B
#define CONTROLLER_INPUT_SPECIAL_RIGHT CONTROLLER_BTN_B | CONTROLLER_BTN_RIGHT
#define CONTROLLER_INPUT_SPECIAL_LEFT  CONTROLLER_BTN_B | CONTROLLER_BTN_LEFT
#define CONTROLLER_INPUT_SPECIAL_DOWN  CONTROLLER_BTN_B | CONTROLLER_BTN_DOWN
#define CONTROLLER_INPUT_SPECIAL_UP    CONTROLLER_BTN_B | CONTROLLER_BTN_UP
#define CONTROLLER_INPUT_TECH          CONTROLLER_BTN_DOWN
#define CONTROLLER_INPUT_TECH_RIGHT    CONTROLLER_BTN_DOWN | CONTROLLER_BTN_RIGHT
#define CONTROLLER_INPUT_TECH_LEFT     CONTROLLER_BTN_DOWN | CONTROLLER_BTN_LEFT
#define CONTROLLER_INPUT_DOWN_TILT     CONTROLLER_BTN_DOWN | CONTROLLER_BTN_A

#define GAME_STATE_INGAME $00
#define GAME_STATE_TITLE $01
#define GAME_STATE_GAMEOVER $02
#define GAME_STATE_CREDITS $03
#define GAME_STATE_CONFIG $04
#define GAME_STATE_STAGE_SELECTION $05
#define GAME_STATE_CHARACTER_SELECTION $06

#define ZERO_PAGE_GLOBAL_FIELDS_BEGIN $d0

#define STAGE_ELEMENT_PLATFORM $01
#define STAGE_HEADER_OFFSET_PAX_LOW 0
#define STAGE_HEADER_OFFSET_PBX_LOW 1
#define STAGE_HEADER_OFFSET_PAX_HIGH 2
#define STAGE_HEADER_OFFSET_PBX_HIGH 3
#define STAGE_HEADER_OFFSET_PAY_LOW 4
#define STAGE_HEADER_OFFSET_PBY_LOW 5
#define STAGE_HEADER_OFFSET_PAY_HIGH 6
#define STAGE_HEADER_OFFSET_PBY_HIGH 7
#define STAGE_HEADER_OFFSET_RESPAWNX_LOW 8
#define STAGE_HEADER_OFFSET_RESPAWNX_HIGH 9
#define STAGE_HEADER_OFFSET_RESPAWNY_LOW 10
#define STAGE_HEADER_OFFSET_RESPAWNY_HIGH 11
#define STAGE_OFFSET_PLATFORMS 12
#define STAGE_PLATFORM_OFFSET_LEFT 1
#define STAGE_PLATFORM_OFFSET_RIGHT 2
#define STAGE_PLATFORM_OFFSET_TOP 3
#define STAGE_PLATFORM_OFFSET_BOTTOM 4
#define STAGE_PLATFORM_LENGTH 5
#define STAGE_SMOOTH_PLATFORM_LENGTH 4

#define NB_CHARACTER_PALETTES 7
#define NB_WEAPON_PALETTES 7

#define AUDIO_CHANNEL_SQUARE $00
#define AUDIO_CHANNEL_TRIANGLE $01

#define PARTICLE_BLOCK_OFFSET_PARAM 0
#define PARTICLE_BLOCK_OFFSET_TILENUM 1
#define PARTICLE_BLOCK_OFFSET_TILEATTR 2
#define PARTICLE_BLOCK_OFFSET_POSITIONS 4
#define PARTICLE_POSITION_OFFSET_X_LSB 0
#define PARTICLE_POSITION_OFFSET_X_MSB 1
#define PARTICLE_POSITION_OFFSET_Y_LSB 2
#define PARTICLE_POSITION_OFFSET_Y_MSB 3
#define PARTICLE_BLOCK_SIZE 32
#define PARTICLE_BLOCK_NB_PARTICLES 7
#define PARTICLE_NB_BLOCKS 4
#define PARTICLE_FIRST_SPRITE 36

#define SLOWDOWN_TIME 50

#define NOTE_O1_A $760
#define NOTE_O1_B $692
#define NOTE_O1_C $634
#define NOTE_O1_D $586
#define NOTE_O1_E $4ec
#define NOTE_O1_F $4a5
#define NOTE_O1_G $423
#define NOTE_O2_A $3b0
#define NOTE_O2_B $349
#define NOTE_O2_C $319
#define NOTE_O2_D $2c3
#define NOTE_O2_E $275
#define NOTE_O2_F $252
#define NOTE_O2_G $211
#define NOTE_O3_A $1D7
#define NOTE_O3_B $1A4
#define NOTE_O3_C $18C
#define NOTE_O3_D $161
#define NOTE_O3_E $13A
#define NOTE_O3_F $129
#define NOTE_O3_G $108
#define NOTE_O4_A $0EB
#define NOTE_O4_B $0D1
#define NOTE_O4_C $0C6
#define NOTE_O4_D $0B0
#define NOTE_O4_E $09D
#define NOTE_O4_F $094
#define NOTE_O4_G $084
#define NOTE_O5_A $075
#define NOTE_O5_B $068
#define NOTE_O5_C $062
#define NOTE_O5_D $057
#define NOTE_O5_E $04E
#define NOTE_O5_F $049
#define NOTE_O5_G $041
#define NOTE_O6_A $03A
#define NOTE_O6_B $034
#define NOTE_O6_C $031
#define NOTE_O6_D $02B
#define NOTE_O6_E $026
#define NOTE_O6_F $024
#define NOTE_O6_G $020
#define NOTE_O7_A $01D
#define NOTE_O7_B $019
#define NOTE_O7_C $018
#define NOTE_O7_D $015
#define NOTE_O7_E $013
#define NOTE_O7_F $012
#define NOTE_O7_G $010
#define NOTE_O8_A $00E
#define NOTE_O8_B $00C
#define NOTE_O8_C $00B
#define NOTE_O8_D $00A
#define NOTE_O8_E $009
#define NOTE_O8_F $008

#define TILE_IDLE_SINBAD_HEAD $00
#define TILE_IDLE_SINBAD_BODY $01
#define TILE_SCIMITAR_BLADE $02
#define TILE_SCIMITAR_HANDLE $03
#define TILE_RUNNING_SINBAD_1_1 $04
#define TILE_RUNNING_SINBAD_1_2 $05
#define TILE_RUNNING_SINBAD_1_3 $06
#define TILE_RUNNING_SINBAD_1_4 $07
#define TILE_RUNNING_SINBAD_2_1 $08
#define TILE_RUNNING_SINBAD_2_2 $09
#define TILE_RUNNING_SINBAD_2_3 $0a
#define TILE_RUNNING_SINBAD_3_1 $0b
#define TILE_RUNNING_SINBAD_3_2 $0c
#define TILE_SOLID_1 $0d
#define TILE_SOLID_2 $0e
#define TILE_VERTICAL_SCIMITAR_BLADE $0f
#define TILE_VERTICAL_SCIMITAR_HANDLE $10
#define TILE_ANGLED_SCIMITAR_BLADE $11
#define TILE_ANGLED_SCIMITAR_HANDLE $12
#define TILE_SIDE_TILT_SINBAD_1_1 $13
#define TILE_SIDE_TILT_SINBAD_1_2 $14
#define TILE_SIDE_TILT_SINBAD_1_3 $15
#define TILE_SIDE_TILT_SINBAD_1_4 $16
#define TILE_SIDE_TILT_SINBAD_2_1 $17
#define TILE_SIDE_TILT_SINBAD_2_2 $18
#define TILE_SIDE_TILT_SINBAD_3_1 $19
#define TILE_SIDE_TILT_SINBAD_3_2 $1a
#define TILE_SIDE_TILT_SINBAD_3_3 $1b
#define TILE_ROLLED_SINBAD_1 $1c
#define TILE_ROLLED_SINBAD_2 $1d
#define TILE_ROLLED_SINBAD_3 $1e
#define TILE_ROLLED_SINBAD_4 $1f
#define TILE_ROLLED_SINBAD_HEAD_DOWN_1 $20
#define TILE_ROLLED_SINBAD_HEAD_DOWN_2 $21
#define TILE_ROLLED_SINBAD_HEAD_DOWN_3 $22
#define TILE_ROLLED_SINBAD_HEAD_DOWN_4 $23
#define TILE_ANGLED_DOWN_SCIMITAR_BLADE $24
#define TILE_ANGLED_DOWN_SCIMITAR_HANDLE $25
#define TILE_POWER_FLAMES_TINY_1 $26
#define TILE_POWER_FLAMES_TINY_2 $27
#define TILE_POWER_FLAMES_LITTLE_1 $28
#define TILE_POWER_FLAMES_LITTLE_2 $29
#define TILE_POWER_FLAMES_MEDIUM_1 $2a
#define TILE_POWER_FLAMES_MEDIUM_2 $2b
#define TILE_POWER_FLAMES_LARGE_1 $2c
#define TILE_POWER_FLAMES_LARGE_2 $2d
#define TILE_LANDING_SINBAD_1_TOP $2e
#define TILE_LANDING_SINBAD_1_BOT $2f
#define TILE_LANDING_SINBAD_2_TOP $30
#define TILE_LANDING_SINBAD_2_BOT $31
#define TILE_THROWN_SINBAD_1_NW $32
#define TILE_THROWN_SINBAD_1_NE $33
#define TILE_THROWN_SINBAD_1_SW $34
#define TILE_THROWN_SINBAD_1_SE $35
#define TILE_CRASHED_SINBAD_HEAD $36
#define TILE_CRASHED_SINBAD_BODY $37
#define TILE_THROWN_SINBAD_2_NW $38
#define TILE_THROWN_SINBAD_2_NE $39
#define TILE_THROWN_SINBAD_2_SW $3a
#define TILE_THROWN_SINBAD_2_SE $3b
#define TILE_JUMPING_SINBAD_2 $3c
#define TILE_JUMPING_SINBAD_3_HEAD $3d
#define TILE_JUMPING_SINBAD_3_BODY $3e
#define TILE_LEFT_ARROW $3f
#define TILE_CHRASHING_SINBAD_1_SIDE $40
#define TILE_CHRASHING_SINBAD_1_HEAD $41
#define TILE_CHRASHING_SINBAD_1_BODY $42
#define TILE_CHRASHING_SINBAD_2_SIDE $43
#define TILE_CHRASHING_SINBAD_2_MIDDLE $44
#define TILE_OPEN_ARMS_SINBAD_HEAD $45
#define TILE_OPEN_ARMS_SINBAD_BODY $46
#define TILE_JOINED_HANDS_SINBAD_HEAD $47
#define TILE_JOINED_HANDS_SINBAD_BODY $48
#define TILE_PARTY_HAT $49
#define TILE_BALLOON $4a
#define TILE_BALLOON_TAIL $4b
#define TILE_BALLOON_INFLATED $4c
#define TILE_BALLOON_POPPED $4d
#define TILE_ROCKET_SINBAD_HEAD $4e
#define TILE_ROCKET_SINBAD_BODY $4f
#define TILE_DIVING_SINBAD_NW $50
#define TILE_DIVING_SINBAD_SW $51
#define TILE_DIVING_SINBAD_SE $52
#define TILE_LIGHT_STAR $53
#define TILE_LIGHT_STAR_BRANCH $54
#define TILE_AERIAL_UP_SINBAD_NW $55
#define TILE_AERIAL_UP_SINBAD_NE $56
#define TILE_AERIAL_UP_SINBAD_SW $57
#define TILE_AERIAL_UP_SINBAD_SE $58
#define TILE_SHIELD_FULL_1 $59
#define TILE_SHIELD_FULL_2 $5a
#define TILE_SHIELD_PARTIAL_1 $5b
#define TILE_SHIELD_PARTIAL_2 $5c
#define TILE_SHIELD_LIMIT_1 $5d
#define TILE_SHIELD_LIMIT_2 $5e
#define TILE_REVIVAL_PLATFORM_1 $5f
#define TILE_REVIVAL_PLATFORM_2 $60
#define TILE_MINI_STAGE_PIT_0 $61
#define TILE_MINI_STAGE_PIT_1 $62
#define TILE_MINI_STAGE_PIT_2 $63
#define TILE_MINI_STAGE_PIT_3 $64
#define TILE_MINI_STAGE_PIT_4 $65
#define TILE_MINI_STAGE_PIT_5 $66
#define TILE_MINI_STAGE_FLATLAND_0 $67
#define TILE_MINI_STAGE_FLATLAND_1 $68
#define TILE_MINI_STAGE_FLATLAND_2 $69
#define TILE_MINI_STAGE_FLATLAND_3 $6a
#define TILE_MINI_STAGE_FLATLAND_4 $6b
#define TILE_MINI_STAGE_FLATLAND_5 $6c
#define TILE_MINI_STAGE_FLATLAND_6 $6d
#define TILE_MINI_STAGE_LOCKED_0 $6e
#define TILE_MINI_STAGE_LOCKED_1 $6f
#define TILE_MINI_STAGE_LOCKED_2 $70
#define TILE_MINI_STAGE_LOCKED_3 $71
#define TILE_MINI_STAGE_LOCKED_4 $72
#define TILE_MINI_STAGE_LOCKED_5 $73
#define TILE_MINI_STAGE_LOCKED_6 $74
#define TILE_MINI_STAGE_LOCKED_7 $75
#define TILE_MINI_STAGE_SKYRIDE_0 $76
#define TILE_MINI_STAGE_SKYRIDE_1 $77
#define TILE_MINI_STAGE_SKYRIDE_2 $78
#define TILE_MINI_STAGE_SKYRIDE_3 $79
#define TILE_MINI_STAGE_SKYRIDE_4 $7a
#define TILE_MINI_STAGE_SKYRIDE_5 $7b
#define TILE_MINI_STAGE_SKYRIDE_6 $7c
#define TILE_BLOOD_PARTICLE $7d
#define TILE_EXPLOSION_1 $7e
#define TILE_EXPLOSION_2 $7f
#define TILE_EXPLOSION_3 $80
#define TILE_EXPLOSION_4 $81
#define TILE_EXPLOSION_5 $82
