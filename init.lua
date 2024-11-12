vim.cmd [[packadd packer.nvim]]
vim.cmd [[packadd packer.nvim]]

require('ume/basic_config')
require('ume/setup_plugin')
vim.cmd('colorscheme iceberg')
require('ume/plugins/nvim_tree')
vim.api.nvim_set_hl(0, "WinSeparator", { bg = "#0f1117", fg = "#0f1117" })

-- 縦棒のwindowセパレータを空白に設定したよ（一バイト文字しか読み込めないので注意） 気になる時はaとかにして再起動するとおもろいかも
vim.opt.fillchars = { vert = ' ' }

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        -- カーソルが常に中央に来るようにscrolloffを極端に大きく設定
        vim.cmd("setlocal scrolloff=999")
    end
})

-- key
vim.g.mapleader = ' ' -- leaderキー
-- スペースキーを無効化
vim.keymap.set({ 'n', 'v' }, '<space>', '<nop>', { silent = true })

-- 移動を楽に
-- vim.keymap.set({ 'n', 'v' }, 'K', '10k', { noremap = true, silent = true })
-- vim.keymap.set({ 'n', 'v' }, 'J', '10j', { noremap = true, silent = true })

-- 上の埋め合わせ
-- vim.keymap.set('n', '<C-J>', 'J', { noremap = true, silent = true })

-- Emacs風のキーバインド
vim.api.nvim_set_keymap('i', '<C-p>', '<Up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-n>', '<Down>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-b>', '<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-f>', '<Right>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-h>', '<BS>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-d>', '<Del>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-a>', '<Home>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-e>', '<End>', { noremap = true, silent = true })

-- Uキーでredo （もとはその行の編集を止めてた）
vim.api.nvim_set_keymap('n', 'U', '<C-r>', { noremap = true, silent = true })

-- 右のfiletreeの表示/非表示
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<cr>', { silent = true })

-- コピペの簡略化
vim.api.nvim_set_keymap('n', '<leader>a', 'ggVG', { noremap = true, silent = true })

-- 画面遷移
vim.keymap.set({ 'n', 'v' }, '<leader>f', '<c-w>w')

-- ペーストが便利かも
vim.api.nvim_set_keymap('n', 'p', ']p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'P', ']P', { noremap = true, silent = true })

-- その他便利設定
vim.keymap.set('i', 'jj', '<esc>', { silent = true }) -- インサートモードを抜ける

-- 検索結果を消す
vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':nohlsearch<CR>', { noremap = true, silent = true })

-- 相対行表示をon/off
vim.api.nvim_set_keymap('n', '<leader>l', ":set relativenumber!<cr>", {})

-- Telescope find_files
vim.api.nvim_set_keymap('n', '<leader>kk', "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })

-- dial.nvimを既存のインクリメント、デクリメントを上書き
local dial = require("dial.map")
vim.api.nvim_set_keymap("n", "<C-a>", dial.inc_normal(), { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-x>", dial.dec_normal(), { noremap = true, silent = true })

-- lazygit呼び出し
vim.api.nvim_set_keymap('n', '<leader>g', ':LazyGit<CR>', { noremap = true, silent = true })
