# radare2を使ったbinaryの編集メモ

## 1. 書き換えモードにする

```
$ r2 FILE_NAME
[r2]$ oo+
```

# 2. Visualmodeにする（みやすいので）

```
[r2]$ V
press p
# 書き換えたい箇所まで来たら
press c

# カードルを該当箇所へ移動させ（PgUP, PgDown）
press i

# insert modeになるので入力
9090
```
