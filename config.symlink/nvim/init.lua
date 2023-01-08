-- ██████   █████ █████   █████ █████ ██████   ██████
-- ░░██████ ░░███ ░░███   ░░███ ░░███ ░░██████ ██████ 
--  ░███░███ ░███  ░███    ░███  ░███  ░███░█████░███ 
--  ░███░░███░███  ░███    ░███  ░███  ░███░░███ ░███ 
--  ░███ ░░██████  ░░███   ███   ░███  ░███ ░░░  ░███ 
--  ░███  ░░█████   ░░░█████░    ░███  ░███      ░███ 
--  █████  ░░█████    ░░███      █████ █████     █████
-- ░░░░░    ░░░░░      ░░░      ░░░░░ ░░░░░     ░░░░░ 

-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', { command = 'source <afile> | PackerCompile', group = packer_group, pattern = 'init.lua' })

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    -- use 'nvim-treesitter/playground'

    use 'christoomey/vim-tmux-navigator'

    use 'tpope/vim-surround'
    use 'Raimondi/delimitMate' 
    use 'tpope/vim-commentary'

    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use 'neovim/nvim-lspconfig'

    -- use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

    use 'phaazon/hop.nvim'
    use {
        'koenverburg/peepsight.nvim',
        config = function()
            require('peepsight').setup({
              -- go
              "function_declaration",
              "method_declaration",
              "func_literal",

              -- typescript
              "class_declaration",
              "method_definition",
              "arrow_function",
              "function_declaration",
              "generator_function_declaration"
            })
        end
    }

    use {
      'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup({
            signcolumn = false,
        })
        vim.cmd('highlight link gitsignscurrentlineblame Comment')
      end
    }

    -- Autocomplete stuff
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    use 'jose-elias-alvarez/null-ls.nvim'

    -- debuger
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'

    -- Language Support
    use 'ray-x/go.nvim'
    use 'ray-x/guihua.lua'

    use 'rust-lang/rust.vim'

    use 'othree/yajs.vim'
    use 'HerringtonDarkholme/yats.vim'

    -- zig
    use 'ziglang/zig.vim'

    -- search replace
    use 'windwp/nvim-spectre'

    -- database
    -- use 'tpope/vim-dadbod'
    -- use 'kristijanhusak/vim-dadbod-ui'

    use 'rktjmp/lush.nvim'
    -- colour schemes
    use 'ellisonleao/gruvbox.nvim'
    use 'arzg/vim-substrata'
    use 'whatyouhide/vim-gotham'
    use 'nikolvs/vim-sunbather'
    use 'stillwwater/vim-nebula'
    use 'pablopunk/sunset.vim'
    use 'pgavlin/pulumi.vim'
    use { 'rose-pine/neovim', as = 'rose-pine' }
    use 'owickstrom/vim-colors-paramount'
    use 'mcchrish/zenbones.nvim'
    use 'cocopon/iceberg.vim'
    use 'sam4llis/nvim-tundra'
    use 'frenzyexists/aquarium-vim'
    use 'nyoom-engineering/oxocarbon.nvim'
    use {
      "jesseleite/nvim-noirbuddy",
      requires = { "tjdevries/colorbuddy.nvim", branch = "dev" }
    }
end)


-- TREE SITTER

require('nvim-treesitter.configs').setup {
    ensure_installed = { "c", "lua", "rust", "go", "javascript", "tsx", "vim", "python", "json" },
    highlight = {
        enable = true
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = 'gnn',
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm',
        },
    },
    indent = {
        enable = true,
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
            },
        },
    },
}

-- LSP CAPABILITIES
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- COLOURSCHEME AND STYLES
require('rose-pine').setup({
	---@usage 'main'|'moon'
	dark_variant = 'main',
	disable_background = false,
	disable_float_background = false,
	disable_italics = false,
})

require('nvim-tundra').setup({
    syntax = {
        comments = { italic = true },
        types = { italic = true },
    },
    plugins = {
        lsp = true,
        treesitter = true,
        cmp = true,
        context = true,
        dbui = true,
        gitsigns = true,
        telescope = true,
    },
})

require('gruvbox').setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = true,
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "hard", -- can be "hard", "soft" or empty string
    overrides = {},
})

vim.opt.fillchars = {
  vert = "│",
}
vim.o.laststatus = 2

