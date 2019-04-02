# Thread Execution Hijacking

## 概要
プロセスの既存のスレッドを利用する。

※ マルウェア解析時の特徴をメモする。

## 検知
#### 特徴
* CreateToolhelp32Snapshot()
* Thread32First()
* OpenThread()
* SuspendThread()
* VirtualAllocEx()
* WriteProcessMemory()

## 動作

1. OpenThreadで標的スレッドへのハンドルを取得

2. SuspendThreadを呼び出しスレッドを中断モードにする
 > ```c
 > SuspendThread(HANDLE hThread);  
 > ```

 > サスペンドカウンタという概念がある。  
 > 0 => 実行 SuspendThread()でインクリメント  
 > 1 => 待機 ResumeThread()でデクリメント  

3. GetThreadContext

4. 悪意のあるコードをインジェクションする
 > VirtualAllocExとWriteProcessMemoryなどを使用し、メモリを割り当ててコードを実行する。  

5. SetThreadContext
 > ターゲットスレッドの次の命令のアドレスを含むレジスタ(EIPレジスタ)を変更する。

6. ResumeThreadを呼び出し、スレッドを再開する。

7. 悪意のあるコードが実行される

## 技術的な問題
攻撃者の観点からは、システムコールの途中でスレッドを中断して再開するとシステムがクラッシュする可能性があるため、SIRアプローチは問題になる可能性がある。これを回避するために、EIPレジスタがNTDLL.dllの範囲内にある場合、より高度なマルウェアが再開して後で再試行する。

