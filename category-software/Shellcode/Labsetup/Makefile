TARGET = mysh mysh2 mysh_64 mysh_arguments mysh_env mysh2_env mysh_64_bash
  
all: $(TARGET)

mysh: mysh.s
	nasm -f elf32 $@.s -o $@.o
	ld -m elf_i386 $@.o -o $@

mysh2: mysh2.s
	nasm -f elf32 $@.s -o $@.o
	ld --omagic -m elf_i386 $@.o -o $@
mysh2_env: mysh2_env.s
	nasm -f elf32 $@.s -o $@.o
	ld --omagic -m elf_i386 $@.o -o $@

mysh_64: mysh_64.s
	nasm -f elf64 $@.s -o $@.o
	ld $@.o -o $@

mysh_64_bash: mysh_64_bash.s
	nasm -f elf64 $@.s -o $@.o
	ld $@.o -o $@

mysh_arguments: mysh_arguments.s
	nasm -f elf32 $@.s -o $@.o
	ld -m elf_i386 $@.o -o $@

mysh_env: mysh_env.s
	nasm -f elf32 $@.s -o $@.o
	ld -m elf_i386 $@.o -o $@

clean:
	rm -f *.o *.out $(TARGET)

