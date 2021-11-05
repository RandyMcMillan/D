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
	addis	$0,		r24,	ha16( $1 - data_area_reference )
	lwz		$0,		lo16( $1 - data_area_reference )($0)
.endmacro

.macro LEA
	addis	$0,		r24,	ha16( $1 - data_area_reference )
	la		$0,		lo16( $1 - data_area_reference )($0)
.endmacro

.macro STORE
	addis	r11,		r24,	ha16( $1 - data_area_reference )
	stw		$0,		lo16( $1 - data_area_reference)(r11)
.endmacro

.macro PROLOG0
	mflr	r0
	stwu	r0,		-4(r1)
.endmacro

.macro PROLOG1
	mflr	r0
	stwu	r13,		-4(r1)
	stwu	r0,		-4(r1)
.endmacro

.macro PROLOG2
	mflr	r0
	stwu	r14,		-4(r1)
	stwu	r13,		-4(r1)
	stwu	r0,		-4(r1)
.endmacro

.macro PROLOG3
	mflr	r0
	stwu	r15,		-4(r1)
	stwu	r14,		-4(r1)
	stwu	r13,		-4(r1)
	stwu	r0,		-4(r1)
.endmacro

.macro PROLOG4
	mflr	r0
	stwu	r16,		-4(r1)
	stwu	r15,		-4(r1)
	stwu	r14,		-4(r1)
	stwu	r13,		-4(r1)
	stwu	r0,		-4(r1)
.endmacro

.macro PROLOG5
	mflr	r0
	stwu	r17,		-4(r1)
	stwu	r16,		-4(r1)
	stwu	r15,		-4(r1)
	stwu	r14,		-4(r1)
	stwu	r13,		-4(r1)
	stwu	r0,		-4(r1)
.endmacro

.macro EPILOG0
	lwz		r0,		0(r1)
	addi	r1,	r1,	4
	mtlr	r0
	blr
.endmacro

.macro EPILOG1
	lwz		r0,		0(r1)
	lwz		r13,		4(r1)
	mtlr	r0
	addi	r1,	r1,	8
	blr
.endmacro

.macro EPILOG2
	lwz		r0,		0(r1)
	lwz		r13,		4(r1)
	lwz		r14,		8(r1)
	mtlr	r0
	addi	r1,	r1,	12
	blr
.endmacro

.macro EPILOG3
	lwz		r0,		0(r1)
	lwz		r13,		4(r1)
	lwz		r14,		8(r1)
	lwz		r15,		12(r1)
	mtlr	r0
	addi	r1,	r1,	16
	blr
.endmacro

.macro EPILOG4
	lwz		r0,		0(r1)
	lwz		r13,		4(r1)
	lwz		r14,		8(r1)
	lwz		r15,		12(r1)
	lwz		r16,		16(r1)
	mtlr	r0
	addi	r1,	r1,	20
	blr
.endmacro

.macro EPILOG5
	lwz		r0,		0(r1)
	lwz		r13,		4(r1)
	lwz		r14,		8(r1)
	lwz		r15,		12(r1)
	lwz		r16,		16(r1)
	lwz		r17,		20(r1)
	mtlr	r0
	addi	r1,	r1,	24
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
						; we need 'r24' to reference the data area
						bl			data_area_reference
data_area_reference:	mflr		r24
						; prolog
						stw			r0, 	8(r1)
						stwu 		r1, 	-(24 + 32 + 4*(31-13+1))(r1)
						stmw		r13,		( 24 + 32 )(r1)
						
						; save argc and argv
						STORE		r3,		_argc
						STORE		r4,		_argv
						
						; init readline library
						LOAD		r3,		L_rl_completer_word_break_characters_DL_non_lazy_ptr
						LEA			r4,		_readline_breakers
						stw			r4,		0(r3)

						LOAD		r3,		L_rl_erase_empty_line_DL_non_lazy_ptr
						li			r4,		0
						stw			r4,		0(r3)

						LOAD		r3,		L_rl_readline_name_DL_non_lazy_ptr
						LOAD		r4,		_readline_identifier
						stw			r4,		0(r3)

						LOAD		r3, 	L_rl_completion_entry_function_DL_non_lazy_ptr
						LEA			r4,		editor_cpl_0
						stw			r4,		0(r3)

						; set stdout to unbuffered
;						LOAD		r3,		L___sF_DL_non_lazy_ptr
;						addi		r3,		r3,		88
;						li			r4,		0
;						li			r5,		2
;						li			r6,		0
;						bl			L_setvbuf_DL_stub

						; allocate user stack (1 MB)
						li			r13,		1
						rlwinm		r13,		r13,		20, 0, 31
						mr			r3,		r13
						bl			L_malloc_DL_stub
						add			r31,		r3,		r13
						STORE		r31,		_sp0

						; allocate instruction dictionary (1 MB)
						li			r3,		1
						rlwinm		r3,		r3,		20, 0, 31
						bl			L_malloc_DL_stub
						mr			r25,	r3
						STORE		r3,		_here0
						
						; allocate data dictionary (1 MB)
						li			r3,		1
						rlwinm		r3,		r3,		20, 0, 31
						bl			L_malloc_DL_stub
						mr			r26,	r3
						STORE		r3,		_there0

						; save r1, r2, r24
						STORE		r1,	_ssp0
						STORE		r2,	_rtoc0
						STORE		r24,	_ref0
						
						; print welcome message
						LEA			r27,		_D_welcome_string
						bl			type_1
						
						; process argc and argv:
						; if argc>1, (learn) argv[1]
						LOAD		r3,		_argc
						cmpwi		r3,		2
						blt+		main_no_arg
						LOAD		r3,		_argv
						lwz			r27,		4(r3)
						bl			learnPT_1
main_no_arg:
						; enter dictionary
						bl			interpreter_0

						; epilog
main_exit:				li			r3,		0
						lmw			r13, 	( 24 + 32 )(r1)
						lwz			r1,	0(r1)
						lwz			r0, 	8(r1)
						mtlr		r0
						blr

; ----------------------------------
; !r1
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
restore_ssp_0:			LOAD		r1,	_ssp0
						blr

; ----------------------------------
; !r2
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
restore_rtoc_0:			LOAD		r2,	_rtoc0
						blr

; ----------------------------------
; !r24
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
restore_ref_mark:		mflr		r3
						addis		r24,	r3,		ha16(_ref0 - restore_ref_mark)
						lwz			r24,	lo16(_ref0 - restore_ref_mark)(r24)
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
sp0_0:					LOAD		r27,		_sp0
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
here0_0:				LEA			r27,		_here0
						blr
here0_1:				LEA			r28,		_here0
						blr
here0_2:				LEA			r29,		_here0
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
there0_0:				LEA			r27,		_there0
						blr
there0_1:				LEA			r28,		_there0
						blr
