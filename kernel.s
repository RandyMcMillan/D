; This file contains the source code of D, an interactive compiler
; for MacOS X based on FORTH

; Copyright 2002 Daniel Engeler
; www.ee.ethz.ch/~danengel, danengel@ee.ethz.ch

; D uses the GNU Readline Library
; Copyright (C) 1988-2001 Free Software Foundation, Inc.

; D is free software; you can redistribute it and/or modify it under the
; terms of the GNU General Public License as published by the Free
; Software Foundation; either version 2 of the License, or (at your
; option) any later version.
; D is distributed in the hope that it will be useful, but WITHOUT ANY
; WARRANTY; without even the implied warranty of MERCHANTABILITY or
; FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
; for more details.
; You should have received a copy of the GNU General Public License
; along with D; if not, write to the Free Software Foundation, Inc.
; 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

; You can compile this file using the following sequence of commands:
; sed -f ugly.sed kernel.s > kernel~.s
; cc -framework CoreServices kernel~.s -lreadline -o D
; strip D
; rm kernel~.s


; stubs
.data

; rl_extend_line_buffer
.picsymbol_stub
L_rl_extend_line_buffer_DL_stub:
	.indirect_symbol _rl_extend_line_buffer
	mflr r0
	bcl 20,31,L10_DL_pb
L10_DL_pb:
	mflr r11
	addis r11,r11,ha16(L10_DL_lz-L10_DL_pb)
	mtlr r0
	lwz r12,lo16(L10_DL_lz-L10_DL_pb)(r11)
	mtctr r12
	addi r11,r11,lo16(L10_DL_lz-L10_DL_pb)
	bctr
.lazy_symbol_pointer
L10_DL_lz:
	.indirect_symbol _rl_extend_line_buffer
	.long dyld_stub_binding_helper

; add_history
.picsymbol_stub
L_add_history_DL_stub:
	.indirect_symbol _add_history
	mflr r0
	bcl 20,31,L9_DL_pb
L9_DL_pb:
	mflr r11
	addis r11,r11,ha16(L9_DL_lz-L9_DL_pb)
	mtlr r0
	lwz r12,lo16(L9_DL_lz-L9_DL_pb)(r11)
	mtctr r12
	addi r11,r11,lo16(L9_DL_lz-L9_DL_pb)
	bctr
.lazy_symbol_pointer
L9_DL_lz:
	.indirect_symbol _add_history
	.long dyld_stub_binding_helper

; readline
.picsymbol_stub
L_readline_DL_stub:
	.indirect_symbol _readline
	mflr r0
	bcl 20,31,L12_DL_pb
L12_DL_pb:
	mflr r11
	addis r11,r11,ha16(L12_DL_lz-L12_DL_pb)
	mtlr r0
	lwz r12,lo16(L12_DL_lz-L12_DL_pb)(r11)
	mtctr r12
	addi r11,r11,lo16(L12_DL_lz-L12_DL_pb)
	bctr
.lazy_symbol_pointer
L12_DL_lz:
	.indirect_symbol _readline
	.long dyld_stub_binding_helper

; MakeDataExecutable
.picsymbol_stub
L_MakeDataExecutable_DL_stub:
	.indirect_symbol _MakeDataExecutable
	mflr r0
	bcl 20,31,L0_DL__MakeDataExecutable
L0_DL__MakeDataExecutable:
	mflr r11
	addis r11,r11,ha16(L_MakeDataExecutable_DL_lazy_ptr-L0_DL__MakeDataExecutable)
	mtlr r0
	lwz r12,lo16(L_MakeDataExecutable_DL_lazy_ptr-L0_DL__MakeDataExecutable)(r11)
	mtctr r12
	addi r11,r11,lo16(L_MakeDataExecutable_DL_lazy_ptr-L0_DL__MakeDataExecutable)
	bctr
.lazy_symbol_pointer
L_MakeDataExecutable_DL_lazy_ptr:
	.indirect_symbol _MakeDataExecutable
	.long dyld_stub_binding_helper

; malloc
.picsymbol_stub
L_malloc_DL_stub:
.indirect_symbol _malloc
	mflr r0
	bcl	20, 31, L0_DL__malloc
L0_DL__malloc:
	mflr r11
	addis r11, r11, ha16( L_malloc_DL_lazy_ptr-L0_DL__malloc )
	mtlr r0
	lwz r12, lo16( L_malloc_DL_lazy_ptr-L0_DL__malloc )(r11)
	mtctr r12
	addi r11, r11, lo16( L_malloc_DL_lazy_ptr-L0_DL__malloc )
	bctr
.lazy_symbol_pointer
L_malloc_DL_lazy_ptr:
	.indirect_symbol _malloc
	.long dyld_stub_binding_helper

; realloc
.picsymbol_stub
L_realloc_DL_stub:
.indirect_symbol _realloc
	mflr r0
	bcl	20, 31, L0_DL__realloc
L0_DL__realloc:
	mflr r11
	addis r11, r11, ha16( L_realloc_DL_lazy_ptr-L0_DL__realloc )
	mtlr r0
	lwz r12, lo16( L_realloc_DL_lazy_ptr-L0_DL__realloc )(r11)
	mtctr r12
	addi r11, r11, lo16( L_realloc_DL_lazy_ptr-L0_DL__realloc )
	bctr
.lazy_symbol_pointer
L_realloc_DL_lazy_ptr:
	.indirect_symbol _realloc
	.long dyld_stub_binding_helper

; free
.picsymbol_stub
L_free_DL_stub:
	.indirect_symbol _free
	mflr r0
	bcl 20,31,L0_DL__free
L0_DL__free:
	mflr r11
	addis r11,r11,ha16(L_free_DL_lazy_ptr-L0_DL__free)
	mtlr r0
	lwz r12,lo16(L_free_DL_lazy_ptr-L0_DL__free)(r11)
	mtctr r12
	addi r11,r11,lo16(L_free_DL_lazy_ptr-L0_DL__free)
	bctr
.lazy_symbol_pointer
L_free_DL_lazy_ptr:
	.indirect_symbol _free
	.long dyld_stub_binding_helper

; setvbuf
.picsymbol_stub
L_setvbuf_DL_stub:
.indirect_symbol _setvbuf
	mflr r0  
	bcl 20, 31, L0_DL__setvbuf
L0_DL__setvbuf:
	mflr r11  
	addis r11, r11, ha16( L_setvbuf_DL_lazy_ptr-L0_DL__setvbuf )
	mtlr r0  
	lwz r12, lo16( L_setvbuf_DL_lazy_ptr-L0_DL__setvbuf )(r11) 
	mtctr r12  
	addi r11, r11, lo16( L_setvbuf_DL_lazy_ptr-L0_DL__setvbuf )
	bctr   
.lazy_symbol_pointer
L_setvbuf_DL_lazy_ptr:
	.indirect_symbol _setvbuf
	.long dyld_stub_binding_helper


; fputc
.picsymbol_stub
L_fputc_DL_stub:
	.indirect_symbol _fputc
	mflr r0
	bcl 20,31,L0_DL__fputc
L0_DL__fputc:
	mflr r11
	addis r11,r11,ha16(L_fputc_DL_lazy_ptr-L0_DL__fputc)
	mtlr r0
	lwz r12,lo16(L_fputc_DL_lazy_ptr-L0_DL__fputc)(r11)
	mtctr r12
	addi r11,r11,lo16(L_fputc_DL_lazy_ptr-L0_DL__fputc)
	bctr
.lazy_symbol_pointer
L_fputc_DL_lazy_ptr:
	.indirect_symbol _fputc
	.long dyld_stub_binding_helper

; fgetc
.picsymbol_stub
L_fgetc_DL_stub:
	.indirect_symbol _fgetc
	mflr r0
	bcl 20,31,L0_DL__fgetc
L0_DL__fgetc:
	mflr r11
	addis r11,r11,ha16(L_fgetc_DL_lazy_ptr-L0_DL__fgetc)
	mtlr r0
	lwz r12,lo16(L_fgetc_DL_lazy_ptr-L0_DL__fgetc)(r11)
	mtctr r12
	addi r11,r11,lo16(L_fgetc_DL_lazy_ptr-L0_DL__fgetc)
	bctr
.lazy_symbol_pointer
L_fgetc_DL_lazy_ptr:
	.indirect_symbol _fgetc
	.long dyld_stub_binding_helper

; tcsetattr
.picsymbol_stub
L_tcsetattr_DL_stub:
	.indirect_symbol _tcsetattr
	mflr r0
	bcl 20,31,L0_DL__tcsetattr
L0_DL__tcsetattr:
	mflr r11
	addis r11,r11,ha16(L_tcsetattr_DL_lazy_ptr-L0_DL__tcsetattr)
	mtlr r0
	lwz r12,lo16(L_tcsetattr_DL_lazy_ptr-L0_DL__tcsetattr)(r11)
	mtctr r12
	addi r11,r11,lo16(L_tcsetattr_DL_lazy_ptr-L0_DL__tcsetattr)
	bctr
.lazy_symbol_pointer
L_tcsetattr_DL_lazy_ptr:
	.indirect_symbol _tcsetattr
	.long dyld_stub_binding_helper

; tcgetattr
.picsymbol_stub
L_tcgetattr_DL_stub:
	.indirect_symbol _tcgetattr
	mflr r0
	bcl 20,31,L0_DL__tcgetattr
L0_DL__tcgetattr:
	mflr r11
	addis r11,r11,ha16(L_tcgetattr_DL_lazy_ptr-L0_DL__tcgetattr)
	mtlr r0
	lwz r12,lo16(L_tcgetattr_DL_lazy_ptr-L0_DL__tcgetattr)(r11)
	mtctr r12
	addi r11,r11,lo16(L_tcgetattr_DL_lazy_ptr-L0_DL__tcgetattr)
	bctr
.lazy_symbol_pointer
L_tcgetattr_DL_lazy_ptr:
	.indirect_symbol _tcgetattr
	.long dyld_stub_binding_helper

; fclose
.picsymbol_stub
L_fclose_DL_stub:
	.indirect_symbol _fclose
	mflr r0
	bcl 20,31,L0_DL__fclose
L0_DL__fclose:
	mflr r11
	addis r11,r11,ha16(L_fclose_DL_lazy_ptr-L0_DL__fclose)
	mtlr r0
	lwz r12,lo16(L_fclose_DL_lazy_ptr-L0_DL__fclose)(r11)
	mtctr r12
	addi r11,r11,lo16(L_fclose_DL_lazy_ptr-L0_DL__fclose)
	bctr
.lazy_symbol_pointer
L_fclose_DL_lazy_ptr:
	.indirect_symbol _fclose
	.long dyld_stub_binding_helper

; fopen
.picsymbol_stub
L_fopen_DL_stub:
	.indirect_symbol _fopen
	mflr r0
	bcl 20,31,L0_DL__fopen
L0_DL__fopen:
	mflr r11
	addis r11,r11,ha16(L_fopen_DL_lazy_ptr-L0_DL__fopen)
	mtlr r0
	lwz r12,lo16(L_fopen_DL_lazy_ptr-L0_DL__fopen)(r11)
	mtctr r12
	addi r11,r11,lo16(L_fopen_DL_lazy_ptr-L0_DL__fopen)
	bctr
.lazy_symbol_pointer
L_fopen_DL_lazy_ptr:
	.indirect_symbol _fopen
	.long dyld_stub_binding_helper


.non_lazy_symbol_pointer
L_rl_completer_word_break_characters_DL_non_lazy_ptr:
	.indirect_symbol _rl_completer_word_break_characters
	.long 0

L_rl_completion_entry_function_DL_non_lazy_ptr:
	.indirect_symbol _rl_completion_entry_function
	.long 0

L_rl_erase_empty_line_DL_non_lazy_ptr:
	.indirect_symbol _rl_erase_empty_line
	.long 0

L_rl_readline_name_DL_non_lazy_ptr:
	.indirect_symbol _rl_readline_name
	.long 0

L_rl_end_DL_non_lazy_ptr:
	.indirect_symbol _rl_end
	.long 0

L___sF_DL_non_lazy_ptr:
	.indirect_symbol ___sF
	.long 0


; macros
.text
.macro LOAD
	addis	$0,		ref,	ha16( $1 - data_area_reference )
	lwz		$0,		lo16( $1 - data_area_reference )($0)
.endmacro

.macro LEA
	addis	$0,		ref,	ha16( $1 - data_area_reference )
	la		$0,		lo16( $1 - data_area_reference )($0)
.endmacro

.macro STORE
	addis	i0,		ref,	ha16( $1 - data_area_reference )
	stw		$0,		lo16( $1 - data_area_reference)(i0)
.endmacro

.macro PROLOG0
	mflr	r0
	stwu	r0,		-4(ssp)
.endmacro

.macro PROLOG1
	mflr	r0
	stwu	s0,		-4(ssp)
	stwu	r0,		-4(ssp)
.endmacro

.macro PROLOG2
	mflr	r0
	stwu	s1,		-4(ssp)
	stwu	s0,		-4(ssp)
	stwu	r0,		-4(ssp)
.endmacro

.macro PROLOG3
	mflr	r0
	stwu	s2,		-4(ssp)
	stwu	s1,		-4(ssp)
	stwu	s0,		-4(ssp)
	stwu	r0,		-4(ssp)
.endmacro

.macro PROLOG4
	mflr	r0
	stwu	s3,		-4(ssp)
	stwu	s2,		-4(ssp)
	stwu	s1,		-4(ssp)
	stwu	s0,		-4(ssp)
	stwu	r0,		-4(ssp)
.endmacro

.macro PROLOG5
	mflr	r0
	stwu	s4,		-4(ssp)
	stwu	s3,		-4(ssp)
	stwu	s2,		-4(ssp)
	stwu	s1,		-4(ssp)
	stwu	s0,		-4(ssp)
	stwu	r0,		-4(ssp)
.endmacro

.macro EPILOG0
	lwz		r0,		0(ssp)
	addi	ssp,	ssp,	4
	mtlr	r0
	blr
.endmacro

.macro EPILOG1
	lwz		r0,		0(ssp)
	lwz		s0,		4(ssp)
	mtlr	r0
	addi	ssp,	ssp,	8
	blr
.endmacro

.macro EPILOG2
	lwz		r0,		0(ssp)
	lwz		s0,		4(ssp)
	lwz		s1,		8(ssp)
	mtlr	r0
	addi	ssp,	ssp,	12
	blr
.endmacro

.macro EPILOG3
	lwz		r0,		0(ssp)
	lwz		s0,		4(ssp)
	lwz		s1,		8(ssp)
	lwz		s2,		12(ssp)
	mtlr	r0
	addi	ssp,	ssp,	16
	blr
.endmacro

.macro EPILOG4
	lwz		r0,		0(ssp)
	lwz		s0,		4(ssp)
	lwz		s1,		8(ssp)
	lwz		s2,		12(ssp)
	lwz		s3,		16(ssp)
	mtlr	r0
	addi	ssp,	ssp,	20
	blr
.endmacro

.macro EPILOG5
	lwz		r0,		0(ssp)
	lwz		s0,		4(ssp)
	lwz		s1,		8(ssp)
	lwz		s2,		12(ssp)
	lwz		s3,		16(ssp)
	lwz		s4,		20(ssp)
	mtlr	r0
	addi	ssp,	ssp,	24
	blr
.endmacro

; flags
scf00 = 0 << 0
scf01 = 1 << 0
scf02 = 2 << 0
scf03 = 3 << 0

scf10 = 0 << 2
scf11 = 1 << 2
scf12 = 2 << 2
scf13 = 3 << 2

scf20 = 0 << 4
scf21 = 1 << 4
scf22 = 2 << 4
scf23 = 3 << 4

scf30 = 0 << 6
scf31 = 1 << 6
scf32 = 2 << 6
scf33 = 3 << 6

inline 		= 5 ; inline & leaf
immediate 	= 2
leaf 		= 4
explained	= 8

; some global data
.data
.align 2
_argc:					.long		0
_argv:					.long		0
_readline_identifier:	.asciz		"D"
_readline_prompt:		.asciz		">> "
_readline_breakers:		.asciz		" "
_D_welcome_string:		.asciz		"Welcome to D!
Copyright 2002 Daniel Engeler
D is free software and comes with ABSOLUTELY NO WARRANTY,
see the GNU General Public License for details.\n"
						.align		2

