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
: compares.d ;

( All you need to compile compares )

: ??-compares
?" (=, (<>, (<, (>, (<=, (>=, (true? and (false? have the same stack
behaviour ( in -- BO BI out ). They compile a check or compare and leave
BO and BI. Use them before if) or flag).\n
=, <>, <, >, <= and >= can be used only when compiling." ;

1: check,   ?" ( in -- out )
Compile code which compares TOS against zero."
	1 >=adjust
	dup TOS 0 cmpwi , ;

1: compare,   ?" ( in -- out )
Compile code which compares two items."
	2 >=adjust
	dup   TOS dup 1- swap cmpw , ;

1: (true?	check, 1 - NE+ rot 		; immediate
1: (false?	check, 1 - EQ+ rot 		; immediate

1: (=		compare, 2 - EQ+ rot 	; immediate
1: (<>		compare, 2 - NE+ rot 	; immediate
1: (<		compare, 2 - LT+ rot 	; immediate
1: (>		compare, 2 - GT+ rot 	; immediate
1: (<=		compare, 2 - LE+ rot 	; immediate
1: (>=		compare, 2 - GE+ rot 	; immediate

create flag)   ?" ( BO BI in -- out ) immediate only
Create flag.
Compile code which creates a flag depending on the condition registers
and BO/BI. Use after (=, (< etc."
	3 4 (:) [ drop
		s0 c0 mr ,
		s1 c1 mr ,
		s2 c2 mr ,
		
		( make room for flag; out -> s2 )
		c0 s2 mr ,
		c1 2 li ,
		2 compile <=adjust drop
		s2 c0 1 addi ,
		
		( TOS -> s3 )
		c0 s2 mr ,
		1 compile TOS drop
		s3 c0 mr ,
		
		( get condition register )
		c0 s3 mr ,
		1 compile mfcr compile , drop
		
		( mask condition bit and move it to position 0 )
		s3 sp -4 stwu ,		( destination register = TOS )
		s3 sp -4 stwu ,		( source register = TOS )
		t0 s1 1 addi ,
		t0 sp -4 stwu ,		( shift by BI+1 )
		t1 31 li ,
		t1 sp -4 stwu ,		( mask begin = 31 )
		t1 sp -4 stwu ,		( mask end = 31 )
		0 compile rlwinm compile , drop
		
		( negate condition if necessary )
		t0 s0 0 28 28 rlwinm. ,	( BO[28] is 1 if true, 0 if false )
		here NE 0 bc ,
			c0 s3 mr ,
			c1 s3 mr ,
			c2 1 li ,
			3 compile xori compile , drop
		here bc->

		( out )
		c0 s2 mr ,
	1 ] ; immediate

: =		compile (=		compile flag) ; immediate
: <>	compile (<>		compile flag) ; immediate
: <		compile (<  	compile flag) ; immediate
: >		compile (>  	compile flag) ; immediate
: <=	compile (<= 	compile flag) ; immediate
: >=	compile (>= 	compile flag) ; immediate
