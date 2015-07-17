bin: orw.s
	nasm -f elf32 -o orw.o orw.s && ld -m elf_i386 -o orw.bin orw.o

shellcode: orw.s
	nasm -f bin -o code orw.s && xxd -i code

cbin: orw.c
	gcc -z execstack -m32 -o orw.out orw.c

.PHONY: clean
clean:
	rm *.out *.o *.bin code
