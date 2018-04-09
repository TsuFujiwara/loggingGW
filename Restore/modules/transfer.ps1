#リモートマシン（建物GW）のﾊﾞｯｸｱｯﾌﾟすべてをPCに取得（その際、Smart-Save側のファイルは無くなる）

try
{
    # Load Windows Form
    [void][Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")

    # Load WinSCP .NET assembly (パスは環境によって変更してください)
    [Reflection.Assembly]::LoadFrom("C:\Program Files (x86)\WinSCP\WinSCPnet.dll") | Out-Null

    # Setup session options
    $sessionOptions = New-Object WinSCP.SessionOptions
    $sessionOptions.Protocol = [WinSCP.Protocol]::sftp
    $ip = (Get-Content SSIp.txt) -as [string[]]
    $sessionOptions.HostName = $ip.trim()
    $sessionOptions.UserName = "conprosys"
    $sessionOptions.Password = "contec"
    $sessionOptions.SshHostKeyFingerprint = "ssh-ed25519 256 gpZwK6sD+/8HYkl5OKgj3GJRzrJjyk8fZ1v+Us/fl40="
    #$sessionOptions.SshHostKeyFingerprint = "【フィンガープリント 例: ssh-rsa 2048 xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx】"


    $session = New-Object WinSCP.Session

    try
    {
        # Connect
        $session.Open($sessionOptions)

        # Upload files バイナリモードを設定
        $transferOptions = New-Object WinSCP.TransferOptions
        $transferOptions.TransferMode = [WinSCP.TransferMode]::Binary

        #リモートマシンの"/tmp/backup/*"を"C:\tmp\backup\"に「移動」。 ３つめの引数を$FALSEにするとコピー
        $f1 = (Get-Content CurrentPath.txt) -as [string[]]
        Write-Host $f1
        $f2 = (Get-Content DirName.txt) -as [string[]]
        Write-Host $f1"backups\"$f2"\"
        $f3 = "backups\"
        $f4 = "\"
        $f=$f1.trim() + $f3.trim() + $f2.trim() + $f4.trim()
        Write-Host $f
        $transferResult = $session.GetFiles("./bacnet/*",$f, $true, $transferOptions)


        # Throw on any error
        $transferResult.Check()

        # Print results
        foreach ($transfer in $transferResult.Transfers)
        {
            Write-Host ("Download of {0} succeeded" -f $transfer.FileName)
        }
    }
    finally
    {
        # Disconnect, clean up
        $session.Dispose()
    }

    exit 0
}
catch [Exception]
{
    #エラーが出たらダイアログを出して気がついてもらう
    [System.Windows.Forms.MessageBox]::Show($_.Exception.Message, "バックアップエラー！",[Windows.Forms.MessageBoxButtons]::OK,[Windows.Forms.MessageBoxIcon]::Error);
    exit 1
}
