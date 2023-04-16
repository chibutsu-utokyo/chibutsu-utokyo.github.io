# 画像
LaTeX で画像を扱う基本的な方法と発展的な方法を学習していきましょう．

!!!info "参考"
	* sample4.tex：画像の扱い方
	
## 画像ファイルの基本的な扱い方

残念ながらLaTeXそのものには画像を取り扱う機能がありません．
そこで，`graphicx`パッケージ（graphic**s**ではありません）を使用します．
このとき，(u)pLaTeXを使っている場合にはクラスオプションで`dvipdfmx`を入れ忘れている場合には画像が出力されません．気を付けましょう．

graphicxパッケージを読み込むことで扱うことができる画像は以下の4種類になります．

* PNGファイル
* JPEGファイル
* PDFファイル
* EPSファイル  
  ただし，PDFでの出力が可能な場合には素直にPDFを使用したほうがいい

graphicxパッケージを読み込むと`\includegraphics`（こっちはincludegraphic**s**です）が使用可能になります．具体的な使用方法は以下の通りです．

```latex
% プリアンブルで\usepackage{graphicx}
\includegraphics[オプション]{ファイル名 or ファイルのパス}
```

具体的には以下のように用います．
まずはtexファイルと同じディレクトリに`sample.png`がある場合を考えます．この場合には以下のようになります．

```latex
% texファイルと同じディレクトリにsample.pngがある場合
画像を貼りたい場合には
\includegraphics{sample.png}
とします．
```

次に，画像ファイルが多くなった場合を考えましょう．先ほどと同じようにtexファイルと同じディレクトリにすべてのファイルを配置しても構いません．しかし，あまりに多い場合には別のディレクトリにまとめておきたくなります．
例えば以下のような構造でファイルを配置した場合を考えます．

```shell
# sample.texファイルのあるディレクトリにpictureディレクトリをつくり
# そこに画像ファイルを配置していく
.
├── picture
│   └── sample.png
└── sample.tex
```

この場合には先ほどファイル名を入れた場所に相対パスを入力します．

```latex
別のディレクトリに画像を配置した場合には
\includegraphics{./picture/sample.png}
とします．
```

オプションには画像に関する様々な指定ができますが，頻繁に使うことになるのは画像の大きさに関するオプションでしょう．大きさを指定する際には`width`オプションと`height`オプションを利用します．これらのオプションは絶対値と相対値で指定することができます．

```latex
% 絶対値で高さを50mmにする場合
\includegraphics[height=50mm]{sample.png}
% 相対値で横幅を版面サイズの横幅の70%にする場合
\includegraphics[width=0.7\columnwidth]{sample.png}
```

## 図の自動配置

LaTeXでは図を組版上最適な位置に配置してくれる機能があります．図の自動配置をしようするには`figure`環境を使用します．

```latex
\begin{figure}[オプション]
	...
\end{figure}
```

オプションでは図の配置位置をしていします．

* `h`：可能であればその場所に図を出力する
* `t`：ページ上端に出力する
* `b`：ページ下端に出力する
* `p`：単独ページに出力する

これらのオプションは複数指定することができ，たとえば`\begin{figure}[htbp]`などとすると`h`，`t`，`b`，`p`のいずれかの位置に出力されます．並べる順番は関係がありません．オプションを省略した場合には`[tbp]`と同じ意味になります．

このようにfigure環境をもちいると自動的に図が最適な場所に配置される反面，望んだ場所に出力されないことがしばしばあります．強制的にその場所に図を出力したい場合には`float`パッケージを使用します．floatパッケージを読み込むと，上記の4つのほかに`H`オプションが追加され，これを用いると必ずその場所に出力することができます．

## キャプション・参照

レポートなどで図を貼る際にはキャプションがあるべきだと思います．また，本文中で図を参照したい場合もしばしばあるでしょう．これらはfloat環境の内部で`\caption`コマンドと`\ref`コマンドを使用することで実現可能です．

```latex
図\ref{fig:sample}はキャプションや参照の参考である．
\begin{figure}[htbp]
	% 画像が中央に揃うようにする
	\centering
	% 画像を読み込む
	\includegraphics[width=.7\columnwidth]{sample.png}
	% キャプションをつける
	\caption{適当なキャプション}
	% 本文中で画像を参照するための準備
	\label{fig:sample}
\end{figure}
```

## 図の横並び配置

シミュレーションなどで初期条件を変えた場合の結果を左右にならべて表示したいといった場合があると思います．この場合には`minipage`環境を使用します．

```latex
\begin{minipage}{幅}
	...
\end{minipage}
```

minipage環境内は先ほどのfigure環境と同じように記述します．また，幅の部分はminipage環境自体の横幅であり，`\includegraphics`で指定するそれとは異なる点に注意してください．

```latex
% 横並びさせたい画像をひとつのfigure環境にいれる
% 2枚横並びにする場合
\begin{figure}
	\centering
	\begin{minipage}{0.4\columnwidth} % ひとつのminipageの幅を版面サイズの0.4倍とする
		\centering
		% 画像の横幅をminipageの1.0倍にする
		\includegraphics[width=\columnwidth]{sample1.png}
		\caption{sample1}
		\label{fig:sample1}
	\end{minipage}
		\begin{minipage}{0.4\columnwidth} % ひとつのminipageの幅を版面サイズの0.4倍とする
		\centering
		% 画像の横幅をminipageの1.0倍にする
		\includegraphics[width=\columnwidth]{sample2.png}
		\caption{sample2}
		\label{fig:sample2}
	\end{minipage}
\end{figure}
```

