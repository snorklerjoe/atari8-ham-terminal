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

## Using my code in your stuff

It took a while for me to figure some of these things out (that may be my being fairly new to 6502 assembly...), so I would be thrilled if it was somehow helpful to anyone else. Please include the [license / copyright notice](./LICENSE) if you do use any "substantial portion", as per the MIT License.

But there are examples of VBI/DLI stuff, [Atari CIO calls](./src/cio.m65), and some ATASM/M65 [utility macros](./src/utils.m65):

- 16-bit increment/decrement
- 16-bit minus 8-bit subtraction
- 16-bit plus 8-bit addition

I would be thrilled if any of this was helpful to someone else!

## References

I learned a lot during this project (and as of this writing I've still a long way to go on it...), and that wouldn't have been possible in the same capacity and efficiency if not for these amazing sites:

- [Mapping The Atari](https://www.atariarchives.org/mapping/)
  - [ATASCII/INTERNAL CHAR CODE table](https://www.atariarchives.org/mapping/appendix10.php)
- [Michael Steil's 6502 reference](https://www.pagetable.com/c64ref/6502/)
- [Super handy and easy to follow DLI/VBI/Scrolling tutorials by Rob McMullen](https://playermissile.com/#tutorials)
- [CC65 Atari lib src](https://github.com/cc65/cc65/tree/master/libsrc/atari)
- [Atari OS Source Listing](https://atariwiki.org/wiki/Wiki.jsp?page=Atari%20800%20ROM%20OS%20Source%20Listing)
