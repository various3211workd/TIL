# Pwntoolsの使い方メモ

## sshでのremote接続

```python
from pwn import *

s = ssh(host='hostname', user='username', pass='pass', port=port)
s.run(./exaple1)
```