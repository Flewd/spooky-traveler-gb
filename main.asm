;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.7 #12016 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _tryRespawnHeart
	.globl _InitTitleScreen
	.globl _main
	.globl _abs
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _joypad
	.globl _timerToRespawnHeart
	.globl _gameOverScreenInit
	.globl _gameIsOver
	.globl _atTitleScreen
	.globl _enemy
	.globl _player
	.globl _scrollPos
	.globl _shouldScrollCounter
	.globl _framesBetweenScrolling
	.globl _healthFrameCounter
	.globl _framesBetweenHealthDecrement
	.globl _health
	.globl _j
	.globl _i
	.globl _tempY
	.globl _tempX
	.globl _tempChar
	.globl _tempTilePos
	.globl _titleScreen
	.globl _gameOverMap
	.globl _gameOverTiles
	.globl _tiles
	.globl _dungeon
	.globl _sprites
	.globl _InitGameOver
	.globl _init
	.globl _gameInit
	.globl _movePlayerSprite
	.globl _moveEnemySprite
	.globl _updateSwitches
	.globl _decrementHealthOverTime
	.globl _checkInput
	.globl _scrollScreen
	.globl _checkForHeartCollision
	.globl _setNewHeartYPos
	.globl _collisionCheck
	.globl _rand_range
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_sprites::
	.ds 128
_dungeon::
	.ds 576
_tiles::
	.ds 224
_gameOverTiles::
	.ds 368
_gameOverMap::
	.ds 360
_titleScreen::
	.ds 360
_tempTilePos::
	.ds 2
_tempChar::
	.ds 1
_tempX::
	.ds 1
_tempY::
	.ds 1
_i::
	.ds 4
_j::
	.ds 4
_health::
	.ds 1
_framesBetweenHealthDecrement::
	.ds 1
_healthFrameCounter::
	.ds 1
_framesBetweenScrolling::
	.ds 1
_shouldScrollCounter::
	.ds 1
_scrollPos::
	.ds 1
_player::
	.ds 2
_enemy::
	.ds 2
_atTitleScreen::
	.ds 1
_gameIsOver::
	.ds 1
_gameOverScreenInit::
	.ds 1
_timerToRespawnHeart::
	.ds 1
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;sprites.c:26: unsigned char sprites[] =
	ld	hl, #_sprites
	ld	(hl), #0x0f
	ld	hl, #(_sprites + 0x0001)
	ld	(hl), #0x0f
	ld	hl, #(_sprites + 0x0002)
	ld	(hl), #0x3f
	ld	hl, #(_sprites + 0x0003)
	ld	(hl), #0x30
	ld	hl, #(_sprites + 0x0004)
	ld	(hl), #0x7f
	ld	hl, #(_sprites + 0x0005)
	ld	(hl), #0x40
	ld	hl, #(_sprites + 0x0006)
	ld	(hl), #0xf1
	ld	hl, #(_sprites + 0x0007)
	ld	(hl), #0x8e
	ld	hl, #(_sprites + 0x0008)
	ld	(hl), #0xf7
	ld	hl, #(_sprites + 0x0009)
	ld	(hl), #0x8e
	ld	hl, #(_sprites + 0x000a)
	ld	(hl), #0xf7
	ld	hl, #(_sprites + 0x000b)
	ld	(hl), #0x8e
	ld	hl, #(_sprites + 0x000c)
	ld	(hl), #0xf1
	ld	hl, #(_sprites + 0x000d)
	ld	(hl), #0x8e
	ld	hl, #(_sprites + 0x000e)
	ld	(hl), #0xff
	ld	hl, #(_sprites + 0x000f)
	ld	(hl), #0x80
	ld	hl, #(_sprites + 0x0010)
	ld	(hl), #0xff
	ld	hl, #(_sprites + 0x0011)
	ld	(hl), #0x80
	ld	hl, #(_sprites + 0x0012)
	ld	(hl), #0xbf
	ld	hl, #(_sprites + 0x0013)
	ld	(hl), #0xc0
	ld	hl, #(_sprites + 0x0014)
	ld	(hl), #0x97
	ld	hl, #(_sprites + 0x0015)
	ld	(hl), #0xe8
	ld	hl, #(_sprites + 0x0016)
	ld	(hl), #0x97
	ld	hl, #(_sprites + 0x0017)
	ld	(hl), #0xf8
	ld	hl, #(_sprites + 0x0018)
	ld	(hl), #0x98
	ld	hl, #(_sprites + 0x0019)
	ld	(hl), #0xff
	ld	hl, #(_sprites + 0x001a)
	ld	(hl), #0xad
	ld	hl, #(_sprites + 0x001b)
	ld	(hl), #0xef
	ld	hl, #(_sprites + 0x001c)
	ld	(hl), #0x45
	ld	hl, #(_sprites + 0x001d)
	ld	(hl), #0x47
	ld	hl, #(_sprites + 0x001e)
	ld	(hl), #0x03
	ld	hl, #(_sprites + 0x001f)
	ld	(hl), #0x03
	ld	hl, #(_sprites + 0x0020)
	ld	(hl), #0xf0
	ld	hl, #(_sprites + 0x0021)
	ld	(hl), #0xf0
	ld	hl, #(_sprites + 0x0022)
	ld	(hl), #0xfc
	ld	hl, #(_sprites + 0x0023)
	ld	(hl), #0x0c
	ld	hl, #(_sprites + 0x0024)
	ld	(hl), #0xfe
	ld	hl, #(_sprites + 0x0025)
	ld	(hl), #0x02
	ld	hl, #(_sprites + 0x0026)
	ld	(hl), #0xc7
	ld	hl, #(_sprites + 0x0027)
	ld	(hl), #0x39
	ld	hl, #(_sprites + 0x0028)
	ld	(hl), #0xdf
	ld	hl, #(_sprites + 0x0029)
	ld	(hl), #0x39
	ld	hl, #(_sprites + 0x002a)
	ld	(hl), #0xdf
	ld	hl, #(_sprites + 0x002b)
	ld	(hl), #0x39
	ld	hl, #(_sprites + 0x002c)
	ld	(hl), #0xc7
	ld	hl, #(_sprites + 0x002d)
	ld	(hl), #0x39
	ld	hl, #(_sprites + 0x002e)
	ld	(hl), #0xff
	ld	hl, #(_sprites + 0x002f)
	ld	(hl), #0x01
	ld	hl, #(_sprites + 0x0030)
	ld	(hl), #0xff
	ld	hl, #(_sprites + 0x0031)
	ld	(hl), #0x01
	ld	hl, #(_sprites + 0x0032)
	ld	(hl), #0xff
	ld	hl, #(_sprites + 0x0033)
	ld	(hl), #0x01
	ld	hl, #(_sprites + 0x0034)
	ld	(hl), #0xf3
	ld	hl, #(_sprites + 0x0035)
	ld	(hl), #0x0d
	ld	hl, #(_sprites + 0x0036)
	ld	(hl), #0x79
	ld	hl, #(_sprites + 0x0037)
	ld	(hl), #0x8f
	ld	hl, #(_sprites + 0x0038)
	ld	(hl), #0x2b
	ld	hl, #(_sprites + 0x0039)
	ld	(hl), #0xdf
	ld	hl, #(_sprites + 0x003a)
	ld	(hl), #0x1a
	ld	hl, #(_sprites + 0x003b)
	ld	(hl), #0xfe
	ld	hl, #(_sprites + 0x003c)
	ld	(hl), #0xb6
	ld	hl, #(_sprites + 0x003d)
	ld	(hl), #0xf6
	ld	hl, #(_sprites + 0x003e)
	ld	(hl), #0x64
	ld	hl, #(_sprites + 0x003f)
	ld	(hl), #0x64
	ld	hl, #(_sprites + 0x0040)
	ld	(hl), #0x1c
	ld	hl, #(_sprites + 0x0041)
	ld	(hl), #0x1c
	ld	hl, #(_sprites + 0x0042)
	ld	(hl), #0x3a
	ld	hl, #(_sprites + 0x0043)
	ld	(hl), #0x26
	ld	hl, #(_sprites + 0x0044)
	ld	(hl), #0x7d
	ld	hl, #(_sprites + 0x0045)
	ld	(hl), #0x43
	ld	hl, #(_sprites + 0x0046)
	ld	(hl), #0xff
	ld	hl, #(_sprites + 0x0047)
	ld	(hl), #0x80
	ld	hl, #(_sprites + 0x0048)
	ld	(hl), #0xff
	ld	hl, #(_sprites + 0x0049)
	ld	(hl), #0x80
	ld	hl, #(_sprites + 0x004a)
	ld	(hl), #0xff
	ld	hl, #(_sprites + 0x004b)
	ld	(hl), #0x80
	ld	hl, #(_sprites + 0x004c)
	ld	(hl), #0xff
	ld	hl, #(_sprites + 0x004d)
	ld	(hl), #0x80
	ld	hl, #(_sprites + 0x004e)
	ld	(hl), #0xff
	ld	hl, #(_sprites + 0x004f)
	ld	(hl), #0x80
	ld	hl, #(_sprites + 0x0050)
	ld	(hl), #0xff
	ld	hl, #(_sprites + 0x0051)
	ld	(hl), #0x80
	ld	hl, #(_sprites + 0x0052)
	ld	(hl), #0x7f
	ld	hl, #(_sprites + 0x0053)
	ld	(hl), #0x40
	ld	hl, #(_sprites + 0x0054)
	ld	(hl), #0x3f
	ld	hl, #(_sprites + 0x0055)
	ld	(hl), #0x20
	ld	hl, #(_sprites + 0x0056)
	ld	(hl), #0x1f
	ld	hl, #(_sprites + 0x0057)
	ld	(hl), #0x10
	ld	hl, #(_sprites + 0x0058)
	ld	(hl), #0x0f
	ld	hl, #(_sprites + 0x0059)
	ld	(hl), #0x08
	ld	hl, #(_sprites + 0x005a)
	ld	(hl), #0x07
	ld	hl, #(_sprites + 0x005b)
	ld	(hl), #0x04
	ld	hl, #(_sprites + 0x005c)
	ld	(hl), #0x02
	ld	hl, #(_sprites + 0x005d)
	ld	(hl), #0x03
	ld	hl, #(_sprites + 0x005e)
	ld	(hl), #0x01
	ld	hl, #(_sprites + 0x005f)
	ld	(hl), #0x01
	ld	hl, #(_sprites + 0x0060)
	ld	(hl), #0x38
	ld	hl, #(_sprites + 0x0061)
	ld	(hl), #0x38
	ld	hl, #(_sprites + 0x0062)
	ld	(hl), #0x44
	ld	hl, #(_sprites + 0x0063)
	ld	(hl), #0x7c
	ld	hl, #(_sprites + 0x0064)
	ld	(hl), #0x82
	ld	hl, #(_sprites + 0x0065)
	ld	(hl), #0xfe
	ld	hl, #(_sprites + 0x0066)
	ld	(hl), #0xe1
	ld	hl, #(_sprites + 0x0067)
	ld	(hl), #0x1f
	ld	hl, #(_sprites + 0x0068)
	ld	(hl), #0xf1
	ld	hl, #(_sprites + 0x0069)
	ld	(hl), #0x0f
	ld	hl, #(_sprites + 0x006a)
	ld	(hl), #0xf9
	ld	hl, #(_sprites + 0x006b)
	ld	(hl), #0x07
	ld	hl, #(_sprites + 0x006c)
	ld	(hl), #0xf9
	ld	hl, #(_sprites + 0x006d)
	ld	(hl), #0x07
	ld	hl, #(_sprites + 0x006e)
	ld	(hl), #0xf9
	ld	hl, #(_sprites + 0x006f)
	ld	(hl), #0x07
	ld	hl, #(_sprites + 0x0070)
	ld	(hl), #0xf9
	ld	hl, #(_sprites + 0x0071)
	ld	(hl), #0x07
	ld	hl, #(_sprites + 0x0072)
	ld	(hl), #0xf2
	ld	hl, #(_sprites + 0x0073)
	ld	(hl), #0x0e
	ld	hl, #(_sprites + 0x0074)
	ld	(hl), #0xe4
	ld	hl, #(_sprites + 0x0075)
	ld	(hl), #0x1c
	ld	hl, #(_sprites + 0x0076)
	ld	(hl), #0xc8
	ld	hl, #(_sprites + 0x0077)
	ld	(hl), #0x38
	ld	hl, #(_sprites + 0x0078)
	ld	(hl), #0x90
	ld	hl, #(_sprites + 0x0079)
	ld	(hl), #0x70
	ld	hl, #(_sprites + 0x007a)
	ld	(hl), #0x20
	ld	hl, #(_sprites + 0x007b)
	ld	(hl), #0xe0
	ld	hl, #(_sprites + 0x007c)
	ld	(hl), #0x40
	ld	hl, #(_sprites + 0x007d)
	ld	(hl), #0xc0
	ld	hl, #(_sprites + 0x007e)
	ld	(hl), #0x80
	ld	hl, #(_sprites + 0x007f)
	ld	(hl), #0x80
;dungeon.c:25: unsigned char dungeon[] =
	ld	hl, #_dungeon
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0001)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0002)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0003)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0004)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0005)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0006)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0007)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0008)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0009)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x000a)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x000b)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x000c)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x000d)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x000e)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x000f)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0010)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0011)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0012)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0013)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0014)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0015)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0016)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0017)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0018)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0019)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x001a)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x001b)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x001c)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x001d)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x001e)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x001f)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0020)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0021)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0022)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0023)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0024)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0025)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0026)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0027)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0028)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0029)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x002a)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x002b)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x002c)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x002d)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x002e)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x002f)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0030)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0031)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0032)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0033)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0034)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0035)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0036)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0037)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0038)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0039)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x003a)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x003b)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x003c)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x003d)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x003e)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x003f)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0040)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0041)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0042)
	ld	(hl), #0x0b
	ld	hl, #(_dungeon + 0x0043)
	ld	(hl), #0x0a
	ld	hl, #(_dungeon + 0x0044)
	ld	(hl), #0x0a
	ld	hl, #(_dungeon + 0x0045)
	ld	(hl), #0x0a
	ld	hl, #(_dungeon + 0x0046)
	ld	(hl), #0x08
	ld	hl, #(_dungeon + 0x0047)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0048)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0049)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x004a)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x004b)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x004c)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x004d)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x004e)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x004f)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0050)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0051)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0052)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0053)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0054)
	ld	(hl), #0x0b
	ld	hl, #(_dungeon + 0x0055)
	ld	(hl), #0x0a
	ld	hl, #(_dungeon + 0x0056)
	ld	(hl), #0x08
	ld	hl, #(_dungeon + 0x0057)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0058)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0059)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x005a)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x005b)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x005c)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x005d)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x005e)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x005f)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0060)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0061)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0062)
	ld	(hl), #0x0c
	ld	hl, #(_dungeon + 0x0063)
	ld	(hl), #0x06
	ld	hl, #(_dungeon + 0x0064)
	ld	(hl), #0x06
	ld	hl, #(_dungeon + 0x0065)
	ld	(hl), #0x06
	ld	hl, #(_dungeon + 0x0066)
	ld	(hl), #0x07
	ld	hl, #(_dungeon + 0x0067)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0068)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0069)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x006a)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x006b)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x006c)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x006d)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x006e)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x006f)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0070)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0071)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0072)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0073)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0074)
	ld	(hl), #0x0c
	ld	hl, #(_dungeon + 0x0075)
	ld	(hl), #0x06
	ld	hl, #(_dungeon + 0x0076)
	ld	(hl), #0x07
	ld	hl, #(_dungeon + 0x0077)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0078)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0079)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x007a)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x007b)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x007c)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x007d)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x007e)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x007f)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0080)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0081)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0082)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0083)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0084)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0085)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0086)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0087)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0088)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0089)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x008a)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x008b)
	ld	(hl), #0x0b
	ld	hl, #(_dungeon + 0x008c)
	ld	(hl), #0x0a
	ld	hl, #(_dungeon + 0x008d)
	ld	(hl), #0x0a
	ld	hl, #(_dungeon + 0x008e)
	ld	(hl), #0x0a
	ld	hl, #(_dungeon + 0x008f)
	ld	(hl), #0x0a
	ld	hl, #(_dungeon + 0x0090)
	ld	(hl), #0x08
	ld	hl, #(_dungeon + 0x0091)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0092)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0093)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0094)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0095)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0096)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0097)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0098)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0099)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x009a)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x009b)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x009c)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x009d)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x009e)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x009f)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00a0)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00a1)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00a2)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00a3)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00a4)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00a5)
	ld	(hl), #0x0b
	ld	hl, #(_dungeon + 0x00a6)
	ld	(hl), #0x0a
	ld	hl, #(_dungeon + 0x00a7)
	ld	(hl), #0x08
	ld	hl, #(_dungeon + 0x00a8)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00a9)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00aa)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00ab)
	ld	(hl), #0x0c
	ld	hl, #(_dungeon + 0x00ac)
	ld	(hl), #0x06
	ld	hl, #(_dungeon + 0x00ad)
	ld	(hl), #0x06
	ld	hl, #(_dungeon + 0x00ae)
	ld	(hl), #0x06
	ld	hl, #(_dungeon + 0x00af)
	ld	(hl), #0x06
	ld	hl, #(_dungeon + 0x00b0)
	ld	(hl), #0x07
	ld	hl, #(_dungeon + 0x00b1)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00b2)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00b3)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00b4)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00b5)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00b6)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00b7)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00b8)
	ld	(hl), #0x0b
	ld	hl, #(_dungeon + 0x00b9)
	ld	(hl), #0x0a
	ld	hl, #(_dungeon + 0x00ba)
	ld	(hl), #0x0a
	ld	hl, #(_dungeon + 0x00bb)
	ld	(hl), #0x0a
	ld	hl, #(_dungeon + 0x00bc)
	ld	(hl), #0x0a
	ld	hl, #(_dungeon + 0x00bd)
	ld	(hl), #0x08
	ld	hl, #(_dungeon + 0x00be)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00bf)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00c0)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00c1)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00c2)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00c3)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00c4)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00c5)
	ld	(hl), #0x0c
	ld	hl, #(_dungeon + 0x00c6)
	ld	(hl), #0x06
	ld	hl, #(_dungeon + 0x00c7)
	ld	(hl), #0x07
	ld	hl, #(_dungeon + 0x00c8)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00c9)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00ca)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00cb)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00cc)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00cd)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00ce)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00cf)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00d0)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00d1)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00d2)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00d3)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00d4)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00d5)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00d6)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00d7)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00d8)
	ld	(hl), #0x0c
	ld	hl, #(_dungeon + 0x00d9)
	ld	(hl), #0x06
	ld	hl, #(_dungeon + 0x00da)
	ld	(hl), #0x06
	ld	hl, #(_dungeon + 0x00db)
	ld	(hl), #0x06
	ld	hl, #(_dungeon + 0x00dc)
	ld	(hl), #0x06
	ld	hl, #(_dungeon + 0x00dd)
	ld	(hl), #0x07
	ld	hl, #(_dungeon + 0x00de)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00df)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00e0)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00e1)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00e2)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00e3)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00e4)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00e5)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00e6)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00e7)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00e8)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00e9)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00ea)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00eb)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00ec)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00ed)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00ee)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00ef)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00f0)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00f1)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00f2)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00f3)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00f4)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00f5)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00f6)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00f7)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00f8)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00f9)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00fa)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00fb)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00fc)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00fd)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00fe)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x00ff)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0100)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0101)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0102)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0103)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0104)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0105)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0106)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0107)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0108)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0109)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x010a)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x010b)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x010c)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x010d)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x010e)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x010f)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0110)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0111)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0112)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0113)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0114)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0115)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0116)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0117)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0118)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0119)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x011a)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x011b)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x011c)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x011d)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x011e)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x011f)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0120)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0121)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0122)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0123)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0124)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0125)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0126)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0127)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0128)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0129)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x012a)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x012b)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x012c)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x012d)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x012e)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x012f)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0130)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0131)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0132)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0133)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0134)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0135)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0136)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0137)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0138)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0139)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x013a)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x013b)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x013c)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x013d)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x013e)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x013f)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0140)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0141)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0142)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0143)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0144)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0145)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0146)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0147)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0148)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0149)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x014a)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x014b)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x014c)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x014d)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x014e)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x014f)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0150)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0151)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0152)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0153)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0154)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0155)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0156)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0157)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0158)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0159)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x015a)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x015b)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x015c)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x015d)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x015e)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x015f)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0160)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0161)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0162)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0163)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0164)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0165)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0166)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0167)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0168)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0169)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x016a)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x016b)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x016c)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x016d)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x016e)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x016f)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0170)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0171)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0172)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0173)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0174)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0175)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0176)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0177)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0178)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0179)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x017a)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x017b)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x017c)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x017d)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x017e)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x017f)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0180)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0181)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0182)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0183)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0184)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0185)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0186)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0187)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0188)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0189)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x018a)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x018b)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x018c)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x018d)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x018e)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x018f)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0190)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0191)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0192)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0193)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0194)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0195)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0196)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0197)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0198)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0199)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x019a)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x019b)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x019c)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x019d)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x019e)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x019f)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01a0)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01a1)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01a2)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01a3)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01a4)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01a5)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01a6)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01a7)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01a8)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01a9)
	ld	(hl), #0x01
	ld	hl, #(_dungeon + 0x01aa)
	ld	(hl), #0x02
	ld	hl, #(_dungeon + 0x01ab)
	ld	(hl), #0x02
	ld	hl, #(_dungeon + 0x01ac)
	ld	(hl), #0x02
	ld	hl, #(_dungeon + 0x01ad)
	ld	(hl), #0x02
	ld	hl, #(_dungeon + 0x01ae)
	ld	(hl), #0x02
	ld	hl, #(_dungeon + 0x01af)
	ld	(hl), #0x02
	ld	hl, #(_dungeon + 0x01b0)
	ld	(hl), #0x02
	ld	hl, #(_dungeon + 0x01b1)
	ld	(hl), #0x03
	ld	hl, #(_dungeon + 0x01b2)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01b3)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01b4)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01b5)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01b6)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01b7)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01b8)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01b9)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01ba)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01bb)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01bc)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01bd)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01be)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01bf)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01c0)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01c1)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01c2)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01c3)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01c4)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01c5)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01c6)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01c7)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01c8)
	ld	(hl), #0x01
	ld	hl, #(_dungeon + 0x01c9)
	ld	(hl), #0x04
	ld	hl, #(_dungeon + 0x01ca)
	ld	(hl), #0x04
	ld	hl, #(_dungeon + 0x01cb)
	ld	(hl), #0x04
	ld	hl, #(_dungeon + 0x01cc)
	ld	(hl), #0x04
	ld	hl, #(_dungeon + 0x01cd)
	ld	(hl), #0x04
	ld	hl, #(_dungeon + 0x01ce)
	ld	(hl), #0x04
	ld	hl, #(_dungeon + 0x01cf)
	ld	(hl), #0x04
	ld	hl, #(_dungeon + 0x01d0)
	ld	(hl), #0x04
	ld	hl, #(_dungeon + 0x01d1)
	ld	(hl), #0x04
	ld	hl, #(_dungeon + 0x01d2)
	ld	(hl), #0x03
	ld	hl, #(_dungeon + 0x01d3)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01d4)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01d5)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01d6)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01d7)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01d8)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01d9)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01da)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01db)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01dc)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01dd)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01de)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01df)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01e0)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01e1)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01e2)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01e3)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01e4)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01e5)
	ld	(hl), #0x01
	ld	hl, #(_dungeon + 0x01e6)
	ld	(hl), #0x02
	ld	hl, #(_dungeon + 0x01e7)
	ld	(hl), #0x02
	ld	hl, #(_dungeon + 0x01e8)
	ld	(hl), #0x02
	ld	hl, #(_dungeon + 0x01e9)
	ld	(hl), #0x02
	ld	hl, #(_dungeon + 0x01ea)
	ld	(hl), #0x02
	ld	hl, #(_dungeon + 0x01eb)
	ld	(hl), #0x02
	ld	hl, #(_dungeon + 0x01ec)
	ld	(hl), #0x05
	ld	hl, #(_dungeon + 0x01ed)
	ld	(hl), #0x04
	ld	hl, #(_dungeon + 0x01ee)
	ld	(hl), #0x04
	ld	hl, #(_dungeon + 0x01ef)
	ld	(hl), #0x04
	ld	hl, #(_dungeon + 0x01f0)
	ld	(hl), #0x04
	ld	hl, #(_dungeon + 0x01f1)
	ld	(hl), #0x04
	ld	hl, #(_dungeon + 0x01f2)
	ld	(hl), #0x04
	ld	hl, #(_dungeon + 0x01f3)
	ld	(hl), #0x03
	ld	hl, #(_dungeon + 0x01f4)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01f5)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01f6)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01f7)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01f8)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01f9)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01fa)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01fb)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01fc)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01fd)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01fe)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x01ff)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0200)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0201)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0202)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0203)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0204)
	ld	(hl), #0x01
	ld	hl, #(_dungeon + 0x0205)
	ld	(hl), #0x04
	ld	hl, #(_dungeon + 0x0206)
	ld	(hl), #0x04
	ld	hl, #(_dungeon + 0x0207)
	ld	(hl), #0x04
	ld	hl, #(_dungeon + 0x0208)
	ld	(hl), #0x04
	ld	hl, #(_dungeon + 0x0209)
	ld	(hl), #0x04
	ld	hl, #(_dungeon + 0x020a)
	ld	(hl), #0x04
	ld	hl, #(_dungeon + 0x020b)
	ld	(hl), #0x04
	ld	hl, #(_dungeon + 0x020c)
	ld	(hl), #0x04
	ld	hl, #(_dungeon + 0x020d)
	ld	(hl), #0x05
	ld	hl, #(_dungeon + 0x020e)
	ld	(hl), #0x04
	ld	hl, #(_dungeon + 0x020f)
	ld	(hl), #0x04
	ld	hl, #(_dungeon + 0x0210)
	ld	(hl), #0x04
	ld	hl, #(_dungeon + 0x0211)
	ld	(hl), #0x04
	ld	hl, #(_dungeon + 0x0212)
	ld	(hl), #0x04
	ld	hl, #(_dungeon + 0x0213)
	ld	(hl), #0x04
	ld	hl, #(_dungeon + 0x0214)
	ld	(hl), #0x03
	ld	hl, #(_dungeon + 0x0215)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0216)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0217)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0218)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0219)
	ld	(hl), #0x01
	ld	hl, #(_dungeon + 0x021a)
	ld	(hl), #0x02
	ld	hl, #(_dungeon + 0x021b)
	ld	(hl), #0x02
	ld	hl, #(_dungeon + 0x021c)
	ld	(hl), #0x02
	ld	hl, #(_dungeon + 0x021d)
	ld	(hl), #0x02
	ld	hl, #(_dungeon + 0x021e)
	ld	(hl), #0x03
	ld	hl, #(_dungeon + 0x021f)
	ld	(hl), #0x00
	ld	hl, #(_dungeon + 0x0220)
	ld	(hl), #0x09
	ld	hl, #(_dungeon + 0x0221)
	ld	(hl), #0x09
	ld	hl, #(_dungeon + 0x0222)
	ld	(hl), #0x09
	ld	hl, #(_dungeon + 0x0223)
	ld	(hl), #0x09
	ld	hl, #(_dungeon + 0x0224)
	ld	(hl), #0x09
	ld	hl, #(_dungeon + 0x0225)
	ld	(hl), #0x09
	ld	hl, #(_dungeon + 0x0226)
	ld	(hl), #0x09
	ld	hl, #(_dungeon + 0x0227)
	ld	(hl), #0x09
	ld	hl, #(_dungeon + 0x0228)
	ld	(hl), #0x09
	ld	hl, #(_dungeon + 0x0229)
	ld	(hl), #0x09
	ld	hl, #(_dungeon + 0x022a)
	ld	(hl), #0x09
	ld	hl, #(_dungeon + 0x022b)
	ld	(hl), #0x09
	ld	hl, #(_dungeon + 0x022c)
	ld	(hl), #0x09
	ld	hl, #(_dungeon + 0x022d)
	ld	(hl), #0x09
	ld	hl, #(_dungeon + 0x022e)
	ld	(hl), #0x09
	ld	hl, #(_dungeon + 0x022f)
	ld	(hl), #0x09
	ld	hl, #(_dungeon + 0x0230)
	ld	(hl), #0x09
	ld	hl, #(_dungeon + 0x0231)
	ld	(hl), #0x09
	ld	hl, #(_dungeon + 0x0232)
	ld	(hl), #0x09
	ld	hl, #(_dungeon + 0x0233)
	ld	(hl), #0x09
	ld	hl, #(_dungeon + 0x0234)
	ld	(hl), #0x09
	ld	hl, #(_dungeon + 0x0235)
	ld	(hl), #0x09
	ld	hl, #(_dungeon + 0x0236)
	ld	(hl), #0x09
	ld	hl, #(_dungeon + 0x0237)
	ld	(hl), #0x09
	ld	hl, #(_dungeon + 0x0238)
	ld	(hl), #0x09
	ld	hl, #(_dungeon + 0x0239)
	ld	(hl), #0x09
	ld	hl, #(_dungeon + 0x023a)
	ld	(hl), #0x09
	ld	hl, #(_dungeon + 0x023b)
	ld	(hl), #0x09
	ld	hl, #(_dungeon + 0x023c)
	ld	(hl), #0x09
	ld	hl, #(_dungeon + 0x023d)
	ld	(hl), #0x09
	ld	hl, #(_dungeon + 0x023e)
	ld	(hl), #0x09
	ld	hl, #(_dungeon + 0x023f)
	ld	(hl), #0x09
;tiles.c:26: unsigned char tiles[] =
	ld	hl, #_tiles
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0001)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0002)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0003)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0004)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0005)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0006)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0007)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0008)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0009)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x000a)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x000b)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x000c)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x000d)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x000e)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x000f)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0010)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0011)
	ld	(hl), #0x01
	ld	hl, #(_tiles + 0x0012)
	ld	(hl), #0x01
	ld	hl, #(_tiles + 0x0013)
	ld	(hl), #0x02
	ld	hl, #(_tiles + 0x0014)
	ld	(hl), #0x03
	ld	hl, #(_tiles + 0x0015)
	ld	(hl), #0x04
	ld	hl, #(_tiles + 0x0016)
	ld	(hl), #0x05
	ld	hl, #(_tiles + 0x0017)
	ld	(hl), #0x08
	ld	hl, #(_tiles + 0x0018)
	ld	(hl), #0x0d
	ld	hl, #(_tiles + 0x0019)
	ld	(hl), #0x10
	ld	hl, #(_tiles + 0x001a)
	ld	(hl), #0x17
	ld	hl, #(_tiles + 0x001b)
	ld	(hl), #0x20
	ld	hl, #(_tiles + 0x001c)
	ld	(hl), #0x37
	ld	hl, #(_tiles + 0x001d)
	ld	(hl), #0x40
	ld	hl, #(_tiles + 0x001e)
	ld	(hl), #0x7f
	ld	hl, #(_tiles + 0x001f)
	ld	(hl), #0x80
	ld	hl, #(_tiles + 0x0020)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0021)
	ld	(hl), #0xff
	ld	hl, #(_tiles + 0x0022)
	ld	(hl), #0xff
	ld	hl, #(_tiles + 0x0023)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0024)
	ld	(hl), #0xef
	ld	hl, #(_tiles + 0x0025)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0026)
	ld	(hl), #0xaf
	ld	hl, #(_tiles + 0x0027)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0028)
	ld	(hl), #0xbb
	ld	hl, #(_tiles + 0x0029)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x002a)
	ld	(hl), #0xbb
	ld	hl, #(_tiles + 0x002b)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x002c)
	ld	(hl), #0xfb
	ld	hl, #(_tiles + 0x002d)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x002e)
	ld	(hl), #0xff
	ld	hl, #(_tiles + 0x002f)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0030)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0031)
	ld	(hl), #0x80
	ld	hl, #(_tiles + 0x0032)
	ld	(hl), #0x80
	ld	hl, #(_tiles + 0x0033)
	ld	(hl), #0x40
	ld	hl, #(_tiles + 0x0034)
	ld	(hl), #0xc0
	ld	hl, #(_tiles + 0x0035)
	ld	(hl), #0x20
	ld	hl, #(_tiles + 0x0036)
	ld	(hl), #0xa0
	ld	hl, #(_tiles + 0x0037)
	ld	(hl), #0x10
	ld	hl, #(_tiles + 0x0038)
	ld	(hl), #0xb0
	ld	hl, #(_tiles + 0x0039)
	ld	(hl), #0x08
	ld	hl, #(_tiles + 0x003a)
	ld	(hl), #0xe8
	ld	hl, #(_tiles + 0x003b)
	ld	(hl), #0x04
	ld	hl, #(_tiles + 0x003c)
	ld	(hl), #0xec
	ld	hl, #(_tiles + 0x003d)
	ld	(hl), #0x02
	ld	hl, #(_tiles + 0x003e)
	ld	(hl), #0xfe
	ld	hl, #(_tiles + 0x003f)
	ld	(hl), #0x01
	ld	hl, #(_tiles + 0x0040)
	ld	(hl), #0xff
	ld	hl, #(_tiles + 0x0041)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0042)
	ld	(hl), #0xff
	ld	hl, #(_tiles + 0x0043)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0044)
	ld	(hl), #0xef
	ld	hl, #(_tiles + 0x0045)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0046)
	ld	(hl), #0xaf
	ld	hl, #(_tiles + 0x0047)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0048)
	ld	(hl), #0xbb
	ld	hl, #(_tiles + 0x0049)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x004a)
	ld	(hl), #0xbb
	ld	hl, #(_tiles + 0x004b)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x004c)
	ld	(hl), #0xfb
	ld	hl, #(_tiles + 0x004d)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x004e)
	ld	(hl), #0xff
	ld	hl, #(_tiles + 0x004f)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0050)
	ld	(hl), #0x7f
	ld	hl, #(_tiles + 0x0051)
	ld	(hl), #0x80
	ld	hl, #(_tiles + 0x0052)
	ld	(hl), #0xb7
	ld	hl, #(_tiles + 0x0053)
	ld	(hl), #0x40
	ld	hl, #(_tiles + 0x0054)
	ld	(hl), #0xd7
	ld	hl, #(_tiles + 0x0055)
	ld	(hl), #0x20
	ld	hl, #(_tiles + 0x0056)
	ld	(hl), #0xad
	ld	hl, #(_tiles + 0x0057)
	ld	(hl), #0x10
	ld	hl, #(_tiles + 0x0058)
	ld	(hl), #0xb5
	ld	hl, #(_tiles + 0x0059)
	ld	(hl), #0x08
	ld	hl, #(_tiles + 0x005a)
	ld	(hl), #0xeb
	ld	hl, #(_tiles + 0x005b)
	ld	(hl), #0x04
	ld	hl, #(_tiles + 0x005c)
	ld	(hl), #0xed
	ld	hl, #(_tiles + 0x005d)
	ld	(hl), #0x02
	ld	hl, #(_tiles + 0x005e)
	ld	(hl), #0xfe
	ld	hl, #(_tiles + 0x005f)
	ld	(hl), #0x01
	ld	hl, #(_tiles + 0x0060)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0061)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0062)
	ld	(hl), #0xc7
	ld	hl, #(_tiles + 0x0063)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0064)
	ld	(hl), #0xff
	ld	hl, #(_tiles + 0x0065)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0066)
	ld	(hl), #0xff
	ld	hl, #(_tiles + 0x0067)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0068)
	ld	(hl), #0xff
	ld	hl, #(_tiles + 0x0069)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x006a)
	ld	(hl), #0x3e
	ld	hl, #(_tiles + 0x006b)
	ld	(hl), #0xc1
	ld	hl, #(_tiles + 0x006c)
	ld	(hl), #0x18
	ld	hl, #(_tiles + 0x006d)
	ld	(hl), #0x26
	ld	hl, #(_tiles + 0x006e)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x006f)
	ld	(hl), #0x38
	ld	hl, #(_tiles + 0x0070)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0071)
	ld	(hl), #0x08
	ld	hl, #(_tiles + 0x0072)
	ld	(hl), #0xe0
	ld	hl, #(_tiles + 0x0073)
	ld	(hl), #0x04
	ld	hl, #(_tiles + 0x0074)
	ld	(hl), #0xfc
	ld	hl, #(_tiles + 0x0075)
	ld	(hl), #0x02
	ld	hl, #(_tiles + 0x0076)
	ld	(hl), #0xfc
	ld	hl, #(_tiles + 0x0077)
	ld	(hl), #0x02
	ld	hl, #(_tiles + 0x0078)
	ld	(hl), #0xfc
	ld	hl, #(_tiles + 0x0079)
	ld	(hl), #0x02
	ld	hl, #(_tiles + 0x007a)
	ld	(hl), #0x18
	ld	hl, #(_tiles + 0x007b)
	ld	(hl), #0xe4
	ld	hl, #(_tiles + 0x007c)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x007d)
	ld	(hl), #0x38
	ld	hl, #(_tiles + 0x007e)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x007f)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0080)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0081)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0082)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0083)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0084)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0085)
	ld	(hl), #0xe0
	ld	hl, #(_tiles + 0x0086)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0087)
	ld	(hl), #0x18
	ld	hl, #(_tiles + 0x0088)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0089)
	ld	(hl), #0x08
	ld	hl, #(_tiles + 0x008a)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x008b)
	ld	(hl), #0x04
	ld	hl, #(_tiles + 0x008c)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x008d)
	ld	(hl), #0x08
	ld	hl, #(_tiles + 0x008e)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x008f)
	ld	(hl), #0x08
	ld	hl, #(_tiles + 0x0090)
	ld	(hl), #0xff
	ld	hl, #(_tiles + 0x0091)
	ld	(hl), #0xff
	ld	hl, #(_tiles + 0x0092)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0093)
	ld	(hl), #0xbf
	ld	hl, #(_tiles + 0x0094)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0095)
	ld	(hl), #0xbb
	ld	hl, #(_tiles + 0x0096)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0097)
	ld	(hl), #0xbb
	ld	hl, #(_tiles + 0x0098)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x0099)
	ld	(hl), #0xfb
	ld	hl, #(_tiles + 0x009a)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x009b)
	ld	(hl), #0xef
	ld	hl, #(_tiles + 0x009c)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x009d)
	ld	(hl), #0xef
	ld	hl, #(_tiles + 0x009e)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x009f)
	ld	(hl), #0xff
	ld	hl, #(_tiles + 0x00a0)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00a1)
	ld	(hl), #0x30
	ld	hl, #(_tiles + 0x00a2)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00a3)
	ld	(hl), #0x48
	ld	hl, #(_tiles + 0x00a4)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00a5)
	ld	(hl), #0x8b
	ld	hl, #(_tiles + 0x00a6)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00a7)
	ld	(hl), #0x04
	ld	hl, #(_tiles + 0x00a8)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00a9)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00aa)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00ab)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00ac)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00ad)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00ae)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00af)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00b0)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00b1)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00b2)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00b3)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00b4)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00b5)
	ld	(hl), #0x07
	ld	hl, #(_tiles + 0x00b6)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00b7)
	ld	(hl), #0x18
	ld	hl, #(_tiles + 0x00b8)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00b9)
	ld	(hl), #0x10
	ld	hl, #(_tiles + 0x00ba)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00bb)
	ld	(hl), #0x20
	ld	hl, #(_tiles + 0x00bc)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00bd)
	ld	(hl), #0x10
	ld	hl, #(_tiles + 0x00be)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00bf)
	ld	(hl), #0x10
	ld	hl, #(_tiles + 0x00c0)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00c1)
	ld	(hl), #0x10
	ld	hl, #(_tiles + 0x00c2)
	ld	(hl), #0x1e
	ld	hl, #(_tiles + 0x00c3)
	ld	(hl), #0x20
	ld	hl, #(_tiles + 0x00c4)
	ld	(hl), #0x3f
	ld	hl, #(_tiles + 0x00c5)
	ld	(hl), #0x40
	ld	hl, #(_tiles + 0x00c6)
	ld	(hl), #0x3f
	ld	hl, #(_tiles + 0x00c7)
	ld	(hl), #0x40
	ld	hl, #(_tiles + 0x00c8)
	ld	(hl), #0x3f
	ld	hl, #(_tiles + 0x00c9)
	ld	(hl), #0x40
	ld	hl, #(_tiles + 0x00ca)
	ld	(hl), #0x18
	ld	hl, #(_tiles + 0x00cb)
	ld	(hl), #0x27
	ld	hl, #(_tiles + 0x00cc)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00cd)
	ld	(hl), #0x1c
	ld	hl, #(_tiles + 0x00ce)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00cf)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00d0)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00d1)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00d2)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00d3)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00d4)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00d5)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00d6)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00d7)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00d8)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00d9)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00da)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00db)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00dc)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00dd)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00de)
	ld	(hl), #0x00
	ld	hl, #(_tiles + 0x00df)
	ld	(hl), #0x00
;gameOverTiles.c:26: unsigned char gameOverTiles[] =
	ld	hl, #_gameOverTiles
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0001)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0002)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0003)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0004)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0005)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0006)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0007)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0008)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0009)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x000a)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x000b)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x000c)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x000d)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x000e)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x000f)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0010)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0011)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0012)
	ld	(hl), #0x3c
	ld	hl, #(_gameOverTiles + 0x0013)
	ld	(hl), #0x3c
	ld	hl, #(_gameOverTiles + 0x0014)
	ld	(hl), #0x46
	ld	hl, #(_gameOverTiles + 0x0015)
	ld	(hl), #0x46
	ld	hl, #(_gameOverTiles + 0x0016)
	ld	(hl), #0x46
	ld	hl, #(_gameOverTiles + 0x0017)
	ld	(hl), #0x46
	ld	hl, #(_gameOverTiles + 0x0018)
	ld	(hl), #0x7e
	ld	hl, #(_gameOverTiles + 0x0019)
	ld	(hl), #0x7e
	ld	hl, #(_gameOverTiles + 0x001a)
	ld	(hl), #0x46
	ld	hl, #(_gameOverTiles + 0x001b)
	ld	(hl), #0x46
	ld	hl, #(_gameOverTiles + 0x001c)
	ld	(hl), #0x46
	ld	hl, #(_gameOverTiles + 0x001d)
	ld	(hl), #0x46
	ld	hl, #(_gameOverTiles + 0x001e)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x001f)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0020)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0021)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0022)
	ld	(hl), #0x46
	ld	hl, #(_gameOverTiles + 0x0023)
	ld	(hl), #0x46
	ld	hl, #(_gameOverTiles + 0x0024)
	ld	(hl), #0x6e
	ld	hl, #(_gameOverTiles + 0x0025)
	ld	(hl), #0x6e
	ld	hl, #(_gameOverTiles + 0x0026)
	ld	(hl), #0x7e
	ld	hl, #(_gameOverTiles + 0x0027)
	ld	(hl), #0x7e
	ld	hl, #(_gameOverTiles + 0x0028)
	ld	(hl), #0x56
	ld	hl, #(_gameOverTiles + 0x0029)
	ld	(hl), #0x56
	ld	hl, #(_gameOverTiles + 0x002a)
	ld	(hl), #0x46
	ld	hl, #(_gameOverTiles + 0x002b)
	ld	(hl), #0x46
	ld	hl, #(_gameOverTiles + 0x002c)
	ld	(hl), #0x46
	ld	hl, #(_gameOverTiles + 0x002d)
	ld	(hl), #0x46
	ld	hl, #(_gameOverTiles + 0x002e)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x002f)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0030)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0031)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0032)
	ld	(hl), #0x7e
	ld	hl, #(_gameOverTiles + 0x0033)
	ld	(hl), #0x7e
	ld	hl, #(_gameOverTiles + 0x0034)
	ld	(hl), #0x60
	ld	hl, #(_gameOverTiles + 0x0035)
	ld	(hl), #0x60
	ld	hl, #(_gameOverTiles + 0x0036)
	ld	(hl), #0x7c
	ld	hl, #(_gameOverTiles + 0x0037)
	ld	(hl), #0x7c
	ld	hl, #(_gameOverTiles + 0x0038)
	ld	(hl), #0x60
	ld	hl, #(_gameOverTiles + 0x0039)
	ld	(hl), #0x60
	ld	hl, #(_gameOverTiles + 0x003a)
	ld	(hl), #0x60
	ld	hl, #(_gameOverTiles + 0x003b)
	ld	(hl), #0x60
	ld	hl, #(_gameOverTiles + 0x003c)
	ld	(hl), #0x7e
	ld	hl, #(_gameOverTiles + 0x003d)
	ld	(hl), #0x7e
	ld	hl, #(_gameOverTiles + 0x003e)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x003f)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0040)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0041)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0042)
	ld	(hl), #0x3c
	ld	hl, #(_gameOverTiles + 0x0043)
	ld	(hl), #0x3c
	ld	hl, #(_gameOverTiles + 0x0044)
	ld	(hl), #0x66
	ld	hl, #(_gameOverTiles + 0x0045)
	ld	(hl), #0x66
	ld	hl, #(_gameOverTiles + 0x0046)
	ld	(hl), #0x66
	ld	hl, #(_gameOverTiles + 0x0047)
	ld	(hl), #0x66
	ld	hl, #(_gameOverTiles + 0x0048)
	ld	(hl), #0x66
	ld	hl, #(_gameOverTiles + 0x0049)
	ld	(hl), #0x66
	ld	hl, #(_gameOverTiles + 0x004a)
	ld	(hl), #0x66
	ld	hl, #(_gameOverTiles + 0x004b)
	ld	(hl), #0x66
	ld	hl, #(_gameOverTiles + 0x004c)
	ld	(hl), #0x3c
	ld	hl, #(_gameOverTiles + 0x004d)
	ld	(hl), #0x3c
	ld	hl, #(_gameOverTiles + 0x004e)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x004f)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0050)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0051)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0052)
	ld	(hl), #0x46
	ld	hl, #(_gameOverTiles + 0x0053)
	ld	(hl), #0x46
	ld	hl, #(_gameOverTiles + 0x0054)
	ld	(hl), #0x46
	ld	hl, #(_gameOverTiles + 0x0055)
	ld	(hl), #0x46
	ld	hl, #(_gameOverTiles + 0x0056)
	ld	(hl), #0x46
	ld	hl, #(_gameOverTiles + 0x0057)
	ld	(hl), #0x46
	ld	hl, #(_gameOverTiles + 0x0058)
	ld	(hl), #0x46
	ld	hl, #(_gameOverTiles + 0x0059)
	ld	(hl), #0x46
	ld	hl, #(_gameOverTiles + 0x005a)
	ld	(hl), #0x2c
	ld	hl, #(_gameOverTiles + 0x005b)
	ld	(hl), #0x2c
	ld	hl, #(_gameOverTiles + 0x005c)
	ld	(hl), #0x18
	ld	hl, #(_gameOverTiles + 0x005d)
	ld	(hl), #0x18
	ld	hl, #(_gameOverTiles + 0x005e)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x005f)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0060)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0061)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0062)
	ld	(hl), #0x7c
	ld	hl, #(_gameOverTiles + 0x0063)
	ld	(hl), #0x7c
	ld	hl, #(_gameOverTiles + 0x0064)
	ld	(hl), #0x66
	ld	hl, #(_gameOverTiles + 0x0065)
	ld	(hl), #0x66
	ld	hl, #(_gameOverTiles + 0x0066)
	ld	(hl), #0x66
	ld	hl, #(_gameOverTiles + 0x0067)
	ld	(hl), #0x66
	ld	hl, #(_gameOverTiles + 0x0068)
	ld	(hl), #0x7c
	ld	hl, #(_gameOverTiles + 0x0069)
	ld	(hl), #0x7c
	ld	hl, #(_gameOverTiles + 0x006a)
	ld	(hl), #0x68
	ld	hl, #(_gameOverTiles + 0x006b)
	ld	(hl), #0x68
	ld	hl, #(_gameOverTiles + 0x006c)
	ld	(hl), #0x66
	ld	hl, #(_gameOverTiles + 0x006d)
	ld	(hl), #0x66
	ld	hl, #(_gameOverTiles + 0x006e)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x006f)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0070)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0071)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0072)
	ld	(hl), #0x3c
	ld	hl, #(_gameOverTiles + 0x0073)
	ld	(hl), #0x3c
	ld	hl, #(_gameOverTiles + 0x0074)
	ld	(hl), #0x66
	ld	hl, #(_gameOverTiles + 0x0075)
	ld	(hl), #0x66
	ld	hl, #(_gameOverTiles + 0x0076)
	ld	(hl), #0x60
	ld	hl, #(_gameOverTiles + 0x0077)
	ld	(hl), #0x60
	ld	hl, #(_gameOverTiles + 0x0078)
	ld	(hl), #0x6e
	ld	hl, #(_gameOverTiles + 0x0079)
	ld	(hl), #0x6e
	ld	hl, #(_gameOverTiles + 0x007a)
	ld	(hl), #0x66
	ld	hl, #(_gameOverTiles + 0x007b)
	ld	(hl), #0x66
	ld	hl, #(_gameOverTiles + 0x007c)
	ld	(hl), #0x3e
	ld	hl, #(_gameOverTiles + 0x007d)
	ld	(hl), #0x3e
	ld	hl, #(_gameOverTiles + 0x007e)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x007f)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0080)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0081)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0082)
	ld	(hl), #0x3c
	ld	hl, #(_gameOverTiles + 0x0083)
	ld	(hl), #0x3c
	ld	hl, #(_gameOverTiles + 0x0084)
	ld	(hl), #0x18
	ld	hl, #(_gameOverTiles + 0x0085)
	ld	(hl), #0x18
	ld	hl, #(_gameOverTiles + 0x0086)
	ld	(hl), #0x18
	ld	hl, #(_gameOverTiles + 0x0087)
	ld	(hl), #0x18
	ld	hl, #(_gameOverTiles + 0x0088)
	ld	(hl), #0x18
	ld	hl, #(_gameOverTiles + 0x0089)
	ld	(hl), #0x18
	ld	hl, #(_gameOverTiles + 0x008a)
	ld	(hl), #0x18
	ld	hl, #(_gameOverTiles + 0x008b)
	ld	(hl), #0x18
	ld	hl, #(_gameOverTiles + 0x008c)
	ld	(hl), #0x3c
	ld	hl, #(_gameOverTiles + 0x008d)
	ld	(hl), #0x3c
	ld	hl, #(_gameOverTiles + 0x008e)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x008f)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0090)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0091)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0092)
	ld	(hl), #0x66
	ld	hl, #(_gameOverTiles + 0x0093)
	ld	(hl), #0x66
	ld	hl, #(_gameOverTiles + 0x0094)
	ld	(hl), #0x6c
	ld	hl, #(_gameOverTiles + 0x0095)
	ld	(hl), #0x6c
	ld	hl, #(_gameOverTiles + 0x0096)
	ld	(hl), #0x78
	ld	hl, #(_gameOverTiles + 0x0097)
	ld	(hl), #0x78
	ld	hl, #(_gameOverTiles + 0x0098)
	ld	(hl), #0x78
	ld	hl, #(_gameOverTiles + 0x0099)
	ld	(hl), #0x78
	ld	hl, #(_gameOverTiles + 0x009a)
	ld	(hl), #0x6c
	ld	hl, #(_gameOverTiles + 0x009b)
	ld	(hl), #0x6c
	ld	hl, #(_gameOverTiles + 0x009c)
	ld	(hl), #0x66
	ld	hl, #(_gameOverTiles + 0x009d)
	ld	(hl), #0x66
	ld	hl, #(_gameOverTiles + 0x009e)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x009f)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x00a0)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x00a1)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x00a2)
	ld	(hl), #0x7e
	ld	hl, #(_gameOverTiles + 0x00a3)
	ld	(hl), #0x7e
	ld	hl, #(_gameOverTiles + 0x00a4)
	ld	(hl), #0x60
	ld	hl, #(_gameOverTiles + 0x00a5)
	ld	(hl), #0x60
	ld	hl, #(_gameOverTiles + 0x00a6)
	ld	(hl), #0x60
	ld	hl, #(_gameOverTiles + 0x00a7)
	ld	(hl), #0x60
	ld	hl, #(_gameOverTiles + 0x00a8)
	ld	(hl), #0x7c
	ld	hl, #(_gameOverTiles + 0x00a9)
	ld	(hl), #0x7c
	ld	hl, #(_gameOverTiles + 0x00aa)
	ld	(hl), #0x60
	ld	hl, #(_gameOverTiles + 0x00ab)
	ld	(hl), #0x60
	ld	hl, #(_gameOverTiles + 0x00ac)
	ld	(hl), #0x60
	ld	hl, #(_gameOverTiles + 0x00ad)
	ld	(hl), #0x60
	ld	hl, #(_gameOverTiles + 0x00ae)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x00af)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x00b0)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x00b1)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x00b2)
	ld	(hl), #0x60
	ld	hl, #(_gameOverTiles + 0x00b3)
	ld	(hl), #0x60
	ld	hl, #(_gameOverTiles + 0x00b4)
	ld	(hl), #0x60
	ld	hl, #(_gameOverTiles + 0x00b5)
	ld	(hl), #0x60
	ld	hl, #(_gameOverTiles + 0x00b6)
	ld	(hl), #0x60
	ld	hl, #(_gameOverTiles + 0x00b7)
	ld	(hl), #0x60
	ld	hl, #(_gameOverTiles + 0x00b8)
	ld	(hl), #0x60
	ld	hl, #(_gameOverTiles + 0x00b9)
	ld	(hl), #0x60
	ld	hl, #(_gameOverTiles + 0x00ba)
	ld	(hl), #0x60
	ld	hl, #(_gameOverTiles + 0x00bb)
	ld	(hl), #0x60
	ld	hl, #(_gameOverTiles + 0x00bc)
	ld	(hl), #0x7e
	ld	hl, #(_gameOverTiles + 0x00bd)
	ld	(hl), #0x7e
	ld	hl, #(_gameOverTiles + 0x00be)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x00bf)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x00c0)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x00c1)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x00c2)
	ld	(hl), #0x7c
	ld	hl, #(_gameOverTiles + 0x00c3)
	ld	(hl), #0x7c
	ld	hl, #(_gameOverTiles + 0x00c4)
	ld	(hl), #0x4e
	ld	hl, #(_gameOverTiles + 0x00c5)
	ld	(hl), #0x4e
	ld	hl, #(_gameOverTiles + 0x00c6)
	ld	(hl), #0x4e
	ld	hl, #(_gameOverTiles + 0x00c7)
	ld	(hl), #0x4e
	ld	hl, #(_gameOverTiles + 0x00c8)
	ld	(hl), #0x4e
	ld	hl, #(_gameOverTiles + 0x00c9)
	ld	(hl), #0x4e
	ld	hl, #(_gameOverTiles + 0x00ca)
	ld	(hl), #0x4e
	ld	hl, #(_gameOverTiles + 0x00cb)
	ld	(hl), #0x4e
	ld	hl, #(_gameOverTiles + 0x00cc)
	ld	(hl), #0x7c
	ld	hl, #(_gameOverTiles + 0x00cd)
	ld	(hl), #0x7c
	ld	hl, #(_gameOverTiles + 0x00ce)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x00cf)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x00d0)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x00d1)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x00d2)
	ld	(hl), #0x7c
	ld	hl, #(_gameOverTiles + 0x00d3)
	ld	(hl), #0x7c
	ld	hl, #(_gameOverTiles + 0x00d4)
	ld	(hl), #0x66
	ld	hl, #(_gameOverTiles + 0x00d5)
	ld	(hl), #0x66
	ld	hl, #(_gameOverTiles + 0x00d6)
	ld	(hl), #0x7c
	ld	hl, #(_gameOverTiles + 0x00d7)
	ld	(hl), #0x7c
	ld	hl, #(_gameOverTiles + 0x00d8)
	ld	(hl), #0x66
	ld	hl, #(_gameOverTiles + 0x00d9)
	ld	(hl), #0x66
	ld	hl, #(_gameOverTiles + 0x00da)
	ld	(hl), #0x66
	ld	hl, #(_gameOverTiles + 0x00db)
	ld	(hl), #0x66
	ld	hl, #(_gameOverTiles + 0x00dc)
	ld	(hl), #0x7c
	ld	hl, #(_gameOverTiles + 0x00dd)
	ld	(hl), #0x7c
	ld	hl, #(_gameOverTiles + 0x00de)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x00df)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x00e0)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x00e1)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x00e2)
	ld	(hl), #0x66
	ld	hl, #(_gameOverTiles + 0x00e3)
	ld	(hl), #0x66
	ld	hl, #(_gameOverTiles + 0x00e4)
	ld	(hl), #0x66
	ld	hl, #(_gameOverTiles + 0x00e5)
	ld	(hl), #0x66
	ld	hl, #(_gameOverTiles + 0x00e6)
	ld	(hl), #0x3c
	ld	hl, #(_gameOverTiles + 0x00e7)
	ld	(hl), #0x3c
	ld	hl, #(_gameOverTiles + 0x00e8)
	ld	(hl), #0x18
	ld	hl, #(_gameOverTiles + 0x00e9)
	ld	(hl), #0x18
	ld	hl, #(_gameOverTiles + 0x00ea)
	ld	(hl), #0x18
	ld	hl, #(_gameOverTiles + 0x00eb)
	ld	(hl), #0x18
	ld	hl, #(_gameOverTiles + 0x00ec)
	ld	(hl), #0x18
	ld	hl, #(_gameOverTiles + 0x00ed)
	ld	(hl), #0x18
	ld	hl, #(_gameOverTiles + 0x00ee)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x00ef)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x00f0)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x00f1)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x00f2)
	ld	(hl), #0x7e
	ld	hl, #(_gameOverTiles + 0x00f3)
	ld	(hl), #0x7e
	ld	hl, #(_gameOverTiles + 0x00f4)
	ld	(hl), #0x18
	ld	hl, #(_gameOverTiles + 0x00f5)
	ld	(hl), #0x18
	ld	hl, #(_gameOverTiles + 0x00f6)
	ld	(hl), #0x18
	ld	hl, #(_gameOverTiles + 0x00f7)
	ld	(hl), #0x18
	ld	hl, #(_gameOverTiles + 0x00f8)
	ld	(hl), #0x18
	ld	hl, #(_gameOverTiles + 0x00f9)
	ld	(hl), #0x18
	ld	hl, #(_gameOverTiles + 0x00fa)
	ld	(hl), #0x18
	ld	hl, #(_gameOverTiles + 0x00fb)
	ld	(hl), #0x18
	ld	hl, #(_gameOverTiles + 0x00fc)
	ld	(hl), #0x18
	ld	hl, #(_gameOverTiles + 0x00fd)
	ld	(hl), #0x18
	ld	hl, #(_gameOverTiles + 0x00fe)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x00ff)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0100)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0101)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0102)
	ld	(hl), #0x46
	ld	hl, #(_gameOverTiles + 0x0103)
	ld	(hl), #0x46
	ld	hl, #(_gameOverTiles + 0x0104)
	ld	(hl), #0x46
	ld	hl, #(_gameOverTiles + 0x0105)
	ld	(hl), #0x46
	ld	hl, #(_gameOverTiles + 0x0106)
	ld	(hl), #0x7e
	ld	hl, #(_gameOverTiles + 0x0107)
	ld	(hl), #0x7e
	ld	hl, #(_gameOverTiles + 0x0108)
	ld	(hl), #0x46
	ld	hl, #(_gameOverTiles + 0x0109)
	ld	(hl), #0x46
	ld	hl, #(_gameOverTiles + 0x010a)
	ld	(hl), #0x46
	ld	hl, #(_gameOverTiles + 0x010b)
	ld	(hl), #0x46
	ld	hl, #(_gameOverTiles + 0x010c)
	ld	(hl), #0x46
	ld	hl, #(_gameOverTiles + 0x010d)
	ld	(hl), #0x46
	ld	hl, #(_gameOverTiles + 0x010e)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x010f)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0110)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0111)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0112)
	ld	(hl), #0x46
	ld	hl, #(_gameOverTiles + 0x0113)
	ld	(hl), #0x46
	ld	hl, #(_gameOverTiles + 0x0114)
	ld	(hl), #0x66
	ld	hl, #(_gameOverTiles + 0x0115)
	ld	(hl), #0x66
	ld	hl, #(_gameOverTiles + 0x0116)
	ld	(hl), #0x76
	ld	hl, #(_gameOverTiles + 0x0117)
	ld	(hl), #0x76
	ld	hl, #(_gameOverTiles + 0x0118)
	ld	(hl), #0x5e
	ld	hl, #(_gameOverTiles + 0x0119)
	ld	(hl), #0x5e
	ld	hl, #(_gameOverTiles + 0x011a)
	ld	(hl), #0x4e
	ld	hl, #(_gameOverTiles + 0x011b)
	ld	(hl), #0x4e
	ld	hl, #(_gameOverTiles + 0x011c)
	ld	(hl), #0x46
	ld	hl, #(_gameOverTiles + 0x011d)
	ld	(hl), #0x46
	ld	hl, #(_gameOverTiles + 0x011e)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x011f)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0120)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0121)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0122)
	ld	(hl), #0x3c
	ld	hl, #(_gameOverTiles + 0x0123)
	ld	(hl), #0x3c
	ld	hl, #(_gameOverTiles + 0x0124)
	ld	(hl), #0x60
	ld	hl, #(_gameOverTiles + 0x0125)
	ld	(hl), #0x60
	ld	hl, #(_gameOverTiles + 0x0126)
	ld	(hl), #0x3c
	ld	hl, #(_gameOverTiles + 0x0127)
	ld	(hl), #0x3c
	ld	hl, #(_gameOverTiles + 0x0128)
	ld	(hl), #0x0e
	ld	hl, #(_gameOverTiles + 0x0129)
	ld	(hl), #0x0e
	ld	hl, #(_gameOverTiles + 0x012a)
	ld	(hl), #0x4e
	ld	hl, #(_gameOverTiles + 0x012b)
	ld	(hl), #0x4e
	ld	hl, #(_gameOverTiles + 0x012c)
	ld	(hl), #0x3c
	ld	hl, #(_gameOverTiles + 0x012d)
	ld	(hl), #0x3c
	ld	hl, #(_gameOverTiles + 0x012e)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x012f)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0130)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0131)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0132)
	ld	(hl), #0x7c
	ld	hl, #(_gameOverTiles + 0x0133)
	ld	(hl), #0x7c
	ld	hl, #(_gameOverTiles + 0x0134)
	ld	(hl), #0x66
	ld	hl, #(_gameOverTiles + 0x0135)
	ld	(hl), #0x66
	ld	hl, #(_gameOverTiles + 0x0136)
	ld	(hl), #0x66
	ld	hl, #(_gameOverTiles + 0x0137)
	ld	(hl), #0x66
	ld	hl, #(_gameOverTiles + 0x0138)
	ld	(hl), #0x7c
	ld	hl, #(_gameOverTiles + 0x0139)
	ld	(hl), #0x7c
	ld	hl, #(_gameOverTiles + 0x013a)
	ld	(hl), #0x60
	ld	hl, #(_gameOverTiles + 0x013b)
	ld	(hl), #0x60
	ld	hl, #(_gameOverTiles + 0x013c)
	ld	(hl), #0x60
	ld	hl, #(_gameOverTiles + 0x013d)
	ld	(hl), #0x60
	ld	hl, #(_gameOverTiles + 0x013e)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x013f)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0140)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0141)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0142)
	ld	(hl), #0x18
	ld	hl, #(_gameOverTiles + 0x0143)
	ld	(hl), #0x18
	ld	hl, #(_gameOverTiles + 0x0144)
	ld	(hl), #0x18
	ld	hl, #(_gameOverTiles + 0x0145)
	ld	(hl), #0x18
	ld	hl, #(_gameOverTiles + 0x0146)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0147)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0148)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0149)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x014a)
	ld	(hl), #0x18
	ld	hl, #(_gameOverTiles + 0x014b)
	ld	(hl), #0x18
	ld	hl, #(_gameOverTiles + 0x014c)
	ld	(hl), #0x18
	ld	hl, #(_gameOverTiles + 0x014d)
	ld	(hl), #0x18
	ld	hl, #(_gameOverTiles + 0x014e)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x014f)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0150)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0151)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0152)
	ld	(hl), #0x24
	ld	hl, #(_gameOverTiles + 0x0153)
	ld	(hl), #0x24
	ld	hl, #(_gameOverTiles + 0x0154)
	ld	(hl), #0x24
	ld	hl, #(_gameOverTiles + 0x0155)
	ld	(hl), #0x24
	ld	hl, #(_gameOverTiles + 0x0156)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0157)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0158)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0159)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x015a)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x015b)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x015c)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x015d)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x015e)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x015f)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0160)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0161)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0162)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0163)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0164)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0165)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0166)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0167)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0168)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x0169)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x016a)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x016b)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x016c)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x016d)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x016e)
	ld	(hl), #0x00
	ld	hl, #(_gameOverTiles + 0x016f)
	ld	(hl), #0x00
;gameOverMap.c:25: unsigned char gameOverMap[] =
	ld	hl, #_gameOverMap
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0001)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0002)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0003)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0004)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0005)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0006)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0007)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0008)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0009)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x000a)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x000b)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x000c)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x000d)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x000e)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x000f)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0010)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0011)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0012)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0013)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0014)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0015)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0016)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0017)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0018)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0019)
	ld	(hl), #0x07
	ld	hl, #(_gameOverMap + 0x001a)
	ld	(hl), #0x01
	ld	hl, #(_gameOverMap + 0x001b)
	ld	(hl), #0x02
	ld	hl, #(_gameOverMap + 0x001c)
	ld	(hl), #0x03
	ld	hl, #(_gameOverMap + 0x001d)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x001e)
	ld	(hl), #0x04
	ld	hl, #(_gameOverMap + 0x001f)
	ld	(hl), #0x05
	ld	hl, #(_gameOverMap + 0x0020)
	ld	(hl), #0x03
	ld	hl, #(_gameOverMap + 0x0021)
	ld	(hl), #0x06
	ld	hl, #(_gameOverMap + 0x0022)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0023)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0024)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0025)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0026)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0027)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0028)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0029)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x002a)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x002b)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x002c)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x002d)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x002e)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x002f)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0030)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0031)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0032)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0033)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0034)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0035)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0036)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0037)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0038)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0039)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x003a)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x003b)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x003c)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x003d)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x003e)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x003f)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0040)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0041)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0042)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0043)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0044)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0045)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0046)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0047)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0048)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0049)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x004a)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x004b)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x004c)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x004d)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x004e)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x004f)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0050)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0051)
	ld	(hl), #0x0f
	ld	hl, #(_gameOverMap + 0x0052)
	ld	(hl), #0x10
	ld	hl, #(_gameOverMap + 0x0053)
	ld	(hl), #0x01
	ld	hl, #(_gameOverMap + 0x0054)
	ld	(hl), #0x11
	ld	hl, #(_gameOverMap + 0x0055)
	ld	(hl), #0x09
	ld	hl, #(_gameOverMap + 0x0056)
	ld	(hl), #0x12
	ld	hl, #(_gameOverMap + 0x0057)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0058)
	ld	(hl), #0x0a
	ld	hl, #(_gameOverMap + 0x0059)
	ld	(hl), #0x04
	ld	hl, #(_gameOverMap + 0x005a)
	ld	(hl), #0x06
	ld	hl, #(_gameOverMap + 0x005b)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x005c)
	ld	(hl), #0x13
	ld	hl, #(_gameOverMap + 0x005d)
	ld	(hl), #0x0b
	ld	hl, #(_gameOverMap + 0x005e)
	ld	(hl), #0x01
	ld	hl, #(_gameOverMap + 0x005f)
	ld	(hl), #0x0e
	ld	hl, #(_gameOverMap + 0x0060)
	ld	(hl), #0x08
	ld	hl, #(_gameOverMap + 0x0061)
	ld	(hl), #0x11
	ld	hl, #(_gameOverMap + 0x0062)
	ld	(hl), #0x07
	ld	hl, #(_gameOverMap + 0x0063)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0064)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0065)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0066)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0067)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0068)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0069)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x006a)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x006b)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x006c)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x006d)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x006e)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x006f)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0070)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0071)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0072)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0073)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0074)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0075)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0076)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0077)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0078)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0079)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x007a)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x007b)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x007c)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x007d)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x007e)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x007f)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0080)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0081)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0082)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0083)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0084)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0085)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0086)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0087)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0088)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0089)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x008a)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x008b)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x008c)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x008d)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x008e)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x008f)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0090)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0091)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0092)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0093)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0094)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0095)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0096)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0097)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0098)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0099)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x009a)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x009b)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x009c)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x009d)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x009e)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x009f)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00a0)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00a1)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00a2)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00a3)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00a4)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00a5)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00a6)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00a7)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00a8)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00a9)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00aa)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00ab)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00ac)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00ad)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00ae)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00af)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00b0)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00b1)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00b2)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00b3)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00b4)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00b5)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00b6)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00b7)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00b8)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00b9)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00ba)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00bb)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00bc)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00bd)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00be)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00bf)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00c0)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00c1)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00c2)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00c3)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00c4)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00c5)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00c6)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00c7)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00c8)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00c9)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00ca)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00cb)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00cc)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00cd)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00ce)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00cf)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00d0)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00d1)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00d2)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00d3)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00d4)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00d5)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00d6)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00d7)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00d8)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00d9)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00da)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00db)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00dc)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00dd)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00de)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00df)
	ld	(hl), #0x0d
	ld	hl, #(_gameOverMap + 0x00e0)
	ld	(hl), #0x0e
	ld	hl, #(_gameOverMap + 0x00e1)
	ld	(hl), #0x14
	ld	hl, #(_gameOverMap + 0x00e2)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00e3)
	ld	(hl), #0x02
	ld	hl, #(_gameOverMap + 0x00e4)
	ld	(hl), #0x08
	ld	hl, #(_gameOverMap + 0x00e5)
	ld	(hl), #0x09
	ld	hl, #(_gameOverMap + 0x00e6)
	ld	(hl), #0x03
	ld	hl, #(_gameOverMap + 0x00e7)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00e8)
	ld	(hl), #0x0a
	ld	hl, #(_gameOverMap + 0x00e9)
	ld	(hl), #0x0b
	ld	hl, #(_gameOverMap + 0x00ea)
	ld	(hl), #0x04
	ld	hl, #(_gameOverMap + 0x00eb)
	ld	(hl), #0x04
	ld	hl, #(_gameOverMap + 0x00ec)
	ld	(hl), #0x0c
	ld	hl, #(_gameOverMap + 0x00ed)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00ee)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00ef)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00f0)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00f1)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00f2)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00f3)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00f4)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00f5)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00f6)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00f7)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00f8)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00f9)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00fa)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00fb)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00fc)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00fd)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00fe)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x00ff)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0100)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0101)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0102)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0103)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0104)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0105)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0106)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0107)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0108)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0109)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x010a)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x010b)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x010c)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x010d)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x010e)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x010f)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0110)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0111)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0112)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0113)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0114)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0115)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0116)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0117)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0118)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0119)
	ld	(hl), #0x13
	ld	hl, #(_gameOverMap + 0x011a)
	ld	(hl), #0x06
	ld	hl, #(_gameOverMap + 0x011b)
	ld	(hl), #0x03
	ld	hl, #(_gameOverMap + 0x011c)
	ld	(hl), #0x12
	ld	hl, #(_gameOverMap + 0x011d)
	ld	(hl), #0x12
	ld	hl, #(_gameOverMap + 0x011e)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x011f)
	ld	(hl), #0x15
	ld	hl, #(_gameOverMap + 0x0120)
	ld	(hl), #0x01
	ld	hl, #(_gameOverMap + 0x0121)
	ld	(hl), #0x15
	ld	hl, #(_gameOverMap + 0x0122)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0123)
	ld	(hl), #0x0f
	ld	hl, #(_gameOverMap + 0x0124)
	ld	(hl), #0x04
	ld	hl, #(_gameOverMap + 0x0125)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0126)
	ld	(hl), #0x06
	ld	hl, #(_gameOverMap + 0x0127)
	ld	(hl), #0x03
	ld	hl, #(_gameOverMap + 0x0128)
	ld	(hl), #0x0f
	ld	hl, #(_gameOverMap + 0x0129)
	ld	(hl), #0x06
	ld	hl, #(_gameOverMap + 0x012a)
	ld	(hl), #0x0e
	ld	hl, #(_gameOverMap + 0x012b)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x012c)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x012d)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x012e)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x012f)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0130)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0131)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0132)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0133)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0134)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0135)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0136)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0137)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0138)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0139)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x013a)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x013b)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x013c)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x013d)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x013e)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x013f)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0140)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0141)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0142)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0143)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0144)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0145)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0146)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0147)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0148)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0149)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x014a)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x014b)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x014c)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x014d)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x014e)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x014f)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0150)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0151)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0152)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0153)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0154)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0155)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0156)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0157)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0158)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0159)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x015a)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x015b)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x015c)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x015d)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x015e)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x015f)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0160)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0161)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0162)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0163)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0164)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0165)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0166)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0167)
	ld	(hl), #0x00
