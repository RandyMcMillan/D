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
: asm-if-else-then.d ;

( All you need to IF-ELSE-THEN in the assembler. )

( The following words use an ID which is necessary for compiling:
	- Bits 0-15 are the identifying part $6966.
	- Bit 31 is 0 if the ID was left by IF and 1 if it was left by ELSE.
	- Bits 27/28 and 29/30 are alpha and beta which hold the number of
items in the stack cache if the 'if' was taken (alpha) or not (beta). )

1: negate-BO   ?" ( BO -- BO' )
Swap BO between true and false. 
Bit 0 is not affected, so 'true' is 12 or 13, 'false' is 4 or 5." 
	[	t0 c0 0 31 31 rlwinm , ( save bit 0 )
		c0 c0 0 0 30 rlwinm ,
		c0 c0 8 addi ,
		c0 12 cmpwi ,
		8 beq ,
		c0 4 li ,
		c0 t0 0 31 31 rlwimi , ( restore bit 0 )
	] ;

2: IF   ?" ( BO BI -- addr ID ) assembler
Compile 'BO BI 0 bc' with negated BO, push its address and ID."
	swap negate-BO swap
	0 bc , 
	here 4 - 
	$69660000 ;

create ELSE   ?" ( addr ID -- addr ID ) assembler
Check ID. Complete the 'bc' from IF at addr, compile an empty branch,
leave its address. Set bit 31 in ID."
	2 2 (:) [ drop
		s0 c0 mr ,
		s1 c1 mr ,
		
		( check ID )
		t0 s1 16 16 31 rlwinm ,
		t0 $6966 cmpwi ,
		here EQ 0 bc ,
			0 abort" ELSE is not used correctly." drop
		here bc->
		
		( complete bc from IF to jump after the following branch )
		c0 s0 mr ,
		c1 idp 4 addi ,
		2   compile bc->   drop

		( compile empty branch )
		s0 idp mr ,
		0 ( in -- ) 0 b literal   compile ,   ( -- out ) drop
		
		( change ID and return )
		c0 s0 mr ,
		c1 s1 1 ori ,
	2 ] ;

create THEN   ?" ( addr ID -- ) assembler
Check ID. Complete the branch at addr left from IF or ELSE."
	2 2 (:) [ drop
		s0 c0 mr ,
		s1 c1 mr ,
		
		( check ID )
		t0 s1 16 16 31 rlwinm ,
		t0 $6966 cmpwi ,
		here EQ 0 bc ,
			0 abort" THEN is not used correctly." drop
		here bc->
		
		( complete branch )
		c0 s0 mr ,
		c1 idp mr ,
		t0 s1 0 31 31 rlwinm ,
		t0 0 cmpwi ,
		here NE 0 bc ,
			2   compile bc->   drop
			here 0 b , swap ( what a mess )
		here bc->
			2   compile b->   drop
		here b->
	0 ] ;
