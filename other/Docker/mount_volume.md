# ファイルのマウント方法

```powershell
docker run -v [ホストディレクトリの絶対パス]:[コンテナの絶対パス] [イメージ名] [コマンド]
```

## 使用例

```powershell
docker run -v /lib/modules:/lib/modules dummy-img /bin/bash
```