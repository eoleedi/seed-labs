section .text
  global _start
    _start:
	BITS 32
	jmp short two
    one:
		pop ebx
		xor eax, eax
		mov [ebx+12], eax		; Add \0 to the end of the string "/usr/bin/env"
		mov [ebx+16], ebx  	; Construct argv[] and push the address of ebx (AAAA) to argv[0]
		mov [ebx+20], eax	; Add 0 to argv[1] (****)
		lea ecx, [ebx+16] 	; set ecx to the address of argv[]

		; For environment variables
		mov [ebx+28], eax
		mov [ebx+36], eax
		lea edx, [ebx+24]
		mov [ebx+40], edx
		lea edx, [ebx+32]
		mov [ebx+44], edx
		mov [ebx+48], eax
		lea edx, [ebx+40]
		
		; Invoke execve()
		mov al,  0x0b		
		int 0x80
    two:
		call one
		db '/usr/bin/env****AAAA****a=11****b=22****BBBBCCCC****' 
