return {
  'mrcjkb/haskell-tools.nvim',
  -- To avoid being surprised by breaking changes,
  -- I recommend you set a version range
  version = '^10',
  -- This plugin implements proper lazy-loading (see :h lua-plugin-lazy).
  -- No need for lazy.nvim to lazy-load it.
  lazy = false,
  init = function()
    vim.g.haskell_tools = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      return {
        hls = {
          capabilities = capabilities,
        },
      }
    end
  end,
}
