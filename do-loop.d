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

?learn if-else-then.d
?learn strings.d
: do-loop.d ;

( 'do' and 'loop' use an ID while compiling:
	- bits 0-16 are the identifying part $444F.
	- bits 30/31 are the cache count after 'do'. )

1: do   ?" ( compile: in -- a ID out   run: n -- ) immediate only
Compile a do-loop.
Save CTR, setup ID, leave address."
	( save old CTR )
	[ i0 mfctr 			literal ] ,
	[ i0 ssp -4 stwu 	literal ] ,
	
	( load new CTR )
	1 >=adjust					( in )
	dup TOS mtctr ,				( in )
	
	( push addr & ID, leave out )
	here swap 					( a in )
	1- 							( a out )
	dup $444F0000 OR 			( a out ID )
	swap 						( a ID out )
	; immediate

create loop   ?" ( compile: a ID in -- out   run: -- ) immediate only
Finish a do-loop.
Check ID, adjust cache, compile branch, restore CTR."
	2 1 (:)
		( check ID )
		[	t0 c0 16 16 31 rlwinm ,
			t0 $444F cmpwi ,
			NE IF
				0 abort" 'loop' is not used correctly." drop
			THEN ]
		
		( adjust cache & save out )
		[	c0 c0 0 30 31 rlwinm ,
			s0 c0 mr , ]
		swap adjust
		
		( compile branch )
		here - bdnz ,
		
		( restore CTR )
		[ i0 ssp 0 lwz		literal ] ,
		[ ssp ssp 4 addi	literal ] ,
		[ i0 mtctr	 		literal ] ,
		
		( leave 'out' )
		[ drop   c0 s0 mr ,   1 ]
	; immediate

1: i   ?" ( compile: in -- out   run: -- n ) immediate only
Loop counter"
	2 <=adjust   1+ dup   TOS mfctr , ; immediate

1: j   ?" ( compile: in -- out   run: -- n ) immediate only
Outer loop counter"
	2 <=adjust   1+ dup   TOS ssp 0 lwz , ; immediate

