# rp++
ROP gadget検索ツール。

#### 使い方
```
$ rp+++ --file=***.exe --rop=1 --unique > gadgets.txt
```

```
// jmp検索
$ grep ": jmp" gadgets.txt

// pop検索
$ grep ": pop" gadgets.txt
```

pop ecxでecxにポインタのアドレスをセットした後jmp dword [ecx]を実行することで、ポインタが指す関数を呼び出すことができる。

