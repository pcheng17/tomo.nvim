local M = {}

M.opts = {}

--- Put the `char` string at the end of the line. If present, remove it.
--- Thanks to https://github.com/mrs4ndman/random.nvim
---@param chars string
function M.put_at_end(chars)
    local pos = vim.api.nvim_win_get_cursor(0)
    local row = pos[1] - 1
    local current_line = vim.api.nvim_get_current_line()
    local col = #current_line
    local entry_length = string.len(chars)
    local cline = vim.fn.getline(".")
    local endchar = vim.fn.getline("."):sub(cline:len() - (entry_length - 1))
    if endchar == chars then
        vim.api.nvim_set_current_line(cline:sub(1, cline:len() - entry_length))
    else
        vim.api.nvim_buf_set_text(0, row, col, row, col, { chars })
    end
end

function M.setup(opts)
      M.opts = vim.tbl_deep_extend('force', M.opts, opts or {})
end

return M
