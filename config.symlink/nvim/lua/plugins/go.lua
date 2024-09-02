return {
    {
        "ray-x/go.nvim",
        dependencies = { "ray-x/guihua.lua" },
        lazy = true,
        ft = { "go", "gomod", "gosum", "gotexttmpl" },
        opts = {
            tag_transform = "camelcase",
            icons = { breakpoint = "•", currentpos = ">" },
            -- goimport = 'gopls', -- if set to 'gopls' will use golsp format
            -- gofmt = 'goimports', -- if set to gopls will use golsp format
            goimport = nil, -- if set to 'gopls' will use golsp format
            gofmt = false, -- if set to gopls will use golsp format
            lsp_cfg = false, -- false: use your own lspconfig
            lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
            lsp_on_attach = false, -- use on_attach from go.nvim
            lsp_codelens = false,
            dap_debug = true,
            dap_debug_vt = false,
            build_tags = "dev",
        },
    },
}
