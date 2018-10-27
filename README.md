

# <img src="https://raw.githubusercontent.com/blitztide/GB-OBDII/master/gameboy.png" width="50" height="80">  GB-OBDII

GB-OBDII is a hardware/software project where OBD-II scanning functionality is added to a Gameboy or Gameboy Colour, this is done by creating a custom cartridge for the Gameboy and also a custom connector for the OBD-II port which will convert from a gameboy link cable connection to a microcontroller which then converts the commands to something the vehicle will understand

## Introduction
The General overview of the project is as follows:

<img src="https://raw.githubusercontent.com/blitztide/GB-OBDII/master/Block%20Diagram.png">

### Software Required
[RGBDS](https://github.com/rednex/rgbds) - Rednex Game Boy Development System

## Hardware

### Custom GB Cartridge

### Custom OBD-II Connector

## Software

### GB Cartridge firmware

#### Libraries
##### Standard Functions
Included in this library are the following functions:

StrCpy - Copy from DE to HL until 0x00 incrementing HL and DE

MemCpy - Copy from DE to HL for BC bytes

WaitVBlank - Wait until rLY==144 then return

#### Menu System

### Microcontroller firmware

## References
1. [GB ASM Programming Guide](https://eldred.fr/gb-asm-tutorial/index.html)
2. [GBCPU manual](http://marc.rawer.de/Gameboy/Docs/GBCPUman.pdf)
3. [GB Programming Manual](http://www.chrisantonellis.com/files/gameboy/gb-programming-manual.pdf)
