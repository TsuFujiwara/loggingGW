''Inboxに接続先（建物GW）のIPアドレスを入力させる。入力されたIPアドレスはtxtファイルに出力
Dim Input
Input = InputBox("接続先（建物GW）のIPアドレスを入力してください。","IPアドレス","192.168.1.254","1500","1500")

Dim fso
Set fso = WScript.CreateObject("Scripting.FileSystemObject")

' 書き出しファイルの指定 (今回は新規作成する)
Dim outputFile
Set outputFile = fso.OpenTextFile("./modules/SSIp.txt", 2, True)

' Input読み込み、書き出しファイルに書き出す
 outputFile.WriteLine Input
