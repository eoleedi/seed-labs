section .text
  global _start
    _start:
      ; Store environment variable string on stack
      xor eax, eax
      push eax
      xor ebx, ebx
      mov bl, "4"
      push ebx
      push "=123"
      push "cccc"
      mov ebx, esp

      push eax
      push "5678"
      push "bbb="
      mov ecx, esp

      push eax
      push "1234"
      push "aaa="
      mov edx, esp

      ; For environment variable 
      push eax
      push ebx
      push ecx
      push edx
      mov edx, esp

      ; Store the argument string on stack
      xor  eax, eax 
      push eax          ; Use 0 to terminate the string
      push "/env"
      push "/bin"
      push "/usr" 
      mov  ebx, esp     ; Get the string address

      ; Construct the argument array argv[]
      push eax          ; argv[1] = 0
      push ebx          ; argv[0] points "/usr/bin/env"
      mov  ecx, esp     ; Get the address of argv[]

      ; Invoke execve()
      xor  eax, eax     ; eax = 0x00000000
      mov   al, 0x0b    ; eax = 0x0000000b
      int 0x80
