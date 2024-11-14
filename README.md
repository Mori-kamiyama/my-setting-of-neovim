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



### 4. Packerをcloneしてくる
``` zsh
git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/opt/packer.nvim
```

### 5. Packerを使う
**<5-1>**  
nvimをterminalで実行
``` zsh
nvim
```
Neovimが開かれたら、
``` nvim
:PackerSync
```
ロードが終わったら、
``` nvim
:qa!
```
で終了。  
**<5-2>**  
もう一度、5-1の手順を繰り返したら、全てのプラグインがinstallされ、Neovimが使いやすくなります。

# 開発メモ
もしかして、「;」が次世代の<leader>キーになれるのではないだろうか。

### ToDo
- [x] commentをtypescirptにも対応させる。
- [x] git操作やりやすく
	- [ ] git関係の追加・LSPエラーの見やすい表示
- [ ] snipetをつける(cmainで#include~ が入力できるなど)
- [ ] かっこ編集強化プラグインをより直感的なものに変える
- [ ] markdownを編集しやすくする
- [ ] telescopeにいろんな機能を割り当てる
- [ ] termianlを開けるようにする（<space>tとかかな）
- [ ] 日本語に対応させる(自動分割)
- [ ] Packerからlazy.nvimへの移行をする
