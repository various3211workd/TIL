# logon

## 問題
> The factory is hiding things from all of its users. Can you login as logon and find what they've been looking at? https://2019shell1.picoctf.com/problem/21895/ (link) or http://2019shell1.picoctf.com:21895

## 解答

login formが表示される。2018でも見たな

```
user: admin
pass: password
```

でログインすると

```
Success: You logged in! Not sure you'll be able to see the flag though. 
```

が表示される

cookieを見ると

```
password=password; username=admin; admin=False
```

となっているのでここを`True`にしてみる

```
Flag: picoCTF{th3_c0nsp1r4cy_l1v3s_3294afa0}
```