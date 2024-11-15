-- プラグイン管理
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- 安定バージョン
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('ume/basic_config')
require('ume/setup_plugin')
require('ume/keymap')
vim.cmd('colorscheme iceberg')
require('ume/plugins/nvim_tree')

-- icebergにある若干の不満を解決
vim.api.nvim_set_hl(0, "WinSeparator", { bg = "#0f1117", fg = "#0f1117" })
vim.api.nvim_set_hl(0, 'WarningMsg', { fg = '#6A708B', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = '#6A708B', bg = 'NONE' })

-- 縦棒のwindowセパレータを空白に設定したよ（一バイト文字しか読み込めないので注意） 気になる時はaとかにして再起動するとおもろいかも
vim.opt.fillchars = { vert = ' ' }

