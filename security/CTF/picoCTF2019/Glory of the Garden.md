# Glory of the Garden

## 問題

## 解答

```shell
todo@DESKTOP-K3BB6JA [/mnt/c/Users/ToDo/CTF/Pwnable/picoCTF2019]                         $ ls                                                                                     garden.jpg

todo@DESKTOP-K3BB6JA [/mnt/c/Users/ToDo/CTF/Pwnable/picoCTF2019]                         $ file garden.jpg                                                                        garden.jpg: JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, baseline, precision 8, 2999x2249, components 3

todo@DESKTOP-K3BB6JA [/mnt/c/Users/ToDo/CTF/Pwnable/picoCTF2019]                         $ strings garden.jpg | grep 'pico'                                                       Here is a flag "picoCTF{more_than_m33ts_the_3y35a97d3bB}"
```