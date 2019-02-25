# Process Hollowing

## 概要
インジェクション系の攻撃の一種。  
正規のプロセスの中に実行したいプロセスのコードを埋め込むもの。  
※ マルウェア解析時の特徴をメモする。

## 検知
#### 特徴
* dwCreationFlags = 4
* CreateProcess()
* GetThreadContext()
* NtUnwrapViewOfSection()

#### 親プロセスでの判断
正規のプロセスを起動するのはマルウェアになるため、親のプロセスが不審なものかで判断する。

#### kernel landの情報との不一致の確認

#### メモリのアクセス権
コードを注入するためにreadとwriteのアクセス権限が必要。  
カーネルが常時設定するアクセス権は`WRITECOPY`  
PAGE_EXECUTE_READWRITEが設定されていると不審。
