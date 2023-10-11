/// @description 

characterGrid = 
{
	// Properties
	width : 80,
	height : 25,
	
	data : [],
	
	queue : [],
	concatQueue : [],
	
	ind : 0,
	
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
	
	getNextIndex : function()
	{
		var ret = ind;
		ind++;
		
		return ret;
	}
}

characterGrid.generate(characterGrid.width, characterGrid.height);

/*
createRectangle({x : 1, y : 1}, {x : 6, y : 8}, COLOUR_BLUE, 1);
createText({x : 2, y : 2}, "Test!", COLOUR_RED, 2);
*/


rectangleCustomQueue = [];
rectangleQueueIndex = queueGetIndex();

for(var i = 0; i < 64; i++)
{
	var tx = irandom(CHARACTER_COUNT_HORIZONTAL)
	var ty = irandom(CHARACTER_COUNT_VERTICAL)
	
	var w = max(irandom(20), 4)
	var h = max(irandom(12), 4)
	
	var c = irandom(14) + 1;
	
	array_push(rectangleCustomQueue, createRectangle({x : tx, y : ty}, {x : tx + w, y : ty + h}, global.colourList[c], i));
}

queueSubmit(rectangleQueueIndex, rectangleCustomQueue);

