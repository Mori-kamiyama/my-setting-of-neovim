-- ~/.config/nvim/snippets/lua.lua
local ls = require("luasnip")  -- LuaSnipをインポート

ls.add_snippets("lua", {
    ls.snippet("func", {
        ls.text_node("function "),
        ls.insert_node(1, "name"),
        ls.text_node("()"),
        ls.insert_node(2),
        ls.text_node({"", "end"})
    }),
	-- 追加していこう
})