;titleScreen.c:25: unsigned char titleScreen[] =
	ld	hl, #_titleScreen
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0001)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0002)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0003)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0004)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0005)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0006)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0007)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0008)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0009)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x000a)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x000b)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x000c)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x000d)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x000e)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x000f)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0010)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0011)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0012)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0013)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0014)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0015)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0016)
	ld	(hl), #0x12
	ld	hl, #(_titleScreen + 0x0017)
	ld	(hl), #0x13
	ld	hl, #(_titleScreen + 0x0018)
	ld	(hl), #0x04
	ld	hl, #(_titleScreen + 0x0019)
	ld	(hl), #0x04
	ld	hl, #(_titleScreen + 0x001a)
	ld	(hl), #0x09
	ld	hl, #(_titleScreen + 0x001b)
	ld	(hl), #0x0e
	ld	hl, #(_titleScreen + 0x001c)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x001d)
	ld	(hl), #0x0f
	ld	hl, #(_titleScreen + 0x001e)
	ld	(hl), #0x06
	ld	hl, #(_titleScreen + 0x001f)
	ld	(hl), #0x01
	ld	hl, #(_titleScreen + 0x0020)
	ld	(hl), #0x05
	ld	hl, #(_titleScreen + 0x0021)
	ld	(hl), #0x03
	ld	hl, #(_titleScreen + 0x0022)
	ld	(hl), #0x0b
	ld	hl, #(_titleScreen + 0x0023)
	ld	(hl), #0x03
	ld	hl, #(_titleScreen + 0x0024)
	ld	(hl), #0x06
	ld	hl, #(_titleScreen + 0x0025)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0026)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0027)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0028)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0029)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x002a)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x002b)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x002c)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x002d)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x002e)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x002f)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0030)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0031)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0032)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0033)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0034)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0035)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0036)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0037)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0038)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0039)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x003a)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x003b)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x003c)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x003d)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x003e)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x003f)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0040)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0041)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0042)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0043)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0044)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0045)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0046)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0047)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0048)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0049)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x004a)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x004b)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x004c)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x004d)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x004e)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x004f)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0050)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0051)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0052)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0053)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0054)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0055)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0056)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0057)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0058)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0059)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x005a)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x005b)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x005c)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x005d)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x005e)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x005f)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0060)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0061)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0062)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0063)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0064)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0065)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0066)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0067)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0068)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0069)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x006a)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x006b)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x006c)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x006d)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x006e)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x006f)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0070)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0071)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0072)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0073)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0074)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0075)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0076)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0077)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0078)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0079)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x007a)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x007b)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x007c)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x007d)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x007e)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x007f)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0080)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0081)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0082)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0083)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0084)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0085)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0086)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0087)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0088)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0089)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x008a)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x008b)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x008c)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x008d)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x008e)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x008f)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0090)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0091)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0092)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0093)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0094)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0095)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0096)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0097)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0098)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0099)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x009a)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x009b)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x009c)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x009d)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x009e)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x009f)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00a0)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00a1)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00a2)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00a3)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00a4)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00a5)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00a6)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00a7)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00a8)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00a9)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00aa)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00ab)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00ac)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00ad)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00ae)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00af)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00b0)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00b1)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00b2)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00b3)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00b4)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00b5)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00b6)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00b7)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00b8)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00b9)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00ba)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00bb)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00bc)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00bd)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00be)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00bf)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00c0)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00c1)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00c2)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00c3)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00c4)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00c5)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00c6)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00c7)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00c8)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00c9)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00ca)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00cb)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00cc)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00cd)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00ce)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00cf)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00d0)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00d1)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00d2)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00d3)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00d4)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00d5)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00d6)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00d7)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00d8)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00d9)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00da)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00db)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00dc)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00dd)
	ld	(hl), #0x0c
	ld	hl, #(_titleScreen + 0x00de)
	ld	(hl), #0x13
	ld	hl, #(_titleScreen + 0x00df)
	ld	(hl), #0x01
	ld	hl, #(_titleScreen + 0x00e0)
	ld	(hl), #0x0c
	ld	hl, #(_titleScreen + 0x00e1)
	ld	(hl), #0x14
	ld	hl, #(_titleScreen + 0x00e2)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00e3)
	ld	(hl), #0x02
	ld	hl, #(_titleScreen + 0x00e4)
	ld	(hl), #0x04
	ld	hl, #(_titleScreen + 0x00e5)
	ld	(hl), #0x05
	ld	hl, #(_titleScreen + 0x00e6)
	ld	(hl), #0x03
	ld	hl, #(_titleScreen + 0x00e7)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00e8)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00e9)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00ea)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00eb)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00ec)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00ed)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00ee)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00ef)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00f0)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00f1)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00f2)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00f3)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00f4)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00f5)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00f6)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00f7)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00f8)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00f9)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00fa)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00fb)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00fc)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00fd)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00fe)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x00ff)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0100)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0101)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0102)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0103)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0104)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0105)
	ld	(hl), #0x07
	ld	hl, #(_titleScreen + 0x0106)
	ld	(hl), #0x03
	ld	hl, #(_titleScreen + 0x0107)
	ld	(hl), #0x0f
	ld	hl, #(_titleScreen + 0x0108)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0109)
	ld	(hl), #0x10
	ld	hl, #(_titleScreen + 0x010a)
	ld	(hl), #0x03
	ld	hl, #(_titleScreen + 0x010b)
	ld	(hl), #0x01
	ld	hl, #(_titleScreen + 0x010c)
	ld	(hl), #0x06
	ld	hl, #(_titleScreen + 0x010d)
	ld	(hl), #0x0f
	ld	hl, #(_titleScreen + 0x010e)
	ld	(hl), #0x12
	ld	hl, #(_titleScreen + 0x010f)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0110)
	ld	(hl), #0x0f
	ld	hl, #(_titleScreen + 0x0111)
	ld	(hl), #0x04
	ld	hl, #(_titleScreen + 0x0112)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0113)
	ld	(hl), #0x0a
	ld	hl, #(_titleScreen + 0x0114)
	ld	(hl), #0x0b
	ld	hl, #(_titleScreen + 0x0115)
	ld	(hl), #0x0e
	ld	hl, #(_titleScreen + 0x0116)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0117)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0118)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0119)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x011a)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x011b)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x011c)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x011d)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x011e)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x011f)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0120)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0121)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0122)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0123)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0124)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0125)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0126)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0127)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0128)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0129)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x012a)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x012b)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x012c)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x012d)
	ld	(hl), #0x13
	ld	hl, #(_titleScreen + 0x012e)
	ld	(hl), #0x06
	ld	hl, #(_titleScreen + 0x012f)
	ld	(hl), #0x03
	ld	hl, #(_titleScreen + 0x0130)
	ld	(hl), #0x12
	ld	hl, #(_titleScreen + 0x0131)
	ld	(hl), #0x12
	ld	hl, #(_titleScreen + 0x0132)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0133)
	ld	(hl), #0x12
	ld	hl, #(_titleScreen + 0x0134)
	ld	(hl), #0x0f
	ld	hl, #(_titleScreen + 0x0135)
	ld	(hl), #0x01
	ld	hl, #(_titleScreen + 0x0136)
	ld	(hl), #0x06
	ld	hl, #(_titleScreen + 0x0137)
	ld	(hl), #0x0f
	ld	hl, #(_titleScreen + 0x0138)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0139)
	ld	(hl), #0x0f
	ld	hl, #(_titleScreen + 0x013a)
	ld	(hl), #0x04
	ld	hl, #(_titleScreen + 0x013b)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x013c)
	ld	(hl), #0x13
	ld	hl, #(_titleScreen + 0x013d)
	ld	(hl), #0x0b
	ld	hl, #(_titleScreen + 0x013e)
	ld	(hl), #0x01
	ld	hl, #(_titleScreen + 0x013f)
	ld	(hl), #0x0e
	ld	hl, #(_titleScreen + 0x0140)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0141)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0142)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0143)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0144)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0145)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0146)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0147)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0148)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0149)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x014a)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x014b)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x014c)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x014d)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x014e)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x014f)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0150)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0151)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0152)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0153)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0154)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0155)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0156)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0157)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0158)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0159)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x015a)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x015b)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x015c)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x015d)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x015e)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x015f)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0160)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0161)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0162)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0163)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0164)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0165)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0166)
	ld	(hl), #0x00
	ld	hl, #(_titleScreen + 0x0167)
	ld	(hl), #0x00
