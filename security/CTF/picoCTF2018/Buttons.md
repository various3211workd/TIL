# Buttons
There is a website running at http://2018shell.picoctf.com:65107 (link). Try to see if you can push their buttons. 

リンクを開くとの単のあるページが表示される。

ボタンを押すとさらに`Button2.php`へ遷移するボタンがあり、それを押すとリックロールの動画と文字列が表示される。

```
Button2: ACCESS DENIED
FORM DISABLED. THIS INCIDENT HAS BEEN LOGGED AND REPORTED TO /dev/null
```

Button1とButton2のリクエストを比べてみると

Button1.php => POST  
Button2.php => GET

である。

Button2.phpにPOSTでリクエストを送ってやることでフラグが入手できた。

