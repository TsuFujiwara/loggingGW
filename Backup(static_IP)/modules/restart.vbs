''ssh接続し、loadcontrollerdプロセスを生かす

Dim fso
Set fso = WScript.CreateObject("Scripting.FileSystemObject")

' 読み込みファイルの指定 (相対パスなのでこのスクリプトと同じフォルダに置いておくこと)
Dim inputFile
Set inputFile = fso.OpenTextFile("./modules/SSIp.txt", 1, False, 0)

' 読み込みファイルから1行ずつ読み込み、書き出しファイルに書き出すのを最終行まで繰り返す
Do Until inputFile.AtEndOfStream
  Dim lineStr
  lineStr = inputFile.ReadLine
Loop

' バッファを Flush してファイルを閉じる
inputFile.Close

'ssh接続
set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.AppActivate "ABC"
WScript.Sleep 1000
WshShell.SendKeys "ssh conprosys@"&lineStr
WshShell.SendKeys "{ENTER}"
WScript.Sleep 1000
WshShell.SendKeys "contec"
WshShell.SendKeys "{ENTER}"
WScript.Sleep 1000
WshShell.SendKeys "sudo systemserviced"
WshShell.SendKeys "{ENTER}"
WScript.Sleep 1000
WshShell.SendKeys "sudo bacnetd"
WshShell.SendKeys "{ENTER}"
WScript.Sleep 1000
WshShell.SendKeys "exit~"
WshShell.SendKeys "{ENTER}"