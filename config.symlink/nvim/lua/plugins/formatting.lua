return {
    {
        "mhartington/formatter.nvim",

        config = function()
            local utils = require("_utils")

            local deno = function()
                local root_dir = utils.root_pattern("deno.json")(vim.api.nvim_buf_get_name(0))
                if not root_dir then
                    return nil
                end

                return {
                    exe = "deno",
                    args = { "fmt", "-q" },
                    stdin = false,
                    ignore_exitcode = true,
                }
            end

            require("formatter").setup({
                filetype = {
                    go = {
                        require("formatter.filetypes.go").goimports,
                    },
                    json = {
                        require("formatter.filetypes.javascript").prettierd,
                        require("formatter.filetypes.javascript").eslint,
                        deno,
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
                        deno,
                        require("formatter.filetypes.javascript").prettierd,
                        require("formatter.filetypes.javascript").eslint,
                    },
                    typescriptreact = {
                        deno,
                        require("formatter.filetypes.javascript").prettierd,
                        require("formatter.filetypes.javascript").eslint,
                    },
                    python = {
                        require("formatter.filetypes.python").black,
                    },
                    rust = {
                        require("formatter.filetypes.rust").rustfmt,
                    },
                    zig = { require("formatter.filetypes.zig").zigfmt },
                    lua = { require("formatter.filetypes.lua").stylua },
                    proto = {
                        function()
                            return {
                                exe = "protolint",
                                args = { "--fix" },
                                stdin = false,
                                ignore_exitcode = true,
                            }
                        end,
                    },
                },
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
            "json",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "python",
            "rust",
            "zig",
            "lua",
            "proto",
        },

        cmd = "FormatWrite",
    },
}
