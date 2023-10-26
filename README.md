# Nassembly
Learning nasm assembly

## Run Nassembly

For my system/setup only*

```sh
#!/bin/bash
nasm -f elf64 "${1}" -o "target/$(basename ${1%.*}).o"
ld -o "target/$(basename ${1%.*})" "target/$(basename ${1%.*}).o"
```


## Nasm Info

The most important part of the [nasm](https://www.nasm.us/xdoc/2.16.01/html/nasmdoc3.html) tutorial.

### Variable types
core
```asm
      db    0x55                ; just the byte 0x55 
      db    0x55,0x56,0x57      ; three bytes in succession 
      db    'a',0x55            ; character constants are OK 
      db    'hello',13,10,'$'   ; so are string constants 
      dw    0x1234              ; 0x34 0x12 
      dw    'a'                 ; 0x61 0x00 (it's just a number) 
      dw    'ab'                ; 0x61 0x62 (character constant) 
      dw    'abc'               ; 0x61 0x62 0x63 0x00 (string) 
      dd    0x12345678          ; 0x78 0x56 0x34 0x12 
      dd    1.234567e20         ; floating-point constant 
      dq    0x123456789abcdef0  ; eight byte constant 
      dq    1.234567e20         ; double-precision float 
      dt    1.234567e20         ; extended-precision float
```

all variable types
```
    dx      := DB | DW | DD | DQ | DT | DO | DY | DZ 
    type    := BYTE | WORD | DWORD | QWORD | TWORD | OWORD | YWORD | ZWORD 
    atom    := expression | string | float | '?' 
    parlist := '(' value [, value ...] ')' 
    duplist := expression DUP [type] ['%'] parlist 
    list    := duplist | '%' parlist | type ['%'] parlist 
    value   := atom | type value | list 

    stmt    := dx value [, value...]
```

### Reserve uninitialised space

```
    buffer:         resb    64              ; reserve 64 bytes 
    wordvar:        resw    1               ; reserve a word 
    realarray       resq    10              ; array of ten reals 
    ymmval:         resy    1               ; one YMM register 
    zmmvals:        resz    32              ; 32 ZMM registers
```

Since NASM 2.15, the MASM syntax of using ? and DUP in the Dx directives is also supported. Thus, the above example could also be written:

```
    buffer:         db      64 dup (?)      ; reserve 64 bytes 
    wordvar:        dw      ?               ; reserve a word 
    realarray       dq      10 dup (?)      ; array of ten reals 
    ymmval:         dy      ?               ; one YMM register 
    zmmvals:        dz      32 dup (?)      ; 32 ZMM registers
```

### The TIMES prefix causes the instruction to be assembled multiple times.

```
zerobuf:        times 64 db 0
```

and even 

```
buffer: db      'hello, world' 
        times 64-$+buffer db ' '
```