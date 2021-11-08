#include "p16F887.inc"   ; TODO INSERT CONFIG CODE HERE USING CONFIG BITS GENERATOR
 	__CONFIG	_CONFIG1,	_INTRC_OSC_NOCLKOUT & _WDT_OFF & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOR_OFF & _IESO_ON & _FCMEN_ON & _LVP_OFF 
 	__CONFIG	_CONFIG2,	_BOR40V & _WRT_OFF

RES_VECT  CODE    0x0000            ; processor reset vector
    GOTO    START                   ; go to beginning of program

MAIN_PROG CODE                      ; let linker place main program

i equ 0x20
j equ 0x21
k equ 0x22
m equ 0x23
 
wkey1 equ 0x24
wkey2 equ 0x25
wkey3 equ 0x26
wkey4 equ 0x27
wkey5 equ 0x28
wkey6 equ 0x29
wkey7 equ 0x30
wkey8 equ 0x31
 
rkey1 equ 0x32
rkey2 equ 0x33
rkey3 equ 0x34
rkey4 equ 0x35
rkey5 equ 0x36
rkey6 equ 0x37
rkey7 equ 0x38
rkey8 equ 0x39
 
ax equ 0x40
carry equ 0x41
x equ 0x42

START

    BANKSEL PORTA ;
    CLRF PORTA ;Init PORTA
    BANKSEL ANSEL ;
    CLRF ANSEL ;digital I/O
    CLRF ANSELH
    BANKSEL TRISA ;
    CLRF TRISA
    CLRF TRISB
    CLRF TRISC
    CLRF TRISD
    CLRF TRISE
    BCF STATUS,RP1
    BCF STATUS,RP0
    CLRF PORTA
    CLRF PORTB
    CLRF PORTC
    CLRF PORTD
    CLRF PORTE
    
    BCF STATUS, RP1
    BSF STATUS, RP0
    MOVLW b'00000000'
    MOVWF TRISD
    MOVLW b'00001111'
    MOVWF TRISC
    BCF STATUS, RP0
    
INITLCD
    BCF PORTA,0		;reset
    MOVLW 0x01
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    
    MOVLW 0x0C		;first line
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
         
    MOVLW 0x3C		;cursor mode
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    
    

    
CALL inicio

    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0xC0		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
CALL INICIOA
BTFSS x,0
GOTO $-2
MOVFW ax
MOVWF wkey1
BCF x,0
    
CALL INICIOA
BTFSS x,0
GOTO $-2
MOVFW ax
MOVWF wkey2
BCF x,0
    
CALL INICIOA
BTFSS x,0
GOTO $-2
MOVFW ax
MOVWF wkey3
BCF x,0
    
CALL INICIOA
BTFSS x,0
GOTO $-2
MOVFW ax
MOVWF wkey4
BCF x,0
    
CALL INICIOA
BTFSS x,0
GOTO $-2
MOVFW ax
MOVWF wkey5
BCF x,0
    
CALL INICIOA
BTFSS x,0
GOTO $-2
MOVFW ax
MOVWF wkey6
BCF x,0
    
CALL INICIOA
BTFSS x,0
GOTO $-2
MOVFW ax
MOVWF wkey7
BCF x,0
    
CALL INICIOA
BTFSS x,0
GOTO $-2
MOVFW ax
MOVWF wkey8
BCF x,0

    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0xD0		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
CALL INICIOA
BTFSS x,0
GOTO $-2
MOVFW ax
MOVWF rkey1
BCF x,0
    
CALL INICIOA
BTFSS x,0
GOTO $-2
MOVFW ax
MOVWF rkey2
BCF x,0
    
CALL INICIOA
BTFSS x,0
GOTO $-2
MOVFW ax
MOVWF rkey3
BCF x,0
    
CALL INICIOA
BTFSS x,0
GOTO $-2
MOVFW ax
MOVWF rkey4
BCF x,0
    
CALL INICIOA
BTFSS x,0
GOTO $-2
MOVFW ax
MOVWF rkey5
BCF x,0
    
CALL INICIOA
BTFSS x,0
GOTO $-2
MOVFW ax
MOVWF rkey6
BCF x,0
    
CALL INICIOA
BTFSS x,0
GOTO $-2
MOVFW ax
MOVWF rkey7
BCF x,0
    
CALL INICIOA
BTFSS x,0
GOTO $-2
MOVFW ax
MOVWF rkey8
BCF x,0
    
CALL CHECK

CALL time1
CALL time1
CALL time1
CALL time1
CALL time1
CALL time1
CALL time1
    
    

INICIOA
    
    BSF PORTD,0
    BTFSC PORTC,0
    call num3A
    BTFSC PORTC,1
    call num6A
    BTFSC PORTC,2
    call num9A
    BCF PORTD,0
    BSF PORTD,1
    BTFSC PORTC,0
    call num2A
    BTFSC PORTC,1
    call num5A
    BTFSC PORTC,2
    call num8A
    BTFSC PORTC,3
    call num0A
    BCF PORTD,1
    BSF PORTD,2
    BTFSC PORTC,0
    call num1A
    BTFSC PORTC,1
    call num4A
    BTFSC PORTC,2
    call num7A
    BCF PORTD,2
    
    RETURN
    
    
