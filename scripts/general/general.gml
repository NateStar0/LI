/// Store all cool general functions

function char(_value, _colour) constructor
{
	value = _value;
	colour = _colour;
}

/**
@desc Returns an real equal to the start +/- the shift value towards the final value

@param {Real}		start
@param {Real}		final
@param {Real}		shift

@return {Real}

*/

function approach(start, final, shift) 
{
	return (start != final) ? ((start < final) ? min(start + shift, final) : max(start - shift, final)) : start;
}

/**
@desc Returns a boolean for whether the weighted chance event occurs

@param {Real}	weight
@return {Bool}

*/

function chance(weight) 
{
	return weight > random(1)
}

/**
	@param	{Real} low
	@param	{Real} high
	@param	{Real} duration
	@param	{Real} offset
	
	@return {Real}
*/

function wave(low, high, duration, offset) 
{
	var waveV = (high - low) * 0.5;
	return low + waveV + sin((((current_time * 0.001) + duration * offset) / duration) * (pi * 2)) * waveV;
}


function log() 
{
	var str = "";
	for(var i = 0; i < argument_count; i++)
	{
	  str += string(argument[i]) + " ";
	}
	show_debug_message(str);
}

function pick_weighted(arr)
{
	
	var itemN = 0;
	var itemCount = array_length(arr);
	var items = array_create(itemCount);
	var cmf = array_create(itemCount);
	var total = 0;
	var i = 0;
		
	repeat (itemCount) 
	{
		items[itemN] = arr[i][0];
		total += arr[i][1];
		cmf[itemN] = total;
		itemN++;
		i++
	}
	
	var rand = random(total);
	
	for (var j = 0; j < itemCount; j++) 
	{
		if (rand < cmf[j]) 
		{
			return items[j];
		}
	}
	
	return items[itemCount - 1];
}

function isUint(str)
{
	return (string_length(str) == string_length(string_digits(str)))	
}
