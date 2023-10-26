section .data
    hello db `Hello, World!\n`,0
    helloLen equ $-hello

section .text
    global _start

_start:
    ; write(1, hello, 13)
    mov eax, 4         ; syscall number for sys_write
    mov ebx, 1         ; file descriptor 1 (stdout)
    mov ecx, hello     ; pointer to the string
    mov edx, helloLen  ; string length
    int 0x80           ; interrupt to invoke syscall

    ; exit(0)
    mov eax, 60        ; syscall number for sys_exit
    xor ebx, ebx       ; status: 0
    syscall           ; interrupt to invoke syscall