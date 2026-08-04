return {
    "lukas-reineke/virt-column.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        -- Silence the deprecation warning caused by the plugin's old
        -- `vim.validate{<table>}` usage until upstream is updated.
        local deprecate = vim.deprecate
        vim.deprecate = function() end
        local ok, err = pcall(require("virt-column").setup, {})
        vim.deprecate = deprecate
        if not ok then
            error(err)
        end
    end,
}
