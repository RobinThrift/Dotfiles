return {
    {
        "mfussenegger/nvim-lint",

        enabled = true,
        lazy = false,

        config = function()
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
                typescript = { "eslint" },
                javascript = { "eslint" },
                typescriptreact = { "eslint" },
                javascripreact = { "eslint" },
                json = { "eslint", "jsonlint" },
                python = { "pylint", "mypy", "pydocstyle" },
                yaml = { "actionlint" },
                Dockerfile = { "hadolint" },
                proto = { "protolint" },
            }

            vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                callback = function()
                    require("lint").try_lint()
                end,
            })

            vim.api.nvim_create_autocmd({ "BufEnter" }, {
                callback = function()
                    require("lint").try_lint()
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
