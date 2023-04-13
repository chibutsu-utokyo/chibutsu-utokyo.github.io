# MkDocsの簡単な使い方

### 使うための準備

MkDocs，Material for MkDocs，pygmentsを用いているため，これらを事前にインストールしておく必要がある．

```python
pip install mkdocs
pip install mkdocs-material
pip install pygments
```

（追記）新しいmacで`zsh: command not found: pip`と出る場合：
`pip`の代わりに`pip3`とするとうまくいくかもしれない．
その場合，以下の`mkdocs serve`などは`python3 -m mkdocs serve`などと読みかえる．



### ファイル群の説明

`main`ブランチ下の`docs`ディレクトリにはMkDocsをもちいてGitHub Pagesのページを作成するために必要なファイル群が入っている．

基本的には`docs`ディレクトリ下の各担当回名のディレクトリにMarkdown形式のファイルをアップロードする形になる．

### 使い方

`docs`ディレクトリ以下に各Markdownファイルを配置し，出力結果をトップディレクトリ（`mkdocs.yml`がある階層）において

```shell
mkdocs serve
```

とし，表示されるURLを適当なエクスプローラで開くことでリアルタイムに変更結果の確認ができる．
（終了するには`Ctrl+C`とする）


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

また，更新内容を`main`ブランチにもpushすることを忘れないようにする．