there0_2:				LEA			r29,		_there0
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
malloc_1:				mflr		r3
						mfctr		r4
						stwu		r3,		-4(r1)
						stwu		r4,		-4(r1)

						stwu		r1,	-64(r1)
						mr			r3,		r27
						bl			L_malloc_DL_stub
						mr			r27,		r3
						addi		r1,	r1,	64
						
						lwz			r4,		0(r1)
						lwz			r3,		4(r1)
						addi		r1,	r1,	8
						mtlr		r3
						mtctr		r4
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
realloc_2:				mflr		r3
						mfctr		r4
						stwu		r3,		-4(r1)
						stwu		r4,		-4(r1)

						stwu		r1,	-64(r1)
						mr			r3,		r27
						mr			r4,		r28
						bl			L_realloc_DL_stub
						mr			r27,		r3
						addi		r1,	r1,	64

						lwz			r4,		0(r1)
						lwz			r3,		4(r1)
						addi		r1,	r1,	8
						mtlr		r3
						mtctr		r4
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
free_1:					mflr		r3
						mfctr		r4
						stwu		r3,		-4(r1)
						stwu		r4,		-4(r1)

						stwu		r1,	-64(r1)
						mr			r3,		r27
						bl 			L_free_DL_stub
						addi		r1,	r1,	64
						
						lwz			r4,		0(r1)
						lwz			r3,		4(r1)
						addi		r1,	r1,	8
						mtlr		r3
						mtctr		r4
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
fopen_2:				mflr		r3
						mfctr		r4
						stwu		r3,		-4(r1)
						stwu		r4,		-4(r1)

						stwu		r1,	-64(r1)
						mr			r3,		r27
						mr			r4,		r28
						bl			L_fopen_DL_stub
						mr			r27,		r3
						addi		r1,	r1,	64
						
						lwz			r4,		0(r1)
						lwz			r3,		4(r1)
						addi		r1,	r1,	8
						mtlr		r3
						mtctr		r4
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
fclose_1:				mflr		r3
						mfctr		r4
						stwu		r3,		-4(r1)
						stwu		r4,		-4(r1)

						stwu		r1,	-64(r1)
						mr			r3,		r27
						bl			L_fclose_DL_stub
						addi		r1,	r1,	64
						
						lwz			r4,		0(r1)
						lwz			r3,		4(r1)
						addi		r1,	r1,	8
						mtlr		r3
						mtctr		r4
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
fgetc_1:				mflr		r3
						mfctr		r4
						stwu		r3,		-4(r1)
						stwu		r4,		-4(r1)

						stwu		r1,	-64(r1)
						mr			r3,		r27
						bl 			L_fgetc_DL_stub
						mr			r27,		r3
						addi		r1,	r1,	64
						
						lwz			r4,		0(r1)
						lwz			r3,		4(r1)
						addi		r1,	r1,	8
						mtlr		r3
						mtctr		r4
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
fputc_2:				mflr		r3
						mfctr		r4
						stwu		r3,		-4(r1)
						stwu		r4,		-4(r1)

						stwu		r1,	-64(r1)
						mr			r3,		r27
						mr			r4,		r28
						bl 			L_fputc_DL_stub
						mr			r27,		r3
						addi		r1,	r1,	64
						
						lwz			r4,		0(r1)
						lwz			r3,		4(r1)
						addi		r1,	r1,	8
						mtlr		r3
						mtctr		r4
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
MakeDataExecutable_2:	mflr		r3
						mfctr		r4
						stwu		r3,		-4(r1)
						stwu		r4,		-4(r1)

						stwu		r1,	-64(r1)
						mr			r3,		r27
						mr			r4,		r28
						bl 			L_MakeDataExecutable_DL_stub
						addi		r1,	r1,	64
						
						lwz			r4,		0(r1)
						lwz			r3,		4(r1)
						addi		r1,	r1,	8
						mtlr		r3
						mtctr		r4
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
std_1:					LOAD		r11,		L___sF_DL_non_lazy_ptr
						mulli		r27,		r27,		88
						add			r27,		r27,		r11
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
emitPT_0:				LEA			r27,		_emitPT
						blr
emitPT_1:				LEA			r28,		_emitPT
						blr
emitPT_2:				LEA			r29,		_emitPT
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
						LOAD		r3,		_emitPT
						mtlr		r3
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
keyPT_0:				LEA			r27,		_keyPT
						blr
keyPT_1:				LEA			r28,		_keyPT
						blr
keyPT_2:				LEA			r29,		_keyPT
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
						LOAD		r3,		_keyPT
						mtlr		r3
						blrl
						
						cmpwi		r27,		92
						bne+		key_done
						
						; read again
						LOAD		r3,		_keyPT
						mtlr		r3
						blrl

						; translate
key_n:					cmpwi		r27,		110		; newline
						bne-		key_t
						li			r27,		10
						b			key_done

key_t:					cmpwi		r27,		116		; tab
						bne-		key_backslash
						li			r27,		9
						b			key_done

key_backslash:			cmpwi		r27,		92		; backslash
						bne-		key_ignore
						li			r27,		92
						b			key_done

key_ignore:				cmpwi		r27,		10		; linefeed
						bne-		key_abort
						bl			key_0

key_done:				EPILOG0
key_abort:				LEA			r27,		key_STR
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
						mr			r13,		r27
						STORE		r13,		_editor_last_output
						li			r27,		1
						bl			std_1
						mr			r28,		r27
						mr			r27,		r13
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
						LEA			r13,		_editor_line
						LEA			r14,		_editor_pos
						lwz			r3,		0(r13)
						cmpwi		r3,		0
						; if the line is empty get a new one
						beq-		editor_key_getline
						lwz			r4,		0(r14)
						lbzx		r5,		r3,		r4
						cmpwi		r5,		0
						bne+		editor_key_get
						; if we`re at the end of the buffer get a new one
editor_key_getline:		bl			editor_getline_0
editor_key_get:			lwz			r3,		0(r13)
						lwz			r4,		0(r14)
						lbzx		r27,		r3,		r4
						; increase pos
						addi		r4,		r4,		1
						stw			r4,		0(r14)
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
						stwu		r0,		-4(r1)
						stwu		r1,	-64(r1)
						LEA			r13,		_editor_line

						; free line if necessary
						lwz			r27,		0(r13)
						cmpwi		r27,		0
						beq-		editor_getline_lfQ
						bl			free_1
						li			r3,		0
						stw			r3,		0(r13)

editor_getline_lfQ:		bl			Qlinefeed_0
						; invoke readline
editor_getline_read:	LEA			r3,		_readline_prompt
						bl			L_readline_DL_stub
						; if we got EOF, try again
						cmpwi		r3,		0
						bne+		editor_getline_noEOF
						bl			linefeed_0
						b			editor_getline_read

editor_getline_noEOF:	stw			r3,		0(r13)

						; if not empty, add to history
						lbz			r4,		0(r3)
						cmpwi		r4,		0
						bnel+		L_add_history_DL_stub

						; enlarge buffer by 1 ...
						lwz			r27,		0(r13)
						bl			STR_length_1
						mr			r14,		r27
						addi		r28,		r27,		1
						lwz			r27,		0(r13)
						bl			realloc_2
						stw			r27,		0(r13)

						; ... and append linefeed
						lwz			r3,		0(r13)
						add			r3,		r3,		r14
						li			r4,		10
						stb			r4,		0(r3)
						li			r4,		0
						stb			r4,		1(r3)
						addi		r14,		r14,		1

editor_getline_done:	li			r3,		0
						STORE		r3,		_editor_pos
						addi		r1,	r1,	64
						lwz			r0,		0(r1)
						addi		r1,	r1,	4
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
						stwu		r0,		-4(r1)
						mfctr		r0
						stwu		r0,		-4(r1)
						stwu		r13,		-4(r1)
						stwu		r14,		-4(r1)
						stwu		r15,		-4(r1)
						stwu		r16,		-4(r1)
						stwu		r24,	-4(r1)
						stwu		r27,		-4(r1)
						stwu		r28,		-4(r1)
						stwu		r29,		-4(r1)
						stwu		r31,		-4(r1)
						stwu		r1,	-64(r1)

						; r13 = text, r14 = state, r15 = result
						; r16 = new stack base
						mr			r13,		r3
						mr			r14,		r4

						; restore r24, set up a new stack because 
						; we're in readline's environment now 
						bl			restore_ref_0
editor_cpl_stack_size = 1024
						li			r3,		editor_cpl_stack_size
						bl			L_malloc_DL_stub
						mr			r16,		r3
						addi		r31,		r16,		editor_cpl_stack_size

						cmpwi		r14,		0
						bne+		editor_cpl_search

						; if state = 0 -> save length of text
						; init starting word
						mr			r27,		r13
						bl			STR_length_1
						STORE		r27,		_editor_cpl_len
						LOAD		r3,		_lastword
						STORE		r3,		_editor_cpl_word

editor_cpl_search:		LOAD		r28,		_editor_cpl_word
						; if we`re through, return 0
						cmpwi		r28,		0
						beq-		editor_cpl_fail

						stwu		r13,		-4(r31)
						LOAD		r27,		_editor_cpl_len
						li			r29,		6*4
						bl			STR_lookup_3

						; if nothing found, return 0
						cmpwi		r27,		0
						beq-		editor_cpl_fail

						; r13 = word
						mr			r13,		r27
						cmpwi		r27,		0
						beq-		editor_cpl_notlast
						lwz			r27,		0(r27)
