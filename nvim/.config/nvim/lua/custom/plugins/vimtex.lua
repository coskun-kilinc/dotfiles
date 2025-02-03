return {
  'lervag/vimtex',
  init = function()
    vim.g.vimtex_view_method = 'skim' -- Set PDF viewer
    vim.g.vimtex_fold_enabled = true -- Enable VimTeX folding
    vim.g.vimtex_toc_config = {
      fold_enable = 1,
      fold_level_start = -1,
      hide_line_numbers = 1,
      indent_levels = 1,
      layer_status = {
        content = 1,
        label = 0,
        todo = 1,
        include = 0,
      },
      mode = 1,
      name = 'ToC',
      refresh_always = 1,
      show_help = 0,
      show_numbers = 1,
      split_pos = 'vert rightbelow',
      split_width = 40,
      todo_sorted = 0,
    }
  end,

  config = function()
    -- Configure folding settings explicitly
    vim.cmd [[
      set foldmethod=expr
      set foldexpr=vimtex#fold#level(v:lnum)
      set foldtext=vimtex#fold#text()
      set fillchars=fold:\·
    ]]

    vim.api.nvim_create_augroup('VimTeX', { clear = true })
    vim.api.nvim_create_autocmd('BufWritePost', {
      pattern = '*.tex',
      command = 'call vimtex#toc#refresh()',
      group = 'VimTeX',
    })
  end,
}
