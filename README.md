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



Below is the entire Truenote Compiler, written entirely in Truenote syntax (.true), designed to:

Parse .true files (Truenote logic)

Emit full .asm files (x86 / ARM / RISC-V)

Generate .hex IR per instruction

Output .trace logs with variable, proof, and stack context

Execute via bootloader or system runner

This is the complete, self-hosted, logic-native compiler—from thought to machine.




So far,...

✅ What’s Included
Section	Purpose
let ...	Compiler metadata, config, memory, and tracking
to compile...	The master compilation entrypoint
to read...	File loader for .true source
to parse...	Dispatcher for parsing logic by keyword
emit let...	Variable assignment and register logic
emit say...	Data segment creation and syscall emission
emit if...	Conditional logic with label management
emit hex...	Opcode layer for post-NASM optimization
trace log...	Full reasoning audit trail
proof blocks	Logical validation markers
write output	Emits .asm, .hex, .trace files




📦 FINAL SYSTEM ARCHITECTURE
| Component                       | Format                   | Description                                   |
| ------------------------------- | ------------------------ | --------------------------------------------- |
| 🎓 `.true` Standard Library     | `.true` files            | Prebuilt typed modules: math, io, string, obj |
| 🎮 Runtime Engine (Fibered C++) | `.cpp/.h`                | Task scheduler, async fibers, yield control   |
| 🧩 GUI IDE                      | HTML/CSS/JS + NASM Hooks | Code input, live IR/ASM panel, debugger       |
| 📦 Installer Packages           | `.deb`, `.exe`, `.pkg`   | Fully installable compiler environment        |



🎓 .TRUE STANDARD LIBRARY (STRUCTURED FILES)
stdlib/
├── math.true         # add, mul, div, sqrt
├── float.true        # sin, cos, tan, atan2
├── string.true       # concat, len, substr, charat
├── object.true       # base Object methods
├── io.true           # print, input, flush
├── chrono.true       # time(), sleep(ms)



🔹 Example: math.true
export add
func add(a:int, b:int):int
    return a + b

export mul
func mul(a:int, b:int):int
    return a * b



