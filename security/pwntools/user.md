# Pwntoolsの使い方メモ

## remote
### sshでのremote接続

```python
from pwn import *

s = ssh(host='hostname', user='username', pass='pass', port=port)
p = s.run(./exaple1)
```

### nc

```python
from pwn import *

io = remote('example.com', 80)
io.sendline('example')
```
