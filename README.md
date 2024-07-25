# atari8-ham-terminal

A serial terminal program for the atari 8-bits (I am using an Atari 400) to suit my needs for amateur radio.  
This is written in C to be compiled with the awesome cc65 compiler.

## Implementation Progress

(Because this is still a work-in-progress)

- [X] Basic CIO routines
- [X] High-level keyboard input routines
- [X] Custom display list & DLI, VBI interrupts
- [X] Scrollable text buffer
- [X] High-level display routines
- [ ] High-level Atari 850 routines
- [X] Configuration & Config help
- [ ] Saving/loading config to/from disk
- [ ] Atari 850 connection ui
- [ ] Buffer logging
- [ ] UTC clock
- [ ] RTC extension?
- [ ] High-level TNC communication & interface?
- [ ] APRS functionality?
- [ ] RS232 GPS interface?
- [ ] Arduino-based PSK interface?

See [Theory of Operation](TheoryOfOperation.md).

There are many terminal programs for the atari that are great, but here is what I want to implement here (we'll see what I get to):

- [ ] UTC Clock in the corner of the screen
- [ ] Customizable ATASCII -> ASCII mapping
- [ ] Customizable RS232 settings (All 850 interface module settings, but in a menu!)
- [ ] Saving a log to a file, cassette, or printer
- [ ] Other settings, like disabling keyboard beep or having it beep on tx
- [X] Multi-page scrollable buffer
- [ ] Customizable buffer-flushing (flush after each character, after each line)

## APRS Feature Ideas

APRS Mode:

- [ ] APRS packet parsing (maybe using serial-connected GPS also?)
- [ ] APRS packet plotting on a map
- [ ] APRS packet logging to a file or printer & plotting any log on map

- [ ] APRS digipeater?

## Arduino Future Ideas

After seeing [this blog post by KO7M](http://ko7m.blogspot.com/2015/03/generating-audio-psk31-with-arduino.html), I thought it would be cool to make an Atari PSK interface based around an Arduino (my MFJ TNC doesn't do PSK by default).

## Development

To run `compile.sh`, you need:

- bash
- atari-tools
- wget
- atasm

The `compile.sh` script should be run from the root of the repo,
and will download a dos image from online (not mine), assemble hamterm, and add it to the image.  
In the end, you will be left with a bootable atr image `hamterm.atr`.

**It is much faster to use the atasm-altirra bridge VSCode extension for development-- the Altirra debugger is very helpful.**
