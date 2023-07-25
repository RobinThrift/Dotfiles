return {
    {
        "mfussenegger/nvim-lint",

        enabled = true,
        lazy = false,

        config = function()
            local utils = require("_utils")

            require("lint").linters.protolint = {
                cmd = "protolint",
                stdin = false,
                append_fname = true,
                args = { "--reporter", "json" },
                stream = "stderr",
                ignore_exitcode = true,
                parser = function(output)
                    local diagnostics = {}

                    local json_index, _ = output:find("{")

                    -- if no json included, something went wrong and nothing to parse
                    if not json_index then
                        table.insert(diagnostics, {
                            message = output,
                            lnum = 0,
                            col = 0,
                            severity = vim.diagnostic.severity.ERROR,
                        })

                        return diagnostics
                    end

                    local maybe_json_string = output:sub(json_index)

                    local ok, decoded = pcall(vim.json.decode, maybe_json_string)

                    -- decoding broke, so give up and return the original output
                    if not ok then
                        table.insert(diagnostics, {
                            message = output,
                            lnum = 0,
                            col = 0,
                            severity = vim.diagnostic.severity.ERROR,
                        })

                        return diagnostics
                    end

                    if type(decoded.lints) ~= "table" then
                        return diagnostics
                    end

                    for _, finding in pairs(decoded.lints or {}) do
                        table.insert(diagnostics, {
                            lnum = finding.line - 1,
                            col = finding.column,
                            end_lnum = finding.line - 1,
                            end_col = finding.column,
                            severity = vim.diagnostic.severity.WARN,
                            message = finding.message,
                        })
                    end

                    return diagnostics
                end,
            }

            require("lint").linters.denolint = {
                cmd = function()
                    local root_dir = utils.root_pattern("deno.json")(vim.api.nvim_buf_get_name(0))
                    if not root_dir then
                        return ""
                    end

                    return "deno"
                end,
                stdin = false,
                append_fname = true,
                args = { "lint", "--json" },
                stream = "stdout",
                ignore_exitcode = true,
                parser = function(output)
                    local diagnostics = {}

                    local json_index, _ = output:find("{")

                    -- if no json included, something went wrong and nothing to parse
                    if not json_index then
                        table.insert(diagnostics, {
                            message = output,
                            lnum = 0,
                            col = 0,
                            severity = vim.diagnostic.severity.ERROR,
                        })

                        return diagnostics
                    end

                    local maybe_json_string = output:sub(json_index)

                    local ok, decoded = pcall(vim.json.decode, maybe_json_string)

                    -- decoding broke, so give up and return the original output
                    if not ok then
                        table.insert(diagnostics, {
                            message = output,
                            lnum = 0,
                            col = 0,
                            severity = vim.diagnostic.severity.ERROR,
                        })

                        return diagnostics
                    end

                    if type(decoded.lints) ~= "table" then
                        return diagnostics
                    end

                    for _, err in ipairs(decoded.errors or {}) do
                        table.insert(diagnostics, {
                            lnum = 0,
                            col = 1,
                            end_lnum = 0,
                            end_col = 1,
                            severity = vim.diagnostic.severity.ERROR,
                            message = err.message,
                        })
                    end

                    for _, diag in ipairs(decoded.diagnostics or {}) do
                        local message = diag.message
                        if type(diag.hint) == "string" then
                            message = message .. "\n" .. diag.hint
                        end

                        table.insert(diagnostics, {
                            lnum = diag.range.start.line,
                            col = diag.range.start.col + 1,
                            end_lnum = diag.range["end"].line,
                            end_col = diag.range["end"].col + 1,
                            severity = diag.diagnostic.severity.WARN,
                            code = diag.code,
                            message = message,
                        })
                    end

                    return diagnostics
                end,
            }

            local eslint = require("lint").linters.eslint
            eslint.cmd = function()
                local local_eslint = vim.fn.fnamemodify("./node_modules/.bin/eslint", ":p")
                local stat = vim.loop.fs_stat(local_eslint)
                if stat then
                    return local_eslint
                end

                -- common setup for for workspaces
                local_eslint = vim.fn.fnamemodify("../../node_modules/.bin/eslint", ":p")
                stat = vim.loop.fs_stat(local_eslint)
                if stat then
                    return local_eslint
                end

                return "eslint"
            end

            require("lint").linters_by_ft = {
                go = { "golangcilint" },
                javascripreact = { "eslint" },
                javascript = { "eslint" },
                typescript = { "eslint", "denolint" },
                typescriptreact = { "eslint", "denolint" },
                json = { "eslint", "jsonlint" },
                python = { "pylint", "mypy", "pydocstyle" },
                yaml = { "actionlint" },
                Dockerfile = { "hadolint" },
                proto = { "protolint" },
            }

            vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                callback = function()
                    require("lint").try_lint(nil, { ignore_errors = true })
                end,
            })

            vim.api.nvim_create_autocmd({ "BufEnter" }, {
                callback = function()
                    require("lint").try_lint(nil, { ignore_errors = true })
                end,
            })
        end,

        ft = {
            "go",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "json",
            "python",
            "proto",
        },
    },
}