vim.o.background= 'dark'
vim.o.cursorline = true
vim.o.termguicolors = true
vim.cmd [[colorscheme sunbather]]

-- require('noirbuddy').setup {
--   preset = 'miami-nights',
--   styles = {
--     italic = true,
--     bold = false,
--     underline = false,
--     undercurl = true,
--   },
-- }


-- statusline
vim.o.statusline = '%= %m%f %y %l:%c  '


-- MAPPINGS

vim.g.mapleader = ','

-- switch to last used buffer
vim.keymap.set('n', '<leader>l', '<cmd>b#<CR>')

-- Use ctrl-[hjkl] to select the active split
vim.api.nvim_set_keymap('n', 'c-k', '<cmd>wincmd k<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'c-j', '<cmd>wincmd j<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'c-h', '<cmd>wincmd h<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'c-l', '<cmd>wincmd l<CR>', { silent = true })


-- open file under cursor in splits
vim.keymap.set('n', 'gfv', '<cmd>vertical wincmd f<CR>')
vim.keymap.set('n', 'gfs', '<cmd>wincmd f<CR>')
vim.keymap.set('n', 'gfc', 'gf')

-- quickfix navigation
vim.api.nvim_set_keymap('n', ']q', '<cmd>cn<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '[q', '<cmd>cp<CR>', { silent = true })

-- TELESCOPE

require('telescope').setup {
    defaults = {
        layout_strategy = 'horizontal',
        layout_config = {
            vertical = {
                width = 0.5, 
            },
            height = 0.95,
        },

        mappings = {
            i = {
                ['<esc>'] = require('telescope.actions').close,
                ['<c-c>'] = require('telescope.actions').close,
            },
            n = {
                ['<c-c>'] = require('telescope.actions').close,
            },
        }
    },

    preview = true,

    pickers = {
        find_files = { theme = 'ivy' },
        git_files = { theme = 'ivy' },
        buffers = { theme = 'ivy' },
        colorscheme = { theme = 'ivy' },
        marks = { theme = 'ivy' },
        quickfix = { theme = 'ivy' },
        jumplist = { theme = 'ivy' },
        diagnostics = { theme = 'ivy' },
        lsp_document_symbols = { theme = 'ivy' },
        lsp_workspace_symbols = { theme = 'ivy' },
        lsp_dynamic_workspace_symbols = { theme = 'dropdown' },
        lsp_references = { theme = 'cursor' },
        lsp_code_actions = { theme = 'cursor' },
    },
}

vim.keymap.set('n', '<leader>e', function() require('telescope.builtin').find_files({ sort_mru=true }) end)
vim.keymap.set('n', '<leader>g', function() require('telescope.builtin').git_files({ sort_mru=true }) end)
vim.keymap.set('n', '<leader>b', function() require('telescope.builtin').buffers({ sort_mru=true }) end)

vim.api.nvim_create_user_command("Colors", function(args) require('telescope.builtin').colorscheme() end, {})
vim.api.nvim_create_user_command("Marks", function(args) require('telescope.builtin').marks({ sort_mru=true }) end, {})
vim.api.nvim_create_user_command("QF", function(args) require('telescope.builtin').quickfix() end, {})
vim.api.nvim_create_user_command("JL", function(args) require('telescope.builtin').jumplist() end, {})
vim.api.nvim_create_user_command("Syms", function(args) require('telescope.builtin').lsp_document_symbols() end, {})
vim.api.nvim_create_user_command("WSyms", function(args) require('telescope.builtin').lsp_dynamic_workspace_symbols() end, {})
vim.api.nvim_create_user_command("Actions", function(args) require('telescope.builtin').lsp_code_actions() end, {})
vim.api.nvim_create_user_command("Diags", function(args) require('telescope.builtin').diagnostics() end, {})
vim.api.nvim_create_user_command("Refs", function(args) require('telescope.builtin').lsp_references() end, {})

vim.api.nvim_create_user_command("Spectre", function(args) require('spectre').open() end, {})
vim.api.nvim_create_user_command("QFDiags", function(args) vim.diagnostic.setqflist() end, {})

-- FILETYPES

-- JavaScript

-- console.log word under cursor
local consoleLogCmd = function()
    vim.keymap.set('n', '<leader>cl', 'yiwoconsole.log("<c-r>"", <c-r>")<Esc>^')
end

vim.api.nvim_create_autocmd('FileType', {
    pattern = "typescript",
    callback = consoleLogCmd,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = "javascript",
    callback = consoleLogCmd,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = "javascriptreact",
    callback = consoleLogCmd,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = "typescriptreact",
    callback = consoleLogCmd,
})

-- Go
require('go').setup {
    -- goimport = 'gopls', -- if set to 'gopls' will use golsp format
    -- gofmt = 'goimports', -- if set to gopls will use golsp format
    goimport = false, -- if set to 'gopls' will use golsp format
    gofmt = false, -- if set to gopls will use golsp format
    lsp_cfg = false, -- false: use your own lspconfig
    lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
    lsp_on_attach = false, -- use on_attach from go.nvim
    lsp_codelens = false,
    dap_debug = true,
}


vim.api.nvim_create_autocmd('FileType', {
    pattern = "go",
    callback = function()
        -- fmt.Printf word under cursor
        vim.keymap.set('n', '<leader>cl', 'yiwofmt.Printf("<c-r>" %#v\\n", <c-r>")<Esc>^')
        -- fmt.Printf word under cursor as pretty printed json
        vim.keymap.set('n', '<leader>jl', 'yiwofmt.Printf("<c-r>" %s\\n",  func() any { var b bytes.Buffer; e := json.NewEncoder(&b); e.SetIndent("", "  "); if err := e.Encode(<c-r>"); err != nil { panic(err) }; return b; }())<Esc>^')

        vim.o.expandtab = false
    end,
})


-- LSP

vim.api.nvim_set_keymap('n', 'K', '', {
    silent = true,
    noremap = true,
    callback = function()
        vim.lsp.buf.hover()
    end,
})

vim.api.nvim_set_keymap('n', '<leader>k', '', {
    silent = true,
    noremap = true,
    callback = function()
        vim.lsp.buf.definition()
    end,
})

vim.api.nvim_set_keymap('n', '<leader>i', '', {
    silent = true,
    noremap = true,
    callback = function()
        vim.lsp.buf.implementation()
    end,
})


vim.api.nvim_create_user_command("Rename", function(args) vim.lsp.buf.rename() end, {})

-- Show diagnostic popup on cursor hold
-- vim.o.updatetime = 300
-- vim.api.nvim_create_autocmd('CursorHold', {
--     pattern = "*",
--     callback = function()
--         vim.diagnostic.open_float()
--     end,
-- })


-- AUTOCOMPLETE
vim.o.completeopt = "menu,menuone,noselect"

local cmp = require( 'cmp' )
cmp.setup({
    snippet = {
        -- fix because no snippet engine atm.
        --expand = function() end
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        end,
        --expand = function(args)
        --  local line_num, col = unpack(vim.api.nvim_win_get_cursor(0))
        --  local line_text = vim.api.nvim_buf_get_lines(0, line_num - 1, line_num, true)[1]
        --  local indent = string.match(line_text, '^%s*')
        --  local replace = vim.split(args.body, '\n', true)
        --  local surround = string.match(line_text, '%S.*') or ''
        --  local surround_end = surround:sub(col)
        --  local endCol = col

        --  replace[1] = surround:sub(0, col - 1)..replace[1]
        --  replace[#replace] = replace[#replace]..(#surround_end > 1 and ' ' or '')..surround_end
        --  if indent ~= '' then
        --    for i, line in ipairs(replace) do
        --      replace[i] = indent..line
        --      endCol = col + string.len(replace[i])
        --    end
        --  end

        --  vim.api.nvim_buf_set_lines(0, line_num - 1, line_num, true, replace)
        --  vim.api.nvim_win_set_cursor(0, { line_num, endCol })
        --end,
    },

    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        --['<CR>'] = function(fallback)
        --  if cmp.visible() then
        --    cmp.confirm({ select = true }) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        --  else
        --    fallback() -- If you are using vim-endwise, this fallback function will be behaive as the vim-endwise.
        --  end
        --end
    }),

    sources = cmp.config.sources(
        {
            { name = 'nvim_lsp' },
        },
        {
            { name = 'buffer' },
        }
    ),

    experimental = {
        ghost_text = true,
    },
})


-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    sources = {{ name = 'buffer' }}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    sources = cmp.config.sources(
        { { name = 'path' } },
        { { name = 'cmdline' } }
    )
})

