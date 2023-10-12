/// @description 

queueList = [];

for(var i = 0; i < array_length(entities); i++)
{
	var entity = entities[i];
	
	switch(entity.type)	
	{
		case entityType.player:
			
		break;
		
		case entityType.enemy:
		
		break;
		
		case entityType.collider:
		
		break;
		
		case entityType.bulletHostile:
			entities[i].data.timer = max(0, entities[i].data.timer - 1);
			
			if(!entities[i].data.timer)
			{
				//entities[i].data.position.x += entities[i].data.direction.x;
				//entities[i].data.position.y += entities[i].data.direction.y;
				
				entities[i].data.timer = entities[i].data.timerReset
			}
		break;
		
		case entityType.bulletFriendly:
		
		break;
		
	}
	
	array_push(queueList, createText(entity.data.position, entity.sprite, COLOUR_WHITE, 75))
}

queueSubmit(queueIndex, queueList);


