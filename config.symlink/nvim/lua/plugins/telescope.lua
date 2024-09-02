return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },

        config = function()
            local actions = require("telescope.actions")
            local tsbuiltin = require("telescope.builtin")

            require("telescope").setup({
                defaults = {
                    layout_strategy = "flex",
                    layout_config = {
                        vertical = {
                            width = 0.5,
                        },
                        height = 0.95,
                    },

                    mappings = {
                        i = {
                            ["<esc>"] = actions.close,
                            ["<c-c>"] = actions.close,
                        },
                        n = {
                            ["<c-c>"] = actions.close,
                        },
                    },
                },

                preview = {
                    filesize_limit = 0.1, -- MB
                },

                pickers = {
                    find_files = { theme = "ivy" },
                    git_files = { theme = "ivy" },
                    buffers = {
                        theme = "ivy",
                        mappings = {
                            i = {
                                ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
                            },
                        },
                    },
                    colorscheme = { theme = "ivy" },
                    marks = { theme = "ivy" },
                    quickfix = { theme = "ivy" },
                    jumplist = { theme = "ivy" },
                    diagnostics = { theme = "ivy" },
                    lsp_document_symbols = { theme = "ivy" },
                    lsp_workspace_symbols = { theme = "ivy" },
                    lsp_dynamic_workspace_symbols = { theme = "ivy" },
                    lsp_references = { theme = "cursor", previewer = false },
                },
            })

            vim.keymap.set("n", "<leader>e", function()
                tsbuiltin.find_files({ sort_mru = true })
            end)

            vim.keymap.set("n", "<leader>g", function()
                tsbuiltin.git_files({ sort_mru = true })
            end)

            vim.keymap.set("n", "<leader>b", function()
                tsbuiltin.buffers({ sort_mru = true })
            end)

            vim.keymap.set("n", "<leader>s", function()
                tsbuiltin.lsp_document_symbols()
            end)

            vim.api.nvim_create_user_command("Grep", function()
                tsbuiltin.live_grep()
            end, {})

            vim.api.nvim_create_user_command("Colors", function()
                tsbuiltin.colorscheme()
            end, {})

            vim.api.nvim_create_user_command("Marks", function()
                tsbuiltin.marks({ sort_mru = true })
            end, {})

            vim.api.nvim_create_user_command("QF", function()
                tsbuiltin.quickfix()
            end, {})

            vim.api.nvim_create_user_command("JL", function()
                tsbuiltin.jumplist()
            end, {})

            vim.api.nvim_create_user_command("Syms", function()
                tsbuiltin.lsp_document_symbols()
            end, {})

            vim.api.nvim_create_user_command("WSyms", function()
                tsbuiltin.lsp_dynamic_workspace_symbols()
            end, {})

            vim.api.nvim_create_user_command("Diags", function()
                tsbuiltin.diagnostics()
            end, {})

            vim.api.nvim_create_user_command("Refs", function()
                tsbuiltin.lsp_references()
            end, {})
        end,
    },
}
