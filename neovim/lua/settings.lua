local opt = vim.opt
opt.number = true
opt.relativenumber = true

local indent = 2
opt.tabstop = indent
opt.softtabstop = indent
opt.shiftwidth = indent
opt.smarttab = true
opt.expandtab = true

opt.list = true
opt.listchars = "trail:$,tab:>-"

opt.mouse = 'a'

opt.completeopt = 'menu,menuone,noselect'

if not vim.g.vscode then
	vim.cmd.colorscheme "catppuccin-macchiato"
end
