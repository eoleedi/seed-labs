#include<stdio.h>
void main(){
	char* shell = getenv("MYSHELL");
	char* optionp = getenv("OPTIONP");
	if (shell)
		printf("MYSHELL: %x\n", (unsigned int) shell);
	if (optionp)
		printf("OPTIONP: %x\n", (unsigned int) optionp);
}
