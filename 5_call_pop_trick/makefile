orw: orw.s
	nasm -f elf32 -o orw.o orw.s && ld -m elf_i386 -o orw.bin orw.o

shell: shell.s
	nasm -f elf32 -o shell.o shell.s && ld -m elf_i386 -o shell.bin shell.o

orw_shellcode: orw.s
	nasm -f bin -o code orw.s && xxd -i code

shell_shellcode: shell.s
	nasm -f bin -o code shell.s && xxd -i code

corw: orw.c
	gcc -z execstack -m32 -o orw.out orw.c

cshell: shell.c
	gcc -z execstack -m32 -o shell.out shell.c

.PHONY: clean
clean:
	rm *.out *.o *.bin code
