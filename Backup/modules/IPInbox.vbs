''Inbox�ɐڑ���i����GW�j��IP�A�h���X����͂�����B���͂��ꂽIP�A�h���X��txt�t�@�C���ɏo��
Dim Input
Input = InputBox("�ڑ���i����GW�j��IP�A�h���X����͂��Ă��������B","IP�A�h���X","192.168.1.254","1500","1500")

Dim fso
Set fso = WScript.CreateObject("Scripting.FileSystemObject")

' �����o���t�@�C���̎w�� (����͐V�K�쐬����)
Dim outputFile
Set outputFile = fso.OpenTextFile("./modules/SSIp.txt", 2, True)

' Input�ǂݍ��݁A�����o���t�@�C���ɏ����o��
 outputFile.WriteLine Input
