/// @description Handle the terminal

// Get input from the player

if(keyboard_check(vk_anykey))
{
	if(string_length(keyboard_string) > maximumLength - string_length(initialText) - 1)
	{
		keyboard_string = string_copy(keyboard_string, 1, maximumLength - string_length(initialText) - 1)
	}

	if(keyboard_check_pressed(vk_backspace) && string_length(keyboard_string) > 0)
	{
		keyboard_string = string_copy(keyboard_string, 1, string_length(keyboard_string));
	}

	var input = string_lower(keyboard_string);

	if(!justCleared && !keyboard_check_pressed(confirmCharacter))
	{
		array_pop(terminalQueue);	
	}
	else
	{
		justCleared = false;	
	}
	
	// Run the input

	if(keyboard_check_pressed(confirmCharacter))
	{
		log(input, currentLine)	
		
		switch(input)
		{
			case "":
			
			break;
		}
	
		keyboard_string = "";
		input = "";
		currentLine += 2;
	}

	// Update the screenspace

	array_push(terminalQueue, createText({x : 0, y : currentLine - 1}, initialText + input, COLOUR_WHITE, 100));

	if(currentLine >= 25)
	{
		clear();
	}
}


queueSubmit(queueIndex, terminalQueue);
