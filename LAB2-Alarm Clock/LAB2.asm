; ISR_example.asm: a) Increments/decrements a BCD variable every half second using
; an ISR for timer 2; b) Generates a 2kHz square wave at pin P1.1 using
; an ISR for timer 0; and c) in the 'main' loop it displays the variable
; incremented/decremented using the ISR for timer 2 on the LCD.  Also resets it to 
; zero if the 'BOOT' pushbutton connected to P4.5 is pressed.
$NOLIST
$MODLP51RC2
$LIST

CLK           EQU 22118400 ; Microcontroller system crystal frequency in Hz
TIMER0_RATE   EQU 4096     ; 2048Hz squarewave (peak amplitude of CEM-1203 speaker)
TIMER0_RELOAD EQU ((65536-(CLK/TIMER0_RATE)))
TIMER2_RATE   EQU 1000     ; 1000Hz, for a timer tick of 1ms
TIMER2_RELOAD EQU ((65536-(CLK/TIMER2_RATE)))

Time_Speed EQU 1000

BOOT_BUTTON   equ P4.5
Button1 equ P2.1
Button2 equ P2.3
Button3 equ P2.6
Button4 equ P2.7

SOUND_OUT     equ P1.1
UPDOWN        equ P0.0

; Reset vector
org 0x0000
    ljmp main

; External interrupt 0 vector (not used in this code)
org 0x0003
	reti

; Timer/Counter 0 overflow interrupt vector
org 0x000B
	ljmp Timer0_ISR

; External interrupt 1 vector (not used in this code)
org 0x0013
	reti

; Timer/Counter 1 overflow interrupt vector (not used in this code)
org 0x001B
	reti

; Serial port receive/transmit interrupt vector (not used in this code)
org 0x0023 
	reti
	
; Timer/Counter 2 overflow interrupt vector
org 0x002B
	ljmp Timer2_ISR

; In the 8051 we can define direct access variables starting at location 0x30 up to location 0x7F
dseg at 0x30


BCD_counter:  ds 1 ; The BCD counter incrememted in the ISR and displayed in the main loop
Count1ms:     ds 2 ; Used to determine when half second has passed

mode: ds 1 ;display time mode=0, set time mode=1 or set alarm mode=2.

Selected: ds 1 ;0 = hr, 1 = min, 2 = Am/Pm, 3 = Done

Seconds: ds 1 ;Seconds
Minutes: ds 1 ;Minutes
Hours: ds 1 ;Hours
AMPM: ds 1 ;Am/Pm
Day: ds 1

AlarmMin: ds 1 ;alarm min time
AlarmHr: ds 1 ; alarm hour time
AlarmAP: ds 1 ; alarm Am/Pm time


; In the 8051 we have variables that are 1-bit in size.  We can use the setb, clr, jb, and jnb
; instructions with these variables.  This is how you define a 1-bit variable:
bseg
seconds_flag: dbit 1 ; Set to one in the ISR every time 500 ms had passed


cseg
; These 'equ' must match the hardware wiring
LCD_RS equ P3.2
;LCD_RW equ PX.X ; Not used in this code, connect the pin to GND
LCD_E  equ P3.3
LCD_D4 equ P3.4
LCD_D5 equ P3.5
LCD_D6 equ P3.6
LCD_D7 equ P3.7

$NOLIST
$include(LCD_4bit.inc) ; A library of LCD related functions and utility macros
$LIST

;1234567890123456    <- This helps determine the location of the counter

Initial_Message:  db '     :  :       ', 0
AM: db 'AM', 0
PM: db 'PM', 0



Monday: db 'Mon', 0
Tuesday: db 'Tue', 0
Wednesday: db 'Wed', 0
Thursday: db 'Thu', 0
Friday: db 'Tue', 0
Saturday: db 'Sat', 0
Sunday: db 'Sun', 0

TimeMsgTop: db '     :  :  Time', 0
AlarmMsgTop: db '     :  :  Alarm', 0
MsgBtm: db '  +H +M AP Set  ', 0

CLS: db '                ', 0

;---------------------------------;
; Routine to initialize the ISR   ;
; for timer 0                     ;
;---------------------------------;
Timer0_Init:
	mov a, TMOD
	anl a, #0xf0 ; 11110000 Clear the bits for timer 0
	orl a, #0x01 ; 00000001 Configure timer 0 as 16-timer
	mov TMOD, a
	mov TH0, #high(TIMER0_RELOAD)
	mov TL0, #low(TIMER0_RELOAD)
	; Set autoreload value
	mov RH0, #high(TIMER0_RELOAD)
	mov RL0, #low(TIMER0_RELOAD)
	; Enable the timer and interrupts
    setb ET0  ; Enable timer 0 interrupt
    setb TR0  ; Start timer 0
	ret

