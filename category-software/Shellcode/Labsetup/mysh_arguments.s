section .text
  global _start
    _start:
      ; Store the argument string on stack
      xor  eax, eax 
      push eax          ; Use 0 to terminate the string

      mov edx, "-lax"
      shl edx, 8
      shr edx, 8
      push edx          ; Push "-la" on stack

      xor edx, edx
      mov dx, "ls"
      push edx          ; Push "ls" on stack
      mov edx, esp      ; Store string address

      push eax          ; Use 0 to terminate the string
      xor ecx, ecx
      mov cx, "-c" 
      push ecx          ; Push "-c" on stack
      mov ecx, esp      ; Store string address
	
      push eax          ; Use 0 to terminate the string
      push "//sh"
      push "/bin"
      mov  ebx, esp     ; Get the string address

      ; Construct the argument array argv[]
      push eax          ; argv[3] = 0
      push edx          ; argv[2] points "ls -la"
      push ecx          ; argv[1] points "-c"
      push ebx          ; argv[0] points "/bin//sh"
      mov  ecx, esp     ; Get the address of argv[]
   
      ; For environment variable 
      xor  edx, edx     ; No env variables 

      ; Invoke execve()
      xor  eax, eax     ; eax = 0x00000000
      mov   al, 0x0b    ; eax = 0x0000000b
      int 0x80
