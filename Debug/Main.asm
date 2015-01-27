TITLE FlipItReverseIt2(Main.asm)

; Description: Flips a string by using push and pop operations
; Revision date: 1/27/2015
; Author: Ted Mader

INCLUDE Irvine32.inc
.data
myStr BYTE "Got a Lamborghini so I drive faster", 0
myStrSize = ($ - myStr) - 1			; myStr's size
target BYTE SIZEOF myStr DUP(0)

.code
main PROC
; Push myStr on the stack.
mov   esi,0
mov	  ecx,myStrSize

L1 : movzx eax,myStr[esi]			; Move each character from myStr to eax
	 push  eax
	 inc   esi
	 loop  L1

	 ; Pop the myStr from the stack.
	 ; In reverse, store myStr in the target array.
	 mov   ecx,myStrSize
	 mov   esi,0

 L2:	pop	  eax
		mov	  target[esi],al		; Start target at end
		inc	  esi					; Increment esi
		loop  L2
		; Print the target.
		mov	  edx,OFFSET target
		call  WriteString
		exit
		main ENDP
		END main