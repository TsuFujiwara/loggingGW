Smart-Saveへのバックアップリストア(2016/09/25現在： SSのIPは192.168.1.254の場合のみ対応）

１．Restore.batをダブルクリック
　　（注）処理が終わるまで他の操作をしないこと！
２．Backupsフォルダにﾊﾞｯｸｱｯﾌﾟ取得
３．restore_filesフォルダ内にあるファイルすべてをftp://192.168.1.254/../etc/bacnet/へ移動
４．Smart-SaveのOPEが点滅し始めたら処理終了



【作者忘備録】
リストアされるもののIPアドレスが192.168.1.254でない場合でも、
最後のtelnetでloadcontrollerdプロセスを走らせるまで192.168.1.254が有効

⇒最初に192.168.1.254以外のIPアドレスを指定した場合、最後までそのIPが通る