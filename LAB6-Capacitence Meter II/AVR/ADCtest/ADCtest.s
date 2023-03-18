	.file	"ADCtest.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.Ltext0:
	.cfi_sections	.debug_frame
.global	adc_init
	.type	adc_init, @function
adc_init:
.LFB7:
	.file 1 "ADCtest.c"
	.loc 1 12 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 13 0
	ldi r24,lo8(64)
	sts 124,r24
	.loc 1 14 0
	ldi r24,lo8(-121)
	sts 122,r24
/* epilogue start */
	.loc 1 15 0
	ret
	.cfi_endproc
.LFE7:
	.size	adc_init, .-adc_init
.global	adc_read
	.type	adc_read, @function
adc_read:
.LFB8:
	.loc 1 18 0
	.cfi_startproc
.LVL0:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 20 0
	lds r18,124
	andi r18,lo8(-8)
	.loc 1 19 0
	andi r24,7
	clr r25
.LVL1:
	.loc 1 20 0
	or r18,r24
	sts 124,r18
	.loc 1 22 0
	lds r24,122
.LVL2:
	ori r24,lo8(64)
	sts 122,r24
.L3:
	.loc 1 24 0 discriminator 1
	lds r24,122
	sbrc r24,6
	rjmp .L3
	.loc 1 26 0
	lds r24,120
	lds r25,120+1
/* epilogue start */
	.loc 1 27 0
	ret
	.cfi_endproc
.LFE8:
	.size	adc_read, .-adc_read
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"\nADC test (meassuring ADC0 (pin 23 of DIP28)"
.global	__floatunsisf
.global	__divsf3
.LC1:
	.string	"ADC[0]=0x%03x, %fV\r"
	.section	.text.startup,"ax",@progbits
.global	main
	.type	main, @function
main:
.LFB9:
	.loc 1 30 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 33 0
	call usart_init
	.loc 1 34 0
	call adc_init
	.loc 1 36 0
	sbi 0x4,0
	.loc 1 37 0
	sbi 0x5,0
	.loc 1 39 0
	ldi r24,lo8(.LC0)
	ldi r25,hi8(.LC0)
	call puts
	.loc 1 44 0
	ldi r24,lo8(5)
	mov r14,r24
	ldi r16,lo8(.LC1)
	ldi r17,hi8(.LC1)
	.loc 1 45 0
	clr r15
	inc r15
.L6:
	.loc 1 43 0 discriminator 1
	ldi r25,0
	ldi r24,0
	call adc_read
	movw r28,r24
	.loc 1 44 0 discriminator 1
	mul r14,r24
	movw r22,r0
	mul r14,r25
	add r23,r0
	clr __zero_reg__
	ldi r25,0
	ldi r24,0
	call __floatunsisf
	ldi r18,0
	ldi r19,lo8(-64)
	ldi r20,lo8(127)
	ldi r21,lo8(68)
	call __divsf3
	push r25
	.cfi_def_cfa_offset 3
	push r24
	.cfi_def_cfa_offset 4
	push r23
	.cfi_def_cfa_offset 5
	push r22
	.cfi_def_cfa_offset 6
	push r29
	.cfi_def_cfa_offset 7
	push r28
	.cfi_def_cfa_offset 8
	push r17
	.cfi_def_cfa_offset 9
	push r16
	.cfi_def_cfa_offset 10
	call printf
	.loc 1 45 0 discriminator 1
	in r24,0x5
	eor r24,r15
	out 0x5,r24
.LBB4:
.LBB5:
	.file 2 "c:\\programs\\avr-gcc-7.3.0-x64-mingw\\avr\\include\\util\\delay.h"
	.loc 2 187 0 discriminator 1
	ldi r25,lo8(1599999)
	ldi r18,hi8(1599999)
	ldi r24,hlo8(1599999)
1:	subi r25,1
	sbci r18,0
	sbci r24,0
	brne 1b
	rjmp .
	nop
	in r24,__SP_L__
	in r25,__SP_H__
	adiw r24,8
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r25
	out __SREG__,__tmp_reg__
	out __SP_L__,r24
	.cfi_def_cfa_offset 2
	rjmp .L6
