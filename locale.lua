print("Loading locale")
os.setlocale("en_US.ISO-8859-1") --required for correct output on all systems
loc={} --localized strings
trans = {} --pokemon character format map
replacements = {} --replacements for abbreviations, etc.
locations = {} --names for the map numbers


trans[0x00] = 0x20 -- space
trans[0x50] = 0x2B
trans[0x7F] = 0x20 -- space
trans[0x9C] = 0x3A -- :
trans[0xE0] = 0x27 -- '
trans[0xE3] = 0x2D -- -
trans[0xE5] = 0x6D -- cheating 'm
trans[0xE6] = 0x3F -- ?
trans[0xE7] = 0x21 -- !
trans[0xE8] = 0x2E -- .
trans[0xF4] = 0x2C -- ,
trans[0xBD] = 0x73 -- cheating 's
trans[0xBA] = 0xC9 -- é
trans[0xBC] = 0x6C -- cheating 'l
trans[0xBE] = 0x74 -- 't

dofile("locale_en.lua") --just in case
dofile("locale_" .. locale .. ".lua")