num3A:
    
    MOVLW d'3'
    MOVWF ax
    
    MOVLW '3'
    MOVWF PORTB
    CALL exec
    
    CALL time1
    
    BCF PORTA, 0
    CALL time
    
    MOVLW 0x10
    MOVWF PORTB
    CALL exec
    
    BSF PORTA, 0
    CALL time
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    BSF x,0
    
    BTFSC PORTC,0
    GOTO $-1
    
    RETURN
    
    
num6A:
    
    MOVLW d'6'
    MOVWF ax
    
    MOVLW '6'
    MOVWF PORTB
    CALL exec
    
    CALL time1
    
    BCF PORTA, 0
    CALL time
    
    MOVLW 0x10
    MOVWF PORTB
    CALL exec
    
    BSF PORTA, 0
    CALL time
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    BSF x,0
    
    BTFSC PORTC,1
    GOTO $-1
    
    RETURN
 
    
num9A:
    
    MOVLW d'9'
    MOVWF ax
    
    
    MOVLW '9'
    MOVWF PORTB
    CALL exec
    
    CALL time1
    
    BCF PORTA, 0
    CALL time
    
    MOVLW 0x10
    MOVWF PORTB
    CALL exec
    
    BSF PORTA, 0
    CALL time
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    BSF x,0
    
    BTFSC PORTC,2
    GOTO $-1
    
    RETURN
 
    
num2A:
    
    MOVLW d'2'
    MOVWF ax
    
    
    MOVLW '2'
    MOVWF PORTB
    CALL exec
    
    CALL time1
    
    BCF PORTA, 0
    CALL time
    
    MOVLW 0x10
    MOVWF PORTB
    CALL exec
    
    BSF PORTA, 0
    CALL time
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    BSF x,0
    
    BTFSC PORTC,0
    GOTO $-1
    
    RETURN
    
    
num5A:
    
    MOVLW d'5'
    MOVWF ax
    
    MOVLW '5'
    MOVWF PORTB
    CALL exec
    
    CALL time1
    
    BCF PORTA, 0
    CALL time
    
    MOVLW 0x10
    MOVWF PORTB
    CALL exec
    
    BSF PORTA, 0
    CALL time
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    BSF x,0
    
    BTFSC PORTC,1
    GOTO $-1
    
    RETURN
    
       
num8A:
    
    MOVLW d'8'
    MOVWF ax
    
    MOVLW '8'
    MOVWF PORTB
    CALL exec
    
    CALL time1
    
    BCF PORTA, 0
    CALL time
    
    MOVLW 0x10
    MOVWF PORTB
    CALL exec
    
    BSF PORTA, 0
    CALL time
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    BSF x,0
    
    BTFSC PORTC,2
    GOTO $-1
    
    RETURN
    
    
num0A:
    
    MOVLW d'0'
    MOVWF ax
    
    MOVLW '0'
    MOVWF PORTB
    CALL exec
    
    CALL time1
    
    BCF PORTA, 0
    CALL time
    
    MOVLW 0x10
    MOVWF PORTB
    CALL exec
    
    BSF PORTA, 0
    CALL time
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    BSF x,0
    
    BTFSC PORTC,3
    GOTO $-1
    
    RETURN
    
    
num1A:
    
    MOVLW d'1'
    MOVWF ax
    
    MOVLW '1'
    MOVWF PORTB
    CALL exec
    
    CALL time1
    
    BCF PORTA, 0
    CALL time
    
    MOVLW 0x10
    MOVWF PORTB
    CALL exec
    
    BSF PORTA, 0
    CALL time
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    BSF x,0
    
    BTFSC PORTC,0
    GOTO $-1
    
    RETURN
    
    
num4A:
    
    MOVLW d'4'
    MOVWF ax
    
    MOVLW '4'
    MOVWF PORTB
    CALL exec
    
    CALL time1
    
    BCF PORTA, 0
    CALL time
    
    MOVLW 0x10
    MOVWF PORTB
    CALL exec
    
    BSF PORTA, 0
    CALL time
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    BSF x,0
    
    BTFSC PORTC,1
    GOTO $-1
    
    RETURN
    
    
num7A:
    
    MOVLW d'7'
    MOVWF ax
    
    MOVLW '7'
    MOVWF PORTB
    CALL exec
    
    CALL time1
    
    BCF PORTA, 0
    CALL time
    
    MOVLW 0x10
    MOVWF PORTB
    CALL exec
    
    BSF PORTA, 0
    CALL time
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    BSF x,0
    
    BTFSC PORTC,2
    GOTO $-1
    
    RETURN
    
inicio:
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x80		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'W'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'R'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'I'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'T'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'E'
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW 'K'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'E'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'Y'
    MOVWF PORTB
    CALL exec
    
    MOVLW ':'
    MOVWF PORTB
    CALL exec
    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x90		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'R'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'E'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'A'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'D'
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW 'K'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'E'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'Y'
    MOVWF PORTB
    CALL exec
    
    MOVLW ':'
    MOVWF PORTB
    CALL exec
    
    RETURN

    
