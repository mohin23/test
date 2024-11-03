#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int main(){
	char *ptr = (char *)malloc(20);
	printf("hello world");
	free(ptr);
	return 0;
}
