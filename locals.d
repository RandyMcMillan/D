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

?learn strings.d
?learn do-loop.d
?learn begin-loops.d
: locals.d ;

#locals array locals

( --- initialization --- )

: :locals;   ?" ( -- )
Generate words which wrap locals."
	#locals do 
		there #locals i - locals !			( store word in array )
		" " (create) 28 bytes alloc			( reserve space for name )
		#locals i - s0 +					( generate register number )
		inline
		0 1 cached  1 2 cached  2 3 cached
		0 part c0 over mr ,   blr,			( generate code )
		1 part c1 over mr ,   blr,
		2 part c2 over mr ,   blr,
		_									( store register number )
		welcome
	loop ; 

:locals;

0 >name 32 +   offset >{#}					( offset to register # )

: {0names}   ?" ( -- )
Clear the names of all locals."
	#locals do
		#locals i -   locals @ >name "kill
	loop ;

( --- creation --- )

2: {name!}   ?" ( str n -- )
Set name of n-th local."
	locals @ >name "copy drop ;

create fetch-some
?" ( compile: rn .. r1 n rd --   run: xn .. x1 -- ) assembler
Compile code which loads n consecutive cells at the address in register
rd into registers r1 to rn."
	2 2 (:)
		[ s0 over TOS mr , 1- ]				( s0 = rd )
		[ s1 0 li , ]						( s1 = offset )
		do
			[ 0 adjust 0 ] 
			[ c0 s0 mr , 1+ ] [ c1 s1 mr , 1+ ] lwz ,
			[ s1 s1 4 addi , ]
		loop ;

create {pop-memory}   ?" ( compile: n --   run: See note ) assembler
Compile code which pops n non-cached cells into the first n locals."
	1 1 (:) dup if
		[ s0 c0 mr , ]						( s0 = n )
		s0 swap do dup 1+ loop drop 		( push registers )
		[ c0 s0 mr , 1+ ] sp fetch-some		( fetch )
		( update sp )
		sp sp [ 1 adjust c1 s0 2 0 29 rlwinm , 2 ] addi , 
	else drop then ;

create {pop-cache}
?" ( compile: in reg n -- out   run: See note ) assembler
Compile code which pops n cached cells into n consecutive registers
starting with reg."
	3 3 (:)
		[ s0 c0 mr , 1- ]					( s0 = in )
		[ s1 c1 mr , 1- ]					( s1 = reg )
		[ s2 c2 mr , 1- ]					( s2 = n )
		
		[ c0 s2 mr , 1+ ] if				( don't if n=0 )
			[ t0 s0 s2 sub , ]
			[ c0 t0 c0 addi , 1+ ]			( 'c0' + in - n )
			[ c1 s2 mr , 1+ ] do dup
				[ 1+ dup TOS s1 mr , ]
				swap mr ,					( compile )
			1+ [ s1 s1 1 addi , ] 			( inc. cache and reg )
			loop drop
		then
		[ drop c0 s0 s2 sub , 1 ] ;			( out = in - n )

create {pop}   ?" ( compile: in n -- out   run: x1 .. xn -- )
Compile code which pops n stack cells into the first n locals."
	2 4 (:)
		[ s0 c0 mr , 1- ]					( s0 = in )
		[ s1 c1 mr , 1- ]					( s1 = n )
		
		( calculate number of registers )
		( s2 = # memory cells, s3 = # cached cells )
		[ c0 s1 s0 sub , 1+ ]
		0 max [ s2 c0 mr , 1- ]				( s2 = max(n-in, 0) )
		[ s3 s1 s2 sub , ]					( s3 = n - s2 )
		
		( pop from memory )
		[ c0 s2 mr , 1+ ] {pop-memory}
		
		( pop from cache )
		[ c0 s0 mr , 1+ ]					( in )
		[ c1 s2 s0 addi , 1+ ]				( reg )
		[ c2 s3 mr , 1+ ]					( new n )
		{pop-cache} ;

create {parse}   ?" ( -- p l ) ( text} )
Parse locals definition, set names.
p = # popped locals, l = # locals used"
( This code is crap but works. If you know a better way, tell me. )
	0 4 (:)
		[ s0 0 li , ]						( s0 = p )
		[ s1 0 li , ]						( s1 = l )
		[ s2 0 li , ]						( s2 = state )
		( state = 0: reading popped locals
		  state = 1: reading unpopped locals
		  state = 2: reading out
		  state = 3: done )
		
		begin
			( read word )
			word [ s3 c0 mr , 1- ]			( s3 = word )
			
			( update state )
			[ c0 s3 mr , 1+ ]
			" }" -1 "compare if				( check for } )
				[ s2 3 li , ]
			else
				[ c0 s3 mr , 1+ ]			( check for -- )
				" --" -1 "compare if
					[ s2 2 li , ]
				else
					[ c0 s3 mr , 1+ ]		( check for - )
					" -" -1 "compare if
						[ s2 1 li , ]
					else

						( handle word )
						[ s2 2 cmpwi , NE rot ] if)
							( store name )
							[ c0 s3 mr , 1+ ]
							[ c1 s1 mr , 1+ ]
							{name!}
				
							( increase l )
							[ s1 s1 1 addi , ]
							( increase p if state = 0)
							[ c0 s2 mr , 1+ ] nif
								[ s0 s0 1 addi , ]
							then
						then
						
						( l < #locals ? )
						[ c0 s1 mr , drop 1 ] #locals
						> if abort" Too many locals" then
	
					then
				then
			then
		[ s2 3 cmpwi , NE rot ] until)
		
		( leave result )
		[ c0 s0 mr , 1+ ]
		[ c1 s1 mr , 1+ ] 
	;

create {set}   ?" ( p l -- out )
Prepare current word for locals.
See {parse} for p and l."
	2 3 (:)
		[ s0 c0 mr , 1- ]					( s0 = p )
		[ s1 c1 mr , 1- ]					( s1 = l )
		
		( 'in' = min(3,p) )
		[ c0 s0 mr , 1+ ]
		3 min
		[ s2 c0 mr , 1- ]					( s2 = in )
		
		( set 'in' (if not 0) and 'l' in :;-data )
		:;-data @
		[	s2 0 cmpwi , NE IF
				c0 s2 0 30 31 rlwimi ,
			THEN ]
		[ c0 s1 2 25 29 rlwimi , ]
		:;-data !
		
		( save locals )
		[ c0 s1 mr , 1+ ] !locals
		
		( pop locals )
		[ c0 s2 mr , 1+ ]
		[ c1 s0 mr , 1+ ]
		{pop}
	;

: {   ?" ( in -- out ) ( text ) immediate
Initialize locals for current word."
	drop {0names} {parse} {set} ; immediate

( redefine ; to kill locals when finished )
: ;
	compile ; {0names} ; immediate

( --- handling --- )

: `   ?" ( -- n ) ( name )
Local-tick
Read name of local, return its register number."
	safe' >{#} @ ;

: (=>)   ?" ( compile: in -- out   run: n -- n ) ( name ) immediate
Compile code which stores n non-consuming in a local."
	1 >=adjust ` over TOS mr , ; immediate

: =>   ?" ( compile: in -- out   run: n -- ) ( name ) immediate
Compile code which stores n in a local."
	compile (=>) 1- ; immediate

: ++>   ?" ( compile: in -- out   run: n -- ) ( name ) immediate
Compile code which adds n to a local."
	1 >=adjust
	` over TOS over add ,
	1- ; immediate

: -->   ?" ( compile: in -- out   run: n -- ) ( name ) immediate
Compile code which subtracts n from a local."
	1 >=adjust
	` over TOS over swap sub , 
	1- ; immediate

: inc>   ?" ( compile: in -- out   run: -- ) ( name ) immediate
Compile code which adds 1 to a local."
	` dup 1 addi , ; immediate

: dec>   ?" ( compile: in -- out   run: -- ) ( name ) immediate
Compile code which subtracts 1 from a local."
	` dup 1 subi , ; immediate

: clear>   ?" ( compile: in -- out   run: -- ) ( name ) immediate
Compile code which clears a local."
	` 0 li , ; immediate