;main.c:48: UINT8 health = 10;
	ld	hl, #_health
	ld	(hl), #0x0a
;main.c:49: UINT8 framesBetweenHealthDecrement = 45;
	ld	hl, #_framesBetweenHealthDecrement
	ld	(hl), #0x2d
;main.c:50: UINT8 healthFrameCounter = 0; 
	ld	hl, #_healthFrameCounter
	ld	(hl), #0x00
;main.c:52: UINT8 framesBetweenScrolling = 0; // 10 is maybe the slowest this should go
	ld	hl, #_framesBetweenScrolling
	ld	(hl), #0x00
;main.c:53: UINT8 shouldScrollCounter = 0;
	ld	hl, #_shouldScrollCounter
	ld	(hl), #0x00
;main.c:55: UINT8 scrollPos = 0;
	ld	hl, #_scrollPos
	ld	(hl), #0x00
;main.c:63: UINT8 atTitleScreen = 1;
	ld	hl, #_atTitleScreen
	ld	(hl), #0x01
;main.c:64: UINT8 gameIsOver = 0;
	ld	hl, #_gameIsOver
	ld	(hl), #0x00
;main.c:65: UINT8 gameOverScreenInit = 0;
	ld	hl, #_gameOverScreenInit
	ld	(hl), #0x00
;main.c:67: UINT8 timerToRespawnHeart = 0;
	ld	hl, #_timerToRespawnHeart
	ld	(hl), #0x00
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:69: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:71: init();
	call	_init
;main.c:73: while(1) {
00115$:
;main.c:75: updateSwitches();  // Make sure the SHOW_SPRITES and SHOW_BKG switches are on each loop
	call	_updateSwitches
;main.c:77: if(atTitleScreen == 1)
	ld	a, (#_atTitleScreen)
	dec	a
	jr	NZ, 00112$
;main.c:80: wait_vbl_done();
	call	_wait_vbl_done
;main.c:82: if(joypad() & J_START)
	call	_joypad
	ld	a, e
	rlca
	jr	NC, 00115$
;main.c:84: gameInit();
	call	_gameInit
;main.c:85: atTitleScreen = 0;
	ld	hl, #_atTitleScreen
	ld	(hl), #0x00
	jr	00115$
00112$:
;main.c:88: else if(gameIsOver == 0)
	ld	a, (#_gameIsOver)
	or	a, a
	jr	NZ, 00109$
;main.c:90: checkInput();
	call	_checkInput
;main.c:93: wait_vbl_done();
	call	_wait_vbl_done
;main.c:95: moveEnemySprite();
	call	_moveEnemySprite
;main.c:97: checkForHeartCollision();
	call	_checkForHeartCollision
;main.c:98: scrollScreen();
	call	_scrollScreen
;main.c:100: tryRespawnHeart();
	call	_tryRespawnHeart
;main.c:101: decrementHealthOverTime();
	call	_decrementHealthOverTime
	jr	00115$
00109$:
;main.c:103: else if(gameOverScreenInit == 0)
	ld	a, (#_gameOverScreenInit)
	or	a, a
	jr	NZ, 00106$
;main.c:105: InitGameOver();
	call	_InitGameOver
	jr	00115$
00106$:
;main.c:110: wait_vbl_done();
	call	_wait_vbl_done
;main.c:112: if(joypad() & J_A)
	call	_joypad
	bit	4, e
	jr	Z, 00115$
;main.c:114: InitTitleScreen();
	call	_InitTitleScreen
;main.c:115: atTitleScreen = 1;
	ld	hl, #_atTitleScreen
	ld	(hl), #0x01
;main.c:119: }
	jr	00115$
;main.c:121: void InitTitleScreen()
;	---------------------------------
; Function InitTitleScreen
; ---------------------------------
_InitTitleScreen::
;main.c:124: set_bkg_data(0, 22, gameOverTiles);		
	ld	hl, #_gameOverTiles
	push	hl
	ld	a, #0x16
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_data
	add	sp, #4
;main.c:125: set_bkg_tiles(0,0, titleScreenWidth, titleScreenHeight, titleScreen);
	ld	hl, #_titleScreen
	push	hl
	ld	de, #0x1214
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;main.c:127: player[0] = 95;
	ld	hl, #_player
	ld	(hl), #0x5f
;main.c:128: player[1] = 55;
	ld	hl, #(_player + 0x0001)
	ld	(hl), #0x37
;main.c:129: movePlayerSprite();
	call	_movePlayerSprite
;main.c:132: enemy[0] = 200;	// move offscreen
	ld	hl, #_enemy
	ld	(hl), #0xc8
;main.c:133: enemy[1] = 200;
	ld	hl, #(_enemy + 0x0001)
	ld	(hl), #0xc8
;main.c:134: moveEnemySprite();
;main.c:135: }
	jp  _moveEnemySprite
;main.c:137: void InitGameOver()
;	---------------------------------
; Function InitGameOver
; ---------------------------------
_InitGameOver::
;C:/gbdk/include/gb/gb.h:761: SCX_REG=x, SCY_REG=y;
	ld	a, #0x00
	ldh	(_SCX_REG+0),a
	ld	a, #0x00
	ldh	(_SCY_REG+0),a
;main.c:140: set_bkg_data(0, 22, gameOverTiles);		
	ld	hl, #_gameOverTiles
	push	hl
	ld	a, #0x16
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_data
	add	sp, #4
;main.c:141: set_bkg_tiles(0,0, gameOverMapWidth, gameOverMapHeight, gameOverMap);
	ld	hl, #_gameOverMap
	push	hl
	ld	de, #0x1214
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;main.c:143: player[0] = 85;
	ld	hl, #_player
	ld	(hl), #0x55
;main.c:144: player[1] = 70;
	ld	hl, #(_player + 0x0001)
	ld	(hl), #0x46
;main.c:146: enemy[0] = 105;
	ld	hl, #_enemy
	ld	(hl), #0x69
;main.c:147: enemy[1] = 70;
	ld	hl, #(_enemy + 0x0001)
	ld	(hl), #0x46
;main.c:149: movePlayerSprite();
	call	_movePlayerSprite
;main.c:150: moveEnemySprite();
	call	_moveEnemySprite
;main.c:152: gameOverScreenInit = 1;
	ld	hl, #_gameOverScreenInit
	ld	(hl), #0x01
;main.c:153: }
	ret
;main.c:155: void init() {
;	---------------------------------
; Function init
; ---------------------------------
_init::
;main.c:157: DISPLAY_ON;		// Turn on the display
	ldh	a, (_LCDC_REG+0)
	or	a, #0x80
	ldh	(_LCDC_REG+0),a
;main.c:159: NR52_REG = 0x8F;	// Turn on the sound
	ld	a, #0x8f
	ldh	(_NR52_REG+0),a
;main.c:160: NR51_REG = 0x11;	// Enable the sound channels
	ld	a, #0x11
	ldh	(_NR51_REG+0),a
;main.c:161: NR50_REG = 0x77;	// Increase the volume to its max
	ld	a, #0x77
	ldh	(_NR50_REG+0),a
;main.c:164: SPRITES_8x16;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x04
	ldh	(_LCDC_REG+0),a
;main.c:168: set_sprite_data(0, 8, sprites);
	ld	hl, #_sprites
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;C:/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0002)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 0x0006)
	ld	(hl), #0x02
	ld	hl, #(_shadow_OAM + 0x000a)
	ld	(hl), #0x04
	ld	hl, #(_shadow_OAM + 0x000e)
	ld	(hl), #0x06
;main.c:180: atTitleScreen = 1;
	ld	hl, #_atTitleScreen
	ld	(hl), #0x01
;main.c:181: InitTitleScreen();
;main.c:182: }
	jp  _InitTitleScreen
;main.c:184: void gameInit(){
;	---------------------------------
; Function gameInit
; ---------------------------------
_gameInit::
;main.c:193: set_bkg_data(0, 13, tiles);		// Load 47 tiles into background memory
	ld	hl, #_tiles
	push	hl
	ld	a, #0x0d
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_data
	add	sp, #4
;main.c:201: set_bkg_tiles(0,0, dungeonWidth, dungeonHeight, dungeon);
	ld	hl, #_dungeon
	push	hl
	ld	de, #0x1220
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;main.c:204: player[0] = 60;
	ld	hl, #_player
	ld	(hl), #0x3c
;main.c:205: player[1] = 60;
	ld	hl, #(_player + 0x0001)
	ld	(hl), #0x3c
;main.c:206: movePlayerSprite();
	call	_movePlayerSprite
;main.c:211: enemy[0] = 200;
	ld	hl, #_enemy
	ld	(hl), #0xc8
;main.c:212: enemy[1] = 80;
	ld	hl, #(_enemy + 0x0001)
	ld	(hl), #0x50
;main.c:213: moveEnemySprite();
	call	_moveEnemySprite
;main.c:215: health = 10;
	ld	hl, #_health
	ld	(hl), #0x0a
;main.c:216: gameIsOver = 0;
	ld	hl, #_gameIsOver
	ld	(hl), #0x00
;main.c:217: gameOverScreenInit = 0;
	ld	hl, #_gameOverScreenInit
	ld	(hl), #0x00
;main.c:218: }
	ret
