local M = {}

M.find_git_root = function()
    local items = vim.fs.find({ ".git" }, {
        upward = true,
        stop = vim.loop.os_homedir(),
        path = vim.fs.dirname(vim.api.nvim_buf_get_name(0)),
        limit = 1,
    })

    if #items == 0 then
        return nil
    end

    return items[1]
end

M.path_exists = function(filename)
    local stat = vim.loop.fs_stat(filename)
    return stat ~= nil
end

M.path_join = function(...)
    return table.concat(vim.tbl_flatten({ ... }), "/"):gsub("/" .. "+", "/")
end

M.root_pattern = function(...)
    local patterns = vim.tbl_flatten({ ... })

    local function matcher(path)
        if not path then
            return nil
        end

        -- escape wildcard characters in the path so that it is not treated like a glob
        path = path:gsub("([%[%]%?%*])", "\\%1")
        for _, pattern in ipairs(patterns) do
            ---@diagnostic disable-next-line: param-type-mismatch
            for _, p in ipairs(vim.fn.glob(M.path_join(path, pattern), true, true)) do
                if M.path_exists(p) then
                    return path
                end
            end
        end

        return nil
    end

    return function(start_path)
        local start_match = matcher(start_path)
        if start_match then
            return start_match
        end

        for path in vim.fs.parents(start_path) do
            local match = matcher(path)
            if match then
                return match
            end
        end
    end
end

M.find_in_node_modules = function(dir, name)
    local exe = dir .. "/node_modules/.bin/" .. name
    if M.path_exists(exe) then
        return exe
    end

    exe = dir .. "/../../node_modules/.bin/" .. name
    if M.path_exists(exe) then
        return exe
    end
    return nil
end

return M
