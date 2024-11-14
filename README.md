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

### memo

もしかして、「;」が次世代の<leader>キーになれるのではないだろうか。

### ToDo
- [x] commentをtypescirptにも対応させる。
- [x] markdownを編集しやすくする
- [x] 日本語に対応させる
- [ ] git関係の追加・LSPエラーの見やすい表示

