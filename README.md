# atari8-ham-terminal

A serial terminal program for the atari 8-bits (I am using an Atari 400) to suit my needs for amateur radio.  
This is written in C to be compiled with the awesome cc65 compiler.

See [Theory of Operation](TheoryOfOperation.md).

There are many terminal programs for the atari that are great, but here is what I want to implement here (we'll see what I get to):

- [ ] UTC Clock in the corner of the screen
- [ ] Customizable ATASCII -> ASCII mapping
- [ ] Customizable RS232 settings (All 850 interface module settings, but in a menu!)
- [ ] Saving a log to a file, cassette, or printer
- [ ] Other settings, like disabling keyboard beep or having it beep on tx
- [ ] Customizable multi-page scrollable buffer without saving log
- [ ] Customizable buffer-flushing (flush after each character, after each line)

## APRS Feature Ideas

APRS Mode:

- [ ] APRS packet parsing (maybe using serial-connected GPS also?)
- [ ] APRS packet plotting on a map
- [ ] APRS packet logging to a file or printer & plotting any log on map

- [ ] APRS digipeater?

## Development

To run `compile.sh`, you need:

- bash
- atari-tools
- wget
- atasm

The `compile.sh` script should be run from the root of the repo,
and will download a dos image from online (not mine), assemble hamterm, and add it to the image.  
In the end, you will be left with a bootable atr image `hamterm.atr`.
