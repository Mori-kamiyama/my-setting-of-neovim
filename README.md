# 概要
macで使っています。
デフォルトのterminalは、アイコンや色の表示ができないため、
Weztermをおすすめします。


![Neovim Use](https://github.com/user-attachments/assets/98fd6d6a-fed8-415f-9b25-f14dced2657a)


### 1. neovimのインストール
``` zsh
brew install neovim
```


### 2. gitのインストール
``` zsh
brew install git
```

### 3. このgithubのクローンとこのリポジトリにスターをつける

まず、このリポジトリにスターをつけてね（強制はしないよ）

その後に、
``` zsh
cd
cd .config
git clone https://github.com/new-umechan/my-setting-of-neovim
mv my-setting-of-neovim nvim
```
を実行してね

# 開発メモ
もしかして、";"が次世代の<leader>キーになれるのではないだろうか。

### 設計思想
- できるだけ、シンプルなプラグインを入れる。
  1プラグイン1機能の原則
- デフォルトのvimと、キーバインドを大きく変えることはしない。
- 見た目はある程度気にする。iceberg最高。
- 必要以上のカスタマイズは、煩わしいので使いませんん。
  要素数が増えるのは悪。かっこよくても集中が削がれる。
　ex )lualine.nvim, which-key.nvim
  ただし補完プラグインは入れる。そっちの方が効率がいいから。
- git操作など、vim内で完結させる系はがんがん入れていきたい。
- 速さは重要! できれば遅延読み込みを駆使して50msぐらいいきたいな。
  https://qiita.com/delphinus/items/fb905e452b2de72f1a0f#4-%E3%83%97%E3%83%A9%E3%82%B0%E3%82%A4%E3%83%B3%E3%81%AE%E9%81%85%E5%BB%B6%E8%AA%AD%E3%81%BF%E8%BE%BC%E3%81%BF

### ToDo
- [x] commentをtypescirptにも対応させる。
- [x] git操作やりやすく
	- [x] git関係の追加・LSP ( ALE ) エラーの見やすい表示
- [x] ALE errorメッセージの、warningレベルだと、errorの色を
	  コメントアウトと同じ灰色にする
	  → 結構3時間かかった
- [ ] snipet
	- [x] snipetをつける(cmainで#include~ が入力できるなど)
    - [ ] snipetを簡単に編集できるようにする
          → telescope-luasnip.nvim
- [x] Packerからlazy.nvimへの移行をする
- [ ] 変数への定義ジャンプをつくる
- [ ] かっこ編集強化プラグインをより直感的なものに変える
- [ ] helpが左右に画面分割をしてでるようにする
- [ ] markdownを編集しやすくする
- [ ] telescopeにいろんな機能を割り当てる
- [ ] 遅延読み込みで起動時間50msを目指す
- [ ] termianlを開けるようにする（<space>tとかかな）
- [ ] 日本語に対応させる
    - [x] insert modeでemacsの基本操作ができるようにする
    - [ ] 検索を、ローマ字でできるようにする
