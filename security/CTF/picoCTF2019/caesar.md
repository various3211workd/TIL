# caesar

## 問題
> Decrypt this message. You can find the ciphertext in /problems/caesar_4_33e5994add902b2321c8c38c8b962eff on the shell server.

## 解答

渡されたファイルを見てみる

```shell
$ cat ciphertext
picoCTF{odaeeuzsftqdgnuoazxvymiumq}
```

問題文が`seaser`なのでシーザ暗号だとわかる。

[サイト](https://cryptii.com/pipes/caesar-cipher)で復号する


何度か復号し、意味のありそうな文字列が見えたところで送信するとflagだった

```
crossingtherubiconljmawiae
```