editor_cpl_notlast:		STORE		r27,  _editor_cpl_word

						; return malloc-duplicated string
						addi		r27,		r13,		6*4
						bl			STR_dup_1
						mr			r15,		r27
						b			editor_cpl_done

editor_cpl_fail:		li			r15,		0

editor_cpl_done:		; free our stack
						mr			r3,		r16
						bl			L_free_DL_stub

						mr			r3,		r15

						addi		r1,	r1,	64
						lwz			r31,		0(r1)
						lwz			r29,		4(r1)
						lwz			r28,		8(r1)
						lwz			r27,		12(r1)
						lwz			r24,	16(r1)
						lwz			r16,		20(r1)
						lwz			r15,		24(r1)
						lwz			r14,		28(r1)
						lwz			r13,		32(r1)
						lwz			r0,		36(r1)
						mtctr		r0
						lwz			r0,		40(r1)
						addi		r1,	r1,	44
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
						LOAD		r27,		_editor_line
						cmpwi		r27,		0
						bnel-		free_1
						li			r3,		0
						STORE		r3,		_editor_line
						STORE		r3,		_editor_pos
						STORE		r3,		_editor_last_output
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
learnPT_1:				; r13 = _learn_data, r14 = file pointer
						; r15 = file name
						PROLOG3
						mr			r15,		r27
						
						; _learn_data looks like:
						; + 0	old _learn_data
						; + 4	old (key)
						; + 8	file pointer
						; + 12	line number
						; + 16	pointer to file name
						
						; open file -> r14
						LEA			r28,		learnPT_filemode
						bl			fopen_2
						mr			r14,		r27
						cmpwi		r27,		0
						beq-		learnPT_failed
						
						; allocate _learn_data -> r13
						li			r27,		20
						bl			malloc_1
						mr			r13,		r27
						
						; save _learn_data, set new
						LEA			r3,		_learn_data
						lwz			r4,		0(r3)
						stw			r4,		0(r13)
						stw			r13,		0(r3)
						
						; store file
						stw			r14,		8(r13)
						
						; init line number
						li			r3,		1
						stw			r3,		12(r13)
						
						; save (key), set new
						LOAD		r3,		_keyPT
						stw			r3,		4(r13)
						LEA			r3,		learningPT_0
						STORE		r3,		_keyPT
						
						; save filename
						mr			r27,		r15
						bl			STR_dup_1
						stw			r27,		16(r13)
						
						; init _learn_last_key
						li			r3,		0
						STORE		r3,		_learn_last_key
						
						EPILOG3

learnPT_failed:			bl			file_DOT_0
						LEA			r27,		learnPT_string
						bl			type_1
						mr			r27,		r15
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
						mr			r13,		r27
						bl			tickPT_1
						cmpwi		r27,		0
						bne-		Qlearn_no
						mr			r27,		r13
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
						LOAD		r13,		_learn_data
						cmpwi		r13,		0
						beq-		abort_file_nofile
						; close file, restore (key) and _learn_data
						lwz			r27,		8(r13)
						bl			fclose_1
						lwz			r3,		4(r13)
						STORE		r3,		_keyPT
						lwz			r3,		0(r13)
						STORE		r3,		_learn_data
						; free filename
						lwz			r27,		16(r13)
						bl			free_1
						; free our _learn_data
						mr			r27,		r13
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
						LOAD		r13,		_learn_data
						lwz			r27,		8(r13)
						bl			fgetc_1

						; if the last input was a linefeed, increase
						; line number. Otherwise a wrong line number
						; is displayed when aborting because of an
						; expression which ends with a linefeed.
						LOAD		r3,		_learn_last_key
						cmpwi		r3,		10
						bne+		learningPT_no_lf
						lwz			r3,		12(r13)
						addi		r3,		r3,		1
						stw			r3,		12(r13)

learningPT_no_lf:		; if it`s not EOF (= -1), return
						addic.		r3,		r27,		1
						bne+		learningPT_done

						; we got EOF, so cleanup
						bl			abort_file_0

						; `translate` EOF to linefeed
						li			r27,		10
learningPT_done:		STORE		r27,		_learn_last_key
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
fileQ_PT_0:				li			r28,		0
						LOAD		r3,		_learn_data
						cmpwi		r3,		0
						beq+		fileQ_PT_done
						; we`re reading a file
						lwz			r27,		12(r3)
						lwz			r28,		16(r3)
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
						; r13 = line number, r14 = file name
						mr			r13,		r27
						mr			r14,		r28
						; are we reading a file?
						cmpwi		r28,		0
						beq+		file_DOT_done
						; yes
						LEA			r27,		file_DOT_STR0
						bl			type_1

						mr			r27,		r14 ; file name
						bl			type_1

						LEA			r27,		file_DOT_STR1
						bl			type_1

						mr			r27,		r13 ; line number
						bl			u_dot_1
						
						LEA			r27,		file_DOT_STR2
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
						subi		r13,		r27,			1
type_loop:				lbzu		r27,		1(r13)
						cmpwi		r27,		0
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
plus_2:					add			r27,		r27,		r28
						blr
plus_3:					add			r28,		r28,		r29
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
minus_2:				sub			r27,		r27,		r28
						blr
minus_3:				sub			r28,		r28,		r29
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
or_2:					or			r27,		r27,		r28
						blr
or_3:					or			r28,		r28,		r29
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
store_2:				stw			r27,		0(r28)
						blr
store_3:				stw			r28,		0(r29)
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
fetch_1:				lwz			r27,		0(r27)
						blr
fetch_2:				lwz			r28,		0(r28)
						blr
fetch_3:				lwz			r29,		0(r29)
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
dup_1:					mr			r28,		r27
						blr
dup_2:					mr			r29,		r28
						blr
dup_3:					stwu		r27,		-4(r31)
						mr			r27,		r28
						mr			r28,		r29
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
drop_0:					addi		r31,		r31,		4
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
swap_0:					lwz			r27,		0(r31)
						lwz			r28,		4(r31)
						addi		r31,		r31,		8
						blr
swap_1:					lwz			r28,		0(r31)
						addi		r31,		r31,		4
						blr
swap_2:					mr			r0,		r27
						mr			r27,		r28
						mr			r28,		r0
						blr
swap_3:					mr			r0,		r28
						mr			r28,		r29
						mr			r29,		r0
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
rot_0:					lwz			r28,		0(r31)
						lwz			r27,		4(r31)
						lwz			r29,		8(r31)
						addi		r31,		r31,		12
						blr
