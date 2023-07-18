return {
    {
        "mhartington/formatter.nvim",

        config = function ()
            local util = require("formatter.util")

            require("formatter").setup({
                filetype = {
                    go = {
                        require("formatter.filetypes.go").goimports,
                    },
                    javascript = {
                        require("formatter.filetypes.javascript").prettierd,
                        require("formatter.filetypes.javascript").eslint,
                    },
                    javascriptreact = {
                        require("formatter.filetypes.javascript").prettierd,
                        require("formatter.filetypes.javascript").eslint,
                    },
                    typescript = {
                        require("formatter.filetypes.javascript").prettierd,
                        require("formatter.filetypes.javascript").eslint,
                    },
                    typescriptreact = {
                        require("formatter.filetypes.javascript").prettierd,
                        require("formatter.filetypes.javascript").eslint,
                    },
                    python = {
                        require("formatter.filetypes.python").black,
                    },
                    rust = {
                        require("formatter.filetypes.rust").rustfmt,
                    },
                    zig = { require("formatter.filetypes.zig").zigfmt, },
                    lua = { require("formatter.filetypes.lua").stylua },
                    proto = {
                        function ()
                            return {
                                exe = "protolint",
                                args = { "--fix" },
                                stdin = false,
                                ignore_exitcode = true,
                            }
                        end
                    }
                }
            })

            vim.cmd([[
                augroup FormatAutogroup
                autocmd!
                autocmd BufWritePost * FormatWrite
                augroup END
            ]])
        end,

        ft = {
            "go",
            "javascript", "javascriptreact",
            "typescript", "typescriptreact",
            "python",
            "rust",
            "zig",
            "lua",
            "proto",
        },

        cmd = "FormatWrite",
    },
}
