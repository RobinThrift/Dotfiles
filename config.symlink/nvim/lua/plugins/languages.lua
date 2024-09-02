return {
    {
        "rust-lang/rust.vim",
        lazy = true,
        ft = "rust",
    },
    {
        "ziglang/zig.vim",
        lazy = true,
        ft = "zig",
    },
    {
        "hashivim/vim-terraform",
        lazy = true,
        ft = "terraform",
        config = function()
            vim.g.hcl_align = 1
            vim.g.terraform_align = 1
            vim.g.terraform_fmt_on_save = 1
        end,
    },
}
