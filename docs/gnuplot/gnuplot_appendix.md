# Appendix
## Appendix 1 複数のグラフを描写する（`set multiplot`）
一度に複数のグラフを描写する場合には`set multiplot`コマンドを使います。
このコマンドによりgnuplotは`multiplot`のモードに入ります。例えば
```
gnuplot> set multiplot
multiplot> set size 1,0.5
multiplot> set origin 0,0.5
multiplot> plot sin(x)
multiplot> set origin 0,0
multiplot> plot cos(x)
```
とすると、上に$\sin x$、下に$\cos x$のグラフが描かれます。
`set origin`コマンドはグラフの左下の位置を決め、
`set size`コマンドはグラフの縦横のサイズを変更します。


![multiplot](figs/multiplot.png)

`multiplot`モードを終了させるには
```
multiplot> unset multiplot
```
と入力して下さい。








## Appendix 2： アニメーション

【以下の内容は過去の資料にあったものですが、やり方が下手すぎます。最近のgnuplotでは`for`文が使えるので、アニメーションを作りたい人は`for`文を使ったやり方を検索するとよいと思います。】

コマンドファイルをうまく使うと、アニメーションを作ってやることができます。

まず、以下のようなファイルを作り、`anim.plt`などの名前で保存しておきます。
（`pause -1`→`i=i+0.5`→`rep`の部分は、コピペ等で好きな数だけ繰り返してください）
```
set xrange [-20:20]
set yrange [0:2]
i=0
p exp(-(x+i)**2)
pause -1
i=i+0.5
rep
pause -1
i=i+0.5
rep
（以下略）
```

これを`load`すると、リターンを押すごとに画像が動いて見えるはずです。
`pause`コマンドは`pause 秒数`でその秒数だけ停止する、というコマンドです。
秒数を-1にしたときにはリターンが押されるまでその状態で停止します。
この技は、微分方程式の時間発展の結果のデータファイルを順番に読み込ませて時間発展の雰囲気を掴んだりする時に有用です。


## Appendix 3： 関数の利用（`f(x)`）

数式中の変数の値を少し変えただけの複数のグラフを描画したいとき、複雑な数式だと入力する作業が面倒なだけでなく、入力ミスから全然違うグラフを描画してしまうということがおきやすくなります。
そんな時に便利なのが関数定義という機能です。
これは数学関数の$\sin,\cos$などのように、gnuplot中で使える一般的な関数$f(x)$を自分で定義することができるというものです。

例えば次のような関数を表示したいとき
$$ y = a\sin(x)\cos(x) \quad (a=1,2) $$
```
gnuplot> f(a,x) = a*sin(x)*cos(x)
gnuplot> plot f(1,x)
gnuplot> replot f(2,x)
```
とすれば、いちいち似たような数式を入力することなく、2つの場合についてグラフを描くことができます。


## Appendix 4： 三項演算子

例えばHeaviside関数（階段関数）のようにxの値によって関数の定義が変わってしまうようなグラフを描画するときに三項演算子というものを利用すると、簡単に描くことができます。

三項演算子は次のような書き方をします。
```
<条件文> ? <条件が真の時の処理> : <条件が偽の時の処理>
```
具体例として、Heaviside関数を見てみましょう。
Heaviside関数の定義は次のようになっています。
$$
 f(x) = \begin{cases}
 	 1 & ( x > 0 )\\
	 0 & ( x < 0 ) \\
 \end{cases}
$$
これを描くためには次のように入力します。
```
gnuplot> set yrange [-0.2:1.2]
gnuplot> plot (x < 0) ? 0 : 1
```

![Heaviside](figs/Heaviside.png)

## Appendix 5： 媒介変数の利用（`set parametric`）
これまで紹介したものはすべて $y=f(x)$ や $z=f(x,y)$ と表せるものでした。
しかしこれだけでは表現できないものもあります。
そんなとき、gnuplotでは媒介変数を利用することもできます。
```
 gnuplot> set parametric
```
と入力することで媒介変数モードとなります。
このとき媒介変数として認識される変数は、二次元プロットなら「t」、
三次元プロットなら「u,v」となります。
次に円・球を描く例をのせます。

円を描く
```
gnuplot> set parametric
gnuplot> plot cos(t),sin(t)
```

