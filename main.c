#include <gb/gb.h>
//  printf("hello") quickly prints to the tile map
#include <stdio.h>

// lots of includes for random numbers...
#include <time.h>
#include <stdlib.h>

// don't need
#include <gb/font.h>

#include "sprites.c"
#include "dungeon.c"
#include "tiles.c"

#include "gameOverTiles.c"
#include "gameOverMap.c"
#include "titleScreen.c"

void init();
void checkInput();
void updateSwitches();

UINT8 collisionCheck(UINT8, UINT8, UINT8, UINT8, UINT8, UINT8, UINT8, UINT8);
void getTilePosFromPixelPos(UINT8, UINT8);
UINT8 isTileWall(UINT8 x, UINT8 y);
UINT8 canPlayerMoveHere(UINT8 x, UINT8 y, INT8 xTarget, INT8 yTarget);
UINT8 rand_range(UINT8 min_n, UINT8 max_n);

void movePlayerSprite();
void moveEnemySprite();
void checkForHeartCollision();
void scrollScreen();
void decrementHealthOverTime();
void setNewHeartYPos();
void InitGameOver();
void gameInit();

UINT8 tempTilePos[2];

unsigned char tempChar;
INT8 tempX;
INT8 tempY;

INT32 i;
INT32 j;

UINT8 health = 10;
UINT8 framesBetweenHealthDecrement = 45;
UINT8 healthFrameCounter = 0; 

UINT8 framesBetweenScrolling = 0; // 10 is maybe the slowest this should go
UINT8 shouldScrollCounter = 0;

UINT8 scrollPos = 0;

// The player array will hold the player's position as X ([0]) and Y ([1])
UINT8 player[2];

//The enemy array will hold the enemy position as X ([0]) and Y ([1])
UINT8 enemy[2];

UINT8 atTitleScreen = 1;
UINT8 gameIsOver = 0;
UINT8 gameOverScreenInit = 0;

UINT8 timerToRespawnHeart = 0;

void main() {

	init();

	while(1) {
		
		updateSwitches();  // Make sure the SHOW_SPRITES and SHOW_BKG switches are on each loop

		if(atTitleScreen == 1)
		{
			// Wait until VBLANK to avoid corrupting visual memory
			wait_vbl_done();

			if(joypad() & J_START)
			{
				gameInit();
				atTitleScreen = 0;
			}
		}
		else if(gameIsOver == 0)
		{
			checkInput();

			// Wait until VBLANK to avoid corrupting visual memory
			wait_vbl_done();

			moveEnemySprite();
				
			checkForHeartCollision();
			scrollScreen();

			tryRespawnHeart();
			decrementHealthOverTime();
		}
		else if(gameOverScreenInit == 0)
		{
			InitGameOver();
		}
		else
		{
			// Wait until VBLANK to avoid corrupting visual memory
			wait_vbl_done();

			if(joypad() & J_A)
			{
				InitTitleScreen();
				atTitleScreen = 1;
			}
		}
	}
}

void InitTitleScreen()
{
	//move_bkg(0,0);
	set_bkg_data(0, 22, gameOverTiles);		
	set_bkg_tiles(0,0, titleScreenWidth, titleScreenHeight, titleScreen);

	player[0] = 95;
	player[1] = 55;
	movePlayerSprite();


	enemy[0] = 200;	// move offscreen
	enemy[1] = 200;
	moveEnemySprite();
}

void InitGameOver()
{
	move_bkg(0,0);
	set_bkg_data(0, 22, gameOverTiles);		
	set_bkg_tiles(0,0, gameOverMapWidth, gameOverMapHeight, gameOverMap);

	player[0] = 85;
	player[1] = 70;

	enemy[0] = 105;
	enemy[1] = 70;

	movePlayerSprite();
	moveEnemySprite();

	gameOverScreenInit = 1;
}

void init() {
	
	DISPLAY_ON;		// Turn on the display

	NR52_REG = 0x8F;	// Turn on the sound
	NR51_REG = 0x11;	// Enable the sound channels
	NR50_REG = 0x77;	// Increase the volume to its max

	// special command to declare we are using sprites that are 8x16 
	SPRITES_8x16;


	// Load the the 'sprites' tiles into sprite memory
	set_sprite_data(0, 8, sprites);

	// Set the first movable sprite (0) to be the first tile in the sprite memory (0)
	set_sprite_tile(0, 0); // player
	set_sprite_tile(1, 2);
	//set_sprite_tile(1, 1);

	// Set the second movable sprite (1) to be the second tile in the sprite memory (1)
	set_sprite_tile(2,4);  // enemy
	set_sprite_tile(3,6);  // enemy


	atTitleScreen = 1;
	InitTitleScreen();
}

