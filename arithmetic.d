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
: arithmetic.d ;

create negate   inline ?" ( n -- -n )"
	1 0 (:) [ c0 c0 neg , ] (;)
	2 0 (:) [ c1 c1 neg , ] (;)
	3 0 (:) [ c2 c2 neg , ]  ;

create 1+   inline ?" ( n -- n+1 )"
	1 0 (:) [ c0 c0 1 addi , ] (;)
	2 0 (:) [ c1 c1 1 addi , ] (;)
	3 0 (:) [ c2 c2 1 addi , ]  ;

create 1-   inline ?" ( n -- n-1 )"
	1 0 (:) [ c0 c0 1 subi , ] (;)
	2 0 (:) [ c1 c1 1 subi , ] (;)
	3 0 (:) [ c2 c2 1 subi , ]  ;

create *   inline ?" ( n1 n2 -- product )"
	2 0 (:) [ c0 c0 c1 mullw , 1- ] (;)
	3 0 (:) [ c1 c1 c2 mullw , 1- ]  ;

create /   inline ?" ( n1 n2 -- quotient )"
	2 0 (:) [ c0 c0 c1 divw , 1- ] (;)
	3 0 (:) [ c1 c1 c2 divw , 1- ]  ;

create /mod   inline ?" ( n1 n2 -- quotient remainder )"
	2 0 (:) [ 	i0 c0 c1 divw ,   
				c1 c1 i0 mullw , 
				c1 c0 c1 sub ,
				c0 i0 mr , 		] (;)
	3 0 (:) [ 	i0 c1 c2 divw ,   
				c2 c2 i0 mullw , 
				c2 c1 c2 sub ,
				c1 i0 mr , 		]  ;

create min   inline ?" ( n1 n2 -- min )"
	2 0 (:) [	c0 c1 cmpw ,
				8 ble b+- ,
				c0 c1 mr ,		1- ] (;)
	3 0 (:) [	c1 c2 cmpw ,
				8 ble b+- ,
				c1 c2 mr ,		1- ] ;

create max   inline ?" ( n1 n2 -- max )"
	2 0 (:) [	c0 c1 cmpw ,
				8 bge b+- ,
				c0 c1 mr ,		1- ] (;)
	3 0 (:) [	c1 c2 cmpw ,
				8 bge b+- ,
				c1 c2 mr ,		1- ] ;
