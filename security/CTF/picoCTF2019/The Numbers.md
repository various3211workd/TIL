# The Numbers

# 問題

# 解答

画像が渡され、表示すると以下のような文字の並びが表示される

```
16 9 3 15 3 20 6 { 20 8 5 14 21 13 2 5 18 19 13 1 19 15 14 }
```

始めの7文字は`picoCTF`なのでそこから考える

わかりやすいのは`C`で、3番目のアルファベットが`c`であることから残りのアルファベットがわかる

```
a b c d e f g h i j
k l m n o p q r s t
u v w x y z
```

```
p i c o c t f {thenumbersmason}
```

全部大文字にしたら通った

```
PICOCTF{THENUMBERSMASON}
```