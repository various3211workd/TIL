# Insp3ct0r

## 問題
> Kishor Balan tipped us off that the following code may need inspection: https://2019shell1.picoctf.com/problem/21519/ (link) or http://2019shell1.picoctf.com:21519

## 解答

linkを開いてソースコードを見る

コメントにフラグの一部が書いてある

```html
<!doctype html>
<html>
  <head>

...


<!-- Html is neat. Anyways have 1/3 of the flag: picoCTF{tru3_d3 -->
      </div>
```

cssとjavascriptのファイルを見てみる

* css

```scss
div.container {
    width: 100%;
}

...

/* You need CSS to make pretty pages. Here's part 2/3 of the flag: t3ct1ve_0r_ju5t */
```

* javascript

```javascript
function openTab(tabName,elmnt,color) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");

...

/* Javascript sure is neat. Anyways part 3/3 of the flag: _lucky?e85ef63c} */
```