rot_1:					lwz			r0,		0(r31)
						lwz			r29,		4(r31)
						mr			r28,		r27
						addi		r31,		r31,		8
						mr			r27,		r0
						blr
rot_2:					lwz			r29,		0(r31)
						addi		r31,		r31,		4
						blr
rot_3:					mr			r0,		r27
						mr			r27,		r28
						mr			r28,		r29
						mr			r29,		r0
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
over_0:					lwz			r28,		0(r31)
						lwz			r29,		4(r31)
						addi		r31,		r31,		8
						mr			r27,		r29
						blr
over_1:					lwz			r29,		0(r31)
						addi		r31,		r31,		4
						mr			r28,		r27
						mr			r27,		r29
						blr
over_2:					mr			r29,		r27
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
nip_0:					lwz			r27,		0(r31)
						addi		r31,		r31,		8
						blr
nip_1:					addi		r31,		r31,		4
						blr
nip_2:					mr			r27,		r28
						blr
nip_3:					mr			r28,		r29
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
comma_1:				stw			r27,		0(r25)
						addi		r25,	r25,	4
						blr
comma_2:				stw			r28,		0(r25)
						addi		r25,	r25,	4
						blr
comma_3:				stw			r29,		0(r25)
						addi		r25,	r25,	4
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
underscore_1:			stw			r27,		0(r26)
						addi		r26,	r26,	4
						blr
underscore_2:			stw			r28,		0(r26)
						addi		r26,	r26,	4
						blr
underscore_3:			stw			r29,		0(r26)
						addi		r26,	r26,	4
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
STR_length_1:			li			r3,		0
STR_length_load:		lwz			r5,		0(r27)
						li			r4,		4
STR_length_loop:		rlwinm		r5,		r5,		8, 0, 31
						rlwinm		r6,		r5,		0, 24, 31
						cmpwi		r6,		0
						beq-		STR_length_done
						subic.		r4,		r4,		1
						addi		r3,		r3,		1
						bne+		STR_length_loop
						addi		r27,		r27,		4
						b			STR_length_load
STR_length_done:		mr			r27,		r3
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
STR_compare_3:			mfctr		r4
						stwu		r4,		-4(r1)
						
						cmpwi		r29,		0
						lwz			r4,		0(r28)
						lwz			r5,		0(r27)
						li			r3,		-1	; result
						beq-		STR_compare_equal

						li			r8,		4	; constant
						mtctr		r8						
STR_compare_loop:		rlwinm		r4,		r4,		8,  0, 31
						rlwinm		r5,		r5,		8,  0, 31
						rlwinm		r6,		r4,		0, 24, 31
						rlwinm		r7,		r5,		0, 24, 31
						cmpw		r6,		r7
						bne-		STR_compare_no
						cmpwi		r6,		0
						beq-		STR_compare_equal
						
						subic.		r29,		r29,		1
						beq-		STR_compare_equal

						bdnz		STR_compare_loop
						; reload
						lwzu		r4,		4(r28)
						lwzu		r5,		4(r27)
						mtctr		r8
						b			STR_compare_loop

STR_compare_no:			li			r3,		0
STR_compare_equal:		lwz			r4,		0(r1)
						addi		r1,	r1,	4
						mr			r27,		r3
						mtctr		r4
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
STR_copy_2:				subi		r27,		r27,		1
						subi		r28,		r28,		1
STR_copy_loop:			lbzu		r3,		1(r27)
						cmpwi		r3,		0
						stbu		r3,		1(r28)
						bne+		STR_copy_loop
						mr			r27,		r28
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
						mr			r13,		r27
						bl			STR_length_1
						addi		r27,		r27,		1
						bl			malloc_1
						mr			r28,		r27
						mr			r27,		r13
						mr			r13,		r28
						bl			STR_copy_2
						mr			r27,		r13
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
						; r13 = str, r14 = len, r15 = list, r16 = offset
						lwz			r13,		0(r31)
						addi		r31,		r31,		4
						mr			r14,		r27
						mr			r15,		r28
						mr			r16,		r29

STR_lookup_loop:		cmpwi		r15,		0
						beq-		STR_lookup_failed
						add			r27,		r15,		r16
						mr			r28,		r13
						mr			r29,		r14
						bl			STR_compare_3
						cmpwi		r27,		0
						mr			r27,		r15
						bne-		STR_lookup_done
						lwz			r15,		0(r15)
						b			STR_lookup_loop
STR_lookup_failed:		li			r27,		0
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
text_buffer_1:			LEA			r28,		_text_buffer
						li			r29,		text_buffer_size-1
						blr
text_buffer_0:			LEA			r27,		_text_buffer
						li			r28,		text_buffer_size-1
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
blankQ_1:				li			r3,		1
						cmpwi		r27,		32	; blank
						beq-		blankQ_done
						cmpwi		r27,		9	; tab
						beq-		blankQ_done
						cmpwi		r27,		10	; linefeed
						beq-		blankQ_done
						cmpwi		r27,		13	; carriage return
						beq-		blankQ_done
						li			r3,		0
blankQ_done:			mr			r27,		r3
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
						mr			r13,		r27
						bl			blankQ_1
						cmpwi		r27,		0
						bne+		strip_loop
						mr			r27,		r13
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
						; r13 = base addr, r14 = current addr
						; r15 = count, r16 = max, r17 = char
						mr			r13,		r27
						mr			r14,		r27
						li			r15,		0
						mr			r16,		r28

						cmpwi		r16,		0
						beq-		wordPT_done

						bl			strip_0
						stb			r27,		0(r14)
						addi		r14,		r14,		1
wordPT_loop:			addi		r15,		r15,		1
						cmplw		r15,		r16
						bge-		wordPT_done
						bl			key_0
						mr			r17,		r27
						bl			blankQ_1
						cmpwi		r27,		0
						bne-		wordPT_done
						stb			r17,		0(r14)
						addi		r14,		r14,		1
						b			wordPT_loop

wordPT_done:			; zero-terminate string
						li			r3,		0
						stb			r3,		0(r14)
						mr			r27,		r13
						mr			r28,		r14
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
lastword_0:				LEA			r27,		_lastword
						blr
lastword_1:				LEA			r28,		_lastword
						blr
lastword_2:				LEA			r29,		_lastword
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
TO_flags_1:				addi		r27,		r27,		4
						blr
TO_flags_2:				addi		r28,		r28,		4
						blr
TO_flags_3:				addi		r29,		r29,		4
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
TO_code_2:				addi		r27,		r27,		2*4
						rlwinm		r28,		r28,		2, 28, 31
						add			r27,		r27,		r28
						blr
TO_code_3:				addi		r28,		r28,		2*4
						rlwinm		r29,		r29,		2, 28, 31
						add			r28,		r28,		r29
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
TO_name_1:				addi		r27,		r27,		6*4
						blr
TO_name_2:				addi		r28,		r28,		6*4
						blr
TO_name_3:				addi		r29,		r29,		6*4
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
						; r13 = word, r14 = d, r15 = n
						mr			r15,		r28
						mr			r14,		r28
						mr			r13,		r27
TO_near_code_loop:		mr			r27,		r13
						mr			r28,		r15
						bl			TO_code_2
						lwz			r27,		0(r27)
						cmpwi		r27,		0
						bne+		TO_near_code_done
						addi		r15,		r15,		1
TO_near_code_test:		cmpwi		r15,		3
						ble+		TO_near_code_loop
						li			r15,		0
						b			TO_near_code_loop

