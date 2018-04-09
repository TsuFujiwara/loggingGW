#PC�̃A�b�v���[�h�t�@�C������[�g�}�V���i����GW�j�ɐݒu�i���̍ہA����GW����resotre_files��t�@�C���͖����Ȃ�j

try
{
    # Load Windows Form
    [void][Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")

    # Load WinSCP .NET assembly (�p�X�͊��ɂ���ĕύX���Ă�������)
    [Reflection.Assembly]::LoadFrom("C:\Program Files (x86)\WinSCP\WinSCPnet.dll") | Out-Null

    # Setup session options
    $sessionOptions = New-Object WinSCP.SessionOptions
    $sessionOptions.Protocol = [WinSCP.Protocol]::sftp
    $ip = (Get-Content SSIp.txt) -as [string[]]
    $sessionOptions.HostName = $ip.trim()
    $sessionOptions.UserName = "conprosys"
    $sessionOptions.Password = "contec"
    $sessionOptions.SshHostKeyFingerprint = "ssh-ed25519 256 gpZwK6sD+/8HYkl5OKgj3GJRzrJjyk8fZ1v+Us/fl40="
    #$sessionOptions.SshHostKeyFingerprint = "�y�t�B���K�[�v�����g ��: ssh-rsa 2048 xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx�z"

    $session = New-Object WinSCP.Session

    try
    {
        # Connect
        $session.Open($sessionOptions)

        # Upload files �o�C�i�����[�h��ݒ�
        $transferOptions = New-Object WinSCP.TransferOptions
        $transferOptions.TransferMode = [WinSCP.TransferMode]::Binary

        #�����[�g�}�V����"/tmp/backup/*"��"C:\tmp\backup\"�Ɂu�ړ��v�B �R�߂̈�����$FALSE�ɂ���ƃR�s�[
        $f1 = (Get-Content CurrentPath.txt) -as [string[]]
        Write-Host $f1
        $f2 = "restore_files\*"
        $f=$f1.trim() + $f2.trim()
        Write-Host $f
        $transferResult = $session.PutFiles($f,"./bacnet/", $TRUE, $transferOptions)

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
    #�G���[���o����_�C�A���O��o���ċC�����Ă�炤
    [System.Windows.Forms.MessageBox]::Show($_.Exception.Message, "�o�b�N�A�b�v�G���[�I",[Windows.Forms.MessageBoxButtons]::OK,[Windows.Forms.MessageBoxIcon]::Error);
    exit 1
}
