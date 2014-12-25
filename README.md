*FreePWING program to convert PDIC dictionaries.

written by Kazuhiro Ito <kzhr@d1.dion.ne.jp>

**これは何?
FreePWING (*1) を利用して(テキスト形式ではなく)PDIC形式の辞書を
JIS X 4081形式に変換するツールです。

(*1) http://www.sra.co.jp/people/m-kasahr/freepwing/

**インストール
下記のソフトウェアが必要です。

*FreePWING
もちろん。

*PDIC Toolkit http://lambdapage.org/lexiko/tool-kit/pdic-toolkit.html

*Jcode.pm http://openlab.jp/Jcode/
CPANからも入手可能なはずです。

このツール自体のインストールは任意のディレクトリに展開するだけです。

**使い方
*変換準備
Makefile の SOURCES = に記述されている辞書ファイル名を設定して下さい。
複数の辞書を指定することができます。

次に、pdic-fpw.conf に記述されている各パラメータを設定して下さい。

最後に Makefile の DIR = に記述されているディレクトリ名を pdic-fpw.conf
に記載したディレクトリ名と合わせて下さい。

著作権表示を行う場合は COPYRIGHT_FILE = にファイル名を指定して下さい。

*変換
$ fpwmake 

で辞書(HONMON ファイル)を

$ fpwmake catalogs

で CATALOGS ファイルを

$ fpwmake package

で辞書をパッケージしたzipファイルを生成します。
fpwmake コマンドの実行時に

Makefile:34: warning: overriding commands for target `archive-directory'
fpwutils.mk:607: warning: ignoring old commands for target `archive-directory'

のような warning が出ますが正常です。

**ライセンス
GPL v2 に従います。同梱のCOPYINGファイルを参照して下さい。

**その他
辞書の著作権・ライセンスには十分に注意して下さい。