球を描く
```
gnuplot> set parametric
gnuplot> splot sin(u)*cos(v),sin(u)*sin(v),cos(u)
```


## Appendix 6： gnuplot上でのshellコマンドの利用（`shell, !`）

gnuplotから一時的にshellに抜けることができます。そのためには、
```
 gnuplot> shell
```
と打ちます。そうするとプロンプトがgnuplot起動前のものに戻るはずです。
gnuplotに戻りたいときには`exit`でshellを終了してgnuplotのプロンプトに戻ってきます。

1行だけのshellコマンドなら、`! command`のようしてgnuplot内から実行することもできます。
例えば
```
 gnuplot> !ls
```
などとやってみてください。

また、`pwd`と`cd`はgnuplotのコマンドラインからも実行できます（`cd`は`!`をつけると使えません）。

以下の例のように、ディレクトリ名は必ず引用符で括る必要があることに注意してください。
```
 gnuplot> cd '../'
```

## Appendix 7： 最小二乗フィッティング

gnuplotの強力な機能の一つとして関数のフィッティング（当てはめ）があります。
パラメータを含んだ関数を用意すると、データファイルの数値に対して適当なパラメータの数値を自動的に検索してくれます。
関数は線形、非線形を問いません。

例として、あるデータファイル'linear.dat'を直線にフィッティングすることを考えます。
まず、パラメータを含む関数$f(x)$を定義します。
関数フィッティングには`fit`コマンドを使います。
オプションとして検索したいパラメータ名を、`via`に続けて与えます。

```
 gnuplot> f(x) = a*x + b
 gnuplot> fit f(x) 'linear.dat' via a, b
 gnuplot> plot 'linear.dat'
 gnuplot> replot f(x)
```

収束しない場合は、大雑把に検討をつけた初期値を手で与えてやれば上手くいく場合が多いです。
例えば、関数 $f(x)$を定義したあとに$a = -3$などとして初期値を与えてから`fit`します。


## Appendix 8： 画像の処理について



### gv
`gv` はターミナル上で、
```
$ gv ***.ps
```
のように打つと画像がババっと表示されるコマンドです。
簡単に図を確認する事ができるので今後よく使用すると思います。


### Image Magick
Image Magickはps, eps, jpg, png, gifなど多くの形式に対応した画像処理ソフトです。
主に`display`というコマンドと`convert`というコマンドを使います。

`display`はターミナル上で、
```
$ display ***.ps
```
のように打つとgvと同様に画像が表示されます。

`convert`は画像処理のためのコマンドです。
ターミナル上で、
```
$ convert ***.ps ***.pdf
```
のように打つとpsファイルがpdfファイルに変換されます。

他にも
```
$ convert -resize 80 file1 file2
```
と打つとfile1を80％に縮小した画像がfile2に書き込まれたり、
```
$ convert -delay 50 hoge1.gif hoge2.gif hoge3.gif hogehoge.gif
```
と打つとhoge1から3が0.5秒ずつ流れるgifアニメーションを作ることができたりします。
このconvertはかなり有用だと思いますので調べて使ってみてください。


### gimp
`gimp`はターミナル上で、
```
$ gimp ***.ps
```
のように打つと同様に画像が表示され、色々と手を加える事もできるコマンドです。




## Appendix 9： エラーバーを付ける

観測値や実験値をグラフにする場合の多くは、そこにエラーバーを表示する必要があります。
このような場合には`errorbars`というスタイルを指定します。
```
gnuplot> set style data errorbars
```
または
```
gnuplot> plot 'observation.dat' with errorbars
```

データファイルには、3列または4列のデータが必要です。
データが3列の場合にはそれぞれの行は $(x,y,\Delta y)$ の組として解釈され、
$(x,y$-$\Delta y)$ から $(x,y$+$\Delta y)$ までの線が引かれます。
データが4列の場合には、それそれの列は $(x,y,y_{low},y_{high})$ として解釈され、
$(x,y_{low})$ から $(x,y_{high})$ までの線が引かれます。
複数列のデータの中から使用する列を指定する場合には、次のように`using`を使います。
```
gnuplot> plot 'observation.dat' using 1:4:3:5 with errorbars
```