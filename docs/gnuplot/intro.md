# はじめに

[gnuplot](http://www.gnuplot.info/) はUnixやWindows、Macなどの様々なプラットフォーム上で動く、簡単にデータや関数のプロットができる描画ツールです。
線や点、等高線、ベクトル場などを、2Dおよび3Dで描くことができます。

使い始めると奥が深く様々なことができるのですが、そのためにはいくつかのコマンドを覚える必要があります。
ここでは、その中でも最も基本的なものについて説明をしていきます。
ここに書かれている機能が全てではありませんので、高度なことをやりたい場合はオンラインマニュアル（後述）やインターネット等を参考にするとよいでしょう。
少し古いですが、
[gnuplot tips (not so Frequently Asked Questions)](http://lowrank.net/gnuplot/)
というホームページが参考になります。
[ここ](https://ss.scphys.kyoto-u.ac.jp/person/yonezawa/contents/program/gnuplot/index.html)
にもgnuplotの詳しい解説があります。

!!! note
    gnuplotは通常ターミナル上のコマンドラインで制御し，プロットが別のウィンドウに表示される
    仕様となっているため，GUI環境が無いCodespace上では使うことはできません．
    そのため，各自のPC上のgnuplotの利用をおすすめしておきますが，Codespaceで使う方法も紹介しておきます．

## インストール
559の端末にはgnuplotはインストールされていますのでそのまま使うことができます．  
自分のPCにgnuplotをインストールして使う場合には，[公式サイト](http://www.gnuplot.info/)
から自分の環境に合ったものをダウンロードしてインストールしてください．  
もし分からないことがあれば遠慮なくまわりの人に助けを求めてください．

## Codespaceでの使い方
以下では2種類の方法を紹介します．Jupyter Notebookを使う方法の方がお手軽だと思います．

### Jupyter Notebook
[Github Codespace](https://github.com/chibutsu-utokyo/debian) の `gnuplot` ディレクトリに
`example.ipynb` というファイルがありますので，これを開いてください．Jupyter Notebookでgnuplotを
使うためには「gnuplotカーネル」を使う必要があります．  
右上の「カーネルを選択」→「Jupyter Kernel」→ 「gnuplot」の順に選択してください．  
これで準備は完了です．全てのセルを実行してみてプロットが表示されることを確認してください．  
以降は各セルにgnuplotのコマンドを記述して実行することでプロットを表示することができます．

### X11転送
Codespaceには [SSH](../RemoteAccess/SSH.md) を使ってリモート接続することができます．
ちょっとややこしいですが，SSHを経由してX11転送という機能を使うと，リモートのウィンドウを
ローカルのディスプレイに表示することができます．

これにはコマンドラインからGitHubの操作ができるツールである
[GitHub CLI](https://docs.github.com/ja/codespaces/developing-in-a-codespace/using-github-codespaces-with-github-cli)
を使うと便利です．リンク先を参考に自分のPCに適宜インストールしてください．

インストールができたら，初回は認証が必要になります．
以下のコマンドで
```bash
$ gh auth login
```
適宜指示に従って認証してください．
認証が終了したら
```bash
$ gh codespace ssh -c CODESPACE-NAME
```
で `CODESPACE-NAME` という名前のインスタンスにSSH接続ができます．
もしくは
```bash
$ gh codespace ssh
```
を実行するとCodespaceのインスタンスのリストが表示されるので，
カーソルキーで選択してEnterを押すことでSSH接続ができます．

この状態で例えば
```bash
$ xeyes
```
などのGUIアプリケーションを実行すると，ローカルのディスプレイに
ウィンドウが表示されるはずです[^1]．
このSSH接続した状態で `gnuplot` コマンドを使えば，プロットの
ウィンドウはローカルのディスプレイに表示されます．

[^1]: `~/.ssh/config` に `ForwardX11 yes` という
設定をしておく必要があるかもしれません．