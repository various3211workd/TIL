# what base is this?
To be successful on your mission, you must be able read data represented in different ways, such as hexadecimal or binary. Can you get the flag from this program to prove you are ready? Connect with nc 2018shell.picoctf.com 64706. 

端末から接続すると文章が表示される。

```
We are going to start at the very beginning and make sure you understand how data is stored.
test
Please give me the 01110100 01100101 01110011 01110100 as a word.
To make things interesting, you have 30 seconds.
Input:
```
`01110100 01100101 01110011 01110100`を文字にすると`test`になるのでそれを入力する。

するとまた文字が表示される。

```
Please give me the 74696d65 as a word.
Input:
```

今度は2文字区切りにすればよさそうだ。

入力を終えると又次の問題が出てくる。

```
Please give me the  143 141 153 145 as a word.
Input:
```

これは8進数で表示してあるのでdecodeする。



この問題にはInputするまでの時間制限がある。

そのためdecodeする用のscriptを書くことにした。

```pyhon
import sys
import re

# question 1
import sys
import re

# question 1
print("\nquestion 1")
for temp in input().split(" "):
  print(chr(int(temp, 2)), end="")

# question 2
print("\nquestion 2")
for temp in re.split('(..)', input())[1::2]:
  print(chr(int(temp, 16)), end="")

# question 3
print("\nquestion 3")
for temp in input().split(" "):
  print(chr(int(temp, 8)), end="")

```

無事フラグが入手できた。