-- Setup lspconfig.

require('lspconfig')['gopls'].setup {
    capabilities = capabilities,

    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end,

    settings = {
        gopls = {
            experimentalPostfixCompletions = true,
            analyses = {
                unreachable = true,
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
            codelenses = {
                generate = true,
                gc_details = true,
                regenerate_cgo = true,
            },
        },
    },

    init_options = {
        usePlaceholders = true,
    }
}

require('lspconfig')['tsserver'].setup {
    capabilities = capabilities,
    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end,
}

require('lspconfig')['pylsp'].setup {
    capabilities = capabilities,
    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end,
}

require('lspconfig')['rust_analyzer'].setup {
    capabilities = capabilities,
    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end,
}

require('lspconfig').zls.setup{
    capabilities = capabilities,
    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end,
}

require('hop').setup()

-- LINTING/FORMATTING/FIXING/ETC

vim.o.signcolumn = "yes"

require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.prettierd.with({
            prefer_local = "node_modules/.bin",
            filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "json", "graphql" }
        }),
        require("null-ls").builtins.diagnostics.eslint.with({
            prefer_local = "node_modules/.bin",
        }),
        require("null-ls").builtins.code_actions.eslint.with({
            prefer_local = "node_modules/.bin",
        }),
        require("null-ls").builtins.diagnostics.tsc.with({
            prefer_local = "node_modules/.bin",
        }),

        require("null-ls").builtins.formatting.goimports,
        require("null-ls").builtins.diagnostics.staticcheck,

        require("null-ls").builtins.diagnostics.hadolint,

        require("null-ls").builtins.diagnostics.protolint,
        require("null-ls").builtins.formatting.protolint,

        require("null-ls").builtins.formatting.clang_format,

        require("null-ls").builtins.formatting.black,
        require("null-ls").builtins.diagnostics.mypy,
        require("null-ls").builtins.diagnostics.pydocstyle,
        require("null-ls").builtins.diagnostics.pylint,

        require("null-ls").builtins.formatting.zigfmt,

        require("null-ls").builtins.formatting.rustfmt,

        require("null-ls").builtins.code_actions.gitsigns,
    },
    on_attach = function(client)
        if client.server_capabilities.documentFormattingProvider then
            vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
            augroup END
            ]])
        end
    end,
})


