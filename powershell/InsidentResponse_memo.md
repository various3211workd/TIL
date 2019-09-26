# Insident Response時に使えるコマンドのメモ

## プロセスkill

#### 特定のpathに存在するファイルを指定してプロセスを終了する

```powershell
gwmi win32_process | Where-Object {$_.CommandLine -like "*file_path*"}  | % { "$(Stop-Process $_.ProcessID)" }
```

## PC起動関係

#### シャットダウン

```powershell
Stop-Computer -Force
```

#### 再起動

```powershell
Restart-Computer -Force
```

## firewall

#### ルールの追加

```powershell
netsh advfirewall firewall add rule name="Allow Inbound Telnet" dir=in program= %SystemRoot%\System32\tlntsvr.exe remoteip=localsubnet action=allow
```

#### ルールの削除

```powershell
netsh advfirewall firewall delete rule name="Allow Inbound Telnet" program= %SystemRoot%\System32\tlntsvr.exe remoteip=localsubnet action=allow
```

