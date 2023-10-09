/// @description 

array_sort(characterGrid.queue, function(foo, bar) { return foo[1].z - bar[1].z} )

for(var i = 0; i < array_length(characterGrid.queue); i++)
{
	var item = characterGrid.queue[i];
	
	switch(item[0])
	{
		case queueType.rectangle:
			for(var n = item[1].from.x; n < item[1].to.x; n++)
			{
				for(var m = item[1].from.y; m  < item[1].to.y; m++)
				{
					characterGrid.data[n][m] = { value : "#", colour : item[1].colour }
				}
			}
		break;
		
		case queueType.sprite:
		
		break;
		
		case queueType.text:
			for(var n = item[1].from.x; n < item[1].from.x + string_length(item[1].content); n++)
			{
				characterGrid.data[n][item[1].from.y] = { value : string_char_at(item[1].content, n - item[1].from.x + 1), colour : item[1].colour }
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




