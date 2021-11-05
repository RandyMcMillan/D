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

: assembler.d ;

( --- helpers --- )

: constant    ?" ( compile: n --   run: -- n ) ( name )
Create word which pushes n."
	dup dup
	create inline
	0 1 cached   1 2 cached   2 3 cached
	0 part   0 swap literal drop   blr, 
	1 part   1 swap literal drop   blr,
	2 part   2 swap literal drop   blr,
	welcome ;

( numbers to speed up compilation )
-1 constant -1
0 constant 0
1 constant 1
2 constant 2
3 constant 3
4 constant 4

: i:    ?" Create inline words."
	create inline 0 0 (:) ;

( specify the number of items in the stack cache on entry )
: 1: create 1 0 (:) ;
: 2: create 2 0 (:) ;
: 3: create 3 0 (:) ;

( instruction modifiers )

create LK    ?" ( inst -- inst' )
Set 'link bit' 31 of a branch instruction."
	inline 1 0 (:) 1 OR ;

create AA    ?" ( inst -- inst' )
Set 'absolute address' bit 30 of a branch instruction."
	inline 1 0 (:) #10 OR ;

create Rc    ?" ( inst -- inst' )
Set 'record carry' bit 31 of an instruction."
	inline 1 0 (:) 1 OR ;

create OE    ?" ( inst -- inst' )
Set 'overflow enable' bit 21 of an instruction."
	inline 1 0 (:) 1024 OR ;

( --- register declarations --- )

( all )
 0 constant r0
 1 constant r1
 2 constant r2
 3 constant r3
 4 constant r4
 5 constant r5
 6 constant r6
 7 constant r7
 8 constant r8
 9 constant r9
10 constant r10
11 constant r11
12 constant r12
13 constant r13
14 constant r14
15 constant r15
16 constant r16
17 constant r17
18 constant r18
19 constant r19
20 constant r20
21 constant r21
22 constant r22
23 constant r23
24 constant r24
25 constant r25
26 constant r26
27 constant r27
28 constant r28
29 constant r29
30 constant r30
31 constant r31

( system )
r1  constant ssp
r2  constant rtoc
r24 constant ref
r25 constant idp
r26 constant ddp
r27 constant c0
r28 constant c1
r29 constant c2
r31 constant sp

( temporary )
r3  constant t0
r4  constant t1
r5  constant t2
r6  constant t3
r7  constant t4
r8  constant t5
r9  constant t6
r10 constant t7

( inline )
r11 constant i0
r12 constant i1

( save )
r13 constant s0
r14 constant s1
r15 constant s2
r16 constant s3
r17 constant s4
r18 constant s5
r19 constant s6
r20 constant s7
r21 constant s8


( --- instruction forms --- )

create asm-I-form    leaf ?" ( LI OP -- inst )"
	2 0 (:) 0 [ 0 6 bits, 6 24 bits, ] ;

create asm-B-form    leaf ?" ( BO BI BD OP -- inst )"
	3 0 (:) 0 [ 0 6 bits, 16 14 bits, 11 5 bits, 6 5 bits, ] ;

create asm-SC-form   leaf ?" ( OP -- inst )"
	1 0 (:) 2 [ 0 6 bits, ] ;

create asm-D-form    leaf ?" ( D A d OP -- inst )"
	3 0 (:) 0 [ 0 6 bits, 16 16 bits, 11 5 bits, 6 5 bits, ] ;

create asm-D-form-2    leaf ?" ( A S d OP -- inst )"
	3 0 (:) 0 [ 0 6 bits, 16 16 bits, 6 5 bits, 11 5 bits, ] ;

create asm-D-form-crf    leaf ?" ( crf A d OP -- inst )"
	3 0 (:) 0 [ 0 6 bits, 16 16 bits, 11 5 bits, 6 3 bits, ] ;

create asm-X-form    leaf ?" ( D A B XO OP -- inst )"
	3 0 (:) 0 [ 0 6 bits, 21 10 bits, 16 5 bits, 11 5 bits, 6 5 bits, ] ;

create asm-X-form-2    leaf ?" ( A S B XO OP -- inst )"
	3 0 (:) 0 [ 0 6 bits, 21 10 bits, 16 5 bits, 6 5 bits, 11 5 bits, ] ;

create asm-X-form-crf    leaf ?" ( crf A B XO OP -- inst )"
	3 0 (:) 0 [ 0 6 bits, 21 10 bits, 16 5 bits, 11 5 bits, 6 3 bits, ] ;

create asm-XL-form    leaf ?" ( BO BI cr XO OP -- inst )"
	3 0 (:) 0 [ 0 6 bits, 21 10 bits, 16 5 bits, 11 5 bits, 6 5 bits, ] ;

create asm-XFX-form    leaf ?" ( D spr XO OPCD -- inst )"
	3 0 (:) 0 [ 0 6 bits, 21 10 bits, 11 10 bits, 6 5 bits, ] ;

create asm-XFL-form    leaf ?" ( FM B XO OP -- inst )"
	3 0 (:) 0 [ 0 6 bits, 21 10 bits, 16 5 bits, 7 8 bits, ] ;

