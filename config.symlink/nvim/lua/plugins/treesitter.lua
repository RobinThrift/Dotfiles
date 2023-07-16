return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = {
                ensure_installed = { "c", "lua", "rust", "go", "javascript", "tsx", "vim", "python", "json", "yaml" },
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
            },
    },

    {
        "IndianBoy42/tree-sitter-just",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        lazy = true,
        ft = { "just", "justfile" },
        build = function ()
            require("nvim-treesitter.parsers").get_parser_configs().just = {
                install_info = {
                    url = "https://github.com/IndianBoy42/tree-sitter-just", -- local path or git repo
                    files = { "src/parser.c", "src/scanner.cc" },
                    branch = "main",
                    use_makefile = true -- this may be necessary on MacOS (try if you see compiler errors)
                },
                maintainers = { "@IndianBoy42" },
            }
        end
    }
}
