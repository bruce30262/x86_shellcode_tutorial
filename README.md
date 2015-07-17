# x86_shellcode_tutorial
A training course for BambooFox  

## Building
### 0_execve_binsh ~ 3_open_read_write_position_independent  
All the building process can be classify as the following commands:  

Assemble the `.s` file into the `.bin` file (executable)
```
make bin
```
View the machine code (shellcode)
```
make shellcode
```
Compile the `.c` file and test the machine code ( shellcode )
```
make cbin && ./[filename].out
```

### 4_alphanumeric_shellcode
There's no `bin` target in the `4_alphanumeric_shellcode`'s makefile  
it can only view shellcode or compile the `.c` file and test the shellcode

### 5_call_pop_trick
Assemble `orw.s` into `orw.bin`
```
make orw
```
Assemble `shell.s` into `shell.bin`
```
make shell
```
View `orw.s`'s machine code ( shellcode )
```
make orw_shellcode
```
View `shell.s`'s machine code ( shellcode )
```
make shell_shellcode
```
Compile `orw.c` and test the machine code ( shellcode )
```
make corw && ./orw.out
```
Compile `shell.c` and test the machine code ( shellcode )
```
make cshell && ./shell.out
```

You can clean the `*.bin`, `*.o`, `*.out`... by using `make clean`

