return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "bash",
                "c",
                "css",
                "dockerfile",
                "go",
                "hcl",
                "javascript",
                "json",
                "lua",
                "markdown",
                "proto",
                "python",
                "rust",
                "scss",
                "sql",
                "toml",
                "tsx",
                "vim",
                "yaml",
                "zig",
            },
            highlight = {
                enable = true,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gnn",
                    node_incremental = "grn",
                    scope_incremental = "grc",
                    node_decremental = "grm",
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
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                    },
                },
            },
        },
    },

    {
        "nvim-treesitter/playground",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        lazy = true,
        cmd = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" },
    },

    {
        "NoahTheDuke/vim-just",
        ft = { "just" },
    },
}
