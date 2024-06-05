function SaveAsUser(user)
  local filepath = vim.fn.expand('%')
  vim.api.nvim_command('set noautoread')
  vim.fn.system('sudo -u ' .. user .. ' tee > /dev/null ' .. filepath, vim.fn.join(vim.api.nvim_buf_get_lines(0, 0, -1, false), "\n"))
  vim.api.nvim_command('edit!')
  vim.api.nvim_command('set autoread')
end
vim.api.nvim_create_user_command(
    "SaveAs",
    function(opts)
        SaveAsUser(opts.args)
    end,
    {
        nargs = 1,
        desc = "Save the current file as a specified user"
    }
)
