;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1170 (Feb 16 2022) (MSVC)
; This file was generated Tue Mar 07 22:08:24 2023
;--------------------------------------------------------
$name EFM8_ADC
$optc51 --model-small
$printf_float
	R_DSEG    segment data
	R_CSEG    segment code
	R_BSEG    segment bit
	R_XSEG    segment xdata
	R_PSEG    segment xdata
	R_ISEG    segment idata
	R_OSEG    segment data overlay
	BIT_BANK  segment data overlay
	R_HOME    segment code
	R_GSINIT  segment code
	R_IXSEG   segment xdata
	R_CONST   segment code
	R_XINIT   segment code
	R_DINIT   segment code

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	public _InitPinADC_PARM_2
	public _main
	public _writeOutputBuffer
	public _PtoC
	public _TIMER0_Init
	public _getsn
	public _LCDprint
	public _LCD_4BIT
	public _WriteCommand
	public _WriteData
	public _LCD_byte
	public _LCD_pulse
	public _Volts_at_Pin
	public _ADC_at_Pin
	public _InitPinADC
	public _waitms
	public _Timer3us
	public _InitADC
	public __c51_external_startup
	public _LCDprint_PARM_3
	public _writeOutputBuffer_PARM_2
	public _getsn_PARM_2
	public _LCDprint_PARM_2
	public _overflow_count
	public _getHalfPeriod
