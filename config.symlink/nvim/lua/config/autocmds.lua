vim.api.nvim_create_autocmd("FileType", {
    pattern = { "go" },
    callback = function()
        local empty = require("go.utils").empty
        local get_test_func_name = function()
            local row, col = unpack(vim.api.nvim_win_get_cursor(0))
            row, col = row, col + 1
            local ns = require("go.ts.go").get_func_method_node_at_pos()
            if empty(ns) then
                return nil
            end
            if ns == nil or ns.name == nil then
                return nil
            end
            if not string.find(ns.name, "[T|t]est") then
                -- not in a test function
                local fns = M.get_testfunc()
                for _, fn in ipairs(fns) do
                    log(fn, ns.name)
                    if string.find(fn:lower(), ns.name:lower()) then
                        ns = { name = fn }
                        return ns
                    end
                end
            end
            return ns
        end

        vim.o.expandtab = false

        -- fmt.Printf word under cursor
        vim.keymap.set("n", "<leader>cl", 'yiwofmt.Printf("<c-r>" %#v\\n", <c-r>")<Esc>^', { silent = true })
        -- fmt.Printf word under cursor as pretty printed json
        vim.keymap.set(
            "n",
            "<leader>jl",
            'yiwofmt.Printf("<c-r>": %s\\n",  func(v any, b *bytes.Buffer) any { e := json.NewEncoder(b); e.SetIndent("", "  "); e.Encode(v); return b.String(); }(<c-r>", bytes.NewBuffer(nil)))<Esc>^',
            { silent = true }
        )

        vim.keymap.set("n", "<leader>t", function()
            local name = get_test_func_name()
            if empty(name) then
                return nil
            end

            vim.cmd("TmuxL go test -v -run " .. name.name .. " ./...")
        end)
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    callback = function()
        vim.opt_local.expandtab = true
        vim.keymap.set("n", "<leader>cl", 'yiwoconsole.log("<c-r>"", <c-r>")<Esc>^', { silent = true })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown" },
    callback = function()
        vim.opt_local.expandtab = true
        vim.opt_local.spell = true
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "just", "justfile" },
    callback = function()
        vim.opt_local.expandtab = true
        vim.opt_local.commentstring = "#%s"
    end,
})
