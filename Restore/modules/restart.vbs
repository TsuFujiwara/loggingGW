''ssh�ڑ����Aloadcontrollerd�v���Z�X�𐶂���

Dim fso
Set fso = WScript.CreateObject("Scripting.FileSystemObject")

' �ǂݍ��݃t�@�C���̎w�� (���΃p�X�Ȃ̂ł��̃X�N���v�g�Ɠ����t�H���_�ɒu���Ă�������)
Dim inputFile
Set inputFile = fso.OpenTextFile("./modules/SSIp.txt", 1, False, 0)

' �ǂݍ��݃t�@�C������1�s���ǂݍ��݁A�����o���t�@�C���ɏ����o���̂�ŏI�s�܂ŌJ��Ԃ�
Do Until inputFile.AtEndOfStream
  Dim lineStr
  lineStr = inputFile.ReadLine
Loop

' �o�b�t�@�� Flush ���ăt�@�C�������
inputFile.Close

'ssh�ڑ�
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