;--------------------------------------------------------
; Special Function Registers
;--------------------------------------------------------
_ACC            DATA 0xe0
_ADC0ASAH       DATA 0xb6
_ADC0ASAL       DATA 0xb5
_ADC0ASCF       DATA 0xa1
_ADC0ASCT       DATA 0xc7
_ADC0CF0        DATA 0xbc
_ADC0CF1        DATA 0xb9
_ADC0CF2        DATA 0xdf
_ADC0CN0        DATA 0xe8
_ADC0CN1        DATA 0xb2
_ADC0CN2        DATA 0xb3
_ADC0GTH        DATA 0xc4
_ADC0GTL        DATA 0xc3
_ADC0H          DATA 0xbe
_ADC0L          DATA 0xbd
_ADC0LTH        DATA 0xc6
_ADC0LTL        DATA 0xc5
_ADC0MX         DATA 0xbb
_B              DATA 0xf0
_CKCON0         DATA 0x8e
_CKCON1         DATA 0xa6
_CLEN0          DATA 0xc6
_CLIE0          DATA 0xc7
_CLIF0          DATA 0xe8
_CLKSEL         DATA 0xa9
_CLOUT0         DATA 0xd1
_CLU0CF         DATA 0xb1
_CLU0FN         DATA 0xaf
_CLU0MX         DATA 0x84
_CLU1CF         DATA 0xb3
_CLU1FN         DATA 0xb2
_CLU1MX         DATA 0x85
_CLU2CF         DATA 0xb6
_CLU2FN         DATA 0xb5
_CLU2MX         DATA 0x91
_CLU3CF         DATA 0xbf
_CLU3FN         DATA 0xbe
_CLU3MX         DATA 0xae
_CMP0CN0        DATA 0x9b
_CMP0CN1        DATA 0x99
_CMP0MD         DATA 0x9d
_CMP0MX         DATA 0x9f
_CMP1CN0        DATA 0xbf
_CMP1CN1        DATA 0xac
_CMP1MD         DATA 0xab
_CMP1MX         DATA 0xaa
_CRC0CN0        DATA 0xce
_CRC0CN1        DATA 0x86
_CRC0CNT        DATA 0xd3
_CRC0DAT        DATA 0xcb
_CRC0FLIP       DATA 0xcf
_CRC0IN         DATA 0xca
_CRC0ST         DATA 0xd2
_DAC0CF0        DATA 0x91
_DAC0CF1        DATA 0x92
_DAC0H          DATA 0x85
_DAC0L          DATA 0x84
_DAC1CF0        DATA 0x93
_DAC1CF1        DATA 0x94
_DAC1H          DATA 0x8a
_DAC1L          DATA 0x89
_DAC2CF0        DATA 0x95
_DAC2CF1        DATA 0x96
_DAC2H          DATA 0x8c
_DAC2L          DATA 0x8b
_DAC3CF0        DATA 0x9a
_DAC3CF1        DATA 0x9c
_DAC3H          DATA 0x8e
_DAC3L          DATA 0x8d
_DACGCF0        DATA 0x88
_DACGCF1        DATA 0x98
_DACGCF2        DATA 0xa2
_DERIVID        DATA 0xad
_DEVICEID       DATA 0xb5
_DPH            DATA 0x83
_DPL            DATA 0x82
_EIE1           DATA 0xe6
_EIE2           DATA 0xf3
_EIP1           DATA 0xbb
_EIP1H          DATA 0xee
_EIP2           DATA 0xed
_EIP2H          DATA 0xf6
_EMI0CN         DATA 0xe7
_FLKEY          DATA 0xb7
_HFO0CAL        DATA 0xc7
_HFO1CAL        DATA 0xd6
_HFOCN          DATA 0xef
_I2C0ADM        DATA 0xff
_I2C0CN0        DATA 0xba
_I2C0DIN        DATA 0xbc
_I2C0DOUT       DATA 0xbb
_I2C0FCN0       DATA 0xad
_I2C0FCN1       DATA 0xab
_I2C0FCT        DATA 0xf5
_I2C0SLAD       DATA 0xbd
_I2C0STAT       DATA 0xb9
_IE             DATA 0xa8
_IP             DATA 0xb8
_IPH            DATA 0xf2
_IT01CF         DATA 0xe4
_LFO0CN         DATA 0xb1
_P0             DATA 0x80
_P0MASK         DATA 0xfe
_P0MAT          DATA 0xfd
_P0MDIN         DATA 0xf1
_P0MDOUT        DATA 0xa4
_P0SKIP         DATA 0xd4
_P1             DATA 0x90
_P1MASK         DATA 0xee
_P1MAT          DATA 0xed
_P1MDIN         DATA 0xf2
_P1MDOUT        DATA 0xa5
_P1SKIP         DATA 0xd5
_P2             DATA 0xa0
_P2MASK         DATA 0xfc
_P2MAT          DATA 0xfb
_P2MDIN         DATA 0xf3
_P2MDOUT        DATA 0xa6
_P2SKIP         DATA 0xcc
_P3             DATA 0xb0
_P3MDIN         DATA 0xf4
_P3MDOUT        DATA 0x9c
_PCA0CENT       DATA 0x9e
_PCA0CLR        DATA 0x9c
_PCA0CN0        DATA 0xd8
_PCA0CPH0       DATA 0xfc
_PCA0CPH1       DATA 0xea
_PCA0CPH2       DATA 0xec
_PCA0CPH3       DATA 0xf5
_PCA0CPH4       DATA 0x85
_PCA0CPH5       DATA 0xde
_PCA0CPL0       DATA 0xfb
_PCA0CPL1       DATA 0xe9
_PCA0CPL2       DATA 0xeb
_PCA0CPL3       DATA 0xf4
_PCA0CPL4       DATA 0x84
_PCA0CPL5       DATA 0xdd
_PCA0CPM0       DATA 0xda
_PCA0CPM1       DATA 0xdb
_PCA0CPM2       DATA 0xdc
_PCA0CPM3       DATA 0xae
_PCA0CPM4       DATA 0xaf
_PCA0CPM5       DATA 0xcc
_PCA0H          DATA 0xfa
_PCA0L          DATA 0xf9
_PCA0MD         DATA 0xd9
_PCA0POL        DATA 0x96
_PCA0PWM        DATA 0xf7
_PCON0          DATA 0x87
_PCON1          DATA 0xcd
_PFE0CN         DATA 0xc1
_PRTDRV         DATA 0xf6
_PSCTL          DATA 0x8f
_PSTAT0         DATA 0xaa
_PSW            DATA 0xd0
_REF0CN         DATA 0xd1
_REG0CN         DATA 0xc9
_REVID          DATA 0xb6
_RSTSRC         DATA 0xef
_SBCON1         DATA 0x94
_SBRLH1         DATA 0x96
_SBRLL1         DATA 0x95
_SBUF           DATA 0x99
_SBUF0          DATA 0x99
_SBUF1          DATA 0x92
_SCON           DATA 0x98
_SCON0          DATA 0x98
_SCON1          DATA 0xc8
_SFRPAGE        DATA 0xa7
_SFRPGCN        DATA 0xbc
_SFRSTACK       DATA 0xd7
_SMB0ADM        DATA 0xd6
_SMB0ADR        DATA 0xd7
_SMB0CF         DATA 0xc1
_SMB0CN0        DATA 0xc0
_SMB0DAT        DATA 0xc2
_SMB0FCN0       DATA 0xc3
_SMB0FCN1       DATA 0xc4
_SMB0FCT        DATA 0xef
_SMB0RXLN       DATA 0xc5
_SMB0TC         DATA 0xac
_SMOD1          DATA 0x93
_SP             DATA 0x81
_SPI0CFG        DATA 0xa1
_SPI0CKR        DATA 0xa2
_SPI0CN0        DATA 0xf8
_SPI0DAT        DATA 0xa3
_SPI0FCN0       DATA 0x9a
_SPI0FCN1       DATA 0x9b
_SPI0FCT        DATA 0xf7
_SPI0PCF        DATA 0xdf
_TCON           DATA 0x88
_TH0            DATA 0x8c
_TH1            DATA 0x8d
_TL0            DATA 0x8a
_TL1            DATA 0x8b
_TMOD           DATA 0x89
_TMR2CN0        DATA 0xc8
_TMR2CN1        DATA 0xfd
_TMR2H          DATA 0xcf
_TMR2L          DATA 0xce
_TMR2RLH        DATA 0xcb
_TMR2RLL        DATA 0xca
_TMR3CN0        DATA 0x91
_TMR3CN1        DATA 0xfe
_TMR3H          DATA 0x95
_TMR3L          DATA 0x94
_TMR3RLH        DATA 0x93
_TMR3RLL        DATA 0x92
_TMR4CN0        DATA 0x98
_TMR4CN1        DATA 0xff
_TMR4H          DATA 0xa5
_TMR4L          DATA 0xa4
_TMR4RLH        DATA 0xa3
_TMR4RLL        DATA 0xa2
_TMR5CN0        DATA 0xc0
_TMR5CN1        DATA 0xf1
_TMR5H          DATA 0xd5
_TMR5L          DATA 0xd4
_TMR5RLH        DATA 0xd3
_TMR5RLL        DATA 0xd2
_UART0PCF       DATA 0xd9
_UART1FCN0      DATA 0x9d
_UART1FCN1      DATA 0xd8
_UART1FCT       DATA 0xfa
_UART1LIN       DATA 0x9e
_UART1PCF       DATA 0xda
_VDM0CN         DATA 0xff
_WDTCN          DATA 0x97
_XBR0           DATA 0xe1
_XBR1           DATA 0xe2
_XBR2           DATA 0xe3
_XOSC0CN        DATA 0x86
_DPTR           DATA 0x8382
_TMR2RL         DATA 0xcbca
_TMR3RL         DATA 0x9392
_TMR4RL         DATA 0xa3a2
_TMR5RL         DATA 0xd3d2
_TMR0           DATA 0x8c8a
_TMR1           DATA 0x8d8b
_TMR2           DATA 0xcfce
_TMR3           DATA 0x9594
_TMR4           DATA 0xa5a4
_TMR5           DATA 0xd5d4
_SBRL1          DATA 0x9695
_PCA0           DATA 0xfaf9
_PCA0CP0        DATA 0xfcfb
_PCA0CP1        DATA 0xeae9
_PCA0CP2        DATA 0xeceb
_PCA0CP3        DATA 0xf5f4
_PCA0CP4        DATA 0x8584
_PCA0CP5        DATA 0xdedd
_ADC0ASA        DATA 0xb6b5
_ADC0GT         DATA 0xc4c3
_ADC0           DATA 0xbebd
_ADC0LT         DATA 0xc6c5
_DAC0           DATA 0x8584
_DAC1           DATA 0x8a89
_DAC2           DATA 0x8c8b
_DAC3           DATA 0x8e8d
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
_ACC_0          BIT 0xe0
_ACC_1          BIT 0xe1
_ACC_2          BIT 0xe2
_ACC_3          BIT 0xe3
_ACC_4          BIT 0xe4
_ACC_5          BIT 0xe5
_ACC_6          BIT 0xe6
_ACC_7          BIT 0xe7
_TEMPE          BIT 0xe8
_ADGN0          BIT 0xe9
_ADGN1          BIT 0xea
_ADWINT         BIT 0xeb
_ADBUSY         BIT 0xec
_ADINT          BIT 0xed
_IPOEN          BIT 0xee
_ADEN           BIT 0xef
_B_0            BIT 0xf0
_B_1            BIT 0xf1
_B_2            BIT 0xf2
_B_3            BIT 0xf3
_B_4            BIT 0xf4
_B_5            BIT 0xf5
_B_6            BIT 0xf6
_B_7            BIT 0xf7
_C0FIF          BIT 0xe8
_C0RIF          BIT 0xe9
_C1FIF          BIT 0xea
_C1RIF          BIT 0xeb
_C2FIF          BIT 0xec
_C2RIF          BIT 0xed
_C3FIF          BIT 0xee
_C3RIF          BIT 0xef
_D1SRC0         BIT 0x88
_D1SRC1         BIT 0x89
_D1AMEN         BIT 0x8a
_D01REFSL       BIT 0x8b
_D3SRC0         BIT 0x8c
_D3SRC1         BIT 0x8d
_D3AMEN         BIT 0x8e
_D23REFSL       BIT 0x8f
_D0UDIS         BIT 0x98
_D1UDIS         BIT 0x99
_D2UDIS         BIT 0x9a
_D3UDIS         BIT 0x9b
_EX0            BIT 0xa8
_ET0            BIT 0xa9
_EX1            BIT 0xaa
_ET1            BIT 0xab
_ES0            BIT 0xac
_ET2            BIT 0xad
_ESPI0          BIT 0xae
_EA             BIT 0xaf
_PX0            BIT 0xb8
_PT0            BIT 0xb9
_PX1            BIT 0xba
_PT1            BIT 0xbb
_PS0            BIT 0xbc
_PT2            BIT 0xbd
_PSPI0          BIT 0xbe
_P0_0           BIT 0x80
_P0_1           BIT 0x81
_P0_2           BIT 0x82
_P0_3           BIT 0x83
_P0_4           BIT 0x84
_P0_5           BIT 0x85
_P0_6           BIT 0x86
_P0_7           BIT 0x87
_P1_0           BIT 0x90
_P1_1           BIT 0x91
_P1_2           BIT 0x92
_P1_3           BIT 0x93
_P1_4           BIT 0x94
_P1_5           BIT 0x95
_P1_6           BIT 0x96
_P1_7           BIT 0x97
_P2_0           BIT 0xa0
_P2_1           BIT 0xa1
_P2_2           BIT 0xa2
_P2_3           BIT 0xa3
_P2_4           BIT 0xa4
_P2_5           BIT 0xa5
_P2_6           BIT 0xa6
_P3_0           BIT 0xb0
_P3_1           BIT 0xb1
_P3_2           BIT 0xb2
_P3_3           BIT 0xb3
_P3_4           BIT 0xb4
_P3_7           BIT 0xb7
_CCF0           BIT 0xd8
_CCF1           BIT 0xd9
_CCF2           BIT 0xda
_CCF3           BIT 0xdb
_CCF4           BIT 0xdc
_CCF5           BIT 0xdd
_CR             BIT 0xde
_CF             BIT 0xdf
_PARITY         BIT 0xd0
_F1             BIT 0xd1
_OV             BIT 0xd2
_RS0            BIT 0xd3
_RS1            BIT 0xd4
_F0             BIT 0xd5
_AC             BIT 0xd6
_CY             BIT 0xd7
_RI             BIT 0x98
_TI             BIT 0x99
_RB8            BIT 0x9a
_TB8            BIT 0x9b
_REN            BIT 0x9c
_CE             BIT 0x9d
_SMODE          BIT 0x9e
_RI1            BIT 0xc8
_TI1            BIT 0xc9
_RBX1           BIT 0xca
_TBX1           BIT 0xcb
_REN1           BIT 0xcc
_PERR1          BIT 0xcd
_OVR1           BIT 0xce
_SI             BIT 0xc0
_ACK            BIT 0xc1
_ARBLOST        BIT 0xc2
_ACKRQ          BIT 0xc3
_STO            BIT 0xc4
_STA            BIT 0xc5
_TXMODE         BIT 0xc6
_MASTER         BIT 0xc7
_SPIEN          BIT 0xf8
_TXNF           BIT 0xf9
_NSSMD0         BIT 0xfa
_NSSMD1         BIT 0xfb
_RXOVRN         BIT 0xfc
_MODF           BIT 0xfd
_WCOL           BIT 0xfe
_SPIF           BIT 0xff
_IT0            BIT 0x88
_IE0            BIT 0x89
_IT1            BIT 0x8a
_IE1            BIT 0x8b
_TR0            BIT 0x8c
_TF0            BIT 0x8d
_TR1            BIT 0x8e
_TF1            BIT 0x8f
_T2XCLK0        BIT 0xc8
_T2XCLK1        BIT 0xc9
_TR2            BIT 0xca
_T2SPLIT        BIT 0xcb
_TF2CEN         BIT 0xcc
_TF2LEN         BIT 0xcd
_TF2L           BIT 0xce
_TF2H           BIT 0xcf
_T4XCLK0        BIT 0x98
_T4XCLK1        BIT 0x99
_TR4            BIT 0x9a
_T4SPLIT        BIT 0x9b
_TF4CEN         BIT 0x9c
_TF4LEN         BIT 0x9d
_TF4L           BIT 0x9e
_TF4H           BIT 0x9f
_T5XCLK0        BIT 0xc0
_T5XCLK1        BIT 0xc1
_TR5            BIT 0xc2
_T5SPLIT        BIT 0xc3
_TF5CEN         BIT 0xc4
_TF5LEN         BIT 0xc5
_TF5L           BIT 0xc6
_TF5H           BIT 0xc7
_RIE            BIT 0xd8
_RXTO0          BIT 0xd9
_RXTO1          BIT 0xda
_RFRQ           BIT 0xdb
_TIE            BIT 0xdc
_TXHOLD         BIT 0xdd
_TXNF1          BIT 0xde
_TFRQ           BIT 0xdf
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	rbank0 segment data overlay
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	rseg R_DSEG
_overflow_count:
	ds 1