;main.c:220: void movePlayerSprite(){
;	---------------------------------
; Function movePlayerSprite
; ---------------------------------
_movePlayerSprite::
;main.c:221: move_sprite(0, player[0] - 16, player[1]);
	ld	hl, #(_player + 0x0001)
	ld	b, (hl)
	ld	a, (#_player + 0)
	add	a, #0xf0
	ld	c, a
;C:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:222: move_sprite(1, player[0] - 8,  player[1]);
	ld	hl, #(_player + 0x0001)
	ld	b, (hl)
	ld	a, (#_player + 0)
	add	a, #0xf8
	ld	c, a
;C:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0004)
;C:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:222: move_sprite(1, player[0] - 8,  player[1]);
;main.c:223: }
	ret
;main.c:225: void moveEnemySprite(){
;	---------------------------------
; Function moveEnemySprite
; ---------------------------------
_moveEnemySprite::
;main.c:226: move_sprite(2, enemy[0] - 16, enemy[1]);	// this is probably wrong
	ld	hl, #(_enemy + 0x0001)
	ld	b, (hl)
	ld	a, (#_enemy + 0)
	add	a, #0xf0
	ld	c, a
;C:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0008)
;C:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:227: move_sprite(3, enemy[0] - 8,  enemy[1]);
	ld	hl, #(_enemy + 0x0001)
	ld	b, (hl)
	ld	a, (#_enemy + 0)
	add	a, #0xf8
	ld	c, a
;C:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x000c)
;C:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:227: move_sprite(3, enemy[0] - 8,  enemy[1]);
;main.c:228: }
	ret
;main.c:231: void updateSwitches() {
;	---------------------------------
; Function updateSwitches
; ---------------------------------
_updateSwitches::
;main.c:232: HIDE_WIN;
	ldh	a, (_LCDC_REG+0)
	and	a, #0xdf
	ldh	(_LCDC_REG+0),a
;main.c:233: SHOW_SPRITES;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x02
	ldh	(_LCDC_REG+0),a
;main.c:234: SHOW_BKG;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x01
	ldh	(_LCDC_REG+0),a
;main.c:235: }
	ret
;main.c:237: void decrementHealthOverTime(){
;	---------------------------------
; Function decrementHealthOverTime
; ---------------------------------
_decrementHealthOverTime::
;main.c:239: if(health <= 0){
	ld	hl, #_health
	ld	a, (hl)
;main.c:240: health = 0;
	or	a,a
	jr	NZ, 00102$
	ld	(hl),a
;main.c:241: gameIsOver = 1;
	ld	hl, #_gameIsOver
	ld	(hl), #0x01
;main.c:242: return;
	ret
00102$:
;main.c:246: if(healthFrameCounter > framesBetweenHealthDecrement){
	ld	a, (#_framesBetweenHealthDecrement)
	ld	hl, #_healthFrameCounter
	sub	a, (hl)
	jr	NC, 00104$
;main.c:248: healthFrameCounter = 0;
	ld	(hl), #0x00
;main.c:249: health--;
	ld	hl, #_health
	dec	(hl)
	ret
00104$:
;main.c:253: healthFrameCounter++;
	ld	hl, #_healthFrameCounter
	inc	(hl)
;main.c:256: }
	ret
;main.c:258: void checkInput() {
;	---------------------------------
; Function checkInput
; ---------------------------------
_checkInput::
;main.c:260: if (joypad() & J_B) {
	call	_joypad
;main.c:271: if (joypad() & J_UP) 
	call	_joypad
	bit	2, e
	jr	Z, 00106$
;main.c:273: if(player[1] > 17){
	ld	bc, #_player+1
	ld	a, (bc)
	ld	e, a
	ld	a, #0x11
	sub	a, e
	jr	NC, 00106$
;main.c:274: player[1]--;
	ld	a, e
	dec	a
	ld	(bc), a
;main.c:275: movePlayerSprite();
	call	_movePlayerSprite
00106$:
;main.c:280: if (joypad() & J_DOWN) 
	call	_joypad
	bit	3, e
	jr	Z, 00110$
;main.c:282: if(player[1] < 136){
	ld	bc, #_player+1
	ld	a, (bc)
	cp	a, #0x88
	jr	NC, 00110$
;main.c:283: player[1]++;
	inc	a
	ld	(bc), a
;main.c:284: movePlayerSprite();
	call	_movePlayerSprite
00110$:
;main.c:289: if (joypad() & J_LEFT) 
	call	_joypad
	bit	1, e
	jr	Z, 00114$
;main.c:291: if(player[0] > 24){
	ld	bc, #_player+0
	ld	a, (bc)
	ld	e, a
	ld	a, #0x18
	sub	a, e
	jr	NC, 00114$
;main.c:292: player[0]--;
	ld	a, e
	dec	a
	ld	(bc), a
;main.c:293: movePlayerSprite();
	call	_movePlayerSprite
00114$:
;main.c:298: if (joypad() & J_RIGHT) 
	call	_joypad
	ld	a, e
	rrca
	ret	NC
;main.c:300: if(player[0] < 168){
	ld	bc, #_player+0
	ld	a, (bc)
	cp	a, #0xa8
	ret	NC
;main.c:301: player[0]++;
	inc	a
	ld	(bc), a
;main.c:302: movePlayerSprite();
;main.c:307: }
	jp  _movePlayerSprite
;main.c:309: void scrollScreen()
;	---------------------------------
; Function scrollScreen
; ---------------------------------
_scrollScreen::
	add	sp, #-4
;main.c:314: if(health > 11){
	ld	a, #0x0b
	ld	hl, #_health
	sub	a, (hl)
	jr	NC, 00102$
;main.c:315: enemy[0]+= 5;
	ld	bc, #_enemy+0
	ld	a, (bc)
	add	a, #0x05
	ld	(bc), a
	jr	00103$
00102$:
;main.c:317: enemy[0]++;
	ld	bc, #_enemy+0
	ld	a, (bc)
	inc	a
	ld	(bc), a
00103$:
;main.c:321: if(enemy[0] < 5 && scrollPos > 10)
	ld	bc, #_enemy+0
	ld	a, (bc)
	sub	a, #0x05
	jr	NC, 00105$
	ld	a, #0x0a
	ld	hl, #_scrollPos
	sub	a, (hl)
	jr	NC, 00105$
;main.c:323: setNewHeartYPos();
	push	bc
	call	_setNewHeartYPos
	pop	bc
00105$:
;main.c:327: if(health <= 0){
	ld	a, (#_health)
	or	a, a
;main.c:328: return;
	jp	Z,00117$
;main.c:331: i = 10 - health;
	ld	hl, #_health
	ld	e, (hl)
	ld	d, #0x00
	ld	a, #0x0a
	sub	a, e
	ld	e, a
	ld	a, #0x00
	sbc	a, d
	ld	hl, #_i
	ld	(hl), e
	inc	hl
	ld	(hl), a
	rla
	sbc	a, a
	inc	hl
	ld	(hl+), a
	ld	(hl), a
;main.c:333: if(i < 0)
	ld	hl, #_i
	ld	a, (hl)
	sub	a, #0x00
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00149$
	bit	7, d
	jr	NZ, 00150$
	cp	a, a
	jr	00150$
00149$:
	bit	7, d
	jr	Z, 00150$
	scf
00150$:
	jr	NC, 00113$
;main.c:335: i = abs(i);
	ld	hl, #_i + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	bc
	push	de
	call	_abs
	add	sp, #2
	pop	bc
	ld	hl, #_i
	ld	(hl), e
	ld	a, d
	inc	hl
	ld	(hl), a
	rla
	sbc	a, a
	inc	hl
	ld	(hl+), a
	ld	(hl), a
;main.c:336: scroll_bkg(i,0);
	ld	hl, #_i
	ld	e, (hl)
	ld	d, e
;C:/gbdk/include/gb/gb.h:775: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCX_REG+0)
	add	a, d
	ldh	(_SCX_REG+0),a
;main.c:337: scrollPos += i;
	ld	hl, #_scrollPos
	ld	a, (hl)
	add	a, e
	ld	(hl), a
;main.c:338: enemy[0]-= i;
	ld	a, (bc)
	sub	a, e
	ld	(bc), a
	jr	00117$
00113$:
;main.c:344: if(shouldScrollCounter >= i){
	ld	a, (#_shouldScrollCounter)
	ldhl	sp,	#0
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl+), a
	ld	(hl+), a
	ld	(hl), a
	ldhl	sp,	#0
	ld	e, l
	ld	d, h
	ld	hl, #_i
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00151$
	bit	7, d
	jr	NZ, 00152$
	cp	a, a
	jr	00152$
00151$:
	bit	7, d
	jr	Z, 00152$
	scf
00152$:
	jr	C, 00110$
;C:/gbdk/include/gb/gb.h:775: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCX_REG+0)
	inc	a
	ldh	(_SCX_REG+0),a
;main.c:346: scrollPos += 1;
	ld	hl, #_scrollPos
	inc	(hl)
;main.c:347: shouldScrollCounter = 0;
	ld	hl, #_shouldScrollCounter
	ld	(hl), #0x00
;main.c:349: enemy[0]--;
	ld	a, (bc)
	dec	a
	ld	(bc), a
	jr	00117$
00110$:
;main.c:352: shouldScrollCounter++;
	ld	hl, #_shouldScrollCounter
	inc	(hl)
00117$:
;main.c:374: }
	add	sp, #4
	ret
;main.c:376: void checkForHeartCollision()
;	---------------------------------
; Function checkForHeartCollision
; ---------------------------------
_checkForHeartCollision::
;main.c:378: if(collisionCheck(player[0], player[1], 16, 16, enemy[0], enemy[1], 16, 16) == 1) 
	ld	hl, #(_enemy + 0x0001)
	ld	b, (hl)
	ld	hl, #_enemy
	ld	c, (hl)
	ld	de, #_player+0
	ld	l, e
	ld	h, d
	inc	hl
	ld	h, (hl)
	ld	a, (de)
	ld	d, a
	ld	a, #0x10
	push	af
	inc	sp
	ld	a, #0x10
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	b, c
	ld	c, #0x10
	push	bc
	ld	a, #0x10
	push	af
	inc	sp
	ld	l, d
	push	hl
	call	_collisionCheck
	add	sp, #8
	dec	e
	ret	NZ
;main.c:381: enemy[1] = 200; // hide off screen
	ld	hl, #(_enemy + 0x0001)
	ld	(hl), #0xc8
;main.c:382: timerToRespawnHeart = 100;
	ld	hl, #_timerToRespawnHeart
	ld	(hl), #0x64
;main.c:385: health += 6;
	ld	hl, #_health
	ld	a, (hl)
	add	a, #0x06
	ld	(hl), a
;main.c:387: if(health > 18){
	ld	a, #0x12
	sub	a, (hl)
	ret	NC
;main.c:388: health = 18;
	ld	(hl), #0x12
;main.c:391: }
	ret
;main.c:393: void tryRespawnHeart(){
;	---------------------------------
; Function tryRespawnHeart
; ---------------------------------
_tryRespawnHeart::
;main.c:395: if(enemy[1] >= 200){
	ld	bc, #_enemy+0
	ld	a, (#(_enemy + 0x0001) + 0)
	sub	a, #0xc8
	ret	C
;main.c:397: timerToRespawnHeart--;
	ld	hl, #_timerToRespawnHeart
;main.c:399: if(timerToRespawnHeart <= 0)
	dec	(hl)
	ret	NZ
;main.c:403: if(scrollPos > 128){
	ld	a, #0x80
	ld	hl, #_scrollPos
	sub	a, (hl)
	jr	NC, 00102$
;main.c:404: enemy[0] = 50;
	ld	a, #0x32
	ld	(bc), a
	jp	_setNewHeartYPos
00102$:
;main.c:407: enemy[0] = 200;
	ld	a, #0xc8
	ld	(bc), a
;main.c:412: setNewHeartYPos();
;main.c:415: }
	jp  _setNewHeartYPos
;main.c:417: void setNewHeartYPos(){
;	---------------------------------
; Function setNewHeartYPos
; ---------------------------------
_setNewHeartYPos::
;main.c:419: enemy[1] = rand_range(17, 136); // move up down somewhere
	ld	bc, #_enemy+1
	push	bc
	ld	de, #0x8811
	push	de
	call	_rand_range
	add	sp, #2
	ld	a, e
	pop	bc
	ld	(bc), a
;main.c:422: while(enemy[1] > 136 || enemy[1] < 17){
00102$:
	ld	a, (bc)
	ld	e, a
	ld	a, #0x88
	sub	a, e
	jr	C, 00103$
	ld	a, e
	sub	a, #0x11
	ret	NC
00103$:
;main.c:423: enemy[1] += rand_range(17, 136);
	push	bc
	push	de
	ld	de, #0x8811
	push	de
	call	_rand_range
	add	sp, #2
	ld	a, e
	pop	de
	pop	bc
	add	a, e
	ld	(bc), a
;main.c:425: }
	jr	00102$
;main.c:429: UINT8 collisionCheck(UINT8 x1, UINT8 y1, UINT8 w1, UINT8 h1, UINT8 x2, UINT8 y2, UINT8 w2, UINT8 h2) {
;	---------------------------------
; Function collisionCheck
; ---------------------------------
_collisionCheck::
	add	sp, #-4
;main.c:431: if ((x1 < (x2+w2)) && ((x1+w1) > x2) && (y1 < (h2+y2)) && ((y1+h1) > y2)) 
	ldhl	sp,	#10
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ldhl	sp,	#12
	ld	c, (hl)
	ld	b, #0x00
	pop	hl
	push	hl
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
	ldhl	sp,	#6
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#2
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00129$
	bit	7, d
	jr	NZ, 00130$
	cp	a, a
	jr	00130$
00129$:
	bit	7, d
	jr	Z, 00130$
	scf
00130$:
	jp	NC, 00102$
	ldhl	sp,	#8
	ld	a, (hl)
	ld	e, #0x00
	add	a, c
	ld	c, a
	ld	a, e
	adc	a, b
	ld	b, a
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, c
	inc	hl
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00131$
	bit	7, d
	jr	NZ, 00132$
	cp	a, a
	jr	00132$
00131$:
	bit	7, d
	jr	Z, 00132$
	scf
00132$:
	jr	NC, 00102$
	ldhl	sp,	#13
	ld	c, (hl)
	ld	b, #0x00
	dec	hl
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	pop	hl
	push	hl
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
	ldhl	sp,	#7
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#2
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00133$
	bit	7, d
	jr	NZ, 00134$
	cp	a, a
	jr	00134$
00133$:
	bit	7, d
	jr	Z, 00134$
	scf
00134$:
	jr	NC, 00102$
	ldhl	sp,	#9
	ld	a, (hl)
	ld	e, #0x00
	add	a, c
	ld	c, a
	ld	a, e
	adc	a, b
	ld	b, a
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, c
	inc	hl
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00135$
	bit	7, d
	jr	NZ, 00136$
	cp	a, a
	jr	00136$
00135$:
	bit	7, d
	jr	Z, 00136$
	scf
00136$:
	jr	NC, 00102$
;main.c:433: return 1;
	ld	e, #0x01
	jr	00107$
00102$:
;main.c:437: return 0;
	ld	e, #0x00
00107$:
;main.c:439: }
	add	sp, #4
	ret
;main.c:441: UINT8 rand_range(UINT8 min_n, UINT8 max_n)
;	---------------------------------
; Function rand_range
; ---------------------------------
_rand_range::
	add	sp, #-2
;main.c:443: return rand() % (max_n - min_n + 1) + min_n;
	call	_rand
	inc	sp
	inc	sp
	push	de
	ldhl	sp,	#5
	ld	c, (hl)
	ld	b, #0x00
	dec	hl
	ld	e, (hl)
	ld	d, #0x00
	ld	a, c
	sub	a, e
	ld	c, a
	ld	a, b
	sbc	a, d
	ld	b, a
	inc	bc
	push	bc
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	__modsint
	add	sp, #4
	ldhl	sp,	#4
	ld	a, (hl)
	add	a, e
	ld	e, a
;main.c:444: }
	add	sp, #2
	ret
	.area _CODE
	.area _CABS (ABS)
