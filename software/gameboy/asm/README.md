# <img src="https://raw.githubusercontent.com/blitztide/GB-OBDII/master/gameboy.png" width="50" height="80">  GB-OBDII

## Compiling Gameboy Assembly
To compile a simple gameboy assembly file do the following:
```#/bin/bash
rgbasm -o file.o file.asm
rgblink -o file.gb file.o
rgbfix -v -p 0 file.gb
rm file.o```