create asm-XO-form    leaf ?" ( D A B XO OP -- inst )"
	3 0 (:) 0 [ 0 6 bits, 22 9 bits, 16 5 bits, 11 5 bits, 6 5 bits, ] ;

create asm-A-form    leaf ?" ( D A B C XO OP -- inst )"
	3 0 (:) 0 [ 0 6 bits, 26 5 bits, 21 5 bits, 16 5 bits, 11 5 bits, 6 5 bits, ] ;

create asm-A-form-2    leaf ?" ( D A C B XO OP -- inst )"
	3 0 (:) 0 [ 0 6 bits, 26 5 bits, 16 5 bits, 21 5 bits, 11 5 bits, 6 5 bits, ] ;

create asm-M-form    leaf ?" ( A S SH MB ME OP -- inst )"
	3 0 (:) 0 [ 0 6 bits, 26 5 bits, 21 5 bits, 16 5 bits, 6 5 bits, 11 5 bits, ] ;

( we need this for rot' )
: or   ?" ( A S B -- inst )" 444 31 asm-X-form-2 ;
: or. or Rc ;

( this is useful for some mnemonics )
create rot'   ?" ( a b c -- c a b )" inline
	3 0 (:)
	[	i0 c2 c2 or ,
		c2 c1 c1 or ,
		c1 c0 c0 or ,
		c0 i0 i0 or ,
		drop 3 ] ;

( --- instructions --- )

( make sure LI fits in 24+2 bits )
1: b   ?" ( LI -- inst )" 30 rotate 18 asm-I-form ;
1: bl b LK ;
1: ba b AA ;
1: bla b AA LK ;

( make sure BD fits in 14+2 bits )
2: bc   ?" ( BO BI BD -- inst )" 30 rotate 16 asm-B-form ;
2: bcl bc LK ;
2: bca bc AA ;
2: bcla bc AA LK ;

: sc   ?" ( -- inst )" 17 asm-SC-form ;

( D-form )

2: addi   ?" ( D A SIMM -- inst )" 14 asm-D-form ;

2: addic   ?" ( D A SIMM -- inst )" 12 asm-D-form ;

2: addic.   ?" ( D A SIMM -- inst )" 13 asm-D-form ;

2: addis   ?" ( D A SIMM -- inst )" 15 asm-D-form ;

2: andi.   ?" ( A S UIMM -- inst )" 28 asm-D-form-2 ;

2: andis.   ?" ( A S UIMM -- inst )" 29 asm-D-form-2 ;

( use (cr) to specify the cr )
2: cmpi   ?" ( crfD A SIMM -- inst )" 11 asm-D-form-crf ;

2: cmpli   ?" ( crfD A SIMM -- inst )" 10 asm-D-form-crf ;

2: lbz   ?" ( D A d -- inst )" 34 asm-D-form ;

2: lbzu   ?" ( D A d -- inst )" 35 asm-D-form ;

2: lfd   ?" ( D A d -- inst )" 50 asm-D-form ;

2: lfdu   ?" ( D A d -- inst )" 51 asm-D-form ;

2: lfs   ?" ( D A d -- inst )" 48 asm-D-form ;

2: lfsu   ?" ( D A d -- inst )" 49 asm-D-form ;

2: lha   ?" ( D A d -- inst )" 42 asm-D-form ;

2: lhau   ?" ( D A d -- inst )" 43 asm-D-form ;

2: lhz   ?" ( D A d -- inst )" 40 asm-D-form ;

2: lhzu   ?" ( D A d -- inst )" 41 asm-D-form ;

2: lmw   ?" ( D A d -- inst )" 46 asm-D-form ;

2: lwz   ?" ( D A d -- inst )" 32 asm-D-form ;

2: lwzu   ?" ( D A d -- inst )" 33 asm-D-form ;

2: mulli   ?" ( D A SIMM -- inst )" 7 asm-D-form ;

2: ori   ?" ( A S UIMM -- inst )" 24 asm-D-form-2 ;

2: oris   ?" ( A S UIMM -- inst )" 25 asm-D-form-2 ;

2: stb   ?" ( S A d -- inst )" 38 asm-D-form ;

2: stbu   ?" ( S A d -- inst )" 39 asm-D-form ;

2: stfd   ?" ( S A d -- inst )" 54 asm-D-form ;

2: stfdu   ?" ( S A d -- inst )" 55 asm-D-form ;

2: stfs   ?" ( S A d -- inst )" 52 asm-D-form ;

2: stfsu   ?" ( S A d -- inst )" 53 asm-D-form ;

2: sth   ?" ( S A d -- inst )" 44 asm-D-form ;

2: sthu   ?" ( S A d -- inst )" 45 asm-D-form ;

2: stmw   ?" ( S A d -- inst )" 47 asm-D-form ;

2: stw   ?" ( S A d -- inst )" 36 asm-D-form ;

2: stwu   ?" ( S A d -- inst )" 37 asm-D-form ;

2: subfic   ?" ( D A SIMM -- inst )" 8 asm-D-form ;

2: twi   ?" ( TO A SIMM )" 3 asm-D-form ;

2: xori   ?" ( A S UIMM -- inst )" 26 asm-D-form-2 ;

2: xoris   ?" ( A S UIMM -- inst )" 27 asm-D-form-2 ;

( X-form )

1: and   ?" ( A S B -- inst )" 28 31 asm-X-form-2 ;
1: and. and Rc ;

1: andc   ?" ( A S B -- inst )" 60 31 asm-X-form-2 ;
1: andc. andc Rc ;

( use (cr) to specify the cr )
1: cmp   ?" ( crfD A B -- inst )" 0 31 asm-X-form-crf ;

1: cmpl   ?" ( crfD A B -- inst )" 32 31 asm-X-form-crf ;

: cntlzw   ?" ( A S -- inst )" 0 26 31 asm-X-form-2 ;
: cntlzw. cntlzw Rc ;

2: dcba   ?" ( A B -- inst )" 0 rot' 758 31 asm-X-form ;

2: dcbf   ?" ( A B -- inst )" 0 rot' 86 31 asm-X-form ;

2: dcbi   ?" ( A B -- inst )" 0 rot' 470 31 asm-X-form ;

2: dcbst   ?" ( A B -- inst )" 0 rot' 54 31 asm-X-form ;

2: dcbt   ?" ( A B -- inst )" 0 rot' 278 31 asm-X-form ;

2: dcbtst   ?" ( A B -- inst )" 0 rot' 246 31 asm-X-form ;

2: dcbz   ?" ( A B -- inst )" 0 rot' 1014 31 asm-X-form ;

1: eciwx   ?" ( D A B -- inst )" 310 31 asm-X-form ;

1: ecowx   ?" ( A S B -- inst )" 438 31 asm-X-form-2 ;

: eieio   ?" ( -- inst )" 0 0 0 854 31 asm-X-form-2 ;

1: eqv   ?" ( A S B -- inst )" 284 31 asm-X-form-2 ;
1: eqv. eqv Rc ;

: extsb   ?" ( A S -- inst )" 0 954 31 asm-X-form-2 ;
: extsb. extsb Rc ;

: extsh   ?" ( A S -- inst )" 0 922 31 asm-X-form-2 ;
: extsh. extsh Rc ;

1: fabs   ?" ( D B -- inst )" 0 swap 264 63 asm-X-form ;
1: fabs. fabs Rc ;

1: fcmpo   ?" ( crfD A B -- inst )" 32 63 asm-X-form-crf ;

1: fcmpu   ?" ( crfD A B -- inst )" 0 63 asm-X-form-crf ;

1: fctiw   ?" ( D B -- inst )" 0 swap 14 63 asm-X-form ;
1: fctiw. fctiw Rc ;

1: fctiwz   ?" ( D B -- inst )" 0 swap 15 63 asm-X-form ;
1: fctiwz. fctiwz Rc ;

1: fmr   ?" ( D B -- inst )" 0 swap 72 63 asm-X-form ;
1: fmr. fmr Rc ;

1: fnabs   ?" ( D B -- inst )" 0 swap 136 63 asm-X-form ;
1: fnabs. Rc ;

1: fneg   ?" ( D B -- inst )" 0 swap 40 63 asm-X-form ;
1: fneg. Rc ;

1: frsp   ?" ( D B -- inst )" 0 swap 12 63 asm-X-form ;
1: frsp. Rc ;

2: icbi   ?" ( A B -- inst )" 0 rot' 982 31 asm-X-form ;

1: lbzux   ?" ( D A B -- inst )" 119 31 asm-X-form ;

1: lbzx   ?" ( D A B -- inst )" 87 31 asm-X-form ;

1: lfdux   ?" ( D A B -- inst )" 631 31 asm-X-form ;

1: lfdx   ?" ( D A B -- inst )" 599 31 asm-X-form ;

1: lfsux   ?" ( D A B -- inst )" 567 31 asm-X-form ;

1: lfsx   ?" ( D A B -- inst )" 535 31 asm-X-form ;

1: lhaux   ?" ( D A B -- inst )" 375 31 asm-X-form ;

1: lhax   ?" ( D A B -- inst )" 343 31 asm-X-form ;

1: lhbrx   ?" ( D A B -- inst )" 790 31 asm-X-form ;

1: lhzux   ?" ( D A B -- inst )" 311 31 asm-X-form ;

1: lhzx   ?" ( D A B -- inst )" 279 31 asm-X-form ;

1: lswi   ?" ( D A NB -- inst )" 597 31 asm-X-form ;

1: lswx   ?" ( D A B -- inst )" 533 31 asm-X-form ;

1: lwarx   ?" ( D A B -- inst )" 20 31 asm-X-form ;

1: lwbrx   ?" ( D A B -- inst )" 534 31 asm-X-form ;

1: lwzux   ?" ( D A B -- inst )" 55 31 asm-X-form ;

1: lwzx   ?" ( D A B -- inst )" 23 31 asm-X-form ;

: mcrfs   ?" ( crfD crfS -- inst )" 0 [ 27 3 bits, ] 0 64 63 asm-X-form-crf ;

: mcrxr   ?" ( crfD -- inst )" 0 0 512 31 asm-X-form-crf ;

: mfcr   ?" ( D -- inst )" 0 0 19 31 asm-X-form ;

: mffs   ?" ( D -- inst )" 0 0 583 63 asm-X-form ;
: mffs. mffs Rc ;

: mfmsr   ?" ( D -- inst )" 0 0 83 31 asm-X-form ;

: mfsr   ?" ( D SR -- inst )" 0 595 31 asm-X-form ;

1: mfsrin   ?" ( D B -- inst )" 0 swap 659 31 asm-X-form ;

: mtfsb0 ( crbD -- inst ) 0 0 70 63 asm-X-form ;
: mtfsb0. mtfsb0 Rc ;

: mtfsb1 ( crfD IMM -- inst ) 0 0 38 63 asm-X-form ;
: mtfsb1. mtfsb1 Rc ;

1: mtfsfi   ?" ( crbD IMM -- inst )"
	0 swap [ 27 4 bits, ] 134 63 asm-X-form-crf ;
1: mtfsfi. mtfsfi Rc ;

: mtmsr   ?" ( S -- inst )" 0 0 146 31 asm-X-form ;

: mtsr   ?" ( S SR -- inst )" 0 210 31 asm-X-form ;

1: mtsrin   ?" ( S B -- inst )"
	 0 swap 242 31 asm-X-form ;

: nand   ?" ( A S B -- inst )" 476 31 asm-X-form-2 ;
: nand. nand Rc ;

1: nor   ?" ( A S B -- inst )" 124 31 asm-X-form-2 ;
1: nor. nor Rc ;

( 'or' has been defined before )

1: orc   ?" ( A S B -- inst )" 412 31 asm-X-form-2 ;
1: orc. orc Rc ;

1: slw   ?" ( A S B -- inst )" 24 31 asm-X-form-2 ;
1: slw. slw Rc ;

1: sraw   ?" ( A S B -- inst )" 792 31 asm-X-form-2 ;
1: sraw. sraw Rc ;

1: srawi   ?" ( A S SH -- inst )" 824 31 asm-X-form-2 ;
1: srawi. srawi Rc ;

1: srw   ?" ( A S B -- inst )" 536 31 asm-X-form-2 ;
1: srw. srw Rc ;

1: stbux   ?" ( S A B -- inst )" 247 31 asm-X-form ;

1: stbx   ?" ( S A B -- inst )" 215 31 asm-X-form ;

1: stfdux   ?" ( S A B -- inst )" 759 31 asm-X-form ;

1: stfdx   ?" ( S A B -- inst )" 727 31 asm-X-form ;

1: stfiwx   ?" ( S A B -- inst )" 983 31 asm-X-form ;

1: stfsux   ?" ( S A B -- inst )" 695 31 asm-X-form ;

1: stfsx   ?" ( S A B -- inst )" 663 31 asm-X-form ;

1: sthbrx   ?" ( S A B -- inst )" 918 31 asm-X-form ;

1: sthux   ?" ( S A B -- inst )" 439 31 asm-X-form ;

1: sthx   ?" ( S A B -- inst )" 407 31 asm-X-form ;

1: stswi   ?" ( S A NB -- inst )" 725 31 asm-X-form ;

1: stswx   ?" ( S A B -- inst )" 661 31 asm-X-form ;

1: stwbrx   ?" ( S A B -- inst )" 662 31 asm-X-form ;

: stwcx.   ?" ( S A B -- inst )"
	150 31 asm-X-form 1 swap [ 31 1 bits, ] ;

1: stwux   ?" ( S A B -- inst )" 183 31 asm-X-form ;

1: stwx   ?" ( S A B -- inst )" 151 31 asm-X-form ;

: sync   ?" ( -- inst )" 0 0 0 598 31 asm-X-form ;

: tlbia   ?" ( -- inst )" 0 0 0 370 31 asm-X-form ;

1: tlbie   ?" ( B -- inst )" 0 0 rot 306 31 asm-X-form ;

: tlbsync   ?" ( -- inst )" 0 0 0 566 31 asm-X-form ;

1: tw   ?" ( TO A B -- inst )" 4 31 asm-X-form ;

1: xor   ?" ( A S B -- inst )" 316 31 asm-X-form-2 ;
1: xor. xor Rc ;

( XL-form )

: bcctr   ?" ( BO BI -- inst )" 0 528 19 asm-XL-form ;
: bcctrl bcctr LK ;

: bclr   ?" ( BO BI -- inst )" 0 16 19 asm-XL-form ;
: bclrl bclr LK ;

1: crand   ?" ( crbD crbA crbB -- inst )" 257 19 asm-XL-form ;

1: crandc   ?" ( crbD crbA crbB -- inst )" 129 19 asm-XL-form ;

1: creqv   ?" ( crbD crbA crbB -- inst )" 289 19 asm-XL-form ;

1: crnand   ?" ( crbD crbA crbB -- inst )" 225 19 asm-XL-form ;

1: crnor   ?" ( crbD crbA crbB -- inst )" 33 19 asm-XL-form ;

1: cror   ?" ( crbD crbA crbB -- inst )" 449 19 asm-XL-form ;

1: crorc   ?" ( crbD crbA crbB -- inst )" 417 19 asm-XL-form ;

1: crxor   ?" ( crbD crbA crbB -- inst )" 193 19 asm-XL-form ;

: isync   ?" ( -- inst )" 0 0 0 150 19 asm-XL-form ;

1: mcrf2   ?" ( crfD crfS -- inst )" swap 2 rotate swap 2 rotate 0 0 19 asm-XL-form ;

: rfi   ?" ( -- inst )" 0 0 0 50 19 asm-XL-form ;

: rfid   ?" ( -- inst )" 0 0 0 18 19 asm-XL-form ;

( XFL-form )

1: mtfsf   ?" ( FM B -- inst )" 711 63 asm-XFL-form ;
1: mtfsf. mtfsf Rc ;

( XO-form )

1: add   ?" ( D A B -- inst )" 266 31 asm-XO-form ;
1: add. add Rc ;
1: addo add OE ;
1: addo. add Rc OE ;

1: addc   ?" ( D A B -- inst )" 10 31 asm-XO-form ;
1: addc. addc Rc ;
1: addco addc OE ;
1: addco. addc Rc OE ;

1: adde   ?" ( D A B -- inst )" 138 31 asm-XO-form ;
1: adde. adde Rc ;
1: addeo adde OE ;
1: addeo. adde Rc OE ;

: addme   ?" ( D A -- inst )" 0 234 31 asm-XO-form ;
: addme. addme Rc ;
: addmeo addme OE ;
: addmeo. addme Rc OE ;

: addze   ?" ( D A -- inst )" 0 202 31 asm-XO-form ;
: addze. addze Rc ;
: addzeo addze OE ;
: addzeo. addze Rc OE ;

1: divw   ?" ( D A B -- inst )" 491 31 asm-XO-form ;
1: divw. divw Rc ;
1: divwo divw OE ;
1: divwo. divw Rc OE ;

1: divwu   ?" ( D A B -- inst )" 459 31 asm-XO-form ;
1: divwu. divwu Rc ;
1: divwuo divwu OE ;
1: divwuo. divwu Rc OE ;

1: mulhw   ?" ( D A B -- inst )" 75 31 asm-XO-form ;
1: mulhw. mulhw Rc ;

1: mulhwu   ?" ( D A B -- inst )" 11 31 asm-XO-form ;
1: mulhwu. mulhwu Rc ;

1: mullw   ?" ( D A B -- inst )" 235 31 asm-XO-form ;
1: mullw. mullw Rc ;
1: mullwo mullw OE ;
1: mullwo. mullw Rc OE ;

: neg   ?" ( D A -- inst )" 0 104 31 asm-XO-form ;
: neg. neg Rc ;
: nego neg OE ;
: nego. neg Rc OE ;

1: subf   ?" ( D A B -- inst )" 40 31 asm-XO-form ;
1: subf. subf Rc ;
1: subfo subf OE ;
1: subfo. subf Rc OE ;

1: subfc   ?" ( D A B -- inst )" 8 31 asm-XO-form ;
1: subfc. subfc Rc ;
1: subfco subfc OE ;
1: subfco. subfc Rc OE ;

1: subfe   ?" ( D A B -- inst )" 138 31 asm-XO-form ;
1: subfe. subfe Rc ;
1: subfeo subfe OE ;
1: subfeo. subfe Rc OE ;

: subfme   ?" ( D A -- inst )" 0 104 31 asm-XO-form ;
: subfme. subfme Rc ;
: subfmeo subfme OE ;
: subfmeo. subfme Rc OE ;

: subfze   ?" ( D A -- inst )" 0 200 31 asm-XO-form ;
: subfze. subfze Rc ;
: subfzeo subfze OE ;
: subfzeo. subfze Rc OE ;

( A-form )

: fadd   ?" ( D A B -- inst )" 0 21 63 asm-A-form ;
: fadd. fadd Rc ;

: fadds   ?" ( D A B -- inst )" 0 21 59 asm-A-form ;
: fadds. fadds Rc ;

: fdiv   ?" ( D A B -- inst )" 0 18 63 asm-A-form ;
: fdiv. fdiv Rc ;

: fdivs   ?" ( D A B -- inst )" 0 18 59 asm-A-form ;
: fdivs. fdivs Rc ;

1: fmadd   ?" ( D A C B -- inst )" 29 63 asm-A-form-2 ;
1: fmadd. fmadd Rc ;

1: fmadds   ?" ( D A C B -- inst )" 29 59 asm-A-form-2 ;
1: fmadds. fmadds Rc ;

1: fmsub   ?" ( D A C B -- inst )" 28 63 asm-A-form-2 ;
1: fmsub. fmsub Rc ;

1: fmsubs   ?" ( D A C B -- inst )" 28 59 asm-A-form-2 ;
1: fmsubs. fmsubs Rc ;

: fmul   ?" ( D A C -- inst )" 0 25 63 asm-A-form-2 ;
: fmul. fmul Rc ;

: fmuls   ?" ( D A C -- inst )" 0 25 59 asm-A-form-2 ;
: fmuls. fmuls Rc ;

1: fnmadd   ?" ( D A C B -- inst )" 31 63 asm-A-form-2 ;
1: fnmadd. fnmadd Rc ;

1: fnmadds   ?" ( D A C B -- inst )" 31 59 asm-A-form-2 ;
1: fnmadds. fnmadds Rc ;

1: fnmsub   ?" ( D A C B -- inst )" 30 63 asm-A-form-2 ;
1: fnmsub. fnmsub Rc ;

1: fnmsubs   ?" ( D A C B -- inst )" 30 59 asm-A-form-2 ;
1: fnmsubs. fnmsubs Rc ;

: fres   ?" ( D B -- inst )" 0 swap 0 24 59 asm-A-form ;
: fres. fres Rc ;

1: frsqrte   ?" ( D B -- inst )" 0 swap 0 26 63 asm-A-form ;
1: frsqrte. frsqrte Rc ;

1: fsel   ?" ( D A C B -- inst )" 23 63 asm-A-form-2 ;
1: fsel. fsel Rc ;

1: fsqrt   ?" ( D B -- inst )" 0 swap 0 22 63 asm-A-form ;
1: fsqrt. fsqrt Rc ;

1: fsqrts   ?" ( D B -- inst )" 0 swap 0 22 59 asm-A-form ;
1: fsqrts. fsqrts Rc ;

: fsub   ?" ( D A B -- inst )" 0 20 63 asm-A-form ;
: fsub. fsub Rc ;

: fsubs   ?" ( D A B -- inst )" 0 20 59 asm-A-form ;
: fsubs. fsubs Rc ;

( M-form )

2: rlwimi   ?" ( A S SH MB BE -- inst )" 20 asm-M-form ;
2: rlwimi. rlwimi Rc ;

2: rlwinm   ?" ( A S SH MB BE -- inst )" 21 asm-M-form ;
2: rlwinm. rlwinm Rc ;

2: rlwnm   ?" ( A S B MB BE -- inst )" 23 asm-M-form ;
2: rlwnm. rlwnm Rc ;

( XFX-form )

create 5:5-swap   leaf ?" ( n -- n' )
Swap lower two 5-bit groups."
	1 0 (:)
	[	i0 c0 c0 or ,
		c0 0 0 addi ,
		c0 i0 5 22 26 rlwimi ,
		c0 i0 27 27 31 rlwimi , ] ;

1: mfspr   ?" ( D spr -- inst )" 5:5-swap 339 31 asm-XFX-form ;

1: (mftb)   ?" ( D tbr -- inst )" 5:5-swap 371 31 asm-XFX-form ;

1: mtcrf   ?" ( CRM S -- inst )" swap 1 rotate 144 31 asm-XFX-form ;

2: mtspr   ?" ( spr S -- inst )" swap 5:5-swap 467 31 asm-XFX-form ;

( --- simplified mnemonics --- )

: ??-BO-BI-encoding
?" BO-encodings: ( -- BO )
D = decrement CTR, NZ = CTR non-zero, Z = CTR zero, T = true, F = false, 
ALW = always. All with optional + for branch prediction.

BI-encodings: ( -- BI )
Integer or floating point results: (LT) = less than, (GT) = greater
than, (EQ) = equal, (SO) = summary overflow, (UN) = unordered
Floating point exceptions: crFX = exception summary, crFEX = enabled
exception summary, VX = invalid operation exception, crOX = overflow
exception

combined BO-BI-encodings: ( -- BO BI )
LT, LE, EQ, GE, GT, NL, NE, NG, SO, NS, UN, NU (+ optional) are useful for bc" ;

( BO encoding symbols )

#01100 dup	constant T		1 OR constant T+
#00100 dup	constant F		1 OR constant F+
#10000 dup	constant DNZ	1 OR constant DNZ+
#01000 dup	constant DNZT	1 OR constant DNZT+
#00000 dup	constant DNZF	1 OR constant DNZF+
#10010 dup	constant DZ		1 OR constant DZ+
#01010 dup	constant DZT	1 OR constant DZT+
#00010 dup	constant DZF	1 OR constant DZF+
#10100 		constant ALW

( BI encoding symbols )

create (cr)   inline ?" ( condition cr -- bit )
Specify a bit in the condition register."
	2 0 (:) [ drop
		c1 c1 2 0 29 rlwinm ,
		c0 c0 c1 add ,
	1 ] ;

( integer or floating point results in CR0 and others )
0 constant (LT)
1 constant (GT)
2 constant (EQ)
3 constant (SO)
3 constant (UN)

( floating point exceptions )
4 constant (FX)
5 constant (FEX)
6 constant (VX)
7 constant (OX)

( combined BO and BI encoding symbols )

( without ...				... and with branch prediction bit set )
i: LT 	T (LT) ;			i: LT+ 	T+ (LT) ;
i: LE 	F (GT) ;			i: LE+ 	F+ (GT) ;
i: EQ 	T (EQ) ;			i: EQ+ 	T+ (EQ) ;
i: GE 	F (LT) ;			i: GE+ 	F+ (LT) ;
i: GT 	T (GT) ;			i: GT+ 	T+ (GT) ;
i: NL 	F (LT) ;			i: NL+ 	F+ (LT) ;
i: NE 	F (EQ) ;			i: NE+ 	F+ (EQ) ;
i: NG 	F (GT) ;			i: NG+ 	F+ (GT) ;
i: SO 	T (SO) ;			i: SO+ 	T+ (SO) ;
i: NS 	F (SO) ;			i: NS+ 	F+ (SO) ;
i: UN 	T (UN) ;			i: UN+ 	T+ (UN) ;
i: NU 	F (UN) ;			i: NU+ 	F+ (UN) ;

( branch )

( BO simplified )

2: bt   ?" ( BI BD -- inst )" T rot' bc ;

2: bf   ?" ( BI BD -- inst )" F rot' bc ;

1: bdnz   ?" ( BD -- inst )" DNZ 0 rot bc ;

2: bdnzt   ?" ( BI BD -- inst )" DNZT rot' bc ;

2: bdnzf   ?" ( BI BD -- inst )" DNZF rot' bc ;

1: bdz   ?" ( BD -- inst )" DZ 0 rot bc ;

2: bdzt   ?" ( BI BD -- inst )" DZT rot' bc ;

1: bdzf   ?" ( BI BD -- inst )" DZF rot' bc ;

: blr   ?" ( -- inst )" ALW 0 bclr ;
: blrl ALW 0 bclrl ;

: bctr   ?" ( -- inst )" 20 0 bcctr ;
: bctrl ALW 0 bcctrl ;

( BO and BI simplified )

1: blt   ?" ( BD -- inst )" LT rot bc ;
1: ble   ?" ( BD -- inst )" LE rot bc ;
1: beq   ?" ( BD -- inst )" EQ rot bc ;
1: bge   ?" ( BD -- inst )" GE rot bc ;
1: bgt   ?" ( BD -- inst )" GT rot bc ;
1: bnl   ?" ( BD -- inst )" NL rot bc ;
1: bne   ?" ( BD -- inst )" NE rot bc ;
1: bng   ?" ( BD -- inst )" NG rot bc ;
1: bso   ?" ( BD -- inst )" SO rot bc ;
1: bns   ?" ( BD -- inst )" NS rot bc ;
1: bun   ?" ( BD -- inst )" UN rot bc ;
1: bnu   ?" ( BD -- inst )" NU rot bc ;

( branch prediction )

create b+-   inline ?" ( inst -- inst' )
Set the branch prediction bit (10) in a bc, bclr and bcctr instruction."
	1 0 (:)
	[	i0 r0 1 addi ,
		c0 i0 21 10 10 rlwimi , 
		drop 1 ] ;

( common & recommended )

: nop   ?" ( -- inst )" [ 0 0 0 ori literal ] ;

2: li   ?" ( D SIMM -- inst )" r0 swap addi ;

2: lis   ?" ( D SIMM -- inst )" r0 swap addis ;

3: la   ?" ( D A d -- inst )" addi ;

2: mr   ?" ( A S -- inst )" dup or ;
2: mr. mr Rc ;

2: not   ?" ( A S -- inst )" dup nor ;
2: not. not Rc ;

2: mtcr   ?" ( S -- inst )" $ff swap mtcrf ;

( subtract )

3: subi   ?" ( D A SIMM -- inst )" 0 swap - addi ;
3: subis 0 swap - addis ;
3: subic 0 swap - addic ;
3: subic. 0 swap - addic. ;

3: sub   ?" ( D B A -- inst )" swap subf ;
3: sub. swap subf. ;
3: subo swap subfo ;
3: subo. swap subfo. ;

3: subc   ?" ( D B A -- inst )" swap subfc ;
3: subc. swap subfc. ;
3: subco swap subfco ;
3: subco. swap subfco. ;

( compare )

2: cmpwi   ?" ( A SIMM -- inst )" 0 rot' cmpi ;

2: cmpw   ?" ( A B -- inst )" 0 rot' cmp ;

2: cmplwi   ?" ( A UIMM -- inst )" 0 rot' cmpli ;

2: cmplw   ?" ( A B -- inst )" 0 rot' cmpl ;

( condition register logical )

1: crset   ?" ( bx -- inst )" dup dup creqv ;
1: crclr   ?" ( bx -- inst )" dup dup crxor ;
2: crmove   ?" ( bx by -- inst )" dup cror ;
2: crnot   ?" ( bx by -- inst )" dup crnor ;

( special purpose registers )

( move to spr )
1: mtxer   ?" ( S -- inst )" 1 swap mtspr ;
1: mtlr   ?" ( S -- inst )" 8 swap mtspr ;
1: mtctr   ?" ( S -- inst )" 9 swap mtspr ;
1: mtdsisr   ?" ( S -- inst )" 18 swap mtspr ;
1: mtdar   ?" ( S -- inst )" 19 swap mtspr ;
1: mtdec   ?" ( S -- inst )" 22 swap mtspr ;
1: mtsdr1 ( S -- inst ) 25 swap mtspr ;
1: mtsrr0 ( S -- inst ) 26 swap mtspr ;
1: mtsrr1 ( S -- inst ) 27 swap mtspr ;
1: mtasr   ?" ( S -- inst )" 280 swap mtspr ;
1: mtear   ?" ( S -- inst )" 282 swap mtspr ;
1: mttbl   ?" ( S -- inst )" 284 swap mtspr ;
1: mttbu   ?" ( S -- inst )" 285 swap mtspr ;
2: mtibatu   ?" ( n S -- inst )" swap 1 rotate 528 + swap mtspr ;
2: mtibatl   ?" ( n S -- inst )" swap 1 rotate 529 + swap mtspr ;
2: mtdbatu   ?" ( n S -- inst )" swap 1 rotate 536 + swap mtspr ;
2: mtdbatl   ?" ( n S -- inst )" swap 1 rotate 537 + swap mtspr ;

( move from spr )
1: mfxer   ?" ( D -- inst )" 1 mfspr ;
1: mflr   ?" ( D -- inst )" 8 mfspr ;
1: mfctr   ?" ( D -- inst )" 9 mfspr ;
1: mfdsisr   ?" ( D -- inst )" 18 mfspr ;
1: mfdar   ?" ( D -- inst )" 19 mfspr ;
1: mfdec   ?" ( D -- inst )" 22 mfspr ;
1: mfsdr1 ( D -- inst ) 25 mfspr ;
1: mfsrr0 ( D -- inst ) 26 mfspr ;
1: mfsrr1 ( D -- inst ) 27 mfspr ;
1: mfsprg   ?" ( D n -- inst )" 272 + mfspr ;
1: mfasr   ?" ( D -- inst )" 280 mfspr ;
1: mfear   ?" ( D -- inst )" 282 mfspr ;
1: mftb   ?" ( D -- inst )" 268 (mftb) ;
1: mftbu   ?" ( D -- inst )" 269 (mftb) ;
1: mfpvr   ?" ( D -- inst )" 287 mfspr ;
1: mfibatu   ?" ( D n -- inst )" 1 rotate 528 + mfspr ;
1: mfibatl   ?" ( D n -- inst )" 1 rotate 529 + mfspr ;
1: mfdbatu   ?" ( D n -- inst )" 1 rotate 536 + mfspr ;
1: mfdbatl   ?" ( D n -- inst )" 1 rotate 537 + mfspr ;

( rotate and shift )

2: extlwi   ?" ( A S n b -- inst )
Extract and left justify immediate."
	0 rot 1 - rlwinm ;
2: extlwi. extlwi Rc ;

2: extrwi   ?" ( A S n b -- inst )
Extract and right justify immediate."
	[	t0 c0 mr ,
		c0 c0 c1 add ,
		c1 32 li ,
		c1 c1 t0 sub ,
		c2 31 li ,
		drop 3 ] 
		rlwinm ;
2: extrwi. extrwi Rc ;

2: inslwi   ?" ( A S n b -- inst )
Insert from left immediate."
	[	c2 c0 c1 add ,
		c2 c2 1 subi ,
		c0 32 li ,
		c0 c0 c1 sub ,
		drop 3 ]
		rlwimi ;
2: inslwi. inslwi Rc ;

2: insrwi   ?" ( A S n b -- inst )
Insert from right immediate."
	[	c2 c0 c1 add ,
		c0 32 li ,
		c0 c0 c2 sub ,
		c2 c2 1 subi ,
		drop 3 ]
		rlwimi ;
2: insrwi. insrwi Rc ;

1: rotlwi   ?" ( A S n -- inst )
Rotate left immediate." 
	0 31 rlwinm ;
1: rotlwi. rotlwi Rc ;

2: rotrwi   ?" ( A S n -- inst )
Rotate right immediate." 
	32 - 0 swap - 0 31 rlwinm ;
2: rotrwi. rotrwi Rc ;

1: rotlw   ?" ( A S B -- inst )
Rotate left."
	0 31 rlwnm ;
1: rotlw. rotlw Rc ;

1: slwi   ?" ( A S n -- inst )
Shift left immediate."
	0 over 31 - 0 swap - rlwinm ;
1: slwi. slwi Rc ;

1: srwi   ?" ( A S n -- inst )
Shift right immediate."
	dup 32 - 0 swap - swap 31 rlwinm ;
1: srwi. srwi Rc ;

1: clrlwi   ?" ( A S n -- inst )
Clear left immediate."
	0 swap 31 rlwinm ;
1: clrlwi. clrlwi Rc ;

1: clrrwi   ?" ( A S n -- inst )
Clear right immediate."
	0 0 rot 31 - 0 swap - rlwinm ;
1: clrrwi. clrrwi Rc ;

2: clrlslwi   ?" ( A S b n -- inst )
Clear left and shift left immediate."
	[	c2 31 li ,
		c2 c2 c1 sub ,
		t0 c1 mr ,
		c1 c0 c1 sub ,
		c0 t0 mr ,
		drop 3 ]
		rlwinm ;
2: clrlslwi. clrlslwi Rc ;
