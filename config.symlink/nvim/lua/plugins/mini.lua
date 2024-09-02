return {
    {
        "echasnovski/mini.nvim",
        version = false,
        config = function()
            require("mini.starter").setup()

            require("mini.comment").setup()

            require("mini.bracketed").setup()

            require("mini.ai").setup()

            require("mini.surround").setup({
                mappings = {
                    replace = "cs",
                },
            })

            require("mini.pairs").setup()

            require("mini.jump2d").setup({
                mappings = {
                    start_jumping = "<leader>q",
                },
            })

            require("mini.git").setup()
        end,
    },
}
