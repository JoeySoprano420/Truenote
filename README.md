# Truenote



![Truenote](https://img.shields.io/badge/Truenote-logic%20based%20language-blueviolet?style=for-the-badge&logo=data:image/svg+xml;base64)




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



📦 PACKAGING INSTALLERS
🔹 Linux: .deb
Create DEBIAN/control:

Package: truenote
Version: 1.0
Architecture: amd64
Maintainer: VACU
Description: Truenote Compiler + Runtime



Layout:
truenote/
├── usr/bin/truenote
├── usr/lib/truenote_runtime.so
├── usr/share/truenote/stdlib/*.true
├── DEBIAN/control



Build with:
.bash
dpkg-deb --build truenote



🔹 Windows: .exe Installer (Inno Setup)
.iss
[Setup]
AppName=Truenote
AppVersion=1.0
DefaultDirName={pf}\Truenote

[Files]
Source: "truenote.exe"; DestDir: "{app}"
Source: "stdlib\*"; DestDir: "{app}\stdlib"

[Icons]
Name: "{group}\Truenote IDE"; Filename: "{app}\truenote.exe"



🔹 macOS: .pkg
Use pkgbuild:
.bash
pkgbuild --identifier com.truenote.compiler \
  --root /path/to/truenote-root \
  --version 1.0 \
  truenote.pkg



✅ The Truenote Compiler System Now Delivers:
| Component             | Status |
| --------------------- | ------ |
| Full compiler chain   | ✅      |
| SSA/IR, ASM emit      | ✅      |
| Standard lib          | ✅      |
| Multi-module linker   | ✅      |
| Type system           | ✅      |
| Float + string types  | ✅      |
| Runtime engine (C++)  | ✅      |
| Fibered threading     | ✅      |
| GUI IDE (live IR/ASM) | ✅      |
| Webserver compiler    | ✅      |
| Package installers    | ✅      |



Here's a minimal "setup.sh" script to go hand-in-hand with your "setup.md", followed by a polished and interactive "README.md" for the Truenote GitHub page.

---

### 📦 "setup.sh" – Truenote Quick Bootstrap

bash:
#!/bin/bash

echo "🌱 Bootstrapping Truenote Compiler..."

# Check for C++ compiler
if ! command -v g++ &> /dev/null; then
    echo "❌ g++ not found. Please install a C++17 compiler."
    exit 1
fi

# Optional: Install WABT (wat2wasm)
if ! command -v wat2wasm &> /dev/null; then
    echo "🔧 Installing WABT (WebAssembly Binary Toolkit)..."
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        sudo apt install -y wabt
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        brew install wabt
    elif [[ "$OSTYPE" == "msys" ]]; then
        scoop install wabt
    else
        echo "⚠️ Please install WABT manually for your OS."
    fi
fi

# Build the compiler
echo "🔨 Compiling main.cpp..."
g++ main.cpp -std=c++17 -o truenote

if [ $? -eq 0 ]; then
    echo "✅ Truenote built successfully!"
    ./truenote
else
    echo "❌ Compilation failed."
    exit 1
fi


Make sure to "chmod +x setup.sh" before running it!

---

### 🎨 Fancy Interactive README.md

markdown:
# 🌌 Truenote Compiler

> _A logic-native, truth-driven compiler pipeline from thought to machine._  
> Written in both C++ and the `.true` language it compiles. Self-hosted. Streamlined. Beautifully weird.

---

## 🧠 What is Truenote?

Truenote is a **symbol-free**, **truth-logic-based** language for expression, execution, and compilation.  
It is **fully human-readable** and built around:

- Proof chaining instead of logic gates
- Indentation-based scope (no "{}" or ";")
- No symbols or digits: all words, all logic

_Example syntax:_

true
let user be true
if age is greater than eighteen then say welcome
to greet name say hello to name


---

## ⚙️ Features

| Module                  | Description                                      |
|------------------------|--------------------------------------------------|
| 🧠 AI Autocomplete     | Live suggestions while typing ".true" code       |
| 🏗️ WASM Emitter        | Emits ".wat" and compiles to ".wasm"             |
| 🔁 SSA Optimizer        | Loop unrolling, inlining, and constant folding   |
| 🧪 JIT Engine (optional)| LLVM ORC JIT backend                            |
| 🎨 GUI IDE              | Live REPL, AST viewer, IR inspector              |
| 🌐 Cloud Sync           | Uploads IR/ASM traces to remote debugger server  |
| 📦 Installers           | Emits ".deb", ".exe", ".pkg" for 1-click setup  |

---

## 🚀 Quick Start

bash:
git clone https://github.com/JoeySoprano420/Truenote.git
cd Truenote/runtime
chmod +x setup.sh
./setup.sh


> You’ll get truenote, a REPL compiler. Type .true logic and watch it compile!

---

## 🔧 Developer Tooling

- **WABT (wat2wasm)** – Optional, for WebAssembly builds
- **LLVM ORC JIT** – Optional, runtime execution
- **Git + curl** – Optional, deployment and remote tracing

---

## 📤 Output Flow
.true → [AST → SSA IR → ASM] → .hex + .wasm + .trace


Each compile emits logs, mappings, and live output.

---

## 🤝 Credits

Crafted by [@JoeySoprano420](https://github.com/JoeySoprano420)  
Inspired by logic, language, and the beauty of unorthodox design.  

Here's a minimal "setup.md" tailored for first-time builders of the Truenote compiler runtime:

---

# 🛠️ Truenote Compiler – Minimal Setup Guide

Welcome to Truenote! This guide will help you get up and running with the all-in-one runtime compiler.

---

## ✅ Prerequisites

Make sure you have the following:

- **C++17 compiler**
  - "g++", "clang++", or MSVC
- **CMake** (if using emitted build files)
- **WABT Toolkit** (for WASM conversion)
  - Install with:
    bash:
    brew install wabt        # macOS
    sudo apt install wabt    # Ubuntu
    scoop install wabt       # Windows (via Scoop)
    

Optional but recommended:

- **Git** – For syncing or deployment
- **curl** – Used by the online sync feature
- **LLVM (optional)** – For enabling JIT with "-DENABLE_LLVM_JIT"

---

## 🚀 Quick Start (CLI)

bash
# Clone the repo
git clone https://github.com/JoeySoprano420/Truenote.git
cd Truenote/runtime

# Build (if CMakeLists.txt is generated)
cmake .
make

# Or compile directly
g++ main.cpp -std=c++17 -o truenote

# Run the compiler
./truenote


---

## 🧪 Compile ".wat" to ".wasm"

After running, Truenote emits "program.wat". To compile it:

bash
wat2wasm program.wat -o program.wasm


---

## 🔧 Troubleshooting

- Missing "wat2wasm"? → Install WABT.
- Compiler errors? → Ensure "-std=c++17" is used.
- Windows users: Use `main.cpp` inside WSL, or compile with MSVC.

---


## 🧪 Bonus

> Try editing [math.true](stdlib/math.true) or [chrono.true](stdlib/chrono.true) — see how logic builds from words.

---
FOR THE SUPERCOMPILER (NASM)
✅ If You’re on Windows with WSL (Windows Subsystem for Linux)
Absolutely! The Supercompiler is fully compatible. Just open up your Ubuntu (or Debian) shell and do:

bash
nasm -f elf64 truenote_compiler.asm -o compiler.o
ld compiler.o -o compiler
./compiler
You'll get main.asm, main.hex, and main.trace as output. This is the most seamless Windows route.

🧱 Without WSL (Pure Native Windows)
Native Windows NASM can assemble .obj files, but you'd need a linker like GoLink, lld, or Visual Studio's link.exe, because Linux syscall conventions won’t map directly.

Out of the box:

The NASM Supercompiler expects Linux syscall ABI, like mov rax, 60 / syscall to exit.

On Windows, that won't work—it crashes or does nothing.

So unless you rewrite the syscall scaffolding for Windows kernel32 APIs (or abstract them), it's not runnable natively without adaptation.
