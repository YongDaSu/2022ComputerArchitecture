#include <stdio.h>
#include <string.h>

int lengthOfLastWord(char *s){
	int j = strlen(s)-1;
	int length = 0;
	
	while(s[j] == ' '){
		j--;
	}
	while(s[j] != ' ' && j>=0){
		j--;
		length++;
	}
	printf("length of last word is %d.", length);
	printf("\n");
}

int main(){
	char *str1 = "Hello World";
	char *str2 = "i am a student  ";
	char *str3 = "a";
	lengthOfLastWord(str1);
	lengthOfLastWord(str2);
	lengthOfLastWord(str3);
	
	return 0;
}

/***terminal output
length of last word is 5.
length of last word is 7.
length of last word is 1.

--------------------------------
Process exited after 0.02883 seconds with return value 0
Press any key to continue . . .
***/
