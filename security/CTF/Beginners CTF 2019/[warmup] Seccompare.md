# [warmup] Seccompare

```shell
$ ls
seccompare  seccompare_44d43f6a4d247e65c712d7379157d6a9.tar.gz
 $ file seccompare
seccompare: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 3.2.0, BuildID[sha1]=4a607c82ea263205071c80295afe633412cda6f7, not stripped

$ chmod +x seccompare
```

実行する

```shell
$ ./seccompare
usage: ./seccompare flag
$ ./seccompare test
wrong
```

コマンドライン引数でフラグをとっているっぽい。

objdumpでmain関数を見てみる。

```shell
00000000004005e7 <main>:
  4005e7:       55                      push   rbp
  4005e8:       48 89 e5                mov    rbp,rsp
  4005eb:       48 83 ec 40             sub    rsp,0x40
  4005ef:       89 7d cc                mov    DWORD PTR [rbp-0x34],edi
  4005f2:       48 89 75 c0             mov    QWORD PTR [rbp-0x40],rsi
  4005f6:       64 48 8b 04 25 28 00    mov    rax,QWORD PTR fs:0x28
  4005fd:       00 00
  4005ff:       48 89 45 f8             mov    QWORD PTR [rbp-0x8],rax
  400603:       31 c0                   xor    eax,eax
  400605:       83 7d cc 01             cmp    DWORD PTR [rbp-0x34],0x1
  400609:       7f 25                   jg     400630 <main+0x49>
  40060b:       48 8b 45 c0             mov    rax,QWORD PTR [rbp-0x40]
  40060f:       48 8b 00                mov    rax,QWORD PTR [rax]
  400612:       48 89 c6                mov    rsi,rax
  400615:       48 8d 3d 68 01 00 00    lea    rdi,[rip+0x168]        # 400784 <_IO_stdin_used+0x4>
  40061c:       b8 00 00 00 00          mov    eax,0x0
  400621:       e8 ba fe ff ff          call   4004e0 <printf@plt>
  400626:       b8 01 00 00 00          mov    eax,0x1
  40062b:       e9 b1 00 00 00          jmp    4006e1 <main+0xfa>
  400630:       c6 45 d0 63             mov    BYTE PTR [rbp-0x30],0x63
  400634:       c6 45 d1 74             mov    BYTE PTR [rbp-0x2f],0x74
  400638:       c6 45 d2 66             mov    BYTE PTR [rbp-0x2e],0x66
  40063c:       c6 45 d3 34             mov    BYTE PTR [rbp-0x2d],0x34
  400640:       c6 45 d4 62             mov    BYTE PTR [rbp-0x2c],0x62
  400644:       c6 45 d5 7b             mov    BYTE PTR [rbp-0x2b],0x7b
  400648:       c6 45 d6 35             mov    BYTE PTR [rbp-0x2a],0x35
  40064c:       c6 45 d7 74             mov    BYTE PTR [rbp-0x29],0x74
  400650:       c6 45 d8 72             mov    BYTE PTR [rbp-0x28],0x72
  400654:       c6 45 d9 31             mov    BYTE PTR [rbp-0x27],0x31
  400658:       c6 45 da 6e             mov    BYTE PTR [rbp-0x26],0x6e
  40065c:       c6 45 db 67             mov    BYTE PTR [rbp-0x25],0x67
  400660:       c6 45 dc 73             mov    BYTE PTR [rbp-0x24],0x73
  400664:       c6 45 dd 5f             mov    BYTE PTR [rbp-0x23],0x5f
  400668:       c6 45 de 31             mov    BYTE PTR [rbp-0x22],0x31
  40066c:       c6 45 df 73             mov    BYTE PTR [rbp-0x21],0x73
  400670:       c6 45 e0 5f             mov    BYTE PTR [rbp-0x20],0x5f
  400674:       c6 45 e1 6e             mov    BYTE PTR [rbp-0x1f],0x6e
  400678:       c6 45 e2 30             mov    BYTE PTR [rbp-0x1e],0x30
  40067c:       c6 45 e3 74             mov    BYTE PTR [rbp-0x1d],0x74
  400680:       c6 45 e4 5f             mov    BYTE PTR [rbp-0x1c],0x5f
  400684:       c6 45 e5 65             mov    BYTE PTR [rbp-0x1b],0x65
  400688:       c6 45 e6 6e             mov    BYTE PTR [rbp-0x1a],0x6e
  40068c:       c6 45 e7 30             mov    BYTE PTR [rbp-0x19],0x30
  400690:       c6 45 e8 75             mov    BYTE PTR [rbp-0x18],0x75
  400694:       c6 45 e9 67             mov    BYTE PTR [rbp-0x17],0x67
  400698:       c6 45 ea 68             mov    BYTE PTR [rbp-0x16],0x68
  40069c:       c6 45 eb 7d             mov    BYTE PTR [rbp-0x15],0x7d
  4006a0:       c6 45 ec 00             mov    BYTE PTR [rbp-0x14],0x0
  4006a4:       48 8b 45 c0             mov    rax,QWORD PTR [rbp-0x40]
  4006a8:       48 83 c0 08             add    rax,0x8
  4006ac:       48 8b 10                mov    rdx,QWORD PTR [rax]
  4006af:       48 8d 45 d0             lea    rax,[rbp-0x30]
  4006b3:       48 89 d6                mov    rsi,rdx
  4006b6:       48 89 c7                mov    rdi,rax
  4006b9:       e8 32 fe ff ff          call   4004f0 <strcmp@plt>
  4006be:       85 c0                   test   eax,eax
  4006c0:       75 0e                   jne    4006d0 <main+0xe9>
  4006c2:       48 8d 3d cb 00 00 00    lea    rdi,[rip+0xcb]        # 400794 <_IO_stdin_used+0x14>
  4006c9:       e8 f2 fd ff ff          call   4004c0 <puts@plt>
  4006ce:       eb 0c                   jmp    4006dc <main+0xf5>
  4006d0:       48 8d 3d c5 00 00 00    lea    rdi,[rip+0xc5]        # 40079c <_IO_stdin_used+0x1c>
  4006d7:       e8 e4 fd ff ff          call   4004c0 <puts@plt>
  4006dc:       b8 00 00 00 00          mov    eax,0x0
  4006e1:       48 8b 4d f8             mov    rcx,QWORD PTR [rbp-0x8]
  4006e5:       64 48 33 0c 25 28 00    xor    rcx,QWORD PTR fs:0x28
  4006ec:       00 00
  4006ee:       74 05                   je     4006f5 <main+0x10e>
  4006f0:       e8 db fd ff ff          call   4004d0 <__stack_chk_fail@plt>
  4006f5:       c9                      leave
  4006f6:       c3                      ret
  4006f7:       66 0f 1f 84 00 00 00    nop    WORD PTR [rax+rax*1+0x0]
```

するといくつかの文字と比較している処理が見えるので復号する。

フラグ入手