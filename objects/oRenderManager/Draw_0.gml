/// @description 

var newQueue = [];
var itemsCount = 0;

var queueLength = array_length(characterGrid.queue);

for(var i = 0; i < queueLength; i++)
{
	var indivLength = array_length(characterGrid.queue[i]);
	for(var j = 0; j < indivLength; j++)
	{
		array_push(newQueue, characterGrid.queue[i][j]);
		itemsCount++;
	}
}

array_sort(newQueue, function(foo, bar) { return foo.z - bar.z} )

for(var j = 0; j < itemsCount; j++)
{
	var item = newQueue[j];
	
	switch(item.type)
	{
		case queueType.rectangle:
			for(var n = item.data.from.x; n < item.data.to.x; n++)
			{
				for(var m = item.data.from.y; m  < item.data.to.y; m++)
				{
					characterGrid.data[n][m].value = "#";
					characterGrid.data[n][m].colour = item.data.colour;
				}
			}
		break;
	
		case queueType.sprite:
	
		break;
	
		case queueType.text:
			for(var n = item.data.from.x; n < item.data.from.x + string_length(item.data.content); n++)
			{
				characterGrid.data[n][item.data.from.y].value = string_char_at(item.data.content, n - item.data.from.x + 1)
				characterGrid.data[n][item.data.from.y].colour = item.data.colour;
			}
		break;
	}
}

var colour = c_white;

for(var i = 0; i < characterGrid.width; i++)
{
	for(var j = 0; j < characterGrid.height; j++)
	{
		var cell = characterGrid.data[i][j];
		
		if(colour != cell.colour)
		{
			draw_set_colour(cell.colour)
			colour = cell.colour;
		}
		
		draw_text(i * CHARACTER_WIDTH, j * CHARACTER_HEIGHT, cell.value);	
	}
}
