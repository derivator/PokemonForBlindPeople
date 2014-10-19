print("Loading locale")
os.setlocale("en_US.ISO-8859-1") --required for correct output on all systems
loc={} --localized strings
trans = {} --pokemon character format map
replacements = {} --replacements for abbreviations, etc.
locations = {} --names for the map numbers


trans[0x00] = 0x20 -- space
trans[0x50] = 0x23
trans[0x7F] = 0x20 -- space
trans[0x9C] = 0x3A -- :
trans[0xE0] = 0x27 -- '
trans[0xE3] = 0x2D -- -
trans[0xE4] = 0x72 -- cheating 'r
trans[0xE5] = 0x6D -- cheating 'm
trans[0xE6] = 0x3F -- ?
trans[0xE7] = 0x21 -- !
trans[0xE8] = 0x2E -- .
trans[0xF0] = 0x24 -- $
trans[0xF4] = 0x2C -- ,
trans[0xBA] = 0xC9 -- é
trans[0xBB] = 0x64 -- cheating 'd
trans[0xBC] = 0x6C -- cheating 'l
trans[0xBD] = 0x73 -- cheating 's
trans[0xBE] = 0x74 -- 't


--for debugging, translate special characters
--in dialog, these are translated by the game itself
trans[0x51] = 0x2a --dlg_clear : *
trans[0x54] = 0x50 --insert_poke : P
trans[0x55] = 0x20 --dlg_scroll
trans[0x57] = 0x7c --dlg_close : |
trans[0x4f] = 0x20 --newline

dofile("locale_en.lua") --just in case
dofile("locale_" .. locale .. ".lua")
