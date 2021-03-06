

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

#### GB Link Cable Adapter
We will be utilising the following GB link cable adapter from PALMR throughout the project, they are available to order through OSH Park.

<img src="https://raw.githubusercontent.com/Palmr/gb-link-cable/master/images/with-headers.jpg">

#### AllPro Adapter

<img src="http://www.obddiag.net/images/allpro/AllPro.png">
The AllPro adapter is an open source OBD-II scanner that supports all ELM327 commands, by utilising this board as our starter board we can save valuable time in development. We can interface into the chip using RS232 Serial from our uController or a PC for debugging.

#### uController converter
This is currently planned to be an ATMega328P due to previous experience with the platform.
We will be using this uController to convert the Gameboy link cable connection to a RS232 connection.

#### Custom PCB
WIP

## Software

### GB Cartridge firmware
#### Menus
WIP
#### Libraries
##### Standard Functions
Included in this library are the following functions:

StrCpy - Copy from DE to HL until 0x00 incrementing HL and DE

MemCpy - Copy from DE to HL for BC bytes

WaitVBlank - Wait until rLY==144 then return

#### Menu System
WIP

### Microcontroller firmware
#### ATMega328P
We Will be using the Arduino bootloader and the ArdOBD library to interface with the AllPro Adapter, We will also use a custom library to interface with the GB Link cable.
##### Flashing
ICSP headers are on the board to program the device using a USBASP.
#### AllPro OBDII
This will use the original firmware provided at [OBDDiag.net](http://www.obddiag.net/allpro.html)
##### Flashing
we can program the AllPro chip using the reccomended tools of a USB-Serial cable and the [Flash Magic](http://www.flashmagictool.com/) Tool. The image file is referenced at the bottom of this document.

## References
1. [GB ASM Programming Guide](https://eldred.fr/gb-asm-tutorial/index.html)
2. [GBCPU manual](http://marc.rawer.de/Gameboy/Docs/GBCPUman.pdf)
3. [GB Programming Manual](http://www.chrisantonellis.com/files/gameboy/gb-programming-manual.pdf)
4. [AllPro](http://www.obddiag.net/allpro.html)
5. [GB Link Cable](https://github.com/Palmr/gb-link-cable)
5. [AllPro Image File](http://www.obddiag.net/allpro/allpro-hex.zip)
6. [Flash magic](http://www.flashmagictool.com/)
7. [GBDev Github](https://github.com/gbdev/awesome-gbdev)
