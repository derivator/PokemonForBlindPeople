Pokémon For Blind People
=====================
**Pokémon For Blind People** is a lua script for [VBA-ReRecording](https://code.google.com/p/vba-rerecording/) that aims to make the original Pokémon Game Boy games playable for blind and visually impaired people using a screen reader or similar tools. It does this by reading certain memory locations from the game's RAM and outputting information like displayed text or the player's position to a window that can be read by accessibility software.

Features
-------------
* Support for Pokémon Yellow, should be easily adaptable to Red/Blue (and Gold/Silver with some work)
* Output displayed text in dialog
* Output player position
* Announce location changes
* Supports English and German editions, support for other languages could be added

To-do
---------
* Fix text output in battles
* Complete the list of replacements for abbreviations
* Add more features
  * Output menu text
  * Battle information
  * Announce location of important visual elements (doors, items, etc.)
  * Your idea?

How to help out
-----------------------
* Tell your friends
* Do playtesting
* Send me feature ideas
* Translate location and abbreviation strings (see locale_xx.lua for examples)
* Add support for another language (some Game Boy debugging knowledge required)
* Fix bugs or help with development by adding features/finding the right memory locations to hook (Game Boy debugging knowledge required) 
