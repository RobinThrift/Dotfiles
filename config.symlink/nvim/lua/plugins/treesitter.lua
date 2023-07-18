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
        config = function(_, opts)
            require("nvim-treesitter.parsers").get_parser_configs().just = {
                install_info = {
                    url = "https://github.com/IndianBoy42/tree-sitter-just", -- local path or git repo
                    files = { "src/parser.c", "src/scanner.cc" },
                    branch = "main",
                    use_makefile = true, -- this may be necessary on MacOS (try if you see compiler errors)
                },
                maintainers = { "@IndianBoy42" },
            }

            require("nvim-treesitter.configs").setup(opts)

            vim.opt.foldmethod = "expr"
            vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
        end,
    },

    {
        "nvim-treesitter/playground",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        lazy = true,
        cmd = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" },
    },

    {
        "IndianBoy42/tree-sitter-just",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        ft = { "just", "justfile" },
    },
}
