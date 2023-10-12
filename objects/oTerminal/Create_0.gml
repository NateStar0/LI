/// @description Initialise the terminal

startText = "Nahoo's Interface [Version 1.0.0]";
initialText = "> ";

currentLine = 3;
currentInput = "";
confirmCharacter = vk_enter;

maximumLength = 34;

terminalQueue = [];
queueIndex = queueGetIndex();

terminalColour = COLOUR_WHITE;

clear = function()
{
	terminalQueue = [];
	
	currentLine = 1;	
	array_push(terminalQueue, createRectangle({x: 0, y: 0}, {x: maximumLength - 1, y: 25}, COLOUR_BLACK, 98));
	justCleared = true;
}

justCleared = true;

clear();

currentLine = 3;
array_push(terminalQueue, createText({x : 0, y : 0}, startText, terminalColour, 99));

queueSubmit(queueIndex, terminalQueue);
