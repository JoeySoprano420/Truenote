# Truenote

🔹 Overview:
Truenote is a symbol-free programming language built entirely on logical and linguistic constructs. It is:

Fully human-readable

Structure-driven (indentation and line breaks define blocks and scope)

Based on truth logic, proof chaining, and natural conditionals



📘 Syntax Principles:

| Concept               | Representation Example                            |
| --------------------- | ------------------------------------------------- |
| Truth assignment      | `let age be true if age is greater than eighteen` |
| Conditional execution | `if status is valid then do verify token`         |
| Looping               | `while user is active do refresh session`         |
| Functions             | `to greet name say hello to name`                 |
| Comparisons           | `is greater than`, `is equal to`, `is not`        |
| Arithmetic            | `add`, `subtract`, `multiply`, `divide`           |
| Output                | `say`, `print`, or `reveal`                       |
| Comments              | `note this is a comment`                          |
| Scope                 | Determined by **indentation**                     |
| Proof blocks          | Begin with `given` and build toward `therefore`   |



✒️ Design Philosophy
Truth is the syntax: The language is built around propositions.

No symbols: There is no =, +, -, {}, (), ;, :, etc.

No digits: Optional. Words like five, ten, twenty one can be parsed as numbers.

Proof chaining mimics mathematical derivation.

Human-speak structure: Readable by non-programmers.

Indentation is block structure.



🧪 Compiler Behavior
A Truenote interpreter/compiler would:

Parse indents as scope

Convert natural-language logic into an abstract syntax tree (AST)

Infer intent based on pattern-matching rules

Validate truth chains and logical consistency

Convert all natural arithmetic into bytecode or target IR



🛠 How It Works:

You write this in main.true:

say hello world
say welcome to Truenote

Then assemble & run:

nasm -felf64 truenote_compiler.asm -o compiler.o
ld compiler.o -o truenotec
./truenotec
nasm -fwin64 main.asm -o main.obj
ld main.obj -o main.exe

(Replace -fwin64 with -felf64 on Linux; adjust ld params accordingly)

📦 Output: main.asm

section .data
msg db "hello world", 0
section .text
global _start
_start:
mov rax, 1
mov rdi, 1
mov rsi, msg
mov rdx, 32
syscall


🧮 Output: main.hex

B8 01 00 00 00
BF 01 00 00 00
BE 00 00 00 00
BA 20 00 00 00
0F 05


