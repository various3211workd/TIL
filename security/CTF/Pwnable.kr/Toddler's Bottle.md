# fd

```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
char buf[32];
int main(int argc, char* argv[], char* envp[]){
        if(argc<2){
                printf("pass argv[1] a number\n");
                return 0;
        }
        int fd = atoi( argv[1] ) - 0x1234;
        int len = 0;
        len = read(fd, buf, 32);
        if(!strcmp("LETMEWIN\n", buf)){
                printf("good job :)\n");
                system("/bin/cat flag");
                exit(0);
        }
        printf("learn about Linux file IO\n");
        return 0;

}
```

`0x1234`は`4660`
あとは`LETMEWIN`を入力するだけ

```
fd@prowl:~$ ./fd
pass argv[1] a number
fd@prowl:~$ ./fd 4660
LETMEWIN
good job :)
mommy! I think I know what a file descriptor is!!
fd@prowl:~$ 
```

# random
```c
#include <stdio.h>

int main(){
        unsigned int random;
        random = rand();        // random value!

        unsigned int key=0;
        scanf("%d", &key);

        if( (key ^ random) == 0xdeadbeef ){
                printf("Good!\n");
                system("/bin/cat flag");
                return 0;
        }

        printf("Wrong, maybe you should try 2^32 cases.\n");
        return 0;
}
```

ランダムが機能してないのでgdbで値を調べる。

```
gdb-peda$ disas main
Dump of assembler code for function main:
   0x00000000004005f4 <+0>:     push   rbp
   0x00000000004005f5 <+1>:     mov    rbp,rsp
   0x00000000004005f8 <+4>:     sub    rsp,0x10
   0x00000000004005fc <+8>:     mov    eax,0x0
   0x0000000000400601 <+13>:    call   0x400500 <rand@plt>
   0x0000000000400606 <+18>:    mov    DWORD PTR [rbp-0x4],eax
   0x0000000000400609 <+21>:    mov    DWORD PTR [rbp-0x8],0x0
   0x0000000000400610 <+28>:    mov    eax,0x400760
   0x0000000000400615 <+33>:    lea    rdx,[rbp-0x8]
   0x0000000000400619 <+37>:    mov    rsi,rdx
   0x000000000040061c <+40>:    mov    rdi,rax
   0x000000000040061f <+43>:    mov    eax,0x0
   0x0000000000400624 <+48>:    call   0x4004f0 <__isoc99_scanf@plt>
   0x0000000000400629 <+53>:    mov    eax,DWORD PTR [rbp-0x8]
   0x000000000040062c <+56>:    xor    eax,DWORD PTR [rbp-0x4]
   0x000000000040062f <+59>:    cmp    eax,0xdeadbeef
   0x0000000000400634 <+64>:    jne    0x400656 <main+98>
   0x0000000000400636 <+66>:    mov    edi,0x400763
   0x000000000040063b <+71>:    call   0x4004c0 <puts@plt>
   0x0000000000400640 <+76>:    mov    edi,0x400769
   0x0000000000400645 <+81>:    mov    eax,0x0
   0x000000000040064a <+86>:    call   0x4004d0 <system@plt>
   0x000000000040064f <+91>:    mov    eax,0x0
   0x0000000000400654 <+96>:    jmp    0x400665 <main+113>
   0x0000000000400656 <+98>:    mov    edi,0x400778
   0x000000000040065b <+103>:   call   0x4004c0 <puts@plt>
   0x0000000000400660 <+108>:   mov    eax,0x0
   0x0000000000400665 <+113>:   leave
   0x0000000000400666 <+114>:   ret
End of assembler dump.
```

`xor    eax,DWORD PTR [rbp-0x4]`にブレークポイントを張る

```
gdb-peda$ b *main+56
```

`1234`を入力したときの値が`0x6b8b41b5`なので
0x6b8b4567
0x6b8b6268