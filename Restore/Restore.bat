start

#接続先（Smart-Save）のIPアドレスを入力させる
cscript ./modules/IPInbox.vbs


#telnetにてloadcontrollerdプロセスをkill
cscript ./modules/kill.vbs


#このbatのディレクトリをカレントディレクトリとする
cd /d %~dp0

#カレントディレクトリのパスをファイル出力
call :trim %~dp0
echo %~dp0> ./modules/CurrentPath.txt

#日時入りディレクトリを./backups/以下に作成
@echo off
 
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

#カレントディレクトリのパスをファイル出力
echo %dirname%_backup> ./modules/DirName.txt

#PowerShellを呼び出し、ﾊﾞｯｸｱｯﾌﾟを取得
cd ./modules/
powershell -NoProfile -ExecutionPolicy Unrestricted ./transfer.ps1


#PowerShellを呼び出し、ファイルをリストア
powershell -NoProfile -ExecutionPolicy Unrestricted ./restore.ps1
cd ../


#telnetにてloadcontrollerdプロセスを生かす
cscript ./modules/restart.vbs

exit