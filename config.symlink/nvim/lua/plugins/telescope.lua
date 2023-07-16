return {
    {
        "nvim-telescope/telescope.nvim", tag = '0.1.1',
        dependencies = { "nvim-lua/plenary.nvim" },

        opts = {
            defaults = {
                layout_strategy = 'horizontal',
                layout_config = {
                    vertical = {
                        width = 0.5,
                    },
                    height = 0.95,
                },

                mappings = {
                    i = {
                        ['<esc>'] = require('telescope.actions').close,
                        ['<c-c>'] = require('telescope.actions').close,
                    },
                    n = {
                        ['<c-c>'] = require('telescope.actions').close,
                    },
                }
            },

            preview = true,

            pickers = {
                find_files = { theme = 'ivy' },
                git_files = { theme = 'ivy' },
                buffers = { theme = 'ivy' },
                colorscheme = { theme = 'ivy' },
                marks = { theme = 'ivy' },
                quickfix = { theme = 'ivy' },
                jumplist = { theme = 'ivy' },
                diagnostics = { theme = 'ivy' },
                lsp_document_symbols = { theme = 'ivy' },
                lsp_workspace_symbols = { theme = 'ivy' },
                lsp_dynamic_workspace_symbols = { theme = 'ivy' },
                lsp_references = { theme = 'cursor', previewer = false },
            },
        },

        init = function()
            local tsbuiltin = require("telescope.builtin")

            vim.keymap.set('n', '<leader>e', function() tsbuiltin.find_files({ sort_mru=true }) end)
            vim.keymap.set('n', '<leader>g', function() tsbuiltin.git_files({ sort_mru=true }) end)
            vim.keymap.set('n', '<leader>b', function() tsbuiltin.buffers({ sort_mru=true }) end)
            vim.keymap.set('n', '<leader>s', function() tsbuiltin.lsp_document_symbols() end)

            vim.api.nvim_create_user_command("Grep", function() tsbuiltin.live_grep() end, {})
            vim.api.nvim_create_user_command("Colors", function() tsbuiltin.colorscheme() end, {})
            vim.api.nvim_create_user_command("Marks", function() tsbuiltin.marks({ sort_mru=true }) end, {})
            vim.api.nvim_create_user_command("QF", function() tsbuiltin.quickfix() end, {})
            vim.api.nvim_create_user_command("JL", function() tsbuiltin.jumplist() end, {})
            vim.api.nvim_create_user_command("Syms", function() tsbuiltin.lsp_document_symbols() end, {})
            vim.api.nvim_create_user_command("WSyms", function() tsbuiltin.lsp_dynamic_workspace_symbols() end, {})
            vim.api.nvim_create_user_command("Diags", function() tsbuiltin.diagnostics() end, {})
            vim.api.nvim_create_user_command("Refs", function() tsbuiltin.lsp_references() end, {})
        end
    }
}
