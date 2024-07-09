# Theory of Operation

## I/O

### User Interface

The user interface essentially involves a scrollable terminal.

#### Keyboard

Keyboard input is read byte-by-byte using Atari's CIO handler for the K: device. Bytes are read if available.

#### Screen

The initial thought was to make use of Atari's E: device (Screen Editor) over CIO, but such a route is not conducive to using a custom display list (desired for a separated status bar), and made it difficult to consider the notion of a scrollable buffer.  
The solution is to involve a scrolling-pointer buffer.

There will be a pointer to the bottom line of the screen within
the buffer, and this will be rotated for each coarse vertical
scroll by one line. Likewise, the LMS video memory pointers in the
display list will be updated accordingly.

## [This is incomplete]
