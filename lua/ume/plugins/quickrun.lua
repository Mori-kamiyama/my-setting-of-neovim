-- QuickRunの基本設定
vim.g.quickrun_config = {
	_ = {
		runner = 'terminal',
		outputter = 'terminal',
		['outputter/terminal/opener'] = 'botright 10split',
	},

	-- -- C言語用の設定
	-- c = {
	-- 	command = 'gcc',
	-- 	cmdopt = '-std=c11 -Wall',
	-- 	exec = {
	-- 		'%c %o %s -o %s:p:r',  -- コンパイル
	-- 		'%s:p:r'  -- 実行
	-- 	},
	-- 	tempfile = '%{tempname()}.c',
	-- 	['hook/sweep/files'] = {'%S:p:r'},
	-- },
	--
	-- -- Java用の設定
	-- java = {
	-- 	command = 'javac',
	-- 	exec = {
	-- 		'%c %s',  -- コンパイル
	-- 		'java -cp %S:p:h %S:p:t:r'  -- 実行
	-- 	},
	-- 	cmdopt = '-encoding UTF-8 -Xlint',
	-- 	tempfile = '%{tempname()}.java',
	-- 	['hook/sweep/files'] = {'%S:p:r.class'},
	-- },
}
