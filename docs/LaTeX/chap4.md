# 数式

数式の取り扱いは，LaTeXの非常に得意な分野になります．使い方を学習していきましょう．

## 数式の基本

LaTeXの数式には大きく分けて以下のようなものがあります．

* **インライン数式**：本文中に表示する数式
* **ディスプレイ数式**：別行立ての数式
  * **数式番号あり**
  * **数式番号なし**

インライン数式の場合，数式の部分を`$`で囲みます．
ディスプレイ数式の場合，数式番号なしであれば`\[`と`\]`で囲みます．
数式番号ありの場合にはequation環境を使います．

これらはLaTeXで実装されているものになりますが，より高度な数式表示をしたい場合には**AMS-LaTeX**を利用します．具体的には数式に関するコマンドや環境を定義した**amsmath**パッケージや数学記号などを定義した**amssymb**パッケージなどがあります．皆さんは数式を頻繁に使うので，これらのパッケージは毎回読み込んでおいて損はないでしょう．本資料では詳しい説明は割愛しますが，**align**環境といった非常に有用な環境が使えるようになったりします．
```latex
%インライン数式
分数は$a=\frac{b}{c}$とします
%ディスプレイ数式（数式番号なし）
\[
	a = \frac{b}{c}
\]
%ディスプレイ数式（数式番号なし）
\begin{equation}
	a = \frac{b}{c}
\end{equation}
```

## 空白

数式中の空白は基本的に無視されます．そのため空白を任意に入れたい場合にはコマンドを使う必要があります．以下に例をあげておきます．

| 命令                              | 空白の大きさ     |
| --------------------------------- | ---------------- |
| `\,`                              | かなり小さい空白 |
| `\:`                              | 小さい空白       |
| `\;`                              | 少し小さい空白   |
| `\ `（バックスラッシュ+半角空白） | 半角の空白       |
| `\quad`                           | 全角の空白       |
| `\qquad`                          | 全角2つ分の空白  |
| `\!`                              | 負の空白         |

```latex
どちらが見慣れた式ですか？
\[ \int\int f(x,y) dx dy \]
\[ \int\!\!\!\int f(x,y) dx dy \]
```

## 書体

数式中の文字はイタリック体になります．基本的にはこれでいいですが，例えば定数を表す「const」などの場合にはローマン体にする方が望ましいでしょう．以下にこのような場合に用いるコマンドの例を挙げたいと思います．

| 命令       | 入力例             | 出力例           |
| ---------- | ------------------ | ---------------- |
| （通常）   | `$E(x)$`           | $E(x)$           |
| `\mathrm`  | `$\mathrm{E(x)}$`  | $\mathrm{E(x)}$  |
| `\mathcal` | `$\mathcal{E(x)}$` | $\mathcal{E(x)}$ |
| `\mathbb`  | `$\mathbb{E(x)}$`  | $\mathbb{E(x)}$  |

 また，ベクトルや行列を表す際に太字にする人も多いかと思います．このときには**bm**パッケージを読み込んで`$\bm{E(x)}$`とすると$\boldsymbol{E(x)}$とすることができます．

## 添字

上付き添字は`^`を，下付き添字は`_`を使って出力します．

| 種類       | 命令 | 入力例    | 出力例  |
| ---------- | ---- | --------- | ------- |
| 上付き添字 | `^`  | `$a^{2}$` | $a^{2}$ |
| 下付き添字 | `_`  | `$a_{i}$` | $a_i$   |

## 大きさの変わる数学記号

ここではよく使うであろう記号である，**分数**，**平方根**，**多乗根**，**定積分**，**総和**を扱いたいと思います．それぞれ以下のような使い方になります．

| 種類   | 命令    | 入力例           | 出力例         |
| ------ | ------- | ---------------- | -------------- |
| 分数   | `\frac` | `$\frac{a}{b}$`  | $\frac{a}{b}$  |
| 平方根 | `\sqrt` | `$\sqrt{a}$`     | $\sqrt{a}$     |
| 多乗根 | `\sqrt` | `$\sqrt[b]{a}$`  | $\sqrt[b]{a}$  |
| 定積分 | `\int`  | `$\int_{a}^{b}$` | $\int_{a}^{b}$ |
| 総和   | `\sum`  | `$\sum_{a}^{b}$` | $\sum_{a}^{b}$ |

これらをインライン数式で用いるとバランスが悪くなります．そこで，これらをインライン数式で使う場合は`\displaystyle`を併用するとデザインが変わります．

```latex
本文中でも$\displaystyle\int_{a}^{b}$とすれば狭くない．
```

## 関数

「sinx」と出力するつもりで`$sinx$`と書くと$sinx$となってしまいます．これでは$s\times i\times n\times x$としか解釈しようがありません．これらの関数は慣例としてローマン体で書くのが普通です．それらの関数は命令として定義されています．以下に一部をあげます．

| 命令   | 入力例                              | 出力例                           |
| ------ | ----------------------------------- | -------------------------------- |
| `\sin` | `$\sin x$`                          | $\sin x$                         |
| `\cos` | `$\cos x$`                          | $\cos x$                         |
| `\tan` | `$\tan x$`                          | $\tan x$                         |
| `\exp` | `$\exp x$`                          | $\exp x$                         |
| `\log` | `$\log x$`                          | $\log x$                         |
| `\ln`  | `$\ln x$`                           | $\ln x$                          |
| `\lim` | `$\lim_{x\to 0} \frac{\sin x}{x}$ ` | $\lim_{x\to 0} \frac{\sin x}{x}$ |

