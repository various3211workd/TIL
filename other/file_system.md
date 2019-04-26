# file system for Linux

## マウントされているファイルシステム

```shell
$ df -Th
```

## ファイルシステム作成

```shell
$ sudo mkfs -t ext4 /dev/xvdf
```

## 任意の位置にマウントさせ、Linuxからアクセスできるようにする

```shell
# ディレクトリ作成
$ sudo mkdir /data

# マウント
$ sudo mount /dev/xvdf /data
```

