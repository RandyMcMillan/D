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

?learn asm-if-else-then.d
?learn compares.d
: if-else-then.d ;

( The following words use an ID which is necessary for compiling:
	- Bits 0-15 are the identifying part $6966.
	- Bit 31 is 0 if the ID was left by IF and 1 if it was left by ELSE.
	- Bits 27/28 and 29/30 are alpha and beta which hold the number of
items in the stack cache if the 'if' was taken (alpha) or not (beta). )

1: if)   ?" ( BO BI in -- addr ID out ) immediate only
Execute IF with BO and BI, set alpha and beta in ID to out=in.
Use it after (< (>= etc."
	rot' 		( in BO BI ) 
	IF 			( in addr ID )
	rot			( addr ID in )
	[ c1 c2 1 29 30 rlwimi , ]
	[ c1 c2 3 27 28 rlwimi , ] ; immediate

1: if   ?" ( in -- addr ID out ) immediate only"
	compile (true?   compile if) ; immediate

1: nif   ?" ( in -- addr ID out ) immediate only"
	compile (false?   compile if) ; immediate

create else   ?" ( addr ID in -- addr ID out ) immediate only
Check ID. Set alpha to in, out to beta. Execute ELSE."
	3 0 (:) [ drop
		( check ID )
		t0 c1 16 16 31 rlwinm ,
		t0 $6966 cmpwi ,
		NE IF
			0 abort" 'else' is not used correctly." drop
		THEN

		( alpha = in )
		c1 c2 3 27 28 rlwimi ,
		( ELSE )
		2   compile ELSE   drop
		( out = beta )
		c2 c1 31 30 31 rlwinm ,
	3 ] ; immediate

create then   ?" ( addr ID in -- out ) immediate only
Check ID. Set alpha or beta to in depending on ID. Compile
cache-adjusting code and THEN depending on alpha, beta and ID."
	3 5 (:) [ drop
		( s0 = addr, s1 = ID, s2 = in/out, s3 = alpha, s4 = beta, 
			s5 = misc )
		s0 c0 mr ,
		s1 c1 mr ,
		s2 c2 mr ,
		s3 c1 29 30 31 rlwinm ,
		s4 c1 31 30 31 rlwinm ,
		
		( check ID )
		t0 s1 16 16 31 rlwinm ,
		t0 $6966 cmpwi ,
		NE IF
			0 abort" 'then' is not used correctly." drop
		THEN

		( if lsb of ID is 0/1, set alpha/beta to in )
		t0 s1 1 andi. ,
		EQ IF s3 s2 mr , ELSE s4 s2 mr , THEN
		
		( Compile whatever is needed to make sure the stack cache is not
		  messed up by the two different paths an 'if' provides. )
		t0 s1 1 andi. ,
		EQ IF
			( IF THEN )
			s3 s4 cmpw ,
			EQ IF
				( alpha = beta )
				c0 s0 mr ,
				c1 s1 mr ,
				2   compile THEN   drop
				s2 s3 mr ,
			ELSE
				s3 s4 cmpw ,
				LT IF
					( alpha < beta )
					s5 idp mr ,
					0   0 b literal   compile ,   drop
					c0 s0 mr ,
					c1 s1 mr ,
					2   compile THEN   drop
					c0 s4 mr ,
					c1 s3 mr ,
					2   compile adjust   drop
					c0 s5 mr ,
					c1 idp mr ,
					2   compile b->   drop
				ELSE
					( alpha > beta )
					c0 s3 mr ,
					c1 s4 mr ,
					2   compile adjust   drop
					c0 s0 mr ,
					c1 s1 mr ,
					2   compile THEN   drop
					s2 s4 mr ,
				THEN
			THEN
		ELSE
			( IF ELSE THEN )
			s3 s4 cmpw ,
			EQ IF
				( alpha = beta )
				c0 s0 mr ,
				c1 s1 mr ,
				2   compile THEN   drop
				s2 s3 mr ,
			ELSE
				s3 s4 cmpw ,
				LT IF
					( alpha < beta )
					c0 s4 mr ,
					c1 s3 mr ,
					2   compile adjust   drop
					c0 s0 mr ,
					c1 s1 mr ,
					2   compile THEN   drop
					s2 s3 mr ,
				ELSE
					( alpha > beta )
					s5 idp mr ,
					0   0 b literal   compile ,   drop
					c0 s0 mr ,
					c1 s1 mr ,
					2   compile THEN   drop
					c0 s3 mr ,
					c1 s4 mr ,
					2   compile adjust   drop
					c0 s5 mr ,
					c1 idp mr ,
					2   compile b->   drop
					s2 s4 mr ,
				THEN
			THEN
		THEN
		
		( out = min(alpha, beta) )
		c0 s2 mr ,
	1 ] ; immediate