## ギリシャ文字

ギリシャ文字の小文字の出力には以下の命令を用います．

| 命令       | 出力       | 命令     | 出力     | 命令      | 出力      | 命令       | 出力       |
| ---------- | ---------- | -------- | -------- | --------- | --------- | ---------- | ---------- |
| `\alpha`   | $\alpha$   | `\beta`  | $\beta$  | `\gamma`  | $\gamma$  | `\delta`   | $\delta$   |
| `\epsilon` | $\epsilon$ | `\zeta`  | $\zeta$  | `\eta`    | $\eta$    | `\theta`   | $\theta$   |
| `\iota`    | $\iota$    | `\kappa` | $\kappa$ | `\lambda` | $\lambda$ | `\mu`      | $\mu$      |
| `\nu`      | $\nu$      | `\xi`    | $\xi$    | `o`       | $o$       | `\pi`      | $\pi$      |
| `\rho`     | $\rho$     | `\sigma` | $\sigma$ | `\tau`    | $\tau$    | `\upsilon` | $\upsilon$ |
| `\phi`     | $\phi$     | `\chi`   | $\chi$   | `\psi`    | $\psi$    | `\omega`   | $\omega$   |

一部のギリシャ文字には異体字も用意されています．

| 入力          | 出力          | 入力        | 出力        | 入力      | 出力      |
| ------------- | ------------- | ----------- | ----------- | --------- | --------- |
| `\varepsilon` | $\varepsilon$ | `\vartheta` | $\vartheta$ | `\varpi`  | $\varpi$  |
| `\varrho`     | $\varrho$     | `\varsigma` | $\varsigma$ | `\varphi` | $\varphi$ |

またギリシャ文字の大文字は以下の命令を用います．以下の11文字以外はアルファベットと同じです．

| 命令     | 出力     | 命令     | 出力     | 命令     | 出力     | 命令       | 出力       |
| -------- | -------- | -------- | -------- | -------- | -------- | ---------- | ---------- |
| `\Gamma` | $\Gamma$ | `\Delta` | $\Delta$ | `\Theta` | $\Theta$ | `\Lambda`  | $\Lambda$  |
| `\Xi`    | $\Xi$    | `\Pi`    | $\Pi$    | `\Sigma` | $\Sigma$ | `\Upsilon` | $\Upsilon$ |
| `\Phi`   | $\Phi$   | `\Psi`   | $\Psi$   | `\Omega` | $\Omega$ |            |            |

## その他の記号

その他よく使いそうな記号は以下の通りです．

| 命令              | 出力              | 命令              | 出力              | 命令                  | 出力                  | 命令                  | 出力                  |
| ----------------- | ----------------- | ----------------- | ----------------- | --------------------- | --------------------- | --------------------- | --------------------- |
| `\le`             | $\le$             | `\ge`             | $\ge$             | `\ll`                 | $\ll$                 | `\gg`                 | $\gg$                 |
| `\in`             | $\in$             | `\ni`             | $\ni$             | `\neq`                | $\neq$                | `\equiv`              | $\equiv$              |
| `\sim`            | $\sim$            | `\subset`         | $\subset$         | `\supset`             | $\supset$             | `\parallel`           | $\parallel$           |
| `\pm`             | $\pm$             | `\mp`             | $\mp$             | `\times`              | $\times$              | `\div`                | $\div$                |
| `\ast`            | $\ast$            | `\star`           | $\star$           | `\cdot`               | $\cdot$               | `\circ`               | $\circ$               |
| `\bullet`         | $\bullet$         | `\bigcirc`        | $\bigcirc$        | `\vee`                | $\vee$                | `\wedge`              | $\wedge$              |
| `\hbar`           | $\hbar$           | `\Re`             | $\Re$             | `\Im`                 | $\Im$                 | `\imath`              | $\imath$              |
| `\jmath`          | $\jmath$          | `\ell`            | $\ell$            | `\partial`            | $\partial$            | `\infty`              | $\infty$              |
| `\nabla`          | $\nabla$          | `\natural`        | $\natural$        | `\flat`               | $\flat$               | `\sharp`              | $\sharp$              |
| `\leftarrow`      | $\leftarrow$      | `\Leftarrow`      | $\Leftarrow$      | `\longleftarrow`      | $\longleftarrow$      | `\Longleftarrow`      | $\Longleftarrow$      |
| `\rightarrow`     | $\rightarrow$     | `\Rightarrow`     | $\Rightarrow$     | `\longrightarrow`     | $\longrightarrow$     | `\Longrightarrow`     | $\Longrightarrow$     |
| `\leftrightarrow` | $\leftrightarrow$ | `\Leftrightarrow` | $\Leftrightarrow$ | `\longleftrightarrow` | $\longleftrightarrow$ | `\Longleftrightarrow` | $\Longleftrightarrow$ |

## 大きさの変わるカッコ

## 行列

