/*
		--- Autorun . GML ---
		
		By Nahoo (9 / 10 / 2023)
		
		
		* Defines globals / macros / enums before instances are able to initialise
*/

randomise();

///			Macros

#macro GAMENAME "LI"

window_set_caption(GAMENAME);

show_debug_overlay(0);

// Visual

#macro WINDOW_WIDTH 640
#macro WINDOW_HEIGHT 300

#macro CHARACTER_WIDTH 8
#macro CHARACTER_HEIGHT 12

#macro CHARACTER_COUNT_HORIZONTAL 80
#macro CHARACTER_COUNT_VERTICAL 25

draw_set_font(fnMain);

// Colours

#macro COLOUR_BLACK				make_color_rgb(0, 0, 0)
#macro COLOUR_RED				make_color_rgb(170, 0, 0)
#macro COLOUR_GREEN				make_color_rgb(0, 170, 0)
#macro COLOUR_YELLOW			make_color_rgb(170, 85, 0)
								
#macro COLOUR_BLUE				make_color_rgb(0, 0, 170)
#macro COLOUR_MAGENTA			make_color_rgb(170, 0, 170)
#macro COLOUR_CYAN				make_color_rgb(0, 170, 170)
#macro COLOUR_WHITE				make_color_rgb(170, 170, 170)
								
#macro COLOUR_BRIGHTBLACK		make_color_rgb(85, 85, 85)
#macro COLOUR_BRIGHTRED			make_color_rgb(255, 85, 85)
#macro COLOUR_BRIGHTGREEN		make_color_rgb(85, 255, 85)
#macro COLOUR_BRIGHTYELLOW		make_color_rgb(255, 255, 85)
								
#macro COLOUR_BRIGHTBLUE		make_color_rgb(85, 85, 255)
#macro COLOUR_BRIGHTMAGENTA		make_color_rgb(255, 85, 255)
#macro COLOUR_BRIGHTCYAN		make_color_rgb(85, 255, 255)
#macro COLOUR_BRIGHTWHITE		make_color_rgb(255, 255, 255)

///			Globals

global.colourList = [
COLOUR_BLACK,		
COLOUR_RED,
COLOUR_GREEN,		
COLOUR_YELLOW,				
COLOUR_BLUE,
COLOUR_MAGENTA,
COLOUR_CYAN,
COLOUR_WHITE,					
COLOUR_BRIGHTBLACK,
COLOUR_BRIGHTRED,
COLOUR_BRIGHTGREEN,
COLOUR_BRIGHTYELLOW,
COLOUR_BRIGHTBLUE,
COLOUR_BRIGHTMAGENTA,
COLOUR_BRIGHTCYAN,
COLOUR_BRIGHTWHITE,
]


///			Enums

enum queueType
{
	rectangle, 
	text,
	sprite,
}

enum entityType
{
	player,
	enemy,
	collider,
	bulletHostile,
	bulletFriendly,
}

enum formType
{
	basic, 	
}