.text
.align 2
.globl _main
_main:					mflr		r0
						; we need 'ref' to reference the data area
						bl			data_area_reference
data_area_reference:	mflr		ref
						; prolog
						stw			r0, 	8(ssp)
						stwu 		ssp, 	-(24 + 32 + 4*(31-13+1))(ssp)
						stmw		s0,		( 24 + 32 )(ssp)
						
						; save argc and argv
						STORE		r3,		_argc
						STORE		r4,		_argv
						
						; init readline library
						LOAD		t0,		L_rl_completer_word_break_characters_DL_non_lazy_ptr
						LEA			t1,		_readline_breakers
						stw			t1,		0(t0)

						LOAD		t0,		L_rl_erase_empty_line_DL_non_lazy_ptr
						li			t1,		0
						stw			t1,		0(t0)

						LOAD		t0,		L_rl_readline_name_DL_non_lazy_ptr
						LOAD		t1,		_readline_identifier
						stw			t1,		0(t0)

						LOAD		t0, 	L_rl_completion_entry_function_DL_non_lazy_ptr
						LEA			t1,		editor_cpl_0
						stw			t1,		0(t0)

						; set stdout to unbuffered
;						LOAD		t0,		L___sF_DL_non_lazy_ptr
;						addi		t0,		t0,		88
;						li			t1,		0
;						li			t2,		2
;						li			t3,		0
;						bl			L_setvbuf_DL_stub

						; allocate user stack (1 MB)
						li			s0,		1
						rlwinm		s0,		s0,		20, 0, 31
						mr			r3,		s0
						bl			L_malloc_DL_stub
						add			sp,		r3,		s0
						STORE		sp,		_sp0

						; allocate instruction dictionary (1 MB)
						li			r3,		1
						rlwinm		r3,		r3,		20, 0, 31
						bl			L_malloc_DL_stub
						mr			idp,	r3
						STORE		r3,		_here0
						
						; allocate data dictionary (1 MB)
						li			r3,		1
						rlwinm		r3,		r3,		20, 0, 31
						bl			L_malloc_DL_stub
						mr			ddp,	r3
						STORE		r3,		_there0

						; save ssp, rtoc, ref
						STORE		ssp,	_ssp0
						STORE		rtoc,	_rtoc0
						STORE		ref,	_ref0
						
						; print welcome message
						LEA			c0,		_D_welcome_string
						bl			type_1
						
						; process argc and argv:
						; if argc>1, (learn) argv[1]
						LOAD		t0,		_argc
						cmpwi		t0,		2
						blt+		main_no_arg
						LOAD		t0,		_argv
						lwz			c0,		4(t0)
						bl			learnPT_1
main_no_arg:
						; enter dictionary
						bl			interpreter_0

						; epilog
main_exit:				li			r3,		0
						lmw			s0, 	( 24 + 32 )(ssp)
						lwz			ssp,	0(ssp)
						lwz			r0, 	8(ssp)
						mtlr		r0
						blr

; ----------------------------------
; !ssp
; ----------------------------------
.data
restore_ssp_l:			.long		0
						.byte		explained | inline, 0, 0, scf00
						.long		restore_ssp_0, 0, 0, 0
						.ascii		"!ss"
						.asciz		"p"
						.align		2
						.asciz		"( -- )
Restore initial system stack pointer."
						.align		2
_ssp0:					.long		0

.text
restore_ssp_0:			LOAD		ssp,	_ssp0
						blr

; ----------------------------------
; !rtoc
; ----------------------------------
.data
restore_rtoc_l:			.long		restore_ssp_l
						.byte		explained | inline, 0, 0, scf00
						.long		restore_rtoc_0, 0, 0, 0
						.ascii		"!rt"
						.asciz		"oc"
						.align		2
						.asciz		"( -- )
Restore initial GPR2."
						.align		2
_rtoc0:					.long		0

.text
restore_rtoc_0:			LOAD		rtoc,	_rtoc0
						blr

; ----------------------------------
; !ref
; ----------------------------------
.data
restore_ref_l:			.long		restore_rtoc_l
						.byte		explained, 0, 0, scf00
						.long		restore_ref_0, 0, 0, 0
						.ascii		"!r"
						.asciz		"ef"
						.align		2
						.asciz		"( -- )
Restore initial GPR25."
						.align		2
_ref0:					.long		0

.text
restore_ref_0:			PROLOG0
						bl			restore_ref_mark
restore_ref_mark:		mflr		t0
						addis		ref,	t0,		ha16(_ref0 - restore_ref_mark)
						lwz			ref,	lo16(_ref0 - restore_ref_mark)(ref)
						EPILOG0

; ----------------------------------
; sp0
; ----------------------------------
.data
sp0_l:					.long		restore_ref_l
						.byte		explained | inline, 0, 0, scf01
						.long		sp0_0, 0, 0, 0
						.asciz		"sp0"
						.align		2
						.asciz		"( -- u )
Initial user stack pointer"
						.align		2
_sp0:					.long		0

.text
sp0_0:					LOAD		c0,		_sp0
						blr

; ----------------------------------
; here0
; ----------------------------------
.data
here0_l:				.long		sp0_l
						.byte		explained | inline, 0, 0, scf01 | scf12 | scf23
						.long		here0_0, here0_1, here0_2, 0
						.asciz		"here0"
						.align		2
						.asciz		"( -- var )
Instruction dictionary pointer after the last word"
						.align		2
_here0:					.long		0

.text
here0_0:				LEA			c0,		_here0
						blr
here0_1:				LEA			c1,		_here0
						blr
here0_2:				LEA			c2,		_here0
						blr

; ----------------------------------
; there0
; ----------------------------------
.data
there0_l:				.long		here0_l
						.byte		explained | inline, 0, 0, scf01 | scf12 | scf23
						.long		there0_0, there0_1, there0_2, 0
						.asciz		"there0"
						.align		2
						.asciz		"( -- var )
Data dictionary pointer after the last word"
						.align		2
_there0:				.long		0

.text
there0_0:				LEA			c0,		_there0
						blr
there0_1:				LEA			c1,		_there0
						blr
there0_2:				LEA			c2,		_there0
						blr


; ----------------------------------
; malloc
; ----------------------------------
.data
malloc_l:				.long		there0_l
						.byte		explained, 0, 0, scf11
						.long		0, malloc_1, 0, 0
						.asciz		"malloc"
						.align		2
						.asciz		"( size -- a )
Allocate memory."
						.align		2

.text
malloc_1:				mflr		t0
						mfctr		t1
						stwu		t0,		-4(ssp)
						stwu		t1,		-4(ssp)

						stwu		ssp,	-64(ssp)
						mr			r3,		c0
						bl			L_malloc_DL_stub
						mr			c0,		r3
						addi		ssp,	ssp,	64
						
						lwz			t1,		0(ssp)
						lwz			t0,		4(ssp)
						addi		ssp,	ssp,	8
						mtlr		t0
						mtctr		t1
						blr

; ----------------------------------
; realloc
; ----------------------------------
.data
realloc_l:				.long		malloc_l
						.byte		explained, 0, 0, scf21
						.long		0, 0, realloc_l, 0
						.asciz		"realloc"
						.align		2
						.asciz		"( a size -- a )
Reallocate memory."
						.align		2

.text
realloc_2:				mflr		t0
						mfctr		t1
						stwu		t0,		-4(ssp)
						stwu		t1,		-4(ssp)

						stwu		ssp,	-64(ssp)
						mr			r3,		c0
						mr			r4,		c1
						bl			L_realloc_DL_stub
						mr			c0,		r3
						addi		ssp,	ssp,	64

						lwz			t1,		0(ssp)
						lwz			t0,		4(ssp)
						addi		ssp,	ssp,	8
						mtlr		t0
						mtctr		t1
						blr

; ----------------------------------
; free
; ----------------------------------
.data
free_l:					.long		realloc_l
						.byte		explained, 0, 0, scf10
						.long		0, free_1, 0, 0
						.asciz		"free"
						.align		2
						.asciz		"( a )
Free memory."
						.align		2

.text
free_1:					mflr		t0
						mfctr		t1
						stwu		t0,		-4(ssp)
						stwu		t1,		-4(ssp)

						stwu		ssp,	-64(ssp)
						mr			r3,		c0
						bl 			L_free_DL_stub
						addi		ssp,	ssp,	64
						
						lwz			t1,		0(ssp)
						lwz			t0,		4(ssp)
						addi		ssp,	ssp,	8
						mtlr		t0
						mtctr		t1
						blr

; ----------------------------------
; fopen
; ----------------------------------
.data
fopen_l:				.long		free_l
						.byte		explained, 0, 0, scf21
						.long		0, 0, fopen_2, 0
						.asciz		"fopen"
						.align		2
						.asciz		"( path mode -- file )
Open file."
						.align		2

.text
fopen_2:				mflr		t0
						mfctr		t1
						stwu		t0,		-4(ssp)
						stwu		t1,		-4(ssp)

						stwu		ssp,	-64(ssp)
						mr			r3,		c0
						mr			r4,		c1
						bl			L_fopen_DL_stub
						mr			c0,		r3
						addi		ssp,	ssp,	64
						
						lwz			t1,		0(ssp)
						lwz			t0,		4(ssp)
						addi		ssp,	ssp,	8
						mtlr		t0
						mtctr		t1
						blr

; ----------------------------------
; fclose
; ----------------------------------
.data
fclose_l:				.long		fopen_l
						.byte		explained, 0, 0, scf10
						.long		0, fclose_1, 0, 0
						.asciz		"fclose"
						.align		2
						.asciz		"( file )
Close file."
						.align		2

.text
fclose_1:				mflr		t0
						mfctr		t1
						stwu		t0,		-4(ssp)
						stwu		t1,		-4(ssp)

						stwu		ssp,	-64(ssp)
						mr			r3,		c0
						bl			L_fclose_DL_stub
						addi		ssp,	ssp,	64
						
						lwz			t1,		0(ssp)
						lwz			t0,		4(ssp)
						addi		ssp,	ssp,	8
						mtlr		t0
						mtctr		t1
						blr

; ----------------------------------
; fgetc
; ----------------------------------
.data
fgetc_l:				.long		fclose_l
						.byte		explained, 0, 0, scf11
						.long		0, fgetc_1, 0, 0
						.asciz		"fgetc"
						.align		2
						.asciz		"( file -- c )
Read byte from file."
						.align		2

.text
fgetc_1:				mflr		t0
						mfctr		t1
						stwu		t0,		-4(ssp)
						stwu		t1,		-4(ssp)

						stwu		ssp,	-64(ssp)
						mr			r3,		c0
						bl 			L_fgetc_DL_stub
						mr			c0,		r3
						addi		ssp,	ssp,	64
						
						lwz			t1,		0(ssp)
						lwz			t0,		4(ssp)
						addi		ssp,	ssp,	8
						mtlr		t0
						mtctr		t1
						blr

; ----------------------------------
; fputc
; ----------------------------------
.data
fputc_l:				.long		fgetc_l
						.byte		explained, 0, 0, scf21
						.long		0, 0, fputc_2, 0
						.asciz		"fputc"
						.align		2
						.asciz		"( c file -- error )
Write byte to file."
						.align		2

.text
fputc_2:				mflr		t0
						mfctr		t1
						stwu		t0,		-4(ssp)
						stwu		t1,		-4(ssp)

						stwu		ssp,	-64(ssp)
						mr			r3,		c0
						mr			r4,		c1
						bl 			L_fputc_DL_stub
						mr			c0,		r3
						addi		ssp,	ssp,	64
						
						lwz			t1,		0(ssp)
						lwz			t0,		4(ssp)
						addi		ssp,	ssp,	8
						mtlr		t0
						mtctr		t1
						blr

; ----------------------------------
; MakeDataExecutable
; ----------------------------------
.data
MakeDataExecutable_l:	.long		fputc_l
						.byte		explained, 0, 0, scf20
						.long		0, 0, MakeDataExecutable_2, 0
						.asciz		"MakeDataExecutable"
						.align		2
						.asciz		"( a # )
Uses the CoreServices routine MakeDataExecutable to prepare # bytes
starting at a to be executed."
						.align		2

.text
MakeDataExecutable_2:	mflr		t0
						mfctr		t1
						stwu		t0,		-4(ssp)
						stwu		t1,		-4(ssp)

						stwu		ssp,	-64(ssp)
						mr			r3,		c0
						mr			r4,		c1
						bl 			L_MakeDataExecutable_DL_stub
						addi		ssp,	ssp,	64
						
						lwz			t1,		0(ssp)
						lwz			t0,		4(ssp)
						addi		ssp,	ssp,	8
						mtlr		t0
						mtctr		t1
						blr

; ----------------------------------
; std
; ----------------------------------
.data
std_l:					.long		MakeDataExecutable_l
						.byte		explained | inline, 0, 0, scf11
						.long		0, std_1, 0, 0
						.asciz		"std"
						.align		2
						.asciz		"( n -- file )
Return stdin (n=0), stdout (1) or stderr (2)."
						.align		2

.text
std_1:					LOAD		i0,		L___sF_DL_non_lazy_ptr
						mulli		c0,		c0,		88
						add			c0,		c0,		i0
						blr

; ----------------------------------
; (emit)
; ----------------------------------
.data
emitPT_l:				.long		std_l
						.byte		explained | inline, 0, 0, scf01 | scf12 | scf23
						.long		emitPT_0, emitPT_1, emitPT_2, 0
						.asciz		"(emit)"
						.align		2
						.asciz		"( -- var )
Address of print code with ( c -- )"
						.align		2
_emitPT:				.long		editor_emit_1

.text
emitPT_0:				LEA			c0,		_emitPT
						blr
emitPT_1:				LEA			c1,		_emitPT
						blr
emitPT_2:				LEA			c2,		_emitPT
						blr

; ----------------------------------
; emit
; ----------------------------------
.data
emit_l:					.long		emitPT_l
						.byte		explained, 0, 0, scf10
						.long		0, emit_1, 0, 0
						.asciz		"emit"
						.align		2
						.asciz		"( c )
Print byte. 
Call the code in (emit)."
						.align		2

.text
emit_1:					PROLOG0
						LOAD		t0,		_emitPT
						mtlr		t0
						blrl
						EPILOG0

; ----------------------------------
; (key)
; ----------------------------------
.data
keyPT_l:				.long		emit_l
						.byte		explained | inline, 0, 0, scf01 | scf12 | scf23
						.long		keyPT_0, keyPT_1, keyPT_2, 0
						.asciz		"(key)"
						.align		2
						.asciz		"( -- var )
Address of input code with ( -- c )"
						.align		2
_keyPT:					.long		editor_key_0

.text
keyPT_0:				LEA			c0,		_keyPT
						blr
keyPT_1:				LEA			c1,		_keyPT
						blr
keyPT_2:				LEA			c2,		_keyPT
						blr

; ----------------------------------
; key
; ----------------------------------
.data
key_l:					.long		keyPT_l
						.byte		explained, 0, 0, scf01
						.long		key_0, 0, 0, 0
						.asciz		"key"
						.align		2
						.asciz		"( -- c ) ( c )
Read byte.
Call the code stored in (key), translate \\n to linefeed, \\t to tab,
\\\\ to \\. Ignore \\<newline>"
						.align		2
key_STR:				.asciz		"Use only \\n, \\t, \\\\ and \\<newline>."
						.align		2

.text
key_0:					PROLOG0
						LOAD		t0,		_keyPT
						mtlr		t0
						blrl
						
						cmpwi		c0,		92
						bne+		key_done
						
						; read again
						LOAD		t0,		_keyPT
						mtlr		t0
						blrl

						; translate
key_n:					cmpwi		c0,		110		; newline
						bne-		key_t
						li			c0,		10
						b			key_done

key_t:					cmpwi		c0,		116		; tab
						bne-		key_backslash
						li			c0,		9
						b			key_done

key_backslash:			cmpwi		c0,		92		; backslash
						bne-		key_ignore
						li			c0,		92
						b			key_done

key_ignore:				cmpwi		c0,		10		; linefeed
						bne-		key_abort
						bl			key_0

key_done:				EPILOG0
key_abort:				LEA			c0,		key_STR
						bl			STR_abort_1