TO_near_code_done:		mr			r28,		r15
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
						; r3 = flags
						lwz			r3,		4(r27)
						rlwinm		r28,		r28,		1, 29, 31
						subi		r28,		r28,		32
						neg			r28,		r28
						; r27 = 32 - 2 * in
						rlwnm		r27,		r3,		r28, 30, 31
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
inlineQ_1:				lbz			r27,		4(r27)
						rlwinm		r27,		r27,		0, 31, 31
						blr
inlineQ_2:				lbz			r28,		4(r28)
						rlwinm		r28,		r28,		0, 31, 31
						blr
inlineQ_3:				lbz			r29,		4(r29)
						rlwinm		r29,		r29,		0, 31, 31
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
immediateQ_1:			lbz			r27,		4(r27)
						rlwinm		r27,		r27,		0, 30, 30
						blr
immediateQ_2:			lbz			r28,		4(r28)
						rlwinm		r28,		r28,		0, 30, 30
						blr
immediateQ_3:			lbz			r29,		4(r29)
						rlwinm		r29,		r29,		0, 30, 30
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
leafQ_1:				lbz			r27,		4(r27)
						rlwinm		r27,		r27,		0, 29, 29
						blr
leafQ_2:				lbz			r28,		4(r28)
						rlwinm		r28,		r28,		0, 29, 29
						blr
leafQ_3:				lbz			r29,		4(r29)
						rlwinm		r29,		r29,		0, 29, 29
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
explainedQ_1:			lbz			r27,		4(r27)
						rlwinm		r27,		r27,		0, 28, 28
						blr
explainedQ_2:			lbz			r28,		4(r28)
						rlwinm		r28,		r28,		0, 28, 28
						blr
explainedQ_3:			lbz			r29,		4(r29)
						rlwinm		r29,		r29,		0, 28, 28
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
						stwu		r27,		-4(r31)
						li			r27,		-1
						LOAD		r28,		_lastword
						li			r29,		4*6
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
base_0:					LEA			r27,		_base
						blr
base_1:					LEA			r28,		_base
						blr
base_2:					LEA			r29,		_base
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
to_digit_1:				LOAD		r3,		_base
						li			r28,		0
						cmpwi		r27,		48	; 0
						bltlr-
						cmpwi		r27,		57	; 9
						bgt+		to_digit_greater10
						subi		r27,		r27,		48
						b			to_digit_check
to_digit_greater10:		andi.		r27,		r27,		0xDF ; uppercase
						cmpwi		r27,		65	; A
						bltlr-
						cmpwi		r27,		90	; Z
						bgtlr+
						subi		r27,		r27,		55 ; A - 10
to_digit_check:			cmplw		r27,		r3
						bgelr-
						li			r28,		1
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
						; r13 = string, r14 = number, r15 = base
						LOAD		r15,		_base
						li			r14,		0
						mr			r13,		r27
to_numberPT_loop:		lbz			r27,		0(r13)
						cmpwi		r27,		0
						beq-		to_numberPT_done
						bl			to_digit_1
						mullw		r14,		r14,		r15
						cmpwi		r28,		0
						addi		r13,		r13,		1
						add			r14,		r14,		r27
						beq-		to_numberPT_return
						b			to_numberPT_loop
to_numberPT_done:		mr			r27,		r14
						li			r28,		1
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
						; r29 = f, r28 = str, r27 = sign, r6 = base
						; r3 = counter, r4 = char
						LEA			r5,		prefix_data
						LOAD		r6,		_base
						mr			r28,		r27
						li			r29,		1
						li			r27,		0
						li			r3,		2
prefix_load:			lbz			r4,		0(r28)
						cmpwi		r4,		0
						beq-		prefix_failed
						cmpwi		r4,		35
						blt+		prefix_done
						cmpwi		r4,		37
						bgt+		prefix_sign
						subi		r4,		r4,		35
						rlwinm		r4,		r4,		2, 0, 31
						lwzx		r6,		r5,		r4
						b			prefix_loop
prefix_sign:			cmpwi		r4,		43
						beq-		prefix_loop
						cmpwi		r4,		45
						bne+		prefix_done
						nand		r27,		r27,		r27
prefix_loop:			subic.		r3,		r3,		1
						addi		r28,		r28,		1
						bne			prefix_load
						b			prefix_done
prefix_failed:			li			r29,		0
prefix_done:			stwu		r6,		-4(r31)
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
						LOAD		r13,		_base
						bl			prefix_1
						lwz			r3,		0(r31)
						addi		r31,		r31,		4
						cmpwi		r29,		0
						beq-		to_number_failed
						mr			r14,		r27
						STORE		r3,		_base
						mr			r27,		r28
						bl			to_numberPT_1
						cmpwi		r28,		0
						beq-		to_number_failed
						cmpwi		r14,		0
						beq+		to_number_done
						neg			r27,		r27
						b			to_number_done
to_number_failed:		li			r28,		0
to_number_done:			STORE		r13,		_base
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
nrPT_1:					addi		r27,		r27,		48
						cmpwi		r27,		58
						blt+		nrPT_done
						addi		r27,		r27,		7
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
						LOAD		r4,		_base
						divwu		r13,		r27,		r4
						mullw		r3,		r13,		r4
						sub			r27,		r27,		r3
						bl			nrPT_1
						mr			r28,		r27
						mr			r27,		r13
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
						; r13 = addr, r14 = counter
						mr			r13,		r28
						li			r14,		0
nrnr_loop:				bl			nr_1
						stb			r28,		0(r13)
						cmpwi		r27,		0
						subi		r13,		r13,		1
						addi		r14,		r14,		1
						bne+		nrnr_loop
						mr			r27,		r14
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
nr_sign_2:				cmpwi		r27,		0
						mr			r27,		r28
						bgelr+
						li			r3,		45 ; '-'
						stbu		r3,		-1(r27)
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
						li			r3,		0
						stbu		r3,		34(r28)
						subi		r28,		r28,		1

						mr			r13,		r28
						bl			nrnr_2
						sub			r27,		r13,		r27
						addi		r27,		r27,		1
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
						cmpwi		r27,		0
						mr			r13,		r27
						bge+		dotPT_positive
						neg			r27,		r27
dotPT_positive:			bl			u_dotPT_2
						mr			r28,		r27
						mr			r27,		r13
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
						LEA			r28,		_text_buffer
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
						LEA			r28,		_text_buffer
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
						mr			r13,		r27
						li			r14,		31
bin_dot_loop:			rlwinm		r13,		r13,		1, 0, 31
						rlwinm		r27,		r13,		0, 31, 31
						addi		r27,		r27,		48
						bl			emit_1
						andi.		r27,		r14,		7
						bne+		bin_dot_nomark
						cmpwi		r14,		0
						beq-		bin_dot_nomark
						li			r27,		39	; separator
						bl			emit_1
bin_dot_nomark:			subic.		r14,		r14,	1
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
						mr			r13,		r27
						li			r14,		8
hex_dot_loop:			rlwinm		r13,		r13,		4, 0, 31
						rlwinm		r27,		r13,		0, 28, 31
						bl			nrPT_1
						bl			emit_1
						subic.		r14,		r14,		1
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
bye_0:					LOAD		r1,	_ssp0
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
here_0:					mr			r27,		r25
						blr
here_1:					mr			r28,		r25
						blr
here_2:					mr			r29,		r25
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
there_0:				mr			r27,		r26
						blr
there_1:				mr			r28,		r26
						blr
there_2:				mr			r29,		r26
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
align_1:				rlwinm		r11,		r27,		0, 0, 29
						cmpw		r11,		r27
						beq-		align_1_done
						addi		r27,		r11,		4
align_1_done:			blr
align_2:				rlwinm		r11,		r28,		0, 0, 29
						cmpw		r11,		r28
						beq-		align_3_done
						addi		r28,		r11,		4
