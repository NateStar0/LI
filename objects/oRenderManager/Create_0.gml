/// @description 

characterGrid = 
{
	// Properties
	width : 80,
	height : 25,
	
	data : [],
	
	queue : [],
	
	// Methods
	
	generate : function(w, h)
	{	
		self.data = [];
		
		for(var i = 0; i < w; i++)
		{
			self.data[i] = array_create(h, 0);
			
			for(var j = 0; j < h; j++)
			{
				self.data[i][j] = { value : " ", colour : COLOUR_WHITE }
			}
		}
	},
}

function queueRectangle(posFrom, posTo, drawColour, drawZ)
{
	array_push(characterGrid.queue, 
	[queueType.rectangle, 
	{
		from : posFrom,
		to : posTo,
		colour : drawColour,
		z : drawZ
	}])
}

function queueText(origin, text, drawColour, drawZ)
{
	array_push(characterGrid.queue, 
	[queueType.text, 
	{
		from : origin,
		content : text,
		colour : drawColour,
		z : drawZ
	}])
}

function queueSprite(origin, text, drawColour, drawZ)
{
	array_push(characterGrid.queue, 
	[queueType.sprite, 
	{
		from : origin,
		content : text,
		colour : drawColour,
		z : drawZ
	}])
}

function queueClear()
{
	characterGrid.queue = [];
}

queueRectangle({x : 1, y : 1}, {x : 6, y : 8}, COLOUR_BLUE, 1);

queueText({x : 2, y : 2}, "Test!", COLOUR_RED, 2);

characterGrid.generate(characterGrid.width, characterGrid.height);


