# unzip

## 問題

> Can you unzip this file and get the flag?

## 解答

```shell
todo@DESKTOP-K3BB6JA [/mnt/c/Users/ToDo/CTF/Pwnable/picoCTF2019]                         $ file flag.zip                                                                          flag.zip: Zip archive data, at least v2.0 to extract

todo@DESKTOP-K3BB6JA [/mnt/c/Users/ToDo/CTF/Pwnable/picoCTF2019]                         $ unzip flag.zip                                                                         Archive:  flag.zip
  inflating: flag.png

todo@DESKTOP-K3BB6JA [/mnt/c/Users/ToDo/CTF/Pwnable/picoCTF2019]                         $ ls                                                                                     flag.png  flag.zip
```

画像を見るとflagが書いてある