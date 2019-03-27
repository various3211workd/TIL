#str

## strcpy
```c
char *szSource = "Hello World !";
char szTarget[MAX_PATH];

strcpy(szTarget, szSource);
printf("%s\n", szTarget);
```

#### 文字数取得
Xの長さを取得している

ZEROフラグが0で、ecx > 0担っている間繰り返し
```nasm
mov edi, X
repne scas, byte ptr es:[edi]
not ecx
```

#### 文字列のコピー
`shr`でシフト演算している。  
```
shr (Shift + Left)
shl (Shift + Right)
```


```nasm
shr ecx, 2
rep movs dword ptr es:[edi], dword ptr ds:[esi]
```
右に2回シフトしている。つまり4で割っていることと同じ。  
商はecxに入り、`rep`でecx回繰り返しコピーをしている。

```
ecx = `Hello World!`の14文字 / 4
for i = 0 ; i < ecx ; i++ {
  dwordなので4バイトを`Hello World!`からコピー
}
```

```nasm
mov ecx, eax
and ecx, 3
rep movs byte ptr es:[edi], byte ptr ds:[edi]
```

残りの2バイトもコピーする。  
13 % 3の余りが2なので残りの2バイトをコピーできる
