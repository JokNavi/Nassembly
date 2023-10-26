section .data
    hello db `Hello, World!\n`,0
    helloLen equ $-hello

section .text
    global _start

_start:

    times 2 call print_hello
    ; call print_hello 2 times
    
    mov rax, 60         ; syscall number for sys_exit
    xor rdi, rdi        ; status: 0
    syscall             ; invoke syscall


print_hello:
    mov rax, 1          ; syscall number for write
    mov rdi, 1          ; file descriptor 1 (stdout)
    mov rsi, hello      ; pointer to the string
    mov rdx, helloLen   ; string length
    syscall             ; invoke syscall
    ret                 ; return from fn