; ----------------------------------
; editor-emit
; ----------------------------------
.data
editor_emit_l:			.long		key_l
						.byte		explained, 0, 0, scf10
						.long		0, editor_emit_1, 0, 0
						.asciz		"editor-emit"
						.align		2
						.asciz		"( c )
Print byte to stdout."
						.align		2
_editor_last_output:	.long		0

.text
editor_emit_1:			PROLOG1
						mr			s0,		c0
						STORE		s0,		_editor_last_output
						li			c0,		1
						bl			std_1
						mr			c1,		c0
						mr			c0,		s0
						bl			fputc_2
						EPILOG1

; ----------------------------------
; editor-key
; ----------------------------------
.data
editor_key_l:			.long		editor_emit_l
						.byte		explained, 0, 0, scf01
						.long		editor_key_0, 0, 0, 0
						.asciz		"editor-key"
						.align		2
						.asciz		"( -- c )
Read byte from editor."
						.align		2

.text
editor_key_0:			PROLOG2
						LEA			s0,		_editor_line
						LEA			s1,		_editor_pos
						lwz			t0,		0(s0)
						cmpwi		t0,		0
						; if the line is empty get a new one
						beq-		editor_key_getline
						lwz			t1,		0(s1)
						lbzx		t2,		t0,		t1
						cmpwi		t2,		0
						bne+		editor_key_get
						; if we`re at the end of the buffer get a new one
editor_key_getline:		bl			editor_getline_0
editor_key_get:			lwz			t0,		0(s0)
						lwz			t1,		0(s1)
						lbzx		c0,		t0,		t1
						; increase pos
						addi		t1,		t1,		1
						stw			t1,		0(s1)
editor_key_done:		EPILOG2

; ----------------------------------
; editor-getline
; ----------------------------------
.data
editor_getline_l:		.long		editor_key_l
						.byte		explained, 0, 0, scf00
						.long		editor_getline_0, 0, 0, 0
						.asciz		"editor-getline"
						.align		2
						.asciz		"( -- )
Read one line into the editor-buffer."
						.align		2
_editor_line:			.long		0
_editor_pos:			.long		0

.text
editor_getline_0:		PROLOG2
						mfctr		r0
						stwu		r0,		-4(ssp)
						stwu		ssp,	-64(ssp)
						LEA			s0,		_editor_line

						; free line if necessary
						lwz			c0,		0(s0)
						cmpwi		c0,		0
						beq-		editor_getline_lfQ
						bl			free_1
						li			t0,		0
						stw			t0,		0(s0)

editor_getline_lfQ:		bl			Qlinefeed_0
						; invoke readline
editor_getline_read:	LEA			r3,		_readline_prompt
						bl			L_readline_DL_stub
						; if we got EOF, try again
						cmpwi		r3,		0
						bne+		editor_getline_noEOF
						bl			linefeed_0
						b			editor_getline_read

editor_getline_noEOF:	stw			r3,		0(s0)

						; if not empty, add to history
						lbz			r4,		0(r3)
						cmpwi		r4,		0
						bnel+		L_add_history_DL_stub

						; enlarge buffer by 1 ...
						lwz			c0,		0(s0)
						bl			STR_length_1
						mr			s1,		c0
						addi		c1,		c0,		1
						lwz			c0,		0(s0)
						bl			realloc_2
						stw			c0,		0(s0)

						; ... and append linefeed
						lwz			t0,		0(s0)
						add			t0,		t0,		s1
						li			t1,		10
						stb			t1,		0(t0)
						li			t1,		0
						stb			t1,		1(t0)
						addi		s1,		s1,		1

editor_getline_done:	li			t0,		0
						STORE		t0,		_editor_pos
						addi		ssp,	ssp,	64
						lwz			r0,		0(ssp)
						addi		ssp,	ssp,	4
						mtctr		r0
						EPILOG2

; ----------------------------------
; editor-complete
; ----------------------------------
.data
editor_cpl_l:			.long		editor_getline_l
						.byte		explained, 0, 0, scf00
						.long		editor_cpl_0, 0, 0, 0
						.asciz		"editor-complete"
						.align		2
						.asciz		"( -- )
Custom word completer which can be used only from the readline-library."
						.align		2
_editor_cpl_len:		.long		0
_editor_cpl_word:		.long		0

.text
						; ATTENTION! This is a C-function.
editor_cpl_0:			mflr		r0
						stwu		r0,		-4(ssp)
						mfctr		r0
						stwu		r0,		-4(ssp)
						stwu		s0,		-4(ssp)
						stwu		s1,		-4(ssp)
						stwu		s2,		-4(ssp)
						stwu		s3,		-4(ssp)
						stwu		ref,	-4(ssp)
						stwu		c0,		-4(ssp)
						stwu		c1,		-4(ssp)
						stwu		c2,		-4(ssp)
						stwu		sp,		-4(ssp)
						stwu		ssp,	-64(ssp)

						; s0 = text, s1 = state, s2 = result
						; s3 = new stack base
						mr			s0,		r3
						mr			s1,		r4

						; restore ref, set up a new stack because 
						; we're in readline's environment now 
						bl			restore_ref_0
editor_cpl_stack_size = 1024
						li			r3,		editor_cpl_stack_size
						bl			L_malloc_DL_stub
						mr			s3,		r3
						addi		sp,		s3,		editor_cpl_stack_size

						cmpwi		s1,		0
						bne+		editor_cpl_search

						; if state = 0 -> save length of text
						; init starting word
						mr			c0,		s0
						bl			STR_length_1
						STORE		c0,		_editor_cpl_len
						LOAD		t0,		_lastword
						STORE		t0,		_editor_cpl_word

editor_cpl_search:		LOAD		c1,		_editor_cpl_word
						; if we`re through, return 0
						cmpwi		c1,		0
						beq-		editor_cpl_fail

						stwu		s0,		-4(sp)
						LOAD		c0,		_editor_cpl_len
						li			c2,		6*4
						bl			STR_lookup_3

						; if nothing found, return 0
						cmpwi		c0,		0
						beq-		editor_cpl_fail

						; s0 = word
						mr			s0,		c0
						cmpwi		c0,		0
						beq-		editor_cpl_notlast
						lwz			c0,		0(c0)
editor_cpl_notlast:		STORE		c0,  _editor_cpl_word

						; return malloc-duplicated string
						addi		c0,		s0,		6*4
						bl			STR_dup_1
						mr			s2,		c0
						b			editor_cpl_done

editor_cpl_fail:		li			s2,		0

editor_cpl_done:		; free our stack
						mr			r3,		s3
						bl			L_free_DL_stub

						mr			r3,		s2

						addi		ssp,	ssp,	64
						lwz			sp,		0(ssp)
						lwz			c2,		4(ssp)
						lwz			c1,		8(ssp)
						lwz			c0,		12(ssp)
						lwz			ref,	16(ssp)
						lwz			s3,		20(ssp)
						lwz			s2,		24(ssp)
						lwz			s1,		28(ssp)
						lwz			s0,		32(ssp)
						lwz			r0,		36(ssp)
						mtctr		r0
						lwz			r0,		40(ssp)
						addi		ssp,	ssp,	44
						mtlr		r0
						blr

; ----------------------------------
; editor-abort
; ----------------------------------
.data
editor_abort_l:			.long		editor_cpl_l
						.byte		explained, 0, 0, scf00
						.long		editor_abort_0, 0, 0, 0
						.asciz		"editor-abort"
						.align		2
						.asciz		"( -- )
Clear all pending input."
						.align		2

.text
editor_abort_0:			PROLOG0
						LOAD		c0,		_editor_line
						cmpwi		c0,		0
						bnel-		free_1
						li			t0,		0
						STORE		t0,		_editor_line
						STORE		t0,		_editor_pos
						STORE		t0,		_editor_last_output
						EPILOG0

; ----------------------------------
; (learn)
; ----------------------------------
.data
learnPT_l:				.long		editor_abort_l
						.byte		explained, 0, 0, scf10
						.long		0, learnPT_1, 0, 0
						.asciz		"(learn)"
						.align		2
						.asciz		"( str )
Interpret file helper
Open file with name str, save old reader and set it to (learner)."
						.align		2
_learn_data:			.long		0
_learn_last_key:		.long		0
learnPT_filemode:		.asciz		"r"
learnPT_string:			.asciz		"Cannot open the file "
						.align		2

.text
learnPT_1:				; s0 = _learn_data, s1 = file pointer
						; s2 = file name
						PROLOG3
						mr			s2,		c0
						
						; _learn_data looks like:
						; + 0	old _learn_data
						; + 4	old (key)
						; + 8	file pointer
						; + 12	line number
						; + 16	pointer to file name
						
						; open file -> s1
						LEA			c1,		learnPT_filemode
						bl			fopen_2
						mr			s1,		c0
						cmpwi		c0,		0
						beq-		learnPT_failed
						
						; allocate _learn_data -> s0
						li			c0,		20
						bl			malloc_1
						mr			s0,		c0
						
						; save _learn_data, set new
						LEA			t0,		_learn_data
						lwz			t1,		0(t0)
						stw			t1,		0(s0)
						stw			s0,		0(t0)
						
						; store file
						stw			s1,		8(s0)
						
						; init line number
						li			t0,		1
						stw			t0,		12(s0)
						
						; save (key), set new
						LOAD		t0,		_keyPT
						stw			t0,		4(s0)
						LEA			t0,		learningPT_0
						STORE		t0,		_keyPT
						
						; save filename
						mr			c0,		s2
						bl			STR_dup_1
						stw			c0,		16(s0)
						
						; init _learn_last_key
						li			t0,		0
						STORE		t0,		_learn_last_key
						
						EPILOG3

learnPT_failed:			bl			file_DOT_0
						LEA			c0,		learnPT_string
						bl			type_1
						mr			c0,		s2
						bl			type_1	
						bl			abortPT_0

; ----------------------------------
; learn
; ----------------------------------
.data
learn_l:				.long		learnPT_l
						.byte		explained, 0, 0, scf00
						.long		learn_0, 0, 0, 0
						.asciz		"learn"
						.align		2
						.asciz		"( -- ) ( name )
Interpret file.
Read filename, then (learn) it."
						.align		2

.text
learn_0:				PROLOG0
						bl			word_0
						bl			learnPT_1
						EPILOG0

; ----------------------------------
; ?learn
; ----------------------------------
.data
Qlearn_l:				.long		learn_l
						.byte		explained, 0, 0, scf00
						.long		Qlearn_0, 0, 0, 0
						.asciz		"?learn"
						.align		2
						.asciz		"( -- ) ( name )
Interpret file if it has not been yet.
Read filename. If no word with this name exists, (learn) file."
						.align		2

.text
Qlearn_0:				PROLOG1
						bl			word_0
						mr			s0,		c0
						bl			tickPT_1
						cmpwi		c0,		0
						bne-		Qlearn_no
						mr			c0,		s0
						bl			learnPT_1
Qlearn_no:				EPILOG1

; ----------------------------------
; abort-file
; ----------------------------------
.data
abort_file_l:			.long		Qlearn_l
						.byte		explained, 0, 0, scf00
						.long		abort_file_0, 0, 0, 0
						.asciz		"abort-file"
						.align		2
						.asciz		"( -- )
Stop reading the current file."
						.align		2

.text
abort_file_0:			PROLOG0
						LOAD		s0,		_learn_data
						cmpwi		s0,		0
						beq-		abort_file_nofile
						; close file, restore (key) and _learn_data
						lwz			c0,		8(s0)
						bl			fclose_1
						lwz			t0,		4(s0)
						STORE		t0,		_keyPT
						lwz			t0,		0(s0)
						STORE		t0,		_learn_data
						; free filename
						lwz			c0,		16(s0)
						bl			free_1
						; free our _learn_data
						mr			c0,		s0
						bl			free_1
abort_file_nofile:		EPILOG0

; ----------------------------------
; (learning)
; ----------------------------------
.data
learningPT_l:			.long		abort_file_l
						.byte		explained, 0, 0, scf01
						.long		learningPT_0, 0, 0, 0
						.asciz		"(learning)"
						.align		2
						.asciz		"( -- c )
Read byte from the current learn-file."
						.align		2

.text
learningPT_0:			PROLOG1
						LOAD		s0,		_learn_data
						lwz			c0,		8(s0)
						bl			fgetc_1

						; if the last input was a linefeed, increase
						; line number. Otherwise a wrong line number
						; is displayed when aborting because of an
						; expression which ends with a linefeed.
						LOAD		t0,		_learn_last_key
						cmpwi		t0,		10
						bne+		learningPT_no_lf
						lwz			t0,		12(s0)
						addi		t0,		t0,		1
						stw			t0,		12(s0)

learningPT_no_lf:		; if it`s not EOF (= -1), return
						addic.		t0,		c0,		1
						bne+		learningPT_done

						; we got EOF, so cleanup
						bl			abort_file_0

						; `translate` EOF to linefeed
						li			c0,		10
learningPT_done:		STORE		c0,		_learn_last_key
						EPILOG1

; ----------------------------------
; (file?)
; ----------------------------------
.data
fileQ_PT_l:				.long		learningPT_l
						.byte		explained, 0, 0, scf02
						.long		fileQ_PT_0, 0, 0, 0
						.asciz		"(file?)"
						.align		2
						.asciz		"( -- n str )
Line number and filename
str is 0 if we're not learning a file."	; "'"
						.align		2

.text
fileQ_PT_0:				li			c1,		0
						LOAD		t0,		_learn_data
						cmpwi		t0,		0
						beq+		fileQ_PT_done
						; we`re reading a file
						lwz			c0,		12(t0)
						lwz			c1,		16(t0)
fileQ_PT_done:			blr

; ----------------------------------
; file.
; ----------------------------------
.data
file_DOT_l:				.long		fileQ_PT_l
						.byte		explained, 0, 0, scf00
						.long		file_DOT_0, 0, 0, 0
						.asciz		"file."
						.align		2
						.asciz		"( -- )
If we're learning a file, print its name and the current line number." ; "'"
						.align		2
file_DOT_STR0:			.asciz		"In "
file_DOT_STR1:			.asciz		" (line "
file_DOT_STR2:			.asciz		"): "
						.align		2

.text
file_DOT_0:				PROLOG2
						bl			Qlinefeed_0
						bl			fileQ_PT_0
						; s0 = line number, s1 = file name
						mr			s0,		c0
						mr			s1,		c1
						; are we reading a file?
						cmpwi		c1,		0
						beq+		file_DOT_done
						; yes
						LEA			c0,		file_DOT_STR0
						bl			type_1

						mr			c0,		s1 ; file name
						bl			type_1

						LEA			c0,		file_DOT_STR1
						bl			type_1

						mr			c0,		s0 ; line number
						bl			u_dot_1
						
						LEA			c0,		file_DOT_STR2
						bl			type_1
file_DOT_done:			EPILOG2

; ----------------------------------
; type
; ----------------------------------
.data
type_l:					.long		file_DOT_l
						.byte		explained, 0, 0, scf10
						.long		0, type_1, 0, 0
						.asciz		"type"
						.align		2
						.asciz		"( str )
Print string."
						.align		2

.text
type_1:					PROLOG1
						subi		s0,		c0,			1
type_loop:				lbzu		c0,		1(s0)
						cmpwi		c0,		0
						beq-		type_done
						bl			emit_1
						b			type_loop
type_done:				EPILOG1

; ----------------------------------
; +
; ----------------------------------
.data
plus_l:					.long		type_l
						.byte		explained | inline, 0, 0, scf21 | scf32
						.long		0, 0, plus_2, plus_3
						.asciz		"+"
						.align		2
						.asciz		"( n1 n2 -- sum )
Plus"
						.align		2

.text
plus_2:					add			c0,		c0,		c1
						blr
plus_3:					add			c1,		c1,		c2
						blr

; ----------------------------------
; -
; ----------------------------------
.data
minus_l:				.long		plus_l
						.byte		explained | inline, 0, 0, scf21 | scf32
						.long		0, 0, minus_2, minus_3
						.asciz		"-"
						.align		2
						.asciz		"( n1 n2 -- n3 )
Minus"
						.align		2

.text
minus_2:				sub			c0,		c0,		c1
						blr
