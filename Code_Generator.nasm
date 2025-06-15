section .data
    granted db "access granted", 0
    denied  db "access denied", 0

section .text
    global _start

_start:
    mov rax, [age]
    cmp rax, 17
    jg .granted
    jmp .denied

.granted:
    mov rdi, granted
    call print_string
    jmp .end

.denied:
    mov rdi, denied
    call print_string

.end:
    mov rax, 60 ; syscall exit
    xor rdi, rdi
    syscall
