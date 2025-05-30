# LaTeXの基本(2)
LaTeXの基礎知識を学んだところで、より実践的な使い方を学んでいきましょう。

!!!info "参考"
    * sample2.tex
    
## タイトル・著者・日付

文書を作るときは、タイトル、著者、日付を書くのが一般的です。それぞれ`\title`、`\author`、`\date`を一般にはプリアンブルで用います。

```latex
%プリアンブルで
\title{タイトル}
\author{著者}
\date{日付}
```

この後で`\begin{document}`の後に`\maketitle`を用いることでこれらが出力されます。
また、`\date`を書かないと自動的にコンパイルした日時が出力されます。日付を表示したくない場合には`\date{}`とするといいでしょう。

## 文書の構造

ある程度の長さの文書の場合には文書に構造、すなわち「章」や「節」を持たせて論理的に組み立てていくことが大切になります。
ドキュメントクラスごとにどの文書の構造が使えるかは多少異なりますが、以下に主要なものを挙げておきます。

|     コマンド     | 対応する構造 |
| :--------------: | :----------: |
|     `\part`      |      部      |
|    `\chapter`    |      章      |
|    `\section`    |      節      |
|  `\subsection`   |     小節     |
| `\subsubsection` |    小小節    |
|   `\paragraph`   |     段落     |
| `\subparagraph`  |    小段落    |

```latex
\section{節見出し}
適当なイントロ
\subsection{小節見出し1}
ほげほげ
\subsection{小節見出し2}
ふがふが
```

また`\tableofcontents`を用いることで目次を出力することができます。なおLaTeXの技術的な理由から、目次を出力するには少なくとも2 回は処理する必要があります。

## 書体

LaTeXでは書体を以下の3つの属性で管理しています。

* **ファミリー**：文字のデザイン上の分類
* **シリーズ**：文字の線の太さや個々の文字幅による分類
* **シェイプ**：その他の特徴による分類

欧文の場合これらを変更するには以下のコマンドを用います。

| 書体名                     | 命令      |
| -------------------------- | --------- |
| ローマンファミリー         | `\textrm` |
| サンセリフファミリー       | `\testsf` |
| タイプライタファミリー     | `\testtt` |
| ミディアムシリーズ         | `\textmd` |
| ボールドシリーズ           | `\textbf` |
| イタリックシェイプ         | `\textit` |
| スラントシェイプ           | `\textsl` |
| スモールキャピタルシェイプ | `\textsc` |

和文の場合には以下の2つを用います。

| 書体名             | 命令      |
| ------------------ | --------- |
| 明朝ファミリー     | `\textmc` |
| ゴシックファミリー | `\textgt` |

```latex
このようにして\textgt{ゴシック体}にします。\\
違う属性なら\textbf{\textsf{hoge}}みたいにもできます。
```

## 文字サイズ

文字サイズも変更することが可能です。変更するには以下のコマンドを使います。

|      命令       |    サイズ     |
| :-------------: | :-----------: |
|     `\tiny`     |   5ポイント   |
|  `\scriptsize`  |   7ポイント   |
| `\footnotesize` |   8ポイント   |
|    `\small`     |   9ポイント   |
|  `\normalsize`  |  10ポイント   |
|    `\large`     |  12ポイント   |
|    `\Large`     | 14.4ポイント  |
|    `\LARGE`     | 17.28ポイント |
|     `\huge`     | 20.74ポイント |
|     `\Huge`     | 24.88ポイント |

```latex
こんなふうに文字サイズを{\LARGE 大きく}したり{\footnotesize 小さく}できます
```

## 箇条書き

LaTeXでは以下の3種類の箇条書き環境があります。

* **itemize環境**
  頭に記号がついた箇条書き

* **enumerate環境**

  頭に1,2,3,...のような通し番号がつく箇条書き

* **description環境**
  頭が単語になっている環境

基本的な使い方は以下の通りです。description環境の場合には`\item[見出し]`となっている点に注意しましょう。

```latex
% itemize環境の場合
\begin{itemize}
\item 要素1
\item 要素2
\end{itemize}
%description環境の場合
\begin{description}
\item[大気海洋分野] 適当な説明
\item[固体地球分野] 適当な説明
\item[宇宙惑星分野] 適当な説明
\end{description}
```

また、環境を入れ子にすることもできます。

```latex
%入れ子にすると頭の記号が変わる
\begin{itemize}
\item 要素1
\begin{itemize}
\item 要素1-1
\item 要素1-2
\end{itemize}
\item 要素2
\end{itemize}
```

## 脚注

**`\footnote`**を用いることで脚注をつけることができます。

```latex
適当な文章に脚注をつけてみましょう。
\footnote{このように脚注をつけられます}
```

## 引用・参考文献

論文などから文章を引用する際には**quote環境**か**quotation環境**を用います。quote環境では行頭の字下げがされず、quotation環境では字下げされます。用途によって適当に選ぶといいでしょう。

```latex
ほげ山ほげ尾の「ほげの科学」には
\begin{quotation}
適当な文章
\end{quotation}
というくだりがある。
```

また、文献から引用する際には参考文献を書く必要があります。この際には**thebibliography環境**と**`\cite`**を用います。

```latex
%本文
ほげ山ほげ尾の「ほげの科学」~\cite{ほげ}、ふが川ふが実の「ふが学」~\cite{ふが}によると...

%参考文献
\begin{thebibliography}{9}
\bibitem{ほげ} ほげ山ほげ尾『ほげの科学』ほげ出版
\bibitem{ふが} ふが川ふが実『ふが学』ふが出版
\end{thebibliography}
```

本文で用いる`\cite`とthebibliography環境内で用いる`\bibitem`の引数の中身を同じにすることで、自動的に参照番号をつけてくれます。
また、`\begin{thebibliography}{9}`の数字を参考文献の数に合わせて変える必要があります。参考文献の数が1桁ならば9を、2桁ならば99といった感じです。

## パッケージ

LaTeXそのままの機能には限界があります。これらの機能を拡張したり、機能を追加するために用いるのがパッケージです。TeX LiveというTeXのディストリビューションには非常に多くのパッケージが含まれています。また、TeX Liveに含まれないもののGitHub等で配布されているパッケージもあります。これらを適宜読み込んでいきます。

パッケージを読み込むには`\usepackage`をプリアンブルで用います。例として**scsnowman**というパッケージを使ってみましょう。scsnowmanパッケージを読み込むと`\scsnowman`というコマンドが利用可能になります。

```latex
\documentclass[lualatex]{jlreq}
%scsnowmanを読み込む
\usepackage{scsnowman}
\begin{document}
%\scsnowmanが使えるようになる
\scsnowman
\end{document}
```

また、パッケージによってはオプションがある場合があります。その場合は`\documentclass`と同様に`\usepackage[オプション]{パッケージ}`とします。

TeX Liveに入っているパッケージの使い方はそれぞれのドキュメントにまとめられています。ローカルにTeX Liveをインストールした場合にはターミナルで

```shell
$ texdoc scsnowman
```

などのように`texdoc`を用いることで調べることができます。また同様の機能を[https://texdoc.org/index.html](https://texdoc.org/index.html)から使用することができます。