minus_3:				sub			c1,		c1,		c2
						blr

; ----------------------------------
; OR
; ----------------------------------
.data
or_l:					.long		minus_l
						.byte		explained | inline, 0, 0, scf21 | scf32
						.long		0, 0, or_2, or_3
						.asciz		"OR"
						.align		2
						.asciz		"( n1 n2 -- n3 )
Bitwise or"
						.align		2

.text
or_2:					or			c0,		c0,		c1
						blr
or_3:					or			c1,		c1,		c2
						blr

; ----------------------------------
; !
; ----------------------------------
.data
store_l:				.long		or_l
						.byte		explained | inline, 0, 0, scf20 | scf31
						.long		0, 0, store_2, store_3
						.asciz		"!"
						.align		2
						.asciz		"( n a )
Store n at a."
						.align		2

.text
store_2:				stw			c0,		0(c1)
						blr
store_3:				stw			c1,		0(c2)
						blr

; ----------------------------------
; @
; ----------------------------------
.data
fetch_l:				.long		store_l
						.byte		explained | inline, 0, 0, scf11 | scf22 | scf33
						.long		0, fetch_1, fetch_2, fetch_3
						.asciz		"@"
						.align		2
						.asciz		"( a -- n )
Fetch n from a."
						.align		2

.text
fetch_1:				lwz			c0,		0(c0)
						blr
fetch_2:				lwz			c1,		0(c1)
						blr
fetch_3:				lwz			c2,		0(c2)
						blr

; ----------------------------------
; dup
; ----------------------------------
.data
dup_l:					.long		fetch_l
						.byte		explained | inline, 0, 0, scf12 | scf23 | scf33
						.long		0, dup_1, dup_2, dup_3
						.asciz		"dup"
						.align		2
						.asciz		"( n -- n n )
Duplicate."
						.align		2

.text
dup_1:					mr			c1,		c0
						blr
dup_2:					mr			c2,		c1
						blr
dup_3:					stwu		c0,		-4(sp)
						mr			c0,		c1
						mr			c1,		c2
						blr

; ----------------------------------
; drop
; ----------------------------------
.data
drop_l:					.long		dup_l
						.byte		explained | inline, 0, 0, scf00 | scf10 | scf21 | scf32
						.long		drop_0, drop_1, drop_2, drop_3
						.asciz		"drop"
						.align		2
						.asciz		"( n )"
						.align		2

.text
drop_0:					addi		sp,		sp,		4
drop_1: drop_2: drop_3:	blr

; ----------------------------------
; swap
; ----------------------------------
.data
swap_l:					.long		drop_l
						.byte		explained | inline, 0, 0, scf02 | scf12 | scf22 | scf33
						.long		swap_0, swap_1, swap_2, swap_3
						.asciz		"swap"
						.align		2
						.asciz		"( n1 n2 -- n2 n1 )"
						.align		2
.text
swap_0:					lwz			c0,		0(sp)
						lwz			c1,		4(sp)
						addi		sp,		sp,		8
						blr
swap_1:					lwz			c1,		0(sp)
						addi		sp,		sp,		4
						blr
swap_2:					mr			r0,		c0
						mr			c0,		c1
						mr			c1,		r0
						blr
swap_3:					mr			r0,		c1
						mr			c1,		c2
						mr			c2,		r0
						blr

; ----------------------------------
; rot
; ----------------------------------
.data
rot_l:					.long		swap_l
						.byte		explained | inline, 0, 0, scf03 | scf13 | scf23 | scf33
						.long		rot_0, rot_1, rot_2, rot_3
						.asciz		"rot"
						.align		2
						.asciz		"( n1 n2 n2 -- n2 n3 n1 )
Rotate."
						.align		2

.text
rot_0:					lwz			c1,		0(sp)
						lwz			c0,		4(sp)
						lwz			c2,		8(sp)
						addi		sp,		sp,		12
						blr
rot_1:					lwz			r0,		0(sp)
						lwz			c2,		4(sp)
						mr			c1,		c0
						addi		sp,		sp,		8
						mr			c0,		r0
						blr
rot_2:					lwz			c2,		0(sp)
						addi		sp,		sp,		4
						blr
rot_3:					mr			r0,		c0
						mr			c0,		c1
						mr			c1,		c2
						mr			c2,		r0
						blr

; ----------------------------------
; over
; ----------------------------------
.data
over_l:					.long		rot_l
						.byte		explained | inline, 0, 0, scf03 | scf13 | scf23
						.long		over_0, over_1, over_2, 0
						.asciz		"over"
						.align		2
						.asciz		"( n1 n2 -- n1 n2 n1 )"
						.align		2

.text
over_0:					lwz			c1,		0(sp)
						lwz			c2,		4(sp)
						addi		sp,		sp,		8
						mr			c0,		c2
						blr
over_1:					lwz			c2,		0(sp)
						addi		sp,		sp,		4
						mr			c1,		c0
						mr			c0,		c2
						blr
over_2:					mr			c2,		c0
						blr

; ----------------------------------
; nip
; ----------------------------------
.data
nip_l:					.long		over_l
						.byte		explained | inline, 0, 0, scf01 | scf11 | scf21 | scf32
						.long		nip_0, nip_1, nip_2, nip_3
						.asciz		"nip"
						.align		2
						.asciz		"( n1 n2 -- n2 )"
						.align		2

.text
nip_0:					lwz			c0,		0(sp)
						addi		sp,		sp,		8
						blr
nip_1:					addi		sp,		sp,		4
						blr
nip_2:					mr			c0,		c1
						blr
nip_3:					mr			c1,		c2
						blr

; ----------------------------------
; ,
; ----------------------------------
.data
comma_l:				.long		nip_l
						.byte		explained | inline, 0, 0, scf10 | scf21 | scf32
						.long		0, comma_1, comma_2, comma_3
						.asciz		","
						.align		2
						.asciz		"( n )
Store in instruction dictionary"
						.align		2

.text
comma_1:				stw			c0,		0(idp)
						addi		idp,	idp,	4
						blr
comma_2:				stw			c1,		0(idp)
						addi		idp,	idp,	4
						blr
comma_3:				stw			c2,		0(idp)
						addi		idp,	idp,	4
						blr

; ----------------------------------
; _
; ----------------------------------
.data
underscore_l:			.long		comma_l
						.byte		explained | inline, 0, 0, scf10 | scf21 | scf32
						.long		0, underscore_1, underscore_2, underscore_3
						.asciz		"_"
						.align		2
						.asciz		"( n )
Store in data dictionary."
						.align		2

.text
underscore_1:			stw			c0,		0(ddp)
						addi		ddp,	ddp,	4
						blr
underscore_2:			stw			c1,		0(ddp)
						addi		ddp,	ddp,	4
						blr
underscore_3:			stw			c2,		0(ddp)
						addi		ddp,	ddp,	4
						blr

; ----------------------------------
; "length
; ----------------------------------
.data
STR_length_l:			.long		underscore_l
						.byte		explained, 0, 0, scf11
						.long		0, STR_length_1, 0, 0
						.asciz		"\"length"
						.align		2
						.asciz		"( str -- n )
String length"
						.align		2

.text
STR_length_1:			li			t0,		0
STR_length_load:		lwz			t2,		0(c0)
						li			t1,		4
STR_length_loop:		rlwinm		t2,		t2,		8, 0, 31
						rlwinm		t3,		t2,		0, 24, 31
						cmpwi		t3,		0
						beq-		STR_length_done
						subic.		t1,		t1,		1
						addi		t0,		t0,		1
						bne+		STR_length_loop
						addi		c0,		c0,		4
						b			STR_length_load
STR_length_done:		mr			c0,		t0
						blr

; ----------------------------------
; "compare
; ----------------------------------
.data
STR_compare_l:			.long		STR_length_l
						.byte		explained, 0, 0, scf31
						.long		0, 0, 0, STR_compare_3
						.asciz		"\"compare"
						.align		2
						.asciz		"( str1 str2 max -- ? )
Compare strings (no more than max bytes).
True means equal."
						.align		2

.text
STR_compare_3:			mfctr		t1
						stwu		t1,		-4(ssp)
						
						cmpwi		c2,		0
						lwz			t1,		0(c1)
						lwz			t2,		0(c0)
						li			t0,		-1	; result
						beq-		STR_compare_equal

						li			t5,		4	; constant
						mtctr		t5						
STR_compare_loop:		rlwinm		t1,		t1,		8,  0, 31
						rlwinm		t2,		t2,		8,  0, 31
						rlwinm		t3,		t1,		0, 24, 31
						rlwinm		t4,		t2,		0, 24, 31
						cmpw		t3,		t4
						bne-		STR_compare_no
						cmpwi		t3,		0
						beq-		STR_compare_equal
						
						subic.		c2,		c2,		1
						beq-		STR_compare_equal

						bdnz		STR_compare_loop
						; reload
						lwzu		t1,		4(c1)
						lwzu		t2,		4(c0)
						mtctr		t5
						b			STR_compare_loop

STR_compare_no:			li			t0,		0
STR_compare_equal:		lwz			t1,		0(ssp)
						addi		ssp,	ssp,	4
						mr			c0,		t0
						mtctr		t1
						blr

; ----------------------------------
; "copy
; ----------------------------------
.data
STR_copy_l:				.long		STR_compare_l
						.byte		explained, 0, 0, scf21
						.long		0, 0, STR_copy_2, 0
						.asciz		"\"copy"
						.align		2
						.asciz		"( s d -- end )
Copy string from s to d.
Return address of the terminating zero of the copied string."
						.align		2

.text
STR_copy_2:				subi		c0,		c0,		1
						subi		c1,		c1,		1
STR_copy_loop:			lbzu		t0,		1(c0)
						cmpwi		t0,		0
						stbu		t0,		1(c1)
						bne+		STR_copy_loop
						mr			c0,		c1
						blr

; ----------------------------------
; "dup
; ----------------------------------
.data
STR_dup_l:				.long		STR_copy_l
						.byte		explained, 0, 0, scf11
						.long		0, STR_dup_1, 0, 0
						.asciz		"\"dup"
						.align		2
						.asciz		"( str1 -- str2 )
Duplicate string (with malloc)."
						.align		2

.text
STR_dup_1:				PROLOG1
						mr			s0,		c0
						bl			STR_length_1
						addi		c0,		c0,		1
						bl			malloc_1
						mr			c1,		c0
						mr			c0,		s0
						mr			s0,		c1
						bl			STR_copy_2
						mr			c0,		s0
						EPILOG1

; ----------------------------------
; "lookup
; ----------------------------------
.data
STR_lookup_l:			.long		STR_dup_l
						.byte		explained, 0, 0, scf31
						.long		0, 0, 0, STR_lookup_3
						.asciz		"\"lookup"
						.align		2
						.asciz		"( str max list offset -- a )
Find string in linked list.
list is a zero-terminated linked list with strings located at offset
from each link element. Traverse list and compare each string (only max
characters) with str. If found, return the corresponding list element,
zero otherwise."
						.align		2

.text
STR_lookup_3:			PROLOG4
						; s0 = str, s1 = len, s2 = list, s3 = offset
						lwz			s0,		0(sp)
						addi		sp,		sp,		4
						mr			s1,		c0
						mr			s2,		c1
						mr			s3,		c2

STR_lookup_loop:		cmpwi		s2,		0
						beq-		STR_lookup_failed
						add			c0,		s2,		s3
						mr			c1,		s0
						mr			c2,		s1
						bl			STR_compare_3
						cmpwi		c0,		0
						mr			c0,		s2
						bne-		STR_lookup_done
						lwz			s2,		0(s2)
						b			STR_lookup_loop
STR_lookup_failed:		li			c0,		0
STR_lookup_done:		EPILOG4

; ----------------------------------
; :text
; ----------------------------------
.data
text_buffer_l:			.long		STR_lookup_l
						.byte		explained | inline, 0, 0, scf02 | scf13
						.long		text_buffer_0, text_buffer_1, 0, 0
						.asciz		":text"
						.align		2
						.asciz		"( -- a size )
Address and size of text buffer."
						.align		2
text_buffer_size = 128
_text_buffer:			.space		text_buffer_size

.text
text_buffer_1:			LEA			c1,		_text_buffer
						li			c2,		text_buffer_size-1
						blr
text_buffer_0:			LEA			c0,		_text_buffer
						li			c1,		text_buffer_size-1
						blr

; ----------------------------------
; blank?
; ----------------------------------
.data
blankQ_l:				.long		text_buffer_l
						.byte		explained, 0, 0, scf11
						.long		0, blankQ_1, 0, 0
						.asciz		"blank?"
						.align		2
						.asciz		"( c -- ? )
Check for space, tab, linefeed and carriage return."
						.align		2

.text
blankQ_1:				li			t0,		1
						cmpwi		c0,		32	; blank
						beq-		blankQ_done
						cmpwi		c0,		9	; tab
						beq-		blankQ_done
						cmpwi		c0,		10	; linefeed
						beq-		blankQ_done
						cmpwi		c0,		13	; carriage return
						beq-		blankQ_done
						li			t0,		0
blankQ_done:			mr			c0,		t0
						blr

; ----------------------------------
; strip
; ----------------------------------
.data
strip_l:				.long		blankQ_l
						.byte		explained, 0, 0, scf01
						.long		strip_0, 0, 0, 0
						.asciz		"strip"
						.align		2
						.asciz		"( -- c ) ( text )
Strip leading blanks.
Return first non-blank."
						.align		2

.text
strip_0:				PROLOG1
strip_loop:				bl			key_0
						mr			s0,		c0
						bl			blankQ_1
						cmpwi		c0,		0
						bne+		strip_loop
						mr			c0,		s0
						EPILOG1

; ----------------------------------
; (word)
; ----------------------------------
.data
wordPT_l:				.long		strip_l
						.byte		explained, 0, 0, scf22
						.long		0, 0, wordPT_2, 0
						.asciz		"(word)"
						.align		2
						.asciz		"( a max -- a end ) ( name )
Read word helper
Strip leading blanks, read name (no more than max characters) and store
them at a. Return (unchanged) a and the address of the terminating
zero."
						.align		2

.text
wordPT_2:				PROLOG5
						; s0 = base addr, s1 = current addr
						; s2 = count, s3 = max, s4 = char
						mr			s0,		c0
						mr			s1,		c0
						li			s2,		0
						mr			s3,		c1

						cmpwi		s3,		0
						beq-		wordPT_done

						bl			strip_0
						stb			c0,		0(s1)
						addi		s1,		s1,		1
wordPT_loop:			addi		s2,		s2,		1
						cmplw		s2,		s3
						bge-		wordPT_done
						bl			key_0
						mr			s4,		c0
						bl			blankQ_1
						cmpwi		c0,		0
						bne-		wordPT_done
						stb			s4,		0(s1)
						addi		s1,		s1,		1
						b			wordPT_loop

wordPT_done:			; zero-terminate string
						li			t0,		0
						stb			t0,		0(s1)
						mr			c0,		s0
						mr			c1,		s1
						EPILOG5
; ----------------------------------
; word
; ----------------------------------
.data
word_l:					.long		wordPT_l
						.byte		explained, 0, 0, scf01
						.long		word_0, 0, 0, 0
						.asciz		"word"
						.align		2
						.asciz		"( -- str ) ( name )
Read word to text buffer."
						.align		2

.text
word_0:					PROLOG0
						bl			text_buffer_0
						bl			wordPT_2
						EPILOG0

; ----------------------------------
; lastword
; ----------------------------------
.data
lastword_l:				.long		word_l
						.byte		explained | inline, 0, 0, scf01 | scf12 | scf23
						.long		lastword_0, lastword_1, lastword_2, 0
						.asciz		"lastword"
						.align		2
						.asciz		"( -- var )
Address of last word"
_lastword:				.long		semicolon_l

.text
lastword_0:				LEA			c0,		_lastword
						blr
lastword_1:				LEA			c1,		_lastword
						blr
lastword_2:				LEA			c2,		_lastword
						blr

; ----------------------------------
; >flags
; ----------------------------------
.data
TO_flags_l:				.long		lastword_l
						.byte		explained | inline, 0, 0, scf11 | scf22 | scf33
						.long		0, TO_flags_1, TO_flags_2, TO_flags_3
						.asciz		">flags"
						.align		2
						.asciz		"( word -- a )
