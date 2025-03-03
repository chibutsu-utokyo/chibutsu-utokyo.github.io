# はじめに

PythonはCやFortranなどのプログラミング言語と違い，コンパイルが必要のないインタープリター型の言語です．
そのため，一般には実行速度は遅いですが，その分非常に使いやすい言語となっています．  

## テキストについて
東大の [Pythonプログラミング入門](https://utokyo-ipp.github.io/) のテキストを適宜参考にしてください．

## CodespaceのPython環境
[Github Codespace](https://github.com/chibutsu-utokyo/debian) でのPythonの使い方は以下の通りです．  
自身で用意した環境や Google Colaboratory (Colab) を使ってもらっても構いませんが課題提出の指示には従ってください．

Google Colabについては [Pythonプログラミング入門](https://utokyo-ipp.github.io/) のテキストを参照してください．  
ここに紹介する以外にも色々な実行方法がありますので好みに応じて使い分けてください．

### インタラクティブシェル
ターミナルで `python` と入力すると
```bash
$ python
Python 3.10.16 (main, Dec  4 2024, 20:37:22) [GCC 12.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>>
```
のように表示されます．
```python
>>> print("Hello, World!")
Hello, World!
```
のように ```>>> ` （プロンプト）以降にPythonのコードを入力するとその場で実行されます．  
終了するには `exit()` と入力するか， `Ctrl-D` を押してください．


### スクリプト
Pythonのスクリプト（ソース）ファイルは `.py` という拡張子を持ちます．
例えば，`hello.py` というファイルに以下のコードを書いたとします．
```python
print("Hello, World!")
```
このファイルを実行するには，ターミナルで以下のように入力します．
```bash
$ python hello.py
Hello, World!
```
このようにしてスクリプトファイルに書かれたPythonコードを実行することができます．

`python` コマンドを使わずに通常のコマンドのようにスクリプトを実行するには

```python linenums="1"
#!/usr/bin/env python
print('Hello, World !')
```
のように先頭に `#!` で始まる行を追加し，その後にPythonのインタープリターを指定します．
この行はシェバン（shebang）と呼ばれます．

このスクリプトを実行するには，まず実行権限を与える必要があります．
```bash
$ chmod +x hello.py
```

その後，以下のように実行します．
```bash
  $ ./hello.py
```

### Jupyter Notebook
メニューの「表示」→「コマンドパレット」から `Create: New Jupyter Notebook` を選択すると新しいノートブックが開きます．
使い方はほとんどGoogle Colabと同じです．必要に応じて [Pythonプログラミング入門](https://utokyo-ipp.github.io/) を参照してください．


## 提出課題について
- [提出課題1](kadai1.md)
- [提出課題2](kadai2.md)
- [提出課題3](kadai3.md)
