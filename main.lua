--Pokemon For Blind People
--See LICENSE
dofile("settings.lua")


gameData = {} --memory locations
gameData["map"] = 0xD35D
gameData["player_pos"] = 0xD360
gameData["dlg"] = 0xC4B8
gameData["dlg_load"] = 0x1968
gameData["dlg_scroll"] = 0x1882
gameData["dlg_end"] = 0x187B
gameData["text_width"] = 18

dofile("locale.lua")
dofile("helpers.lua")

--read a string from the game's memory and convert to ascii
function getString(address,length)
	local s = memory.readbyterange(address, length)
	s = map(PtoASCII,s)
	s = map(string.char,s)
	s = table.concat(s)
	return s
end

--get a line of text from the dialog box at the bottom of the screen
function getText(i)
	return string.gsub(trim(getString(gameData["dlg"]+1 + i*(gameData["text_width"]+2) , gameData["text_width"])),"%a+%p?",replacements)..""
end

readTwoLines = true --read two lines when the dialog box first comes up

--functions for outputting dialog text
--TODO: improve this and fix text during battles! find better places to hook?
function displayStrings()
	if(readTwoLines) then
		print(getText(0) .. " " .. getText(2))
	else
		print(getText(2))
	end

	if(getText(0)=="") then
		return false
	else
		return true
	end

end

function load()
	readTwoLines = not displayStrings()
end

function scroll()
	displayStrings()
	readTwoLines = true
end

--announce that the player is entering a new map
function announceLocation()
	local b = memory.readbyte(gameData["map"])
	print(loc["entering"] .. locations[b] .. ".")
end

--show the player's current position
function showPosition()
	local y = memory.readbytesigned(gameData["player_pos"])
	local x = memory.readbytesigned(gameData["player_pos"]+1)
	print(x .. ", " .. y)
end

function mainLoop()
	processKeyboard()
end

keys=input.get()
function processKeyboard()
	local newKeys = input.get()
	if(newKeys[settings.keys.position] and not keys[settings.keys.position]) then
		showPosition()
	end
	keys=newKeys
end


--execute main loop every frame
vba.registerafter(mainLoop)

--hook to announce location on map change
memory.registerwrite(gameData["map"], announceLocation) 

--hooks for outputting dialog text
memory.registerexec(gameData["dlg_load"], load)
memory.registerexec(gameData["dlg_end"], scroll)
memory.registerexec(gameData["dlg_scroll"], scroll)
