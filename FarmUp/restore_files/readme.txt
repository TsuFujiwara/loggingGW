【手順】
１．Smart-Save下位ポートとPCをLANケーブルで接続

２．WEBブラウザからSmart-Saveの停止

３．エクスプローラ等から、ftp://192.168.1.254/../usr/local/bin にアクセス
　　ID：root
　　PW: root

４．loadbcontrollerd及びmodbus.koをコピー＆ペーストで上書き
　　さらに上記ファイルを右クリックし、「プロパティ」にて権限変更（すべてにチェック）

５．ftp://192.168.1.254/../etc/にアクセスし、sysctl.confを上書き
　　ID：root
　　PW: root
　　さらに上記ファイルを右クリックし、「プロパティ」にて権限変更（すべてにチェック）

６. WEBブラウザからSmart-Saveの再起動

