
function createRectangle(posFrom, posTo, drawColour, drawZ)
{
	//var ind = oRenderManager.characterGrid.getNextIndex();
	
	return {
		type : queueType.rectangle,
		data : {
		from : posFrom,
		to : posTo,
		colour : drawColour,
		},
		z : drawZ
	}
}

function createText(origin, text, drawColour, drawZ)
{
	//var ind = oRenderManager.characterGrid.getNextIndex();
	
	return {
		type : queueType.text,
		data : {
		from : origin,
		content : text,
		colour : drawColour,
		},
		z : drawZ
	}
}

function createSprite(origin, text, drawColour, drawZ)
{
	//var ind = oRenderManager.characterGrid.getNextIndex();
	
	return {
		type : queueType.sprite,
		data : {
		from : origin,
		content : text,
		colour : drawColour,
		},
		z : drawZ
	}
}

function queueGetIndex()
{
	return oRenderManager.characterGrid.getNextIndex();
}

function queueSubmit(index, queue)
{
	oRenderManager.characterGrid.queue[index] = queue;	
}

function queueAddQueue(queue)
{
	for(var i = 0; i < array_length(queue); i++)
	{
		array_push(oRenderManager.characterGrid.queue, queue[i]);	
	}
}
