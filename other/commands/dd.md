# dd commands

## デバイス・ディスクのコピー

`/dev/ad0`を`/dev/ad1`にコピーする。  
※ディスクが同容量でなくてはならない

```shell
$ dd if=/dev/ad0 of=/dev/ad1
```