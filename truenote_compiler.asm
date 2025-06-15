; ================================
; Truenote Bootstrap Compiler
; From .true → .asm → .hex → .exe
; Written in x86_64 NASM (Linux/Win64)
; ================================

section .data
    inputFile      db 'main.true', 0
    outputASM      db 'main.asm', 0
    outputHEX      db 'main.hex', 0
    newline        db 10, 0
    true_phrase    db 'say ', 0
    phrase_len     equ 4

section .bss
    buffer         resb 4096
    output_buf     resb 8192

section .text
    global _start

_start:
    ; === Open main.true ===
    mov rax, 2              ; syscall: open
    mov rdi, inputFile
    mov rsi, 0              ; read-only
    syscall
    mov r12, rax            ; store FD

    ; === Read content into buffer ===
    mov rax, 0              ; syscall: read
    mov rdi, r12
    mov rsi, buffer
    mov rdx, 4096
    syscall
    mov r13, rax            ; store size

    ; === Generate ASM file ===
    ; open main.asm (O_CREAT | O_WRONLY)
    mov rax, 2
    mov rdi, outputASM
    mov rsi, 0x241           ; O_CREAT | O_WRONLY | O_TRUNC
    mov rdx, 0644
    syscall
    mov r14, rax             ; FD of .asm

    ; === Write ASM header ===
    mov rsi, output_buf
    mov rdi, output_buf
    call write_asm_header

    ; === Parse Truenote ===
    mov rcx, 0              ; offset pointer
parse_loop:
    cmp rcx, r13
    jge finish

    ; check for 'say ' command (primitive pattern match)
    mov rsi, buffer
    add rsi, rcx
    mov rdi, true_phrase
    call match_prefix
    cmp rax, 1
    jne .next

    ; found 'say' command
    add rcx, phrase_len
    mov rsi, buffer
    add rsi, rcx
    call extract_string
    call generate_print

    jmp parse_loop

.next:
    inc rcx
    jmp parse_loop

finish:
    ; write output_buf to .asm
    mov rax, 1
    mov rdi, r14
    mov rsi, output_buf
    mov rdx, r15
    syscall

    ; close .asm
    mov rax, 3
    mov rdi, r14
    syscall

    ; === Done ===
    mov rax, 60
    xor rdi, rdi
    syscall

; ===========================
; Subroutines
; ===========================

; write_asm_header:
; Adds basic _start, data, syscall print_string logic
write_asm_header:
    mov rbx, rdi
    mov rax, rbx

    mov rdx, header_end - header
    mov rsi, header
    rep movsb
    sub rdi, rbx
    mov r15, rdi
    ret

header:
    db "section .data",10
    db "msg db 0",10
    db "section .text",10
    db "global _start",10
    db "_start:",10
header_end:

; match_prefix(rsi: input, rdi: prefix)
match_prefix:
    push rcx
    xor rcx, rcx
.loop:
    mov al, [rsi + rcx]
    mov bl, [rdi + rcx]
    cmp bl, 0
    je .match
    cmp al, bl
    jne .fail
    inc rcx
    jmp .loop
.match:
    mov rax, 1
    pop rcx
    ret
.fail:
    xor rax, rax
    pop rcx
    ret

; extract_string(rsi: pointer to text after 'say')
; Sets RDX = length, RSI unchanged
extract_string:
    push rcx
    xor rdx, rdx
.scan:
    mov al, [rsi + rdx]
    cmp al, 10
    je .done
    cmp al, 0
    je .done
    inc rdx
    jmp .scan
.done:
    pop rcx
    ret

; generate_print(rsi: pointer, rdx: length)
; Appends to output_buf: move string to msg, syscall print
generate_print:
    ; msg db "text", 0
    mov rdi, output_buf
    add rdi, r15

    mov [rdi], byte ' '
    inc rdi

    mov al, '"'
    stosb
    mov rcx, 0
.strcpy:
    cmp rcx, rdx
    je .done
    mov al, [rsi + rcx]
    stosb
    inc rcx
    jmp .strcpy
.done:
    mov al, '"'
    stosb
    mov al, 10
    stosb

    ; syscall logic (assumes string in msg)
    db "mov rax, 1",10
    db "mov rdi, 1",10
    db "mov rsi, msg",10
    db "mov rdx, 32",10
    db "syscall",10

    ; end
    mov r15, rdi
    ret