_LCDprint_PARM_2:
	ds 1
_getsn_PARM_2:
	ds 2
_getsn_buff_1_70:
	ds 3
_getsn_sloc0_1_0:
	ds 2
_writeOutputBuffer_PARM_2:
	ds 4
_main_v_1_86:
	ds 16
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
	rseg	R_OSEG
_InitPinADC_PARM_2:
	ds 1
	rseg	R_OSEG
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	rseg R_ISEG
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	DSEG
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	rseg R_BSEG
_LCDprint_PARM_3:
	DBIT	1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	rseg R_PSEG
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	rseg R_XSEG
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	XSEG
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	rseg R_IXSEG
	rseg R_HOME
	rseg R_GSINIT
	rseg R_CSEG
;--------------------------------------------------------
; Reset entry point and interrupt vectors
;--------------------------------------------------------
	CSEG at 0x0000
	ljmp	_crt0
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	rseg R_HOME
	rseg R_GSINIT
	rseg R_GSINIT
;--------------------------------------------------------
; data variables initialization
;--------------------------------------------------------
	rseg R_DINIT
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:30: char _c51_external_startup (void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
	using	0
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:33: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:34: WDTCN = 0xDE; //First key
	mov	_WDTCN,#0xDE
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:35: WDTCN = 0xAD; //Second key
	mov	_WDTCN,#0xAD
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:37: VDM0CN=0x80;       // enable VDD monitor
	mov	_VDM0CN,#0x80
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:38: RSTSRC=0x02|0x04;  // Enable reset on missing clock detector and VDD
	mov	_RSTSRC,#0x06
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:45: SFRPAGE = 0x10;
	mov	_SFRPAGE,#0x10
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:46: PFE0CN  = 0x20; // SYSCLK < 75 MHz.
	mov	_PFE0CN,#0x20
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:47: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:68: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:69: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:70: while ((CLKSEL & 0x80) == 0);
L002001?:
	mov	a,_CLKSEL
	jnb	acc.7,L002001?
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:71: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:72: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:73: while ((CLKSEL & 0x80) == 0);
L002004?:
	mov	a,_CLKSEL
	jnb	acc.7,L002004?
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:78: P0MDOUT |= 0x10; // Enable UART0 TX as push-pull output
	orl	_P0MDOUT,#0x10
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:79: XBR0     = 0x01; // Enable UART0 on P0.4(TX) and P0.5(RX)                     
	mov	_XBR0,#0x01
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:80: XBR1     = 0X00;
	mov	_XBR1,#0x00
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:81: XBR2     = 0x40; // Enable crossbar and weak pull-ups
	mov	_XBR2,#0x40
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:87: SCON0 = 0x10;
	mov	_SCON0,#0x10
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:88: TH1 = 0x100-((SYSCLK/BAUDRATE)/(2L*12L));
	mov	_TH1,#0xE6
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:89: TL1 = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:90: TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit auto-reload
	anl	_TMOD,#0x0F
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:91: TMOD |=  0x20;                       
	orl	_TMOD,#0x20
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:92: TR1 = 1; // START Timer1
	setb	_TR1
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:93: TI = 1;  // Indicate TX0 ready
	setb	_TI
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:95: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'InitADC'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:98: void InitADC (void)
;	-----------------------------------------
;	 function InitADC
;	-----------------------------------------
_InitADC:
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:100: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:101: ADEN=0; // Disable ADC
	clr	_ADEN
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:106: (0x0 << 0) ; // Accumulate n conversions: 0x0: 1, 0x1:4, 0x2:8, 0x3:16, 0x4:32
	mov	_ADC0CN1,#0x80
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:110: (0x0 << 2); // 0:SYSCLK ADCCLK = SYSCLK. 1:HFOSC0 ADCCLK = HFOSC0.
	mov	_ADC0CF0,#0x20
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:114: (0x1E << 0); // Conversion Tracking Time. Tadtk = ADTK / (Fsarclk)
	mov	_ADC0CF1,#0x1E
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:123: (0x0 << 0) ; // TEMPE. 0: Disable the Temperature Sensor. 1: Enable the Temperature Sensor.
	mov	_ADC0CN0,#0x00
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:128: (0x1F << 0); // ADPWR. Power Up Delay Time. Tpwrtime = ((4 * (ADPWR + 1)) + 2) / (Fadcclk)
	mov	_ADC0CF2,#0x3F
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:132: (0x0 << 0) ; // ADCM. 0x0: ADBUSY, 0x1: TIMER0, 0x2: TIMER2, 0x3: TIMER3, 0x4: CNVSTR, 0x5: CEX5, 0x6: TIMER4, 0x7: TIMER5, 0x8: CLU0, 0x9: CLU1, 0xA: CLU2, 0xB: CLU3
	mov	_ADC0CN2,#0x00
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:134: ADEN=1; // Enable ADC
	setb	_ADEN
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer3us'
;------------------------------------------------------------
;us                        Allocated to registers r2 
;i                         Allocated to registers r3 
;------------------------------------------------------------
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:138: void Timer3us(unsigned char us)
;	-----------------------------------------
;	 function Timer3us
;	-----------------------------------------
_Timer3us:
	mov	r2,dpl
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:143: CKCON0|=0b_0100_0000;
	orl	_CKCON0,#0x40
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:145: TMR3RL = (-(SYSCLK)/1000000L); // Set Timer3 to overflow in 1us.
	mov	_TMR3RL,#0xB8
	mov	(_TMR3RL >> 8),#0xFF
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:146: TMR3 = TMR3RL;                 // Initialize Timer3 for first overflow
	mov	_TMR3,_TMR3RL
	mov	(_TMR3 >> 8),(_TMR3RL >> 8)
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:148: TMR3CN0 = 0x04;                 // Sart Timer3 and clear overflow flag
	mov	_TMR3CN0,#0x04
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:149: for (i = 0; i < us; i++)       // Count <us> overflows
	mov	r3,#0x00
L004004?:
	clr	c
	mov	a,r3
	subb	a,r2
	jnc	L004007?
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:151: while (!(TMR3CN0 & 0x80));  // Wait for overflow
L004001?:
	mov	a,_TMR3CN0
	jnb	acc.7,L004001?
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:152: TMR3CN0 &= ~(0x80);         // Clear overflow indicator
	anl	_TMR3CN0,#0x7F
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:149: for (i = 0; i < us; i++)       // Count <us> overflows
	inc	r3
	sjmp	L004004?
L004007?:
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:154: TMR3CN0 = 0 ;                   // Stop Timer3 and clear overflow flag
	mov	_TMR3CN0,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'waitms'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;j                         Allocated to registers r4 r5 
;k                         Allocated to registers r6 
;------------------------------------------------------------
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:157: void waitms (unsigned int ms)
;	-----------------------------------------
;	 function waitms
;	-----------------------------------------
_waitms:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:161: for(j=0; j<ms; j++)
	mov	r4,#0x00
	mov	r5,#0x00
L005005?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	L005009?
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:162: for (k=0; k<4; k++) Timer3us(250);
	mov	r6,#0x00
L005001?:
	cjne	r6,#0x04,L005018?
L005018?:
	jnc	L005007?
	mov	dpl,#0xFA
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_Timer3us
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	inc	r6
	sjmp	L005001?
L005007?:
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:161: for(j=0; j<ms; j++)
	inc	r4
	cjne	r4,#0x00,L005005?
	inc	r5
	sjmp	L005005?
L005009?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'InitPinADC'
;------------------------------------------------------------
;pinno                     Allocated with name '_InitPinADC_PARM_2'
;portno                    Allocated to registers r2 
;mask                      Allocated to registers r3 
;------------------------------------------------------------
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:167: void InitPinADC (unsigned char portno, unsigned char pinno)
;	-----------------------------------------
;	 function InitPinADC
;	-----------------------------------------
_InitPinADC:
	mov	r2,dpl
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:171: mask=1<<pinno;
	mov	b,_InitPinADC_PARM_2
	inc	b
	mov	a,#0x01
	sjmp	L006013?
L006011?:
	add	a,acc
L006013?:
	djnz	b,L006011?
	mov	r3,a
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:173: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:174: switch (portno)
	cjne	r2,#0x00,L006014?
	sjmp	L006001?
L006014?:
	cjne	r2,#0x01,L006015?
	sjmp	L006002?
L006015?:
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:176: case 0:
	cjne	r2,#0x02,L006005?
	sjmp	L006003?
L006001?:
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:177: P0MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P0MDIN,a
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:178: P0SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P0SKIP,a
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:179: break;
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:180: case 1:
	sjmp	L006005?
L006002?:
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:181: P1MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P1MDIN,a
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:182: P1SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P1SKIP,a
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:183: break;
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:184: case 2:
	sjmp	L006005?
L006003?:
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:185: P2MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P2MDIN,a
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:186: P2SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P2SKIP,a
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:190: }
L006005?:
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:191: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ADC_at_Pin'
;------------------------------------------------------------
;pin                       Allocated to registers 
;------------------------------------------------------------
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:194: unsigned int ADC_at_Pin(unsigned char pin)
;	-----------------------------------------
;	 function ADC_at_Pin
;	-----------------------------------------
_ADC_at_Pin:
	mov	_ADC0MX,dpl
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:197: ADINT = 0;
	clr	_ADINT
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:198: ADBUSY = 1;     // Convert voltage at the pin
	setb	_ADBUSY
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:199: while (!ADINT); // Wait for conversion to complete
L007001?:
	jnb	_ADINT,L007001?
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:200: return (ADC0);
	mov	dpl,_ADC0
	mov	dph,(_ADC0 >> 8)
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Volts_at_Pin'
;------------------------------------------------------------
;pin                       Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:203: float Volts_at_Pin(unsigned char pin)
;	-----------------------------------------
;	 function Volts_at_Pin
;	-----------------------------------------
_Volts_at_Pin:
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:205: return ((ADC_at_Pin(pin)*VDD)/0b_0011_1111_1111_1111);
	lcall	_ADC_at_Pin
	lcall	___uint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x6C8B
	mov	b,#0x53
	mov	a,#0x40
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	mov	a,#0xFC
	push	acc
	mov	a,#0x7F
	push	acc
	mov	a,#0x46
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_pulse'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:208: void LCD_pulse (void)
;	-----------------------------------------
;	 function LCD_pulse
;	-----------------------------------------
_LCD_pulse:
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:210: LCD_E=1;
	setb	_P2_5
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:211: Timer3us(40);
	mov	dpl,#0x28
	lcall	_Timer3us
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:212: LCD_E=0;
	clr	_P2_5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_byte'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:215: void LCD_byte (unsigned char x)
