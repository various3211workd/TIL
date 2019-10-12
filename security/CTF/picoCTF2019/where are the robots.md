# where are the robots

## 問題
> Can you find the robots? https://2019shell1.picoctf.com/problem/45102/ (link) or http://2019shell1.picoctf.com:45102

## 解答
`robots.txt`にアクセスすると

```
User-agent: *
Disallow: /8e32f.html
```

と書いてある。

アクセスするとフラグを入手できる