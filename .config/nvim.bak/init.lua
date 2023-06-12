require("joshk")

if vim.g.vscode then
    -- VSCode extension
else
    -- ordinary Neovim
    -- Highlight on yank
    vim.cmd [[
      augroup YankHighlight
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank()
      augroup end
    ]]
end
