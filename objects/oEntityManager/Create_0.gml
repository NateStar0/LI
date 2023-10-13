/// @description 

queueIndex = queueGetIndex();
queueList = [];

colour = COLOUR_WHITE;

enemy = function (posIndex, form, text)
{
	return 	{
		type : entityType.enemy,
		data : 
		{
			position :
			{
				x : posIndex.x,
				y : posIndex.y
			},
			
			type : form,
			hp : form + 2,
			
			timer : (form + 1) * 60,
			timerReset : (form + 1) * 60,
		},
		
		sprite : text
	}
}

bulletBad = function (posIndex, dir, form)
{
	return 	{
		type : entityType.bulletHostile,
		data : 
		{
			position :
			{
				x : posIndex.x,
				y : posIndex.y
			},
			
			direction:
			{
				x : dir.x,
				y : dir.y
			},
			
			timer : (form + 1) * 60,
			timerReset : (form + 1) * 60,
		},
		
		sprite : "v"
	}
}

bulletGood = function (posIndex, dir)
{
	return 	{
		type : entityType.bulletFriendly,
		data : 
		{
			position :
			{
				x : posIndex.x,
				y : posIndex.y
			},
			
			direction:
			{
				x : dir.x,
				y : dir.y
			},
			
			timer :  60 / 2,
			timerReset : 60 / 2,
		},
		
		sprite : "v"
	}
}

wall = function(topLeft, bottomRight)
{
	return 	{
		type : entityType.collider,
		data : 
		{
			to :
			{
				x : topLeft.x,
				y : topLeft.y
			},
			
			from :
			{
				x : bottomRight.x,
				y : bottomRight.y
			}
		}
	}
}

entities = [
	{
		type : entityType.player,
		data : 
		{
			position :
			{
				x : 40,
				y : 13
			},
			
			hp : 5,
			
			mode : fireType.basic
		},
		sprite : "@"
	},
	
	wall({x : 36, y:0}, {x : 37, y : 24}),
	wall({x : 78, y:0}, {x : 79, y : 24}),
]

/// @param {Array} arr
/// @param {Real} ind
/// @returns {Array<Any*>}

function arrayRemoveElement(arr, ind)
{
	var temp = [];
	
	for(var i = 0; i < array_length(arr); i++)
	{
		if(ind != i)
		{
			array_push(temp, arr[i])
		}
	}
	
	return temp
}

/// @param {Struct} position
/// @param {Real} index
/// @returns {Bool}

isFilled = function(position, index)
{
	for(var i = 0; i < array_length(entities); i++)
	{
		if(i != index)
		{
			// Check based on type here!
			
			switch(entities[i].type)
			{
				case entityType.collider:
					if(point_in_rectangle(position.x, position.y, entities[i].data.to.x, entities[i].data.to.y, entities[i].data.from.x, entities[i].data.from.y))
					{
						return true;	
					}
				break;
				
				case entityType.enemy:
				case entityType.player:
					if(position.x == entities[i].data.position.x && position.y == entities[i].data.position.y)
					{
						return true;	
					}
				break;
			}
		}
	}
	
	return false;
}
