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
}

int main(){
	char *str = "s";
	lengthOfLastWord(str);
	
	return 0;
}
