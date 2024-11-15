-- lazy.nvimのインストールコード
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- カラースキーム
    {
        "cocopon/iceberg.vim",
        config = function() vim.cmd("colorscheme iceberg") end,
    },

    -- ファイルツリー
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup()
        end,
    },

    -- 基本依存プラグイン
    { "nvim-lua/plenary.nvim" },

    -- 自動保存
    { "pocco81/auto-save.nvim" },

    -- masonの追加
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },

    -- LSPサーバーの設定
    {
        "neovim/nvim-lspconfig",
        config = function()
            require('mason').setup()
            require('mason-lspconfig').setup_handlers({
                function(server)
                    local opt = {
                        capabilities = require('cmp_nvim_lsp').default_capabilities(
                            vim.lsp.protocol.make_client_capabilities()
                        )
                    }
                    require('lspconfig')[server].setup(opt)
                end
            })
        end
    },

    -- 括弧自動補完
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end,
    },

    -- treesitterの設定
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = { "html", "javascript", "typescript", "c" },
                highlight = { enable = true },
                indent = { enable = true },
            }
        end,
    },

    -- treesitterを用いた行の結合
    {
        "Wansmer/treesj",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("treesj").setup()
        end,
    },

    -- ts用のautotag
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup({
                filetypes = { "html", "javascript", "typescript", "xml", "vue", "svelte" }
            })
        end,
    },

    -- コメントアウト
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup {
                pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
            }
        end,
    },

    -- tsコンテキストコメント
    { "JoosepAlviste/nvim-ts-context-commentstring", dependencies = "nvim-treesitter/nvim-treesitter" },

    -- ファイルの高速実行
    { "thinca/vim-quickrun" },

    -- エラー表示
    { "dense-analysis/ale", config = function() require('ume.plugins.ale') end },

    -- 移動用プラグイン
    {
        "phaazon/hop.nvim",
        branch = "v2",
        config = function()
            require("hop").setup()
            vim.api.nvim_set_keymap("n", "<leader>h", ":HopChar1<cr>", { silent = true })
        end,
    },

    -- fuzzy finder
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- カラーコードプレビュー
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({ "*" })
        end,
    },

    -- Markdown設定
    {
        "ixru/nvim-markdown",
        config = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "markdown",
                command = "setlocal conceallevel=2 concealcursor=nc"
            })
        end,
    },

    -- snippetプラグイン
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets" },
        config = function()
            require("luasnip.loaders.from_lua").load({ paths = vim.fn.expand("~/.config/nvim/lua/ume/snippets/") })
        end,
    },

    -- LSPと補完の設定
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip",
        },
        config = function()
            require("ume.plugins.nvim-cmp")
        end,
    },

    -- surround
    {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({})
        end,
    },

    -- インクリメント・デクリメント
    {
        "monaqa/dial.nvim",
        config = function()
            require("ume.plugins.dial")
        end,
    },

    -- lazygit
    { "kdheepak/lazygit.nvim" },

    -- gitsigns
    {
        "lewis6991/gitsigns.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("ume.plugins.gitsigns").setup()
        end,
    },
})
