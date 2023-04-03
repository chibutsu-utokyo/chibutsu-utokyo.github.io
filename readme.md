# 簡単な使い方等の説明

### 使うための準備

MkDocs，Material for MkDocs，pygmentsを用いているため，これらを事前にインストールしておく必要がある．

```python
pip install mkdocs
pip install mkdocs-material
pip install pygments
```

### ファイル群の説明

`mkdocs_source`ブランチ下の`mkdocs_source`ディレクトリにはMkDocsをもちいてGitHub Pagesのページを作成するために必要なファイル群が入っている．

基本的には`doc`ディレクトリ下の各担当回名のディレクトリにMarkdown形式のファイルをアップロードする形になる．

### 使い方

`mkdocs_source`ブランチをローカルに持ってきてもらい，その上で各Markdownファイルを入れていくことになる．この際どのような出力結果となるかは`mkdocs_source`ディレクトリ（`mkdocs.yml`がある階層）において

```shell
mkdocs serve
```

とし，表示されるURLを適当なエクスプローラで開くことでリアルタイムに変更結果の確認ができる．

また，Markdownファイルをアップロードするだけではなく，`mkdocs.yml`内の`nav:`の項目を書き換える必要がある．具体的な書き方は適当にしらべるか，LaTeX回の書き方を参照してもらいたい．

それら一通りの変更が終わった後に，

```shell
mkdocs gh-deploy
```

をすることで`gh-pages`ブランチが更新されるはずである．なお，権限がない場合にはこのコマンドを使えないはずなので，この場合には

```shell
mkdocs build
```

で作成される`site`ディレクトリの中身を`gh-pages`ブランチにpushすることになる．

また，`mkdocs_source`ブランチにもpushすることを忘れないようにする．