Address of flags"
						.align		2

.text
TO_flags_1:				addi		c0,		c0,		4
						blr
TO_flags_2:				addi		c1,		c1,		4
						blr
TO_flags_3:				addi		c2,		c2,		4
						blr

; ----------------------------------
; >code
; ----------------------------------
.data
TO_code_l:				.long		TO_flags_l
						.byte		explained | inline, 0, 0, scf21 | scf32
						.long		0, 0, TO_code_2, TO_code_3
						.asciz		">code"
						.align		2
						.asciz		"( word n -- a )
Address of code address n"
						.align		2

.text
TO_code_2:				addi		c0,		c0,		2*4
						rlwinm		c1,		c1,		2, 28, 31
						add			c0,		c0,		c1
						blr
TO_code_3:				addi		c1,		c1,		2*4
						rlwinm		c2,		c2,		2, 28, 31
						add			c1,		c1,		c2
						blr

; ----------------------------------
; >name
; ----------------------------------
.data
TO_name_l:				.long		TO_code_l
						.byte		explained | inline, 0, 0, scf11 | scf22 | scf33
						.long		0, TO_name_1, TO_name_2, TO_name_3
						.asciz		">name"
						.align		2
						.asciz		"( word -- str )
Address of name"
						.align		2

.text
TO_name_1:				addi		c0,		c0,		6*4
						blr
TO_name_2:				addi		c1,		c1,		6*4
						blr
TO_name_3:				addi		c2,		c2,		6*4
						blr

; ----------------------------------
; >near-code
; ----------------------------------
.data
TO_near_code_l:			.long		TO_name_l
						.byte		explained, 0, 0, scf22
						.long		0, 0, TO_near_code_2, 0
						.asciz		">near-code"
						.align		2
						.asciz		"( word n1 -- a n2 )
Best matching code address.
Find n2-th non-zero code address a, trying in this order: n2 = n1, 
n2 > n1, n2 < n1. "
						.align		2

.text
TO_near_code_2:			PROLOG3
						; s0 = word, s1 = d, s2 = n
						mr			s2,		c1
						mr			s1,		c1
						mr			s0,		c0
TO_near_code_loop:		mr			c0,		s0
						mr			c1,		s2
						bl			TO_code_2
						lwz			c0,		0(c0)
						cmpwi		c0,		0
						bne+		TO_near_code_done
						addi		s2,		s2,		1
TO_near_code_test:		cmpwi		s2,		3
						ble+		TO_near_code_loop
						li			s2,		0
						b			TO_near_code_loop

TO_near_code_done:		mr			c1,		s2
						EPILOG3

; ----------------------------------
; cached?
; ----------------------------------
.data
cachedQ_l:				.long		TO_near_code_l
						.byte		explained, 0, 0, scf21
						.long		0, 0, cachedQ_2, 0
						.asciz		"cached?"
						.align		2
						.asciz		"( word in -- out )\nCached items on exit. \nNumber of items left in the stack cache when the code with in items on\nentry returns."
						.align		2

.text
cachedQ_2:				PROLOG0
						; t0 = flags
						lwz			t0,		4(c0)
						rlwinm		c1,		c1,		1, 29, 31
						subi		c1,		c1,		32
						neg			c1,		c1
						; c0 = 32 - 2 * in
						rlwnm		c0,		t0,		c1, 30, 31
						EPILOG0

; ----------------------------------
; inline?
; ----------------------------------
.data
inlineQ_l:				.long		cachedQ_l
						.byte		explained | inline, 0, 0, scf11 | scf22 | scf33
						.long		0, inlineQ_1, inlineQ_2, inlineQ_3
						.asciz		"inline?"
						.align		2
						.asciz		"( word -- ? )
Check if word is inline."
						.align		2

.text
inlineQ_1:				lbz			c0,		4(c0)
						rlwinm		c0,		c0,		0, 31, 31
						blr
inlineQ_2:				lbz			c1,		4(c1)
						rlwinm		c1,		c1,		0, 31, 31
						blr
inlineQ_3:				lbz			c2,		4(c2)
						rlwinm		c2,		c2,		0, 31, 31
						blr

; ----------------------------------
; immediate?
; ----------------------------------
.data
immediateQ_l:			.long		inlineQ_l
						.byte		explained | inline, 0, 0, scf11 | scf22 | scf33
						.long		0, immediateQ_1, immediateQ_2, immediateQ_3
						.asciz		"immediate?"
						.align		2
						.asciz		"( word -- ? )
Check if word is immediate."
						.align		2

.text
immediateQ_1:			lbz			c0,		4(c0)
						rlwinm		c0,		c0,		0, 30, 30
						blr
immediateQ_2:			lbz			c1,		4(c1)
						rlwinm		c1,		c1,		0, 30, 30
						blr
immediateQ_3:			lbz			c2,		4(c2)
						rlwinm		c2,		c2,		0, 30, 30
						blr

; ----------------------------------
; leaf?
; ----------------------------------
.data
leafQ_l:				.long		immediateQ_l
						.byte		explained | inline, 0, 0, scf11 | scf22 | scf33
						.long		0, leafQ_1, leafQ_2, leafQ_3
						.asciz		"leaf?"
						.align		2
						.asciz		"( word -- ? )
Check if word is a leaf word."
						.align		2

.text
leafQ_1:				lbz			c0,		4(c0)
						rlwinm		c0,		c0,		0, 29, 29
						blr
leafQ_2:				lbz			c1,		4(c1)
						rlwinm		c1,		c1,		0, 29, 29
						blr
leafQ_3:				lbz			c2,		4(c2)
						rlwinm		c2,		c2,		0, 29, 29
						blr

; ----------------------------------
; explained?
; ----------------------------------
.data
explainedQ_l:			.long		leafQ_l
						.byte		explained | inline, 0, 0, scf11 | scf22 | scf33
						.long		0, explainedQ_1, explainedQ_2, explainedQ_3
						.asciz		"explained?"
						.align		2
						.asciz		"( word -- ? )
Check if word has an explanation."
						.align		2

.text
explainedQ_1:			lbz			c0,		4(c0)
						rlwinm		c0,		c0,		0, 28, 28
						blr
explainedQ_2:			lbz			c1,		4(c1)
						rlwinm		c1,		c1,		0, 28, 28
						blr
explainedQ_3:			lbz			c2,		4(c2)
						rlwinm		c2,		c2,		0, 28, 28
						blr

; ----------------------------------
; (tick)
; ----------------------------------
.data
tickPT_l:				.long		explainedQ_l
						.byte		explained, 0, 0, scf11
						.long		0, tickPT_1, 0, 0
						.asciz		"(')"	; "'"
						.align		2
						.asciz		"( str -- word )
Find word.
Return word with the name str, zero if failed."
						.align		2

.text
tickPT_1:				PROLOG0
						stwu		c0,		-4(sp)
						li			c0,		-1
						LOAD		c1,		_lastword
						li			c2,		4*6
						bl			STR_lookup_3
						EPILOG0

; ----------------------------------
; tick
; ----------------------------------
.data
tick_l:					.long		tickPT_l
						.byte		explained, 0, 0, scf01
						.long		tick_0, 0, 0, 0
						.asciz		"'"	; "'"
						.align		2
						.asciz		"( -- word ) ( name )
Read and find word."
						.align		2

.text
tick_0:					PROLOG0
						bl			word_0
						bl			tickPT_1
						EPILOG0

; ----------------------------------
; base
; ----------------------------------
.data
base_l:					.long		tick_l
						.byte		explained | inline, 0, 0, scf01 | scf12 | scf23
						.long		base_0, base_1, base_2, 0
						.asciz		"base"
						.align		2
						.asciz		"( -- var )
Base for number conversion."
						.align		2
_base:					.long		10

.text
base_0:					LEA			c0,		_base
						blr
base_1:					LEA			c1,		_base
						blr
base_2:					LEA			c2,		_base
						blr

; ----------------------------------
; >digit
; ----------------------------------
.data
to_digit_l:				.long		base_l
						.byte		explained, 0, 0, scf12
						.long		0, to_digit_1, 0, 0
						.asciz		">digit"
						.align		2
						.asciz		"( c -- n ? )
Convert character to a number.
? indicates if it's a valid number."	; "'"
						.align		2

.text
to_digit_1:				LOAD		t0,		_base
						li			c1,		0
						cmpwi		c0,		48	; 0
						bltlr-
						cmpwi		c0,		57	; 9
						bgt+		to_digit_greater10
						subi		c0,		c0,		48
						b			to_digit_check
to_digit_greater10:		andi.		c0,		c0,		0xDF ; uppercase
						cmpwi		c0,		65	; A
						bltlr-
						cmpwi		c0,		90	; Z
						bgtlr+
						subi		c0,		c0,		55 ; A - 10
to_digit_check:			cmplw		c0,		t0
						bgelr-
						li			c1,		1
						blr

; ----------------------------------
; (>number)
; ----------------------------------
.data
to_numberPT_l:			.long		to_digit_l
						.byte		explained, 0, 0, scf12
						.long		0, to_numberPT_1, 0, 0
						.asciz		"(>number)"
						.align		2
						.asciz		"( str -- n ? )
Convert simple string to number.
str may contain only digits, no sign or base indicators. ? indicates if
it's a valid number."	; "'"
						.align		2

.text
to_numberPT_1:			PROLOG3
						; s0 = string, s1 = number, s2 = base
						LOAD		s2,		_base
						li			s1,		0
						mr			s0,		c0
to_numberPT_loop:		lbz			c0,		0(s0)
						cmpwi		c0,		0
						beq-		to_numberPT_done
						bl			to_digit_1
						mullw		s1,		s1,		s2
						cmpwi		c1,		0
						addi		s0,		s0,		1
						add			s1,		s1,		c0
						beq-		to_numberPT_return
						b			to_numberPT_loop
to_numberPT_done:		mr			c0,		s1
						li			c1,		1
to_numberPT_return:		EPILOG3

; ----------------------------------
; prefix
; ----------------------------------
.data
prefix_l:				.long		to_numberPT_l
						.byte		explained, 0, 0, scf13
						.long		0, prefix_1, 0, 0
						.asciz		"#prefix"
						.align		2
						.asciz		"( str -- base sign str ? )
Extract number prefix.
The first two bytes of str are searched for + - # % &. sign indicates
whether the number is negative or not, base depends on # (2), % (10) and
$ (16). str points to the first non-prefix byte. ? indicates if it's a
valid prefix."	; "'"
						.align		2
prefix_data:			.long		2
						.long		16
						.long		10

.text
prefix_1:				; 35 = #, 36 = $, 37 = %, 43 = +, 45 = -
						; c2 = f, c1 = str, c0 = sign, t3 = base
						; t0 = counter, t1 = char
						LEA			t2,		prefix_data
						LOAD		t3,		_base
						mr			c1,		c0
						li			c2,		1
						li			c0,		0
						li			t0,		2
prefix_load:			lbz			t1,		0(c1)
						cmpwi		t1,		0
						beq-		prefix_failed
						cmpwi		t1,		35
						blt+		prefix_done
						cmpwi		t1,		37
						bgt+		prefix_sign
						subi		t1,		t1,		35
						rlwinm		t1,		t1,		2, 0, 31
						lwzx		t3,		t2,		t1
						b			prefix_loop
prefix_sign:			cmpwi		t1,		43
						beq-		prefix_loop
						cmpwi		t1,		45
						bne+		prefix_done
						nand		c0,		c0,		c0
prefix_loop:			subic.		t0,		t0,		1
						addi		c1,		c1,		1
						bne			prefix_load
						b			prefix_done
prefix_failed:			li			c2,		0
prefix_done:			stwu		t3,		-4(sp)
						blr

; ----------------------------------
; >number
; ----------------------------------
.data
to_number_l:			.long		prefix_l
						.byte		explained, 0, 0, scf12
						.long		0, to_number_1, 0, 0
						.asciz		">number"
						.align		2
						.asciz		"( str -- n ? )
Convert string to number.
Use prefixes to indicate the base: # for binary, $ for hexadecimal and %
for decimal. ? indicates if it's a valid number."	; "'"
						.align		2

.text
to_number_1:			PROLOG2
						LOAD		s0,		_base
						bl			prefix_1
						lwz			t0,		0(sp)
						addi		sp,		sp,		4
						cmpwi		c2,		0
						beq-		to_number_failed
						mr			s1,		c0
						STORE		t0,		_base
						mr			c0,		c1
						bl			to_numberPT_1
						cmpwi		c1,		0
						beq-		to_number_failed
						cmpwi		s1,		0
						beq+		to_number_done
						neg			c0,		c0
						b			to_number_done
to_number_failed:		li			c1,		0
to_number_done:			STORE		s0,		_base
						EPILOG2

