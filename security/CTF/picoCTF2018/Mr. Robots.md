# Mr. Robots

Do you see the same things I see? The glimpses of the flag hidden away? http://2018shell.picoctf.com:10157 (link)

リンクを開くと静的なページが開かれる。  
一見それ以上の遷移が無いように見える。

参照しているcssにも異常がなくわけがわからない。

名前にRobotのつく攻撃はSSLの脆弱性を突いたものしか知らないので、それ以外を調べてみる。

robot webで検索を書けると`robots.txt`というものが表示されるのでURLを指定して移動。

```
User-agent: *
Disallow: /143ce.html
```

が表示される。

`/143ce.html`に移動するとフラグが入手できる。
