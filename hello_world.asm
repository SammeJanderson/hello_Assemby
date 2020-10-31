; hello_world.asm
;
; Created by : Samme Janderson
; Date: 31-10-2020


global _start

section .text:

_start:
	mov eax, 0x4		; use the write syscall
	mov ebx, 1		; use stdout as the fd
	mov ecx, message	; use the message as the buffer
	mov edx, message_length	; and supply the message lenght
	int 0x80		; invoke the syscall

	; now exit

	mov eax, 0x1
	mov ebx, 0
	int 0x80 


section .data:
	message: db "Hello There!", 0xA
	message_length equ $-message
