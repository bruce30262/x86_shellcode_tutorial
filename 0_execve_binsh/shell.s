BITS 32

global _start

_start:
    push 0x0068732f
    push 0x6e69622f
    mov ebx, esp

    mov eax, 0xb    
    mov ecx, 0x0    
    mov edx, 0x0    
    int 0x80
