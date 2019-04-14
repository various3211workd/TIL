# Debug環境用のコンテナの作成

```dockerfile
From alpine
RUN apk update
RUN apk upgrade
RUN apk add gdb
```