; ----------------------------------
; (#)
; ----------------------------------
.data
nrPT_l:					.long		to_number_l
						.byte		explained | inline, 0, 0, scf11
						.long		0, nrPT_1, 0, 0
						.asciz		"(#)"
						.align		2
						.asciz		"( u -- c )
Convert unsigned number to one character. "
						.align		2

.text
						; 48 = '0', 58 = '0' + 10, 7 = 'A' - '0'
nrPT_1:					addi		c0,		c0,		48
						cmpwi		c0,		58
						blt+		nrPT_done
						addi		c0,		c0,		7
nrPT_done:				blr

; ----------------------------------
; #
; ----------------------------------
.data
nr_l:					.long		nrPT_l
						.byte		explained, 0, 0, scf12
						.long		0, nr_1, 0, 0
						.asciz		"#"
						.align		2
						.asciz		"( u1 -- u2 c )
Perform one step in number conversion.
u2 = (u1 / base), c = (u1 mod base) as a character using (#)."
						.align		2

.text
nr_1:					PROLOG1
						LOAD		t1,		_base
						divwu		s0,		c0,		t1
						mullw		t0,		s0,		t1
						sub			c0,		c0,		t0
						bl			nrPT_1
						mr			c1,		c0
						mr			c0,		s0
						EPILOG1

; ----------------------------------
; ##
; ----------------------------------
.data
nrnr_l:					.long		nr_l
						.byte		explained, 0, 0, scf21
						.long		0, 0, nrnr_2, 0
						.asciz		"##"
						.align		2
						.asciz		"( u a -- n )
Number conversion helper.
Apply # as many times as u is nonzero and store n converted characters
at descending addresses, starting at a."
						.align		2

.text
nrnr_2:					PROLOG2
						; s0 = addr, s1 = counter
						mr			s0,		c1
						li			s1,		0
nrnr_loop:				bl			nr_1
						stb			c1,		0(s0)
						cmpwi		c0,		0
						subi		s0,		s0,		1
						addi		s1,		s1,		1
						bne+		nrnr_loop
						mr			c0,		s1
						EPILOG2

; ----------------------------------
; #sign
; ----------------------------------
.data
nr_sign_l:				.long		nrnr_l
						.byte		explained, 0, 0, scf21
						.long		0, 0, nr_sign_2, 0
						.asciz		"#sign"
						.align		2
						.asciz		"( n str1 -- str2 )
Add sign.
If n is negative, prepend a dash to str."
						.align		2

.text
nr_sign_2:				cmpwi		c0,		0
						mr			c0,		c1
						bgelr+
						li			t0,		45 ; '-'
						stbu		t0,		-1(c0)
						blr

; ----------------------------------
; (u.)
; ----------------------------------
.data
u_dotPT_l:				.long		nr_sign_l
						.byte		explained, 0, 0, scf21
						.long		0, 0, u_dotPT_2, 0
						.asciz		"(u.)"
						.align		2
						.asciz		"( u a -- str )
Convert unsigned number to string.
str ends at a+34."
						.align		2

.text
u_dotPT_2:				PROLOG1
						li			t0,		0
						stbu		t0,		34(c1)
						subi		c1,		c1,		1

						mr			s0,		c1
						bl			nrnr_2
						sub			c0,		s0,		c0
						addi		c0,		c0,		1
						EPILOG1

; ----------------------------------
; (.)
; ----------------------------------
.data
dotPT_l:				.long		u_dotPT_l
						.byte		explained, 0, 0, scf21
						.long		0, 0, dotPT_2, 0
						.asciz		"(.)"
						.align		2
						.asciz		"( n a -- str )
Convert number to string.
str ends at a+34."
						.align		2

.text
dotPT_2:				PROLOG1
						cmpwi		c0,		0
						mr			s0,		c0
						bge+		dotPT_positive
						neg			c0,		c0
dotPT_positive:			bl			u_dotPT_2
						mr			c1,		c0
						mr			c0,		s0
						bl			nr_sign_2
						EPILOG1

; ----------------------------------
; u.
; ----------------------------------
.data
u_dot_l:				.long		dotPT_l
						.byte		explained, 0, 0, scf10
						.long		0, u_dot_1, 0, 0
						.asciz		"u."
						.align		2
						.asciz		"( u )
Print unsigned number."
						.align		2

.text
u_dot_1:				PROLOG0
						LEA			c1,		_text_buffer
						bl			u_dotPT_2
						bl			type_1
						EPILOG0

; ----------------------------------
; .
; ----------------------------------
.data
dot_l:					.long		u_dot_l
						.byte		explained, 0, 0, scf10
						.long		0, dot_1, 0, 0
						.asciz		"."
						.align		2
						.asciz		"( n )
Print number."
						.align		2

.text
dot_1:					PROLOG0
						LEA			c1,		_text_buffer
						bl			dotPT_2
						bl			type_1
						EPILOG0

; ----------------------------------
; #.
; ----------------------------------
.data
bin_dot_l:				.long		dot_l
						.byte		explained, 0, 0, scf10
						.long		0, bin_dot_1, 0, 0
						.asciz		"#."
						.align		2
						.asciz		"( n )
Print formatted binary number."
						.align		2

.text
bin_dot_1:				PROLOG2
						mr			s0,		c0
						li			s1,		31
bin_dot_loop:			rlwinm		s0,		s0,		1, 0, 31
						rlwinm		c0,		s0,		0, 31, 31
						addi		c0,		c0,		48
						bl			emit_1
						andi.		c0,		s1,		7
						bne+		bin_dot_nomark
						cmpwi		s1,		0
						beq-		bin_dot_nomark
						li			c0,		39	; separator
						bl			emit_1
bin_dot_nomark:			subic.		s1,		s1,	1
						bge+		bin_dot_loop
						EPILOG2

; ----------------------------------
; $.
; ----------------------------------
.data
hex_dot_l:				.long		bin_dot_l
						.byte		explained, 0, 0, scf10
						.long		0, hex_dot_1, 0, 0
						.asciz		"$."
						.align		2
						.asciz		"( n )
Print formatted hexadecimal number."
						.align		2

.text
hex_dot_1:				PROLOG2
						mr			s0,		c0
						li			s1,		8
hex_dot_loop:			rlwinm		s0,		s0,		4, 0, 31
						rlwinm		c0,		s0,		0, 28, 31
						bl			nrPT_1
						bl			emit_1
						subic.		s1,		s1,		1
						bgt+		hex_dot_loop
						EPILOG2

; ----------------------------------
; bye
; ----------------------------------
.data
bye_l:					.long		hex_dot_l
						.byte		explained, 0, 0, scf00
						.long		bye_0, 0, 0, 0
						.asciz		"bye"
						.align		2
						.asciz		"( -- )
Quit D."
						.align		2

.text
bye_0:					LOAD		ssp,	_ssp0
						b			main_exit

; ----------------------------------
; here
; ----------------------------------
.data
here_l:					.long		bye_l
						.byte		explained | inline, 0, 0, scf01 | scf12 | scf23
						.long		here_0, here_1, here_2, 0
						.asciz		"here"
						.align		2
						.asciz		"( -- u )
Get instruction dictionary pointer."
						.align		2

.text
here_0:					mr			c0,		idp
						blr
here_1:					mr			c1,		idp
						blr
here_2:					mr			c2,		idp
						blr

; ----------------------------------
; there
; ----------------------------------
.data
there_l:				.long		here_l
						.byte		explained | inline, 0, 0, scf01 | scf12 | scf23
						.long		there_0, there_1, there_2, 0
						.asciz		"there"
						.align		2
						.asciz		"( -- u )
Get data dictionary pointer."
						.align		2

.text
there_0:				mr			c0,		ddp
						blr
there_1:				mr			c1,		ddp
						blr
there_2:				mr			c2,		ddp
						blr

; ----------------------------------
; align
; ----------------------------------
.data
align_l:				.long		there_l
						.byte		explained | leaf, 0, 0, scf11 | scf22 | scf33
						.long		0, align_1, align_2, align_3
						.asciz		"align"
						.align		2
						.asciz		"( u -- u )
Align upwards to 4-byte boundary."
						.align		2

.text
align_1:				rlwinm		i0,		c0,		0, 0, 29
						cmpw		i0,		c0
						beq-		align_1_done
						addi		c0,		i0,		4
align_1_done:			blr
align_2:				rlwinm		i0,		c1,		0, 0, 29
						cmpw		i0,		c1
						beq-		align_3_done
						addi		c1,		i0,		4
align_2_done:			blr
align_3:				rlwinm		i0,		c2,		0, 0, 29
						cmpw		i0,		c2
						beq-		align_3_done
						addi		c2,		i0,		4
align_3_done:			blr

; ----------------------------------
; BL
; ----------------------------------
.data
blank_l:				.long		align_l
						.byte		explained, 0, 0, scf00
						.long		blank_0, 0, 0, 0
						.asciz		"BL"
						.align		2
						.asciz		"( -- )
Print blank."
						.align		2

.text
blank_0:				PROLOG0
						li			c0,		32
						bl			emit_1
						EPILOG0

; ----------------------------------
; LF
; ----------------------------------
.data
linefeed_l:				.long		blank_l
						.byte		explained, 0, 0, scf00
						.long		linefeed_0, 0, 0, 0
						.asciz		"LF"
						.align		2
						.asciz		"( -- )
Print linefeed."
						.align		2

.text
linefeed_0:				PROLOG0
						li			c0,		10
						bl			emit_1
						EPILOG0

; ----------------------------------
; ?LF
; ----------------------------------
.data
Qlinefeed_l:			.long		linefeed_l
						.byte		explained, 0, 0, scf00
						.long		Qlinefeed_0, 0, 0, 0
						.asciz		"?LF"
						.align		2
						.asciz		"( -- )
If the last byte (editor-)emit-ted wasn't a linefeed, emit one." ; "'"
						.align		2

.text
Qlinefeed_0:			PROLOG0
						LOAD		t0,		_editor_last_output
						cmpwi		t0,		10
						beq-		Qlinefeed_done
						li			c0,		10
						bl			emit_1
Qlinefeed_done:			EPILOG0

; ----------------------------------
; words
; ----------------------------------
.data
words_l:				.long		Qlinefeed_l
						.byte		explained, 0, 0, scf00
						.long		words_0, 0, 0, 0
						.asciz		"words"
						.align		2
						.asciz		"( -- )
List all words."
						.align		2

.text
words_0:				PROLOG0
						stwu		s0,		-4(ssp)
						LOAD		s0,		_lastword
words_loop:				mr			c0,		s0
						bl			TO_name_1
						bl			type_1
						bl			blank_0
						lwz			s0,		0(s0)
						cmpwi		s0,		0
						bne+		words_loop
						bl			linefeed_0
						lwz			s0,		0(ssp)
						addi		ssp,	ssp,	4
						EPILOG0

; ----------------------------------
; dump
; ----------------------------------
.data
dump_l:					.long		words_l
						.byte		explained, 0, 0, scf20
						.long		0, 0, dump_2, 0
						.asciz		"dump"
						.align		2
						.asciz		"( a n )
Dump n cells starting at a."
						.align		2

.text
dump_2:					PROLOG2
						; s0 = n, s1 = addr
						mr			s0,		c1
						mr			s1,		c0
						bl			Qlinefeed_0
dump_loop:				mr			c0,		s1
						bl			hex_dot_1
						bl			blank_0
						lwz			c0,		0(s1)
						addi		s1,		s1,		4
						bl			hex_dot_1
						bl			linefeed_0
						subic.		s0,		s0,		1
						bgt+		dump_loop
						EPILOG2

; ----------------------------------
; rotate
; ----------------------------------
.data
rotate_l:				.long		dump_l
						.byte		explained | inline, 0, 0, scf21 | scf32
						.long		0, 0, rotate_2, rotate_3
						.asciz		"rotate"
						.align		2
						.asciz		"( n s -- n )
Rotate n left by s bits."
						.align		2

.text
rotate_2:				rlwnm		c0, c0, c1, 0, 31
						blr
rotate_3:				rlwnm		c1, c1, c2, 0, 31
						blr

; ----------------------------------
; [
; ----------------------------------
.data
bracket_l:				.long		rotate_l
						.byte		explained | immediate, 0, 0, scf00
						.long		bracket_0, 0, 0, 0
						.asciz		"["
						.align		2
						.asciz		"( in -- out ) immediate
Interpret some names.
Push in. Read and interpret names until ] is entered. "
						.align		2

.text
bracket_0:				PROLOG0
bracket_loop:			bl			word_0
						lhz			t0,		0(c0)
						; wait for "]" = 5d00
						cmpwi		t0,		0x5d00
						beq-		bracket_done
						bl			interpretPT_1
						b			bracket_loop
bracket_done:			EPILOG0

; ----------------------------------
; (
; ----------------------------------
.data
comment_l:				.long		bracket_l
						.byte		explained | immediate, 0, 0, scf00
						.long		comment_0, 0, 0, 0
						.asciz		"("
						.align		2
						.asciz		"( -- ) immediate
Comment
Read until ) is entered. Can be used recursively."
						.align		2

.text
comment_0:				PROLOG0
comment_loop:			bl			key_0
						cmpwi		c0,		41
						beq-		comment_done
						cmpwi		c0,		40
						beql-		comment_0
						b			comment_loop
comment_done:			EPILOG0

; ----------------------------------
; explanation
; ----------------------------------
.data
explanation_l:			.long		comment_l
						.byte		explained, 0, 0, scf11
						.long		0, explanation_1, 0, 0
						.asciz		"explanation"
						.align		2
						.asciz		"( word -- str )
If word is explained, return the explaining string."
						.align		2

.text
explanation_1:			PROLOG1
						mr			s0,		c0
						bl			explainedQ_1
						cmpwi		c0,		0
						beq-		explanation_done
						mr			c0,		s0
						bl			TO_name_1
						mr			s0,		c0
						bl			STR_length_1
						add			c0,		c0,		s0
						addi		c0,		c0,		1
						bl			align_1
explanation_done:		EPILOG1

; ----------------------------------
; explain
; ----------------------------------
.data
explain_l:				.long		explanation_l
						.byte		explained, 0, 0, scf00
						.long		explain_0, 0, 0, 0
						.asciz		"explain"
						.align		2
						.asciz		"( -- ) ( name )
Read word and display its explanation."
						.align		2

.text
explain_0:				PROLOG1
						bl			word_0
						mr			s0,		c0
						bl			tickPT_1
						cmpwi		c0,		0
						bne+		explain_ok
						mr			c0,		s0
						bl			abort_what_1
						
explain_ok:				bl			explanation_1
						mr			s0,		c0
						cmpwi		c0,		0
						beq-		explain_failed
						bl			Qlinefeed_0
						mr			c0,		s0
						bl			type_1
						bl			Qlinefeed_0
explain_failed:			EPILOG1

; ----------------------------------
; ?"
; ----------------------------------
.data
cp_explanation_l:		.long		explain_l
						.byte		explained | immediate, 0, 0, scf00
						.long		cp_explanation_0, 0, 0, 0
						.asciz		"?\""
						.align		2
						.asciz		"( in -- out ) ( string ) immediate
Read string and make it the explanation of the current word."
						.align		2

.text
cp_explanation_0:		PROLOG1
						; set explained?-bit
						LOAD		c0,		_there0
						lbz			t0,		4(c0)
						li			t1,		8
						rlwimi		t0,		t1,		0, 28, 28
						stb			t0,		4(c0)
						
						; write string to dictionary
cp_explanation_loop:	bl			key_0
						stb			c0,		0(ddp)
						addi		ddp,	ddp,	1
						cmpwi		c0,		34	; "
						bne			cp_explanation_loop

						; zero-terminate
						li			t0,		0
						stb			t0,		-1(ddp)
						
						; align ddp
						mr			c0,		ddp
						bl			align_1
						mr			ddp,	c0
						EPILOG1

; ----------------------------------
; execute
; ----------------------------------
.data
execute_l:				.long		cp_explanation_l
						.byte		explained, 0, 0, scf10
						.long		0, execute_1, 0, 0
						.asciz		"execute"
						.align		2
						.asciz		"( word )
Execute word.
Pop cache, execute, push cache."
						.align		2
execute_STR_underflow:	.asciz		"Stack underflow\n"
						.align		2

.text
execute_1:				PROLOG3
						; s2 = word address
						mr			s2,		c0
						li			c1,		0
						bl			TO_near_code_2
						; s0 = in, s1 = ca
						mr			s0,		c1
						mr			s1,		c0
						mr			c0,		s2
						bl			cachedQ_2
						; s2 = out
						mr			s2,		c0

						; check stack
						LOAD		t1,		_sp0
						rlwinm		t0,		s0,		2, 28, 31
						add			t0,		t0,		sp
						cmpw		t1,		t0
						blt-		execute_underflow

						; pop stack cache
						mtlr		s1
						cmpwi		s0,		0
						beq-		execute_enter
						cmpwi		s0,		1
						beq+		execute_pop1
						cmpwi		s0,		2
						beq+		execute_pop2

execute_pop3:			lwz			c2,		0(sp)
						lwz			c1,		4(sp)
						lwz			c0,		8(sp)
						addi		sp,		sp,		12
						b			execute_enter
execute_pop2:			lwz			c1,		0(sp)
						lwz			c0,		4(sp)
						addi		sp,		sp,		8
						b			execute_enter
execute_pop1:			lwz			c0,		0(sp)
						addi		sp,		sp,		4

execute_enter:			blrl

						; check stack
						LOAD		t1,		_sp0
						cmpw		t1,		sp
						blt-		execute_underflow

						; push stack cache
						cmpwi		s2,		0
						beq-		execute_done
						cmpwi		s2,		1
						beq+		execute_push1
						cmpwi		s2,		2
						beq+		execute_push2
execute_push3:			stwu		c0,		-4(sp)
						stwu		c1,		-4(sp)
						stwu		c2,		-4(sp)
						b			execute_done
execute_push2:			stwu		c0,		-4(sp)
						stwu		c1,		-4(sp)
						b			execute_done
execute_push1:			stwu		c0,		-4(sp)

execute_done:			EPILOG3
execute_underflow:		LEA			c0,		execute_STR_underflow
						bl			STR_abort_1

; ----------------------------------
; (interpret)
; ----------------------------------
.data
interpretPT_l:			.long		execute_l
						.byte		explained, 0, 0, scf10
						.long		0, interpretPT_1, 0, 0
						.asciz		"(interpret)"
						.align		2
						.asciz		"( str )
Interpret string as one word or number."
						.align		2

.text
interpretPT_1:			PROLOG1
						mr			s0,		c0
						bl			tickPT_1
						cmpwi		c0,		0
						beq-		interpretPT_number
						bl			execute_1
						b			interpretPT_done
interpretPT_number:		mr			c0,		s0
						bl			to_number_1
						cmpwi		c1,		0
						stwu		c0,		-4(sp)
						mr			c0,		s0
						beql-		abort_what_1
interpretPT_done:		EPILOG1

; ----------------------------------
; interpreter
; ----------------------------------
.data
interpreter_l:			.long		interpretPT_l
						.byte		explained, 0, 0, scf00
						.long		interpreter_0, 0, 0, 0
						.asciz		"interpreter"
						.align		2
						.asciz		"( -- )
Interpreter
Read a name and (interpret) it, repeat."
						.align		2

.text
interpreter_0:			PROLOG0
interpreter_loop:		bl			word_0
						bl			interpretPT_1
						b			interpreter_loop
						EPILOG0

; ----------------------------------
; (abort)
; ----------------------------------
.data
abortPT_l:				.long		interpreter_l
						.byte		explained, 0, 0, scf00
						.long		abortPT_0, 0, 0, 0
						.asciz		"(abort)"
						.align		2
						.asciz		"( -- )
Restore initial status.
Reset user and system stack, here and there. Set base to 10. 
Clear pending input from editor. Enter interpreter."
						.align		2
abortPT_STR_ok:			.asciz		"OK\n"
						.align		2

.text
abortPT_0:				PROLOG0
						; setup these before printing "OK"
						li			t0,		10
						STORE		t0,		_base

						LEA			t0,		editor_emit_1
						STORE		t0,		_emitPT

						LEA			t0,		editor_key_0
						STORE		t0,		_keyPT

						; lf? must be before editor-abort
						bl			Qlinefeed_0
						bl			editor_abort_0

						LEA			c0,		abortPT_STR_ok
						bl			type_1

						li			t0,		0
						STORE		t0,		_learn_data
						STORE		t0,		_learn_last_key
						
						LOAD		idp,	_here0
						LOAD		ddp,	_there0
						LOAD		sp,		_sp0
						LOAD		ssp,	_ssp0

						bl			interpreter_0
						EPILOG0

; ----------------------------------
; "abort
; ----------------------------------
.data
STR_abort_l:			.long		abortPT_l
						.byte		explained, 0, 0, scf10
						.long		0, STR_abort_1, 0, 0
						.asciz		"\"abort"
						.align		2
						.asciz		"( str -- )
Print string, then (abort)."

.text
STR_abort_1:			PROLOG1
						mr			s0,		c0
						bl			file_DOT_0
						mr			c0,		s0
						bl			type_1
						bl			abortPT_0
						EPILOG1

; ----------------------------------
; abort
; ----------------------------------
.data
abort_l:				.long		STR_abort_l
						.byte		explained, 0, 0, scf00
						.long		abort_0, 0, 0, 0
						.asciz		"abort"
						.align		2
						.asciz		"( -- )
(abort) quietly."
						.align		2
abort_string:			.asciz		""

.text
abort_0:				PROLOG0
						LEA			c0,		abort_string
						bl			STR_abort_1
						EPILOG0

; ----------------------------------
; abort!?
; ----------------------------------
.data
abort_what_l:			.long		abort_l
						.byte		explained, 0, 0, scf10
						.long		0, abort_what_1, 0, 0
						.asciz		"abort!?"
						.align		2
						.asciz		"( str )
Print \"What is <str>?\", then abort."
						.align		2
abort_what_STR1:		.asciz		"What is \""
abort_what_STR2:		.asciz		"\"?"
						.align		2

.text
abort_what_1:			; s0 = str
						PROLOG1
						mr			s0,		c0
						; print file name and line number
						bl			file_DOT_0
						; print "What is ...?"
						LEA			c0,		abort_what_STR1
						bl			type_1
						mr			c0,		s0
						bl			type_1
						LEA			c0,		abort_what_STR2
						bl			type_1
						bl			abortPT_0
						EPILOG1

; ----------------------------------
; (create)
; ----------------------------------
.data
createPT_l:				.long		abort_what_l
						.byte		explained, 0, 0, scf10
						.long		0, createPT_1, 0, 0
						.asciz		"(create)"
						.align		2
						.asciz		"( str -- )
Create word header.
Set link field, create empty flags and code addresses. Copy str to 
the dictionary."
						.align		2

.text
createPT_1:				PROLOG0
						; link
						LOAD		t0,		_lastword
						stw			t0,		0(ddp)
						; empty flags and code addresses
						li			t0,		0
						stw			t0,		4(ddp)
						stw			t0,		8(ddp)
						stw			t0,		12(ddp)
						stw			t0,		16(ddp)
						stw			t0,		20(ddp)
						; copy name and align
						addi		c1,		ddp,	24
						bl			STR_copy_2
						addi		c0,		c0,		1
						bl			align_1
						mr			ddp,	c0
						EPILOG0

; ----------------------------------
; create
; ----------------------------------
.data
create_l:				.long		createPT_l
						.byte		explained, 0, 0, scf00
						.long		create_0, 0, 0, 0
						.asciz		"create"
						.align		2
						.asciz		"( -- ) ( name )
Create word header.
Read string, call (create). "
						.align		2

.text
create_0:				PROLOG0
						bl			word_0
						bl			createPT_1
create_done:			EPILOG0

; ----------------------------------
; inline,
; ----------------------------------
.data
cp_inline_l:			.long		create_l
						.byte		explained, 0, 0, scf10
						.long		0, cp_inline_1, 0, 0
						.asciz		"inline,"
						.align		2
						.asciz		"( a ) assembler
Compile inline code
at a until a blr-instruction is reached, which is not copied."
						.align		2

.text
cp_inline_1:			PROLOG0
						li			t1,		0x0020
						addis		t1,		t1,		0x4E80 ; t1 = blr
cp_inline_loop:			lwz			t0,		0(c0)
						addi		c0,		c0,		4
						cmpw		t0,		t1
						beq-		cp_inline_done
						stw			t0,		0(idp)
						addi		idp,	idp,	4
						b			cp_inline_loop
cp_inline_done:			EPILOG0

; ----------------------------------
; branch,
; ----------------------------------
.data
cp_branch_l:			.long		cp_inline_l
						.byte		explained, 0, 0, scf10
						.long		0, cp_branch_1, 0, 0
						.asciz		"branch,"
						.align		2
						.asciz		"( a ) assembler
Compile a bl-instruction to a."
						.align		2

.text
cp_branch_1:			; t0 = displacement = addr - idp
						sub			t0,		c0,		idp
						li			t1,		1
						addis		t1,		t1,		0x4800 ; t1 = bl 0
						rlwimi		t1,		t0,		0, 6, 29
						stw			t1,		0(idp)
						addi		idp,	idp,	4
						blr

; ----------------------------------
; adjust
; ----------------------------------
.data
adjust_l:				.long		cp_branch_l
						.byte		explained, 0, 0, scf20
						.long		0, 0, adjust_2, 0
						.asciz		"adjust"
						.align		2
						.asciz		"( in out ) assembler
Compile stack cache adjusting code."
						.align		2
adjust_data_pointer:	.byte		adjust_data_0_0 - adjust_data_ref
						.byte		adjust_data_0_1 - adjust_data_ref
						.byte		adjust_data_0_2 - adjust_data_ref
						.byte		adjust_data_0_3 - adjust_data_ref

						.byte		adjust_data_1_0 - adjust_data_ref
						.byte		adjust_data_1_1 - adjust_data_ref
						.byte		adjust_data_1_2 - adjust_data_ref
						.byte		adjust_data_1_3 - adjust_data_ref

						.byte		adjust_data_2_0 - adjust_data_ref
						.byte		adjust_data_2_1 - adjust_data_ref
						.byte		adjust_data_2_2 - adjust_data_ref
						.byte		adjust_data_2_3 - adjust_data_ref

						.byte		adjust_data_3_0 - adjust_data_ref
						.byte		adjust_data_3_1 - adjust_data_ref
						.byte		adjust_data_3_2 - adjust_data_ref
						.byte		adjust_data_3_3 - adjust_data_ref
adjust_data_ref:
adjust_data_0_0:		blr
adjust_data_0_1:		lwz			c0,		0(sp)
						addi		sp,		sp,		4
						blr
adjust_data_0_2:		lwz			c1,		0(sp)
						lwz			c0,		4(sp)
						addi		sp,		sp,		8
						blr
adjust_data_0_3:		lwz			c2,		0(sp)
						lwz			c1,		4(sp)
						lwz			c0,		8(sp)
						addi		sp,		sp,		12
						blr
adjust_data_1_0:		stwu		c0,		-4(sp)
						blr
adjust_data_1_1:		blr
adjust_data_1_2:		mr			c1,		c0
						lwz			c0,		0(sp)
						addi		sp,		sp,		4
						blr
adjust_data_1_3:		lwz			c1,		0(sp)
						mr			c2,		c0
						lwz			c0,		4(sp)
						addi		sp,		sp,		8
						blr
adjust_data_2_0:		stwu		c0,		-4(sp)
						stwu		c1,		-4(sp)
						blr
adjust_data_2_1:		stwu		c0,		-4(sp)
						mr			c0,		c1
						blr
adjust_data_2_2:		blr
adjust_data_2_3:		lwz			i0,		0(sp)
						mr			c2,		c1
						mr			c1,		c0
						addi		sp,		sp,		4
						mr			c0,		i0
						blr
adjust_data_3_0:		stwu		c0,		-4(sp)
						stwu		c1,		-4(sp)
						stwu		c2,		-4(sp)
						blr
adjust_data_3_1:		stwu		c0,		-4(sp)
						stwu		c1,		-4(sp)
						mr			c0,		c2
						blr
adjust_data_3_2:		stwu		c0,		-4(sp)
						mr			c0,		c1
						mr			c1,		c2
						blr
adjust_data_3_3:		blr

.text
adjust_2:				PROLOG0
						; t0 = 4*before + after
						rlwinm		t0,		c0,		2, 0, 31
						add			t0,		t0,		c1
						LEA			t1,		adjust_data_pointer
						lbzx		t1,		t1,		t0
						LEA			t2,		adjust_data_ref
						add			c0,		t2,		t1
						bl			cp_inline_1
						EPILOG0

; ----------------------------------
; word,
; ----------------------------------
.data
cp_word_l:				.long		adjust_l
						.byte		explained, 0, 0, scf21
						.long		0, 0, cp_word_2, 0
						.asciz		"word,"
						.align		2
						.asciz		"( in word -- out )
Compile word.
adjust stack cache from in to the requirements of word, compile it
inline or outline depending on its settings. "
						.align		2

.text
cp_word_2:				; s0 = word, s1 = desired in, s2 = in, s3 = code
						PROLOG4
						mr			s0,		c1
						mr			s1,		c0
						mr			c0,		s0
						mr			c1,		s1
						bl			TO_near_code_2
						mr			s2,		c1
						mr			s3,		c0
						mr			c0,		s1
						bl			adjust_2
						mr			c0,		s0
						bl			inlineQ_1
						cmpwi		c0,		0
						mr			c0,		s3
						bne-		cp_word_inline
						bl			cp_branch_1
						b			cp_word_cont
cp_word_inline:			bl			cp_inline_1
cp_word_cont:			mr			c0,		s0
						mr			c1,		s2
						bl			cachedQ_2
						EPILOG4

; ----------------------------------
; lil,
; ----------------------------------
.data
lil_l:					.long		cp_word_l
						.byte		explained, 0, 0, scf20
						.long		0, 0, lil_2, 0
						.asciz		"lil,"
						.align		2
						.asciz		"( register n ) assembler
Load immediate long.
Compile code to load n into a register."
						.align		2

.text
lil_2:					PROLOG0
						subi		idp,	idp,	4
						cmpwi		c1,		0
						bge+		lil_positive
						; negative
						nand		t1,		c1,		c1
						cntlzw		t1,		t1
						cmpwi		t1,		16
						bgt+		lil_one
						b			lil_three
lil_positive:			cntlzw		t1,		c1
						cmpwi		t1,		16
						bgt+		lil_one
						beq-		lil_two
						b			lil_three
lil_one:				; li cX, num(16:31)
						lis			t1,		0x3800
						rlwimi		t1,		c0,		21, 6, 10
						rlwimi		t1,		c1,		0, 16, 31
						stwu		t1,		4(idp)
						b			lil_done
lil_two:				; li cX, 0
						lis			t1,		0x3800
						rlwimi		t1,		c0,		21, 6, 10
						stwu		t1,		4(idp)
						; ori cX, cX, num(16:31)
						lis			t1,		0x6000
						rlwimi		t1,		c0,		21, 6, 10
						rlwimi		t1,		c0,		16, 11, 15
						rlwimi		t1,		c1,		0, 16, 31
						stwu		t1,		4(idp)
						b			lil_done
lil_three:				; lis cX, num(0:15)
						lis			t1,		0x3C00
						rlwimi		t1,		c0,		21, 6, 10
						rlwimi		t1,		c1,		16, 16, 31
						stwu		t1,		4(idp)
						; num(16:31) could be 0
						rlwinm		t1,		c1,		0, 16, 31
						cmpwi		t1,		0
						beq-		lil_done
						; ori cX, cX, num(16:31)
						lis			t1,		0x6000
						rlwimi		t1,		c0,		21, 6, 10
						rlwimi		t1,		c0,		16, 11, 15
						rlwimi		t1,		c1,		0, 16, 31
						stwu		t1,		4(idp)
lil_done:				addi		idp,	idp,	4
						EPILOG0

; ----------------------------------
; literal
; ----------------------------------
.data
literal_l:				.long		lil_l
						.byte		explained, 0, 0, scf21
						.long		0, 0, literal_2, 0
						.asciz		"literal"
						.align		2
						.asciz		"( compile: in n -- out   runtime: -- n )
Compile number.
Compile code to load n into the stack cache."
						.align		2

.text
literal_2:				PROLOG2
						; s0 = out, s1 = n
						cmpwi		c0,		3
						mr			s1,		c1
						addi		s0,		c0,		1
						bne+		literal_foo
						; in=3 => adjust stack cache
						li			c0,		3
						li			c1,		2
						bl			adjust_2
						li			s0,		3
literal_foo:			addi		c0,		s0,		27-1 ; target register
						mr			c1,		s1
						bl			lil_2
						mr			c0,		s0
						EPILOG2

; ----------------------------------
; bits,
; ----------------------------------
.data
cp_bits_l:				.long		literal_l
						.byte		explained, 0, 0, scf31
						.long		0, 0, 0, cp_bits_3
						.asciz		"bits,"
						.align		2
						.asciz		"( compile: in pos num -- out   runtime: source dest -- dest' )
Compile bit-field inserting code.
Compile code which reads dest, then source from the stack (cache),
inserts the num least significant bits from source into dest, starting
at pos, finally returns dest'." ;
						.align		2

.text
cp_bits_data_3:			rlwimi		c2,		c1, 	0, 0, 0
						mr			c1,		c2
cp_bits_data_2:			rlwimi		c1,		c0, 	0, 0, 0
						mr			c0,		c1
cp_bits_3:				PROLOG3
						; s0 = pos, s1 = num, s2 = out
						mr			s0,		c1
						mr			s1,		c2
						; t3 = index to cp_bits_data
						; s2 = max(in-1, 2)
						LEA			t3,		cp_bits_data_3
						li			s2,		2
						cmpwi		c0,		3
						; if in=3 everything`s fine
						beq-		cp_bits_foo
						; otherwise adjust to 2
						li			s2,		1
						li			c1,		2
						bl			adjust_2
						LEA			t3,		cp_bits_data_2
cp_bits_foo:
						; runtime: c1/2 = dest, c0/1 = source
						; t0 = rlwimi c1/2, c0/1, 0, 0, 0, which becomes
						; rlwimi c1/2, c0/1, 32-num-pos, pos, pos+num-1
						lwz			t0,		0(t3)
						; t1 = 32 - num - pos
						li			t1,		32
						sub			t1,		t1,		s1
						sub			t1,		t1,		s0
						; t2 = pos + num - 1
						add			t2,		s0,		s1
						subi		t2,		t2,		1
						; fill in arguments
						rlwimi		t0,		t1,		11, 16, 20
						rlwimi		t0,		s0,		6, 21, 25
						rlwimi		t0,		t2,		1, 26, 30
						; compile it
						stw			t0,		0(idp)
						addi		idp,	idp,	4
						; compile: mr c0/1, c1/2
						lwz			t0,		4(t3)
						stw			t0,		0(idp)
						addi		idp,	idp,	4

						mr			c0,		s2
						EPILOG3

; ----------------------------------
; compiler
; ----------------------------------
.data
compiler_l:				.long		cp_bits_l
						.byte		explained, 0, 0, scf21
						.long		0, 0, compiler_2, 0
						.asciz		"compiler"
						.align		2
						.asciz		"( in str -- out )
Compile expression.
If str is the name of a non-immediate word or a number, compile it. If
str is the name of an immediate word, execute it with ( in -- out )."
						.align		2

.text
compiler_2:				PROLOG3
						; s0 = in, s1 = str, s2 = word
						mr			s0,		c0
						mr			s1,		c1
						; tick the string
						mr			c0,		c1
						bl			tickPT_1
						cmpwi		c0,		0
						beq-		compiler_num
						; it`s a word which is ...
						mr			s2,		c0
						bl			immediateQ_1
						cmpwi		c0,		0
						bne+		compiler_immediate
						; ... non-immediate
						mr			c1,		s2
						mr			c0,		s0
						bl			cp_word_2
						b			compiler_done
compiler_immediate:		; ... immediate
						stwu		s0,		-4(sp)
						mr			c0,		s2
						bl			execute_1
						lwz			c0,		0(sp)
						addi		sp,		sp,		4
						b			compiler_done
compiler_num:			; it should be a number
						mr			c0,		s1
						bl			to_number_1
						cmpwi		c1,		0
						beq-		compiler_failed
						mr			c1,		c0
						mr			c0,		s0
						bl			literal_2
compiler_done:			EPILOG3
compiler_failed:		mr			c0,		s1
						bl			abort_what_1

; ----------------------------------
; part
; ----------------------------------
.data
part_l:					.long		compiler_l
						.byte		explained, 0, 0, scf10
						.long		0, part_1, 0, 0
						.asciz		"part"
						.align		2
						.asciz		"( n )
Store code address.
Store current instruction dictionary pointer as the n-th code address of
the current word."
						.align		2

.text
part_1:					PROLOG0
						mr			c1,		c0
						LOAD		c0,		_there0
						bl			TO_code_2
						stw			idp,	0(c0)
						EPILOG0

; ----------------------------------
; cached
; ----------------------------------
.data
cached_l:				.long		part_l
						.byte		explained, 0, 0, scf20
						.long		0, 0, cached_2, 0
						.asciz		"cached"
						.align		2
						.asciz		"( in out )
Store stack cache flag of the current word."
						.align		2

.text
cached_2:				LOAD		t0,		_there0
						lbz			t1,		7(t0)
						rlwinm		c0,		c0,		1, 0, 31
						rlwnm		c1,		c1,		c0, 0, 31
						or			t1,		t1,		c1
						stb			t1,		7(t0)
						blr

; ----------------------------------
; prolog
; ----------------------------------
.data
prolog_l:				.long		cached_l
						.byte		explained, 0, 0, scf00
						.long		prolog_0, 0, 0, 0
						.asciz		"prolog"
						.align		2
						.asciz		"( -- )
Compile mflr r0, stwu r0, -4(r1)."
						.align		2

.text
prolog_data:			mflr		r0
						stwu		r0,		-4(ssp)
prolog_0:				LEA			t0,		prolog_data
						lfd			f0,		0(t0)
						stfd		f0,		0(idp)
						addi		idp,	idp,	8
						blr

; ----------------------------------
; epilog
; ----------------------------------
.data
epilog_l:				.long		prolog_l
						.byte		explained, 0, 0, scf00
						.long		epilog_0, 0, 0, 0
						.asciz		"epilog"
						.align		2
						.asciz		"( -- )
Compile lwz r0, 0(r1), addi r1, r1, 4, mtlr r0, blr."
						.align		2

.text
epilog_data:			lwz			r0,		0(ssp)
						addi		ssp,	ssp,	4
						mtlr		r0
epilog_0:				LEA			t0,		epilog_data
						lfd			f0,		0(t0)
						lwz			t1,		8(t0)
						stfd		f0,		0(idp)
						stw			t1,		8(idp)
						addi		idp,	idp,	12
						blr

; ----------------------------------
; #locals
; ----------------------------------
_number_of_locals = 9
.data
NUM_locals_l:			.long		epilog_l
						.byte		inline | explained, 0, 0, scf01 | scf12 | scf23
						.long		NUM_locals_0, NUM_locals_1, NUM_locals_2, 0
						.asciz		"#locals"
						.align		2
						.asciz		"( -- n )
The number of registers which can be used as local variables."
						.align		2

.text
NUM_locals_0:			li			c0,		_number_of_locals
						blr
NUM_locals_1:			li			c1,		_number_of_locals
						blr
NUM_locals_2:			li			c2,		_number_of_locals
						blr

; ----------------------------------
; !locals
; ----------------------------------
.data
save_locals_l:			.long		NUM_locals_l
						.byte		explained, 0, 0, scf10
						.long		0, save_locals_1, 0, 0
						.asciz		"!locals"
						.align		2
						.asciz		"( n )
Compile code which saves the first n local variables."
						.align		2
save_locals_data:		stwu		r0,		-4(ssp)
save_locals_str:		.asciz		"Too many local variables."
						.align		2

.text
save_locals_1:			cmpwi		c0,		0
						beq-		save_locals_done
						cmplwi		c0,		_number_of_locals
						ble+		save_locals_ok
						; too many locals => abort
						LEA			c0,		save_locals_str
						bl			STR_abort_1
						; stwu rX, -4(ssp)
save_locals_ok:			subi		idp,	idp,	4
						LOAD		t0,		save_locals_data
						addi		c0,		c0,		13-1
save_locals_loop:		rlwimi		t0,		c0,		21, 6, 10
						stwu		t0,		4(idp)
						subi		c0,		c0,		1
						cmpwi		c0,		13
						bge+		save_locals_loop
						addi		idp,	idp,	4
save_locals_done:		blr

; ----------------------------------
; @locals
; ----------------------------------
.data
restore_locals_l:		.long		save_locals_l
						.byte		explained, 0, 0, scf10
						.long		0, restore_locals_1, 0, 0
						.asciz		"@locals"
						.align		2
						.asciz		"( n )
Compile code which restores the first n local variables."
						.align		2

.text
restore_locals_data:	lwz			r0,		0(ssp)
						addi		ssp,	ssp,	0
restore_locals_1:		cmpwi		c0,		0
						beq-		restore_locals_done
						; lwz sX, (X*4)(ssp)
						subi		idp,	idp,	4
						LOAD		t0,		restore_locals_data
						li			t1,		0
restore_locals_loop:	addi		t2,		t1,		13
						rlwimi		t0,		t1,		2, 16, 31
						rlwimi		t0,		t2,		21, 6, 10
						stwu		t0,		4(idp)
						addi		t1,		t1,		1
						cmpw		t1,		c0
						blt+		restore_locals_loop

						; addi ssp, ssp, n*4
						LOAD		t0,		restore_locals_data+4
						rlwimi		t0,		c0,		2, 16, 31
						stwu		t0,		4(idp)

						addi		idp,	idp,	4
restore_locals_done:	blr

; ----------------------------------
; blr,
; ----------------------------------
.data
cp_blr_l:				.long		restore_locals_l
						.byte		explained | inline, 0, 0, scf00 | scf11 | scf22
						.long		cp_blr_0, cp_blr_1, cp_blr_2, 0
						.asciz		"blr,"
						.align		2
						.asciz		"( -- )
Compile blr."
						.align		2

.text
cp_blr_0: cp_blr_1:
cp_blr_2:				li			i0,		0x0020
						addis		i0,		i0,		0x4E80
						stw			i0,		0(idp)
						addi		idp,	idp,	4
						blr

; ----------------------------------
; welcome
; ----------------------------------
.data
welcome_l:				.long		cp_blr_l
						.byte		explained, 0, 0, scf00
						.long		welcome_0, 0, 0, 0
						.asciz		"welcome"
						.align		2
						.asciz		"( -- )
Make word executable.
Update there0, here0 and lastword to link the last compiled word to the
dictionary, make code executable."
						.align		2

.text
welcome_0:				PROLOG0
						LOAD		c0,		_here0
						sub			c1,		idp,	c0
						bl			MakeDataExecutable_2
						LOAD		t0,		_there0
						STORE		t0,		_lastword
						STORE		ddp,	_there0
						STORE		idp,	_here0
						EPILOG0

; ----------------------------------
; compile?
; ----------------------------------
.data
compileQ_l:				.long		welcome_l
						.byte		explained, 0, 0, scf01 | scf12 | scf23
						.long		compileQ_0, compileQ_1, compileQ_2, 0
						.asciz		"compile?"
						.align		2
						.asciz		"( -- var )
As long as compile? is true, (:) continues compiling."
						.align		2
_compileQ:				.long		0

.text
compileQ_0:				LEA			c0,		_compileQ
						blr
compileQ_1:				LEA			c1,		_compileQ
						blr
compileQ_2:				LEA			c2,		_compileQ
						blr

; ----------------------------------
; inline
; ----------------------------------
.data
inline_l:				.long		compileQ_l
						.byte		explained, 0, 0, scf00 | scf11 | scf22 | scf33
						.long		inline_0, inline_1, inline_2, inline_3
						.asciz		"inline"
						.align		2
						.asciz		"( -- )
Mark current word as inline and leaf."
						.align		2

.text
inline_0: inline_1:
inline_2: inline_3:
						LOAD		t0,		_there0
						lbz			t1,		4(t0)
						; 5 = #101 = inline & leaf
						ori			t1,		t1,		5
						stb			t1,		4(t0)
						blr

; ----------------------------------
; leaf
; ----------------------------------
.data
leaf_l:					.long		inline_l
						.byte		explained, 0, 0, scf00 | scf11 | scf22 | scf33
						.long		leaf_0, leaf_1, leaf_2, leaf_3
						.asciz		"leaf"
						.align		2
						.asciz		"( -- )
Mark current as leaf."
						.align		2

.text
leaf_0: leaf_1: 
leaf_2: leaf_3:			LOAD		t0,		_there0
						lbz			t1,		4(t0)
						ori			t1,		t1,		4
						stb			t1,		4(t0)
						blr

; ----------------------------------
; immediate
; ----------------------------------
.data
immediate_l:			.long		leaf_l
						.byte		explained, 0, 0, scf00 | scf11 | scf22 | scf33
						.long		immediate_0, immediate_1, immediate_2, immediate_3
						.asciz		"immediate"
						.align		2
						.asciz		"( -- )
Mark lastword as immediate."
						.align		2

.text
immediate_0: immediate_1:
immediate_2: immediate_3:
						LOAD		t0,		_lastword
						lbz			t1,		4(t0)
						ori			t1,		t1,		2
						stb			t1,		4(t0)
						blr

; ----------------------------------
; :;-data
; ----------------------------------
.data
compile_data_l:			.long		immediate_l
						.byte		explained | inline, 0, 0, scf01 | scf12 | scf23
						.long		compile_data_0, compile_data_1, compile_data_2, 0
						.asciz		":;-data"
						.align		2
						.asciz		"( -- 2var )
Compilation data
First word: Bits 30-31=in, bits 25-29=l, bits 23-24=out and bit 22
indicates if out is locked. The second word is the code address."
						.align		2
_compile_data:			.long		0	; flags
						.long		0	; code address

.text
compile_data_0:			LEA			c0,		_compile_data
						blr
compile_data_1:			LEA			c1,		_compile_data
						blr
compile_data_2:			LEA			c2,		_compile_data
						blr

; ----------------------------------
; (:)
; ----------------------------------
.data
colonPT_l:				.long		compile_data_l
						.byte		explained, 0, 0, scf20
						.long		0, 0, colonPT_2, 0
						.asciz		"(:)"
						.align		2
						.asciz		"( in l -- ID )\nCompile part.\nCompile part of word with in items in the stack cache on entry and l\nvariables used (these values may be changed during compilation): Push\nID=$283A3B29, setup :;-data. Compile prolog, then save-locals. Read and\ncompile expressions until compile? is false."
						.align		2

.text
colonPT_2:				PROLOG2
						; s0 = in, s1 = #local variables
						mr			s0,		c0
						mr			s1,		c1
						; push ID
						lis			t0,		0x283A
						ori			t0,		t0,		0x3B29
						stwu		t0,		-4(sp)
						; setup :;-data
						li			t0,		0
						rlwimi		t0,		s0,		0, 30, 31 ; in
						rlwimi		t0,		s1,		2, 25, 29 ; l
						STORE		t0,		_compile_data
						STORE		idp,	_compile_data+4
						; compile prolog if word is not a leaf
						LOAD		c0,		_there0
						bl			leafQ_1
						cmpwi		c0,		0
						bne-		colonPT_no_prolog
						bl			prolog_0
colonPT_no_prolog:		; save-locals
						mr			c0,		s1
						bl			save_locals_1
						; set compile? to true
						li			t0,		1
						STORE		t0,		_compileQ
						; loop until compile? is false
colonPT_loop:			bl			word_0
						mr			c1,		c0
						mr			c0,		s0
						bl			compiler_2
						mr			s0,		c0
						LOAD		t0,		_compileQ
						cmpwi		t0,		0
						bne+		colonPT_loop
						EPILOG2

; ----------------------------------
; (;)
; ----------------------------------
.data
semicolonPT_l:			.long		colonPT_l
						.byte		explained | immediate, 0, 0, scf11
						.long		0, semicolonPT_1, 0, 0
						.asciz		"(;)"
						.align		2
						.asciz		"( addr ID in -- out ) immediate
Finish part compilation.
Set compile? to false, check ID. Adjust cache if necessary. Restore
locals, compile epilog. Store code address and stack cache flag."
						.align		2
semicolonPT_STR:		.asciz		"; is not used correctly."
						.align		2

.text
semicolonPT_1:			PROLOG4
						; s0 = our in which could become out
						mr			s0,		c0
						
						; set compile? to false
						li			t0,		0
						STORE		t0,		_compileQ
						
						; check ID
						lwz			t0,		0(sp)
						addi		sp,		sp,		4
						lis			t1,		0x283A
						ori			t1,		t1,		0x3B29
						cmpw		t0,		t1
						beq+		semicolonPT_ID_ok
						; if ID is wrong, abort
						LEA			c0,		semicolonPT_STR
						bl			STR_abort_1
						
semicolonPT_ID_ok:		
						; s3 = code address
						LOAD		s3,		_compile_data+4
						; read :;-data
						LOAD		t0,		_compile_data
						; s1='in', s2='l'
						rlwinm		s1,		t0,		0, 30, 31
						rlwinm		s2,		t0,		30, 27, 31
						; if 'out' isn`t locked, we ignore it						
						rlwinm.		t1,		t0,		0, 22, 22
						beq+		semicolonPT_leave_out
						; otherwise, we use (s0=out) and adjust to it
						mr			c0,		s0
						rlwinm		s0,		t0,		25, 30, 31
						mr			c1,		s0
						bl			adjust_2

semicolonPT_leave_out:	; restore-locals
						mr			c0,		s2
						bl			restore_locals_1
						; compile epilog if word is not a leaf
						LOAD		c0,		_there0
						bl			leafQ_1
						cmpwi		c0,		0
						bne-		semicolonPT_no_epilog
						bl			epilog_0
semicolonPT_no_epilog:	
						; blr,
						bl			cp_blr_0
						; store stack cache flag
						mr			c0,		s1
						mr			c1,		s0
						bl			cached_2
						; store code address
						LOAD		c0,		_there0
						mr			c1,		s1
						bl			TO_code_2
						stw			s3,		0(c0)

						; this 0 will never be used
						li			c0,		0
						EPILOG4

; ----------------------------------
; :
; ----------------------------------
.data
colon_l:				.long		semicolonPT_l
						.byte		explained, 0, 0, scf00
						.long		colon_0, 0, 0, 0
						.asciz		":"
						.align		2
						.asciz		"( -- )
Compile word.
Create word header, enter (:) with ( 0 0 )."
						.align		2

.text
colon_0:				PROLOG0
						bl			create_0
						li			c0,		0
						li			c1,		0
						bl			colonPT_2
						EPILOG0

; ----------------------------------
; ;
; ----------------------------------
.data
semicolon_l:			.long		colon_l
						.byte		explained | immediate, 0, 0, scf00
						.long		semicolon_0, 0, 0, 0
						.asciz		";"
						.align		2
						.asciz		"( See note ) immediate
Finish compilation.
If compile? is true, execute (;). In this case, the stack-comment is 
( in -- out ). If compile? is false, no arguments are required and the
stack is left untouched. welcome the word in both cases."
						.align		2

.text
semicolon_0:			PROLOG0
						LOAD		t0,		_compileQ
						cmpwi		t0,		0
						beq+		semicolon_good
						lwz			c0,		0(sp)
						addi		sp,		sp,		4
						bl			semicolonPT_1
						stwu		c0,		-4(sp)
semicolon_good:			; if compile? was false, we completely
						; ignore in/out on the stack
						bl			welcome_0
						EPILOG0

; update _lastword if you change something here!
