# 使い方

1. neovimのインストール
``` zsh
brew install neovim
```


2. gitのインストール

``` zsh
brew install git
```


3. このgithubのクローンとこのリポジトリにスターをつける

まず、このリポジトリにスターをつけてね（強制はしないよ）

その後に、
``` zsh
cd
cd .config
git clone https://github.com/new-umechan/my-setting-of-neovim
mv my-setting-of-neovim nvim
```
を実行してね



4. Packerをcloneしてくる
``` zsh
git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/opt/packer.nvim
```

5. Packerを使う


### jaga

もしかして、「;」が次世代の<leader>キーになれるのではないだろうか。

### ToDo
- [x] commentをtypescirptにも対応させる。
- [x] markdownを編集しやすくする
- [ ] 日本語に対応させる

