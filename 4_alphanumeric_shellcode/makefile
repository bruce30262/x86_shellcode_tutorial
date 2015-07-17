shellcode: alnum.s
	nasm -f elf32 -o code alnum.s && strings code

cbin: alnum.c
	gcc -z execstack -m32 -o alnum.out alnum.c

.PHONY: clean
clean:
	rm *.out *.o *.bin code
