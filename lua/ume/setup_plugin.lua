-- neovimのもともとの機能を消す
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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
		event = "BufWinEnter", -- ウィンドウが開いたときに読み込み
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
		event = "BufReadPost", -- ファイルを開いたときに読み込む
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
		event = "VeryLazy",
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
		end,
	},

	-- fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
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
		event = "InsertEnter",
		dependencies = { "saadparwaiz1/cmp_luasnip" },
		config = function()
			require("luasnip.loaders.from_lua").load({ paths = vim.fn.expand("~/.config/nvim/lua/ume/snippets/") })
		end,
	},

	-- LSPと補完の設定
	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter" }, -- 挿入モードとコマンドラインモードでロード
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
		config = function()
			require("ume.plugins.gitsigns").setup()
		end,
	},

	-- terminalをだす
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		cmd = { "ToggleTerm", "TermExec" },
		config = function()
			require('toggleterm').setup({
				size = 20, -- サイズはフローティングウィンドウの場合は無視される
				direction = 'float', -- フローティングウィンドウを指定
				float_opts = {
					border = 'curved', -- ボーダーのスタイル（curved, double, single, shadow など）
				},
				shade_terminals = true, -- ターミナルの背景を暗くする
				start_in_insert = true, -- ターミナルを開いたら挿入モードでスタート
			})

			-- フローティングターミナル用のキーマッピング
			vim.keymap.set('n', '<space>t', ':ToggleTerm<CR>', { noremap = true, silent = true, desc = 'Toggle Floating Terminal' })
		end
	},

	{
		'goolord/alpha-nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }, -- アイコンが必要なら
		config = function()
			local alpha = require('alpha')
			local dashboard = require('alpha.themes.dashboard')

			-- シンプルなヘッダー
			dashboard.section.header.val = {
				[[ Welcome to Neovim, うめさん! ]],
				[[ Ready to code 🚀 ]]
			}

			-- シンプルなメニュー
			dashboard.section.buttons.val = {
				dashboard.button("f", " Find file", ":Telescope find_files<CR>"),
				dashboard.button("r", " Recent files", ":Telescope oldfiles<CR>"),
				dashboard.button("e", " see file tree", ":NvimTreeToggle<CR>"),
			}

			-- フッター
			dashboard.section.footer.val = "Have a great coding session!"

			-- 設定を有効化
			alpha.setup(dashboard.config)

			-- 不要な機能を無効化
			vim.cmd([[
	  autocmd FileType alpha setlocal nofoldenable
	  ]])
		end
	}
}, {
	ui = {
		border = "rounded", -- ボーダースタイルを指定（rounded, single, double, solid, shadowなど）
		colors = {
			background = "#161822", -- Icebergのダーク背景色
			border = "#6b7089", -- ボーダー色（淡いグレー）
			title = "#d2d4de", -- タイトルテキストの色（明るいグレー）
			normal = "#c6c8d1", -- 通常のテキスト色（明るいグレー）
			comment = "#6b7089", -- コメント色（落ち着いたグレー）
			error = "#e27878", -- エラーテキストの色（赤みのある色）
		},
	},
	-- 起動速度を早くするための確認用
	-- :Lazy profileでわかる
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"tohtml",
				"zipPlugin",
				"netrwPlugin",
				"tutor",
				"matchit", -- 使っていなければ無効化
				"matchparen", -- 使っていなければ無効化
			},
		},
	},
	debug = false, -- デバッグ情報 いちいちうるさいので、テスト中のみの適用をおすすめ
	profiler = true, -- プロファイラーを有効化
})
