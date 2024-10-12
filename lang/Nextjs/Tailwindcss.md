## tailwind.cssが適用されない問題

下記のようなディレクトリ構造にした場合、components配下にはcssが適用されない。

```
src
    ┣── app
    │   └── fonts
    ├── component
```

### 解決策
componentsフォルダをsrc/appフォルダ以下に配置する。