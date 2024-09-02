local languages = { "pylsp", "zls", "astro", "terraformls", "tflint", "tilt_ls" }

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
            local utils = require("_utils")

            lspconfig.util.on_setup = lspconfig.util.add_hook_before(lspconfig.util.on_setup, function(config)
                if config.name == "biome" then
                    local exe = utils.find_in_node_modules(
                        utils.root_pattern("biome.json")(vim.api.nvim_buf_get_name(0)),
                        "biome"
                    )

                    if exe ~= nil then
                        config.autostart = true
                        config.cmd = { exe, "lsp-proxy" }
                    end
                end
            end)

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
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    yaml = {
                        keyOrdering = false,

                        schemas = {
                            ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                            ["/Users/robin/spacefleet/core/sdk/_shared/schemas/v1/schemas/resources/mission.json"] = {
                                "missions/*",
                                "missions/*/*",
                            },
                        },
                        schemaDownload = { enable = true },
                        validate = true,
                        completion = true,
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

            lspconfig.biome.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                autostart = false,
            })

            lspconfig.vtsls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                root_dir = util.root_pattern("package.json", "tsconfig.json"),
                single_file_support = false, -- must disable so doesn't activate with denols
            })

            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    rust_analyzer = {
                        cargo = {
                            extraEnv = { CARGO_PROFILE_RUST_ANALYZER_INHERITS = "dev" },
                            extraArgs = { "--profile", "rust-analyzer" },
                        },
                    },
                },
            })

            for _, language in pairs(languages) do
                lspconfig[language].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                })
            end
        end,
    },

    {
        "j-hui/fidget.nvim",
        branch = "legacy",
        config = function()
            require("fidget").setup()
        end,
    },
}
