## Requirements
+ linux
+ nasm


## stet by step

1. instal nasm
````terminal
apt install nasm
````

2. Write the program
````àssembly
global _start

section .text:

_start:
        mov eax, 0x4            ; use the write syscall
        mov ebx, 1              ; use stdout as the fd
        mov ecx, message        ; use the message as the buffer
        mov edx, message_length ; and supply the message lenght
        int 0x80                ; invoke the syscall

        ; now exit

        mov eax, 0x1
        mov ebx, 0
        int 0x80


section .data:
        message: db "Hello There!", 0xA        ; 0xA to inset line break
        message_length equ $-message           ; defines the message lenght_equals to the message
````


3. compile the program
````terminal
nasm -f elf32 -o hello_world.o hello_world.asm
````

4. Create the executable
````terminal
ld -m elf_i386 -o hello_world hello_world.o
```` 

5. run it