-- DELMIMATE
vim.g.delimitMate_balance_matchpairs = 1
vim.g.delimitMate_expand_cr = 1
vim.g.delimitMate_jump_expansion = 1


-- DIFFVIEW

-- require('diffview').setup {
--     use_icons = false,
-- }

-- Other

vim.o.expandtab = true
vim.o.smarttab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.scrolloff = 3

-- Auto indent
vim.o.ai = true
-- Smart indent
vim.o.si = true
-- Don't wrap lines
vim.o.wrap = false

-- allow clipboard
vim.o.clipboard = 'unnamed,unnamedplus'

vim.o.errorbells = false
vim.o.visualbell = false

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.showmatch = true

vim.o.hidden = true
vim.o.list = true
vim.opt.listchars = {
    tab = '∙ ',
    eol = '¬',
    extends = '…',
    precedes = '…',
}

-- search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.incsearch = true
-- regex magic 
vim.o.magic = true

vim.api.nvim_set_keymap('n', '<esc>', '<cmd>noh<cr><esc>', { noremap = true, silent = true })

vim.o.encoding = 'utf8'

vim.o.ffs = 'unix,dos,mac'

vim.o.backup = false
vim.o.swapfile = false
vim.o.wb = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath 'data' .. 'undo'

-- folds
-- prevent all folds to be open until closed
vim.opt.foldenable = false
vim.opt. foldmethod = "expr"
vim.opt. foldexpr = "nvim_treesitter#foldexpr()"

-- Prefer ripgrep if it exists
if vim.fn.executable("rg") > 0 then
  vim.o.grepprg = "rg --vimgrep"
  -- vim.o.grepprg = "rg --hidden --glob '!.git' --no-heading --smart-case --vimgrep --follow $*"
  -- vim.opt.grepformat = vim.opt.grepformat ^ { "%f:%l:%c:%m" }
end
