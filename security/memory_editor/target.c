#include <stdio.h>
#include <windows.h>

int main(void) {

  char *hello = "HELLO WORLD\n";

  while(1) {
    printf("%s", hello);
    Sleep(1000);
  }

  return 0;
}