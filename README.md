How to compile:

Required: NASM, GCC

Download game.asm from the repo

Run:
nasm -f win32 game.asm -o game.o

gcc game.o -o game.exe -m32 -Wl,-subsystem,console -lkernel32 -Os -s

Optional: strip --strip-all game.exe

Then you can run game.exe

Enjoy!
