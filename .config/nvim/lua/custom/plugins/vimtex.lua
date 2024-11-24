return {
  'lervag/vimtex',
  init = function()
    vim.g.vimtex_view_method = 'skim' -- Set PDF viewer
    vim.g.vimtex_fold_enabled = true -- Enable VimTeX folding
  end,
  config = function()
    -- Configure folding settings explicitly
    vim.cmd [[
      set foldmethod=expr
      set foldexpr=vimtex#fold#level(v:lnum)
      set foldtext=vimtex#fold#text()
      set fillchars=fold:\ 
    ]]
  end,
}
