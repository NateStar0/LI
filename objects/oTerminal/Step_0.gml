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
		
		var instruction = string_split(input, " ", true);
		var command = array_shift(instruction);
		var operands = instruction;
		
		switch(command)
		{
			case "help":
				currentLine++;
				array_push(terminalQueue, createText({x : 0, y : currentLine - 1}, "Test", terminalColour, 100));
			break;
			
			case "color":
			case "colour":
				if(array_length(operands) > 0)
				{
					var col = operands[0];
					var digitString = string_digits(col);
					
					if(string_length(digitString) == string_length(col))
					{
						var colourIndex = real(col);
						if(col >= 0 && col <= 15)
						{
							terminalColour = global.colourList[col];	
							
							for(var i = 0; i < array_length(terminalQueue); i++)
							{
								if(terminalQueue[i].type == queueType.text)
								{
									terminalQueue[i].data.colour = terminalColour;	
								}
							}
						}
					}
				}
			break;
			
			case "start":
				
			break;
			
			case "up":
				var delta = (array_length(operands) > 0 && isUint(operands[0]) && real(operands[0]) > 0 && real(operands[0]) <=3 ) ? real(operands[0]) : 1;
			
				currentLine++;
				array_push(terminalQueue, createText({x : 0, y : currentLine - 1}, $"Moved {delta} unit up!", terminalColour, 100));
			
				with(oEntityManager)
				{
					for(var i = 0; i < array_length(entities); i++)
					{
						var entity = entities[i];
						
						if(entity.type == entityType.player)
						{
							entities[i].data.position.y = max(0, entities[i].data.position.y - delta);	
						}
					}
				}
			break;
			
			case "down":
				var delta = (array_length(operands) > 0 && isUint(operands[0]) && real(operands[0]) > 0 && real(operands[0]) <=3 ) ? real(operands[0]) : 1;
			
				currentLine++;
				array_push(terminalQueue, createText({x : 0, y : currentLine - 1}, $"Moved {delta} unit down!", terminalColour, 100));
				
				with(oEntityManager)
				{
					for(var i = 0; i < array_length(entities); i++)
					{
						var entity = entities[i];
						
						if(entity.type == entityType.player)
						{
							entities[i].data.position.y = min(24, entities[i].data.position.y + delta);	
						}
					}
				}
			break;
			
			case "left":
				var delta = (array_length(operands) > 0 && isUint(operands[0]) && real(operands[0]) > 0 && real(operands[0]) <=3 ) ? real(operands[0]) : 1;
			
				currentLine++;
				array_push(terminalQueue, createText({x : 0, y : currentLine - 1}, $"Moved {delta} unit left!", terminalColour, 100));
				
				with(oEntityManager)
				{
					for(var i = 0; i < array_length(entities); i++)
					{
						var entity = entities[i];
						
						if(entity.type == entityType.player)
						{
							entities[i].data.position.x = max(0, entities[i].data.position.x - delta);	
						}
					}
				}
			break;
			
			case "right":
				var delta = (array_length(operands) > 0 && isUint(operands[0]) && real(operands[0]) > 0 && real(operands[0]) <=3 ) ? real(operands[0]) : 1;
				
				currentLine++;
				array_push(terminalQueue, createText({x : 0, y : currentLine - 1}, $"Moved {delta} unit right!", terminalColour, 100));
				
				with(oEntityManager)
				{
					for(var i = 0; i < array_length(entities); i++)
					{
						var entity = entities[i];
						
						if(entity.type == entityType.player)
						{
							entities[i].data.position.x = min(80 - 1, entities[i].data.position.x + delta);	
						}
					}
				}
			break;
			
			case "mode":
			
			break;
			
			case "fire":
			
			break;
			
			case "pause":
			
			break;
			
			case "":
			
			break;
		}
	
		keyboard_string = "";
		input = "";
		currentLine += 2;
	}

	// Update the screenspace

	array_push(terminalQueue, createText({x : 0, y : currentLine - 1}, initialText + input, terminalColour, 100));

	if(currentLine >= 25)
	{
		clear();
	}
}


queueSubmit(queueIndex, terminalQueue);
