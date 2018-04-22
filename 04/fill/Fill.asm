// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(READ)
  @color
  M=0
  @KBD
  D=M
  @PAINT
  D;JEQ

  @color
  M=-1

(PAINT)
  @8191
  D=A
  @i
  M=D
  @LOOP
  0;JMP

(LOOP)
  @SCREEN
  D=A
  @i
  D=D+M
  @pos
  M=D
  @color
  D=M
  @pos
  A=M
  M=D

  @i
  D=M
  @READ
  D;JEQ
  @i
  M=M-1
  @LOOP
  0;JMP