void gameInit(){

/*
	font_t min_font;
	
	font_init();
	min_font = font_load(font_min);
	font_set(min_font);
*/
    set_bkg_data(0, 13, tiles);		// Load 47 tiles into background memory

	// Use the 'helloWorld' array to write background tiles starting at 0,6 (tile positions)
	//  and write for 10 tiles in width and 2 tiles in height

	// (xpos, ypos, width of map, height of map)  all in tile coordinate values
	//set_bkg_tiles(0,6,10,10,threeBlock);

	set_bkg_tiles(0,0, dungeonWidth, dungeonHeight, dungeon);

	// player position in pixel coordinates
	player[0] = 60;
	player[1] = 60;
	movePlayerSprite();

// pos x:8 y:16 aligns the sprite with the top left corner. 
// So Character positions seem to be calculated from the bottom right of the sprite

	enemy[0] = 200;
	enemy[1] = 80;
	moveEnemySprite();

	health = 10;
	gameIsOver = 0;
	gameOverScreenInit = 0;
}

void movePlayerSprite(){
	move_sprite(0, player[0] - 16, player[1]);
	move_sprite(1, player[0] - 8,  player[1]);
}

void moveEnemySprite(){
	move_sprite(2, enemy[0] - 16, enemy[1]);	// this is probably wrong
	move_sprite(3, enemy[0] - 8,  enemy[1]);
}


void updateSwitches() {
	HIDE_WIN;
	SHOW_SPRITES;
	SHOW_BKG;
}

void decrementHealthOverTime(){

	if(health <= 0){
		health = 0;
		gameIsOver = 1;
		return;
	}


	if(healthFrameCounter > framesBetweenHealthDecrement){

		healthFrameCounter = 0;
		health--;
	}
	else
	{
		healthFrameCounter++;
	}

}

void checkInput() {

    if (joypad() & J_B) {
	// The B button was pressed!

		// Use the 'blankScreen' array to write background tiles starting at 0,0 (tile positions)
		//  and for 20 tiles in width and 18 tiles in height
		//set_bkg_tiles(0,0, dungeonWidth, dungeonHeight, dungeon);
    }

	// sprite is 8 x 16, positions starts at the bottom right corner

	// UP
	if (joypad() & J_UP) 
	{
		if(player[1] > 17){
			player[1]--;
			movePlayerSprite();
		}
	}

	// DOWN
	if (joypad() & J_DOWN) 
	{
		if(player[1] < 136){
			player[1]++;
			movePlayerSprite();
		}
	}

	// LEFT
	if (joypad() & J_LEFT) 
	{
		if(player[0] > 24){
			player[0]--;
			movePlayerSprite();
		}
	}	
	
	// RIGHT
	if (joypad() & J_RIGHT) 
	{
		if(player[0] < 168){
			player[0]++;
			movePlayerSprite();
		}
	}

	
}

void scrollScreen()
{

	// hearts should always move forward a little bit
	
	if(health > 11){
		enemy[0]+= 5;
	}else{
		enemy[0]++;
	}
	
	// when heart loops around the screen, choose a new random Y position
	if(enemy[0] < 5 && scrollPos > 10)
	{
		setNewHeartYPos();
	}

	// don't scroll if health is zero
	if(health <= 0){
		return;
	}

	i = 10 - health;

	if(i < 0)
	{
		i = abs(i);
		scroll_bkg(i,0);
		scrollPos += i;
		enemy[0]-= i;
	}
	else
	{

		// scroll every other frame
		if(shouldScrollCounter >= i){
			scroll_bkg(1,0);
			scrollPos += 1;
			shouldScrollCounter = 0;

			enemy[0]--;
			
		}else{
			shouldScrollCounter++;
		}


	}






	

//	if(player[0] > 120){
		
//		player[0]--;
//	}

//	if(player[0] < 60){
//		scroll_bkg(-1,0);
//		player[0]++;
//	}
}

