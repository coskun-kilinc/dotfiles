local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    print("null-ls failed")
    return
end
print("null-ls loaded")

null_ls.setup({
    debug = false,
    on_attach = function(client, bufnr)
        if vim.bo.filetype == "python" then
            print("setup async autoformat for python")
            require("lsp-zero").async_autoformat(client, bufnr)
        end
    end,
    sources = {
        null_ls.builtins.formatting.black.with({ extra_args = { "--fast" } }),
        null_ls.builtins.diagnostics.flake8,
    },
})