.LBE5:
.LBE4:
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.text
.Letext0:
	.file 3 "c:\\programs\\avr-gcc-7.3.0-x64-mingw\\avr\\include\\stdint.h"
	.file 4 "c:\\programs\\avr-gcc-7.3.0-x64-mingw\\avr\\include\\stdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x219
	.word	0x4
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF20
	.byte	0xc
	.long	.LASF21
	.long	.LASF22
	.long	.Ldebug_ranges0+0
	.long	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x3
	.long	.LASF2
	.byte	0x3
	.byte	0x7e
	.long	0x37
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x4
	.byte	0x2
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.long	.LASF3
	.byte	0x3
	.byte	0x80
	.long	0x50
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.long	.LASF5
	.uleb128 0x3
	.long	.LASF6
	.byte	0x3
	.byte	0x82
	.long	0x69
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF9
	.uleb128 0x5
	.long	.LASF23
	.byte	0xe
	.byte	0x4
	.byte	0xf4
	.long	0xf0
	.uleb128 0x6
	.string	"buf"
	.byte	0x4
	.byte	0xf5
	.long	0xf0
	.byte	0
	.uleb128 0x7
	.long	.LASF10
	.byte	0x4
	.byte	0xf6
	.long	0x37
	.byte	0x2
	.uleb128 0x7
	.long	.LASF11
	.byte	0x4
	.byte	0xf7
	.long	0x2c
	.byte	0x3
	.uleb128 0x8
	.long	.LASF12
	.byte	0x4
	.word	0x107
	.long	0x3e
	.byte	0x4
	.uleb128 0x9
	.string	"len"
	.byte	0x4
	.word	0x108
	.long	0x3e
	.byte	0x6
	.uleb128 0x9
	.string	"put"
	.byte	0x4
	.word	0x109
	.long	0x117
	.byte	0x8
	.uleb128 0x9
	.string	"get"
	.byte	0x4
	.word	0x10a
	.long	0x12c
	.byte	0xa
	.uleb128 0x8
	.long	.LASF13
	.byte	0x4
	.word	0x10b
	.long	0x132
	.byte	0xc
	.byte	0
	.uleb128 0xa
	.byte	0x2
	.long	0xf6
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF14
	.uleb128 0xb
	.long	0x3e
	.long	0x111
	.uleb128 0xc
	.long	0xf6
	.uleb128 0xc
	.long	0x111
	.byte	0
	.uleb128 0xa
	.byte	0x2
	.long	0x7e
	.uleb128 0xa
	.byte	0x2
	.long	0xfd
	.uleb128 0xb
	.long	0x3e
	.long	0x12c
	.uleb128 0xc
	.long	0x111
	.byte	0
	.uleb128 0xa
	.byte	0x2
	.long	0x11d
	.uleb128 0xd
	.byte	0x2
	.uleb128 0xe
	.long	0x111
	.long	0x13f
	.uleb128 0xf
	.byte	0
	.uleb128 0x10
	.long	.LASF24
	.byte	0x4
	.word	0x197
	.long	0x134
	.uleb128 0x11
	.long	.LASF15
	.byte	0x1
	.byte	0x1d
	.long	0x3e
	.long	.LFB9
	.long	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x1a0
	.uleb128 0x12
	.string	"adc"
	.byte	0x1
	.byte	0x1f
	.long	0x50
	.uleb128 0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.uleb128 0x13
	.long	0x1da
	.long	.LBB4
	.long	.LBE4-.LBB4
	.byte	0x1
	.byte	0x2e
	.uleb128 0x14
	.long	0x1e6
	.uleb128 0x15
	.long	.LBB5
	.long	.LBE5-.LBB5
	.uleb128 0x16
	.long	0x1f1
	.uleb128 0x16
	.long	0x1fc
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x17
	.long	.LASF16
	.byte	0x1
	.byte	0x11
	.long	0x45
	.long	.LFB8
	.long	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x1c9
	.uleb128 0x18
	.string	"pin"
	.byte	0x1
	.byte	0x11
	.long	0x3e
	.long	.LLST0
	.byte	0
	.uleb128 0x19
	.long	.LASF25
	.byte	0x1
	.byte	0xb
	.long	.LFB7
	.long	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1a
	.long	.LASF26
	.byte	0x2
	.byte	0xa6
	.byte	0x3
	.long	0x215
	.uleb128 0x1b
	.long	.LASF27
	.byte	0x2
	.byte	0xa6
	.long	0x215
	.uleb128 0x1c
	.long	.LASF17
	.byte	0x2
	.byte	0xa8
	.long	0x215
	.uleb128 0x1c
	.long	.LASF18
	.byte	0x2
	.byte	0xac
	.long	0x5e
	.uleb128 0x1d
	.long	.LASF28
	.byte	0x2
	.byte	0xad
	.uleb128 0xc
	.long	0x69
	.byte	0
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF19
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LVL0
	.long	.LVL0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL0
	.long	.LVL1
	.word	0x5
	.byte	0x88
	.sleb128 0
	.byte	0x37
	.byte	0x1a
	.byte	0x9f
	.long	.LVL1
	.long	.LVL2
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL2
	.long	.LFE8
	.word	0x6
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x37
	.byte	0x1a
	.byte	0x9f
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x24
	.word	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.word	0
	.word	0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	.LFB9
	.long	.LFE9-.LFB9
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.Ltext0
	.long	.Letext0
	.long	.LFB9
	.long	.LFE9
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF21:
	.string	"ADCtest.c"
.LASF13:
	.string	"udata"
.LASF22:
	.string	"C:\\Source\\crosside\\Make_Projects\\AVR\\ADCtest"
.LASF23:
	.string	"__file"
.LASF28:
	.string	"__builtin_avr_delay_cycles"
.LASF25:
	.string	"adc_init"
.LASF1:
	.string	"unsigned char"
.LASF7:
	.string	"long unsigned int"
.LASF26:
	.string	"_delay_ms"
.LASF19:
	.string	"double"
.LASF17:
	.string	"__tmp"
.LASF15:
	.string	"main"
.LASF4:
	.string	"unsigned int"
.LASF11:
	.string	"flags"
.LASF9:
	.string	"long long unsigned int"
.LASF2:
	.string	"uint8_t"
.LASF20:
	.string	"GNU C11 7.3.0 -mn-flash=1 -mno-skip-bug -mmcu=avr5 -g -Os"
.LASF10:
	.string	"unget"
.LASF16:
	.string	"adc_read"
.LASF8:
	.string	"long long int"
.LASF14:
	.string	"char"
.LASF18:
	.string	"__ticks_dc"
.LASF3:
	.string	"uint16_t"
.LASF6:
	.string	"uint32_t"
.LASF5:
	.string	"long int"
.LASF0:
	.string	"signed char"
.LASF12:
	.string	"size"
.LASF24:
	.string	"__iob"
.LASF27:
	.string	"__ms"
	.ident	"GCC: (GNU) 7.3.0"
.global __do_copy_data
