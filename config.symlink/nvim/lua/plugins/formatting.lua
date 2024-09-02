return {
    {
        "mhartington/formatter.nvim",

        config = function()
            local utils = require("_utils")
            local fmtutil = require("formatter.util")

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

            local biome = function()
                local root_dir = utils.root_pattern("biome.json")(vim.api.nvim_buf_get_name(0))
                if not root_dir then
                    return nil
                end

                local exe = "biome"

                local nm_exe = utils.find_in_node_modules(root_dir, exe)
                if nm_exe ~= nil then
                    exe = nm_exe
                end

                return {
                    exe = exe,
                    args = {
                        "format",
                        "--stdin-file-path",
                        fmtutil.escape_path(fmtutil.get_current_buffer_file_path()),
                    },
                    stdin = true,
                    try_node_modules = true,
                }
            end

            local prettierd = function()
                local biomeOrDeno = vim.fs.find({ "deno.json", "biome.json" }, {
                    upward = true,
                    stop = utils.find_git_root(),
                    path = vim.fs.dirname(vim.api.nvim_buf_get_name(0)),
                    limit = 1,
                })

                if #biomeOrDeno ~= 0 then
                    return nil
                end

                local default = require("formatter.filetypes.javascript").prettierd
                return default()
            end

            require("formatter").setup({
                filetype = {
                    go = {
                        require("formatter.filetypes.go").goimports,
                    },
                    json = {
                        deno,
                        biome,
                        prettierd,
                        require("formatter.filetypes.javascript").eslint,
                    },
                    javascript = {
                        deno,
                        biome,
                        prettierd,
                        require("formatter.filetypes.javascript").eslint,
                    },
                    javascriptreact = {
                        deno,
                        biome,
                        prettierd,
                        require("formatter.filetypes.javascript").eslint,
                    },
                    typescript = {
                        deno,
                        biome,
                        prettierd,
                        require("formatter.filetypes.javascript").eslint,
                    },
                    typescriptreact = {
                        deno,
                        biome,
                        prettierd,
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
                    astro = { require("formatter.filetypes.javascript").prettierd },
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
            "astro",
        },

        cmd = "FormatWrite",
    },
}
