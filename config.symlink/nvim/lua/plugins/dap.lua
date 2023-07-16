return {
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap" },
        cmd = "DapUiToggle",
        lazy = true,

        opts = {
            console = 'integratedTerminal'
        },

        init = function()
            vim.fn.sign_define('DapBreakpoint', {text='•', texthl='red', linehl='', numhl=''})
        end,
    },
}
