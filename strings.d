( ----------------------------------------------------------------------
  This file contains source code of D, an interactive compiler
  for MacOS X based on FORTH
  
  Copyright 2002 Daniel Engeler
  www.ee.ethz.ch/~danengel, danengel@ee.ethz.ch
  
  D uses the GNU Readline Library
  Copyright (C) 1988-2001 Free Software Foundation, Inc.
  
  D is free software; you can redistribute it and/or modify it under the
  terms of the GNU General Public License as published by the Free
  Software Foundation; either version 2 of the License, or (at your
  option) any later version.

  D is distributed in the hope that it will be useful, but WITHOUT ANY
  WARRANTY; without even the implied warranty of MERCHANTABILITY or
  FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
  for more details.

  You should have received a copy of the GNU General Public License
  along with D; if not, write to the Free Software Foundation, Inc.
  59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
---------------------------------------------------------------------- )

?learn primitives.d
: strings.d ;

( All you need to work with strings. )

create "kill   inline ?" ( addr -- )
Terminate string by writing 0 to addr."
	1 0 (:) [ i0 0 li ,   i0 c0 0 stb ,   1 - ] (;)
	2 0 (:) [ i0 0 li ,   i0 c1 0 stb ,   1 - ] (;)
	3 0 (:) [ i0 0 li ,   i0 c2 0 stb ,   1 - ]  ;

: [key]   ?" ( in -- out ) ( c ) immediate only
Read and compile one character which is loaded at runtime."
	key literal ; immediate

create (string)   ?" ( a1 delimiter -- a1 a2 ) ( string ) assembler
Store string.
Read string until delimiter and copy it to a1. a2 is after the
terminating zero."
	2 3 (:) [ drop
		s0 c0 mr ,   ( a1 )
		s1 c0 mr ,   ( a2 )
		s2 c1 mr ,   ( delimiter )
		
		( read and store string )
		0   compile key   drop
		c0 s1 0 stb ,
		c0 s2 cmpw ,
		s1 s1 1 addi ,
		NE -16 bc ,
		
		( terminate )
		t0 0 li ,
		t0 s1 -1 stb ,
		
		c0 s0 mr ,
		c1 s1 mr ,
	2 ] ;

: "   ?" ( compile: in -- out   runtime: -- a ) immediate only
Compile string.
Read and store string in the data dictionary. At runtime, it is loaded."
	there [key] " (string)
	align there! 
	literal   ; immediate

1: ."   ?" ( compile: in -- out   runtime: -- ) immediate only
Read string and compile it. At runtime, print it."
	compile "
	postpone type ; immediate

1: abort"   ?" ( compile: in -- out   runtime: -- ) immediate only
Read string and compile it. At runtime, print it, then abort."
	postpone file.
	compile ."
	postpone (abort) ; immediate
