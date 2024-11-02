-- QuickRunの基本設定
vim.g.quickrun_config = {
    _ = {
        outputter = 'error',
		external = 'error',
        ['outputter/error/success'] = 'buffer',
        ['outputter/error/error'] = 'quickfix',
        ['outputter/buffer/split'] = ':botright 10split',
        ['runner'] = 'system',
    },

    -- C言語用の設定
    c = {
        command = 'gcc',
        cmdopt = '-std=c11 -Wall',
        exec = {
            '%c %o %s -o %s:p:r',  -- コンパイル
            '%s:p:r'  -- 実行
        },
        tempfile = '%{tempname()}.c',
        ['hook/sweep/files'] = {'%S:p:r'},
    },

    -- パッケージなしのJava用設定
    java = {
        command = 'javac',
        exec = {
            '%c %s',  -- javacでコンパイル
            'java -cp %S:p:h %S:p:t:r'  -- 実行
        },
        cmdopt = '-encoding UTF-8 -Xlint',
        tempfile = '%{tempname()}.java',
        ['hook/sweep/files'] = {'%S:p:r.class'},
    }
}

-- 標準入力を受け付ける設定
vim.g.quickrun_config.stdin = {
    ['runner'] = 'job',
    ['runner/job/input'] = function()
        return vim.fn.input('Standard Input: ')
    end,
}
