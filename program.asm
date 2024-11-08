	list P=16F747
	title "program1"
	
	#include <P16F747.INC>
	
	__config _CONFIG1, _FOSC_HS & _CP_OFF & _DEBUG_OFF & _VBOR_2_0 & _BOREN_0 & _MCLR_ON & _PWRTE_ON & _WDT_OFF
  	__config _CONFIG2, _BORSEN_0 & _IESO_OFF & _FCMEN_OFF
  	
  	
; Variable declarations

Count equ 20h ; the counter
Temp equ 21h ; a temporary register
State equ 22h ; the program state register

		org 00h ; interrupt vector
		goto SwitchCheck ; goto interrupt service routine (dummy)
		org 04h ; interrupt vector
		goto isrService ; goto interrupt service routine (dummy)
	
		org 15h ; Beginning of program storage

SwitchCheck

		call initPort ; initialize ports

ReadState

		movf PORTE,W
		movwf PORTB
		goto ReadState






;
; &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
;

; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;
; Port Initialization Subroutine

initPort

		movlw	0x00
		movwf	TRISB ; configure PORTB as output
		
		movlw	0xFF
		movwf	TRISE ; configure PORTE for input
		
		return

; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;
; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;


isrService

		goto isrService ; error - - stay here

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	end