CHECK
    MOVFW wkey1
    MOVWF ax
    MOVFW rkey1
    XORWF ax,1
    BTFSS ax,0
    BTFSC ax,0
    call INTRUSO
    
    MOVFW wkey2
    MOVWF ax
    MOVFW rkey2
    XORWF ax,1
    BTFSS ax,0
    BTFSC ax,0
    call INTRUSO
    
    MOVFW wkey3
    MOVWF ax
    MOVFW rkey3
    XORWF ax,1
    BTFSS ax,0
    BTFSC ax,0
    call INTRUSO
    
    MOVFW wkey4
    MOVWF ax
    MOVFW rkey4
    XORWF ax,1
    BTFSS ax,0
    BTFSC ax,0
    call INTRUSO
    
    MOVFW wkey5
    MOVWF ax
    MOVFW rkey5
    XORWF ax,1
    BTFSS ax,0
    BTFSC ax,0
    call INTRUSO
    
    MOVFW wkey6
    MOVWF ax
    MOVFW rkey6
    XORWF ax,1
    BTFSS ax,0
    BTFSC ax,0
    call INTRUSO
    
    MOVFW wkey7
    MOVWF ax
    MOVFW rkey7
    XORWF ax,1
    BTFSS ax,0
    BTFSC ax,0
    call INTRUSO
    
    MOVFW wkey8
    MOVWF ax
    MOVFW rkey8
    XORWF ax,1
    BTFSS ax,0
    BTFSC ax,0
    call INTRUSO
    call ACCESO
    
    RETURN
    
    
INTRUSO
    CALL INITLCD2
    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x80		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'X'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'X'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'X'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'X'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'X'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'X'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'X'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'X'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'X'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'X'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'X'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'X'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'X'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'X'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'X'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'X'
    MOVWF PORTB
    CALL exec
    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0xC5		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'I'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'N'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'T'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'R'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'U'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'S'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'O'
    MOVWF PORTB
    CALL exec
    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x94		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'D'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'E'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'T'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'E'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'C'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'T'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'A'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'D'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'O'
    MOVWF PORTB
    CALL exec
    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0xD0		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'X'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'X'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'X'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'X'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'X'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'X'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'X'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'X'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'X'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'X'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'X'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'X'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'X'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'X'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'X'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'X'
    MOVWF PORTB
    CALL exec
    
    BSF PORTD,0
    CALL time
    BTFSS PORTC,3
    GOTO $-3
    
    GOTO inicio
    
    RETURN
    
ACCESO
    CALL INITLCD2
    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x81		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW ':'
    MOVWF PORTB
    CALL exec
    
    MOVLW ')'
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ':'
    MOVWF PORTB
    CALL exec
    
    MOVLW ')'
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ':'
    MOVWF PORTB
    CALL exec
    
    MOVLW ')'
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ':'
    MOVWF PORTB
    CALL exec
    
    MOVLW ')'
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ':'
    MOVWF PORTB
    CALL exec
    
    MOVLW ')'
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0xC4		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'A'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'D'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'E'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'L'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'A'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'N'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'T'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'E'
    MOVWF PORTB
    CALL exec
    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x94		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'C'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'O'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'M'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'P'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'A'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'N'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'E'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'R'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'O'
    MOVWF PORTB
    CALL exec
    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0xD1		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW ':'
    MOVWF PORTB
    CALL exec
    
    MOVLW ')'
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ':'
    MOVWF PORTB
    CALL exec
    
    MOVLW ')'
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ':'
    MOVWF PORTB
    CALL exec
    
    MOVLW ')'
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ':'
    MOVWF PORTB
    CALL exec
    
    MOVLW ')'
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ':'
    MOVWF PORTB
    CALL exec
    
    MOVLW ')'
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    BSF PORTD,0
    CALL time
    BTFSS PORTC,3
    GOTO $-3
    
    GOTO inicio
    
    RETURN
    
    
exec

    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    RETURN
    
time
    CLRF i
    MOVLW d'10'
    MOVWF j
ciclo    
    MOVLW d'80'
    MOVWF i
    DECFSZ i
    GOTO $-1
    DECFSZ j
    GOTO ciclo
    RETURN
    
    
time1:
    
    movlw d'127' 
    movwf m
mloop1:
    decfsz m,f
    goto mloop1
    movlw d'20' 
    movwf i
iloop1:
    nop 
    movlw d'62' 
    movwf j
jloop1:
    nop 
    movlw d'74' 
    movwf k
kloop1:
    decfsz k,f
    goto kloop1
    decfsz j,f
    goto jloop1
    decfsz i,f
    goto iloop1
    return 

INITLCD2
    BCF PORTA,0		;reset
    MOVLW 0x01
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    
    MOVLW 0x0C		;first line
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
         
    MOVLW 0x3C		;cursor mode
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    RETURN
    
    
    END