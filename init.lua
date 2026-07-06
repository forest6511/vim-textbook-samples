-- リーダーキーはキーマップ定義より前に決める(後から変えると既存定義に効かない)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("options")
require("keymaps")
require("autocmds")
require("plugins")
require("lsp")
require("treesitter")
