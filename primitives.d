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
?learn arithmetic.d
: primitives.d ;

( Useful helpers for compiling and some unclassifiable stuff. )
( These words can be defined right after the assembler )

( --- Printing --- )

: TAB   ?" ( -- )
Print tab."
	9 emit ;

1: ?   ?" ( n -- n )
Print item without consuming."
	dup . ;

( --- Memory --- )

create cell+   inline ?" ( n -- n+4 )"
	1 0 (:) [ c0 c0 4 addi , ] (;)
	2 0 (:) [ c1 c1 4 addi , ] (;)
	3 0 (:) [ c2 c2 4 addi , ]  ;

create cells   inline ?" ( n -- 4*n )"
	1 0 (:) [ c0 c0 2 0 29 rlwinm , ] (;)
	2 0 (:) [ c1 c1 2 0 29 rlwinm , ] (;)
	3 0 (:) [ c2 c2 2 0 29 rlwinm , ]  ;

create bytes   inline ?" ( n -- n/4 )"
	1 0 (:) [ c0 c0 30 2 31 rlwinm , ] (;)
	2 0 (:) [ c1 c1 30 2 31 rlwinm , ] (;)
	3 0 (:) [ c2 c2 30 2 31 rlwinm , ]  ;

create alloc   inline ?" ( n -- )
Allocate n cells in the data dictionary."
	1 0 (:) cells [ ddp ddp c0 add , 1- ] (;)
	2 0 (:) cells [ ddp ddp c1 add , 1- ] (;)
	2 0 (:) cells [ ddp ddp c2 add , 1- ]  ;

: variable   ?" ( compile: --   run: -- a ) ( name )
Create variable."
	create inline
	0 1 cached   1 2 cached   2 3 cached
	0 part   0 there literal drop   blr, 
	1 part   1 there literal drop   blr,
	2 part   2 there literal drop   blr,
	0 _
	welcome ;

: offset   ?" ( compile: offset --   run: n -- n+offset ) ( name )
Create word which adds an offset."
	create inline
	dup dup
	1 1 cached   2 2 cached   3 3 cached
	1 part   i0 swap lil,   [ c0 c0 i0 add literal ] ,   blr,
	2 part   i0 swap lil,   [ c1 c1 i0 add literal ] ,   blr,
	3 part   i0 swap lil,   [ c2 c2 i0 add literal ] ,   blr,
	welcome ;

: array   ?" ( compile: n --   run: index -- a ) ( name )
Create array.
n uninitialized cells are allocated in the dictionary."
	create inline
	1 1 cached   2 2 cached   3 3 cached
	1 part
		i0 there lil,
		[ c0 c0 2 0 29 rlwinm literal ] ,
		[ c0 c0 i0 add literal ] ,
		blr,
	2 part
		i0 there lil,
		[ c1 c1 2 0 29 rlwinm literal ] ,
		[ c1 c1 i0 add literal ] ,
		blr,
	3 part
		i0 there lil,
		[ c2 c2 2 0 29 rlwinm literal ] ,
		[ c2 c2 i0 add literal ] ,
		blr,
	alloc welcome ;

create here!   inline ?" ( u -- )
Store instruction dictionary pointer."
	1 0 (:) [ idp c0 mr , 1- ] (;)
	2 0 (:) [ idp c1 mr , 1- ] (;)
	3 0 (:) [ idp c2 mr , 1- ]  ;

create there!   inline ?" ( u -- )
Store data dictionary pointer."
	1 0 (:) [ ddp c0 mr , 1- ] (;)
	2 0 (:) [ ddp c1 mr , 1- ] (;)
	3 0 (:) [ ddp c2 mr , 1- ]  ;

( --- Compiling  --- )

create TOS   inline ?" ( in -- register ) assembler
Top of stack
top register when cache count = in."
	1 0 (:) [ c0 c0  c0 1 -  addi , ] (;)
	2 0 (:) [ c1 c1  c0 1 -  addi , ] (;)
	3 0 (:) [ c2 c2  c0 1 -  addi , ]  ;

create bc->   leaf ?" ( a here -- ) assembler
Complete the conditional branch at a to here."
	2 0 (:) [ drop
		i1 c0 0 lwz , 
		i0 c1 c0 sub ,
		i1 i0 0 16 29 rlwimi ,
		i1 c0 0 stw ,
	0 ] ;

create b->   leaf ?" ( addr here -- ) assembler
Complete the branch at a to here."
	2 0 (:) [ drop
		i1 c0 0 lwz ,
		i0 c1 c0 sub ,
		i1 i0 0 6 29 rlwimi ,
		i1 c0 0 stw ,
	0 ] ;

create safe'   ?" ( -- word ) ( name ) 
Read word and find it. If it doesn't exist, abort!?"
	0 2 (:) [ drop
		0   ' word word,   drop
		s0 c0 mr ,
		1   ' (') word,   drop
		c0 0 cmpwi ,
		here NE 0 bc ,
			c0 s0 mr ,
			1   ' abort!? word,   drop
		here bc->
	1 ] ;

1: compile   ?" ( in -- out ) ( name ) immediate
Read and compile word."
	safe' word, ; immediate

: postpone   ?" ( in -- out ) ( name ) immediate only
Postpone compilation.
Read word. At runtime, it will be compiled."
	safe'   literal
	[ ' word, literal ] word, ; immediate

create >=adjust   ?" ( n1 min -- n2 ) assembler
Adjust stack cache from n1 to at least min, leave adjusted n2."
	2 1 (:) [ drop
		c0 c1 cmpw ,
		here GE 0 bc ,
			s0 c1 mr ,
			2   compile adjust   drop
			c0 s0 mr ,
		here bc->
	1 ] ;

create <=adjust   ?" ( n1 max -- n2 ) assembler
Adjust stack cache from n1 to at most max, leave adjusted n2."
	2 1 (:) [ drop
		c0 c1 cmpw ,
		here LE 0 bc ,
			s0 c1 mr ,
			2   compile adjust   drop
			c0 s0 mr ,
		here bc->
	1 ] ;

1: recurse   ?" ( in -- out ) immediate
Compile current word."
	( adjust cache )
	:;-data @
	[ dup TOS dup 2 30 extrwi , ]
	adjust

	( compile branch )
	:;-data cell+ @   branch,

	( lock and get 'out' )
	:;-data @
	[ t0 -1 li ,
	  dup TOS t0 0 22 22 rlwimi , ]
	dup :;-data !
	[ dup TOS dup 2 23 extrwi , ]
	; immediate

( --- Miscellaneous --- )

1: (forget)   ?" ( word -- )
Forget word."
	dup   0 >near-code drop   dup here0 ! here!
	dup   dup there0 ! there!
	@ lastword ! ;

: forget   ?" ( -- ) ( name )
Forget word."
	safe' (forget) ;
