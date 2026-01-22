-- Snippet for error handling
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.keymap.set("n", "<leader>er", function()
      vim.api.nvim_put({
        "  if err != nil {",
        "    return",
        "  }",
      }, "l", true, true)
    end, { desc = "Insert Go error check", buffer = true })
  end,
})
