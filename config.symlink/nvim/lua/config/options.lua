vim.opt.scrolloff = 3

vim.opt.laststatus = 2

vim.opt.wrap = false -- don"t wrap lines

-- mouse
vim.opt.mouse = ""

-- splits
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.fillchars = {
  vert = "│",
}

-- indentation
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.ai = true -- auto indent
vim.opt.si = true -- smart indent

-- allow clipboard
vim.o.clipboard = "unnamed,unnamedplus"

-- errors
vim.opt.errorbells = false
vim.opt.visualbell = false

-- hidden chars
vim.opt.hidden = true
vim.opt.list = true
vim.opt.listchars = {
    tab = "∙ ",
    eol = "¬",
    extends = "…",
    precedes = "…",
}

-- search
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.magic = true -- regex magic 

-- file handling
vim.opt.encoding = "utf8"
vim.o.ffs = "unix,dos,mac"

-- undo
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.wb = false
vim.opt.undofile = true
vim.o.undodir = vim.fn.stdpath "data" .. "undo"


-- folds
vim.opt.foldenable = false -- prevent all folds to be open until closed
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Prefer ripgrep if it exists
if vim.fn.executable("rg") > 0 then
  vim.o.grepprg = "rg --vimgrep"
end