void checkForHeartCollision()
{
	if(collisionCheck(player[0], player[1], 16, 16, enemy[0], enemy[1], 16, 16) == 1) 
	{

		enemy[1] = 200; // hide off screen
		timerToRespawnHeart = 100;


		health += 6;

		if(health > 18){
			health = 18;
		}
	} 
}

void tryRespawnHeart(){

	if(enemy[1] >= 200){
		
		timerToRespawnHeart--;
		
		if(timerToRespawnHeart <= 0)
		{
			// TODO this could be smarter by using the camera scroll pos
			// to pick a place offscreen
			if(scrollPos > 128){
				enemy[0] = 50;
			}else
			{
				enemy[0] = 200;
			}

			//enemy[0] += player[0] + 80; // move it forward somewhere
			
			setNewHeartYPos();
		}
	}
}

void setNewHeartYPos(){

	enemy[1] = rand_range(17, 136); // move up down somewhere

	// ranges are not working... for some reason. loop is a workaround
	while(enemy[1] > 136 || enemy[1] < 17){
		enemy[1] += rand_range(17, 136);
	}
}

// Check if two rectangles from x1,y1, and extending out h1, h2, 
// overlap with another, x2,y2, and extending out w2, h2
UINT8 collisionCheck(UINT8 x1, UINT8 y1, UINT8 w1, UINT8 h1, UINT8 x2, UINT8 y2, UINT8 w2, UINT8 h2) {

	if ((x1 < (x2+w2)) && ((x1+w1) > x2) && (y1 < (h2+y2)) && ((y1+h1) > y2)) 
	{
		return 1;
	} 
	else 
	{	
		return 0;
	}
}

UINT8 rand_range(UINT8 min_n, UINT8 max_n)
{
    return rand() % (max_n - min_n + 1) + min_n;
}

/*
Note: There is a hard limit to the number of moving sprites at a time set at 20 (0 – 19) 
with only 10 sprites moving per line. GBDK stores addresses for these moving sprites, 
which can be accessed through the set_sprite_tile function. To move larger sets of tiles 
at a time, especially in the case of larger visual sprites, multiple calls to set_sprite_tile are needed.
*/






/*
UINT8 isTileWall(UINT8 x, UINT8 y)
{
	i = x + (y * dungeonWidth);
	tempChar = dungeon[i];

//	move_sprite(2, x * 8, y * 8);

	if (tempChar == 0x00 || 
		tempChar == 0x01 ||
		tempChar == 0x02 ||
		tempChar == 0x03 ||
		tempChar == 0x04 ||
		tempChar == 0x05 ||
		tempChar == 0x06 ||
		tempChar == 0x07)
	{
		return 1;
	}
	else
	{
		return 0;
	}
}

*/


/*

void getTilePosFromPixelPos(UINT8 x, UINT8 y)
{
	// tiles are 8x8
	tempTilePos[0] = x / 8;
	tempTilePos[1] = y / 8;
} 

*/



/*
UINT8 canPlayerMoveHere(UINT8 x, UINT8 y, INT8 xTarget, INT8 yTarget)
{
	// Is the player colliding with the enemy?
	if(collisionCheck(x + xTarget, y + yTarget, 8, 16, enemy[0], enemy[1], 16, 16) == 1) 
	{
		return 0;
	} 

	tempX = 0;
	tempY = 0;

	if(xTarget < 0){
		tempX = -24;	// offset to shift width of char sprite when moving left
	}
	else if(xTarget > 0){
		tempX = -8;	// offset for some reason
	}

	if(yTarget < 0){
		tempY = -16; // offset to shift height of char sprite when moving down
	}

	// saves the tile that the player is moving into
	getTilePosFromPixelPos(x + xTarget + tempX, y + yTarget + tempY);

//	printf(tempTilePos[0] + " " + tempTilePos[1]);

	// is colliding with wall
	if(isTileWall(tempTilePos[0], tempTilePos[1]) == 1)
	{
		if(collisionCheck(x + xTarget + tempX, y + yTarget + tempY, 0, 16, tempTilePos[0] * 8, tempTilePos[1] * 8, 8, 8) == 1) 
		{
			return 0;
		}
	}

	return 1;	
}
*/