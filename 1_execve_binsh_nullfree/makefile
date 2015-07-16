bin: shell.s
	nasm -f elf32 -o shell.o shell.s && ld -m elf_i386 -o shell.bin shell.o

shellcode: shell.s
	nasm -f bin -o code shell.s && xxd -i code

cbin: shell.c
	gcc -z execstack -m32 -o shell.out shell.c

.PHONY: clean
clean:
	rm *.out *.o *.bin code
