require('packer').startup(function()
    -- 絶対必須。プラグインの元
    use 'wbthomason/packer.nvim'

    -- カラースキーム
    use 'cocopon/iceberg.vim'

    -- 右側にfiletreeを表示
    use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' } }

    -- いろいろなプラグインの依存元
    use 'nvim-lua/plenary.nvim'

    -- アイコンの設定（filetree用）
    use 'nvim-tree/nvim-web-devicons'

    -- 保留中のgit操作関連
    use 'lewis6991/gitsigns.nvim'
	use 'dinhhuy258/git.nvim'

    -- 自動保存
    use 'pocco81/auto-save.nvim'

    -- masonの追加
    use { 'williamboman/mason.nvim' }
    use { 'williamboman/mason-lspconfig.nvim' }  -- mason-lspconfigの追加

    -- LSPサーバーの設定
    use { 'neovim/nvim-lspconfig' }  -- lspconfigの追加

    -- かっこの自動補完
    use { 'windwp/nvim-autopairs', config = function()
        require('nvim-autopairs').setup{}
    end }

    -- treesitterの設定（シンタックスハイライト）
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = { "html", "javascript", "typescript", "c" },
                highlight = { enable = true },
                indent = { enable = true },
            }
        end
    }

	-- treesitterを用いて、行の結合を設定
	use {
		'Wansmer/treesj',
		requires = { 'nvim-treesitter/nvim-treesitter' },
		config = function()
			require('treesj').setup({
				-- 必要に応じて設定
			})
		end
	}

    -- ts用のautotag
    use {
        'windwp/nvim-ts-autotag',
        config = function()
            require('nvim-ts-autotag').setup({
                filetypes = { "html", "javascript", "typescript", "xml", "vue", "svelte" }
            })
        end
    }

    -- コメントアウトを簡単にするプラグイン
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup {
                pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
            }
        end
    }

    -- tsコンテキストコメント用プラグイン
    use {
        'JoosepAlviste/nvim-ts-context-commentstring',
        requires = 'nvim-treesitter/nvim-treesitter',
    }

    -- ファイルの高速実行用
    use 'thinca/vim-quickrun'

    -- エラー表示
    use 'dense-analysis/ale'

    -- 移動用プラグイン
    use {
        'phaazon/hop.nvim',
        branch = 'v2',
        config = function()
            require'hop'.setup{}
            vim.api.nvim_set_keymap('n', '<leader>h', ":HopChar1<cr>", {silent = true})
        end
    }

    -- fuzzy finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- カラーコードプレビュー
    use 'norcalli/nvim-colorizer.lua'
    require'colorizer'.setup({
        '*'; -- 全てのファイルタイプで有効化
    })

    -- Markdown設定
    use {
        'ixru/nvim-markdown',
        config = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "markdown",
                command = "setlocal conceallevel=2 concealcursor=nc"
            })
        end
    }

    -- LSPと補完の設定
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip'
        },
        config = function()
            require('ume.plugins.nvim-cmp')
        end
    }

	use({
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({})
		end
	})

	-- キーをわかりやすくする-
	-- use {
		-- "folke/which-key.nvim",
		-- config = function()
			-- require("ume.plugins.which-key").setup {

			-- }
		-- end
	-- }

	-- インクリメント、ディクリメントを直感的に
	-- 結構空気のような存在だが、いないと困る。
	use {
		'monaqa/dial.nvim',
		config = function()
			require('ume.plugins.dial')  -- 別ファイルの設定を読み込む
		end
	}
end)

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