align_2_done:			blr
align_3:				rlwinm		r11,		r29,		0, 0, 29
						cmpw		r11,		r29
						beq-		align_3_done
						addi		r29,		r11,		4
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
						li			r27,		32
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
						li			r27,		10
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
						LOAD		r3,		_editor_last_output
						cmpwi		r3,		10
						beq-		Qlinefeed_done
						li			r27,		10
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
						stwu		r13,		-4(r1)
						LOAD		r13,		_lastword
words_loop:				mr			r27,		r13
						bl			TO_name_1
						bl			type_1
						bl			blank_0
						lwz			r13,		0(r13)
						cmpwi		r13,		0
						bne+		words_loop
						bl			linefeed_0
						lwz			r13,		0(r1)
						addi		r1,	r1,	4
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
						; r13 = n, r14 = addr
						mr			r13,		r28
						mr			r14,		r27
						bl			Qlinefeed_0
dump_loop:				mr			r27,		r14
						bl			hex_dot_1
						bl			blank_0
						lwz			r27,		0(r14)
						addi		r14,		r14,		4
						bl			hex_dot_1
						bl			linefeed_0
						subic.		r13,		r13,		1
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
rotate_2:				rlwnm		r27, r27, r28, 0, 31
						blr
rotate_3:				rlwnm		r28, r28, r29, 0, 31
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
						lhz			r3,		0(r27)
						; wait for "]" = 5d00
						cmpwi		r3,		0x5d00
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
						cmpwi		r27,		41
						beq-		comment_done
						cmpwi		r27,		40
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
						mr			r13,		r27
						bl			explainedQ_1
						cmpwi		r27,		0
						beq-		explanation_done
						mr			r27,		r13
						bl			TO_name_1
						mr			r13,		r27
						bl			STR_length_1
						add			r27,		r27,		r13
						addi		r27,		r27,		1
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
						mr			r13,		r27
						bl			tickPT_1
						cmpwi		r27,		0
						bne+		explain_ok
						mr			r27,		r13
						bl			abort_what_1
						
explain_ok:				bl			explanation_1
						mr			r13,		r27
						cmpwi		r27,		0
						beq-		explain_failed
						bl			Qlinefeed_0
						mr			r27,		r13
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
						LOAD		r27,		_there0
						lbz			r3,		4(r27)
						li			r4,		8
						rlwimi		r3,		r4,		0, 28, 28
						stb			r3,		4(r27)
						
						; write string to dictionary
cp_explanation_loop:	bl			key_0
						stb			r27,		0(r26)
						addi		r26,	r26,	1
						cmpwi		r27,		34	; "
						bne			cp_explanation_loop

						; zero-terminate
						li			r3,		0
						stb			r3,		-1(r26)
						
						; align r26
						mr			r27,		r26
						bl			align_1
						mr			r26,	r27
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
						; r15 = word address
						mr			r15,		r27
						li			r28,		0
						bl			TO_near_code_2
						; r13 = in, r14 = ca
						mr			r13,		r28
						mr			r14,		r27
						mr			r27,		r15
						bl			cachedQ_2
						; r15 = out
						mr			r15,		r27

						; check stack
						LOAD		r4,		_sp0
						rlwinm		r3,		r13,		2, 28, 31
						add			r3,		r3,		r31
						cmpw		r4,		r3
						blt-		execute_underflow

						; pop stack cache
						mtlr		r14
						cmpwi		r13,		0
						beq-		execute_enter
						cmpwi		r13,		1
						beq+		execute_pop1
						cmpwi		r13,		2
						beq+		execute_pop2

execute_pop3:			lwz			r29,		0(r31)
						lwz			r28,		4(r31)
						lwz			r27,		8(r31)
						addi		r31,		r31,		12
						b			execute_enter
execute_pop2:			lwz			r28,		0(r31)
						lwz			r27,		4(r31)
						addi		r31,		r31,		8
						b			execute_enter
execute_pop1:			lwz			r27,		0(r31)
						addi		r31,		r31,		4

execute_enter:			blrl

						; check stack
						LOAD		r4,		_sp0
						cmpw		r4,		r31
						blt-		execute_underflow

						; push stack cache
						cmpwi		r15,		0
						beq-		execute_done
						cmpwi		r15,		1
						beq+		execute_push1
						cmpwi		r15,		2
						beq+		execute_push2
execute_push3:			stwu		r27,		-4(r31)
						stwu		r28,		-4(r31)
						stwu		r29,		-4(r31)
						b			execute_done
execute_push2:			stwu		r27,		-4(r31)
						stwu		r28,		-4(r31)
						b			execute_done
execute_push1:			stwu		r27,		-4(r31)

execute_done:			EPILOG3
execute_underflow:		LEA			r27,		execute_STR_underflow
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
						mr			r13,		r27
						bl			tickPT_1
						cmpwi		r27,		0
						beq-		interpretPT_number
						bl			execute_1
						b			interpretPT_done
interpretPT_number:		mr			r27,		r13
						bl			to_number_1
						cmpwi		r28,		0
						stwu		r27,		-4(r31)
						mr			r27,		r13
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
						li			r3,		10
						STORE		r3,		_base

						LEA			r3,		editor_emit_1
						STORE		r3,		_emitPT

						LEA			r3,		editor_key_0
						STORE		r3,		_keyPT

						; lf? must be before editor-abort
						bl			Qlinefeed_0
						bl			editor_abort_0

						LEA			r27,		abortPT_STR_ok
						bl			type_1

						li			r3,		0
						STORE		r3,		_learn_data
						STORE		r3,		_learn_last_key
						
						LOAD		r25,	_here0
						LOAD		r26,	_there0
						LOAD		r31,		_sp0
						LOAD		r1,	_ssp0

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
						mr			r13,		r27
						bl			file_DOT_0
						mr			r27,		r13
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
						LEA			r27,		abort_string
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
abort_what_1:			; r13 = str
						PROLOG1
						mr			r13,		r27
						; print file name and line number
						bl			file_DOT_0
						; print "What is ...?"
						LEA			r27,		abort_what_STR1
						bl			type_1
						mr			r27,		r13
						bl			type_1
						LEA			r27,		abort_what_STR2
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
						LOAD		r3,		_lastword
						stw			r3,		0(r26)
						; empty flags and code addresses
						li			r3,		0
						stw			r3,		4(r26)
						stw			r3,		8(r26)
						stw			r3,		12(r26)
						stw			r3,		16(r26)
						stw			r3,		20(r26)
						; copy name and align
						addi		r28,		r26,	24
						bl			STR_copy_2
						addi		r27,		r27,		1
						bl			align_1
						mr			r26,	r27
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
						li			r4,		0x0020
						addis		r4,		r4,		0x4E80 ; r4 = blr
cp_inline_loop:			lwz			r3,		0(r27)
						addi		r27,		r27,		4
						cmpw		r3,		r4
						beq-		cp_inline_done
						stw			r3,		0(r25)
						addi		r25,	r25,	4
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
cp_branch_1:			; r3 = displacement = addr - r25
						sub			r3,		r27,		r25
						li			r4,		1
						addis		r4,		r4,		0x4800 ; r4 = bl 0
						rlwimi		r4,		r3,		0, 6, 29
						stw			r4,		0(r25)
						addi		r25,	r25,	4
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
adjust_data_0_1:		lwz			r27,		0(r31)
						addi		r31,		r31,		4
						blr
adjust_data_0_2:		lwz			r28,		0(r31)
						lwz			r27,		4(r31)
						addi		r31,		r31,		8
						blr
