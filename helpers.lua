--translate pokemon character format to ascii
function PtoASCII(c)
	if trans[c] ~= nil then
		return trans[c]
	end
	
	--most characters are shifted ascii
	if c >= 0xF6 then --number characters
		return c-0xC6
	end	

	if c >= 0xA0 then --lower case letters
		return c-63
	end
	if c >= 0x80 then --upper case letters
		return c-63
	end
	
	return c
end

function map(func, array)
  local new_array = {}
  for i,v in ipairs(array) do
    new_array[i] = func(v)
  end
  return new_array
end


function BytesToString(bytes)
  s = {}
  for i = 1, table.getn(bytes) do
    s[i] = string.char(bytes[i])
  end
  return concat(s)
end

--trim whitespace from both ends of string
function trim(s)
	return s:find'^%s*$' and '' or s:match'^%s*(.*%S)'
end

--print the value of the PC register (instruction pointer)
function printPC()
	local i = memory.getregister("pc")
	print(string.format("%x",i))
end

--print the complete content of the dialog box
function dumpDialog(title)
	local s = getString(gameData.dlg+1 + 0*(gameData.text_width+2) , gameData.text_width)
	s = s .. getString(gameData.dlg+1 + 2*(gameData.text_width+2) , gameData.text_width)
	print(title)
	print(s)
end
