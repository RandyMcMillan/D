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

?learn assembler.d
?learn asm-if-else-then.d
?learn compares.d
: begin-loops.d ;

( The following words use an ID while compiling:
	- bits 0-16 are the identifying part $6265.
	- bits 30/31 are the cache count after 'begin'. )

1: begin   ?" ( compile: in -- a ID out   run: -- ) immediate only
Start a begin-... loop
Setup ID, leave address."
	here swap 			( a out=in )
	dup $62650000 OR	( a out ID )
	swap				( a ID out )
	; immediate

: until)
?" ( compile: a ID BO BI in -- out   run: -- ) immediate only
Finish a begin-until primitive.
Check ID, adjust cache, compile a bc with BO and BI back to 'begin'."
		( check ID )
		[	t0 sp 12 lwz , 
			t0 t0 16 16 31 rlwinm , 
			t0 $6265 cmpwi ,
			NE IF
				0 abort" 'until' is not used correctly." drop
			THEN ]
		
		( adjust cache )
		[	t0 sp 12 lwz ,
			c1 t0 0 30 31 rlwinm ,
			c0 sp 0 lwz , 
			2 compile adjust drop ]
		
		( compile branch )
		[	c0 sp 8 lwz ,
			c1 sp 4 lwz ,
			t0 sp 16 lwz ,
			c2 t0 idp sub ,
			3 compile bc compile , drop ]
		
		( leave 'out' )
		[	c0 sp 0 lwz ,
			sp sp 5 cells addi , 
			drop 1 ]
	; immediate

: until   ?" ( compile: a ID in -- out   run: f -- ) immediate only
Finish a begin-until.
Compile '(true?', execute until)."
	compile (true?   compile until) ; immediate

1: again   ?" ( compile: a ID in -- out   run: -- ) immediate only
Finish a begin-again."
	ALW 0 rot   compile until) ; immediate