;---------------------------------;
; ISR for timer 0.  Set to execute;
; every 1/4096Hz to generate a    ;
; 2048 Hz square wave at pin P1.1 ;
;---------------------------------;
Timer0_ISR:
	;clr TF0  ; According to the data sheet this is done for us already.
	cpl SOUND_OUT ; Connect speaker to P1.1!
	reti

;---------------------------------;
; Routine to initialize the ISR   ;
; for timer 2                     ;
;---------------------------------;
Timer2_Init:
	mov T2CON, #0 ; Stop timer/counter.  Autoreload mode.
	mov TH2, #high(TIMER2_RELOAD)
	mov TL2, #low(TIMER2_RELOAD)
	; Set the reload value
	mov RCAP2H, #high(TIMER2_RELOAD)
	mov RCAP2L, #low(TIMER2_RELOAD)
	; Init One millisecond interrupt counter.  It is a 16-bit variable made with two 8-bit parts
	clr a
	mov Count1ms+0, a
	mov Count1ms+1, a
	; Enable the timer and interrupts
    setb ET2  ; Enable timer 2 interrupt
    setb TR2  ; Enable timer 2
	ret

;---------------------------------;
; ISR for timer 2                 ;
;---------------------------------;
Timer2_ISR:
	clr TF2  ; Timer 2 doesn't clear TF2 automatically. Do it in ISR
	cpl P1.0 ; To check the interrupt rate with oscilloscope. It must be precisely a 1 ms pulse.
	
	; The two registers used in the ISR must be saved in the stack
	push acc
	push psw
	
	; Increment the 16-bit one mili second counter
	inc Count1ms+0    ; Increment the low 8-bits first
	mov a, Count1ms+0 ; If the low 8-bits overflow, then increment high 8-bits
	jnz Inc_Done
	inc Count1ms+1

Inc_Done:
	; Check if second has passed
	mov a, Count1ms+0
	cjne a, #low(Time_Speed), Timer2_ISR_done ; Warning: this instruction changes the carry flag!
	mov a, Count1ms+1
	cjne a, #high(Time_Speed), Timer2_ISR_done
	
	;1000 milliseconds have passed.  Set a flag so the main program knows
	setb seconds_flag ; Let the main program know (Time_Speed) ms have passed
	
	;cpl TR0 ; Enable/disable timer/counter 0. This line creates a beep-silence-beep-silence sound.
	
	; Reset to zero the milli-seconds counter, it is a 16-bit variable
	clr a
	mov Count1ms+0, a
	mov Count1ms+1, a
	
	
	;Seconds Increment
	mov 	a, Seconds
    cjne 	a, #0x59, IncSeconds ; if Seconds != 59, then seconds++
    mov 	a, #0 
    da 		a
    mov 	Seconds, a
    
    ;Minutes Increment
    mov 	a, Minutes
    cjne 	a, #0x59, IncMinutes
    mov 	a, #0 
    da 		a
    mov 	Minutes, a
    lcall CheckAlarm
    
    ;Hours Increment
    mov 	a, Hours
    cjne 	a, #0x12, IncHours
    mov 	a, #1 
    da 		a
    mov 	Hours, a
    
    ;Days Increment
    mov a, Day
    cjne a,#0x06, IncDay
    mov a, #0
    da a
    mov Day, a
    
	jnb UPDOWN, Timer2_ISR_decrement
	add a, #0x01
	sjmp Timer2_ISR_da
Timer2_ISR_decrement:
	add a, #0x99 ; Adding the 10-complement of -1 is like subtracting 1.
Timer2_ISR_da:
	da a ; Decimal adjust instruction.  Check datasheet for more details!
	mov Seconds, a
	
Timer2_ISR_done:
	pop psw
	pop acc
	reti
	
IncSeconds:
	add a, #0x01
	da a
	mov Seconds, a
	sjmp Inc_Done
	
IncMinutes:
	add a, #0x01
	da a
	mov Minutes, a
	lcall CheckAlarm
	sjmp Inc_Done
	
IncHours:
	add a, #0x01
	da a
	mov Hours, a
	mov a, Hours
	cjne a, #0x12, Inc_Done
	
	mov a, AMPM	
	cjne a, #0x01, IncAMPM
	mov a, #0x00
	mov AMPM, a
	mov a, Day
	cjne a, #0x07, Next
		mov Day, #0x00
		sjmp Inc_Done
	Next:
	add a, #0x01
	mov Day, a
	ljmp Inc_Done
	
IncAMPM:
	add a, #0x01
	da a
	mov AMPM, a
	ljmp Inc_Done
	
IncDay:
	add a, #0x00
	da a
	mov AMPM, a
	ljmp Inc_Done
	
CheckAlarm: ;Checks if Alarm = Time
	mov a, Minutes
	cjne a, AlarmMin, TimeNotAlarm
	mov a, Hours
	cjne a, AlarmHr, TimeNotAlarm
	mov a, AMPM
	cjne a, AMPM, TimeNotAlarm
	setb TR0
	ret
	TimeNotAlarm:
		ret
	
;---------------------------------;
; Main program. Includes hardware ;
; initialization and 'forever'    ;
; loop.                           ;
;---------------------------------;
main:
	; Initialization
    mov SP, #0x7F
    lcall Timer0_Init
    lcall Timer2_Init
    ; In case you decide to use the pins of P0, configure the port in bidirectional mode:
    mov P0M0, #0
    mov P0M1, #0
    
    ;Initial Values of HH:MM:SS
    mov Hours, #0x11
    mov Minutes, #0x59
    mov Seconds, #0x55
    mov AMPM, #0x01 ; AM = 0, PM = 1
    mov Day, #0x00
    
    ;Initial Alarm Values of HH:MM:SS
    mov AlarmMin, #0x01
    mov AlarmHr, #0x11
    mov AlarmAP, #0x00
    
    ;Sets alarm to off
    clr TR0

    setb EA   ; Enable Global interrupts
    lcall LCD_4BIT
    ; For convenience a few handy macros are included in 'LCD_4bit.inc':
	Set_Cursor(1, 1)
    Send_Constant_String(#Initial_Message)
    setb seconds_flag
	
	; After initialization the program stays in this 'forever' loop
loop:
	jb Button1, CheckButton2
	Wait_Milli_Seconds(#50)
	jb Button1, CheckButton2 
	jnb Button1, $
	jnb TR0, GoToSetTime
	clr TR0 ;;;TURNS OFF SPEAKER
	ljmp loop
	GoToSetTime:
		clr TR2 
		ljmp ModeSetTime

CheckButton2:
	jb Button2, loop_a
	Wait_Milli_Seconds(#50)
	jb Button2, loop_a
	jnb Button2, $
	jnb TR0, GoToSetAlarm
	clr TR0
	mov a, Minutes
	add a, #0x01
	mov AlarmMin, a
	ljmp loop
	GoToSetAlarm:
		ljmp SetAlarm

loop_a:
	jnb seconds_flag, loop
loop_b:
    clr seconds_flag 
    Set_Cursor(1,1)
    Send_Constant_String(#Initial_Message)
	Set_Cursor(1, 10)   
	Display_BCD(Seconds) 
	Set_Cursor(1,7)
	Display_BCD(Minutes)
	Set_Cursor(1,4)
	Display_BCD(Hours)
	Set_Cursor(1,12)
	
	mov a, Day
	
	cjne a, #0x00, NotMon
	Set_Cursor(2,7)
	Send_Constant_String(#Monday)
	NotMon:
	cjne a, #0x01, NotTue
	Set_Cursor(2,7)
	Send_Constant_String(#Tuesday)
	NotTue:
	cjne a, #0x02, NotWed
	Set_Cursor(2,7)
	Send_Constant_String(#Wednesday)
	NotWed:
	cjne a, #0x03, NotThu
	Set_Cursor(2,7)
	Send_Constant_String(#Thursday)
	NotThu:
	cjne a, #0x04, NotFri
	Set_Cursor(2,7)
	Send_Constant_String(#Friday)
	NotFri:
	cjne a, #0x05, NotSat
	Set_Cursor(2,7)
	Send_Constant_String(#Saturday)
	NotSat:
	cjne a, #0x06, NotSun
	Set_Cursor(2,7)
	Send_Constant_String(#Sunday)
	NotSun:
	
	Set_Cursor(1,12)
	mov a, AMPM
	cjne a, #0x00, WritePM
	Send_Constant_String(#AM)
	ljmp loop
	WritePM:
		Send_Constant_String(#PM)
    ljmp loop
	
ModeSetTime:
	Set_Cursor(1,1)
    Send_Constant_String(#TimeMsgTop)
    Set_Cursor(2,1)
    Send_Constant_String(#MsgBtm)
	Set_Cursor(1,7)
	Display_BCD(Minutes)
	Set_Cursor(1,4)
	Display_BCD(Hours)
	Set_Cursor(1,9)
	mov a, AMPM
	cjne a, #0x00, WritePM1
	Send_Constant_String(#AM)
	ljmp SetTimeA
	WritePM1:
		Send_Constant_String(#PM)
SetTimeA:
	jb Button1, SetTimeB  ; if the 'BOOT' button is not pressed skip
	Wait_Milli_Seconds(#50)	; Debounce delay.  This macro is also in 'LCD_4bit.inc'
	jb Button1, SetTimeB  ; if the 'BOOT' button is not pressed skip
	jnb Button1, $		; Wait for button release.  The '$' means: jump to same instruction.
	
	mov a, Hours
	cjne a, #0x12, HoursPlus1
	mov a, #0x01
	mov Hours, a
	ljmp ModeSetTime

HoursPlus1:
	add a, #0x01
	da a
	mov Hours, a
	ljmp ModeSetTime
	
SetTimeB:
	jb Button2, SetTimeC  
	Wait_Milli_Seconds(#50)	
	jb Button2, SetTimeC  
	jnb Button2, $
	
	mov a, Minutes
	cjne a, #0x59, MinPlus1
	mov a, #0x00
	mov Minutes, a
	ljmp ModeSetTime
	
SetTimeD:
	jb Button4, SetTimeA  
	Wait_Milli_Seconds(#50)	
	jb Button4, SetTimeA 
	jnb Button4, $
	Set_Cursor(1,1)
	Send_Constant_String(#Initial_Message)
	Set_Cursor(2,1)
	Send_Constant_String(#CLS)
	setb TR2
	ljmp loop_b
MinPlus1:
	add a, #0x01
	da a
	mov Minutes, a
	ljmp ModeSetTime
SetTimeC:
	jb Button3, SetTimeD  
	Wait_Milli_Seconds(#50)	
	jb Button3, SetTimeD  
	jnb Button3, $
	
	mov a, AMPM
	cjne a, #0x01, APPlus1
	mov a, #0x00
	mov AMPM, a
	ljmp ModeSetTime
APPlus1:
	add a, #0x01
	da a
	mov AMPM, a
	ljmp ModeSetTime

SetAlarm:
	Set_Cursor(1,1)
    Send_Constant_String(#AlarmMsgTop)
    Set_Cursor(2,1)
    Send_Constant_String(#MsgBtm)
	Set_Cursor(1,7)
	Display_BCD(AlarmMin)
	Set_Cursor(1,4)
	Display_BCD(AlarmHr)
	Set_Cursor(1,9)
	mov a, AlarmAP
	cjne a, #0x00, WritePM2
	Send_Constant_String(#AM)
	ljmp AlarmA
	WritePM2:
		Send_Constant_String(#PM)	
AlarmA:
	jb Button1, AlarmB
	Wait_Milli_Seconds(#50)
	jb Button1, AlarmB
	jnb Button1, $
	mov a, AlarmHr
	cjne a, #0x12, AHoursPlus1
	mov a, #0x01
	mov AlarmHr, a
	ljmp SetAlarm
AHoursPlus1:
	add a, #0x01
	da a
	mov AlarmHr, a
	ljmp SetAlarm
	
AlarmB:
	jb Button2, AlarmC
	Wait_Milli_Seconds(#50)
	jb Button2, AlarmC
	jnb Button2, $
	mov a, AlarmMin
	cjne a, #0x59, AMinPlus1
	mov a, #0x00
	mov AlarmMin, a
	ljmp SetAlarm
AMinPlus1:
	add a, #0x01
	da a
	mov AlarmMin, a
	ljmp SetAlarm
	
AlarmC:
	jb Button3, AlarmD
	Wait_Milli_Seconds(#50)
	jb Button3, AlarmD
	jnb Button3, $
	mov a, AlarmAP
	cjne a, #0x01, AAPPlus1
	mov a, #0x00
	mov AlarmAP, a
	ljmp SetAlarm
AAPPlus1:
	add a, #0x01
	da a
	mov AlarmAP, a
	ljmp SetAlarm

AlarmD:
	jb Button4, GoToAlarmA
	Wait_Milli_Seconds(#50)	
	jb Button4, GoToAlarmA
	jnb Button4, $
	Set_Cursor(1,1)
	Send_Constant_String(#Initial_Message)
	Set_Cursor(2,1)
	Send_Constant_String(#CLS)
	ljmp loop_b
	
GoToAlarmA:
	ljmp AlarmA
END