;	-----------------------------------------
;	 function LCD_byte
;	-----------------------------------------
_LCD_byte:
	mov	r2,dpl
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:218: ACC=x; //Send high nible
	mov	_ACC,r2
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:219: LCD_D7=ACC_7;
	mov	c,_ACC_7
	mov	_P2_1,c
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:220: LCD_D6=ACC_6;
	mov	c,_ACC_6
	mov	_P2_2,c
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:221: LCD_D5=ACC_5;
	mov	c,_ACC_5
	mov	_P2_3,c
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:222: LCD_D4=ACC_4;
	mov	c,_ACC_4
	mov	_P2_4,c
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:223: LCD_pulse();
	push	ar2
	lcall	_LCD_pulse
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:224: Timer3us(40);
	mov	dpl,#0x28
	lcall	_Timer3us
	pop	ar2
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:225: ACC=x; //Send low nible
	mov	_ACC,r2
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:226: LCD_D7=ACC_3;
	mov	c,_ACC_3
	mov	_P2_1,c
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:227: LCD_D6=ACC_2;
	mov	c,_ACC_2
	mov	_P2_2,c
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:228: LCD_D5=ACC_1;
	mov	c,_ACC_1
	mov	_P2_3,c
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:229: LCD_D4=ACC_0;
	mov	c,_ACC_0
	mov	_P2_4,c
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:230: LCD_pulse();
	ljmp	_LCD_pulse
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteData'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:233: void WriteData (unsigned char x)
;	-----------------------------------------
;	 function WriteData
;	-----------------------------------------
_WriteData:
	mov	r2,dpl
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:235: LCD_RS=1;
	setb	_P2_6
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:236: LCD_byte(x);
	mov	dpl,r2
	lcall	_LCD_byte
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:237: waitms(2);
	mov	dptr,#0x0002
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteCommand'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:240: void WriteCommand (unsigned char x)
;	-----------------------------------------
;	 function WriteCommand
;	-----------------------------------------
_WriteCommand:
	mov	r2,dpl
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:242: LCD_RS=0;
	clr	_P2_6
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:243: LCD_byte(x);
	mov	dpl,r2
	lcall	_LCD_byte
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:244: waitms(5);
	mov	dptr,#0x0005
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_4BIT'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:247: void LCD_4BIT (void)
;	-----------------------------------------
;	 function LCD_4BIT
;	-----------------------------------------
_LCD_4BIT:
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:249: LCD_E=0; // Resting state of LCD's enable is zero
	clr	_P2_5
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:251: waitms(20);
	mov	dptr,#0x0014
	lcall	_waitms
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:253: WriteCommand(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:254: WriteCommand(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:255: WriteCommand(0x32); // Change to 4-bit mode
	mov	dpl,#0x32
	lcall	_WriteCommand
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:258: WriteCommand(0x28);
	mov	dpl,#0x28
	lcall	_WriteCommand
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:259: WriteCommand(0x0c);
	mov	dpl,#0x0C
	lcall	_WriteCommand
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:260: WriteCommand(0x01); // Clear screen command (takes some time)
	mov	dpl,#0x01
	lcall	_WriteCommand
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:261: waitms(20); // Wait for clear screen command to finsih.
	mov	dptr,#0x0014
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'LCDprint'
;------------------------------------------------------------
;line                      Allocated with name '_LCDprint_PARM_2'
;string                    Allocated to registers r2 r3 r4 
;j                         Allocated to registers r5 r6 
;------------------------------------------------------------
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:264: void LCDprint(char * string, unsigned char line, bit clear)
;	-----------------------------------------
;	 function LCDprint
;	-----------------------------------------
_LCDprint:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:268: WriteCommand(line==2?0xc0:0x80);
	mov	a,#0x02
	cjne	a,_LCDprint_PARM_2,L014013?
	mov	r5,#0xC0
	sjmp	L014014?
L014013?:
	mov	r5,#0x80
L014014?:
	mov	dpl,r5
	push	ar2
	push	ar3
	push	ar4
	lcall	_WriteCommand
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:269: waitms(5);
	mov	dptr,#0x0005
	lcall	_waitms
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:270: for(j=0; string[j]!=0; j++)	WriteData(string[j]);// Write the message
	mov	r5,#0x00
	mov	r6,#0x00
L014003?:
	mov	a,r5
	add	a,r2
	mov	r7,a
	mov	a,r6
	addc	a,r3
	mov	r0,a
	mov	ar1,r4
	mov	dpl,r7
	mov	dph,r0
	mov	b,r1
	lcall	__gptrget
	mov	r7,a
	jz	L014006?
	mov	dpl,r7
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_WriteData
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	inc	r5
	cjne	r5,#0x00,L014003?
	inc	r6
	sjmp	L014003?
L014006?:
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:271: if(clear) for(; j<CHARS_PER_LINE; j++) WriteData(' '); // Clear the rest of the line
	jnb	_LCDprint_PARM_3,L014011?
	mov	ar2,r5
	mov	ar3,r6
L014007?:
	clr	c
	mov	a,r2
	subb	a,#0x10
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L014011?
	mov	dpl,#0x20
	push	ar2
	push	ar3
	lcall	_WriteData
	pop	ar3
	pop	ar2
	inc	r2
	cjne	r2,#0x00,L014007?
	inc	r3
	sjmp	L014007?
L014011?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getsn'
;------------------------------------------------------------
;len                       Allocated with name '_getsn_PARM_2'
;buff                      Allocated with name '_getsn_buff_1_70'
;j                         Allocated with name '_getsn_sloc0_1_0'
;c                         Allocated to registers r3 
;sloc0                     Allocated with name '_getsn_sloc0_1_0'
;------------------------------------------------------------
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:274: int getsn (char * buff, int len)
;	-----------------------------------------
;	 function getsn
;	-----------------------------------------
_getsn:
	mov	_getsn_buff_1_70,dpl
	mov	(_getsn_buff_1_70 + 1),dph
	mov	(_getsn_buff_1_70 + 2),b
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:279: for(j=0; j<(len-1); j++)
	clr	a
	mov	_getsn_sloc0_1_0,a
	mov	(_getsn_sloc0_1_0 + 1),a
	mov	a,_getsn_PARM_2
	add	a,#0xff
	mov	r7,a
	mov	a,(_getsn_PARM_2 + 1)
	addc	a,#0xff
	mov	r0,a
	mov	r1,#0x00
	mov	r2,#0x00
L015005?:
	clr	c
	mov	a,r1
	subb	a,r7
	mov	a,r2
	xrl	a,#0x80
	mov	b,r0
	xrl	b,#0x80
	subb	a,b
	jnc	L015008?
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:281: c=getchar();
	push	ar2
	push	ar7
	push	ar0
	push	ar1
	lcall	_getchar
	mov	r3,dpl
	pop	ar1
	pop	ar0
	pop	ar7
	pop	ar2
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:282: if ( (c=='\n') || (c=='\r') )
	cjne	r3,#0x0A,L015015?
	sjmp	L015001?
L015015?:
	cjne	r3,#0x0D,L015002?
L015001?:
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:284: buff[j]=0;
	mov	a,_getsn_sloc0_1_0
	add	a,_getsn_buff_1_70
	mov	r4,a
	mov	a,(_getsn_sloc0_1_0 + 1)
	addc	a,(_getsn_buff_1_70 + 1)
	mov	r5,a
	mov	r6,(_getsn_buff_1_70 + 2)
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	clr	a
	lcall	__gptrput
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:285: return j;
	mov	dpl,_getsn_sloc0_1_0
	mov	dph,(_getsn_sloc0_1_0 + 1)
	ret
L015002?:
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:289: buff[j]=c;
	mov	a,r1
	add	a,_getsn_buff_1_70
	mov	r4,a
	mov	a,r2
	addc	a,(_getsn_buff_1_70 + 1)
	mov	r5,a
	mov	r6,(_getsn_buff_1_70 + 2)
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r3
	lcall	__gptrput
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:279: for(j=0; j<(len-1); j++)
	inc	r1
	cjne	r1,#0x00,L015018?
	inc	r2
L015018?:
	mov	_getsn_sloc0_1_0,r1
	mov	(_getsn_sloc0_1_0 + 1),r2
	sjmp	L015005?
L015008?:
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:292: buff[j]=0;
	mov	a,_getsn_sloc0_1_0
	add	a,_getsn_buff_1_70
	mov	r2,a
	mov	a,(_getsn_sloc0_1_0 + 1)
	addc	a,(_getsn_buff_1_70 + 1)
	mov	r3,a
	mov	r4,(_getsn_buff_1_70 + 2)
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	clr	a
	lcall	__gptrput
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:293: return len;
	mov	dpl,_getsn_PARM_2
	mov	dph,(_getsn_PARM_2 + 1)
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'TIMER0_Init'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:296: void TIMER0_Init(void)
;	-----------------------------------------
;	 function TIMER0_Init
;	-----------------------------------------
_TIMER0_Init:
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:298: TMOD&=0b_1111_0000; // Set the bits of Timer/Counter 0 to zero
	anl	_TMOD,#0xF0
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:299: TMOD|=0b_0000_0001; // Timer/Counter 0 used as a 16-bit timer
	orl	_TMOD,#0x01
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:300: TR0=0; // Stop Timer/Counter 0
	clr	_TR0
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'PtoC'
;------------------------------------------------------------
;period                    Allocated to registers r2 r3 r4 r5 
;------------------------------------------------------------
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:303: double PtoC(double period){
;	-----------------------------------------
;	 function PtoC
;	-----------------------------------------
_PtoC:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:304: return ((period*1000000000.0)/(3465.7359028));
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x6B28
	mov	b,#0x6E
	mov	a,#0x4E
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,#0xC6
	push	acc
	mov	a,#0x9B
	push	acc
	mov	a,#0x58
	push	acc
	mov	a,#0x45
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'writeOutputBuffer'
;------------------------------------------------------------
;cap                       Allocated with name '_writeOutputBuffer_PARM_2'
;buffer                    Allocated to registers r2 r3 r4 
;suffix                    Allocated to registers r5 
;------------------------------------------------------------
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:307: void writeOutputBuffer(char *buffer, double cap){
;	-----------------------------------------
;	 function writeOutputBuffer
;	-----------------------------------------
_writeOutputBuffer:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:308: char suffix = 'n';
	mov	r5,#0x6E
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:309: if(cap < 1.5)
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	clr	a
	push	acc
	push	acc
	mov	a,#0xC0
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_writeOutputBuffer_PARM_2
	mov	dph,(_writeOutputBuffer_PARM_2 + 1)
	mov	b,(_writeOutputBuffer_PARM_2 + 2)
	mov	a,(_writeOutputBuffer_PARM_2 + 3)
	lcall	___fslt
	mov	r6,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	mov	a,r6
	jz	L018002?
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:311: sprintf(buffer, "Insert Capacitor");
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	push	ar2
	push	ar3
	push	ar4
	lcall	_sprintf
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:312: return;
	ret
L018002?:
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:314: if(cap > 100.0)
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	clr	a
	push	acc
	push	acc
	mov	a,#0xC8
	push	acc
	mov	a,#0x42
	push	acc
	mov	dpl,_writeOutputBuffer_PARM_2
	mov	dph,(_writeOutputBuffer_PARM_2 + 1)
	mov	b,(_writeOutputBuffer_PARM_2 + 2)
	mov	a,(_writeOutputBuffer_PARM_2 + 3)
	lcall	___fsgt
	mov	r6,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	mov	a,r6
	jz	L018004?
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:316: suffix = 'u';
	mov	r5,#0x75
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:317: cap = cap/1000.0;
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	clr	a
	push	acc
	push	acc
	mov	a,#0x7A
	push	acc
	mov	a,#0x44
	push	acc
	mov	dpl,_writeOutputBuffer_PARM_2
	mov	dph,(_writeOutputBuffer_PARM_2 + 1)
	mov	b,(_writeOutputBuffer_PARM_2 + 2)
	mov	a,(_writeOutputBuffer_PARM_2 + 3)
	lcall	___fsdiv
	mov	_writeOutputBuffer_PARM_2,dpl
	mov	(_writeOutputBuffer_PARM_2 + 1),dph
	mov	(_writeOutputBuffer_PARM_2 + 2),b
	mov	(_writeOutputBuffer_PARM_2 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
L018004?:
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:319: if(cap > 100.0)
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	clr	a
	push	acc
	push	acc
	mov	a,#0xC8
	push	acc
	mov	a,#0x42
	push	acc
	mov	dpl,_writeOutputBuffer_PARM_2
	mov	dph,(_writeOutputBuffer_PARM_2 + 1)
	mov	b,(_writeOutputBuffer_PARM_2 + 2)
	mov	a,(_writeOutputBuffer_PARM_2 + 3)
	lcall	___fsgt
	mov	r6,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	mov	a,r6
	jz	L018006?
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:321: suffix = 'm';
	mov	r5,#0x6D
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:322: cap = cap/1000.0;
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	clr	a
	push	acc
	push	acc
	mov	a,#0x7A
	push	acc
	mov	a,#0x44
	push	acc
	mov	dpl,_writeOutputBuffer_PARM_2
	mov	dph,(_writeOutputBuffer_PARM_2 + 1)
	mov	b,(_writeOutputBuffer_PARM_2 + 2)
	mov	a,(_writeOutputBuffer_PARM_2 + 3)
	lcall	___fsdiv
	mov	_writeOutputBuffer_PARM_2,dpl
	mov	(_writeOutputBuffer_PARM_2 + 1),dph
	mov	(_writeOutputBuffer_PARM_2 + 2),b
	mov	(_writeOutputBuffer_PARM_2 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
L018006?:
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:324: if(cap > 100.0)
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	clr	a
	push	acc
	push	acc
	mov	a,#0xC8
	push	acc
	mov	a,#0x42
	push	acc
	mov	dpl,_writeOutputBuffer_PARM_2
	mov	dph,(_writeOutputBuffer_PARM_2 + 1)
	mov	b,(_writeOutputBuffer_PARM_2 + 2)
	mov	a,(_writeOutputBuffer_PARM_2 + 3)
	lcall	___fsgt
	mov	r6,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	mov	a,r6
	jz	L018008?
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:326: suffix = ' ';
	mov	r5,#0x20
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:327: cap = cap/1000.0;
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	clr	a
	push	acc
	push	acc
	mov	a,#0x7A
	push	acc
	mov	a,#0x44
	push	acc
	mov	dpl,_writeOutputBuffer_PARM_2
	mov	dph,(_writeOutputBuffer_PARM_2 + 1)
	mov	b,(_writeOutputBuffer_PARM_2 + 2)
	mov	a,(_writeOutputBuffer_PARM_2 + 3)
	lcall	___fsdiv
	mov	_writeOutputBuffer_PARM_2,dpl
	mov	(_writeOutputBuffer_PARM_2 + 1),dph
	mov	(_writeOutputBuffer_PARM_2 + 2),b
	mov	(_writeOutputBuffer_PARM_2 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
L018008?:
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:329: sprintf(buffer, "C = %.4f%cF", cap, suffix);
	mov	a,r5
	rlc	a
	subb	a,acc
	mov	r6,a
	push	ar5
	push	ar6
	push	_writeOutputBuffer_PARM_2
	push	(_writeOutputBuffer_PARM_2 + 1)
	push	(_writeOutputBuffer_PARM_2 + 2)
	push	(_writeOutputBuffer_PARM_2 + 3)
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	push	ar2
	push	ar3
	push	ar4
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf4
	mov	sp,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;v                         Allocated with name '_main_v_1_86'
;S1VMax                    Allocated to registers 
;S2VMax                    Allocated to registers 
;period                    Allocated with name '_main_period_1_86'
;time                      Allocated to registers 
;------------------------------------------------------------
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:332: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:340: waitms(500); // Give PuTTy a chance to start before sending
	mov	dptr,#0x01F4
	lcall	_waitms
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:341: printf("\x1b[2J"); // Clear screen using ANSI escape sequence.
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:346: __FILE__, __DATE__, __TIME__);
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:345: "Compiled: %s, %s\n\n",
	mov	a,#__str_6
	push	acc
	mov	a,#(__str_6 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#__str_5
	push	acc
	mov	a,#(__str_5 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#__str_4
	push	acc
	mov	a,#(__str_4 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#__str_3
	push	acc
	mov	a,#(__str_3 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf4
	mov	sp,a
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:349: InitADC();
	lcall	_InitADC
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:351: while(1)
L019002?:
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:354: printf("%lf\n", getHalfPeriod());
	lcall	_getHalfPeriod
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	a,#__str_7
	push	acc
	mov	a,#(__str_7 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
	sjmp	L019002?
;------------------------------------------------------------
;Allocation info for local variables in function 'getHalfPeriod'
;------------------------------------------------------------
;halfPeriod                Allocated to registers r2 r3 r4 r5 
;overflow_count            Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:358: float getHalfPeriod() {
;	-----------------------------------------
;	 function getHalfPeriod
;	-----------------------------------------
_getHalfPeriod:
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:363: TR0 = 0;
	clr	_TR0
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:364: TMOD &= 0xF0;
	anl	_TMOD,#0xF0
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:365: TMOD |= 0x01;
	orl	_TMOD,#0x01
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:366: TH0 = 0;
	mov	_TH0,#0x00
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:367: TL0 = 0;
	mov	_TL0,#0x00
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:368: TF0 = 0;
	clr	_TF0
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:371: while (P0_1);
L020001?:
	jb	_P0_1,L020001?
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:372: while (!P0_1);
L020004?:
	jnb	_P0_1,L020004?
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:375: TR0 = 1;
	setb	_TR0
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:376: while (P0_1) {
	mov	r2,#0x00
	mov	r3,#0x00
L020009?:
	jnb	_P0_1,L020011?
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:377: if (TF0) {
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:378: TF0 = 0;
	jbc	_TF0,L020024?
	sjmp	L020009?
L020024?:
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:379: overflow_count++;
	inc	r2
	cjne	r2,#0x00,L020009?
	inc	r3
	sjmp	L020009?
L020011?:
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:384: TR0 = 0;
	clr	_TR0
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:385: halfPeriod = (overflow_count*65536.0+TH0*256.0+TL0)*(12.0/SYSCLK)*1000000L;
	mov	dpl,r2
	mov	dph,r3
	lcall	___uint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x47
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,_TH0
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	___uchar2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x43
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	r6,_TL0
	mov	r7,#0x00
	mov	dpl,r6
	mov	dph,r7
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	___sint2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0xAAAB
	mov	b,#0x2A
	mov	a,#0x3E
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\EFM8_ADC.c:386: return halfPeriod;
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	ret
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 'Insert Capacitor'
	db 0x00
__str_1:
	db 'C = %.4f%cF'
	db 0x00
__str_2:
	db 0x1B
	db '[2J'
	db 0x00
__str_3:
	db 'ADC test program'
	db 0x0A
	db 'File: %s'
	db 0x0A
	db 'Compiled: %s, %s'
	db 0x0A
	db 0x0A
	db 0x00
__str_4:
	db 'C:'
	db 0x5C
	db 'Users'
	db 0x5C
	db 'kcgro'
	db 0x5C
	db 'Documents'
	db 0x5C
	db 'GitHub'
	db 0x5C
	db 'ELEC291'
	db 0x5C
	db 'LAB5-Phasor Analysis'
	db 0x5C
	db 'EFM8_ADC.c'
	db 0x00
__str_5:
	db 'Mar  7 2023'
	db 0x00
__str_6:
	db '22:08:23'
	db 0x00
__str_7:
	db '%lf'
	db 0x0A
	db 0x00

	CSEG

end
