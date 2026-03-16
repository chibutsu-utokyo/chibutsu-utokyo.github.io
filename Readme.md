# 地球惑星物理学演習

このリポジトリは，[地球惑星物理学演習ウェブ](https://chibutsu-utokyo.github.io/) を [MkDocs](https://www.mkdocs.org/) で管理するためのものです．
主に `docs` ディレクトリ以下の Markdown ファイルを編集すると，ウェブサイトの内容が更新されます．

> [!NOTE]
> - このウェブを編集するには管理者に権限をリクエストしてください．
> - Markdown の書き方は必要に応じて各自で調べてください．

## 構成

- `docs/`: 公開するページ本文
- `mkdocs.yml`: サイト全体の設定とナビゲーション
- `.devcontainer/`: devcontainer 用設定
- `site/`: `mkdocs build` で生成される公開用ファイル

新しい Markdown ファイルを追加した場合は，`mkdocs.yml` の `nav:` も更新してください．

## セットアップ

### devcontainer / Codespaces

devcontainer では必要な Python 環境が自動でセットアップされます．
VS Code から開く場合は [こちら](https://github.com/chibutsu-utokyo/debian) を参考にしてください．

### ローカル環境

ローカルに clone して作業する場合も，`uv` を使うと devcontainer と同じ Python パッケージ環境を再現できます．

```shell
uv python install 3.11.9
uv sync
```

このリポジトリでは Python 3.11.9 を使います．
以後のコマンドは `uv run` 経由で実行してください．

Markdown の句読点を統一したい場合は，必要に応じて次を実行してください．

```shell
uv run python sanitize.py
```

## 編集とプレビュー

リポジトリのトップディレクトリ（`mkdocs.yml` がある階層）で次を実行してください．

```shell
uv run mkdocs serve
```

ブラウザで `http://127.0.0.1:8000/` を開くと，編集中のサイトを確認できます．
編集結果は保存後に自動で反映されます．終了は `Ctrl+C` です．

公開用の静的ファイルだけを生成したい場合は次を使います．

```shell
uv run mkdocs build
```

## 更新手順

### 通常の更新

通常は，`main` ブランチに push すると GitHub Actions が自動でサイトを更新します．

```shell
git commit -a
git push
```

数分後に https://chibutsu-utokyo.github.io/ に反映されます．

### 手動デプロイ

必要な場合はローカルから手動でデプロイすることもできます．

```shell
uv run mkdocs gh-deploy
```

これは `mkdocs build` で生成される `site/` の内容を `gh-pages` ブランチへ反映します．

## 補足

- Python 依存は `pyproject.toml` と `uv.lock` で管理しています
- devcontainer とローカルの Python バージョンは `.python-version` でそろえています
- `sanitize.py` は `docs/` 以下の Markdown の句読点を統一する前処理です
- 生成物の確認は `uv run mkdocs build` で行えます
