# 地球惑星物理学演習
これはMkDocsで作成された [地球惑星物理学演習ウェブ](https://chibutsu-utokyo.github.io/
) のリポジトリです．  
編集するには権限をリクエストしてください．

## ウェブ更新方法

### VSCode起動方法
ウェブ上でVSCodeを使って編集ができる．
[ここ](https://github.com/chibutsu-utokyo/debian)
を参考にmainブランチからVSCodeを起動する．  
必要なソフトウェア（mkdocs, mkdocs-material, pygments）は既にインストール済み．

### ファイル群の説明
`main`ブランチ下の`docs`ディレクトリにはMkDocsをもちいてGitHub Pagesのページを作成するために必要なファイル群が入っている．  
基本的には`docs`ディレクトリ下に配置されているMarkdown形式のファイルを編集すればよい．

### 編集作業
ターミナルで，リポジトリのトップディレクトリ（`mkdocs.yml`がある階層）において
```shell
mkdocs serve
```
とすると画面右下にダイアグラムが表示され，「ブラウザで開く」をクリックすると編集中のウェブサイトが表示される．  
編集結果はリアルタイムに反映される．終了するには`Ctrl+C`とすればよい．  
（VSCodeのターミナルペインの「ポート」タブに表示される8000番ポートのURLからもアクセスすることができる．）

新しいMarkdownファイルを追加した際には，`mkdocs.yml`内の`nav:`の項目を書き換えると，
サイト左のメニューバーに表示されるようになる．

### ウェブサイト更新
ウェブサイトの更新は`gh-pages`ブランチに対してpushすることで反映される．  
これは
```shell
mkdocs gh-deploy
```
によって自動的に行われる．このコマンドの意味は
```shell
mkdocs build
```
で作成される`site`ディレクトリの中身を`gh-pages`ブランチにpushすることと同じである．

push権限がない場合には権限をリクエストするか，GitHub上でforkしたリポジトリにpushした上で
プルリクエストを出す．

### ソースの更新
ソース（MarkdownファイルやMkDocsの設定ファイル）の更新は`main`ブランチにpushする．
