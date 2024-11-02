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
vim.keymap.set({ 'n', 'v' }, 's', '<nop>', { silent = true })
-- 右のfiletreeの表示/非表示
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<cr>', { silent = true })
-- コピペの簡略化
vim.api.nvim_set_keymap('n', '<leader>a', 'ggVG', { noremap = true, silent = true })
-- 画面遷移
vim.keymap.set({ 'n', 'v' }, '<leader>f', '<c-w>w')
-- その他便利設定
vim.keymap.set('i', 'jj', '<esc>', { silent = true }) -- インサートモードを抜ける
vim.keymap.set('n', ';', ':', { silent = true })      -- シフトを押すことなく、;を入力する。割と便利

vim.api.nvim_set_keymap('n', '<leader>l', ":set relativenumber!<cr>", {})

vim.api.nvim_set_keymap('n', '<leader>kk', "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })

