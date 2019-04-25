# fly me to the moon

```
javascript game.

can you clear with bypass prevent cheating system?
```

シューティングゲームが出てくるのでチートを行うという問題らしい。

ソースコードを見ると、javascriptで書かれてある難読化されたコードが見える。

面倒そうなので別のアプローチを試す。  
とりあえず一度遊んでみることにする。

すると

```
You need get the score 31337. XD
```

と出てくる。  
サーバとのやり取りで何かできないのかを見てみることに

BurpSuiteを起動し、ゲームスタート。

再びゲームオーバーになりその時のセッションの中身を見てみると`score=1`という値があるのが見える。

ここを31337に書き換えてやり、送信するとフラグが入手できた。

