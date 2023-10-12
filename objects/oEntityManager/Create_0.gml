/// @description 

queueIndex = queueGetIndex();
queueList = [];

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
			
			hp : 5
		},
		sprite : "@"
	}
]

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
			}
		},
		
		sprite : "v"
	}
}

wall = function()
{
	return 	{
		type : entityType.collider,
		data : 
		{
			position :
			{
				x : posIndex.x,
				y : posIndex.y
			},
		},
		
		sprite : "%"
	}
}
