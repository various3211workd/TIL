# rp++
ROP gadget検索ツール。

#### 使い方
```
$ rp++ --file=***.exe --rop=1 --unique > gadgets.txt
```

```
// jmp検索
$ cat gadgets.txt | grep ": jmp"

// pop検索
$ cat gadgets.txt | grep ": pop"
```

pop ecxでecxにポインタのアドレスをセットした後jmp dword [ecx]を実行することで、ポインタが指す関数を呼び出すことができる。