adjust_data_0_3:		lwz			r29,		0(r31)
						lwz			r28,		4(r31)
						lwz			r27,		8(r31)
						addi		r31,		r31,		12
						blr
adjust_data_1_0:		stwu		r27,		-4(r31)
						blr
adjust_data_1_1:		blr
adjust_data_1_2:		mr			r28,		r27
						lwz			r27,		0(r31)
						addi		r31,		r31,		4
						blr
adjust_data_1_3:		lwz			r28,		0(r31)
						mr			r29,		r27
						lwz			r27,		4(r31)
						addi		r31,		r31,		8
						blr
adjust_data_2_0:		stwu		r27,		-4(r31)
						stwu		r28,		-4(r31)
						blr
adjust_data_2_1:		stwu		r27,		-4(r31)
						mr			r27,		r28
						blr
adjust_data_2_2:		blr
adjust_data_2_3:		lwz			r11,		0(r31)
						mr			r29,		r28
						mr			r28,		r27
						addi		r31,		r31,		4
						mr			r27,		r11
						blr
adjust_data_3_0:		stwu		r27,		-4(r31)
						stwu		r28,		-4(r31)
						stwu		r29,		-4(r31)
						blr
adjust_data_3_1:		stwu		r27,		-4(r31)
						stwu		r28,		-4(r31)
						mr			r27,		r29
						blr
adjust_data_3_2:		stwu		r27,		-4(r31)
						mr			r27,		r28
						mr			r28,		r29
						blr
adjust_data_3_3:		blr

.text
adjust_2:				PROLOG0
						; r3 = 4*before + after
						rlwinm		r3,		r27,		2, 0, 31
						add			r3,		r3,		r28
						LEA			r4,		adjust_data_pointer
						lbzx		r4,		r4,		r3
						LEA			r5,		adjust_data_ref
						add			r27,		r5,		r4
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
cp_word_2:				; r13 = word, r14 = desired in, r15 = in, r16 = code
						PROLOG4
						mr			r13,		r28
						mr			r14,		r27
						mr			r27,		r13
						mr			r28,		r14
						bl			TO_near_code_2
						mr			r15,		r28
						mr			r16,		r27
						mr			r27,		r14
						bl			adjust_2
						mr			r27,		r13
						bl			inlineQ_1
						cmpwi		r27,		0
						mr			r27,		r16
						bne-		cp_word_inline
						bl			cp_branch_1
						b			cp_word_cont
cp_word_inline:			bl			cp_inline_1
cp_word_cont:			mr			r27,		r13
						mr			r28,		r15
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
						subi		r25,	r25,	4
						cmpwi		r28,		0
						bge+		lil_positive
						; negative
						nand		r4,		r28,		r28
						cntlzw		r4,		r4
						cmpwi		r4,		16
						bgt+		lil_one
						b			lil_three
lil_positive:			cntlzw		r4,		r28
						cmpwi		r4,		16
						bgt+		lil_one
						beq-		lil_two
						b			lil_three
lil_one:				; li cX, num(16:31)
						lis			r4,		0x3800
						rlwimi		r4,		r27,		21, 6, 10
						rlwimi		r4,		r28,		0, 16, 31
						stwu		r4,		4(r25)
						b			lil_done
lil_two:				; li cX, 0
						lis			r4,		0x3800
						rlwimi		r4,		r27,		21, 6, 10
						stwu		r4,		4(r25)
						; ori cX, cX, num(16:31)
						lis			r4,		0x6000
						rlwimi		r4,		r27,		21, 6, 10
						rlwimi		r4,		r27,		16, 11, 15
						rlwimi		r4,		r28,		0, 16, 31
						stwu		r4,		4(r25)
						b			lil_done
lil_three:				; lis cX, num(0:15)
						lis			r4,		0x3C00
						rlwimi		r4,		r27,		21, 6, 10
						rlwimi		r4,		r28,		16, 16, 31
						stwu		r4,		4(r25)
						; num(16:31) could be 0
						rlwinm		r4,		r28,		0, 16, 31
						cmpwi		r4,		0
						beq-		lil_done
						; ori cX, cX, num(16:31)
						lis			r4,		0x6000
						rlwimi		r4,		r27,		21, 6, 10
						rlwimi		r4,		r27,		16, 11, 15
						rlwimi		r4,		r28,		0, 16, 31
						stwu		r4,		4(r25)
lil_done:				addi		r25,	r25,	4
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
						; r13 = out, r14 = n
						cmpwi		r27,		3
						mr			r14,		r28
						addi		r13,		r27,		1
						bne+		literal_foo
						; in=3 => adjust stack cache
						li			r27,		3
						li			r28,		2
						bl			adjust_2
						li			r13,		3
literal_foo:			addi		r27,		r13,		27-1 ; target register
						mr			r28,		r14
						bl			lil_2
						mr			r27,		r13
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
cp_bits_data_3:			rlwimi		r29,		r28, 	0, 0, 0
						mr			r28,		r29
cp_bits_data_2:			rlwimi		r28,		r27, 	0, 0, 0
						mr			r27,		r28
cp_bits_3:				PROLOG3
						; r13 = pos, r14 = num, r15 = out
						mr			r13,		r28
						mr			r14,		r29
						; r6 = index to cp_bits_data
						; r15 = max(in-1, 2)
						LEA			r6,		cp_bits_data_3
						li			r15,		2
						cmpwi		r27,		3
						; if in=3 everything`s fine
						beq-		cp_bits_foo
						; otherwise adjust to 2
						li			r15,		1
						li			r28,		2
						bl			adjust_2
						LEA			r6,		cp_bits_data_2
cp_bits_foo:
						; runtime: r28/2 = dest, r27/1 = source
						; r3 = rlwimi r28/2, r27/1, 0, 0, 0, which becomes
						; rlwimi r28/2, r27/1, 32-num-pos, pos, pos+num-1
						lwz			r3,		0(r6)
						; r4 = 32 - num - pos
						li			r4,		32
						sub			r4,		r4,		r14
						sub			r4,		r4,		r13
						; r5 = pos + num - 1
						add			r5,		r13,		r14
						subi		r5,		r5,		1
						; fill in arguments
						rlwimi		r3,		r4,		11, 16, 20
						rlwimi		r3,		r13,		6, 21, 25
						rlwimi		r3,		r5,		1, 26, 30
						; compile it
						stw			r3,		0(r25)
						addi		r25,	r25,	4
						; compile: mr r27/1, r28/2
						lwz			r3,		4(r6)
						stw			r3,		0(r25)
						addi		r25,	r25,	4

						mr			r27,		r15
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
						; r13 = in, r14 = str, r15 = word
						mr			r13,		r27
						mr			r14,		r28
						; tick the string
						mr			r27,		r28
						bl			tickPT_1
						cmpwi		r27,		0
						beq-		compiler_num
						; it`s a word which is ...
						mr			r15,		r27
						bl			immediateQ_1
						cmpwi		r27,		0
						bne+		compiler_immediate
						; ... non-immediate
						mr			r28,		r15
						mr			r27,		r13
						bl			cp_word_2
						b			compiler_done
compiler_immediate:		; ... immediate
						stwu		r13,		-4(r31)
						mr			r27,		r15
						bl			execute_1
						lwz			r27,		0(r31)
						addi		r31,		r31,		4
						b			compiler_done
compiler_num:			; it should be a number
						mr			r27,		r14
						bl			to_number_1
						cmpwi		r28,		0
						beq-		compiler_failed
						mr			r28,		r27
						mr			r27,		r13
						bl			literal_2
compiler_done:			EPILOG3
compiler_failed:		mr			r27,		r14
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
						mr			r28,		r27
						LOAD		r27,		_there0
						bl			TO_code_2
						stw			r25,	0(r27)
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
cached_2:				LOAD		r3,		_there0
						lbz			r4,		7(r3)
						rlwinm		r27,		r27,		1, 0, 31
						rlwnm		r28,		r28,		r27, 0, 31
						or			r4,		r4,		r28
						stb			r4,		7(r3)
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
						stwu		r0,		-4(r1)
prolog_0:				LEA			r3,		prolog_data
						lfd			f0,		0(r3)
						stfd		f0,		0(r25)
						addi		r25,	r25,	8
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
epilog_data:			lwz			r0,		0(r1)
						addi		r1,	r1,	4
						mtlr		r0
epilog_0:				LEA			r3,		epilog_data
						lfd			f0,		0(r3)
						lwz			r4,		8(r3)
						stfd		f0,		0(r25)
						stw			r4,		8(r25)
						addi		r25,	r25,	12
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
NUM_locals_0:			li			r27,		_number_of_locals
						blr
NUM_locals_1:			li			r28,		_number_of_locals
						blr
NUM_locals_2:			li			r29,		_number_of_locals
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
save_locals_data:		stwu		r0,		-4(r1)
save_locals_str:		.asciz		"Too many local variables."
						.align		2

.text
save_locals_1:			cmpwi		r27,		0
						beq-		save_locals_done
						cmplwi		r27,		_number_of_locals
						ble+		save_locals_ok
						; too many locals => abort
						LEA			r27,		save_locals_str
						bl			STR_abort_1
						; stwu rX, -4(r1)
save_locals_ok:			subi		r25,	r25,	4
						LOAD		r3,		save_locals_data
						addi		r27,		r27,		13-1
save_locals_loop:		rlwimi		r3,		r27,		21, 6, 10
						stwu		r3,		4(r25)
						subi		r27,		r27,		1
						cmpwi		r27,		13
						bge+		save_locals_loop
						addi		r25,	r25,	4
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
restore_locals_data:	lwz			r0,		0(r1)
						addi		r1,	r1,	0
restore_locals_1:		cmpwi		r27,		0
						beq-		restore_locals_done
						; lwz sX, (X*4)(r1)
						subi		r25,	r25,	4
						LOAD		r3,		restore_locals_data
						li			r4,		0
restore_locals_loop:	addi		r5,		r4,		13
						rlwimi		r3,		r4,		2, 16, 31
						rlwimi		r3,		r5,		21, 6, 10
						stwu		r3,		4(r25)
						addi		r4,		r4,		1
						cmpw		r4,		r27
						blt+		restore_locals_loop

						; addi r1, r1, n*4
						LOAD		r3,		restore_locals_data+4
						rlwimi		r3,		r27,		2, 16, 31
						stwu		r3,		4(r25)

						addi		r25,	r25,	4
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
cp_blr_2:				li			r11,		0x0020
						addis		r11,		r11,		0x4E80
						stw			r11,		0(r25)
						addi		r25,	r25,	4
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
						LOAD		r27,		_here0
						sub			r28,		r25,	r27
						bl			MakeDataExecutable_2
						LOAD		r3,		_there0
						STORE		r3,		_lastword
						STORE		r26,	_there0
						STORE		r25,	_here0
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
compileQ_0:				LEA			r27,		_compileQ
						blr
compileQ_1:				LEA			r28,		_compileQ
						blr
compileQ_2:				LEA			r29,		_compileQ
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
						LOAD		r3,		_there0
						lbz			r4,		4(r3)
						; 5 = #101 = inline & leaf
						ori			r4,		r4,		5
						stb			r4,		4(r3)
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
leaf_2: leaf_3:			LOAD		r3,		_there0
						lbz			r4,		4(r3)
						ori			r4,		r4,		4
						stb			r4,		4(r3)
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
						LOAD		r3,		_lastword
						lbz			r4,		4(r3)
						ori			r4,		r4,		2
						stb			r4,		4(r3)
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
compile_data_0:			LEA			r27,		_compile_data
						blr
compile_data_1:			LEA			r28,		_compile_data
						blr
compile_data_2:			LEA			r29,		_compile_data
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
						; r13 = in, r14 = #local variables
						mr			r13,		r27
						mr			r14,		r28
						; push ID
						lis			r3,		0x283A
						ori			r3,		r3,		0x3B29
						stwu		r3,		-4(r31)
						; setup :;-data
						li			r3,		0
						rlwimi		r3,		r13,		0, 30, 31 ; in
						rlwimi		r3,		r14,		2, 25, 29 ; l
						STORE		r3,		_compile_data
						STORE		r25,	_compile_data+4
						; compile prolog if word is not a leaf
						LOAD		r27,		_there0
						bl			leafQ_1
						cmpwi		r27,		0
						bne-		colonPT_no_prolog
						bl			prolog_0
colonPT_no_prolog:		; save-locals
						mr			r27,		r14
						bl			save_locals_1
						; set compile? to true
						li			r3,		1
						STORE		r3,		_compileQ
						; loop until compile? is false
colonPT_loop:			bl			word_0
						mr			r28,		r27
						mr			r27,		r13
						bl			compiler_2
						mr			r13,		r27
						LOAD		r3,		_compileQ
						cmpwi		r3,		0
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
						; r13 = our in which could become out
						mr			r13,		r27
						
						; set compile? to false
						li			r3,		0
						STORE		r3,		_compileQ
						
						; check ID
						lwz			r3,		0(r31)
						addi		r31,		r31,		4
						lis			r4,		0x283A
						ori			r4,		r4,		0x3B29
						cmpw		r3,		r4
						beq+		semicolonPT_ID_ok
						; if ID is wrong, abort
						LEA			r27,		semicolonPT_STR
						bl			STR_abort_1
						
semicolonPT_ID_ok:		
						; r16 = code address
						LOAD		r16,		_compile_data+4
						; read :;-data
						LOAD		r3,		_compile_data
						; r14='in', r15='l'
						rlwinm		r14,		r3,		0, 30, 31
						rlwinm		r15,		r3,		30, 27, 31
						; if 'out' isn`t locked, we ignore it						
						rlwinm.		r4,		r3,		0, 22, 22
						beq+		semicolonPT_leave_out
						; otherwise, we use (r13=out) and adjust to it
						mr			r27,		r13
						rlwinm		r13,		r3,		25, 30, 31
						mr			r28,		r13
						bl			adjust_2

semicolonPT_leave_out:	; restore-locals
						mr			r27,		r15
						bl			restore_locals_1
						; compile epilog if word is not a leaf
						LOAD		r27,		_there0
						bl			leafQ_1
						cmpwi		r27,		0
						bne-		semicolonPT_no_epilog
						bl			epilog_0
semicolonPT_no_epilog:	
						; blr,
						bl			cp_blr_0
						; store stack cache flag
						mr			r27,		r14
						mr			r28,		r13
						bl			cached_2
						; store code address
						LOAD		r27,		_there0
						mr			r28,		r14
						bl			TO_code_2
						stw			r16,		0(r27)

						; this 0 will never be used
						li			r27,		0
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
						li			r27,		0
						li			r28,		0
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
						LOAD		r3,		_compileQ
						cmpwi		r3,		0
						beq+		semicolon_good
						lwz			r27,		0(r31)
						addi		r31,		r31,		4
						bl			semicolonPT_1
						stwu		r27,		-4(r31)
semicolon_good:			; if compile? was false, we completely
						; ignore in/out on the stack
						bl			welcome_0
						EPILOG0

; update _lastword if you change something here!
