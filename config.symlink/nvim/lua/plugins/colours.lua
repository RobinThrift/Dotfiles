vim.opt.background = "dark"
vim.opt.cursorline = true
vim.opt.termguicolors = true

return {

    { "arzg/vim-substrata", priority = 1000 },

    {
        "ellisonleao/gruvbox.nvim",
        opts = {
            undercurl = true,
            underline = true,
            bold = true,
            -- italic = true,
            strikethrough = true,
            invert_selection = false,
            invert_signs = false,
            invert_tabline = false,
            invert_intend_guides = false,
            inverse = true, -- invert background for search, diffs, statuslines and errors
            contrast = "hard", -- can be "hard", "soft" or empty string
            overrides = {},
        },
    },

    { "kvrohit/mellow.nvim", priority = 1000 },

    { "mcchrish/zenbones.nvim", priority = 1000 },

    { "nikolvs/vim-sunbather", priority = 1000 },

    { "owickstrom/vim-colors-paramount", priority = 1000 },

    { "pablopunk/sunset.vim", priority = 1000 },

    { "pgavlin/pulumi.vim", priority = 1000 },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 1000,
        opts = {
            dark_variant = "main",
            disable_background = false,
            disable_float_background = false,
            disable_italics = false,
        },
    },

    {
        "sam4llis/nvim-tundra",
        priority = 1000,
        opts = {
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
        },
    },

    { "stillwwater/vim-nebula", priority = 1000 },

    {
        "ramojus/mellifluous.nvim",
        opts = {
            dim_inactive = true,
        },
        priority = 1000,
    },

    { "rebelot/kanagawa.nvim", priority = 1000 },

    { "samharju/serene.nvim", priority = 1000 },

    { "aliqyan-21/darkvoid.nvim", priority = 1000 },

    { "rktjmp/lush.nvim", lazy = true },

    {
        dir = "~/.config/nvim/lua/_colour",
        lazy = false,
        priority = 900,
        init = function()
            require("_colour").setup()
        end,
    },
}
