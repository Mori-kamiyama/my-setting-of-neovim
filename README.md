# 使い方
macようだよ

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
- [ ] 変数への定義ジャンプをつくる
- [ ] かっこ編集強化プラグインをより直感的なものに変える
- [ ] helpが左右に画面分割をしてでるようにする
- [ ] markdownを編集しやすくする
- [ ] telescopeにいろんな機能を割り当てる
- [ ] termianlを開けるようにする（<space>tとかかな）
- [ ] 日本語に対応させる
    - [x] insert modeでemacsの基本操作ができるようにする
    - [ ] 検索を、ローマ字でできるようにする
- [x] Packerからlazy.nvimへの移行をする
