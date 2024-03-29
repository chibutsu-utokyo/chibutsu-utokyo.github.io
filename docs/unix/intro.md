# はじめに

## テキストについて
Unixの演習では [Linux標準教科書](https://linuc.org/textbooks/linux/) をテキストとして用います．  
このテキストは無償ですが，ダウンロードするには登録が必要です．  
ただし，地球惑星物理学演習履修者への配布については許可を頂いています．
演習時にダウンロード方法は指示をしますので，各自で適宜ダウンロードして参照してください．  
なお，各課題にはヒントとしてこのテキストの該当する節への参照が示されています．

## Unix環境について
Unixの演習では [Github Codespace](https://github.com/chibutsu-utokyo/ubuntu-22.04) を用います．  
詳細はリンク先を参照してください．

## 課題提出について
- [提出課題1](kadai1.md)
- [提出課題2](kadai2.md)

これらの課題に対する解答を提出してください． 解答の雛形が
[Codespace](https://github.com/chibutsu-utokyo/ubuntu-22.04) 
の `unix/sXXXXXX_kadai1.txt` と `unix/sXXXXXX_kadai2.txt` にそれぞれ置いてあります．  
これらのファイルに解答を記入し，ファイル名の `sXXXXXX` を **自分のアカウント名に変更** した上で，
**ECCSメールアドレスから添付ファイルとして** 送付してください．
また **メールの件名はファイル名と同一** としてください．  
（提出締め切りや送信先については指示をしますのでそれに従ってください．）

なお，課題の実施は特に指示のない限りは 
[Codespace](https://github.com/chibutsu-utokyo/ubuntu-22.04) 
のワークスペースのルートディレクトリで実行するものとします．
カレントディレクトリが分からなくなったときには，
```bash
cd $CODESPACE_VSCODE_FOLDER
```
を実行するか，新しくターミナルを開いてください．
