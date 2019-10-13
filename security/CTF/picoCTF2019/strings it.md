# strings it

## 問題
> Can you find the flag in file without running it? You can also find the file in /problems/strings-it_5_1fd17da9526a76a4fffce289dee10fbb on the shell server.

## 解答

ファイルを見てみるとものすごく長い文字列がたくさん出てくる

`strings`で意味のある文字列を拾い、`grep`で絞る

```shell
$ strings strings | grep 'picoCTF'
picoCTF{5tRIng5_1T_dd38f284}
```

