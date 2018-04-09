start

#�ڑ���iSmart-Save�j��IP�A�h���X����͂�����
cscript ./modules/IPInbox.vbs


#telnet�ɂ�loadcontrollerd�v���Z�X��kill
cscript ./modules/kill.vbs


#����bat�̃f�B���N�g����J�����g�f�B���N�g���Ƃ���
cd /d %~dp0

#�J�����g�f�B���N�g���̃p�X��t�@�C���o��
call :trim %~dp0
echo %~dp0> ./modules/CurrentPath.txt

#��������f�B���N�g����./backups/�ȉ��ɍ쐬
echo off
 
echo %date%
echo %time%
 
set yyyy=%date:~0,4%
set mm=%date:~5,2%
set dd=%date:~8,2%
 
set time2=%time: =0%
 
set hh=%time2:~0,2%
set mn=%time2:~3,2%
set ss=%time2:~6,2%
 
set dirname=%yyyy%-%mm%%dd%-%hh%%mn%%ss%

cd ./backups/ 
mkdir %dirname%_backup
cd ../

#�J�����g�f�B���N�g���̃p�X��t�@�C���o��
echo %dirname%_backup> ./modules/DirName.txt

#PowerShell��Ăяo���A�ޯ����߂�擾
cd ./modules/
powershell -NoProfile -ExecutionPolicy Unrestricted ./transfer.ps1

#�t�@�C����R�s�[����
#cd ../backups/%dirname%_backup
#copy * "../../uploads/"
#cd ../../modules/

#PowerShell��Ăяo���A�t�@�C����X�g�A
#powershell -NoProfile -ExecutionPolicy Unrestricted ./restore.ps1
cd ../


#telnet�ɂ�loadcontrollerd�v���Z�X�𐶂���
cscript ./modules/restart.vbs

exit