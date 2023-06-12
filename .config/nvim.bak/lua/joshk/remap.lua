vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Navigation and Movement

-- Move selected lines down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Move selected lines up in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Join current line with the line below and remove the newline
vim.keymap.set("n", "J", "mzJ`z")

-- Scroll half-page down and center the cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Scroll half-page up and center the cursor
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Move to the next search result and center the cursor
vim.keymap.set("n", "n", "nzzzv")

-- Move to the previous search result and center the cursor
vim.keymap.set("n", "N", "Nzzzv")

-- Reload the current file
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)


-- Editing and Manipulation

-- Execute the Ex command
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Cut selected text in visual mode and paste above
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Yank selected text to the system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- Yank from current line to the end to the system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete selected text without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Perform a search and replace in the whole file with confirmation
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])


-- Plugins and Integrations

-- Start Vim With Me collaboration session
vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)

-- Stop Vim With Me collaboration session
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- Format the current buffer using LSP
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Add execute permission to the current file
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })


-- Miscellaneous

-- Escape to normal mode from insert mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- No operation
vim.keymap.set("n", "Q", "<nop>")

-- Open a new Tmux window with "tmux-sessionizer" command
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Edit the Packer configuration file
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/lua/joshk/packer.lua<CR>")
