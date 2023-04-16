# 付録

知っていると有用なパッケージやマクロを非常に簡潔にまとめておきたいと思います．
興味がある場合には各自調べてください．

## 知っていると有用なパッケージ

TeX Liveに含まれているパッケージに限らず，ネットの海には非常に多くのパッケージが存在しています．
そのなかでもTeX Liveに含まれている有用なパッケージをいくつか紹介しておきたいと思います．

### siunitx
国際単位系であるSI単位の表記法には様々な規則があります．これを自動で正しく表記してくれるパッケージです．
```latex
% 使用例
\SI{1.0}{kg.m.s^{-2}}
```
### listings
LaTeXにおいて，逐語的に文字列を表記するのに用いられる環境やコマンドとして，`verbatim`環境や`\verb`というものがあります．
ソースコードを文書に貼りたい場合には上記のコマンドでは少し不十分に感じるときがあります．listingsパッケージではシンタックスハイライト等をつけて，見やすくソースコードを貼ることができます．
```latex
% 使用例
	\lstset{language=[90]Fortran,
		numbers=left,
		commentstyle={\small\ttfamily \color[rgb]{0,0.5,0}},
		keywordstyle={\small\bfseries \color[rgb]{1,0,0}},
		backgroundcolor={\color[gray]{.85}},
		stringstyle={\small\ttfamily \color[rgb]{0,0,1}}}
	\begin{lstlisting}
	! test code
	program main
		implicit none
			double precision :: x 
			x = 1d0
			write(*,*) x
			write(*,*) 'test'
		stop
	end program main
	\end{lstlisting}
```

### xcolor
LaTeX単体では文字色を変えることはできません．xcolorパッケージを使えば文字色を変えることができます．
```latex
% 使用例
{\color{red}赤色}
```

### Tik*Z*
非常に高度な描画パッケージです．あまりに高度すぎるため，マニュアルは2023年現在で1321ページにも及びます．
すべてを学ぼうとするとあまりに長大ですが，マニュアル冒頭のチュートリアルを学べば基本的な図はかけるようになるでしょう．
```latex
% 使用例
\begin{tikpicture}
	\draw (0.0) circle [radius=1];
\end{tikzpicture}
```

## マクロ
LaTeXにおける非常に有用な機能としてマクロというものがあります．例えば偏微分

$$
\frac{\partial x}{\partial t}
$$

を毎回書くのは面倒です．そこで例えば，`\pdiff`というコマンドを自分で定義し，
`\pdiff{x}{t}`とすれば楽に書けそうです．このようなコマンドを定義する方法は大きく分けて以下の3通りがあります．

* **xparse**の記法を用いる方法（`\NewDocumentCommand`など）
* **LaTeX**の記法を用いる方法（`\newcommand`など）
* **TeX**の記法を用いる方法（`\def`など）

基本的にはどれを用いても同じことができますが，**TeXの記法を用いる方法は使わないようにしましょう**．
LaTeXの勉強が甘い人が用いるとLaTeXが動かなくなります．
また，残りの2つについてはどちらも基本的には安全ですが，より自由度の高いxparse記法を使うのがよいでしょう．
より詳しい使い方の説明は[ここ](https://qiita.com/zr_tex8r/items/50168ad7087516c3e139)などに記載されています．
```latex
% xparseを用いた例
\NewDoccumentCommand\pdiff{m m}{\frac{\partial #1}{\partial #2}}
```