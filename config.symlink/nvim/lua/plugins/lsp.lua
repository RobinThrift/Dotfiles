local languages = { "pylsp", "rust_analyzer", "zls", "yamlls" }

vim.keymap.set("n", "K", "", {
    silent = true,
    noremap = true,
    callback = function()
        vim.lsp.buf.hover()
    end,
})

vim.keymap.set("n", "<leader>k", "", {
    silent = true,
    noremap = true,
    callback = function()
        vim.lsp.buf.definition()
    end,
})

vim.keymap.set("n", "<leader>i", "", {
    silent = true,
    noremap = true,
    callback = function()
        vim.lsp.buf.implementation()
    end,
})

vim.api.nvim_create_user_command("Actions", function()
    vim.lsp.buf.code_action()
end, {})

-- Show diagnostic popup on cursor hold
vim.opt.updatetime = 300
vim.api.nvim_create_autocmd("CursorHold", {
    pattern = "*",
    callback = function()
        for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
            if vim.api.nvim_win_get_config(winid).zindex then
                return
            end
        end
        vim.diagnostic.open_float({ focusable = false })
    end,
})

vim.api.nvim_create_user_command("Rename", function()
    vim.lsp.buf.rename()
end, {})

return {
    -- neodev needs to be called BEFORE lspconfig
    {
        "folke/neodev.nvim",

        lazy = true,

        ft = { "lua" },

        opts = {
            library = {
                enabled = true,
                types = true,
                runtime = true,
                plugins = true,
            },

            lspconfig = true,
        },
    },

    {
        "neovim/nvim-lspconfig",
        dependencies = { "hrsh7th/cmp-nvim-lsp" },
        version = false,
        config = function()
            local lspconfig = require("lspconfig")
            local util = require("lspconfig.util")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local function on_attach(client)
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
            end

            lspconfig.gopls.setup({
                capabilities = capabilities,

                on_attach = on_attach,

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
                },
            })

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                        },
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })

            lspconfig.yamlls.setup({
                settings = {
                    yaml = {
                        schemas = {
                            ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                        },
                    },

                    redhat = {
                        telemetry = {
                            enabled = false,
                        },
                    },
                },
            })

            lspconfig.denols.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                root_dir = util.root_pattern("deno.json"),
            })

            lspconfig.vtsls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                root_dir = util.root_pattern("package.json", "tsconfig.json"),
                single_file_support = false, -- must disable so doesn't activate with denols
            })

            for _, language in pairs(languages) do
                lspconfig[language].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                })
            end
        end,
    },

    -- {
    --     "jose-elias-alvarez/null-ls.nvim",
    --     init = function()
    --         vim.opt.signcolumn = "yes"
    --     end,
    --     config = function()
    --         local nls = require("null-ls")
    --         nls.setup({
    --             sources = {
    --                 nls.builtins.formatting.prettierd.with({
    --                     prefer_local = "node_modules/.bin",
    --                     filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "json",
    --                         "graphql" }
    --                 }),
    --
    --                 nls.builtins.diagnostics.eslint.with({ prefer_local = "node_modules/.bin" }),
    --                 nls.builtins.code_actions.eslint.with({ prefer_local = "node_modules/.bin" }),
    --                 nls.builtins.diagnostics.tsc.with({ prefer_local = "node_modules/.bin" }),
    --                 nls.builtins.formatting.goimports,
    --                 nls.builtins.diagnostics.staticcheck,
    --                 nls.builtins.diagnostics.golangci_lint,
    --
    --                 nls.builtins.diagnostics.hadolint,
    --
    --                 nls.builtins.diagnostics.protolint,
    --                 nls.builtins.formatting.protolint,
    --
    --                 nls.builtins.formatting.clang_format,
    --
    --                 nls.builtins.formatting.black,
    --                 nls.builtins.diagnostics.mypy,
    --                 nls.builtins.diagnostics.pydocstyle,
    --                 nls.builtins.diagnostics.pylint,
    --
    --                 nls.builtins.formatting.zigfmt,
    --
    --                 nls.builtins.formatting.rustfmt,
    --
    --                 nls.builtins.code_actions.gitsigns,
    --             },
    --
    --             on_attach = function(client)
    --                 if client.server_capabilities.documentFormattingProvider then
    --                     vim.cmd([[
    --                         augroup LspFormatting
    --                         autocmd! * <buffer>
    --                         autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
    --                         augroup END
    --                     ]])
    --                 end
    --             end,
    --         })
    --     end
    -- },

    {
        "j-hui/fidget.nvim",
        branch = "legacy",
        config = function()
            require("fidget").setup()
        end,
    },
}
