#!/bin/bash
rgbasm -o $1.o $1.asm -i ./include
rgblink -o $1.gb $1.o
rm $1.o
rgbfix -C $1.gb
