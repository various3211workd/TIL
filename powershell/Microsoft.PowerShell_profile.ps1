# vl vompiler
#Import-VisualStudioVars 2017 x86_arm
#Import-VisualStudioVars 2017 amd64

# PowerLine setting
#Import-Module PowerLine
#Set-PowerLinePrompt -Colors "#00DDFF", "#0066FF"

try{
    function gip{
        (Invoke-WebRequest ifconfig.io/ip).Content
    }
    function A_Log{
        cat C:\Windows\System32\LogFiles\Firewall\pfirewall.log -wait -tail 10
    }
    function su{
        Start-Process powershell.exe -Verb runas
    }
    function pw{
        Start-Process powershell.exe
    }
    function npw{
        Start-Process powershell.exe
        kill $pid
    }
    function on-hyper-v{
        bcdedit /set hypervisorlaunchtype auto
    }
    function off-hyper-v{
        bcdedit /set hypervisorlaunchtype off
    }

    # 指定フォルダに移動する
    cd ~

    # param関数を変更する
    function prompt {
        Write-Host "["(pwd)"] >" -ForegroundColor Green
    }

    function mvthis{
        mv C:\Users\ToDo\Downloads\* .
    }
    <#function password{
        Add-type -AssemblyName System.Web;
        [System.Web.Security.Membership]::GeneratePassword(10,3)   
    }#>
	<#
    function sqlmap{
        $a = $args -join " ";
        python C:\tools\sqlmapproject-sqlmap-8eaac41\sqlmap.py $a
	}
    #>

    # いらない変数を削除する
    #$USER = $HOME.Split("\\")[2]
    #remove-variable mypass
    #remove-variable PlainString

    # Aliasをセットする
    Set-Alias vi C:\Users\ToDo\Desktop\因幡物置\vim80-kaoriya-win64-8.0.0596-20170502\vim80-kaoriya-win64\vim.exe
    Set-Alias x32dbg C:\snapshot\release\x32\x32dbg.exe
    Set-Alias x64dbg C:\snapshot\release\x64\x64dbg.exe
    Set-Alias IDA C:\Program*Files\IDA*Freeware*7.0\ida64.exe
    Set-Alias IDA5 'C:\Program Files (x86)\IDA Free\idag.exe'
    Set-Alias upx C:\tools\upx-3.95-win64\upx.exe
    Set-Alias tor C:\tor-win32-0.3.2.10\Tor\tor.exe
    Set-Alias dnspyx86 C:\dnSpy\dnSpy-x86.exe
    Set-Alias dnspy C:\dnSpy\dnSpy.exe
    Set-Alias unzip Expand-Archive
    Set-Alias 7z C:\*\7-Zip\7z.exe
    Set-Alias fcrackzip C:\tools\fcrackzip-1.0-win32\fcrackzip.exe
    Set-Alias strings C:\tools\Strings\strings64.exe
    Set-Alias jhead C:\tools\jhead.exe
    Set-Alias ldd dumpbin
    Set-Alias Editter C:\tools\Tools\HeWin\HeWin.exe
    Set-Alias dex2jar 'C:\Program Files\dex2jar-2.0\d2j-dex2jar.bat'
    Set-Alias csc C:\Windows\Microsoft.NET\Framework64\v4.0.30319\csc.exe
    Set-Alias objdump C:\tools\resource_hacker\ResourceHacker.exe
    Set-Alias volatility C:\tools\volatility_2.6_win64_standalone\volatility_2.6_win64_standalone.exe
    Set-Alias cdb32 "C:\Program Files (x86)\Windows Kits\10\Debuggers\x86\cdb.exe"
    Set-Alias cdb "C:\Program Files (x86)\Windows Kits\10\Debuggers\x64\cdb.exe"
    Set-Alias rp++ "C:\tools\rp-win-x64.exe"
    Set-Alias mel C:\tools\mel.exe
    Set-Alias colortool C:\tools\ColorTool\ColorTool.exe
    Set-Alias peid C:\tools\Tools\PEiD\PEiD.exe
  	Set-Alias ssdeep C:\tools\ssdeep-2.14.1\ssdeep.exe
    Set-Alias CyberCheef C:\tools\CyberChef_v8.31.4\CyberChef_v8.31.4.html
    Set-Alias mimikatz C:\tools\mimikatz_trunk\x64\mimikatz.exe
    Set-Alias dig "C:\Program Files\ISC BIND 9\bin\dig.exe"

    C:\Users\ToDo\lang\powershell\makes\ArpScan.ps1
    C:\Users\ToDo\lang\powershell\makes\Seaser.ps1
    C:\tools\iroiro\tree.ps1
    C:\Users\ToDo\lang\powershell\makes\password.ps1

    Remove-Item alias:curl

    # UTF8表記に変更
    chcp 65001
    #chcp 932
}finally{

}


# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
