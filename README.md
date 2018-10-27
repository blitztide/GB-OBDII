

# <img src="https://raw.githubusercontent.com/blitztide/GB-OBDII/master/gameboy.png" width="50" height="80">  GB-OBDII

GB-OBDII is a hardware/software project where OBD-II scanning functionality is added to a Gameboy or Gameboy Colour, this is done by creating a custom cartridge for the Gameboy and also a custom connector for the OBD-II port which will convert from a gameboy link cable connection to a microcontroller which then converts the commands to something the vehicle will understand

## Introduction
The General overview of the project is as follows:

<img src="https://raw.githubusercontent.com/blitztide/GB-OBDII/master/Block%20Diagram.png">

### Software Required
[RGBDS](https://github.com/rednex/rgbds) - Rednex Game Boy Development System

## Hardware

### Custom GB Cartridge
WIP, not sure if going for fully custom board or a modified MBC5 cartridge with a new flash chip for use in further projects.

### Custom OBD-II Daughterboard
This board will be powered via the OBD-II port and will convert the OBD-II port to RS232 for connection to a PC or the intermediate uController.

#### AllPro Adapter

<img src="http://www.obddiag.net/images/allpro/AllPro.png">
The AllPro adapter is an open source OBD-II scanner that supports all ELM327 commands, by utilising this board as our starter board we can save valuable time in development. We can interface into the chip using RS232 Serial from our uController or a PC for debugging.

#### uController converter
This is currently planned to be an ATMega328P due to previous experience with the platform.
We will be using this uController to convert the Gameboy link cable connection to a RS232 connection.

## Software

### GB Cartridge firmware
#### Menus

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
4. [AllPro](http://www.obddiag.net/allpro.html)
