/// @description 

colour = oTerminal.terminalColour;

queueList = [];

for(var i = 0; i < array_length(entities); i++)
{
	var entity = entities[i];
	
	switch(entity.type)	
	{
		case entityType.player:
			
			array_push(queueList, createText(entity.data.position, entity.sprite, colour, 75))
		break;
		
		case entityType.enemy:
			entities[i].data.position.x = clamp(entities[i].data.position.x, 0, 79);
			entities[i].data.position.y = clamp(entities[i].data.position.y, 0, 24);
				
			array_push(queueList, createText(entity.data.position, entity.sprite, colour, 75))
		break;
		
		case entityType.collider:
			array_push(queueList, createRectangle(entity.data.to, entity.data.from, colour, 75))
		break;
		
		case entityType.bulletHostile:
			entities[i].data.timer = max(0, entities[i].data.timer - 1);
			
			if(!entities[i].data.timer)
			{
				entities[i].data.position.x += entities[i].data.direction.x;
				entities[i].data.position.y += entities[i].data.direction.y;
				
				entities[i].data.position.x = clamp(entities[i].data.position.x, 0, 79);
				entities[i].data.position.y = clamp(entities[i].data.position.y, 0, 24);
				
				if(entities[i].data.position.x == 0 || entities[i].data.position.y == 0 || entities[i].data.position.x == 79 || entities[i].data.position.y == 24|| isFilled(entity.data.position, i))
				{
					entities = arrayRemoveElement(entities, i)
				}
				
				entities[i].data.timer = entities[i].data.timerReset
			}
			
			array_push(queueList, createText(entity.data.position, entity.sprite, colour, 75))
		break;
		
		case entityType.bulletFriendly:
			entities[i].data.timer = max(0, entities[i].data.timer - 1);
			
			if(!entities[i].data.timer)
			{
				entities[i].data.position.x += entities[i].data.direction.x;
				entities[i].data.position.y += entities[i].data.direction.y;
				
				entities[i].data.position.x = clamp(entities[i].data.position.x, 0, 79);
				entities[i].data.position.y = clamp(entities[i].data.position.y, 0, 24);
				
				entities[i].data.timer = entities[i].data.timerReset
			}
			
			if(entities[i].data.position.x == 0 || entities[i].data.position.y == 0 || entities[i].data.position.x == 79 || entities[i].data.position.y == 24 || isFilled(entity.data.position, i))
			{
				entities = arrayRemoveElement(entities, i)
			}
			
			array_push(queueList, createText(entity.data.position, entity.sprite, colour, 75))
		break;
		
	}
}

queueSubmit(queueIndex, queueList);
