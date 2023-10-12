
/// @param {Struct} posFrom
/// @param {Struct} posTo
/// @param {Any} drawColour
/// @param {Real} drawZ

/// @returns {Struct}

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

/// @param {Struct} origin
/// @param {String} text
/// @param {Any} drawColour
/// @param {Real} drawZ

/// @returns {Struct}

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

/// @param {Struct} origin
/// @param {String} text
/// @param {Any} drawColour
/// @param {Real} drawZ

/// @returns {Struct}

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

/// @returns {Real}

function queueGetIndex()
{
	return oRenderManager.characterGrid.getNextIndex();
}

/// @param {Real} index
/// @param {Any} queue 

function queueSubmit(index, queue)
{
	oRenderManager.characterGrid.queue[index] = queue;	
}
